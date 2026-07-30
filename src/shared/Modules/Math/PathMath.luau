local ReplicatedStorage = game:GetService("ReplicatedStorage")
local MineData = require(ReplicatedStorage.Shared.Modules.Data.MineData)
local maths = {}

local platform = workspace:WaitForChild("GameElements"):WaitForChild("Platform")

maths.PLATFORM_Y = 0
maths.PATH_BEAM_Y = 2

maths.ARROW_SPEED = 25
maths.ARROW_COOLDOWN = 1

maths.CHAR_SPEED = 16
maths.PATH_SPEED = 25
maths.POWER_MULT = 4

maths.MINE_DELAY = 1.5
maths.MIN_MINE_DIST = 2

maths.RADIUS_INC = 1.4
function maths.calcMaxDis(power)
    return power * maths.POWER_MULT + 4
end

function maths.calcPathEnd(part, power, angle)
    if angle then
        local lookVector = (CFrame.new(part.Position) * CFrame.Angles(0, angle, 0)).LookVector
        return CFrame.new(part.Position + lookVector * maths.calcMaxDis(power)) * CFrame.Angles(0, angle, 0)
    else
        return CFrame.new(part.Position + part.CFrame.LookVector * maths.calcMaxDis(power)) * part.CFrame.Rotation
    end
end

function maths.calcPathBeamPos(charCopy, power)
    local cFrame = maths.calcPathEnd(charCopy.PrimaryPart, power)
    return cFrame * CFrame.new(0, maths.PATH_BEAM_Y - cFrame.Y, 0)
end

function maths.calcPathShowTime(startPos, endPos)
    return (startPos - endPos).Magnitude / maths.PATH_SPEED
end

function maths.calcCharPathTime(startPos, endPos)
    return (startPos - endPos).Magnitude / maths.CHAR_SPEED
end

function maths.getMinePos(hitboxSize, charCopy, power)
    return CFrame.new(charCopy.PrimaryPart.Position.X, maths.PLATFORM_Y + hitboxSize.Y/2, charCopy.PrimaryPart.Position.Z) * charCopy.PrimaryPart.CFrame.Rotation * CFrame.new(0, 0, -(maths.MIN_MINE_DIST + hitboxSize.X/2 + maths.calcMaxDis(power)))
end

function maths.checkWithinPlatform(pos)
    return (pos.X >= platform.Position.X - platform.Size.X/2) and (pos.X <= platform.Position.X + platform.Size.X/2) and
        (pos.Z >= platform.Position.Z - platform.Size.Z/2) and (pos.Z <= platform.Position.Z + platform.Size.Z/2)
end

function maths.calcScale(roundVal)
    return math.max(1 + 0.25 * (roundVal - 1), 1)
end

function maths.calcRadius(roundVal, mineType)
    return MineData.Data[mineType].Radius * maths.calcScale(roundVal)
end

return maths