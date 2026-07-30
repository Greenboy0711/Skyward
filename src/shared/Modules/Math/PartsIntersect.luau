local function checkAxis(pos1, size1, pos2, size2, axis)
    return (pos1[axis] >= pos2[axis] - size2[axis] and pos1[axis] <= pos2[axis] + size2[axis])
            or (pos2[axis] >= pos1[axis] - size1[axis] and pos2[axis] <= pos1[axis] + size1[axis])
end

return function(pos1: Vector3, size1: Vector3, pos2: Vector3, size2: Vector3)
    return checkAxis(pos1, size1, pos2, size2, "X") and checkAxis(pos1, size1, pos2, size2, "Y")
            and checkAxis(pos1, size1, pos2, size2, "Z")
end
