function IsSafe(levels)
    local n = #levels
    if n < 2 then return true end

    local direction = nil
    for i = 1, n - 1 do
        local diff = levels[i + 1] - levels[i]
        if math.abs(diff) < 1 or math.abs(diff) > 3 then
            return false
        end
        if direction == nil then
            direction = (diff > 0) and "increasing" or "decreasing"
        elseif (direction == "increasing" and diff < 0) or
               (direction == "decreasing" and diff > 0) then
            return false
        end
    end
    return true
end

function Solution2(input)
    local file = io.open(input, "r")
    if not file then return end

    local safe_reports = 0

    for line in file:lines() do
        local levels = {}
        for str in string.gmatch(line, "%S+") do
            table.insert(levels, tonumber(str))
        end

        local found_safe = IsSafe(levels)
        if not found_safe then
            for i = 1, #levels do
                local temp = {table.unpack(levels)}
                table.remove(temp, i)
                if IsSafe(temp) then
                    found_safe = true
                    break
                end
            end
        end

        if found_safe then
            safe_reports = safe_reports + 1
        end
    end

    file:close()
    print(safe_reports)
end

Solution2("input.txt")

