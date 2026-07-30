local ReplicatedStorage = game:GetService("ReplicatedStorage")
local RunService = game:GetService("RunService")
local Charm = require(ReplicatedStorage.Packages.Charm)
local Promise = require(ReplicatedStorage.Packages.Promise)
local MonetizationData = require(ReplicatedStorage.Shared.Modules.Data.MonetizationData)
local DayTimer = {}

local ARB_WEEK_START = 2147299200 -- Last valid sunday

local hourOffset = 5 -- UTC to CST
local offset = (60 * 60 * hourOffset)

DayTimer.BoardValues = {"Wins", "Bloxes", "BoomBux"}

local function getDay()
    return math.floor((os.time() - offset) / (60 * 60 * 24))
end

local function getWeek()
    return math.floor((os.time() - offset) / (60 * 60 * 24 * 7))
end

DayTimer.Day = Charm.atom(getDay())
DayTimer.Week = Charm.atom(getWeek())

function DayTimer.toMS(s)
	return string.format("%02i:%02i", s/60, s%60)
end

function DayTimer.toHMS(s)
	return string.format("%02i:%02i:%02i", s/60^2, s/60%60, s%60)
end

function DayTimer.toDHMS(s)
	return string.format("%02d:%02d:%02d:%02d", s/86400%7, s/3600%24, s/60%60, s%60)
end

function DayTimer.getSecPassed(time) -- time is in seconds
    return os.time() - time
end

function DayTimer.getTimeTillNextDay(stringFormat)
    local t = (math.floor(os.time())) - offset -- 12:00 AM CST
    local daypass = t % 86400
    local timeLeft = 86400 - daypass

    if stringFormat then
        return DayTimer.toHMS(timeLeft)
    else
        return timeLeft
    end
end

function DayTimer.getTimeTillNextWeek(stringFormat)
    if stringFormat then
        return DayTimer.toDHMS(ARB_WEEK_START - (os.time() - offset))
    else
        return ARB_WEEK_START - (os.time() - offset)
    end
end

function DayTimer.getTimeTillNextDaily(stringFormat, lastClaimTime)
    if not RunService:IsClient() then return nil end
    local timeLeft = math.max(MonetizationData.SECOND_WAIT - (os.time() - lastClaimTime), 0)

    if stringFormat then
        return DayTimer.toHMS(timeLeft)
    else
        return timeLeft
    end
end

function DayTimer.getTimeTillNextInterval(stringFormat, lastTime, interval) -- interval is in min
    if not RunService:IsClient() then return nil end
    local timeLeft = math.max(interval * 60 - (os.time() - lastTime), 0)

    if stringFormat then
        local str = DayTimer.toDHMS(timeLeft)
        if string.sub(str, 1, 2) == "00" then str = string.sub(str, 4) end -- Cut days if 0
        if string.sub(str, 1, 2) == "00" then str = string.sub(str, 4) end -- Cut hours if 0
        return str
    else
        return timeLeft
    end
end

Promise.try(function()
    while true do
        local calcDay = getDay()
        if calcDay ~= DayTimer.Day() then
            DayTimer.Day(calcDay)
        end

        local calcWeek = getWeek()
        if calcWeek ~= DayTimer.Week() then
            DayTimer.Week(calcWeek)
        end

        task.wait(1)
    end
end)

return DayTimer

