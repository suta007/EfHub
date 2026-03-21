local v_u_8 = {
	["RESET_TIME"] = 14400,
	["STARTING_COST"] = 1000000,
	["MAX_COST"] = 1e21,
	["COST_RATE_OF_INCREASE"] = 3,
	["BREAK_CHANCE_MULTIPLIER"] = 2,
	["BASE_BREAK_CHANCE"] = 2.5,
	["GetCost"] = function(_, p1)
		-- upvalues: (copy) v_u_8
		if p1 == 1 then
			return v_u_8.STARTING_COST
		end
		local v2 = v_u_8.STARTING_COST
		local v3 = v_u_8.COST_RATE_OF_INCREASE * p1 - 3
		local v4 = v2 * math.pow(10, v3)
		local v5 = v_u_8.MAX_COST
		return math.clamp(v4, 0, v5)
	end,
	["GetBreakChance"] = function(_, p6, p7)
		-- upvalues: (copy) v_u_8
		if p6 == 0 then
			return 0
		elseif p7 == 0 then
			return v_u_8.BASE_BREAK_CHANCE
		else
			return p7 * v_u_8.BREAK_CHANCE_MULTIPLIER
		end
	end
}
return v_u_8