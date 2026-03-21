return {
	["SheckleTradingEnabled"] = true,
	["Fee"] = 0,
	["ItemTypes"] = {
		"Pet",
		"Holdable",
		"Packaged Seed",
		"TradeBoothSkin"
	},
	["ItemLimit"] = 12,
	["ButtonCooldown"] = 5,
	["ApplyFee"] = function(p1)
		if p1 <= 10 then
			return p1
		end
		local v2 = p1 * 1
		return math.max(v2, 0)
	end
}