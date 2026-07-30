local ReplicatedStorage = game:GetService("ReplicatedStorage")

local Packages = ReplicatedStorage.Packages
local DataServiceTyped = require(Packages.DataServiceTyped)

type ItemData = {
	health: number,
	dmg: number,
}

local template = {
	currency = 0,
	inventory = {
		apples = 5,
		oranges = 10,
	},
	settings = {
		music = true,
		sfx = true,
	},
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