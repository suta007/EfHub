local v_u_1 = game:GetService("ReplicatedStorage")
local v_u_2 = require(v_u_1.Modules.CommaFormatNumber)
require(v_u_1.Modules.GiveServiceCommon.RewardDataTypes)
local v_u_3 = {
	"Seed Pack",
	"Chest",
	"Gear Box",
	"Gift Box",
	"Present",
	"Gift"
}
return {
	["Use"] = function(_, p4, p5)
		local v6 = require(game.ReplicatedStorage.Data.SeedPackData).Packs[p4]
		local v7 = ("Seed Pack Item \"%*\" is an invalid entry. Please fix"):format(p4)
		assert(v6, v7)
		return {
			["Type"] = "Seed Pack",
			["Value"] = p4,
			["Quantity"] = p5 or 1
		}
	end,
	["Format"] = function(_, p8)
		-- upvalues: (copy) v_u_3, (copy) v_u_2
		local v9 = p8.Quantity or 1
		local v10 = p8.Value
		local v11 = false
		for _, v12 in v_u_3 do
			local v13 = p8.Value
			if #v12 == 0 and true or v13:sub(-#v12) == v12 then
				v11 = true
				break
			end
		end
		if not v11 then
			v10 = v10 .. " Seed Pack"
		end
		return ("%*x %*"):format(v_u_2(v9), v10)
	end,
	["GetImage"] = function(_, p14)
		-- upvalues: (copy) v_u_1
		return require(v_u_1.Modules.ItemImageFinder)(p14.Value, "Seed Pack")
	end,
	["GetRarity"] = function(_, _)
		return "Common"
	end
}