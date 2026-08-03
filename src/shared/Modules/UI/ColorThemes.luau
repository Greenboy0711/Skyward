local themes = {}

themes.Themes = {
    ButtonRed = {BackgroundColor3 = Color3.fromRGB(255, 99, 99), UIStroke = Color3.fromRGB(198, 27, 27), Type = "Button"},
    ButtonGreen = {BackgroundColor3 = Color3.fromRGB(104, 255, 96), UIStroke = Color3.fromRGB(30, 198, 91), Type = "Button"}
}

function themes.toggleTheme(themeName, element)
    local theme = themes.Themes[themeName]
    if not theme then return end

    for prop, value in pairs(theme) do
        if prop == "Type" then continue end

        if prop == "UIStroke" then
            local stroke = element:FindFirstChild("UIStroke")
            if stroke then
                stroke.Color = value
            end

            if theme.Type == "Button" then
                local label = element:FindFirstChild("Label")
                if label then
                    label.UIStroke.Color = value
                end
            end
                
        else
            element[prop] = value
        end

    end
end

return themes