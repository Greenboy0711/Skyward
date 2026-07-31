local rng = Random.new()

return function(mean, stdDev)
    local u1 = rng:NextNumber()
    local u2 = rng:NextNumber()

    local z = math.sqrt(-2 * math.log(u1)) *
              math.cos(2 * math.pi * u2)

    return mean + z * stdDev
end