local ReplicatedStorage = game:GetService("ReplicatedStorage")
local BlinkMain = require(ReplicatedStorage.Shared.BlinkClient.BlinkMain)
local AnimationsData = require(ReplicatedStorage.Shared.Modules.Data.AnimationsData)

local AnimationServiceClient = {}

local animObjects = {}

local loadedAnimations = {}

for i, v in pairs(AnimationsData) do
    local animation = Instance.new("Animation")
    animation.AnimationId = "rbxassetid://"..v
    animObjects[i] = animation
end

local function loadAnim(animator, animation)
    local loadedAnim
    local animObject = animObjects[animation]
    if not animObject then return end
    if not loadedAnimations[animator] then loadedAnimations[animator] = {} end

    loadedAnim = loadedAnimations[animator][animation]
    if not loadedAnim then
        loadedAnim = animator:LoadAnimation(animObject)
        loadedAnimations[animator][animation] = loadedAnim
    end

    return loadedAnim
end

local function animationFunction(animator, animation, definedState, duration)
    local loadedAnim 

    if type(animation) == "string" then
        loadedAnim = loadAnim(animator, animation)
    else
        loadedAnim = loadAnim(animator, animation.Name)
    end

    if definedState == true then
        if loadedAnim.IsPlaying then return end
            
        loadedAnim:Play()
        if duration then
            repeat task.wait() until loadedAnim.Length > 0
            local speed = loadedAnim.Length / duration
            loadedAnim:AdjustSpeed(speed)
        end
    elseif definedState == false then
        if not loadedAnim.IsPlaying then return end
        loadedAnim:Stop()
    end
    if definedState ~= nil then return end

    if loadedAnim.IsPlaying then
        loadedAnim:Stop()
    elseif not loadedAnim.IsPlaying then
        loadedAnim:Play()
    end

    return loadedAnim
end

function AnimationServiceClient.loadAnims(animator, animations)
    local loadedAnims = {}
    for _, v in pairs(animations) do
        loadedAnims[v] = loadAnim(animator, v)
    end
    return loadedAnims
end

function AnimationServiceClient.callAnim(animator, animation, definedState, duration): AnimationTrack?
    if type(animation) == "table" then
        for _, v in pairs(animation) do
            animationFunction(animator, v, definedState, duration)
        end
        return nil
    else
        return animationFunction(animator, animation, definedState, duration)
    end
end

function AnimationServiceClient.getId(name)
    return AnimationsData[name]
end

function AnimationServiceClient.init()
    BlinkMain.Effects.Animation.On(function(animName, animator)
        AnimationServiceClient.callAnim(animator, animName)
    end)
end

type AnimationServiceClient = typeof(AnimationServiceClient) & {

}

return AnimationServiceClient