-- local vignetteTI = TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut)

-- function module.vignetteEffect(player, color, duration, transparency, toggle)
-- 	if toggle == false and type(duration) == "string" then -- Check if vignette exists, destroy then
-- 		local vignette = player.PlayerGui.EffectsScreen:FindFirstChild(duration)
-- 		if vignette then
-- 			tweenService:Create(vignette, vignetteTI, {ImageTransparency = 1}):Play()
-- 			task.wait(0.2)
-- 			if not vignette then return end
-- 			vignette:Destroy()
-- 		end
-- 		return
-- 	elseif toggle == true and type(duration) == "string" then
-- 		if player.PlayerGui.EffectsScreen:FindFirstChild(duration) then return end
-- 	end
	
-- 	local vignette = game:GetService("ReplicatedStorage").Templates.Vignette:Clone() -- Create vignette
	
-- 	if color and typeof(color) ~= "Color3" then -- UI Gradient
-- 		local gradient = Instance.new("UIGradient")
-- 		for i, v in pairs(color) do gradient[i] = v end
-- 		gradient.Parent = vignette
-- 	else
-- 		vignette.ImageColor3 = color or Color3.fromRGB(0, 0, 0)
-- 	end
-- 	vignette.Parent = player.PlayerGui.EffectsScreen

-- 	tweenService:Create(vignette, vignetteTI, {ImageTransparency = transparency or 0.7}):Play()
	
-- 	if type(duration) == "string" and toggle == true then -- Keep effect, name it, and destroy when called
-- 		vignette.Name = duration
-- 	elseif type(duration) == "number" then -- Effects has time limit
-- 		coroutine.wrap(function()	
-- 			task.wait(math.max(0, duration - 0.2))
-- 			if not vignette then return end
-- 			tweenService:Create(vignette, vignetteTI, {ImageTransparency = 1}):Play()
-- 			task.wait(0.2)
-- 			if not vignette then return end
-- 			vignette:Destroy()
-- 		end)()
-- 	end

-- end