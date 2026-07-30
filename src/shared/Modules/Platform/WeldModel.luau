return function (main: BasePart, model: Model, weldDescendants: boolean?)
    local t
    if weldDescendants then
        t = model:GetDescendants()
    else
        t = model:GetChildren()
    end
    for _, v in pairs(t) do
        if v ~= main and (v:IsA("BasePart") or v:IsA("MeshPart")) then
            local weld = Instance.new("WeldConstraint")
            weld.Part0 = main
            weld.Part1 = v
            weld.Parent = main
        end
    end
end
