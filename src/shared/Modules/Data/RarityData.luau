local rarities = {}

rarities.SHADE_VAL = 125

rarities.Data = {
    ["Common"] = {Color = Color3.fromRGB(211, 211, 211), DupValue = 25, TextLeft = "90128793384792", TextCenter = "71391494068385"},
    ["Uncommon"] = {Color = Color3.fromRGB(35, 255, 86), DupValue = 50, TextLeft = "120365202953527", TextCenter = "120365202953527"},
    ["Rare"] = {Color = Color3.fromRGB(35, 123, 255), DupValue = 95, TextLeft = "114258844282492", TextCenter = "129833621949534"},
    ["Epic"] = {Color = Color3.fromRGB(155, 54, 255), DupValue = 155, TextLeft = "112298634061638", TextCenter = "126118059988619"},
    ["Legendary"] = {Color = Color3.fromRGB(255, 178, 54), DupValue = 215, TextLeft = "123888387168376", TextCenter = "75422334177626"},
    ["Mythic"] = {Color = Color3.fromRGB(255, 54, 118), DupValue = 310, TextLeft = "129010303039791", TextCenter = "119171901011722"},
}

rarities.Order = {
    "Common",
    "Uncommon",
    "Rare",
    "Epic",
    "Legendary",
    "Mythic",
}

rarities.CHANCE_WAITING_ID = "134774905239922"
rarities.CHANCE_SELEC_ID = "119280331327239"
rarities.CHANCE_USED_ID = "101242221016023"

return rarities