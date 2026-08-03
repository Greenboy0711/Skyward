local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local BlinkMain = require(ReplicatedStorage.Shared.BlinkClient.BlinkMain)

local FloatServiceClient = {}

local player = Players.LocalPlayer
local camera = workspace.CurrentCamera

local mystFills = {}

local function createMystFill(curPlr)
    -- Create Myst fill in bubble
    local fill = ReplicatedStorage.Templates.MystFill:Clone()
    mystFills[curPlr] = fill
    fill.Parent = workspace:WaitForChild("Effects")
end

function FloatServiceClient.init()
    for _, curPlr in pairs(Players:GetPlayers()) do
        if not curPlr:GetAttribute("InFloat") then continue end
        createMystFill(curPlr)
    end

    BlinkMain.Float.PlayerEnteredFloat.On(function(curPlr)
        if not curPlr then return end
        createMystFill(curPlr)
    end)
end

local prevY = 0
function FloatServiceClient.Heartbeat(dt)
    for curPlr, fill in pairs(mystFills) do -- Manage bubble Myst fills
        if not curPlr or not curPlr:GetAttribute("InFloat") then fill:Destroy(); mystFills[curPlr] = nil; continue end
        local curChar = curPlr.Character
        if not curChar then continue end
        local bubble = curChar:WaitForChild("Bubble")
        if not bubble then continue end

        local targetDiam = bubble.Size.X * 0.8
        fill.BottomMax.Size = Vector3.new(targetDiam, targetDiam / 2, targetDiam)
        fill.TopMax.Size = Vector3.new(targetDiam, targetDiam / 2, targetDiam)

        local percent = curPlr:GetAttribute("MystQuant") / curPlr:GetAttribute("MystCap")
        percent = math.max(math.min(percent, 1), 0)

        fill.Bottom.Transparency = percent <= 0.5 and 0.7 or 1
        fill.BottomMax.Transparency = percent > 0.5 and 0.7 or 1
        fill.BottomMin.Size = Vector3.new(targetDiam * 0.5, 0.001, targetDiam * 0.5)
        fill.Bottom.Position = fill.BottomMin.Position:Lerp(fill.BottomMax.Position, math.min(percent * 2, 1))
        fill.Bottom.Size = fill.BottomMin.Size:Lerp(fill.BottomMax.Size, math.min(percent * 2, 1))

        fill.Top.Transparency = percent > 0.5 and 0.7 or 1
        fill.Top.Position = fill.TopMin.Position:Lerp(fill.TopMax.Position, math.max((percent - 0.5) * 2, 0))
        fill.Top.Size = fill.TopMin.Size:Lerp(fill.TopMax.Size, math.max((percent - 0.5) * 2, 0))
        
        fill:PivotTo(CFrame.new(curChar:WaitForChild("Bubble").Position))
    end

    if not player:GetAttribute("InFloat") then return end

    local x, y, z = camera.CFrame:ToOrientation() -- Send camera angle
    if math.abs(prevY - y) >= 0.001 then
        BlinkMain.Float.CameraAng.Fire(Vector3.new(x, -y, z))
    end
    prevY = y
end

type FloatServiceClient = typeof(FloatServiceClient) & {

}

return FloatServiceClient