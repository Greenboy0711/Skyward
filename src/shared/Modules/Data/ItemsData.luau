local RarityData = require(script.Parent.RarityData)
local items = {}

items.Types = {"Skins", "Kill Effects", "Trails"}

items.Data = {
    ["Skins"] = require(script.Parent.SkinsData), 
    ["Kill Effects"] = require(script.Parent["Kill EffectsData"]), 
    ["Trails"] = require(script.Parent.TrailsData)
}

items.Icons = {
    ["Skins"] = "83904607448002",
    ["Kill Effects"] = "116762795015607",
    ["Trails"] = "100484790503406",
}

items.RarityPools = {} -- ALl items organized by rarity, used for crates
for _, rarity in pairs(RarityData.Order) do
    items.RarityPools[rarity] = {}
end

for _, module in pairs(items.Data) do
    for item, t in pairs(module.Data) do
        if item == module.Ids[1] or t["Exclusive"] then continue end -- Skip default and exclusive items
        table.insert(items.RarityPools[t.Rarity], item)
    end
end

function items.isValidType(type)
    for _, v in pairs(items.Types) do if type == v then return true end end
    return false
end

function items.getType(item)
    for itemType, module in pairs(items.Data) do
        local id = table.find(module.Ids, item)
        if id then return itemType, id end
    end

    return nil
end

return items
