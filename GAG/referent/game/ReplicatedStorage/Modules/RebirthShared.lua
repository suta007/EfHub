local v1 = game:GetService("ReplicatedStorage")
local v2 = game:GetService("RunService")
local v3 = game:GetService("Players")
require(v1.Data.DefaultData)
local v_u_4 = require(v1.Data.RebirthConfigData)
local v_u_5 = require(v1.Modules.RebirthUnlocksSharedService)
local v_u_6
if v2:IsServer() then
	v_u_6 = require(game:GetService("ServerScriptService").Modules.DataService)
else
	v_u_6 = require(v1.Modules.DataService)
end
local v_u_7 = v3.LocalPlayer
local v_u_8 = v2:IsServer()
v2:IsStudio()
return {
	["IsRebirthAvailable"] = function(_, p9)
		-- upvalues: (copy) v_u_8, (copy) v_u_6, (copy) v_u_7, (copy) v_u_4
		local v10
		if v_u_8 then
			v10 = v_u_6:GetPlayerData(p9)
		elseif p9 == v_u_7 then
			v10 = v_u_6:GetData()
		else
			v10 = nil
		end
		if v10 then
			return v10.RebirthData.LastRebirthTime + v_u_4.RESET_TIME <= workspace:GetServerTimeNow()
		end
		warn((("RebirthShared:IsRebirthAvailable | Cannot find Player Data for %*"):format(p9)))
		return false
	end,
	["CalculatePrice"] = function(_, p11, p12)
		-- upvalues: (copy) v_u_5, (copy) v_u_4
		if p12 and (v_u_5:HasBeenAssignedABTest(p12) and p11 <= 6) then
			return v_u_4.REBIRTH_AB_TEST_PRICES[p11]
		else
			return v_u_4.REBIRTH_PRICE + v_u_4.REBIRTH_PRICE_INCREASE * p11
		end
	end
}