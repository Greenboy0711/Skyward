local TweenService = game:GetService("TweenService")
local barMeters = {}

local sizeTI = TweenInfo.new(0.5, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut)

function barMeters.resize(bar, percent)
    percent = math.min(math.max(percent, 0), 1)
    local newSize
    if bar.Size.Y.Scale == 1 then
        newSize = UDim2.fromScale(percent, 1)
    elseif bar.Size.X.Scale == 1 then
        newSize = UDim2.fromScale(1, percent)
    end

    TweenService:Create(bar, sizeTI, {Size = newSize}):Play()
end

return barMeters