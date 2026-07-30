return function(zone: GuiObject, obj: GuiObject) -- Centered around obj at 0,0
  local zonePos = zone.Position
  return UDim2.new(
    math.random(zonePos.X.Sc), 
    part.Position.Y, 
    math.random(part.Position.Z - part.Size.Z/2, part.Position.Z + part.Size.Z/2)
  )
end
