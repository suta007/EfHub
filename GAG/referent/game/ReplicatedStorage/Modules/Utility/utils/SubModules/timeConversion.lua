return {
	["secondsToHHMMSS"] = function(p1)
		local v2 = p1 // 60
		local v3 = v2 // 60
		local v4 = p1 - v2 * 60
		local v5 = v2 - v3 * 60
		local v6 = string.format("%02i", v5) .. ":" .. string.format("%02i", v4)
		return string.format("%02i", v3) .. ":" .. v6
	end,
	["secondsToMMSS"] = function(p7)
		local v8 = p7 // 60
		local v9 = p7 - v8 * 60
		return string.format("%02i", v8) .. ":" .. string.format("%02i", v9)
	end,
	["secondsToXhXmXs"] = function(p10)
		local v11 = math.floor(p10)
		local v12 = v11 // 3600
		local v13 = v11 % 3600 // 60
		local v14 = v11 % 60
		if v12 > 0 then
			return string.format("%dh %dm %ds", v12, v13, v14)
		elseif v13 > 0 then
			return string.format("%dm %ds", v13, v14)
		else
			return v14 .. "s"
		end
	end
}