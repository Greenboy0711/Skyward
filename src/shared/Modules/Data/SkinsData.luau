local skins = {}

skins.Data = {
    ["None"] = {Rarity = "Common"},
    ["Red"] = {Prim = {Color = Color3.fromRGB(135, 0, 0)}, Secon = {Color = Color3.fromRGB(255, 0, 0)}, Rarity = "Common"},
    ["Orange"] = {Prim = {Color = Color3.fromRGB(182, 97, 0)}, Secon = {Color = Color3.fromRGB(255, 86, 2)}, Rarity = "Common"},
    ["Yellow"] = {Prim = {Color = Color3.fromRGB(135, 124, 0)}, Secon = {Color = Color3.fromRGB(255, 217, 0)}, Rarity = "Common"},
    ["Green"] = {Prim = {Color = Color3.fromRGB(21, 135, 1)}, Secon = {Color = Color3.fromRGB(55, 255, 0)}, Rarity = "Common"},
    ["Blue"] = {Prim = {Color = Color3.fromRGB(0, 9, 135)}, Secon = {Color = Color3.fromRGB(17, 0, 255)}, Rarity = "Common"},
    ["Purple"] = {Prim = {Color = Color3.fromRGB(75, 3, 135)}, Secon = {Color = Color3.fromRGB(128, 0, 255)}, Rarity = "Common"},
    ["Pink"] = {Prim = {Color = Color3.fromRGB(135, 0, 99)}, Secon = {Color = Color3.fromRGB(200, 0, 255)}, Rarity = "Common"},
    ["White"] = {Prim = {Color = Color3.fromRGB(163, 163, 163)}, Secon = {Color = Color3.fromRGB(255, 255, 255)}, Rarity = "Common"},
    ["Black"] = {Prim = {Color = Color3.fromRGB(0, 0, 0)}, Secon = {Color = Color3.fromRGB(63, 63, 63)}, Rarity = "Common"},
    ["Grey"] = {Prim = {Color = Color3.fromRGB(50, 50, 50)}, Secon = {Color = Color3.fromRGB(100, 100, 100)}, Rarity = "Common"},

    ["Latte"] = {Prim = {Color = Color3.fromRGB(36, 21, 8)}, Secon = {Color = Color3.fromRGB(163, 151, 127)}, Rarity = "Uncommon"},
    ["Frog"] = {Prim = {Color = Color3.fromRGB(52, 234, 52)}, Secon = {Color = Color3.fromRGB(255, 94, 0)}, Rarity = "Uncommon"},
    ["Bubblegum"] = {Prim = {Color = Color3.fromRGB(234, 70, 234)}, Secon = {Color = Color3.fromRGB(72, 232, 234)}, Rarity = "Uncommon"},
    ["Dual Flame"] = {Prim = {Color = Color3.fromRGB(0, 9, 135)}, Secon = {Color = Color3.fromRGB(255, 85, 0)}, Rarity = "Uncommon"},
    ["Jungle"] = {Prim = {Color = Color3.fromRGB(35, 29, 25)}, Secon = {Color = Color3.fromRGB(0, 107, 75)}, Rarity = "Uncommon"},
    ["Gravity"] = {Prim = {Color = Color3.fromRGB(59, 0, 234)}, Secon = {Color = Color3.fromRGB(7, 0, 79)}, Rarity = "Uncommon"},
    ["Beach"] = {Prim = {Color = Color3.fromRGB(234, 203, 165)}, Secon = {Color = Color3.fromRGB(72, 232, 234)}, Rarity = "Uncommon"},
    ["Seafoam"] = {Prim = {Color = Color3.fromRGB(61, 234, 199)}, Secon = {Color = Color3.fromRGB(105, 133, 234)}, Rarity = "Uncommon"},
    ["Spook"] = {Prim = {Color = Color3.fromRGB(234, 84, 9)}, Secon = {Color = Color3.fromRGB(105, 0, 234)}, Rarity = "Uncommon"},
    ["Mono"] = {Prim = {Color = Color3.fromRGB(0, 0, 0)}, Secon = {Color = Color3.fromRGB(255, 255, 255)}, Rarity = "Uncommon"},

    ["Noob"] = {Prim = {Color = Color3.fromRGB(255, 209, 26), Material = Enum.Material.Glacier, MaterialVariant = "2022Studs"}, Secon = {Color = Color3.fromRGB(8, 0, 255)}, Rarity = "Rare"},
    ["Military"] = {Prim = {Color = Color3.fromRGB(17, 85, 2), Material = Enum.Material.DiamondPlate}, Secon = {Color = Color3.fromRGB(71, 85, 69)}, Rarity = "Rare"},
    ["Box"] = {Prim = {Color = Color3.fromRGB(255, 221, 196), Material = Enum.Material.Cardboard}, Secon = {Color = Color3.fromRGB(206, 156, 120)}, Rarity = "Rare"},
    ["Pandan"] = {Prim = {Color = Color3.fromRGB(112, 255, 153), Material = Enum.Material.Rubber}, Secon = {Color = Color3.fromRGB(120, 206, 116)}, Rarity = "Rare"},
    ["Mahogany"] = {Prim = {Color = Color3.fromRGB(56, 3, 3), Material = Enum.Material.Wood}, Secon = {Color = Color3.fromRGB(80, 26, 26)}, Rarity = "Rare"},
    ["Marble"] = {Prim = {Color = Color3.fromRGB(36, 36, 36), Material = Enum.Material.Marble}, Secon = {Color = Color3.fromRGB(255, 255, 255)}, Rarity = "Rare"},
    ["Charity"] = {Prim = {Color = Color3.fromRGB(241, 161, 237), Material = Enum.Material.Foil}, Secon = {Color = Color3.fromRGB(142, 134, 255)}, Rarity = "Rare"},
    ["Sky"] = {Prim = {Color = Color3.fromRGB(0, 237, 241), Material = Enum.Material.Glass, Transparency = 0.4}, Secon = {Color = Color3.fromRGB(17, 255, 176)}, Rarity = "Rare"},
    ["Sandstone"] = {Prim = {Color = Color3.fromRGB(241, 171, 147), Material = Enum.Material.Sandstone}, Secon = {Color = Color3.fromRGB(255, 222, 89)}, Rarity = "Rare"},
    ["Urban"] = {Prim = {Color = Color3.fromRGB(99, 99, 99), Material = Enum.Material.Concrete}, Secon = {Color = Color3.fromRGB(251, 255, 1)}, Rarity = "Rare"},

    ["Bubble"] = {Prim = {Color = Color3.fromRGB(0, 24, 177), Material = Enum.Material.Rock, Particles = true}, Secon = {Color = Color3.fromRGB(86, 110, 163)}, Rarity = "Epic"},
    ["Flame"] = {Prim = {Color = Color3.fromRGB(99, 23, 10), Material = Enum.Material.Marble, Particles = true}, Secon = {Color = Color3.fromRGB(255, 30, 0)}, Rarity = "Epic"},
    ["Sunbeam"] = {Prim = {Color = Color3.fromRGB(255, 245, 138), Material = Enum.Material.Glass, Particles = true}, Secon = {Color = Color3.fromRGB(255, 214, 119)}, Rarity = "Epic"},
    ["Chrome"] = {Prim = {Color = Color3.fromRGB(255, 255, 255), Material = Enum.Material.Glass, Reflectance = 1, Particles = true}, Secon = {Color = Color3.fromRGB(255, 255, 255)}, Rarity = "Epic"},
    ["Rad"] = {Prim = {Color = Color3.fromRGB(251, 255, 0), Material = Enum.Material.Mud, Particles = true}, Secon = {Color = Color3.fromRGB(16, 255, 3)}, Rarity = "Epic"},
    ["Snowy"] = {Prim = {Color = Color3.fromRGB(190, 255, 255), Material = Enum.Material.Snow, Particles = true}, Secon = {Color = Color3.fromRGB(130, 201, 255)}, Rarity = "Epic"},
    ["Boiler"] = {Prim = {Color = Color3.fromRGB(111, 111, 81), Material = Enum.Material.Metal, Particles = true}, Secon = {Color = Color3.fromRGB(255, 97, 97)}, Rarity = "Epic"},
    ["Glitch"] = {Prim = {Color = Color3.fromRGB(0, 15, 3), Material = Enum.Material.SmoothPlastic, Particles = true}, Secon = {Color = Color3.fromRGB(0, 255, 17)}, Rarity = "Epic"},
    ["Party"] = {Prim = {Color = Color3.fromRGB(66, 41, 255), Material = Enum.Material.SmoothPlastic, Particles = true}, Secon = {Color = Color3.fromRGB(255, 132, 60)}, Rarity = "Epic"},
    ["Venom"] = {Prim = {Color = Color3.fromRGB(66, 35, 91), Material = Enum.Material.Metal, Particles = true}, Secon = {Color = Color3.fromRGB(38, 255, 0)}, Rarity = "Epic"},

    ["Magma Jewel"] = {Preload = true, Rarity = "Legendary"},
    ["Diamond"] = {Preload = true, Rarity = "Legendary"},
    ["Generator"] = {Preload = true, Rarity = "Legendary"},
    ["Obsidian"] = {Preload = true, Rarity = "Legendary"},
    ["Pitch"] = {Preload = true, Rarity = "Legendary"},
    ["Lava Core"] = {Preload = true, Rarity = "Legendary", Exclusive = true},
    ["Sci-Fi"] = {Preload = true, Rarity = "Legendary", Exclusive = true},
    ["Gridlock"] = {Preload = true, Rarity = "Legendary"},
}

skins.Ids = {
    "None", "Red", "Orange", "Yellow", "Green", "Blue", "Purple", "Pink", "White", "Black", "Grey",

    "Latte", "Frog", "Bubblegum", "Dual Flame", "Jungle", "Gravity", "Beach", "Seafoam", "Spook", "Mono",

    "Noob", "Military", "Box", "Pandan", "Mahogany", "Marble", "Charity", "Sky", "Sandstone", "Urban",

    "Bubble", "Flame", "Sunbeam", "Chrome", "Rad", "Snowy", "Boiler", "Glitch", "Party", "Venom",

    "Magma Jewel", "Diamond", "Generator", "Obsidian", "Pitch", "Lava Core", "Sci-Fi", "Gridlock"
}

function skins.getType(typeId)
    return skins.Ids[typeId]
end


return skins