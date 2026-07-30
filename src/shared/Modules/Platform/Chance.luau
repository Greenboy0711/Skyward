local ReplicatedStorage = game:GetService("ReplicatedStorage")
local ItemsData = require(ReplicatedStorage.Shared.Modules.Data.ItemsData)
local RarityData = require(ReplicatedStorage.Shared.Modules.Data.RarityData)

local chance = {}

function chance.genSequence(rarity, length)
	local sequence = {}
	local minIndex = 1
	local maxIndex = table.find(RarityData.Order, rarity)
	
	for i = 1, length - 1 do
		local randIndex = math.random(minIndex, maxIndex)
		table.insert(sequence, randIndex)
		minIndex = randIndex
	end
	table.insert(sequence, maxIndex) -- Last chance will always be that rarity
	
	return sequence
end

function chance.getItem(rarity, rng, types)
	if not rng then
		local seed = math.random(2147483647)
		rng = Random.new(seed)
	end

    local rarityList = ItemsData.RarityPools[rarity]
    local randInd = rng:NextInteger(1, #rarityList)
	
	return rarityList[randInd]
end

-- Returns an option from options given rarities, rarities ordered from least rare to rarest
function chance.roll(options)
    local optionsType = "same"
    if options[1][1] then 
        optionsType = "vary"
    end

    if optionsType == "same" then
        local randomIndex = math.random(1, #options)
        return options[randomIndex]
    elseif optionsType == "vary" then
        local randomNum = math.random(1, 100)
        local sumChance = 0
        for _, t in pairs(options) do -- t[1] = option, t[2] = chance
            sumChance += t[2]
            if randomNum <= sumChance then
                return t[1]
            end
        end

    end

    return
end

return chance
