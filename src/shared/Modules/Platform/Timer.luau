return function (value, time)
    for i = time, 1, -1 do
        value.Value = i
        task.wait(1)
    end
end