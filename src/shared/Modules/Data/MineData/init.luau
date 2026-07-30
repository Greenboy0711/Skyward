local mines = {}

mines.Data = {
    ["Mine"] = {Damage = 100, Radius = 1}
}

mines.Ids = {
    "Mine"
}

function mines.getMineData(mineId, data)
    for _, t in pairs(data) do if t[1] == mineId then return t end end
    return nil
end

function mines.getType(typeId)
    return mines.Ids[typeId]
end

for _, data in pairs(mines.Data) do
    data["Radius"] *= 1.25 -- Increase radius
end

for _, effect in pairs(script:GetChildren()) do
    mines.Data[effect.Name]["EffectsFunction"] = require(effect).Effects
end 

return mines