local Viewport = {}

function Viewport.clear(viewport)
    for _, v in pairs(viewport:GetChildren()) do
        if v:IsA("Camera") or v:IsA("Model") then v:Destroy() end
    end
end

function Viewport.initModel(viewport, model)
    if not viewport or not model then return end
    model.Name = "ViewportModel"
    local camera = Instance.new("Camera")
    camera.Parent = viewport
    viewport.CurrentCamera = camera

    model.Parent = viewport
end

function Viewport.setModelPos(viewport, pivot)
    viewport.ViewportModel:PivotTo(viewport.Camera.CFrame * pivot)
end

return Viewport
