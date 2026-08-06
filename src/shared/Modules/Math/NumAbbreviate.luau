local suffixes = {"", "K", "M", "B", "T", "QA", "QI", "SX", "SP", "OC", "NO", "DC", "UD", "DD", "TD", "QAD", "QID", "SXD", "SPD", "OCD", "NOD", "VG", "UVG"}
return function(n)
    -- Abhi's Number Abbreviation System V 2.4
    local s = tostring(math.floor(n))
    return string.sub(s, 1, ((#s - 1) % 3) + 1) .. (suffixes)[math.floor((#s - 1) / 3) + 1]
end