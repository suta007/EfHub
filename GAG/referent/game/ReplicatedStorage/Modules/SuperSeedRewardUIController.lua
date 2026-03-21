local v1 = game:GetService("ReplicatedStorage")
local v2 = game:GetService("Players")
local v_u_3 = require(v1.Modules.GenericRewardsUIController)
require(v1.Modules.GiveServiceCommon.RewardDataTypes)
local v4 = require(v1.Data.SuperSeedData)
local v_u_5 = v2.LocalPlayer.PlayerGui:WaitForChild("Shop_UI")
local v_u_6 = {}
for _, v7 in v4 do
	local v8 = {
		["Reward"] = {
			["Type"] = "Seed",
			["Value"] = v7,
			["Quantity"] = 1,
			["Variant"] = nil,
			["RarityOverride"] = nil
		},
		["Chance"] = 1
	}
	table.insert(v_u_6, v8)
end
return {
	["Open"] = function(_)
		-- upvalues: (copy) v_u_3, (copy) v_u_6, (copy) v_u_5
		v_u_3:Open({
			["Title"] = "Super Seed Chances",
			["RewardData"] = v_u_6,
			["Breadcrumb"] = v_u_5,
			["DisplayOdds"] = false
		})
	end
}