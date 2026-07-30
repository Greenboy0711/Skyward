local quests = {}

quests.QuestsOrder = {"Daily", "Weekly"}
quests.DailyOrder = {"Easy", "Medium", "Hard"}
quests.WeeklyOrder = {"Easy", "Medium", "Medium", "Hard", "Hard"}
quests.RewardsOrder = {"BoomBux", "Spins"}

quests.Data = {
    {Title = "Play for ZZZ Minutes", 
        Daily = {Easy = 10 * 60, Medium = 15 * 60, Hard = 20 * 60},
        Weekly = {Easy = 60 * 60, Medium = 90 * 60, Hard = 120 * 60},
    },

    {Title = "Blox ZZZ Players", 
        Daily = {Easy = 2, Medium = 4, Hard = 6},
        Weekly = {Easy = 10, Medium = 15, Hard = 20},
    },

    {Title = "Win ZZZ Game(s)", 
        Daily = {Easy = 1, Medium = 2, Hard = 3},
        Weekly = {Easy = 5, Medium = 8, Hard = 10},
    },

    {Title = "Open ZZZ Crates", 
        Daily = {Easy = 2, Medium = 4, Hard = 6},
        Weekly = {Easy = 8, Medium = 12, Hard = 16},
    },

    {Title = "Spin the Wheel ZZZ Times", 
        Daily = {Easy = 2, Medium = 4, Hard = 6},
        Weekly = {Easy = 8, Medium = 12, Hard = 16},
    },

    {Title = "Place ZZZ Mines", 
        Daily = {Easy = 10, Medium = 15, Hard = 20},
        Weekly = {Easy = 45, Medium = 60, Hard = 90},
    },

    {Title = "Move ZZZ Studs", 
        Daily = {Easy = 100, Medium = 200, Hard = 300},
        Weekly = {Easy = 500, Medium = 750, Hard = 1000},
    },
}

quests.Rewards = {
    ["Daily"] = {Easy = {100, 1}, Medium = {200, 2}, Hard = {300, 3}},
    ["Weekly"] = {Easy = {100, 1}, Medium = {200, 2}, Hard = {300, 3}},
}

function quests.getQuests(userId, timeData, questsType)
    local rand = Random.new(userId * 1000 + timeData)
    local questsData = {}

    local pool = {}
    for i = 1, #quests.Data do table.insert(pool, i) end

    for _, diff in pairs(quests[questsType.."Order"]) do
        local questInd = rand:NextInteger(1, #pool)
        local rewardType = rand:NextInteger(1, 2)

        table.insert(questsData, {questInd, rewardType})
        table.remove(pool, questInd)
    end

    return questsData
end

return quests