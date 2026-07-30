local monetiz = {}

monetiz.PassRewardsFunctions = {}
for _, module in pairs(script:GetChildren()) do
    monetiz.PassRewardsFunctions[module.Name] = require(module)
end

return monetiz