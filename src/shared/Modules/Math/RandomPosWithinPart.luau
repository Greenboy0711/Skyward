return function(part: Part): Vector3
  return Vector3.new(
    math.random(part.Position.X - part.Size.X/2, part.Position.X + part.Size.X/2), 
    part.Position.Y, 
    math.random(part.Position.Z - part.Size.Z/2, part.Position.Z + part.Size.Z/2)
  )
end
