local convert = {}

function convert.UDimToBlink(pos: UDim2)
    return {xScale = pos.X.Scale, xOffset = pos.X.Offset, yScale = pos.Y.Scale, yOffset = pos.Y.Offset}
end

function convert.BlinkToUDim(arr)
    return UDim2.new(arr.xScale, arr.xOffset, arr.yScale, arr.yOffset)
end

return convert