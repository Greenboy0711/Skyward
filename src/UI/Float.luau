local ReplicatedStorage = game:GetService("ReplicatedStorage")
local RunService = game:GetService("RunService")
local Float = {}

local player = game:GetService("Players").LocalPlayer

local screenUi = player.PlayerGui:WaitForChild(script.Name)
local heightFrame = screenUi:WaitForChild("HeightFrame")
local descendButton = screenUi:WaitForChild("DescendButton")

local buttonCooldown = false

function Float.init()
    player:GetAttributeChangedSignal("InFloat"):Connect(function()
        screenUi.Enabled = player:GetAttribute("InFloat")
    end)

    descendButton.MouseButton1Click:Connect(function()
        if not screenUi.Enabled or buttonCooldown then return end
        buttonCooldown = true

        task.wait(0.05)
        buttonCooldown = false
    end)
end

RunService.RenderStepped:Connect(function()
    if not player:GetAttribute("InFloat") then return end
    local char = player.Character
    if not char then return end

    heightFrame.Label.Text = math.round(char.PrimaryPart.Position.Y).." m"
end)

type Float = typeof(Float) & {

}

return Float