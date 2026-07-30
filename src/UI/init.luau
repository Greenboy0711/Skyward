local CollectionService = game:GetService("CollectionService")
local Lighting = game:GetService("Lighting")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local TweenService = game:GetService("TweenService")
local Promise = require(ReplicatedStorage.Packages.Promise)
local TopBarPlus = require(ReplicatedStorage.Packages.TopBarPlus)
local BlinkMain = require(ReplicatedStorage.Shared.BlinkClient.BlinkMain)
local UI = {}

local camera = workspace.CurrentCamera
local blur = Lighting:WaitForChild("Blur")

local defaultHud = {"Buttons"}
local modals = {"RoundControls", "Inventory", "Index", "Shop", "Spectate", "Quests", "Settings", "Crates", "StarterPack"}
local nonBlurModals = {"RoundControls", "Spectate"}
local currentModal = nil

local uis = {}

local function convertTableToScreenUis(player: Player, stringTable)
    local screenUiTable = {}
    for _, v in pairs(stringTable) do
        screenUiTable[v] = player.PlayerGui:WaitForChild(v)
    end
    return screenUiTable
end

local function toggleBlur(toggle)
    if toggle then
        TweenService:Create(camera, TweenInfo.new(0.2), {FieldOfView = 60}):Play()
        TweenService:Create(blur, TweenInfo.new(0.2), {Size = 10}):Play()
    else
        TweenService:Create(camera, TweenInfo.new(0.2), {FieldOfView = 70}):Play()
        TweenService:Create(blur, TweenInfo.new(0.2), {Size = 0}):Play()
    end
end

local function toggleHud(toggle: boolean)
    for _, screenUi in pairs(defaultHud) do
        if not screenUi then continue end
        local TI = TweenInfo.new(0.125, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut)

        if toggle then
            screenUi.Enabled = toggle
            TweenService:Create(screenUi.Main, TI, {Position = UDim2.fromScale(0.01, 0.5)}):Play()
        else
            Promise.try(function()
                TweenService:Create(screenUi.Main, TI, {Position = UDim2.fromScale(-0.149, 0.5)}):Play()
                task.wait(0.125)
                screenUi.Enabled = toggle
            end)
        end
        
    end
end

local function hideCurrentModal(keepBlur)
    if currentModal:FindFirstChild("Main") and currentModal.Main:FindFirstChild("UIScale") then
        local TI = TweenInfo.new(0.125, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut)
        TweenService:Create(currentModal.Main.UIScale, TI, {Scale = 1.15}):Play()
    end

    toggleHud(true)
    local pastCurrentModal = currentModal
    currentModal = nil

    if not keepBlur then toggleBlur(false) end

    task.wait(0.125)
    pastCurrentModal.Enabled = false
end

local function changeModal(uiName)
    if currentModal and currentModal.Name == uiName then return end

    if uiName == nil and currentModal ~= nil then -- Hide current modal
        hideCurrentModal(true)
    end
    if not modals[uiName] then return end 

    if currentModal then -- Switch modals
        currentModal.Enabled = false
        if table.find(nonBlurModals, uiName) then toggleBlur(false) end
    else -- Hide HUD and show modal
        toggleHud(false)
        if not table.find(nonBlurModals, uiName) then toggleBlur(true) end
    end

    if modals[uiName]:FindFirstChild("Main") and modals[uiName].Main:FindFirstChild("UIScale") then
        local TI = TweenInfo.new(0.125, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut)
        modals[uiName].Main.UIScale.Scale = 1.15
        TweenService:Create(modals[uiName].Main.UIScale, TI, {Scale = 1}):Play()
    end

    modals[uiName].Enabled = true
    currentModal = modals[uiName]
end

