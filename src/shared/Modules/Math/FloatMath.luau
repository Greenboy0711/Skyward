local GaussianRand = require(script.Parent.GaussianRand)
local floatMath = {}

floatMath.MYST_COLL_INTER = 0.05
floatMath.BREATH_HOLD_INTER = 0.1

function floatMath.calcHeight(rootPartY)
    return math.round(rootPartY / 2)
end

function floatMath.calcPopLimit(resistLvl)
    return math.round(GaussianRand(resistLvl * 300, 100))
end

floatMath.StrengthLevels = {
    {Name = "Strong"},
    {Name = "Moderate"},
    {Name = "Weak"},
}
function floatMath.calcStrengthThrs(popLimit, insightLvl)
    return {popLimit * 0.85, popLimit * 0.40}
end

function floatMath.calcMystCap(baseCap)
    return baseCap
end

function floatMath.calcBreathCap(baseCap)
    return baseCap
end

function floatMath.calcQuality()
    return 1
end

return floatMath