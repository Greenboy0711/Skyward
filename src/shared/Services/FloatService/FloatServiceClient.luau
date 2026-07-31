local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local BlinkMain = require(ReplicatedStorage.Shared.BlinkClient.BlinkMain)

local GameServiceClient = {}

local player = Players.LocalPlayer
local camera = workspace.CurrentCamera

function GameServiceClient.init()
    
end

local prevY = 0
function GameServiceClient.Heartbeat()
    if not player:GetAttribute("InFloat") then return end

    local x, y, z = camera.CFrame:ToOrientation()
    if math.abs(prevY - y) >= 0.001 then
        BlinkMain.Float.CameraAng.Fire(Vector3.new(x, -y, z))
    end
    prevY = y
end

type GameServiceClient = typeof(GameServiceClient) & {

}

return GameServiceClient