local v1 = game:GetService("ReplicatedStorage")
local v_u_2 = require(v1.Data.SeasonPass.SeasonPassStaticData)
local v_u_3 = require(v1.Data.SeedData)
return {
	["CalculateLevel"] = function(p4)
		-- upvalues: (copy) v_u_2
		local v5 = p4 / v_u_2.XP_CONSTANT
		local v6 = math.sqrt(v5)
		return math.floor(v6)
	end,
	["CalculateXPForLevel"] = function(p7)
		-- upvalues: (copy) v_u_2
		return v_u_2.XP_CONSTANT * p7 ^ 2
	end,
	["GetXPEarnedCurrentLevel"] = function(p8)
		-- upvalues: (copy) v_u_2
		local v9 = p8 / v_u_2.XP_CONSTANT
		local v10 = math.sqrt(v9)
		local v11 = math.floor(v10)
		return p8 - v_u_2.XP_CONSTANT * v11 ^ 2
	end,
	["GetTotalXPForNextLevel"] = function(p12)
		-- upvalues: (copy) v_u_2
		local v13 = p12 / v_u_2.XP_CONSTANT
		local v14 = math.sqrt(v13)
		local v15 = math.floor(v14)
		local v16 = v_u_2.XP_CONSTANT * v15 ^ 2
		local v17 = v15 + 1
		return v_u_2.XP_CONSTANT * v17 ^ 2 - v16
	end,
	["GetXPFractionOfCurrentLevel"] = function(p18)
		-- upvalues: (copy) v_u_2
		local v19 = p18 / v_u_2.XP_CONSTANT
		local v20 = math.sqrt(v19)
		local v21 = math.floor(v20)
		local v22 = p18 - v_u_2.XP_CONSTANT * v21 ^ 2
		local v23 = p18 / v_u_2.XP_CONSTANT
		local v24 = math.sqrt(v23)
		local v25 = math.floor(v24)
		local v26 = v_u_2.XP_CONSTANT * v25 ^ 2
		local v27 = v25 + 1
		return v22 / (v_u_2.XP_CONSTANT * v27 ^ 2 - v26)
	end,
	["CalculateInfClaimCount"] = function(p28, p29)
		-- upvalues: (copy) v_u_2
		local v30 = v_u_2.MAX_LEVEL
		local v31 = (p28 - v_u_2.XP_CONSTANT * v30 ^ 2 - p29 * v_u_2.INF_REWARD_XP) / v_u_2.INF_REWARD_XP
		return math.floor(v31)
	end,
	["GetXPToReachNextLevel"] = function(p32)
		-- upvalues: (copy) v_u_2
		local v33 = p32 / v_u_2.XP_CONSTANT
		local v34 = math.sqrt(v33)
		local v35 = math.floor(v34)
		local v36 = p32 - v_u_2.XP_CONSTANT * v35 ^ 2
		local v37 = p32 / v_u_2.XP_CONSTANT
		local v38 = math.sqrt(v37)
		local v39 = math.floor(v38)
		local v40 = v_u_2.XP_CONSTANT * v39 ^ 2
		local v41 = v39 + 1
		return v_u_2.XP_CONSTANT * v41 ^ 2 - v40 - v36
	end,
	["GetRarityXPReward"] = function(p42)
		-- upvalues: (copy) v_u_3, (copy) v_u_2
		if v_u_3[p42] then
			local v43 = v_u_3[p42].SeedRarity
			return v_u_2.Rarity[v43]
		else
			warn((("SeasonPassUtils | No SeedData for %*"):format(p42)))
			return 0
		end
	end,
	["GetMutationXPReward"] = function(p44)
		-- upvalues: (copy) v_u_2
		local v45 = math.min(p44, 5)
		local v46 = math.clamp(v45, 1, 5)
		return v_u_2.MutationCount[v46]
	end,
	["ToggleButton"] = function(p47, p48, p49)
		-- upvalues: (copy) v_u_2
		local v50 = p47:FindFirstChild("UIStroke")
		local v51 = p47:FindFirstChild("TextLabel"):FindFirstChild("UIStroke")
		local v52 = p49 or "Green"
		p47.Interactable = p48
		local v53
		if p48 then
			v53 = v_u_2.ButtonColors[v52].Background
		else
			v53 = v_u_2.ButtonColors.Gray.Background
		end
		p47.BackgroundColor3 = v53
		local v54
		if p48 then
			v54 = v_u_2.ButtonColors[v52].ButtonStroke
		else
			v54 = v_u_2.ButtonColors.Gray.ButtonStroke
		end
		v50.Color = v54
		local v55
		if p48 then
			v55 = v_u_2.ButtonColors[v52].TextStroke
		else
			v55 = v_u_2.ButtonColors.Gray.TextStroke
		end
		v51.Color = v55
	end,
	["GetCurrentSeason"] = function(p56)
		-- upvalues: (copy) v_u_2
		return (p56 - v_u_2.START_TIME) // v_u_2.NextPass + 1
	end,
	["GetResetTime"] = function(p57)
		-- upvalues: (copy) v_u_2
		local v58 = (p57 - v_u_2.START_TIME) // v_u_2.NextPass + 1
		return v_u_2.START_TIME + v58 * v_u_2.NextPass
	end
}