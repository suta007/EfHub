local v1 = game:GetService("ReplicatedStorage"):WaitForChild("Assets"):WaitForChild("DiggingTreasureModels")
local v_u_2 = {}
local v3 = {
	["Square"] = {
		["Model"] = v1.Default:FindFirstChild("Square"),
		["DimensionX"] = 2,
		["DimensionY"] = 2,
		["RotationOffset"] = CFrame.Angles(0, 0, 0),
		["RewardRotationOffset"] = CFrame.Angles(0, 0, 0)
	},
	["Short"] = {
		["Model"] = v1.Default:FindFirstChild("Short"),
		["DimensionX"] = 2,
		["DimensionY"] = 1,
		["RotationOffset"] = CFrame.Angles(0, 0, -1.5707963267948966),
		["RewardRotationOffset"] = CFrame.Angles(0, 0, -1.5707963267948966)
	},
	["Long"] = {
		["Model"] = v1.Default:FindFirstChild("Long"),
		["DimensionX"] = 4,
		["DimensionY"] = 1,
		["RotationOffset"] = CFrame.Angles(0, 0, 0),
		["RewardRotationOffset"] = CFrame.Angles(0, 1.5707963267948966, 0)
	},
	["Rectangle"] = {
		["Model"] = v1.Default:FindFirstChild("Rectangle"),
		["DimensionX"] = 2,
		["DimensionY"] = 3,
		["RotationOffset"] = CFrame.Angles(-1.5707963267948966, 0, 0),
		["RewardRotationOffset"] = CFrame.Angles(-1.5707963267948966, 3.141592653589793, 3.141592653589793)
	}
}
v_u_2.DEFAULT = v3
local v4 = {
	["Square"] = {
		["Model"] = v1.Christmas:FindFirstChild("SquareTreasure"),
		["DimensionX"] = 2,
		["DimensionY"] = 2,
		["RotationOffset"] = CFrame.Angles(0, 0, 0),
		["RewardRotationOffset"] = CFrame.Angles(0, 0, 0)
	},
	["Short"] = {
		["Model"] = v1.Christmas:FindFirstChild("SmallTreasure"),
		["DimensionX"] = 2,
		["DimensionY"] = 1,
		["RotationOffset"] = CFrame.Angles(0, 0, -1.5707963267948966),
		["RewardRotationOffset"] = CFrame.Angles(0, 0, -1.5707963267948966)
	},
	["Long"] = {
		["Model"] = v1.Christmas:FindFirstChild("LongTreasure"),
		["DimensionX"] = 4,
		["DimensionY"] = 1,
		["RotationOffset"] = CFrame.Angles(0, 0, 0),
		["RewardRotationOffset"] = CFrame.Angles(0, 1.5707963267948966, 0)
	},
	["Rectangle"] = {
		["Model"] = v1.Christmas:FindFirstChild("RectangleTreasure"),
		["DimensionX"] = 2,
		["DimensionY"] = 3,
		["RotationOffset"] = CFrame.Angles(-1.5707963267948966, 0, 0),
		["RewardRotationOffset"] = CFrame.Angles(-1.5707963267948966, 3.141592653589793, 3.141592653589793)
	}
}
v_u_2.Christmas = v4
return {
	["PickRandomTreasureKey"] = function(p5)
		-- upvalues: (copy) v_u_2
		local v6 = {}
		local v7 = v_u_2[p5]
		if not v7 then
			v7 = v_u_2.DEFAULT
			warn("DiggingTreasureConfig | No theme found! Defaulting to [DEFAULT]")
		end
		for v8 in v7 do
			table.insert(v6, v8)
		end
		return v6[Random.new():NextInteger(1, #v6)]
	end,
	["TreasureConfigData"] = v_u_2
}