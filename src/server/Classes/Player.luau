local ReplicatedStorage = game:GetService("ReplicatedStorage")
local ServerScriptService = game:GetService("ServerScriptService")
local Promise = require(ReplicatedStorage.Packages.Promise)
local SafeDestroy = require(ReplicatedStorage.Shared.Modules.Data.SafeDestroy)
local BlinkMain = require(ServerScriptService.Server.BlinkServer.BlinkMain)
local PlayerStore = require(ServerScriptService.Server.Classes.Stores.PlayerStore)
local PlrData = require(ServerScriptService.Server.Modules.Data.PlrData).server

local Player = {}
Player.__index = Player

type self = {
	Id: number,
	Player: Player
}

export type PlayerObj = typeof(setmetatable({} :: self, Player))

function Player.getChar(self: PlayerObj): (Model)
    return self.Player.Character or self.Player.CharacterAdded:Wait()
end

function Player.addCurrency(self: PlayerObj, currency, value, note, notifDelay) : (boolean)
	-- local currVal = DataService:get(self.Player, {"Currencies", currency})
	-- if currVal == nil then return false end
	-- local timeNow = os.time()

	-- if currency == "BoomBux" then -- Check multipliers
	-- 	local multis = DataService:get(self.Player, {"Multipliers"})

	-- 	for i, t in pairs(multis) do -- {Multiplier, TimeStart, TimeLimit}
	-- 		if t[3] ~= -1 and timeNow - t[2] >= t[3] then -- Time limit reached, remove
	-- 			DataService:arrayRemove(self.Player, {"Multipliers"}, i)
	-- 		 end
	-- 		value = math.round(value * t[1])
	-- 	end
	-- end

	-- DataService:update(self.Player, {"Currencies", currency}, function(currVal)
	-- 	return currVal + value
	-- end)

	-- if notifDelay then
	-- 	Promise.try(function()
	-- 		task.wait(notifDelay)
	-- 		BlinkMain.Effects.SmallNotif.Fire(self.Player, currency, value, note)
	-- 	end)
	-- else
	-- 	BlinkMain.Effects.SmallNotif.Fire(self.Player, currency, value, note)
	-- end
	
	-- return true
end

function Player.subCurrency(self: PlayerObj, currency, value): (boolean)
	-- local currVal = DataService:get(self.Player, {"Currencies", currency})
	-- if currVal == nil or currVal - value < 0 then BlinkMain.Effects.Notification.Fire(self.Player, "Not Enough "..currency, "ShortError", Color3.fromRGB(255, 255, 255)); return false end
	-- DataService:update(self.Player, {"Currencies", currency}, function(currVal)
	-- 	return currVal - value
	-- end)
	-- return true
end

function Player.addToInv(self: PlayerObj, itemType, id, item, notifDelay): (number)
	-- local inv = DataService:get(self.Player, {"Inventory", itemType})
	-- if table.find(inv, id) then return 2 end -- Duplicate

	-- DataService:arrayInsert(self.Player, {"Inventory", itemType}, id)

	-- if notifDelay then
	-- 	Promise.try(function()
	-- 		task.wait(notifDelay)
	-- 		BlinkMain.Effects.SmallNotif.Fire(self.Player, "Item", item, itemType)
	-- 	end)
	-- else
	-- 	BlinkMain.Effects.SmallNotif.Fire(self.Player, "Item", item, itemType)
	-- end
	
	-- return 1
end

function Player:destroy()
	-- TODO: Destroy player function
	SafeDestroy(workspace:WaitForChild("GameElements"):WaitForChild("Characters"), self.Player.Name)

	PlayerStore[self.Id] = nil
	for i, _ in pairs(self) do
		self[i] = nil
	end
	setmetatable(self, nil)
end

function Player.init(self: PlayerObj): ()
	self.Player:SetAttribute("InGame", false)
end

function Player.new(player: Player): PlayerObj
	local self = setmetatable({} :: self, Player)

	self.Id = player.UserId
	self.Player = player

	self.AFK = false
	self.Quests = {}
	self.JoinTime = os.time()

	PlayerStore[self.Id] = self
	
	return self
end

return Player