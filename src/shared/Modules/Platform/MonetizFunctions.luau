local MarketplaceService = game:GetService("MarketplaceService")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local MonetizationData = require(ReplicatedStorage.Shared.Modules.Data.MonetizationData)
local monetiz = {}

function monetiz.promptDevProduct(player, productType, index)
    if productType == "Crates" then
        MarketplaceService:PromptProductPurchase(player, MonetizationData["CratesData"][index].Id)
    else
        MarketplaceService:PromptProductPurchase(player, MonetizationData["ProductsData"][productType][index].Id)
    end
end

function monetiz.promptGamepass(player, passType)
    MarketplaceService:PromptGamePassPurchase(player, MonetizationData["GamepassData"][passType].Id)
end

return monetiz