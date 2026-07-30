-- `delta` can be any number within the constraint -255,255
-- negative = brighter, positive = darker
return function (Color : Color3, DeltaValue : number): Color3
    local H, S, V = Color:ToHSV()
    
    -- Subtracting the delta so that a positive input lowers the brightness (makes it darker)
	local newV = math.clamp(V - (DeltaValue / 255), 0, 1)
    
    return Color3.fromHSV(H, S, newV)
end