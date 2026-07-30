local CollectionService = game:GetService("CollectionService")
local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local BlinkMain = require(ReplicatedStorage.Shared.BlinkClient.BlinkMain)
local DayTimer = require(ReplicatedStorage.Shared.Modules.Platform.DayTimer)
local AnimationServiceClient = require(ReplicatedStorage.Shared.Services.AnimationService.AnimationServiceClient)

local PlrCharServiceClient = {}
local player: Player = game.Players.LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()

local preloadAnims = {}

function PlrCharServiceClient.init()
    -- Templates and instances
    player.CharacterAdded:Connect(function(char)
        character = char
    end)
    repeat task.wait() until character

    AnimationServiceClient.loadAnims(character:WaitForChild("Humanoid"):WaitForChild("Animator"), preloadAnims)
end

function PlrCharServiceClient.Heartbeat(args)
    local dt = args[1]

    -- UI shiny rays rotation
    -- for _, ray in pairs(CollectionService:GetTagged("UIRays")) do
    --     local rayScreenUi = ray:FindFirstAncestorWhichIsA("ScreenGui")
    --     if not rayScreenUi or not rayScreenUi.Enabled then continue end
    --     if ray.Name == "Wheel" and ray:GetAttribute("RotateOn") == false then continue end
    --     ray.Rotation += dt * 7
    -- end
end

type PlrCharServiceClient = typeof(PlrCharServiceClient) & {

}

return PlrCharServiceClient