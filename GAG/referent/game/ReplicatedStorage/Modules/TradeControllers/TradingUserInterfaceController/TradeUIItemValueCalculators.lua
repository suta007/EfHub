local v1 = game:GetService("ReplicatedStorage")
local v_u_2 = require(v1.Modules.CalculatePlantValue)
local v_u_3 = require(v1.Modules.CalculatePetValue)
local v_u_4 = require(v1.Modules.MutationHandler)
local v_u_5 = require(v1.Calculate_Weight)
return {
	["Pet"] = function(p6)
		-- upvalues: (copy) v_u_3
		return v_u_3(p6.data)
	end,
	["Holdable"] = function(p7)
		-- upvalues: (copy) v_u_5, (copy) v_u_2, (copy) v_u_4
		local v8 = v_u_5.Calculate_Weight(p7.data.Seed, p7.data.ItemName) * (p7.data.WeightMultiplier or 1)
		return v_u_2({
			["name"] = p7.data.ItemName,
			["variant"] = p7.data.Variant,
			["weight"] = v8,
			["mutationMultiplier"] = v_u_4:CalcValueMultiFromMuts(v_u_4:ExtractMutationsFromString(p7.data.MutationString)),
			["fruitVersion"] = p7.data.FruitVersion
		})
	end,
	["Packaged Seed"] = function(_)
		return 0
	end
}