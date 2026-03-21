game:GetService("ServerScriptService")
game:GetService("Players")
local v1 = game:GetService("ReplicatedStorage")
local v_u_2 = v1:WaitForChild("GameEvents"):WaitForChild("CraftingGlobalObjectService")
local v_u_3 = require(v1.Modules.DataService)
require(v1.Data.CraftingData.CraftingTypeRegistry)
local v_u_4 = require(v1.Data.CraftingData.CraftingObjectRegistry)
local v_u_5 = require(v1.Data.CraftingData.CraftingRecipeRegistry)
local v_u_6 = require(v1.Modules.DumpTable)
local v_u_32 = {
	["GetCraftingObjectData"] = function(_, p7)
		-- upvalues: (copy) v_u_3
		local v8 = v_u_3:GetData()
		local v9 = p7:GetAttribute("CraftingObjectId")
		if v9 then
			if p7:GetAttribute("CraftingObjectType") then
				return v8.CraftingData.GlobalCraftingObjectData[v9]
			end
			error((("CraftingService:GetCraftingDataForModel passed CraftingObject: %* does not have associated CraftingObjectType Attribute."):format((p7:GetFullName()))))
		else
			error((("CraftingService:GetCraftingDataForModel passed CraftingObject: %* does not have associated CraftingObjectId Attribute."):format((p7:GetFullName()))))
		end
	end,
	["GetIndividualCraftingMachineData"] = function(_, p10, p11)
		-- upvalues: (copy) v_u_32, (copy) v_u_5, (copy) v_u_4, (copy) v_u_6
		local v12 = v_u_32:GetCraftingObjectData(p10)
		if v12 then
			local _ = v_u_5.ItemRecipes[v12.RecipeId]
			if v_u_5 then
				if p10:GetAttribute("CraftingObjectId") then
					local v13 = p10:GetAttribute("CraftingObjectType")
					if v13 then
						local v14 = v_u_4[v13]
						if v14.Slots[p11] then
							return v12.MachineData[p11]
						else
							return warn("Could not get data cause foundslot does not exist for", p11, v13, v_u_6(v14.Slots))
						end
					else
						error("CraftingService:GetIndividualCraftingMachineData passed CraftingObject: ", p10, "does not have associated CraftingObjectType Attribute.")
						return
					end
				else
					error("CraftingService:GetIndividualCraftingMachineData passed CraftingObject: ", p10, "does not have associated CraftingObjectId Attribute.")
					return
				end
			else
				error((("CraftingService:GetIndividualCraftingMachineData passed RecipeId %* does not have associated CraftingRecipeRegistryData."):format(p11)))
				return
			end
		else
			return
		end
	end,
	["SetRecipe"] = function(_, p15, p16, p17)
		-- upvalues: (copy) v_u_2
		return v_u_2:FireServer("SetRecipe", p15, p16, p17)
	end,
	["InputItem"] = function(_, p18, p19, p20, p21)
		-- upvalues: (copy) v_u_2
		return v_u_2:FireServer("InputItem", p18, p19, p20, p21)
	end,
	["Craft"] = function(_, p22, p23)
		-- upvalues: (copy) v_u_2
		return v_u_2:FireServer("Craft", p22, p23)
	end,
	["Claim"] = function(_, p24, p25, p26)
		-- upvalues: (copy) v_u_2
		return v_u_2:FireServer("Claim", p24, p25, p26)
	end,
	["Skip"] = function(_, p27, p28, p29)
		-- upvalues: (copy) v_u_2
		return v_u_2:FireServer("AuthoriseSkip", p27, p28, p29)
	end,
	["Cancel"] = function(_, p30, p31)
		-- upvalues: (copy) v_u_2
		return v_u_2:FireServer("Cancel", p30, p31)
	end
}
return v_u_32