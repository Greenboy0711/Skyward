local trails = {}

trails.Data = {
    ["None"] = {Rarity = "Common"},

    ["White"] = {Color = ColorSequence.new{
        ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 255, 255)), 
        ColorSequenceKeypoint.new(1, Color3.fromRGB(255, 255, 255))
    }, Rarity = "Common"},

    ["Grey"] = {Color = ColorSequence.new{
        ColorSequenceKeypoint.new(0, Color3.fromRGB(100, 100, 100)), 
        ColorSequenceKeypoint.new(1, Color3.fromRGB(100, 100, 100))
    }, Rarity = "Common"},

    ["Black"] = {Color = ColorSequence.new{
        ColorSequenceKeypoint.new(0, Color3.fromRGB(0, 0, 0)), 
        ColorSequenceKeypoint.new(1, Color3.fromRGB(0, 0, 0))
    }, LightEmission = 0, Rarity = "Common"},

    ["Red"] = {Color = ColorSequence.new{
        ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 0, 0)), 
        ColorSequenceKeypoint.new(1, Color3.fromRGB(255, 0, 0))
    }, Rarity = "Common"},

    ["Orange"] = {Color = ColorSequence.new{
        ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 128, 0)), 
        ColorSequenceKeypoint.new(1, Color3.fromRGB(255, 128, 0))
    }, Rarity = "Common"},

    ["Yellow"] = {Color = ColorSequence.new{
        ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 217, 0)), 
        ColorSequenceKeypoint.new(1, Color3.fromRGB(255, 217, 0))
    }, Rarity = "Common"},

    ["Green"] = {Color = ColorSequence.new{
        ColorSequenceKeypoint.new(0, Color3.fromRGB(55, 255, 0)), 
        ColorSequenceKeypoint.new(1, Color3.fromRGB(55, 255, 0))
    }, Rarity = "Common"},

    ["Blue"] = {Color = ColorSequence.new{
        ColorSequenceKeypoint.new(0, Color3.fromRGB(17, 0, 255)), 
        ColorSequenceKeypoint.new(1, Color3.fromRGB(17, 0, 255))
    }, Rarity = "Common"},

    ["Purple"] = {Color = ColorSequence.new{
        ColorSequenceKeypoint.new(0, Color3.fromRGB(128, 0, 255)), 
        ColorSequenceKeypoint.new(1, Color3.fromRGB(128, 0, 255))
    }, Rarity = "Common"},

    ["Pink"] = {Color = ColorSequence.new{
        ColorSequenceKeypoint.new(0, Color3.fromRGB(200, 0, 255)), 
        ColorSequenceKeypoint.new(1, Color3.fromRGB(200, 0, 255))
    }, Rarity = "Common"},

    -- [[ UNCOMMON ]] -- (2 Keypoints: Smooth, simple transitions)
    ["Ash"] = {Color = ColorSequence.new{
        ColorSequenceKeypoint.new(0, Color3.fromRGB(150, 150, 150)), 
        ColorSequenceKeypoint.new(1, Color3.fromRGB(40, 40, 40))
    }, Rarity = "Uncommon"},
    ["Sky"] = {Color = ColorSequence.new{
        ColorSequenceKeypoint.new(0, Color3.fromRGB(135, 206, 235)), 
        ColorSequenceKeypoint.new(1, Color3.fromRGB(255, 255, 255))
    }, Rarity = "Uncommon"},
    ["Leaf"] = {Color = ColorSequence.new{
        ColorSequenceKeypoint.new(0, Color3.fromRGB(34, 139, 34)), 
        ColorSequenceKeypoint.new(1, Color3.fromRGB(154, 205, 50))
    }, Rarity = "Uncommon"},
    ["Sand"] = {Color = ColorSequence.new{
        ColorSequenceKeypoint.new(0, Color3.fromRGB(210, 180, 140)), 
        ColorSequenceKeypoint.new(1, Color3.fromRGB(244, 164, 96))
    }, Rarity = "Uncommon"},
    ["Rose"] = {Color = ColorSequence.new{
        ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 105, 180)), 
        ColorSequenceKeypoint.new(1, Color3.fromRGB(255, 192, 203))
    }, Rarity = "Uncommon"},
    ["Ocean"] = {Color = ColorSequence.new{
        ColorSequenceKeypoint.new(0, Color3.fromRGB(0, 105, 148)), 
        ColorSequenceKeypoint.new(1, Color3.fromRGB(0, 0, 128))
    }, Rarity = "Uncommon"},
    ["Rust"] = {Color = ColorSequence.new{
        ColorSequenceKeypoint.new(0, Color3.fromRGB(183, 65, 14)), 
        ColorSequenceKeypoint.new(1, Color3.fromRGB(139, 69, 19))
    }, Rarity = "Uncommon"},
    ["Mint"] = {Color = ColorSequence.new{
        ColorSequenceKeypoint.new(0, Color3.fromRGB(152, 255, 152)), 
        ColorSequenceKeypoint.new(1, Color3.fromRGB(0, 255, 255))
    }, Rarity = "Uncommon"},
    ["Lavender"] = {Color = ColorSequence.new{
        ColorSequenceKeypoint.new(0, Color3.fromRGB(230, 230, 250)), 
        ColorSequenceKeypoint.new(1, Color3.fromRGB(147, 112, 219))
    }, Rarity = "Uncommon"},
    ["Peach"] = {Color = ColorSequence.new{
        ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 218, 185)), 
        ColorSequenceKeypoint.new(1, Color3.fromRGB(255, 160, 122))
    }, Rarity = "Uncommon"},
    ["Storm"] = {Color = ColorSequence.new{
        ColorSequenceKeypoint.new(0, Color3.fromRGB(105, 105, 105)), 
        ColorSequenceKeypoint.new(1, Color3.fromRGB(70, 130, 180))
    }, Rarity = "Uncommon"},
    ["Dirt"] = {Color = ColorSequence.new{
        ColorSequenceKeypoint.new(0, Color3.fromRGB(101, 67, 33)), 
        ColorSequenceKeypoint.new(1, Color3.fromRGB(62, 39, 35))
    }, Rarity = "Uncommon"},

    -- [[ RARE ]] -- (3 Keypoints: Elemental and striking gradients)
    ["Fireball"] = {Color = ColorSequence.new{
        ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 0, 0)), 
        ColorSequenceKeypoint.new(0.5, Color3.fromRGB(255, 140, 0)),
        ColorSequenceKeypoint.new(1, Color3.fromRGB(255, 255, 0))
    }, Rarity = "Rare"},
    ["Ice Shard"] = {Color = ColorSequence.new{
        ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 255, 255)), 
        ColorSequenceKeypoint.new(0.5, Color3.fromRGB(0, 255, 255)),
        ColorSequenceKeypoint.new(1, Color3.fromRGB(0, 0, 255))
    }, Rarity = "Rare"},
    ["Toxic"] = {Color = ColorSequence.new{
        ColorSequenceKeypoint.new(0, Color3.fromRGB(0, 100, 0)), 
        ColorSequenceKeypoint.new(0.5, Color3.fromRGB(50, 205, 50)),
        ColorSequenceKeypoint.new(1, Color3.fromRGB(173, 255, 47))
    }, Rarity = "Rare"},
    ["Arcane"] = {Color = ColorSequence.new{
        ColorSequenceKeypoint.new(0, Color3.fromRGB(75, 0, 130)), 
        ColorSequenceKeypoint.new(0.5, Color3.fromRGB(255, 0, 255)),
        ColorSequenceKeypoint.new(1, Color3.fromRGB(255, 105, 180))
    }, Rarity = "Rare"},
    ["Sunset"] = {Color = ColorSequence.new{
        ColorSequenceKeypoint.new(0, Color3.fromRGB(128, 0, 128)), 
        ColorSequenceKeypoint.new(0.5, Color3.fromRGB(255, 69, 0)),
        ColorSequenceKeypoint.new(1, Color3.fromRGB(255, 215, 0))
    }, Rarity = "Rare"},
    ["Jungle"] = {Color = ColorSequence.new{
        ColorSequenceKeypoint.new(0, Color3.fromRGB(0, 50, 0)), 
        ColorSequenceKeypoint.new(0.5, Color3.fromRGB(0, 255, 0)),
        ColorSequenceKeypoint.new(1, Color3.fromRGB(255, 255, 0))
    }, Rarity = "Rare"},
    ["Blood"] = {Color = ColorSequence.new{
        ColorSequenceKeypoint.new(0, Color3.fromRGB(73, 1, 1)), 
        ColorSequenceKeypoint.new(0.5, Color3.fromRGB(255, 0, 0)),
        ColorSequenceKeypoint.new(1, Color3.fromRGB(84, 8, 23))
    }, Rarity = "Rare"},
    ["Gold"] = {Color = ColorSequence.new{
        ColorSequenceKeypoint.new(0, Color3.fromRGB(184, 134, 11)), 
        ColorSequenceKeypoint.new(0.5, Color3.fromRGB(255, 215, 0)),
        ColorSequenceKeypoint.new(1, Color3.fromRGB(255, 255, 224))
    }, Rarity = "Rare"},
    ["Abyss"] = {Color = ColorSequence.new{
        ColorSequenceKeypoint.new(0, Color3.fromRGB(0, 0, 0)), 
        ColorSequenceKeypoint.new(0.5, Color3.fromRGB(0, 0, 128)),
        ColorSequenceKeypoint.new(1, Color3.fromRGB(75, 0, 130))
    }, Rarity = "Rare"},
    ["Plasma"] = {Color = ColorSequence.new{
        ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 20, 147)), 
        ColorSequenceKeypoint.new(0.5, Color3.fromRGB(148, 0, 211)),
        ColorSequenceKeypoint.new(1, Color3.fromRGB(0, 255, 255))
    }, Rarity = "Rare"},
    ["Cloud"] = {Color = ColorSequence.new{
        ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 255, 255)), 
        ColorSequenceKeypoint.new(0.5, Color3.fromRGB(211, 211, 211)),
        ColorSequenceKeypoint.new(1, Color3.fromRGB(135, 206, 235))
    }, Rarity = "Rare"},
    ["Magma"] = {Color = ColorSequence.new{
        ColorSequenceKeypoint.new(0, Color3.fromRGB(20, 0, 0)), 
        ColorSequenceKeypoint.new(0.5, Color3.fromRGB(139, 0, 0)),
        ColorSequenceKeypoint.new(1, Color3.fromRGB(255, 69, 0))
    }, Rarity = "Rare"},

    -- [[ EPIC ]] -- (4 Keypoints: Magical, high-contrast, neon shifts)
    ["Neon Pulse"] = {Color = ColorSequence.new{
        ColorSequenceKeypoint.new(0, Color3.fromRGB(0, 255, 255)), 
        ColorSequenceKeypoint.new(0.33, Color3.fromRGB(255, 0, 255)),
        ColorSequenceKeypoint.new(0.66, Color3.fromRGB(255, 255, 0)),
        ColorSequenceKeypoint.new(1, Color3.fromRGB(0, 255, 255))
    }, Rarity = "Epic"},
    ["Void"] = {Color = ColorSequence.new{
        ColorSequenceKeypoint.new(0, Color3.fromRGB(0, 0, 0)), 
        ColorSequenceKeypoint.new(0.33, Color3.fromRGB(148, 0, 211)),
        ColorSequenceKeypoint.new(0.66, Color3.fromRGB(0, 0, 0)),
        ColorSequenceKeypoint.new(1, Color3.fromRGB(75, 0, 130))
    }, Rarity = "Epic"},
    ["Galaxy"] = {Color = ColorSequence.new{
        ColorSequenceKeypoint.new(0, Color3.fromRGB(0, 0, 128)), 
        ColorSequenceKeypoint.new(0.33, Color3.fromRGB(128, 0, 128)),
        ColorSequenceKeypoint.new(0.66, Color3.fromRGB(255, 105, 180)),
        ColorSequenceKeypoint.new(1, Color3.fromRGB(255, 255, 255))
    }, Rarity = "Epic"},
    ["Cyber"] = {Color = ColorSequence.new{
        ColorSequenceKeypoint.new(0, Color3.fromRGB(50, 205, 50)), 
        ColorSequenceKeypoint.new(0.33, Color3.fromRGB(0, 255, 255)),
        ColorSequenceKeypoint.new(0.66, Color3.fromRGB(0, 0, 255)),
        ColorSequenceKeypoint.new(1, Color3.fromRGB(138, 43, 226))
    }, Rarity = "Epic"},
    ["Hellfire"] = {Color = ColorSequence.new{
        ColorSequenceKeypoint.new(0, Color3.fromRGB(0, 0, 0)), 
        ColorSequenceKeypoint.new(0.33, Color3.fromRGB(220, 20, 60)),
        ColorSequenceKeypoint.new(0.66, Color3.fromRGB(255, 140, 0)),
        ColorSequenceKeypoint.new(1, Color3.fromRGB(255, 255, 0))
    }, Rarity = "Epic"},
    ["Glacier"] = {Color = ColorSequence.new{
        ColorSequenceKeypoint.new(0, Color3.fromRGB(0, 255, 255)), 
        ColorSequenceKeypoint.new(0.33, Color3.fromRGB(255, 255, 255)),
        ColorSequenceKeypoint.new(0.66, Color3.fromRGB(0, 200, 255)),
        ColorSequenceKeypoint.new(1, Color3.fromRGB(0, 0, 255))
    }, Rarity = "Epic"},
    ["Bioluminescence"] = {Color = ColorSequence.new{
        ColorSequenceKeypoint.new(0, Color3.fromRGB(0, 0, 139)), 
        ColorSequenceKeypoint.new(0.33, Color3.fromRGB(0, 128, 128)),
        ColorSequenceKeypoint.new(0.66, Color3.fromRGB(50, 205, 50)),
        ColorSequenceKeypoint.new(1, Color3.fromRGB(173, 255, 47))
    }, Rarity = "Epic"},
    ["Seashell"] = {Color = ColorSequence.new{
        ColorSequenceKeypoint.new(0, Color3.fromRGB(252, 136, 136)), 
        ColorSequenceKeypoint.new(0.33, Color3.fromRGB(254, 109, 131)),
        ColorSequenceKeypoint.new(0.66, Color3.fromRGB(87, 242, 242)),
        ColorSequenceKeypoint.new(1, Color3.fromRGB(252, 136, 136))
    }, Rarity = "Epic"},
    ["Shadowflame"] = {Color = ColorSequence.new{
        ColorSequenceKeypoint.new(0, Color3.fromRGB(20, 20, 20)), 
        ColorSequenceKeypoint.new(0.33, Color3.fromRGB(128, 0, 128)),
        ColorSequenceKeypoint.new(0.66, Color3.fromRGB(255, 0, 255)),
        ColorSequenceKeypoint.new(1, Color3.fromRGB(255, 69, 0))
    }, Rarity = "Epic"},
    ["Radiant"] = {Color = ColorSequence.new{
        ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 255, 0)), 
        ColorSequenceKeypoint.new(0.33, Color3.fromRGB(255, 255, 255)),
        ColorSequenceKeypoint.new(0.66, Color3.fromRGB(255, 215, 0)),
        ColorSequenceKeypoint.new(1, Color3.fromRGB(255, 140, 0))
    }, Rarity = "Epic"},
    ["Venom"] = {Color = ColorSequence.new{
        ColorSequenceKeypoint.new(0, Color3.fromRGB(0, 100, 0)), 
        ColorSequenceKeypoint.new(0.33, Color3.fromRGB(128, 0, 128)),
        ColorSequenceKeypoint.new(0.66, Color3.fromRGB(255, 0, 255)),
        ColorSequenceKeypoint.new(1, Color3.fromRGB(50, 205, 50))
    }, Rarity = "Epic"},
    ["Supernova"] = {Color = ColorSequence.new{
        ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 69, 0)), 
        ColorSequenceKeypoint.new(0.33, Color3.fromRGB(255, 105, 180)),
        ColorSequenceKeypoint.new(0.66, Color3.fromRGB(148, 0, 211)),
        ColorSequenceKeypoint.new(1, Color3.fromRGB(0, 0, 255))
    }, Rarity = "Epic"},

    -- [[ LEGENDARY ]] -- (5 Keypoints: High fantasy, godly themes, stark bands)
    ["Celestial"] = {Color = ColorSequence.new{
        ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 215, 0)), 
        ColorSequenceKeypoint.new(0.25, Color3.fromRGB(255, 255, 255)),
        ColorSequenceKeypoint.new(0.5, Color3.fromRGB(135, 206, 235)),
        ColorSequenceKeypoint.new(0.75, Color3.fromRGB(0, 0, 128)),
        ColorSequenceKeypoint.new(1, Color3.fromRGB(0, 0, 0))
    }, Rarity = "Legendary"},
    ["Corrupted"] = {Color = ColorSequence.new{
        ColorSequenceKeypoint.new(0, Color3.fromRGB(0, 0, 0)), 
        ColorSequenceKeypoint.new(0.25, Color3.fromRGB(139, 0, 0)),
        ColorSequenceKeypoint.new(0.5, Color3.fromRGB(0, 0, 0)),
        ColorSequenceKeypoint.new(0.75, Color3.fromRGB(139, 0, 139)),
        ColorSequenceKeypoint.new(1, Color3.fromRGB(0, 0, 0))
    }, Rarity = "Legendary"},
    ["Aurora"] = {Color = ColorSequence.new{
        ColorSequenceKeypoint.new(0, Color3.fromRGB(0, 128, 128)), 
        ColorSequenceKeypoint.new(0.25, Color3.fromRGB(0, 255, 127)),
        ColorSequenceKeypoint.new(0.5, Color3.fromRGB(138, 43, 226)),
        ColorSequenceKeypoint.new(0.75, Color3.fromRGB(255, 105, 180)),
        ColorSequenceKeypoint.new(1, Color3.fromRGB(0, 0, 255))
    }, Rarity = "Legendary"},
    ["Firecracker"] = {Color = ColorSequence.new{
        ColorSequenceKeypoint.new(0, Color3.fromRGB(0, 255, 255)), 
        ColorSequenceKeypoint.new(0.25, Color3.fromRGB(50, 205, 50)),
        ColorSequenceKeypoint.new(0.5, Color3.fromRGB(255, 255, 0)),
        ColorSequenceKeypoint.new(0.75, Color3.fromRGB(255, 140, 0)),
        ColorSequenceKeypoint.new(1, Color3.fromRGB(255, 0, 0))
    }, Rarity = "Legendary"},
    ["Bliss"] = {Color = ColorSequence.new{
        ColorSequenceKeypoint.new(0, Color3.fromRGB(240, 195, 195)), 
        ColorSequenceKeypoint.new(0.25, Color3.fromRGB(218, 146, 218)),
        ColorSequenceKeypoint.new(0.5, Color3.fromRGB(0, 255, 255)),
        ColorSequenceKeypoint.new(0.75, Color3.fromRGB(249, 128, 146)),
        ColorSequenceKeypoint.new(1, Color3.fromRGB(240, 195, 195))
    }, Rarity = "Legendary"},
    ["Inferno"] = {Color = ColorSequence.new{
        ColorSequenceKeypoint.new(0, Color3.fromRGB(139, 0, 0)), 
        ColorSequenceKeypoint.new(0.25, Color3.fromRGB(255, 140, 0)),
        ColorSequenceKeypoint.new(0.5, Color3.fromRGB(255, 255, 0)),
        ColorSequenceKeypoint.new(0.75, Color3.fromRGB(255, 140, 0)),
        ColorSequenceKeypoint.new(1, Color3.fromRGB(139, 0, 0))
    }, Rarity = "Legendary"},
    ["Abyssal Neon"] = {Color = ColorSequence.new{
        ColorSequenceKeypoint.new(0, Color3.fromRGB(0, 0, 0)), 
        ColorSequenceKeypoint.new(0.25, Color3.fromRGB(0, 100, 0)),
        ColorSequenceKeypoint.new(0.5, Color3.fromRGB(128, 0, 128)),
        ColorSequenceKeypoint.new(0.75, Color3.fromRGB(0, 0, 128)),
        ColorSequenceKeypoint.new(1, Color3.fromRGB(0, 0, 0))
    }, Rarity = "Legendary"},
    ["Overdrive"] = {Color = ColorSequence.new{
        ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 153, 0)), 
        ColorSequenceKeypoint.new(0.25, Color3.fromRGB(0, 0, 255)),
        ColorSequenceKeypoint.new(0.5, Color3.fromRGB(14, 6, 68)),
        ColorSequenceKeypoint.new(0.75, Color3.fromRGB(255, 153, 0)),
        ColorSequenceKeypoint.new(1, Color3.fromRGB(0, 0, 255))
    }, Rarity = "Legendary"},
    ["Twilight"] = {Color = ColorSequence.new{
        ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 140, 0)), 
        ColorSequenceKeypoint.new(0.25, Color3.fromRGB(128, 0, 128)),
        ColorSequenceKeypoint.new(0.5, Color3.fromRGB(0, 0, 139)),
        ColorSequenceKeypoint.new(0.75, Color3.fromRGB(0, 0, 0)),
        ColorSequenceKeypoint.new(1, Color3.fromRGB(75, 0, 130))
    }, Rarity = "Legendary"},
    ["Prismatic"] = {Color = ColorSequence.new{
        ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 255, 255)), 
        ColorSequenceKeypoint.new(0.25, Color3.fromRGB(255, 0, 0)),
        ColorSequenceKeypoint.new(0.5, Color3.fromRGB(0, 255, 0)),
        ColorSequenceKeypoint.new(0.75, Color3.fromRGB(0, 0, 255)),
        ColorSequenceKeypoint.new(1, Color3.fromRGB(255, 255, 255))
    }, Rarity = "Legendary"},
    ["Solar Flare"] = {Color = ColorSequence.new{
        ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 0, 0)), 
        ColorSequenceKeypoint.new(0.25, Color3.fromRGB(255, 140, 0)),
        ColorSequenceKeypoint.new(0.5, Color3.fromRGB(255, 255, 0)),
        ColorSequenceKeypoint.new(0.75, Color3.fromRGB(255, 255, 255)),
        ColorSequenceKeypoint.new(1, Color3.fromRGB(135, 206, 235))
    }, Rarity = "Legendary"},
    ["Nightmare"] = {Color = ColorSequence.new{
        ColorSequenceKeypoint.new(0, Color3.fromRGB(0, 0, 0)), 
        ColorSequenceKeypoint.new(0.25, Color3.fromRGB(139, 0, 0)),
        ColorSequenceKeypoint.new(0.5, Color3.fromRGB(105, 105, 105)),
        ColorSequenceKeypoint.new(0.75, Color3.fromRGB(75, 0, 130)),
        ColorSequenceKeypoint.new(1, Color3.fromRGB(0, 0, 0))
    }, Rarity = "Legendary"},

    -- [[ MYTHIC ]] -- (6 Keypoints: Cosmic phenomena, chaotic strobes, extreme details)
    ["Rainbow"] = {
        SubTop = ColorSequence.new{
            ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 0, 0)), 
            ColorSequenceKeypoint.new(0.2, Color3.fromRGB(255, 127, 0)),
            ColorSequenceKeypoint.new(0.4, Color3.fromRGB(255, 255, 0)),
            ColorSequenceKeypoint.new(0.6, Color3.fromRGB(0, 255, 0)),
            ColorSequenceKeypoint.new(0.8, Color3.fromRGB(0, 0, 255)),
            ColorSequenceKeypoint.new(1, Color3.fromRGB(148, 0, 211))},

        Color = ColorSequence.new{
            ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 0, 0)), 
            ColorSequenceKeypoint.new(0.2, Color3.fromRGB(255, 127, 0)),
            ColorSequenceKeypoint.new(0.4, Color3.fromRGB(255, 255, 0)),
            ColorSequenceKeypoint.new(0.6, Color3.fromRGB(0, 255, 0)),
            ColorSequenceKeypoint.new(0.8, Color3.fromRGB(0, 0, 255)),
            ColorSequenceKeypoint.new(1, Color3.fromRGB(148, 0, 211))}, 
    Rarity = "Mythic"},
    ["Tropical"] = {
        SubTop = ColorSequence.new{
            ColorSequenceKeypoint.new(0, Color3.fromRGB(247, 56, 152)), 
            ColorSequenceKeypoint.new(1, Color3.fromRGB(34, 228, 253))},
        
        Color = ColorSequence.new{
            ColorSequenceKeypoint.new(0, Color3.fromRGB(248, 237, 151)), 
            ColorSequenceKeypoint.new(0.25, Color3.fromRGB(247, 56, 152)),
            ColorSequenceKeypoint.new(0.5, Color3.fromRGB(248, 237, 151)),
            ColorSequenceKeypoint.new(0.75, Color3.fromRGB(34, 228, 253)),
            ColorSequenceKeypoint.new(1, Color3.fromRGB(248, 237, 151))}, 
    Rarity = "Mythic"},
    ["Singularity"] = {
        SubTop = ColorSequence.new{
            ColorSequenceKeypoint.new(0, Color3.fromRGB(138, 43, 226)), 
            ColorSequenceKeypoint.new(1, Color3.fromRGB(61, 18, 102))},

        Color = ColorSequence.new{
            ColorSequenceKeypoint.new(0, Color3.fromRGB(0, 0, 0)), 
            ColorSequenceKeypoint.new(0.25, Color3.fromRGB(61, 18, 102)),
            ColorSequenceKeypoint.new(0.5, Color3.fromRGB(0, 0, 0)),
            ColorSequenceKeypoint.new(0.75, Color3.fromRGB(138, 43, 226)),
            ColorSequenceKeypoint.new(1, Color3.fromRGB(0, 0, 0)),}, 
    Rarity = "Mythic"},
    ["Hyperdrive"] = {
        SubTop = ColorSequence.new{
            ColorSequenceKeypoint.new(0, Color3.fromRGB(0, 255, 255)), 
            ColorSequenceKeypoint.new(0.2, Color3.fromRGB(255, 0, 255)),
            ColorSequenceKeypoint.new(0.4, Color3.fromRGB(255, 255, 0)),
            ColorSequenceKeypoint.new(0.6, Color3.fromRGB(0, 255, 0)),
            ColorSequenceKeypoint.new(0.8, Color3.fromRGB(0, 255, 255)),
            ColorSequenceKeypoint.new(1, Color3.fromRGB(255, 255, 255))}, 

        Color = ColorSequence.new{
            ColorSequenceKeypoint.new(0, Color3.fromRGB(0, 255, 255)), 
            ColorSequenceKeypoint.new(0.2, Color3.fromRGB(255, 0, 255)),
            ColorSequenceKeypoint.new(0.4, Color3.fromRGB(255, 255, 0)),
            ColorSequenceKeypoint.new(0.6, Color3.fromRGB(0, 255, 0)),
            ColorSequenceKeypoint.new(0.8, Color3.fromRGB(0, 255, 255)),
            ColorSequenceKeypoint.new(1, Color3.fromRGB(255, 255, 255))}, 
    Rarity = "Mythic"},
    ["Chaos"] = {
        SubTop = ColorSequence.new{
            ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 0, 0)), 
            ColorSequenceKeypoint.new(0.5, Color3.fromRGB(0, 255, 0)),
            ColorSequenceKeypoint.new(1, Color3.fromRGB(0, 0, 255))}, 

        Color = ColorSequence.new{
            ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 0, 0)), 
            ColorSequenceKeypoint.new(0.2, Color3.fromRGB(0, 0, 0)),
            ColorSequenceKeypoint.new(0.4, Color3.fromRGB(0, 255, 0)),
            ColorSequenceKeypoint.new(0.6, Color3.fromRGB(0, 0, 0)),
            ColorSequenceKeypoint.new(0.8, Color3.fromRGB(0, 0, 255)),
            ColorSequenceKeypoint.new(1, Color3.fromRGB(0, 0, 0))}, 
    Rarity = "Mythic"},
    ["Divinity"] = {
        SubTop = ColorSequence.new{
        ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 230, 5)), 
        ColorSequenceKeypoint.new(1, Color3.fromRGB(255, 255, 255))},
        
        Color = ColorSequence.new{
            ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 215, 0)), 
            ColorSequenceKeypoint.new(0.25, Color3.fromRGB(255, 255, 255)),
            ColorSequenceKeypoint.new(0.5, Color3.fromRGB(255, 255, 0)),
            ColorSequenceKeypoint.new(0.75, Color3.fromRGB(255, 255, 255)),
            ColorSequenceKeypoint.new(1, Color3.fromRGB(255, 215, 0))}, 
    Rarity = "Mythic"},
    ["Mosaic"] = {
        SubTop = ColorSequence.new{
            ColorSequenceKeypoint.new(0, Color3.fromRGB(128, 0, 128)), 
            ColorSequenceKeypoint.new(0.2, Color3.fromRGB(50, 205, 50)),
            ColorSequenceKeypoint.new(0.4, Color3.fromRGB(255, 20, 147)),
            ColorSequenceKeypoint.new(0.6, Color3.fromRGB(0, 255, 255)),
            ColorSequenceKeypoint.new(0.8, Color3.fromRGB(255, 140, 0)),
            ColorSequenceKeypoint.new(1, Color3.fromRGB(0, 0, 255))}, 
        
        Color = ColorSequence.new{
            ColorSequenceKeypoint.new(0, Color3.fromRGB(128, 0, 128)), 
            ColorSequenceKeypoint.new(0.2, Color3.fromRGB(50, 205, 50)),
            ColorSequenceKeypoint.new(0.4, Color3.fromRGB(255, 20, 147)),
            ColorSequenceKeypoint.new(0.6, Color3.fromRGB(0, 255, 255)),
            ColorSequenceKeypoint.new(0.8, Color3.fromRGB(255, 140, 0)),
            ColorSequenceKeypoint.new(1, Color3.fromRGB(0, 0, 255))}, 
    Rarity = "Mythic"},
    ["Darkpunk"] = {
        SubTop = ColorSequence.new{
            ColorSequenceKeypoint.new(0, Color3.fromRGB(116, 0, 169)), 
            ColorSequenceKeypoint.new(1, Color3.fromRGB(0, 100, 0))},

        Color = ColorSequence.new{
            ColorSequenceKeypoint.new(0, Color3.fromRGB(58, 0, 84)), 
            ColorSequenceKeypoint.new(0.25, Color3.fromRGB(116, 0, 169)),
            ColorSequenceKeypoint.new(0.5, Color3.fromRGB(0, 39, 0)),
            ColorSequenceKeypoint.new(0.75, Color3.fromRGB(0, 100, 0)),
            ColorSequenceKeypoint.new(1, Color3.fromRGB(58, 0, 84))}, 
    Rarity = "Mythic"},
    ["Nebula"] = {
        SubTop = ColorSequence.new{
            ColorSequenceKeypoint.new(0, Color3.fromRGB(0, 0, 139)), 
            ColorSequenceKeypoint.new(1, Color3.fromRGB(133, 133, 255))},

        Color = ColorSequence.new{
            ColorSequenceKeypoint.new(0, Color3.fromRGB(0, 0, 139)), 
            ColorSequenceKeypoint.new(0.2, Color3.fromRGB(255, 105, 180)),
            ColorSequenceKeypoint.new(0.4, Color3.fromRGB(138, 43, 226)),
            ColorSequenceKeypoint.new(0.6, Color3.fromRGB(0, 255, 255)),
            ColorSequenceKeypoint.new(0.8, Color3.fromRGB(255, 255, 255)),
            ColorSequenceKeypoint.new(1, Color3.fromRGB(0, 0, 139))}, 
    Rarity = "Mythic"},
    ["Quantum"] = {
        SubTop = ColorSequence.new{
            ColorSequenceKeypoint.new(0, Color3.fromRGB(0, 0, 0)), 
            ColorSequenceKeypoint.new(1, Color3.fromRGB(255, 255, 255))},

        SubBottom = ColorSequence.new{
            ColorSequenceKeypoint.new(0, Color3.fromRGB(0, 0, 0)), 
            ColorSequenceKeypoint.new(1, Color3.fromRGB(255, 255, 255))},

        Color = ColorSequence.new{
            ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 255, 255)), 
            ColorSequenceKeypoint.new(0.2, Color3.fromRGB(0, 0, 0)),
            ColorSequenceKeypoint.new(0.4, Color3.fromRGB(255, 255, 255)),
            ColorSequenceKeypoint.new(0.6, Color3.fromRGB(0, 0, 0)),
            ColorSequenceKeypoint.new(0.8, Color3.fromRGB(255, 255, 255)),
            ColorSequenceKeypoint.new(1, Color3.fromRGB(0, 0, 0))}, 
    Rarity = "Mythic"},
    ["Skyfall"] = {
        SubTop = ColorSequence.new{
        ColorSequenceKeypoint.new(0, Color3.fromRGB(29, 217, 255)), 
        ColorSequenceKeypoint.new(1, Color3.fromRGB(111, 225, 248))},
        
        Color = ColorSequence.new{
            ColorSequenceKeypoint.new(0, Color3.fromRGB(254, 167, 254)), 
            ColorSequenceKeypoint.new(0.25, Color3.fromRGB(126, 98, 251)),
            ColorSequenceKeypoint.new(0.5, Color3.fromRGB(62, 120, 255)),
            ColorSequenceKeypoint.new(0.75, Color3.fromRGB(126, 98, 251)),
            ColorSequenceKeypoint.new(1, Color3.fromRGB(254, 167, 254))},
        Rarity = "Mythic"},
    ["Crimson Gold"] = {
        SubTop = ColorSequence.new{
            ColorSequenceKeypoint.new(0, Color3.fromRGB(220, 20, 60)), 
            ColorSequenceKeypoint.new(1, Color3.fromRGB(239, 219, 68))},

        Color = ColorSequence.new{
            ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 25, 25)),
            ColorSequenceKeypoint.new(0.3, Color3.fromRGB(255, 215, 0)),
            ColorSequenceKeypoint.new(0.6, Color3.fromRGB(255, 255, 255)),
            ColorSequenceKeypoint.new(1, Color3.fromRGB(255, 25, 25))}, 
        Rarity = "Mythic"}
}

trails.Ids = {
    "None", "White", "Black", "Grey", "Red", "Orange", "Yellow", "Green", "Blue", "Purple", "Pink",

    "Ash", "Sky", "Leaf", "Sand", "Rose", "Ocean", "Rust", "Mint", "Lavender", "Peach", "Storm", "Dirt",

    "Fireball", "Ice Shard", "Toxic", "Arcane", "Sunset", "Jungle", "Blood", "Gold", "Abyss", "Plasma", "Cloud", "Magma",

    "Neon Pulse", "Void", "Galaxy", "Cyber", "Hellfire", "Glacier", "Bioluminescence", "Seashell", "Shadowflame", "Radiant", "Venom", "Supernova",

    "Celestial", "Corrupted", "Aurora", "Firecracker", "Bliss", "Inferno", "Abyssal Neon", "Overdrive", "Twilight", "Prismatic", "Solar Flare", "Nightmare",

    "Rainbow", "Tropical", "Singularity", "Hyperdrive", "Chaos", "Divinity", "Mosaic", "Darkpunk", "Nebula", "Quantum", "Skyfall", "Crimson Gold",
}

function trails.getType(typeId)
    return trails.Ids[typeId]
end

return trails