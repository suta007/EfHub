return {
	["GetMaxLevel"] = function()
		return 50
	end,
	["CalculateLevel"] = function(p1)
		local v2 = p1 / 100
		local v3 = math.sqrt(v2)
		return math.floor(v3)
	end,
	["CalculateXPForLevel"] = function(p4)
		return p4 ^ 2 * 100
	end,
	["GetXPEarnedCurrentLevel"] = function(p5)
		local v6 = p5 / 100
		local v7 = math.sqrt(v6)
		return p5 - math.floor(v7) ^ 2 * 100
	end,
	["GetTotalXPForNextLevel"] = function(p8)
		local v9 = p8 / 100
		local v10 = math.sqrt(v9)
		local v11 = math.floor(v10)
		local v12 = v11 ^ 2 * 100
		return (v11 + 1) ^ 2 * 100 - v12
	end
}