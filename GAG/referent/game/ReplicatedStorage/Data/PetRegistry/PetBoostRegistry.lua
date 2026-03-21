local v_u_1 = game:GetService("ReplicatedStorage")
require(v_u_1.Types.PetTypes)
local v_u_2 = require(v_u_1.Data.PetRegistry.PetList)
local function v7(p3)
	-- upvalues: (copy) v_u_1
	local v4 = require(v_u_1.Modules.PetTraitsData)
	if not v4[p3] then
		warn((("PetBoostRegistry.GetListOfPetsWithTrait | No trait named %*!"):format(p3)))
		return {}
	end
	local v5 = {}
	for v6, _ in v4[p3] do
		table.insert(v5, v6)
	end
	return v5
end
local v8 = {}
local v9 = {
	["BaseValue"] = 1,
	["Amount"] = {
		["Small"] = 0.1,
		["Medium"] = 0.2,
		["Large"] = 0.3
	},
	["Time"] = {
		["Small"] = 300,
		["Medium"] = 300,
		["Large"] = 400
	}
}
v8.PASSIVE_BOOST = v9
local v10 = {
	["BaseValue"] = 1,
	["Amount"] = {
		["Small"] = 0.5,
		["Medium"] = 2,
		["Christmas"] = 4,
		["Smith"] = 5
	},
	["Time"] = {
		["Small"] = 43200,
		["Medium"] = 86400,
		["Christmas"] = 108000,
		["Smith"] = 129600
	}
}
v8.PET_XP_BOOST = v10
local v11 = {
	["BaseValue"] = 1,
	["Amount"] = {
		["Small"] = 10,
		["Medium"] = 30
	},
	["Time"] = {
		["Small"] = 10,
		["Medium"] = 30
	}
}
v8.SIZE_MODIFICATION = v11
local v12 = {
	["BaseValue"] = 1,
	["Amount"] = {
		["Small"] = 1,
		["Medium"] = 1,
		["Levelup"] = 1,
		["Acorn"] = 1,
		["Silver"] = 5,
		["Gold"] = 10,
		["Rainbow"] = 25,
		["Mega"] = 100,
		["Pumpkin"] = 1,
		["Beetle"] = 1
	},
	["Time"] = {
		["Small"] = 1,
		["Medium"] = 1,
		["Levelup"] = 1,
		["Acorn"] = 1,
		["Silver"] = 1,
		["Gold"] = 1,
		["Rainbow"] = 1,
		["Mega"] = 1,
		["Pumpkin"] = 1,
		["Beetle"] = 1
	}
}
v8.LEVEL_BOOST = v12
local v13 = {
	["BaseValue"] = 1,
	["Amount"] = {
		["Energy"] = 1,
		["Beetle"] = 1
	},
	["Time"] = {
		["Energy"] = 1,
		["Beetle"] = 1
	}
}
v8.ABILITY_REFRESH = v13
return {
	["BoostTypeToBaseValue"] = {
		["PASSIVE_BOOST"] = 1,
		["PET_XP_BOOST"] = 1,
		["SIZE_MODIFICATION"] = 1
	},
	["PetModelNameToBoostType"] = {
		["Toy"] = "PASSIVE_BOOST",
		["Treat"] = "PET_XP_BOOST",
		["Bowl"] = "SIZE_MODIFICATION",
		["Lollipop"] = "LEVEL_BOOST",
		["Chew"] = "ABILITY_REFRESH"
	},
	["BoostTypeToPetModelName"] = {
		["PASSIVE_BOOST"] = "Toy",
		["PET_XP_BOOST"] = "Treat",
		["SIZE_MODIFICATION"] = "Bowl",
		["LEVEL_BOOST"] = "Lollipop",
		["ABILITY_REFRESH"] = "Chew"
	},
	["CleanBoostType"] = {
		["PASSIVE_BOOST"] = "Passive Boost",
		["PET_XP_BOOST"] = "XP Boost",
		["SIZE_MODIFICATION"] = "Size Boost",
		["LEVEL_BOOST"] = "Level Boost",
		["ABILITY_REFRESH"] = "Ability Refresh"
	},
	["BoostTypeStatData"] = v8,
	["BoostPetWhitelist"] = {
		["Acorn Lollipop"] = v7("Fall"),
		["Pumpkin Lollipop"] = v7("Halloween"),
		["Beetle Lollipop"] = (function(p14)
			-- upvalues: (copy) v_u_1, (copy) v_u_2
			local v15 = require(v_u_1.Modules.PetTraitsData)
			local v16 = string.lower(p14) .. "$"
			for v17 in v_u_2 do
				if string.match(string.lower(v17), v16) and not v15[p14][v17] then
					v15.AddToTrait(v17, p14)
				end
			end
			if not v15[p14] then
				warn((("PetBoostRegistry.GetListOfPetsWithTrait | No trait named %*!"):format(p14)))
				return {}
			end
			local v18 = {}
			for v19, _ in v15[p14] do
				table.insert(v18, v19)
			end
			return v18
		end)("Beetle"),
		["Beetle Chew"] = v7("Beetle"),
		["Christmas Treat"] = v7("Christmas")
	},
	["ShouldDisplayConfirmationPrompt"] = {
		["Silver Lollipop"] = true,
		["Gold Lollipop"] = true,
		["Rainbow Lollipop"] = true,
		["Mega Lollipop"] = true
	}
}