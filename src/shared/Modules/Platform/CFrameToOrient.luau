return function (cf: CFrame, inRad)
	local rx, ry, rz = cf:ToOrientation()
    if inRad then
        return Vector3.new(rx, ry, rz)
    else
        return Vector3.new(math.deg(rx), math.deg(ry), math.deg(rz))
    end
end