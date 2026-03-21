local v1 = game:GetService("ReplicatedStorage")
game:GetService("RunService")
require(v1.Modules.UpdateService)
require(v1.Data.AchievementsData.Types)
local v2 = require(v1.Modules.SeasonPass.SeasonPassUtils)
local v3 = workspace:GetServerTimeNow()
local v_u_4 = v2.GetCurrentSeason(v3)
local v_u_5 = ("Season %*"):format(v_u_4 - 1)
local v_u_6 = ("Season %*"):format(v_u_4)
local v_u_7 = ("Season %*"):format(v_u_4 + 1)
local v_u_8 = nil
local v_u_9 = nil
local v_u_10 = nil
local v_u_13 = {
	["SwitchToNewSeason"] = function(p11)
		-- upvalues: (ref) v_u_5, (ref) v_u_6, (ref) v_u_7, (copy) v_u_13
		v_u_5 = v_u_6
		v_u_6 = ("Season %*"):format(p11)
		v_u_7 = nil
		v_u_13.LoadSeasonPassData()
	end,
	["LoadSeasonPassData"] = function()
		-- upvalues: (ref) v_u_6, (ref) v_u_8, (copy) v_u_13, (copy) v_u_4, (ref) v_u_5, (ref) v_u_9, (ref) v_u_7, (ref) v_u_10
		if v_u_6 then
			local v12 = script:WaitForChild(("%*Data"):format((v_u_6:gsub(" ", ""))), 5)
			if not v12 then
				return nil
			end
			v_u_8 = require(v12)
			v_u_13.CurrentSeasonNum = v_u_4
			v_u_13.CurrentSeason = v_u_6
			v_u_13.InfRewards = v_u_8.InfRewards
			v_u_13.FreeRewards = v_u_8.FreeRewards
			v_u_13.PremiumRewards = v_u_8.PremiumRewards
			v_u_13.IncludesItems = v_u_8.IncludesItems
			v_u_13.ShopItems = v_u_8.ShopItems
		end
		if v_u_5 then
			v_u_9 = require(script[("%*Data"):format((v_u_5:gsub(" ", "")))])
			v_u_13.PreviousSeason = v_u_5
			v_u_13.PreviousSeasonData = v_u_9
		end
		if v_u_7 then
			v_u_10 = require(script[("%*Data"):format((v_u_5:gsub(" ", "")))])
			v_u_13.NextSeason = v_u_7
		end
	end
}
v_u_13.LoadSeasonPassData()
return v_u_13