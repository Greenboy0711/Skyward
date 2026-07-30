local module = {}

local BadgeService = game:GetService("BadgeService")

module.BadgeData = {
}

function module.awardBadge(player, badgeName)
    local badgeId = module.BadgeData[badgeName]
    if not badgeId then return end

	-- Fetch badge information
	local success, badgeInfo = pcall(function()
		return BadgeService:GetBadgeInfoAsync(badgeId)
	end)

	if success then
		-- Confirm that badge can be awarded
		if badgeInfo.IsEnabled then
			-- Award badge
			local awarded, errorMessage = pcall(BadgeService.AwardBadgeAsync, BadgeService, player.UserId, badgeId)
			if not awarded then
				warn("Error while awarding badge:", errorMessage)
			end
		end
	else
		warn("Error while fetching badge info: " .. badgeInfo)
	end
end

function module.hasBadge(player, badgeName)
    local badgeId = module.BadgeData[badgeName]
    if not badgeId then return end

	local success, hasBadge = pcall(function()
		return BadgeService:UserHasBadgeAsync(player.UserId, badgeId)
	end)

	-- If there's an error, issue a warning and exit the function
	if not success then
		warn("Error while checking if player has badge!")
		return
	end

	return hasBadge
end

return module
