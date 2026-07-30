local killEffects = {}

killEffects.Data = {
    ["Explosion"] = {Rarity = "Common"},
    ["Red"] = {Prim = {Color = Color3.fromRGB(135, 0, 0)}, Secon = {Color = Color3.fromRGB(255, 0, 0)}, Rarity = "Common"},
    ["Orange"] = {Prim = {Color = Color3.fromRGB(135, 74, 0)}, Secon = {Color = Color3.fromRGB(255, 128, 0)}, Rarity = "Common"},
}

killEffects.Ids = {
    "Explosion",
}

function killEffects.getType(typeId)
    return killEffects.Ids[typeId]
end

return killEffects