local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local RunService = game:GetService("RunService")

local ServicesLoader = require(ReplicatedStorage.Shared.Modules.Platform.ServicesLoader)
local UI = require(ReplicatedStorage.UI)
local serviceFolder = ReplicatedStorage.Shared.Services

local services = ServicesLoader.getServices(serviceFolder, false)
local player = game:GetService("Players").LocalPlayer
UI.init(player)

Players.PlayerAdded:Connect(function(otherPlayer: Player)
    ServicesLoader.runMethod(services, "PlayerAdded", otherPlayer)

    otherPlayer.CharacterAdded:Connect(function(character: Model)
        ServicesLoader.runMethod(services, "CharacterAdded", character)
    end)
	
end)

RunService.Heartbeat:Connect(function(dt)
    ServicesLoader.runMethod(services, "Heartbeat", dt)
end)

RunService.RenderStepped:Connect(function(dt)
    ServicesLoader.runMethod(services, "RenderStepped", dt)
end)