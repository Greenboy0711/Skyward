local FloatServiceServer = {}

function FloatServiceServer.init()
    
end

function FloatServiceServer.RenderStepped()
    -- pcall(function()
    --     local currentVelocity
    --     if self.ControlEnabled then
    --         currentVelocity = VecNew(character.Humanoid.MoveDirection.z * self["BallValues"].Speed, 0, character.Humanoid.MoveDirection.x * -self["BallValues"].Speed)
    --     end
    --     if character.Humanoid.MoveDirection == Vector3.new(0, 0, 0) then
    --         currentVelocity = VecNew(0,0,0)
    --     end
    --     velocityValue.Value += currentVelocity - prevVelocity
    --     velocity.AngularVelocity = velocityValue.Value
    --     prevVelocity = currentVelocity
    -- end)
end

type FloatServiceServer = typeof(FloatServiceServer) & {

}

return FloatServiceServer