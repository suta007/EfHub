local v_u_1 = {
	{
		["ReceiverSheckles"] = 10000,
		["GiftMaximumValue"] = 100000
	},
	{
		["ReceiverSheckles"] = 100000,
		["GiftMaximumValue"] = 2000000
	},
	{
		["ReceiverSheckles"] = 10000000,
		["GiftMaximumValue"] = 1000000000
	},
	{
		["ReceiverSheckles"] = 1000000000,
		["GiftMaximumValue"] = 1000000000000
	}
}
return {
	["GiftingLimits"] = v_u_1,
	["VerifyGift"] = function(p2, p3)
		-- upvalues: (copy) v_u_1
		if type(p2) == "number" then
			if type(p3) == "number" then
				for _, v4 in v_u_1 do
					if v4.ReceiverSheckles > p2 and p3 > v4.GiftMaximumValue then
						return false
					end
				end
				return true
			else
				warn((("Invalid gift value: %*"):format(p3)))
				return false
			end
		else
			warn((("Invalid receiver sheckles: %*"):format(p2)))
			return false
		end
	end
}