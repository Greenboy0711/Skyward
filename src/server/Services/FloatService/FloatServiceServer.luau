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

local GROUND_Y = 6
local Y_SPEED = 1000
local MOVE_SPEED = 10
local GRAV_ACC = -30

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
            PrevVelocity = Vector3.new(0, Y_SPEED, 0)}

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

    BlinkMain.Float.AttemptDescend.On(function(player)
        if not player:GetAttribute("InFloat") or player:GetAttribute("InDescent") then return false end
        local char = player.Character
        if not char then return end
        player:SetAttribute("InDescent", true)

        return true
    end)
end

function FloatServiceServer.Heartbeat(args) -- Manage floating players
    local dt = args[1]

    for player, data in pairs(floatData) do
        if not player or not player:GetAttribute("InFloat") then floatData[player] = nil; continue end
        local char = player.Character
        if not char then continue end

        pcall(function() -- Set movement
            local currentVelocity
            if player:GetAttribute("InDescent") then
                if floatData[player].PrevVelocity.Y > 0 then floatData[player].PrevVelocity = Vector3.new(floatData[player].PrevVelocity.X, 0, floatData[player].PrevVelocity.Z) end
                currentVelocity =  Vector3.new(0, floatData[player].PrevVelocity.Y + dt * GRAV_ACC, 0)

                if char.PrimaryPart.Position.Y <= GROUND_Y then -- End of descent
                    player:SetAttribute("InFloat", false)
                    player:SetAttribute("InDescent", false)
                end
            else
                currentVelocity = Vector3.new(0, Y_SPEED, 0)
            end
            if char.Humanoid.MoveDirection == Vector3.new(0, 0, 0) then
                currentVelocity = Vector3.new(0, currentVelocity.Y, 0)
            else
                currentVelocity = Vector3.new(char.Humanoid.MoveDirection.x * MOVE_SPEED, currentVelocity.Y, char.Humanoid.MoveDirection.z * MOVE_SPEED)
            end

            char.Bubble.LinearVelocity.VectorVelocity = currentVelocity
            floatData[player].PrevVelocity = currentVelocity
        end)

        if math.round(char.PrimaryPart.Position.Y) >= data.PopLimit then -- Bubble reached limit
            player:SetAttribute("InDescent", true)
            char.Bubble.Transparency = 1
            char.Bubble.CanCollide = false
        end

    end
end

type FloatServiceServer = typeof(FloatServiceServer) & {

}

return FloatServiceServer