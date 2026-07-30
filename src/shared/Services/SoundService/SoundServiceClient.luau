local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Charm = require(ReplicatedStorage.Packages.Charm)
local SoundsData = require(ReplicatedStorage.Shared.Modules.Data.SoundsData)
local SoundServiceClient = {}

local soundTemplate = ReplicatedStorage.Templates.Sound

-- local initData = DataService:get({"Settings"})

SoundServiceClient.MusicVolume = 100
SoundServiceClient.SoundVolume = 100
-- SoundServiceClient.MusicVolume = Charm.atom(initData["Background Music"])
-- SoundServiceClient.SoundVolume = Charm.atom(initData["Sound Effects"])

-- Charm.subscribe(SoundServiceClient.MusicVolume, function()
--     local music = game.Workspace.SoundsPlaying.BackgroundMusic

--     local data = SoundsData[music.MusicType.Value]
--     if not data then return end

--     local selectedMusic = data[music.MusicIndex.Value]

--     music.Volume = selectedMusic["Volume"] * (SoundServiceClient.MusicVolume()/100)
-- end)

function SoundServiceClient.playMusic(musicType)
    if not musicType then return end
    local data = SoundsData[musicType]
    if not data then return end

    local music = game.Workspace.SoundsPlaying.BackgroundMusic

    local candidates = {}
    for i, v in pairs(data) do
        if i == music.MusicIndex.Value and musicType == music.MusicType.Value then continue end
        table.insert(candidates, v)
    end

    local selectedMusic = candidates[math.random(1, #candidates)]
    local selectedMusicIndex = table.find(data, selectedMusic)

    music.SoundId = "rbxassetid://"..selectedMusic["Id"]
    music.Volume = selectedMusic["Volume"] * (SoundServiceClient.MusicVolume()/100)
    music:Play()

    music.MusicIndex.Value = selectedMusicIndex
    music.MusicType.Value = musicType
end

function SoundServiceClient.playSound(name: string, parent: Instance?, looped: boolean?, pitch: number?)
    local data = SoundsData[name]
    if not data then return end

    local sound = soundTemplate:Clone()

    sound.SoundId = "rbxassetid://"..data["Id"]
    sound.Volume = data["Volume"] * (SoundServiceClient.SoundVolume()/100)
    sound.Name = name
    if looped then sound.Looped = true end
    
    if data["Pitch"] or pitch ~= nil then
        local pitchObj = Instance.new("PitchShiftSoundEffect")

        if pitch ~= nil then
            pitchObj.Octave = pitch
        elseif typeof(data["Pitch"]) == "table" then
            pitchObj.Octave = math.random()*(data["Pitch"][2]-data["Pitch"][1]) + data["Pitch"][1]
        else
            pitchObj.Octave = data["Pitch"]
        end

        pitchObj.Parent = sound
    end

    if not parent then
        sound.Parent = game.Workspace.SoundsPlaying
    else
        sound.Parent = parent
    end

    sound:Play()

    if looped then
        return sound
    else
        coroutine.wrap(function()
            sound.Ended:Wait()
            sound:Destroy()
        end)()
        return
    end
end

function SoundServiceClient.stopSound(instance)
    if instance then else return end
    instance:Stop()
    instance:Destroy()
end

function SoundServiceClient.init()
end

type SoundServiceClient = typeof(SoundServiceClient) & {

}

return SoundServiceClient