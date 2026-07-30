local Players = game:GetService("Players")
local ProximityPromptService = game:GetService("ProximityPromptService")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local RunService = game:GetService("RunService")
local ServerScriptService = game:GetService("ServerScriptService")

local ServicesLoader = require(ReplicatedStorage.Shared.Modules.Platform.ServicesLoader)
local serviceFolder = ServerScriptService.Server.Services

local services = ServicesLoader.getServices(serviceFolder, true)

Players.PlayerAdded:Connect(function(player: Player)
    ServicesLoader.runMethod(services, "PlayerAdded", player)

    player.CharacterAdded:Connect(function(character: Model)
        ServicesLoader.runMethod(services, "CharacterAdded", character)
        for _, v in pairs(character:GetChildren()) do
            if v:IsA("BasePart") then v.CollisionGroup = "Character" end
        end
    end)
    
end)

Players.PlayerRemoving:Connect(function(player: Player)
    ServicesLoader.runMethod(services, "PlayerRemoving", player)
end)

ProximityPromptService.PromptTriggered:Connect(function(prompt: ProximityPrompt, player: Player)
    ServicesLoader.runMethod(services, "PromptTriggered", prompt, player)
end)

RunService.Heartbeat:Connect(function(dt)
    ServicesLoader.runMethod(services, "Heartbeat", dt)
end)
