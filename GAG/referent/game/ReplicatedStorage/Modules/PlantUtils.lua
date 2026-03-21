game:GetService("ReplicatedStorage")
local v_u_1 = game:GetService("Players")
return {
	["GetPlantKeyFromModel"] = function(p2, p3)
		local v4 = p2:GetAttribute(p3)
		if v4 then
			return v4
		end
		local v5 = p2:FindFirstChild("Item_Seed")
		if v5 then
			v5 = v5.Value
		end
		if not v5 then
			warn((("PlantUtils.GetPlantKeyFromModel | No seed found on %*!"):format(p2)))
			return nil
		end
		local v6 = p2:FindFirstChild("Item_String")
		local v7 = v6 and v6.Value or p2.Name
		if v7 then
			return ("%*-%*"):format(v5, v7)
		end
		warn((("PlantUtils.GetPlantKeyFromModel | No type found on %*!"):format(p2)))
		return nil
	end,
	["IsPlantGrown"] = function(p8)
		local v9 = p8:FindFirstChild("Grow")
		if not v9 then
			warn((("PlantUtils.IsPlantGrown | No \"Grow\" child found in %* model!"):format(p8.Name)))
			return false
		end
		local v10 = p8:GetAttribute("MaxAge")
		if not v10 then
			warn((("PlantUtils.IsPlantGrown | No \"MaxAge\" child found in %* model!"):format(p8.Name)))
			return false
		end
		local v11 = v9:FindFirstChild("Age")
		if v11 then
			return v10 <= v11.Value
		end
		warn((("PlantUtils.IsPlantGrown | No \"Age\" child found in %* model!"):format(p8.Name)))
		return false
	end,
	["GetPlayerFromPlantModel"] = function(p12)
		-- upvalues: (copy) v_u_1
		local v13 = p12:GetAttribute("Owner")
		if v13 and v_u_1:GetPlayerByUserId(v13) then
			return v_u_1:GetPlayerByUserId(v13)
		end
		local v14 = p12.Parent
		if not v14 then
			warn("PlantUtils.GetPlayerFromPlantModel | \"Plants_Physical\" folder not found!")
			return nil
		end
		local v15 = v14.Parent
		if not v15 then
			warn("PlantUtils.GetPlayerFromPlantModel | \"Important\" folder not found!")
			return nil
		end
		local v16 = v15:FindFirstChild("Data")
		if not v16 then
			warn("PlantUtils.GetPlayerFromPlantModel | \"Data\" folder not found!")
			return nil
		end
		local v17 = v16:FindFirstChild("Owner")
		if not v17 then
			warn("PlantUtils.GetPlayerFromPlantModel | Owner StringValue not found!")
			return nil
		end
		local v18 = v_u_1:FindFirstChild(v17.Value)
		if v18 then
			return v18
		end
		warn("PlantUtils.GetPlayerFromPlantModel | Player not found!")
		return nil
	end
}