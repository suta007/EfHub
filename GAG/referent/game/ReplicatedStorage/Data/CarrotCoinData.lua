local v1 = {}
local v2 = {
	["Products"] = {
		{
			["ProductId"] = 3498799492,
			["FallbackPrice"] = 99
		},
		{
			["ProductId"] = 3498801169,
			["FallbackPrice"] = 275
		},
		{
			["ProductId"] = 3498802125,
			["FallbackPrice"] = 499
		}
	}
}
v1.Shop = v2
function v1.GetCurrentDayString(p3)
	return ("%*%*%*"):format(p3:FormatUniversalTime("YYYY", "en-us"), p3:FormatUniversalTime("MM", "en-us"), (p3:FormatUniversalTime("DD", "en-us")))
end
return v1