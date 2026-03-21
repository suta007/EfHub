local v1 = game:GetService("ReplicatedStorage")
local v_u_2 = game:GetService("CollectionService")
local v_u_3 = require(v1.Modules.DataService)
local v_u_4 = require(v1.Modules.GetFarm)
require(v1.Data.CookingPotType)
local v_u_25 = {
	["GetCookingPotData"] = function(_, p5, p6)
		-- upvalues: (copy) v_u_3
		if p5 then
			if p6 then
				local v7 = v_u_3:GetData(p5)
				if v7 then
					if p6 == "OLD_KITCHEN_COOKING_EVENT" then
						return v7.CookingPot
					else
						local v8 = v7.SaveSlots.SelectedSlot
						if v8 then
							local v9 = v7.CookingKit[v8]
							if v9 then
								local _ = v9[p6] == nil
								return v9[p6]
							else
								warn("CookingPotServerUtils:GetCookingPotData | Couldn\'t get cooking kit data!")
								return nil
							end
						else
							warn("CookingPotServerUtils:GetCookingPotData | Couldn\'t get selected save slot!")
							return nil
						end
					end
				else
					warn("CookingPotClientUtils:GetCookingPotData | Couldn\'t get player data!")
					return nil
				end
			else
				warn("CookingPotClientUtils:GetCookingPotData | No UUID given!")
				return nil
			end
		else
			warn("CookingPotClientUtils:GetCookingPotData | No Player given!")
			return nil
		end
	end,
	["GetAllCookingPotModels"] = function(_, p10)
		-- upvalues: (copy) v_u_4
		local v11 = v_u_4(p10)
		local v12 = {}
		if not v11 then
			return v12
		end
		for _, v13 in v11.Important.Cosmetic_Physical:GetChildren() do
			local v14 = v13:FindFirstChild("Cooking Kit")
			if v14 then
				table.insert(v12, v14)
			end
		end
		return v12
	end,
	["GetAllCookingPotUUIDs"] = function(_, p15)
		-- upvalues: (copy) v_u_4
		local v16 = v_u_4(p15)
		local v17 = {}
		if not v16 then
			return v17
		end
		for _, v18 in v16.Important.Cosmetic_Physical:GetChildren() do
			local v19 = v18:FindFirstChild("Cooking Kit")
			if v19 and v19.Parent:GetAttribute("CosmeticUUID") then
				table.insert(v17, v19)
			end
		end
		return v17
	end,
	["GetCookingPotModel"] = function(_, p20, p21)
		-- upvalues: (copy) v_u_2, (copy) v_u_25
		if p20 then
			if p21 then
				if p21 == "OLD_KITCHEN_COOKING_EVENT" then
					print("CookingPotClientUtils:GetCookingPotModel | Using old kitchen event pot...")
					local v22 = v_u_2:GetTagged("CookingEventModel")[1]
					if v22 then
						return v22
					end
					warn("CookingPotClientUtils:GetCookingPotModel | No model found! Using baseplate...")
					return nil
				else
					local v23 = v_u_25:GetAllCookingPotModels(p20)
					if not v23 then
						warn("CookingPotClientUtils:GetCookingPotModel | No models found!")
						return nil
					end
					for _, v24 in v23 do
						if v24.Parent:GetAttribute("CosmeticUUID") == p21 then
							return v24
						end
					end
					warn("CookingPotClientUtils:GetCookingPotModel | Model not found!")
					return nil
				end
			else
				warn("CookingPotClientUtils:GetCookingPotModel | No UUID given!")
				return nil
			end
		else
			warn("CookingPotClientUtils:GetCookingPotModel | No Player given!")
			return nil
		end
	end
}
return v_u_25