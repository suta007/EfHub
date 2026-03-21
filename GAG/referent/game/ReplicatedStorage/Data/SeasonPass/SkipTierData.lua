local v1 = game:GetService("ReplicatedStorage")
local v2 = require(v1.Data.DevProductIds)
require(v1.Data.SeasonPass.SeasonPassStaticData)
local v_u_3 = {
	3411693828,
	3411693832,
	3411693838,
	3411693830,
	3411693836,
	3411693829,
	3411693837,
	3411693840,
	3411693834,
	3411693839
}
return {
	["GetAllIds"] = function()
		-- upvalues: (copy) v_u_3
		return v_u_3
	end,
	["GetSkipAllId"] = function(p4)
		-- upvalues: (copy) v_u_3
		local v5 = p4 / 5
		local v6 = math.ceil(v5)
		local v7 = #v_u_3
		return v_u_3[math.clamp(v6, 1, v7)]
	end,
	["GetSkipTierId"] = v2.SkipSeasonPassTier
}