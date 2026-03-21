local v1 = {}
local v2 = {}
local v3 = {
	["Products"] = {
		{
			["ProductId"] = 3460376533,
			["GiftId"] = 3425758808,
			["FallbackPrice"] = 50
		},
		{
			["ProductId"] = 3460378135,
			["GiftId"] = 3425758810,
			["FallbackPrice"] = 250
		},
		{
			["ProductId"] = 3460378800,
			["GiftId"] = 3425758809,
			["FallbackPrice"] = 1000
		},
		{
			["ProductId"] = 3467173511,
			["GiftId"] = 0,
			["FallbackPrice"] = 200
		}
	},
	["Bundles"] = {
		{
			["ProductId"] = 3460379424,
			["GiftId"] = 3425758811,
			["FallbackPrice"] = 5000
		},
		{
			["ProductId"] = 3460379831,
			["GiftId"] = 3425758812,
			["FallbackPrice"] = 25000
		}
	}
}
v2.Tokens = v3
v1.Shop = v2
local v4 = {
	["TokensGained"] = {
		["Trades"] = 0,
		["TradeBooths"] = 0,
		["RobuxPurchases"] = 0,
		["Misc"] = 0
	},
	["TokensLost"] = {
		["Trades"] = 0,
		["TradeBooths"] = 0,
		["RobuxPurchases"] = 0,
		["Misc"] = 0
	}
}
v1.TokenAmountsTemplate = v4
function v1.GetCurrentDayString(p5)
	return ("%*%*%*"):format(p5:FormatUniversalTime("YYYY", "en-us"), p5:FormatUniversalTime("MM", "en-us"), (p5:FormatUniversalTime("DD", "en-us")))
end
return v1