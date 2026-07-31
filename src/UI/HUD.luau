local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local RunService = game:GetService("RunService")
local HUD = {}

local player = Players.LocalPlayer
local MAX_HEIGHT = 100000

local screenUi = player.PlayerGui:WaitForChild(script.Name)
local heightMeter = screenUi:WaitForChild("HeightMeter")

local function addPlayerToHeightMeter(curPlayer)
    local frame = ReplicatedStorage.Templates.PlayerHeightFrame:Clone()
    frame.Name = curPlayer.Name
    frame.ProfilePic.Image = "rbxthumb://type=AvatarHeadShot&id="..curPlayer.UserId.."&w=150&h=150"
    frame.Parent = heightMeter
end

function HUD.init()
    for _, curPlayer in pairs(Players:GetPlayers()) do
        addPlayerToHeightMeter(curPlayer)
    end

    Players.PlayerAdded:Connect(function(curPlayer)
        addPlayerToHeightMeter(curPlayer)
    end)
end

RunService.RenderStepped:Connect(function()
    for _, frame in pairs(heightMeter:GetChildren()) do
        if not frame:IsA("Frame") then continue end
        local curPlayer = Players[frame.Name]
        if not curPlayer then frame:Destroy() end

        local char = curPlayer.Character
        if not char then return end

        if curPlayer:GetAttribute("InFloat") then
            frame.Position = UDim2.fromScale(1, math.max(0, (MAX_HEIGHT - char.PrimaryPart.Position.Y) / MAX_HEIGHT))
        else
            frame.Position = UDim2.fromScale(1, 1)
        end
    end
end)

type HUD = typeof(HUD) & {

}

return HUD