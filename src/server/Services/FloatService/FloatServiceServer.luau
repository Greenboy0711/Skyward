local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local ServerScriptService = game:GetService("ServerScriptService")
local ServerStorage = game:GetService("ServerStorage")
local BlinkMain = require(ServerScriptService.Server.BlinkServer.BlinkMain)
local PlrData = require(ServerScriptService.Server.Modules.Data.PlrData).server
local ZonePlus = require(ReplicatedStorage.Packages.ZonePlus)
local GaussianRand = require(ReplicatedStorage.Shared.Modules.Math.GaussianRand)
local FloatServiceServer = {}

local floatObjs = workspace:WaitForChild("FloatObjs")

local floatData = {}

local Y_SPEED = 10
local MOVE_SPEED = 10

function FloatServiceServer.init()
    local floatZone = ZonePlus.new(floatObjs:WaitForChild("FloatZone"))

    floatZone.playerEntered:Connect(function(player) -- Player enters float
        if player:GetAttribute("InFloat") then return end
        local char = player.Character
        if not char then return end

        char:PivotTo(CFrame.new(char.PrimaryPart.Position) * CFrame.Angles(0, 0, 0))
        char.PrimaryPart.AlignOrientation.Enabled = true

        floatData[player] = {
            PopLimit = math.round(GaussianRand(PlrData[player].Upgrades["Bubble Resistance"]() * 300, 100)), 
            CurrVelocity = Vector3.new(0, Y_SPEED, 0)}

        player:SetAttribute("InFloat", true)
        char.Humanoid.PlatformStand = true

        local bubble = ServerStorage.Templates.Bubble:Clone()
        bubble:PivotTo(char.HumanoidRootPart.CFrame)
        bubble.MainWeld.Part1 = char.HumanoidRootPart
        bubble.Parent = char
    end)

    BlinkMain.Float.CameraAng.On(function(player, cameraAng)
        if not player:GetAttribute("InFloat") then return end
        local char = player.Character
        if not char then return end
        char.PrimaryPart.AlignOrientation.CFrame = CFrame.new(char.PrimaryPart.Position) * CFrame.Angles(cameraAng.X, -cameraAng.Y, cameraAng.Z)
    end)
end

function FloatServiceServer.Heartbeat() -- Manage floating players
    for player, data in pairs(floatData) do
        if not player or not player:GetAttribute("InFloat") then floatData[player] = nil; continue end
        local char = player.Character
        if not char then continue end

        pcall(function() -- Set movement
            local currentVelocity = Vector3.new(char.Humanoid.MoveDirection.x * MOVE_SPEED, Y_SPEED, char.Humanoid.MoveDirection.z * MOVE_SPEED)
            if char.Humanoid.MoveDirection == Vector3.new(0, 0, 0) then
                currentVelocity = Vector3.new(0, Y_SPEED, 0)
            end

            char.Bubble.LinearVelocity.VectorVelocity = currentVelocity
            floatData[player].CurrVelocity = currentVelocity
        end)

        if math.round(char.PrimaryPart.Position.Y) >= data.PopLimit then -- Bubble reached limit
            print("AAAA")
        end

    end
end

type FloatServiceServer = typeof(FloatServiceServer) & {

}

return FloatServiceServer