local v1 = game:GetService("ReplicatedStorage")
require(v1.Modules.GiveServiceCommon)
local v2 = game:GetService("RunService"):IsStudio()
local v3 = require(v1.Modules.IsDev)
return {
	["REWARD_FILL_TIME"] = v2 and 20 or (v3 and 1800 or 43200),
	["GEAR_LIFETIME"] = v2 and 120 or (v3 and 3660 or 604860),
	["RewardSets"] = {
		["DEFAULT"] = require(script.StockingRewardData)
	},
	["PickRandom"] = function(p4)
		local v5 = 0
		for _, v6 in p4 do
			v5 = v5 + (v6.Chance or 1)
		end
		local v7 = Random.new():NextNumber() * v5
		local v8 = 0
		for _, v9 in p4 do
			v8 = v8 + (v9.Chance or 1)
			if v7 <= v8 then
				return v9
			end
		end
	end
}