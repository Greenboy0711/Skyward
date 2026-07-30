return function(connection)
    if connection then
        connection:Disconnect()
    end

    return nil
end
