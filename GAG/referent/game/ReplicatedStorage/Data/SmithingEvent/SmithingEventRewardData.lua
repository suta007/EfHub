local v1 = game:GetService("ReplicatedStorage")
local v2 = require(v1.Modules.GiveServiceCommon)
local v_u_3 = require(v1.Modules.PickRandom)
local v_u_4 = require(v1.Modules.CountDictionary)
local v5 = v2.Types
local v_u_6 = {
	[5] = {
		["Common"] = 50,
		["Uncommon"] = 30,
		["Rare"] = 20,
		["Legendary"] = 10
	},
	[10] = {
		["Common"] = 30,
		["Uncommon"] = 50,
		["Rare"] = 20,
		["Legendary"] = 10
	},
	[15] = {
		["Common"] = 30,
		["Uncommon"] = 30,
		["Rare"] = 30,
		["Legendary"] = 10
	},
	[20] = {
		["Common"] = 10,
		["Uncommon"] = 30,
		["Rare"] = 30,
		["Legendary"] = 20
	}
}
local v_u_7 = {}
local v8 = {
	["AlwaysGiveOne"] = {
		{
			["Type"] = "GiveItem",
			["Reward"] = v5.Gear:Use("Common Coal", 1),
			["Chance"] = 100
		},
		{
			["Type"] = "GiveItem",
			["Reward"] = v5.Gear:Use("Rare Coal", 1),
			["Chance"] = 30
		},
		{
			["Type"] = "GiveItem",
			["Reward"] = v5.Gear:Use("Legendary Coal", 1),
			["Chance"] = 10
		},
		{
			["Type"] = "GiveItem",
			["Reward"] = v5.Gear:Use("Dig Trinket", 1),
			["Chance"] = 10
		},
		{
			["Type"] = "GiveItem",
			["Reward"] = v5.Gear:Use("Divine Coal", 1),
			["Chance"] = 5
		}
	},
	["ExtraChance"] = 0.5,
	["PossibleExtras"] = {}
}
v_u_7.Common = v8
local v9 = {
	["AlwaysGiveOne"] = {
		{
			["Type"] = "GiveItem",
			["Reward"] = v5.Gear:Use("Common Coal", 1),
			["Chance"] = 100
		},
		{
			["Type"] = "GiveItem",
			["Reward"] = v5.Gear:Use("Rare Coal", 1),
			["Chance"] = 30
		},
		{
			["Type"] = "GiveItem",
			["Reward"] = v5.Gear:Use("Legendary Coal", 1),
			["Chance"] = 10
		},
		{
			["Type"] = "GiveItem",
			["Reward"] = v5.Gear:Use("Dig Trinket", 1),
			["Chance"] = 10
		},
		{
			["Type"] = "GiveItem",
			["Reward"] = v5.Gear:Use("Divine Coal", 1),
			["Chance"] = 5
		}
	},
	["ExtraChance"] = 0.01,
	["PossibleExtras"] = {
		{
			["Type"] = "Weather",
			["WeatherName"] = "Thunderstorm",
			["Chance"] = 1
		},
		{
			["Type"] = "Weather",
			["WeatherName"] = "SmithingFever",
			["Chance"] = 7
		},
		{
			["Type"] = "Weather",
			["WeatherName"] = "Rain",
			["Chance"] = 2
		},
		{
			["Type"] = "Weather",
			["WeatherName"] = "Heatwave",
			["Chance"] = 2
		},
		{
			["Type"] = "Weather",
			["WeatherName"] = "Sandstorm",
			["Chance"] = 2
		},
		{
			["Type"] = "Weather",
			["WeatherName"] = "Gale",
			["Chance"] = 2
		},
		{
			["Type"] = "Weather",
			["WeatherName"] = "SmithingStorm",
			["Chance"] = 10
		}
	}
}
v_u_7.Uncommon = v9
local v10 = {
	["AlwaysGiveOne"] = {
		{
			["Type"] = "GiveItem",
			["Reward"] = v5.Gear:Use("Common Coal", 1),
			["Chance"] = 100
		},
		{
			["Type"] = "GiveItem",
			["Reward"] = v5.Gear:Use("Rare Coal", 1),
			["Chance"] = 30
		},
		{
			["Type"] = "GiveItem",
			["Reward"] = v5.Gear:Use("Legendary Coal", 1),
			["Chance"] = 10
		},
		{
			["Type"] = "GiveItem",
			["Reward"] = v5.Gear:Use("Dig Trinket", 1),
			["Chance"] = 10
		},
		{
			["Type"] = "GiveItem",
			["Reward"] = v5.Gear:Use("Divine Coal", 1),
			["Chance"] = 5
		}
	},
	["ExtraChance"] = 0.05,
	["PossibleExtras"] = {
		{
			["Type"] = "Weather",
			["WeatherName"] = "Thunderstorm",
			["Chance"] = 1
		},
		{
			["Type"] = "Weather",
			["WeatherName"] = "SmithingFever",
			["Chance"] = 7
		},
		{
			["Type"] = "Weather",
			["WeatherName"] = "Rain",
			["Chance"] = 2
		},
		{
			["Type"] = "Weather",
			["WeatherName"] = "Heatwave",
			["Chance"] = 2
		},
		{
			["Type"] = "Weather",
			["WeatherName"] = "Sandstorm",
			["Chance"] = 2
		},
		{
			["Type"] = "Weather",
			["WeatherName"] = "Gale",
			["Chance"] = 2
		},
		{
			["Type"] = "Weather",
			["WeatherName"] = "SmithingStorm",
			["Chance"] = 10
		}
	}
}
v_u_7.Rare = v10
local v11 = {
	["AlwaysGiveOne"] = {
		{
			["Type"] = "GiveItem",
			["Reward"] = v5.Gear:Use("Common Coal", 1),
			["Chance"] = 100
		},
		{
			["Type"] = "GiveItem",
			["Reward"] = v5.Gear:Use("Rare Coal", 1),
			["Chance"] = 30
		},
		{
			["Type"] = "GiveItem",
			["Reward"] = v5.Gear:Use("Legendary Coal", 1),
			["Chance"] = 10
		},
		{
			["Type"] = "GiveItem",
			["Reward"] = v5.Gear:Use("Dig Trinket", 1),
			["Chance"] = 10
		},
		{
			["Type"] = "GiveItem",
			["Reward"] = v5.Gear:Use("Divine Coal", 1),
			["Chance"] = 5
		}
	},
	["ExtraChance"] = 0.08,
	["PossibleExtras"] = {
		{
			["Type"] = "Weather",
			["WeatherName"] = "Thunderstorm",
			["Chance"] = 1
		},
		{
			["Type"] = "Weather",
			["WeatherName"] = "SmithingFever",
			["Chance"] = 7
		},
		{
			["Type"] = "Weather",
			["WeatherName"] = "Rain",
			["Chance"] = 2
		},
		{
			["Type"] = "Weather",
			["WeatherName"] = "Heatwave",
			["Chance"] = 2
		},
		{
			["Type"] = "Weather",
			["WeatherName"] = "Sandstorm",
			["Chance"] = 2
		},
		{
			["Type"] = "Weather",
			["WeatherName"] = "Gale",
			["Chance"] = 2
		},
		{
			["Type"] = "Weather",
			["WeatherName"] = "SmithingStorm",
			["Chance"] = 10
		}
	}
}
v_u_7.Legendary = v11
local v_u_12 = {
	{
		{
			["Type"] = "GiveItem",
			["Reward"] = v5.Egg:Use("Common Egg", 10),
			["Chance"] = 100
		}
	},
	{
		{
			["Type"] = "GiveItem",
			["Reward"] = v5.Egg:Use("Common Egg", 20),
			["Chance"] = 100
		}
	},
	{
		{
			["Type"] = "GiveItem",
			["Reward"] = v5.Egg:Use("Common Egg", 30),
			["Chance"] = 100
		}
	},
	{
		{
			["Type"] = "GiveItem",
			["Reward"] = v5.Egg:Use("Common Egg", 40),
			["Chance"] = 100
		}
	}
}
local function v_u_20(p13)
	local v14 = 0
	for _, v15 in pairs(p13) do
		v14 = v14 + v15
	end
	local v16 = Random.new():NextNumber(0, v14)
	local v17 = 0
	for v18, v19 in pairs(p13) do
		v17 = v17 + v19
		if v16 <= v17 then
			return v18
		end
	end
	return "Common"
end
return {
	["RewardsData"] = v_u_7,
	["PickReward"] = function(_, p21)
		-- upvalues: (copy) v_u_6, (copy) v_u_20, (copy) v_u_7, (copy) v_u_3
		local v22 = -1
		for v23, v29 in v_u_6 do
			if v22 < v23 then
				v22 = v23
			end
			if p21 <= v23 then
				::l6::
				local v25 = v_u_7[v_u_20(v29)]
				local v26 = v25.AlwaysGiveOne
				local v27 = { v_u_3.One(v26) }
				if #v25.PossibleExtras > 0 and Random.new():NextNumber(0, 1) <= v25.ExtraChance then
					local v28 = v_u_3.One(v25.PossibleExtras)
					table.insert(v27, v28)
				end
				return v27
			end
		end
		local v29 = v_u_6[v22]
		goto l6
	end,
	["PickStationReward"] = function(_, p30)
		-- upvalues: (copy) v_u_4, (copy) v_u_12, (copy) v_u_3
		if p30 >= 0 and v_u_4(v_u_12) >= p30 then
			return v_u_3.One(v_u_12[p30]).Reward
		end
		warn((("SmithingEventRewardData:PickStationReward | Cannot find Station Index %*"):format(p30)))
		return nil
	end
}