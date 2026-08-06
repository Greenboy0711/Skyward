return {
    ["RetroExplosion"] = {Id = "109113881542036", Volume = 5}, 
    ["MinePlace"] = {Id = "135323017496834", Volume = 5, Pitch = {0.95, 1.05}},
    ["SizeUp"] = {Id = "131535367752538", Volume = 2, Pitch = {0.9, 1.1}},
    ["Wind"] = {Id = "93035214379043", Volume = 1, Pitch = {0.9, 1.1}},

    ["CrateEnd"] = {Id = "4612378086", Volume = 0.3},
    ["CrateShockwave"] = {Id = "178452217", Volume = 0.3},
    ["CrateUpgrade"] = {Id = "2789427964", Volume = 0.5},
    ["CrateRare"] = {Id = "1843023345", Volume = 0.3},
    ["ShimmerLoop"] = {Id = "126580238490419", Volume = 0.75},
    ["CrateClick1"] = {Id = "9082572969", Volume = 0.75},
    ["CrateClick2"] = {Id = "9082572969", Volume = 0.75, Pitch = 1.05},
    ["CrateClick3"] = {Id = "9082572969", Volume = 0.75, Pitch = 1.1},
    ["CrateClick4"] = {Id = "9082572969", Volume = 0.75, Pitch = 1.15},
    ["SparkleTink"] = {Id = "9126073001", Volume = 0.5},

    ["SettingsSlider"] = {Id = "4499400560", Volume = 2.5},
    ["UiHover"] = {Id = "15675032796", Volume = 2.5},
    ["SmallClick"] = {Id = "421058925", Volume = 6},
    ["CloseUi"] = {Id = "8968249849", Volume = 12.5},
    ["ShortError"] = {Id = "550209561", Volume = 0.5},
    ["Success"] = {Id = "3625290171", Volume = 0.5},
}

-- collectionService:GetInstanceAddedSignal("HoverUi"):Connect(function(instance)
-- 	instance.MouseEnter:Connect(function()
-- 		tweenService:Create(instance.UIScale, TIEnter, {Scale = 1.1}):Play()
-- 		soundModule.playSound("UiHover")
-- 	end)

-- 	instance.MouseLeave:Connect(function()
-- 		tweenService:Create(instance.UIScale, TIEnter, {Scale = 1}):Play()
-- 	end)
-- end)