local ReplicatedStorage = game:GetService("ReplicatedStorage")
local RunService = game:GetService("RunService")
local BlinkMain = require(ReplicatedStorage.Shared.BlinkClient.BlinkMain)
local ConvertPosY = require(ReplicatedStorage.Shared.Modules.Math.ConvertPosY)
local PlrData = require(ReplicatedStorage.Shared.Modules.Data.PlrData).client
local FloatMath = require(ReplicatedStorage.Shared.Modules.Math.FloatMath)
local BarMeters = require(ReplicatedStorage.Shared.Modules.UI.BarMeters)
local ColorThemes = require(ReplicatedStorage.Shared.Modules.UI.ColorThemes)
local ToggleBlackBars = require(ReplicatedStorage.Shared.Modules.UI.ToggleBlackBars)
local Float = {}

local player = game:GetService("Players").LocalPlayer
local camera = workspace.CurrentCamera
local windStreaks = ReplicatedStorage:WaitForChild("Assets"):WaitForChild("Effects"):WaitForChild("WindStreaks")

local screenUi = player.PlayerGui:WaitForChild(script.Name)
local heightFrame = screenUi:WaitForChild("HeightFrame")
local mapBorderFrame = screenUi:WaitForChild("MapBorderFrame")
local speedLabel = screenUi:WaitForChild("SpeedLabel")
local descendButton = screenUi:WaitForChild("DescendButton")
local strengthLabel = screenUi:WaitForChild("BubbleStrengthLabel")

local mystBar = screenUi:WaitForChild("MystBar")
local mystCollectToggle = mystBar:WaitForChild("MystCollectToggle")

local breathBar = screenUi:WaitForChild("BreathBar")
local breathHoldToggle = breathBar:WaitForChild("BreathHoldToggle")

local buttonCooldown = false

local function lerp(a, b, t)
	return a + (b - a) * t
end

local function updateBar(bar, quant, cap)
    if quant == nil or cap == nil then return end
    bar.CapacityLabel.Text = quant.."/"..cap
    BarMeters.resize(bar.BarX, quant / cap)
end

function Float.init()
    -- Buttons
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
    
    mystCollectToggle.MouseButton1Click:Connect(function()
        if buttonCooldown then return end
        buttonCooldown = true
        BlinkMain.Float.ToggleMystColl.Fire()

        task.wait(0.05)
        buttonCooldown = false
    end)

    breathHoldToggle.MouseButton1Click:Connect(function()
        if buttonCooldown then return end
        buttonCooldown = true
        BlinkMain.Float.ToggleBreathHold.Fire()

        task.wait(0.05)
        buttonCooldown = false
    end)

    -- Updating states
    player:GetAttributeChangedSignal("InFloat"):Connect(function()
        local inFloat = player:GetAttribute("InFloat")
        screenUi.Enabled = inFloat
    end)
    
    player:GetAttributeChangedSignal("IsCollMyst"):Connect(function()
        ColorThemes.toggleTheme(player:GetAttribute("IsCollMyst") and "ButtonGreen" or "ButtonRed", mystCollectToggle)
    end)

    player:GetAttributeChangedSignal("IsHoldingBreath"):Connect(function()
        ColorThemes.toggleTheme(player:GetAttribute("IsHoldingBreath") and "ButtonGreen" or "ButtonRed", breathHoldToggle)
    end)

    player:GetAttributeChangedSignal("InDescent"):Connect(function()
        if player:GetAttribute("InDescent") then
            camera.FieldOfView = lerp(camera.FieldOfView, 60, 0.1)
            windStreaks.Parent = workspace:WaitForChild("Effects")

            ToggleBlackBars(true)
        else
            camera.FieldOfView = lerp(camera.FieldOfView, 70, 0.1)
            windStreaks.Parent = game:GetService("ReplicatedStorage").Assets.Effects

            ToggleBlackBars(false)
        end
    end)

    RunService.RenderStepped:Connect(function()
        if not player:GetAttribute("InFloat") then return end
        local char = player.Character
        if not char then return end
        local height = FloatMath.calcHeight(char.PrimaryPart.Position.Y)
        
        -- Height and speed
        heightFrame.Label.Text = height.." m"
        speedLabel.Text = FloatMath.calcHeight(char.Bubble.LinearVelocity.VectorVelocity.Y).." m/s"

        -- Map border
        local r = (ConvertPosY(char.PrimaryPart.Position) - Vector3.new(0, 0, 0)).Magnitude
        mapBorderFrame.Visible = r > FloatMath.MAP_RADIUS

        if player:GetAttribute("InDescent") then return end

        -- Bubble strength effects
        local popLimit = FloatMath.calcPopLimit(PlrData.Upgrades["Bubble Resistance"]())
        local thresholds = FloatMath.calcStrengthThrs(popLimit, 1)
        local strengthLvl = 1
        for i, threshold in pairs(thresholds) do if height >= threshold then strengthLvl = #FloatMath.StrengthLevels - (i - 1); break end end
        strengthLabel.Text = "Bubble Strength: "..FloatMath.StrengthLevels[strengthLvl]["Name"]

        -- Pop button visibility
        descendButton.Visible = FloatMath.calcHeight(char.PrimaryPart.Position.Y) >= FloatMath.POP_THRES
    end)

    -- Myst bar states
    updateBar(mystBar, player:GetAttribute("MystQuant"), player:GetAttribute("MystCap"))
    player:GetAttributeChangedSignal("MystCap"):Connect(function()
        updateBar(mystBar, player:GetAttribute("MystQuant"), player:GetAttribute("MystCap"))
    end)

    player:GetAttributeChangedSignal("MystQuant"):Connect(function()
        updateBar(mystBar, player:GetAttribute("MystQuant"), player:GetAttribute("MystCap"))
    end)

    player:GetAttributeChangedSignal("MystQuality"):Connect(function()
        mystBar.QualityLabel.Text = "Myst Quality Multiplier x"..player:GetAttribute("MystQuality")
    end)

    -- Breath bar states
    updateBar(breathBar, player:GetAttribute("BreathQuant"), player:GetAttribute("BreathCap"))
    player:GetAttributeChangedSignal("BreathQuant"):Connect(function()
        updateBar(breathBar, player:GetAttribute("BreathQuant"), player:GetAttribute("BreathCap"))
    end)

    player:GetAttributeChangedSignal("BreathCap"):Connect(function()
        updateBar(breathBar, player:GetAttribute("BreathQuant"), player:GetAttribute("BreathCap"))
    end)
end

type Float = typeof(Float) & {

}

return Float