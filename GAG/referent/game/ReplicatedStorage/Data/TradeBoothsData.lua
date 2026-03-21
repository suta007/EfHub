local v1 = game:GetService("ReplicatedStorage")
require(v1.Data.TradeData)
local v_u_2 = game:GetService("Players")
return {
	["getPlayerId"] = function(p3)
		return ("Player_%*"):format(p3.UserId)
	end,
	["getPlayerById"] = function(p4)
		-- upvalues: (copy) v_u_2
		local v5 = string.match
		local v6 = tonumber(v5(p4, "Player_(%-*%d+)"))
		if v6 then
			return v_u_2:GetPlayerByUserId(v6)
		else
			return nil
		end
	end,
	["fee"] = 1,
	["applyFee"] = function(p7)
		local v8 = p7 * 0.99
		return math.max(v8, 0)
	end
}