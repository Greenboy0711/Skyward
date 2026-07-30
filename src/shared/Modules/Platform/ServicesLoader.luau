local ReplicatedStorage = game:GetService("ReplicatedStorage")
local ServicesLoader = {}

local PriorityServicesServer = require(script.Parent.PriorityServicesServer)
local PriorityServicesClient = require(script.Parent.PriorityServicesClient)
local Promise = require(ReplicatedStorage.Packages.Promise)

local function initService(services, module)
    if module.init then
        Promise.try(function()
            module:init()
        end)
    end
    table.insert(services, module)
end

function ServicesLoader.getServices(servicesFolder: Folder, isServer: boolean)
    local services = {}
    local endTag = isServer and "Server" or "Client"
    local PriorityServices = isServer and PriorityServicesServer or PriorityServicesClient

    for _, serviceName in pairs(PriorityServices) do
        local module = require(servicesFolder:WaitForChild(serviceName):WaitForChild(serviceName..endTag))
        initService(services, module)
    end

    for _, serviceModule in pairs(servicesFolder:GetChildren()) do
        if table.find(PriorityServices, serviceModule.Name) then continue end
        local module = require(serviceModule:WaitForChild(serviceModule.Name..endTag))
        initService(services, module)
    end

    return services
end

function ServicesLoader.runMethod(services, methodName, ...)
    local args = {...}
    for _, service in pairs(services) do
        if service[methodName] then
            Promise.try(function()
                service[methodName](args)
            end)
        end
    end
end

return ServicesLoader