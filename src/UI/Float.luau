local ReplicatedStorage = game:GetService("ReplicatedStorage")
local RunService = game:GetService("RunService")
local BlinkMain = require(ReplicatedStorage.Shared.BlinkClient.BlinkMain)
local PlrData = require(ReplicatedStorage.Shared.Modules.Data.PlrData).client
local FloatMath = require(ReplicatedStorage.Shared.Modules.Math.FloatMath)
local BarMeters = require(ReplicatedStorage.Shared.Modules.UI.BarMeters)
local Float = {}

local player = game:GetService("Players").LocalPlayer

local screenUi = player.PlayerGui:WaitForChild(script.Name)
local heightFrame = screenUi:WaitForChild("HeightFrame")
local descendButton = screenUi:WaitForChild("DescendButton")
local strengthLabel = screenUi:WaitForChild("BubbleStrengthLabel")
local mystBar = screenUi:WaitForChild("MystBar")

local buttonCooldown = false

local function updateMystBar(mystQuant, mystCap)
    mystBar.CapacityLabel.Text = mystQuant.."/"..mystCap
    BarMeters.resize(mystBar.Bar, mystQuant / mystCap)
end

function Float.init()
    player:GetAttributeChangedSignal("InFloat"):Connect(function()
        local inFloat = player:GetAttribute("InFloat")
        screenUi.Enabled = inFloat
        descendButton.Visible = true
    end)

    descendButton.MouseButton1Click:Connect(function()
        if not screenUi.Enabled or buttonCooldown or not player:GetAttribute("InFloat") or player:GetAttribute("InDescent") then return end
        buttonCooldown = true
        local promise = BlinkMain.Float.AttemptDescend.Invoke()
        local _, result = promise:await()
        
        if result == true then
            descendButton.Visible = false
        end

        task.wait(0.05)
        buttonCooldown = false
    end)
end

RunService.RenderStepped:Connect(function()
    if not player:GetAttribute("InFloat") then return end
    local char = player.Character
    if not char then return end
    local height = FloatMath.calcHeight(char.PrimaryPart.Position.Y)

    heightFrame.Label.Text = height.." m"

    if player:GetAttribute("InDescent") then return end

    -- Bubble strength effects
    local popLimit = FloatMath.calcPopLimit(PlrData.Upgrades["Bubble Resistance"]())
    local thresholds = FloatMath.calcStrengthThrs(popLimit, 1)
    local strengthLvl = 1
    for i, threshold in pairs(thresholds) do if height >= threshold then strengthLvl = #FloatMath.StrengthLevels - (i - 1); break end end
    strengthLabel.Text = "Bubble Strength: "..FloatMath.StrengthLevels[strengthLvl]["Name"]

end)

updateMystBar(player:GetAttribute("MystQuant"), player:GetAttribute("MystCap"))
player:GetAttributeChangedSignal("MystCap"):Connect(function()
    updateMystBar(player:GetAttribute("MystQuant"), player:GetAttribute("MystCap"))
end)

player:GetAttributeChangedSignal("MystQuant"):Connect(function()
    updateMystBar(player:GetAttribute("MystQuant"), player:GetAttribute("MystCap"))
end)

player:GetAttributeChangedSignal("MystQuality"):Connect(function()
    mystBar.QualityLabel.Text = "Myst Quality Multiplier x"..player:GetAttribute("MystQuality")
end)

type Float = typeof(Float) & {

}

return Float