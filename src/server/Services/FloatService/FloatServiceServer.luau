local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local ServerScriptService = game:GetService("ServerScriptService")
local ServerStorage = game:GetService("ServerStorage")
local BlinkMain = require(ServerScriptService.Server.BlinkServer.BlinkMain)
local PlrData = require(ReplicatedStorage.Shared.Modules.Data.PlrData).server
local ZonePlus = require(ReplicatedStorage.Packages.ZonePlus)
local FloatMath = require(ReplicatedStorage.Shared.Modules.Math.FloatMath)
local FloatServiceServer = {}

local floatObjs = workspace:WaitForChild("FloatObjs")

local floatData = {}

local GROUND_Y = 5
local Y_SPEED = 25
local MOVE_SPEED = 10
local GRAV_ACC = -30

local function resetPlrFloatData(player, char)
    player:SetAttribute("InFloat", false)
    player:SetAttribute("InDescent", false)

    player:SetAttribute("MystQuant", 0)
    player:SetAttribute("MystQuality", 1)
    print("Hi")

    char.Bubble:Destroy()
    char.PrimaryPart.AlignOrientation.Enabled = false
    char.Humanoid.PlatformStand = false
end

function FloatServiceServer.init()
    local floatZone = ZonePlus.new(floatObjs:WaitForChild("FloatZone"))

    floatZone.playerEntered:Connect(function(player) -- Player enters float
        if player:GetAttribute("InFloat") then return end
        local char = player.Character
        if not char then return end

        char:PivotTo(CFrame.new(char.PrimaryPart.Position) * CFrame.Angles(0, 0, 0))
        char.PrimaryPart.AlignOrientation.Enabled = true

        floatData[player] = {
            PopLimit = FloatMath.calcPopLimit(PlrData[player].Upgrades["Bubble Resistance"]()), 
            PrevVelocity = Vector3.new(0, Y_SPEED, 0),
            TotalTime = os.clock(),
            LastMystColl = os.clock()
        }

        player:SetAttribute("InFloat", true)
        char.Humanoid.PlatformStand = true

        local bubble = ServerStorage.Templates.Bubble:Clone()
        bubble:PivotTo(char.HumanoidRootPart.CFrame)
        bubble.MainWeld.Part1 = char.HumanoidRootPart
        bubble.Parent = char

        BlinkMain.Float.PlayerEnteredFloat.FireAll(player)
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
        data.TotalTime += dt

        pcall(function() -- Set movement
            local currentVelocity
            if player:GetAttribute("InDescent") then
                if data.PrevVelocity.Y > 0 then data.PrevVelocity = Vector3.new(data.PrevVelocity.X, 0, data.PrevVelocity.Z) end
                currentVelocity =  Vector3.new(0, data.PrevVelocity.Y + dt * GRAV_ACC, 0)

                print(FloatMath.calcHeight(char.PrimaryPart.Position.Y))
                if FloatMath.calcHeight(char.PrimaryPart.Position.Y) <= GROUND_Y then -- End of descent
                    resetPlrFloatData(player, char)
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
            data.PrevVelocity = currentVelocity
        end)

        if FloatMath.calcHeight(char.PrimaryPart.Position.Y) >= data.PopLimit then -- Bubble reached limit
            resetPlrFloatData(player, char)
            player:SetAttribute("InDescent", true)
            char.Bubble.Transparency = 1
            char.Bubble.CanCollide = false
        end

        if not player:GetAttribute("InDescent") and data.TotalTime - data.LastMystColl >= FloatMath.MYST_COLL_INTER
                and player:GetAttribute("MystQuant") < player:GetAttribute("MystCap") then
            data.LastMystColl = data.TotalTime
            player:SetAttribute("MystQuant", math.min(player:GetAttribute("MystQuant") + 1, player:GetAttribute("MystCap")))
        end

    end
end

type FloatServiceServer = typeof(FloatServiceServer) & {

}

return FloatServiceServer