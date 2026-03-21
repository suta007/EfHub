local v1 = {}
local v2 = {
	["Products"] = {
		{
			["ProductId"] = 3520248432,
			["FallbackPrice"] = 129
		},
		{
			["ProductId"] = 3520249205,
			["FallbackPrice"] = 325
		},
		{
			["ProductId"] = 3520249204,
			["FallbackPrice"] = 599
		}
	}
}
v1.Shop = v2
function v1.GetCurrentDayString(p3)
	return ("%*%*%*"):format(p3:FormatUniversalTime("YYYY", "en-us"), p3:FormatUniversalTime("MM", "en-us"), (p3:FormatUniversalTime("DD", "en-us")))
end
return v1