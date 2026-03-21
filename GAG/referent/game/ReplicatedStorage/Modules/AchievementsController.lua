local v_u_1 = game:GetService("ReplicatedStorage")
local v2 = game:GetService("Players")
require(v_u_1.Data.AchievementsData)
local v_u_3 = require(v_u_1.Modules.AchievementsShared)
local v_u_4 = v2.LocalPlayer
return {
	["Claim"] = function(_, p5, p6)
		-- upvalues: (copy) v_u_1
		v_u_1.GameEvents.AchievementService.Claim:FireServer(p5, p6)
	end,
	["IsClaimed"] = function(_, p7, p8)
		-- upvalues: (copy) v_u_3, (copy) v_u_4
		return v_u_3:IsClaimed(v_u_4, p7, p8)
	end,
	["IsCompleted"] = function(_, p9, p10)
		-- upvalues: (copy) v_u_3, (copy) v_u_4
		return v_u_3:IsCompleted(v_u_4, p9, p10)
	end,
	["Observe"] = function(_, p11, p12, p13)
		-- upvalues: (copy) v_u_3, (copy) v_u_4
		return v_u_3:Observe(v_u_4, p11, p12, p13)
	end,
	["GetSeasonData"] = function(_, p14)
		-- upvalues: (copy) v_u_3, (copy) v_u_4
		return v_u_3:GetSeasonData(v_u_4, p14)
	end
}