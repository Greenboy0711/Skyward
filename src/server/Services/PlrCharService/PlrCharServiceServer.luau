local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local ServerScriptService = game:GetService("ServerScriptService")
local ItemsData = require(ReplicatedStorage.Shared.Modules.Data.ItemsData)
local MonetizationData = require(ReplicatedStorage.Shared.Modules.Data.MonetizationData)
local TrailsData = require(ReplicatedStorage.Shared.Modules.Data.TrailsData)
local DayTimer = require(ReplicatedStorage.Shared.Modules.Platform.DayTimer)
local ModelServiceClient = require(ReplicatedStorage.Shared.Services.ModelService.ModelServiceClient)
local BlinkMain = require(ServerScriptService.Server.BlinkServer.BlinkMain)
local Player = require(ServerScriptService.Server.Classes.Player)
local PlayerStore = require(ServerScriptService.Server.Classes.Stores.PlayerStore)
local PlrCharServiceServer = {}

local function setPlayerChrCollisions(character)
   for _, bodyPart in pairs(character:GetChildren()) do
      if bodyPart:IsA("BasePart") then
         bodyPart.CollisionGroup = "Player"
      end
   end
end

local function characterAdded(player, character)
    setPlayerChrCollisions(character)
end

local function playerAdded(player: Player)
    local playerObj = Player.new(player)
    playerObj:init()
    -- BadgeFunctions.awardBadge(player, "Welcome")
end

function PlrCharServiceServer.init()
    for _, player in pairs(Players:GetPlayers()) do
        local character = player.Character or player.CharacterAdded:Wait()
        characterAdded(player, character)
    end

    BlinkMain.Player.InventoryEquip.On(function(player, id, type)
        -- if not id or not type or not ItemsData.isValidType(type) then return false end

        -- local invData = DataService:get(player, {"Inventory", type})

        -- local idFound = false
        -- for _, v in pairs(invData) do if v == id then idFound = true; break end end
        -- if not idFound then return false end
        
        -- if type == "Skins" then
        --     local minesData = DataService:get(player, {"Inventory", "Mines"})
        --     local equippedMineId = DataService:get(player, {"Equipped", "Mines"})

        --     local mineFound = false
        --     for i, t in pairs(minesData) do
        --         if t[1] == equippedMineId then
        --             DataService:set(player, {"Inventory", "Mines", i, 2}, id)
        --             mineFound = true
        --             break
        --         end
        --     end

        --     DataService:set(player, {"Equipped", type}, id)
        --     if not mineFound then return false end
        -- else
        --     DataService:set(player, {"Equipped", type}, id)
        -- end

        -- if type == "Trails" then
        --     local character = player.Character or player.CharacterAdded:Wait()
        --     ModelServiceClient.loadTrail(TrailsData.getType(id), character)
        -- end
        
        -- return true
    end)

    -- BlinkMain.Player.DailyClaim.On(function(player, dayClaim) -- Player attempts to claim
    --     local dailyData = DataService:get(player, {"DailyRewards"})
    --     if dailyData["Day"] ~= dayClaim then return false end
    --     if dayClaim < 1 or dayClaim > MonetizationData.MAX_DAY then return false end

    --     local plrObj = PlayerStore[player.UserId]
    --     if not plrObj then return false end

    --     local timePassed = DayTimer.getSecPassed(dailyData["Time"])
    --     if timePassed < MonetizationData.SECOND_WAIT then return false end

    --     local newRewardsData = {["Time"] = os.time()}

    --     if dailyData["Day"] == 7 and dailyData["Special"] ~= MonetizationData.CURRENT_SPECIAL then -- Grant rewards
    --         -- TODO: Grant special reward
    --         newRewardsData["Special"] = MonetizationData.CURRENT_SPECIAL

    --         local itemType, id = ItemsData.getType(MonetizationData.Day7Specials[MonetizationData.CURRENT_SPECIAL]["Type"])
    --         local success = plrObj:addToInv(itemType, id)
    --         if not success or success ~= 1 then return false end
    --     else
    --         -- Regular reward
    --         local rewardData = MonetizationData.DailyRewardsData[dayClaim]
            
    --         plrObj:addCurrency(rewardData["Currency"], rewardData["Quantity"], "Daily Reward")
    --         newRewardsData["Special"] = dailyData["Special"]
    --     end

    --     if dailyData["Day"] == MonetizationData.MAX_DAY then -- Upodate day
    --         newRewardsData["Day"] = 1
    --     else
    --         newRewardsData["Day"] = dailyData["Day"] + 1
    --     end

    --     DataService:set(player, {"DailyRewards"}, newRewardsData)

    --     return true
    -- end)
end

-- function DataService:onPlayerInit(player: Player, data): ()
-- 	-- Crate checking is client sided

--     -- Weekly leaderboard stats updating
--     -- for _, stat in pairs(DayTimer.BoardValues) do
--     --     local arrayIndex = stat == "BoomBux" and "Currencies" or "Stats"

--     --     local currStatVal = DataService:get(player, {arrayIndex, stat})
--     --     DataService:getChangedSignal(player, {arrayIndex, stat}):Connect(function(newVal)
--     --         DataService:update(player, {"Weekly", stat}, function(currVal)
--     --             return currVal + (newVal - currStatVal)
--     --         end)
--     --         currStatVal = newVal
--     --     end)
--     -- end
    
-- end

function PlrCharServiceServer.PlayerAdded(args)
    playerAdded(args[1])
end

function PlrCharServiceServer.CharacterAdded(args)
    local character = table.unpack(args)
    characterAdded(Players:GetPlayerFromCharacter(character), character)
end

function PlrCharServiceServer.PromptTriggered(args)
end

type PlrCharServiceServer = typeof(PlrCharServiceServer) & {

}

return PlrCharServiceServer