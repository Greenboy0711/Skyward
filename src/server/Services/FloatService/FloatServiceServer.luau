local ReplicatedStorage = game:GetService("ReplicatedStorage")
local ServerScriptService = game:GetService("ServerScriptService")
local ServerStorage = game:GetService("ServerStorage")
local Promise = require(ReplicatedStorage.Packages.Promise)
local BlinkMain = require(ServerScriptService.Server.BlinkServer.BlinkMain)
local PlrData = require(ReplicatedStorage.Shared.Modules.Data.PlrData).server
local ZonePlus = require(ReplicatedStorage.Packages.ZonePlus)
local ConvertPosY = require(ReplicatedStorage.Shared.Modules.Math.ConvertPosY)
local FloatMath = require(ReplicatedStorage.Shared.Modules.Math.FloatMath)
local FloatServiceServer = {}

local floatObjs = workspace:WaitForChild("FloatObjs")

local floatData = {}

local GROUND_Y = 5
local Y_SPEED = 25
local MOVE_SPEED = 20
local GRAV_ACC = -30
local BREATH_ACC = -Y_SPEED * 2

local function resetPlrFloatData(player, char)
    player:SetAttribute("InFloat", false)
    player:SetAttribute("InDescent", false)

    player:SetAttribute("MystQuant", 0)
    player:SetAttribute("MystQuality", 1)
    
    char.Bubble:Destroy()
    char.PrimaryPart.AlignOrientation.Enabled = false
    char.Humanoid.PlatformStand = false

    Promise.try(function()
        player:SetAttribute("CanFloat", false)
        task.wait(1)
        player:SetAttribute("CanFloat", true)
    end)
end

local function calcVelocity(player, char, data, dt)
    local velocity = Vector3.new(0, data.PrevVelocity.Y, 0)

    -- Map border
    local r = (ConvertPosY(char.PrimaryPart.Position) - Vector3.new(0, 0, 0)).Magnitude
    if r > FloatMath.MAP_RADIUS then
        local percentForce = (r - FloatMath.MAP_RADIUS) / (FloatMath.MAX_RADIUS - FloatMath.MAP_RADIUS)
        local inwardDir = -Vector3.new(char.PrimaryPart.Position.X, 0, char.PrimaryPart.Position.Z).Unit
        velocity += (inwardDir * FloatMath.MAX_BORDER_PUSH * percentForce * percentForce)
    end

    -- Breath hold
    if not player:GetAttribute("InDescent") and player:GetAttribute("IsHoldingBreath") and data.TotalTime - data.LastBreathLoss >= FloatMath.BREATH_HOLD_INTER
            and player:GetAttribute("BreathQuant") > 0 then
        data.LastBreathLoss = data.TotalTime
        player:SetAttribute("BreathQuant", math.max(player:GetAttribute("BreathQuant") - 1, 0))

        -- Maintain normal ascent
        velocity = Vector3.new(velocity.X, math.clamp(velocity.Y + dt * BREATH_ACC, -Y_SPEED / 2, Y_SPEED), velocity.Z)
    elseif (not player:GetAttribute("InDescent") and not player:GetAttribute("IsHoldingBreath")) or player:GetAttribute("BreathQuant") == 0 then
        velocity = Vector3.new(velocity.X, math.clamp(velocity.Y + dt * -BREATH_ACC, -Y_SPEED / 2, Y_SPEED), velocity.Z)
    end

    if player:GetAttribute("InDescent") then -- Gravity descent
        if data.PrevVelocity.Y > 0 then data.PrevVelocity = Vector3.new(data.PrevVelocity.X, 0, data.PrevVelocity.Z) end
        velocity += Vector3.new(0, dt * GRAV_ACC, 0)

        if FloatMath.calcHeight(char.PrimaryPart.Position.Y) <= GROUND_Y then -- End of descent
            resetPlrFloatData(player, char)
        end

    end

    if char.Humanoid.MoveDirection ~= Vector3.new(0, 0, 0) then -- Player X/Z controls
        velocity += Vector3.new(char.Humanoid.MoveDirection.x * MOVE_SPEED, 0, char.Humanoid.MoveDirection.z * MOVE_SPEED)
    end

    return velocity
end

function FloatServiceServer.init()
    local floatZone = ZonePlus.new(floatObjs:WaitForChild("FloatZone"))

    floatZone.playerEntered:Connect(function(player) -- Player enters float
        if player:GetAttribute("InFloat") or not player:GetAttribute("CanFloat") then return end
        local char = player.Character
        if not char then return end

        char:PivotTo(CFrame.new(char.PrimaryPart.Position) * CFrame.Angles(0, 0, 0))
        char.PrimaryPart.AlignOrientation.Enabled = true

        floatData[player] = {
            PopLimit = FloatMath.calcPopLimit(PlrData[player].Upgrades["Bubble Resistance"]()), 
            PrevVelocity = Vector3.new(0, Y_SPEED, 0),
            TotalTime = os.clock(),
            LastMystColl = os.clock(),
            LastBreathLoss = os.clock()
        }

        player:SetAttribute("BreathQuant", player:GetAttribute("BreathCap"))
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
        if FloatMath.calcHeight(char.PrimaryPart.Position.Y) < FloatMath.POP_THRES then return false end
        player:SetAttribute("InDescent", true)

        return true
    end)

    BlinkMain.Float.ToggleMystColl.On(function(player)
        player:SetAttribute("IsCollMyst", not player:GetAttribute("IsCollMyst"))
    end)

    BlinkMain.Float.ToggleBreathHold.On(function(player)
        player:SetAttribute("IsHoldingBreath", not player:GetAttribute("IsHoldingBreath"))
    end)
end

function FloatServiceServer.Heartbeat(args) -- Manage floating players
    local dt = args[1]

    for player, data in pairs(floatData) do
        if not player or not player:GetAttribute("InFloat") then floatData[player] = nil; continue end
        local char = player.Character
        if not char then continue end
        if not char:FindFirstChild("Bubble") then continue end
        data.TotalTime += dt


        local success, velocity = pcall(calcVelocity, player, char, data, dt) -- Set movement
        if success and velocity ~= nil then
            char.Bubble.LinearVelocity.VectorVelocity = velocity
            data.PrevVelocity = velocity
        end

        if FloatMath.calcHeight(char.PrimaryPart.Position.Y) >= data.PopLimit then -- Bubble reached limit
            resetPlrFloatData(player, char)
            player:SetAttribute("InDescent", true)
            char.Bubble.Transparency = 1
            char.Bubble.CanCollide = false
        end

        -- Myst collection
        if not player:GetAttribute("InDescent") and player:GetAttribute("IsCollMyst") and data.TotalTime - data.LastMystColl >= FloatMath.MYST_COLL_INTER
                and player:GetAttribute("MystQuant") < player:GetAttribute("MystCap") then
            data.LastMystColl = data.TotalTime
            player:SetAttribute("MystQuant", math.min(player:GetAttribute("MystQuant") + 1, player:GetAttribute("MystCap")))
        end

    end
end

type FloatServiceServer = typeof(FloatServiceServer) & {

}

return FloatServiceServer