local RarityData = require(script.Parent.RarityData)
local monetization = {}

-- GAMPEASSES
monetization.GamepassData = { -- Has function that awards pass rewards in Server MonetizFunctions
    ["VIP"] = {Id = 1880092741},
    ["x2 BoomBux"] = {Id = 1875292940},
}

for _, module in pairs(script:GetChildren()) do
    monetization.GamepassData[module.Name].RewardsFunction = require(module)
end

-- DEV PRODUCTS
monetization.ProductsData = {}

-- SPINS
monetization.ProductsData.Spins = {
    {Id = 3610435640, Products = {Spins = 1}},
    {Id = 3610435685, Products = {Spins = 5}},
}

-- STARTER PACK
monetization.ProductsData.StarterPack = {{Id = 3610610399, Products = {BoomBux = 2300, Skins = "Sci-Fi"}}} -- ~2950 BoomBux value
monetization.STARTER_DUR = 5 * 24 * 3600

-- BOOMBUX
monetization.ProductsData.BoomBux = {
    {Id = 3605088491, Products = {BoomBux = 500}},
    {Id = 3605088538, Products = {BoomBux = 1500}},
    {Id = 3605088573, Products = {BoomBux = 3250}},
    {Id = 3605088609, Products = {BoomBux = 6500}},
}

monetization.BoomBuxData = {
    ["Blox"] = 40,
    ["Win"] = 155,
    ["GroupReward"] = 600
}

monetization.NonBoomBuxBoosts = {"Group Reward", "Shop", "Gamepass", "Daily Reward"}

-- DAILY REWARDS
monetization.DailyRewardsData = {
    {Quantity = 40, Currency = "BoomBux"},
    {Quantity = 75, Currency = "BoomBux"},
    {Quantity = 1, Currency = "Spins"},
    {Quantity = 125, Currency = "BoomBux"},
    {Quantity = 2, Currency = "Spins"},
    {Quantity = 200, Currency = "BoomBux"},
    {Quantity = 300, Currency = "BoomBux"},
}

monetization.CURRENT_SPECIAL = 1
monetization.Day7Specials = {
    {Type = "Lava Core"},
}

monetization.SECOND_WAIT = 23 * 3600
monetization.MAX_DAY = #monetization.DailyRewardsData

-- CRATES
monetization.CRATES_SHADE_VAL = 125

monetization.CratesData = {
    ["Boom Box"] = {
        Chances = {
            Common = 50,
            Uncommon = 25,
            Rare = 15,
            Epic = 6,
            Legendary = 3,
            Mythic = 1,
        },
        BoomBux = 280,
        Robux = 29,
        Color = Color3.fromRGB(232, 81, 81),
        Id = 3610440923,
    },

    ["Crazy Crate"] = {
        Chances = {
            Common = 37,
            Uncommon = 29,
            Rare = 19,
            Epic = 9,
            Legendary = 4,
            Mythic = 2,
        },
        BoomBux = 525,
        Robux = 49,
        Color = Color3.fromRGB(81, 232, 114),
        Id = 3610440984,
    },

    ["Volatile Vault"] = {
        Chances = {
            Common = 30,
            Uncommon = 26,
            Rare = 21,
            Epic = 13,
            Legendary = 7,
            Mythic = 3,
        },
        BoomBux = 1250,
        Robux = 119,
        Color = Color3.fromRGB(197, 81, 232),
        Id = 3610441015,
    }
}

monetization.CratesList = {
    "Boom Box",
    "Crazy Crate",
    "Volatile Vault"
}

monetization.ChanceData = {}

for _, crate in pairs(monetization.CratesList) do
    local chances = {}

    for i = #RarityData.Order, 1, -1 do
        table.insert(chances, {RarityData.Order[i], monetization.CratesData[crate].Chances[RarityData.Order[i]]})
    end

    monetization.ChanceData[crate] = chances
end

-- SPIN WHEEL
monetization.SPIN_DURATION = 3
monetization.SpinsRewards = {
    {Reward = {BoomBux = 50}, Chance = 35, RotIndex = 2},
    {Reward = {BoomBux = 75}, Chance = 25, RotIndex = 4},
    {Reward = {BoomBux = 100}, Chance = 25, RotIndex = 6},
    {Reward = {BoomBux = 250}, Chance = 25, RotIndex = 1},
    {Reward = {Spins = 2}, Chance = 4, RotIndex = 5},
    {Reward = {Skins = "Sky"}, Chance = 2, RotIndex = 3},
}

monetization.SpinsChances = {}
for i, t in pairs(monetization.SpinsRewards) do -- Organize chances into 1 table for Chance.roll
    table.insert(monetization.SpinsChances, {i, monetization.SpinsRewards[i].Chance})
end

return monetization