local function initUI(module)
    local ui = require(module)
    table.insert(uis, ui)
    if ui.init then
        ui.init()

        if ui.DefaultHud then table.insert(defaultHud, module.Name) end
        if ui.Modal then table.insert(modals, module.Name) end

        -- if ui.CheckModal then
        --     ui.CheckModal:GetPropertyChangedSignal("Enabled"):Connect(function()
        --         if ui.CheckModal.Enabled then
        --             toggleHud(false)
        --         else
        --             if not currentModal then toggleHud(true) end
        --         end
        --     end)
        -- end

        if ui.ModalButtons then -- Setup modal buttons within ui
            for button, modalName in pairs(ui.ModalButtons) do
                if modalName == module.Name then
                    button.MouseButton1Click:Connect(function()
                        hideCurrentModal()
                    end)
                else
                    button.MouseButton1Click:Connect(function()
                        changeModal(modalName)
                    end)
                end
            end
            -- table.insert(modals, module.Name)
        end

    end
end

local buttonCooldown = false
local function setupModalButton(button)
    button.MouseButton1Click:Connect(function()
        if buttonCooldown then return end
        buttonCooldown = true
        local modalName = string.gsub(button.Name, "Button", "")
        changeModal(modalName)
        task.wait(0.125)
        buttonCooldown = false
    end)
end

function UI.init(player: Player)
    -- Top Bar
    TopBarPlus.new()
        :setName("DailyRewardsIcon")
        :setImage(71290917710548)
        :bindEvent("deselected", function()
            if player:GetAttribute("InGame") then return end
            changeModal("DailyRewards")
        end)
        :oneClick()

    for _, module in pairs(script:GetChildren()) do
        initUI(module)
    end

    defaultHud = convertTableToScreenUis(player, defaultHud)
    modals = convertTableToScreenUis(player, modals)
    for _, modal in pairs(modals) do
        if modal:FindFirstChild("ExitButton") then
            modal.ExitButton.MouseButton1Click:Connect(hideCurrentModal)
        elseif modal.Main:FindFirstChild("ExitButton") then
            modal.Main.ExitButton.MouseButton1Click:Connect(hideCurrentModal)
        end
    end
    
    BlinkMain.Player.ChangeModal.On(function(uiName)
        if uiName == nil then
            hideCurrentModal(false)
        else
            changeModal(uiName)
        end
    end)

    -- Init hud buttons
    local hudButtons = player.PlayerGui:WaitForChild("Buttons")
    local hudButtonsMain = hudButtons:WaitForChild("Main")
    for _, button in pairs(hudButtonsMain:WaitForChild("ButtonsMain"):GetChildren()) do
        if not button:IsA("TextButton") then continue end
        setupModalButton(button)
    end
    for _, button in pairs(hudButtonsMain:WaitForChild("ButtonsBottom"):GetChildren()) do
        if not button:IsA("TextButton") then continue end
        setupModalButton(button)
    end

    -- Init currency displays
    -- for _, frame in pairs (CollectionService:GetTagged("BoomBuxDisplay")) do
    --     frame.Label.Text = DataService:get({"Currencies", "BoomBux"})
    -- end
    -- DataService:getChangedSignal({"Currencies", "BoomBux"}):Connect(function(newValue)
    --     for _, frame in pairs (CollectionService:GetTagged("BoomBuxDisplay")) do
    --         frame.Label.Text = newValue
    --     end
    -- end)

    local canvasProps = {"AnchorPoint", "Position", "Size", "Parent", "ZIndex"}
    for _, v in pairs(CollectionService:GetTagged("CanvasRotated")) do -- Fix rotated elements
        local canvas = Instance.new("CanvasGroup")
        canvas.BackgroundTransparency = 1
        for _, prop in pairs(canvasProps) do
            canvas[prop] = v[prop]
        end

        v.AnchorPoint = Vector2.new(0.5, 0.5)
        v.Size = UDim2.fromScale(1, 1)
        v.Position = UDim2.fromScale(0.5, 0.5)
        v.Parent = canvas
    end

end

export type UI = typeof(UI) & {

}

return UI