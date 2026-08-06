local Debris = game:GetService("Debris")
local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local BlinkMain = require(ReplicatedStorage.Shared.BlinkClient.BlinkMain)

local FloatServiceClient = {}

local player = Players.LocalPlayer
local camera = workspace.CurrentCamera
local effects = workspace:WaitForChild("Effects")
local windStreaks = ReplicatedStorage:WaitForChild("Assets"):WaitForChild("Effects"):WaitForChild("WindStreaks")

local floatEffects = {}

local function createFloatEffects(curPlr) -- Init float effects
    local fill = ReplicatedStorage.Templates.MystFill:Clone()
    fill.Parent = effects

    local descendTrail = ReplicatedStorage.Templates.TrailPart:Clone()
    descendTrail.Parent = effects

    floatEffects[curPlr] = {Fill = fill, DescendTrail = descendTrail}
end

local function destroyFloatEffects(curPlr)
    local effs = floatEffects[curPlr]
    floatEffects[curPlr] = nil
    
    for eff, v in pairs(effs) do 
        if v then 
            if eff == "DescendTrail" then
                Debris:AddItem(v, 1)
            else
                v:Destroy()
            end
        end 
    end
end

function FloatServiceClient.init()
    for _, curPlr in pairs(Players:GetPlayers()) do
        if not curPlr:GetAttribute("InFloat") then continue end
        createFloatEffects(curPlr)
    end

    BlinkMain.Float.PlayerEnteredFloat.On(function(curPlr)
        if not curPlr then return end
        createFloatEffects(curPlr)
    end)
end

local prevY = 0
function FloatServiceClient.Heartbeat(dt)
    for curPlr, effs in pairs(floatEffects) do -- Manage bubble effects
        if not curPlr or not curPlr:GetAttribute("InFloat") then destroyFloatEffects(curPlr); continue end
        local curChar = curPlr.Character
        if not curChar then continue end
        local bubble = curChar:WaitForChild("Bubble")
        if not bubble then continue end

        -- Manage bubble Myst fills
        local targetDiam = bubble.Size.X * 0.8
        effs.Fill.BottomMax.Size = Vector3.new(targetDiam, targetDiam / 2, targetDiam)
        effs.Fill.TopMax.Size = Vector3.new(targetDiam, targetDiam / 2, targetDiam)

        local percent = curPlr:GetAttribute("MystQuant") / curPlr:GetAttribute("MystCap")
        percent = math.max(math.min(percent, 1), 0)

        effs.Fill.Bottom.Transparency = percent <= 0.5 and 0.7 or 1
        effs.Fill.BottomMax.Transparency = percent > 0.5 and 0.7 or 1
        effs.Fill.BottomMin.Size = Vector3.new(targetDiam * 0.5, 0.001, targetDiam * 0.5)
        effs.Fill.Bottom.Position = effs.Fill.BottomMin.Position:Lerp(effs.Fill.BottomMax.Position, math.min(percent * 2, 1))
        effs.Fill.Bottom.Size = effs.Fill.BottomMin.Size:Lerp(effs.Fill.BottomMax.Size, math.min(percent * 2, 1))

        effs.Fill.Top.Transparency = percent > 0.5 and 0.7 or 1
        effs.Fill.Top.Position = effs.Fill.TopMin.Position:Lerp(effs.Fill.TopMax.Position, math.max((percent - 0.5) * 2, 0))
        effs.Fill.Top.Size = effs.Fill.TopMin.Size:Lerp(effs.Fill.TopMax.Size, math.max((percent - 0.5) * 2, 0))
        
        effs.Fill:PivotTo(CFrame.new(bubble.Position))

        if curPlr:GetAttribute("InDescent") then
            -- Manage descend trail
            effs.DescendTrail.Attachment0.Position = Vector3.new(0, 0, -bubble.Size.X / 2)
            effs.DescendTrail.Attachment1.Position = Vector3.new(0, 0, bubble.Size.X / 2)
            effs.DescendTrail.Trail.Enabled = true
            effs.DescendTrail.Position = bubble.Position + Vector3.new(0, bubble.Size.Y / 2.1, 0)

            -- Manage windstreaks
            windStreaks.CFrame = camera.CFrame - Vector3.new(0, 2.5, 0) + camera.CFrame.LookVector * (13 / (camera.FieldOfView / 60))
        end
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