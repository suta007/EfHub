local v1 = game:GetService("ReplicatedStorage")
require(v1.Types.PetTypes)
local v2 = {
	["Shocked"] = {
		["EnumId"] = "a",
		["Boosts"] = {},
		["Passives"] = { "Shocked Pet Mutation" },
		["AvaliableFromMutationMachine"] = true,
		["Chance"] = 10,
		["ValueMulti"] = 100,
		["Color"] = Color3.fromRGB(255, 255, 100)
	}
}
local v3 = {
	["EnumId"] = "b",
	["Boosts"] = {
		{
			["BoostType"] = "PASSIVE_BOOST",
			["BoostAmount"] = 0.1
		}
	},
	["Passives"] = { "Golden Pet Mutation" },
	["AvaliableFromMutationMachine"] = true,
	["Chance"] = 20,
	["ValueMulti"] = 100,
	["Color"] = Color3.fromRGB(255, 225, 0)
}
v2.Golden = v3
local v4 = {
	["EnumId"] = "c",
	["Boosts"] = {
		{
			["BoostType"] = "PASSIVE_BOOST",
			["BoostAmount"] = 0.2
		}
	},
	["Passives"] = { "Rainbow Pet Mutation" },
	["AvaliableFromMutationMachine"] = true,
	["Chance"] = 10,
	["ValueMulti"] = 100,
	["Color"] = Color3.fromRGB(4, 175, 236)
}
v2.Rainbow = v4
local v5 = {
	["EnumId"] = "d",
	["Boosts"] = {
		{
			["BoostType"] = "PET_XP_BOOST",
			["BoostAmount"] = 0.3
		}
	},
	["Passives"] = { "Shiny Pet Mutation" },
	["AvaliableFromMutationMachine"] = true,
	["Chance"] = 100,
	["ValueMulti"] = 10,
	["Color"] = Color3.fromRGB(145, 207, 221)
}
v2.Shiny = v5
v2.Windy = {
	["EnumId"] = "e",
	["Boosts"] = {},
	["Passives"] = { "Windy Pet Mutation" },
	["AvaliableFromMutationMachine"] = true,
	["Chance"] = 30,
	["ValueMulti"] = 2,
	["Color"] = Color3.fromRGB(162, 185, 209)
}
v2.Frozen = {
	["EnumId"] = "f",
	["Boosts"] = {
		{}
	},
	["Passives"] = { "Frozen Pet Mutation" },
	["AvaliableFromMutationMachine"] = true,
	["Chance"] = 30,
	["ValueMulti"] = 10,
	["Color"] = Color3.fromRGB(108, 184, 255)
}
local v6 = {
	["EnumId"] = "g",
	["Boosts"] = {
		{
			["BoostType"] = "PET_XP_BOOST",
			["BoostAmount"] = 0.5
		}
	},
	["Passives"] = { "Inverted Pet Mutation" },
	["AvaliableFromMutationMachine"] = true,
	["Chance"] = 50,
	["ValueMulti"] = 10,
	["Color"] = Color3.fromRGB(128, 128, 128)
}
v2.Inverted = v6
v2.Rideable = {
	["EnumId"] = "h",
	["Boosts"] = {
		{}
	},
	["Passives"] = {},
	["AvaliableFromMutationMachine"] = false,
	["Chance"] = 0,
	["ValueMulti"] = 1,
	["Color"] = Color3.fromRGB(255, 255, 255)
}
local v7 = {
	["EnumId"] = "i",
	["Boosts"] = {
		{
			["BoostType"] = "SIZE_MODIFICATION",
			["BoostAmount"] = 2
		}
	},
	["Passives"] = { "Mega Pet Mutation", "Mega Pet Mutation Bonus" },
	["AvaliableFromMutationMachine"] = true,
	["Chance"] = 20,
	["ValueMulti"] = 1,
	["Color"] = Color3.fromRGB(255, 90, 90)
}
v2.Mega = v7
local v8 = {
	["EnumId"] = "j",
	["Boosts"] = {
		{
			["BoostType"] = "SIZE_MODIFICATION",
			["BoostAmount"] = -0.9
		}
	},
	["Passives"] = { "Tiny Pet Mutation", "Tiny Pet Mutation Bonus" },
	["AvaliableFromMutationMachine"] = true,
	["Chance"] = 20,
	["ValueMulti"] = 1,
	["Color"] = Color3.fromRGB(173, 216, 230)
}
v2.Tiny = v8
v2.IronSkin = {
	["EnumId"] = "k",
	["Boosts"] = {
		{}
	},
	["Passives"] = { "IronSkin Pet Mutation" },
	["AvaliableFromMutationMachine"] = false,
	["Chance"] = 0,
	["ValueMulti"] = 100,
	["Color"] = Color3.fromRGB(206, 206, 206)
}
v2.Radiant = {
	["EnumId"] = "l",
	["Boosts"] = {
		{}
	},
	["Passives"] = { "Radiant Pet Mutation" },
	["AvaliableFromMutationMachine"] = true,
	["Chance"] = 10,
	["ValueMulti"] = 100,
	["Color"] = Color3.fromRGB(248, 108, 38)
}
v2.Normal = {
	["EnumId"] = "m",
	["Boosts"] = {},
	["Passives"] = {},
	["AvaliableFromMutationMachine"] = false,
	["ValueMulti"] = 1,
	["Color"] = Color3.fromRGB(255, 255, 255)
}
v2.Ascended = {
	["EnumId"] = "n",
	["Boosts"] = {},
	["Passives"] = { "Ascended Pet Mutation" },
	["AvaliableFromMutationMachine"] = true,
	["Chance"] = 1,
	["ValueMulti"] = 100,
	["Color"] = Color3.fromRGB(247, 245, 184)
}
v2.Tranquil = {
	["EnumId"] = "o",
	["Boosts"] = {},
	["Passives"] = { "Tranquil Pet Mutation" },
	["AvaliableFromMutationMachine"] = false,
	["Chance"] = 0,
	["ValueMulti"] = 100,
	["Color"] = Color3.fromRGB(94, 247, 247)
}
local v9 = {
	["EnumId"] = "Z",
	["Boosts"] = {
		{
			["BoostType"] = "PASSIVE_BOOST",
			["BoostAmount"] = 0.3
		}
	},
	["Passives"] = { "Alienated Pet Mutation" },
	["AvaliableFromMutationMachine"] = false,
	["Chance"] = 0,
	["ValueMulti"] = 1,
	["Color"] = Color3.fromRGB(49, 255, 63)
}
v2.Alienated = v9
local v10 = {
	["EnumId"] = "Y",
	["Boosts"] = {
		{
			["BoostType"] = "PASSIVE_BOOST",
			["BoostAmount"] = 0.3
		}
	},
	["Passives"] = { "UFO Pet Mutation" },
	["AvaliableFromMutationMachine"] = false,
	["Chance"] = 0,
	["ValueMulti"] = 100,
	["Color"] = Color3.fromRGB(11, 163, 0)
}
v2.UFO = v10
v2.Corrupted = {
	["EnumId"] = "p",
	["Boosts"] = {},
	["Passives"] = { "Corrupted Pet Mutation" },
	["AvaliableFromMutationMachine"] = false,
	["Chance"] = 0,
	["ValueMulti"] = 100,
	["Color"] = Color3.fromRGB(176, 23, 26)
}
v2.Fried = {
	["EnumId"] = "q",
	["Boosts"] = {},
	["Passives"] = { "Fried Pet Mutation" },
	["AvaliableFromMutationMachine"] = false,
	["Chance"] = 0,
	["ValueMulti"] = 15,
	["Color"] = Color3.fromRGB(170, 99, 0)
}
v2.Aromatic = {
	["EnumId"] = "r",
	["Boosts"] = {},
	["Passives"] = { "Aromatic Pet Mutation" },
	["AvaliableFromMutationMachine"] = false,
	["Chance"] = 0,
	["ValueMulti"] = 100,
	["Color"] = Color3.fromRGB(162, 145, 57)
}
local v11 = {
	["EnumId"] = "s",
	["Boosts"] = {
		{
			["BoostType"] = "PASSIVE_BOOST",
			["BoostAmount"] = 0.05
		}
	},
	["Passives"] = { "Silver Pet Mutation" },
	["AvaliableFromMutationMachine"] = false,
	["Chance"] = 0,
	["ValueMulti"] = 10,
	["Color"] = Color3.fromRGB(222, 222, 222)
}
v2.Silver = v11
local v12 = {
	["EnumId"] = "t",
	["Boosts"] = {
		{
			["BoostType"] = "SIZE_MODIFICATION",
			["BoostAmount"] = 1.5
		}
	},
	["Passives"] = { "GiantBean Pet Mutation", "GiantBean Pet Mutation Bonus" },
	["AvaliableFromMutationMachine"] = false,
	["Chance"] = 0,
	["ValueMulti"] = 1,
	["Color"] = Color3.fromRGB(102, 153, 51)
}
v2.GiantBean = v12
v2.Glimmering = {
	["EnumId"] = "u",
	["Boosts"] = {},
	["Passives"] = { "Glimmering Pet Mutation" },
	["AvaliableFromMutationMachine"] = false,
	["Chance"] = 0,
	["ValueMulti"] = 1,
	["Color"] = Color3.fromRGB(255, 135, 245)
}
v2.Luminous = {
	["EnumId"] = "v",
	["Boosts"] = {},
	["Passives"] = { "Luminous Pet Mutation" },
	["AvaliableFromMutationMachine"] = false,
	["Chance"] = 0,
	["ValueMulti"] = 1,
	["Color"] = Color3.fromRGB(85, 170, 255)
}
v2.Nutty = {
	["EnumId"] = "w",
	["Boosts"] = {},
	["Passives"] = { "Nutty Pet Mutation" },
	["AvaliableFromMutationMachine"] = false,
	["Chance"] = 0,
	["ValueMulti"] = 1,
	["Color"] = Color3.fromRGB(154, 109, 69)
}
v2.Dreadbound = {
	["EnumId"] = "x",
	["Boosts"] = {},
	["Passives"] = { "Dreadbound Pet Mutation" },
	["AvaliableFromMutationMachine"] = false,
	["Chance"] = 0,
	["ValueMulti"] = 1,
	["Color"] = Color3.fromRGB(140, 45, 175)
}
local v13 = {
	["EnumId"] = "y",
	["Boosts"] = {
		{
			["BoostType"] = "PET_XP_BOOST",
			["BoostAmount"] = 0.6
		}
	},
	["Passives"] = { "Soulflame Pet Mutation" },
	["AvaliableFromMutationMachine"] = false,
	["Chance"] = 0,
	["ValueMulti"] = 1,
	["Color"] = Color3.fromRGB(255, 85, 40)
}
v2.Soulflame = v13
local v14 = {
	["EnumId"] = "z",
	["Boosts"] = {
		{
			["BoostType"] = "PASSIVE_BOOST",
			["BoostAmount"] = 0.08
		}
	},
	["Passives"] = { "Spectral Pet Mutation" },
	["AvaliableFromMutationMachine"] = false,
	["Chance"] = 0,
	["ValueMulti"] = 1,
	["Color"] = Color3.fromRGB(90, 200, 255)
}
v2.Spectral = v14
local v15 = {
	["EnumId"] = "A",
	["Boosts"] = {
		{
			["BoostType"] = "PASSIVE_BOOST",
			["BoostAmount"] = 0.22
		},
		{
			["BoostType"] = "SIZE_MODIFICATION",
			["BoostAmount"] = 1.25
		}
	},
	["Passives"] = { "Nightmare Pet Mutation" },
	["AvaliableFromMutationMachine"] = false,
	["Chance"] = 0,
	["ValueMulti"] = 1,
	["Color"] = Color3.fromRGB(255, 0, 100)
}
v2.Nightmare = v15
v2.Tethered = {
	["EnumId"] = "B",
	["Boosts"] = {},
	["Passives"] = { "Tethered Pet Mutation" },
	["AvaliableFromMutationMachine"] = false,
	["Chance"] = 0,
	["ValueMulti"] = 1,
	["Color"] = Color3.fromRGB(210, 171, 136)
}
v2.Aurora = {
	["EnumId"] = "H",
	["Boosts"] = {
		{}
	},
	["Passives"] = { "Aurora Pet Mutation" },
	["AvaliableFromMutationMachine"] = true,
	["Chance"] = 10,
	["ValueMulti"] = 10,
	["Color"] = Color3.fromRGB(165, 105, 255)
}
local v16 = {
	["EnumId"] = "I",
	["Boosts"] = {
		{
			["BoostType"] = "SIZE_MODIFICATION",
			["BoostAmount"] = 1.8
		},
		{
			["BoostType"] = "PET_XP_BOOST",
			["BoostAmount"] = 0.5
		}
	},
	["Passives"] = { "JUMBO Pet Mutation", "JUMBO Pet Mutation Bonus" },
	["AvaliableFromMutationMachine"] = false,
	["Chance"] = 0,
	["ValueMulti"] = 10,
	["Color"] = Color3.fromRGB(255, 170, 0)
}
v2.JUMBO = v16
local v17 = {
	["EnumId"] = "J",
	["Boosts"] = {
		{
			["BoostType"] = "PASSIVE_BOOST",
			["BoostAmount"] = 0.01
		}
	},
	["Passives"] = { "Oxpecker Pet Mutation" },
	["AvaliableFromMutationMachine"] = false,
	["Chance"] = 0,
	["ValueMulti"] = 1,
	["Color"] = Color3.fromRGB(170, 0, 0)
}
v2.Oxpecker = v17
local v18 = {
	["EnumId"] = "K",
	["Boosts"] = {
		{
			["BoostType"] = "PASSIVE_BOOST",
			["BoostAmount"] = 0.03
		}
	},
	["Passives"] = { "Giraffe Pet Mutation" },
	["AvaliableFromMutationMachine"] = false,
	["Chance"] = 0,
	["ValueMulti"] = 5,
	["Color"] = Color3.fromRGB(255, 215, 0)
}
v2.Giraffe = v18
local v19 = {
	["EnumId"] = "L",
	["Boosts"] = {
		{
			["BoostType"] = "PASSIVE_BOOST",
			["BoostAmount"] = 0.045
		}
	},
	["Passives"] = { "Rhino Pet Mutation" },
	["AvaliableFromMutationMachine"] = false,
	["Chance"] = 0,
	["ValueMulti"] = 10,
	["Color"] = Color3.fromRGB(211, 211, 211)
}
v2.Rhino = v19
local v20 = {
	["EnumId"] = "M",
	["Boosts"] = {
		{
			["BoostType"] = "PASSIVE_BOOST",
			["BoostAmount"] = 0.06
		}
	},
	["Passives"] = { "Crocodile Pet Mutation" },
	["AvaliableFromMutationMachine"] = false,
	["Chance"] = 0,
	["ValueMulti"] = 15,
	["Color"] = Color3.fromRGB(85, 170, 0)
}
v2.Crocodile = v20
local v21 = {
	["EnumId"] = "N",
	["Boosts"] = {
		{
			["BoostType"] = "PASSIVE_BOOST",
			["BoostAmount"] = 0.07
		}
	},
	["Passives"] = { "Lion Pet Mutation" },
	["AvaliableFromMutationMachine"] = false,
	["Chance"] = 0,
	["ValueMulti"] = 20,
	["Color"] = Color3.fromRGB(255, 255, 102)
}
v2.Lion = v21
local v22 = {
	["EnumId"] = "O",
	["Boosts"] = {
		{
			["BoostType"] = "PASSIVE_BOOST",
			["BoostAmount"] = 0.07
		}
	},
	["Passives"] = { "Forger Pet Mutation" },
	["AvaliableFromMutationMachine"] = false,
	["Chance"] = 0,
	["ValueMulti"] = 10,
	["Color"] = Color3.fromRGB(150, 150, 150)
}
v2.Forger = v22
local v23 = {
	["EnumId"] = "P",
	["Boosts"] = {
		{
			["BoostType"] = "PASSIVE_BOOST",
			["BoostAmount"] = 0.3
		}
	},
	["Passives"] = { "HyperHunger Pet Mutation" },
	["AvaliableFromMutationMachine"] = false,
	["Chance"] = 0,
	["ValueMulti"] = 100,
	["Color"] = Color3.fromRGB(255, 255, 0)
}
v2.HyperHunger = v23
v2.Nocturnal = {
	["EnumId"] = "Q",
	["Boosts"] = {
		{}
	},
	["Passives"] = { "Nocturnal Pet Mutation" },
	["AvaliableFromMutationMachine"] = false,
	["Chance"] = 0,
	["ValueMulti"] = 15,
	["Color"] = Color3.fromRGB(85, 85, 255)
}
v2.Peppermint = {
	["EnumId"] = "R",
	["Boosts"] = {
		{}
	},
	["Passives"] = { "Peppermint Pet Mutation" },
	["AvaliableFromMutationMachine"] = false,
	["Chance"] = 0,
	["ValueMulti"] = 25,
	["Color"] = Color3.fromRGB(255, 134, 134)
}
v2.SpiritSparkle = {
	["EnumId"] = "SS",
	["Boosts"] = {
		{}
	},
	["Passives"] = { "Spirit Sparkle Pet Mutation" },
	["AvaliableFromMutationMachine"] = false,
	["Chance"] = 0,
	["ValueMulti"] = 25,
	["Color"] = Color3.fromRGB(217, 244, 255)
}
v2.ChristmasRally = {
	["EnumId"] = "S",
	["Boosts"] = {
		{}
	},
	["Passives"] = { "Christmas Rally Pet Mutation" },
	["AvaliableFromMutationMachine"] = false,
	["Chance"] = 0,
	["ValueMulti"] = 10,
	["Color"] = Color3.fromRGB(0, 200, 0)
}
v2.MerryNursery = {
	["EnumId"] = "T",
	["Boosts"] = {
		{}
	},
	["Passives"] = { "Merry Nursery Pet Mutation" },
	["AvaliableFromMutationMachine"] = false,
	["Chance"] = 0,
	["ValueMulti"] = 20,
	["Color"] = Color3.fromRGB(255, 215, 0)
}
v2.JollyDecorator = {
	["EnumId"] = "U",
	["Boosts"] = {
		{}
	},
	["Passives"] = { "Jolly Decorator Pet Mutation" },
	["AvaliableFromMutationMachine"] = false,
	["Chance"] = 0,
	["ValueMulti"] = 50,
	["Color"] = Color3.fromRGB(200, 0, 0)
}
local v24 = {
	["EnumId"] = "V",
	["Boosts"] = {
		{
			["BoostType"] = "PASSIVE_BOOST",
			["BoostAmount"] = 0.2
		},
		{
			["BoostType"] = "SIZE_MODIFICATION",
			["BoostAmount"] = 1.5
		}
	},
	["Passives"] = { "Giant Golem Pet Mutation" },
	["AvaliableFromMutationMachine"] = false,
	["Chance"] = 0,
	["ValueMulti"] = 100,
	["Color"] = Color3.fromRGB(120, 180, 255)
}
v2.GiantGolem = v24
v2.Fiery = {
	["EnumId"] = "W",
	["Boosts"] = {},
	["Passives"] = { "Fiery Pet Mutation" },
	["AvaliableFromMutationMachine"] = false,
	["Chance"] = 0,
	["ValueMulti"] = 100,
	["Color"] = Color3.fromRGB(255, 128, 0)
}
local v25 = {
	["EnumId"] = "X",
	["Boosts"] = {
		{
			["BoostType"] = "PASSIVE_BOOST",
			["BoostAmount"] = 0.3
		}
	},
	["Passives"] = { "Venom Pet Mutation" },
	["AvaliableFromMutationMachine"] = false,
	["Chance"] = 0,
	["ValueMulti"] = 100,
	["Color"] = Color3.fromRGB(149, 0, 255)
}
v2.Venom = v25
local v_u_26 = nil
function RollRandomMutation(p27)
	-- upvalues: (ref) v_u_26
	local v28 = v_u_26 or 1
	local v29 = Random.new():NextNumber() * v28
	local v30 = 0
	for v31, v32 in p27 do
		v30 = v30 + v32.Chance
		if v30 >= v29 then
			return v31
		end
	end
	return nil
end
local v33 = {}
local v34 = {}
local v35 = {}
for v36, v37 in v2 do
	v33[v37.EnumId] = v36
	v34[v36] = v37.EnumId
	if v37.AvaliableFromMutationMachine then
		v35[v36] = v37
	end
end
local v38 = 0
for _, v39 in v35 do
	v38 = v38 + v39.Chance
end
v_u_26 = v38
return {
	["PetMutationToEnum"] = v34,
	["EnumToPetMutation"] = v33,
	["MachineMutationTypes"] = v35,
	["PetMutationRegistry"] = v2,
	["RollRandomMutation"] = RollRandomMutation
}