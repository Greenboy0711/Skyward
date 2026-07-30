return function(uiRegion: GuiObject, uiObject: GuiObject, singlePoint: boolean, xPoint: number, yPoint: number)
    local regPos = uiRegion.AbsolutePosition
    local regSize = uiRegion.AbsoluteSize

    local objPos = uiObject.AbsolutePosition
    local objSize = uiObject.AbsoluteSize

    if singlePoint then
        return (objPos.X + objSize.X * xPoint >= regPos.X) and (objPos.X + objSize.X * xPoint <= regPos.X + regSize.X) and
            (objPos.Y + objSize.Y * yPoint >= regPos.Y) and (objPos.Y + objSize.Y * yPoint <= regPos.Y + regSize.Y)
    else -- Entire object must be within region
        return (objPos.X >= regPos.X) and (objPos.X + objSize.X <= regPos.X + regSize.X) and
            (objPos.Y >= regPos.Y) and (objPos.Y + objSize.Y <= regPos.Y + regSize.Y)
    end
end
