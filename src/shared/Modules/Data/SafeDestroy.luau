return function(parent, childName)
    if parent:FindFirstChild(childName) then
        parent[childName]:Destroy()
    else
        return false
    end

    return true
end
