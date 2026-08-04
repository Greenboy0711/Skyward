local TweenService = game:GetService("TweenService")
local player = game:GetService("Players").LocalPlayer

local topBar = player.PlayerGui:WaitForChild("BlackBars"):WaitForChild("TopBar")
local bottomBar = player.PlayerGui:WaitForChild("BlackBars"):WaitForChild("BottomBar")

local blackBarTI = TweenInfo.new(1, Enum.EasingStyle.Linear)

return function(toggle)
    if toggle then
        TweenService:Create(topBar, blackBarTI, {Size = UDim2.fromScale(1, 0.125)}):Play()
        TweenService:Create(bottomBar, blackBarTI, {Size = UDim2.fromScale(1, 0.125)}):Play()
    else
        TweenService:Create(topBar, blackBarTI, {Size = UDim2.fromScale(1, 0)}):Play()
        TweenService:Create(bottomBar, blackBarTI, {Size = UDim2.fromScale(1, 0)}):Play()
    end
end
