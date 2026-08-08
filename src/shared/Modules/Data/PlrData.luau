local ReplicatedStorage = game:GetService("ReplicatedStorage")

local Packages = ReplicatedStorage.Packages
local DataServiceTyped = require(Packages.DataServiceTyped)

type ItemData = {
	health: number,
	dmg: number,
}

local template = {
	["Currencies"] = {Coins = 10000, Spins = 3},
	["Stats"] = {["Time Played"] = 0, ["Bloxes"] = 0, ["Mines Placed"] = 0, ["Wins"] = 0},
	["DailyRewards"] = {["Time"] = -1, ["Day"] = 1, ["Special"] = 0},

	["Upgrades"] = {["Bubble Resistance"] = 100, ["Myst Capacity"] = 500, ["Breath Capacity"] = 1000},

	["Tycoon"] = {},
	["Myst Stores"] = {},

	["Settings"] = {
		["Background Music"] = 100,
		["Sound Effects"] = 100,
		["Special Effects"] = true
	},

	["Misc"] = {} :: {[string]: boolean},

	items = {} :: { [string]: ItemData },
	equippedItemId = nil :: string?,
	questProgress = {} :: { number },
}

-- Unlock all sets
-- local unlockAllTypes = {"Skins", "Kill Effects", "Trails"}
-- for _, unlockType in pairs(unlockAllTypes) do
--     local arr = {}

--     for i = 1, #ItemsData.Data[unlockType].Ids do
--         table.insert(arr, i)
--     end

--     data["Inventory"][unlockType] = arr
-- end


return DataServiceTyped({
	template = template,
    profileStoreIndex = "Default",
    profileStoreDataPrefix = "PLAYER_",
    useMock = true,
    viewedUserId = nil,
    overridenUserId = nil,
    dontSave = true,
    resetData = false,
})