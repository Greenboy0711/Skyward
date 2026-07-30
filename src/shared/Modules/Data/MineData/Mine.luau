local ReplicatedStorage = game:GetService("ReplicatedStorage")
local TweenService = game:GetService("TweenService")
local GetShade = require(ReplicatedStorage.Shared.Modules.Math.GetShade)
local effect = {}

local TI = TweenInfo.new(1, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut, -1, true)

function effect.Effects(model)
    for _, secon in pairs(model:GetChildren()) do
        if secon.Name ~= "Secon" then continue end
        TweenService:Create(secon, TI, {Color = GetShade(secon.Color, 150)}):Play()
    end
end

return effect