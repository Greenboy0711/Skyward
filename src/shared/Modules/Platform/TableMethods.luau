local methods = {}

function methods.getTableType(t)
    assert(type(t) == "table", "Supplied argument is not a table")
    for i,_ in pairs(t) do
        if type(i) ~= "number" then
            return "dictionary"
        end
    end
    return "array"
end

function methods.createListFromDic(dictionary)
    local result = {}

    for i, _ in pairs(dictionary) do
        table.insert(result, i)
    end

    return result
end

return methods