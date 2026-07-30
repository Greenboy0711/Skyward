local DataStoreService = game:GetService("DataStoreService")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local ServerStorage = game:GetService("ServerStorage")
local Promise = require(ReplicatedStorage.Packages.Promise)
local DayTimer = require(ReplicatedStorage.Shared.Modules.Platform.DayTimer)

local BuildServiceServer = {}

-- local leaderboards = workspace:WaitForChild("Leaderboards")

-- local function updateLeaderboard(dataStore, parent)

--     for i,v in pairs(parent:GetChildren()) do
--         if v:IsA("Frame") then v:Destroy() end
--     end

--     local success, errorMessage = pcall(function()

--         local sortedData = dataStore:GetSortedAsync(false, 100)
--         local page = sortedData:GetCurrentPage()

--         local ids = {}
--         for rank, data in pairs(page) do table.insert(ids, tonumber(data.key)) end
--         local allPlrData = game:GetService("UserService"):GetUserInfosByUserIdsAsync(ids)

--         for rank, data in pairs(page) do
--             local plrData
--             for _, t in pairs(allPlrData) do
--                 if t["Id"] == tonumber(data.key) then plrData = t; break end
--             end
--             if not plrData then return end
--             local value = data.value

--             local isOnLeaderboard = false

--             for i,v in pairs(parent:GetChildren()) do
--                 if v:IsA("Frame") and v.Username.Text == plrData.DisplayName then
--                     isOnLeaderboard = true
--                     break
--                 end
--             end

--             if value and isOnLeaderboard == false then
--                 local template = ServerStorage.Templates.PlayerName:Clone()
--                 template.Placement.Text = rank
--                 if rank == 1 then
--                     template.Placement.TextColor3 = Color3.fromRGB(255, 221, 30)
--                 elseif rank == 2 then
--                     template.Placement.TextColor3 = Color3.fromRGB(179, 185, 208)
--                 elseif rank == 3 then
--                     template.Placement.TextColor3 = Color3.fromRGB(188, 121, 66)
--                 end

--                 template.Username.Text = plrData.DisplayName
--                 template.Value.Text = value
--                 template.ProfileImage.Image = "rbxthumb://type=AvatarHeadShot&id="..data.key.."&w=150&h=150"
--                 template.LayoutOrder = rank
--                 template.Parent = parent
--             end

--         end

--     end)

--     if not success then
--         print(errorMessage)
--     end
-- end

-- local function updateOrderedStores(player, plrStats, week)
--     for _, stat in pairs(DayTimer.BoardValues) do
--         DataStoreService:GetOrderedDataStore(stat..week):SetAsync(player.UserId, plrStats[stat])
--     end
-- end

function BuildServiceServer.init()
    -- TODO: update stores on player leave and rewards
    -- Promise.try(function() -- Update leaderboards
    --     task.wait(2.5)

    --     while true do
    --         local currentWeek = DayTimer.Week()
    --         for _, player in pairs(game.Players:GetPlayers()) do
    --             if player.UserId < 0 then continue end

    --             local plrStats = DataService:get(player, {"Weekly"})
    --             if plrStats["Week"] ~= currentWeek then -- New week, reset player stats
    --                 -- Update old week stats if present
    --                 if plrStats["Week"] ~= -1 then
    --                     updateOrderedStores(player, plrStats, plrStats["Week"])
    --                 end

    --                 plrStats = {["Week"] = currentWeek, ["Wins"] = 0, ["Bloxes"] = 0, ["BoomBux"] = 0}
    --                 DataService:set(player, {"Weekly"}, plrStats)
    --             end

    --             updateOrderedStores(player, plrStats, plrStats["Week"])
    --         end

    --         for _, stat in pairs(DayTimer.BoardValues) do -- Update in game leaderboards
    --             updateLeaderboard(DataStoreService:GetOrderedDataStore(stat..currentWeek), leaderboards[stat.."Leaderboard"].Board.SurfaceGui.ScrollingFrame)
    --         end

    --         task.wait(10) -- 119 TODO: Maybe change timing to line up with end of week?
    --     end
    -- end)
end

type BuildServiceServer = typeof(BuildServiceServer) & {
}

return BuildServiceServer :: BuildServiceServer