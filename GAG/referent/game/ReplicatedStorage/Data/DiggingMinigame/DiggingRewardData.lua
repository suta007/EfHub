local v1 = game:GetService("ReplicatedStorage")
require(v1.Modules.GiveServiceCommon)
local v8 = {
	["RewardSets"] = {
		["DEFAULT"] = require(script.DefaultDigRewardData),
		["Christmas"] = require(script.ChristmasDigRewardData)
	},
	["PickRandom"] = function(p2)
		local v3 = 0
		for _, v4 in p2 do
			v3 = v3 + (v4.Chance or 1)
		end
		local v5 = Random.new():NextNumber() * v3
		local v6 = 0
		for _, v7 in p2 do
			v6 = v6 + (v7.Chance or 1)
			if v5 <= v6 then
				return v7
			end
		end
	end
}
return v8