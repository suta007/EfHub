local v1 = game:GetService("ReplicatedStorage")
local v_u_2 = v1.GameEvents:WaitForChild("PetEggIncubatorService")
local v_u_3 = require(v1.Modules.DataService)
local v_u_4 = require(v1.Modules.GetPlayerFromFarm)
return {
	["GetMachineData"] = function(_, p5)
		-- upvalues: (copy) v_u_3
		if p5 and p5.Parent then
			local v6 = p5.Parent:GetAttribute("CosmeticUUID")
			if v6 then
				local v7 = v_u_3:GetData()
				if v7 then
					return v7.PetsData.PetEggIncubatorData.IncubatorData[v6]
				end
			end
		else
			return
		end
	end,
	["SubmitItem"] = function(_, p8)
		-- upvalues: (copy) v_u_2
		v_u_2.SubmitItem:FireServer(p8)
	end,
	["InputEgg"] = function(_, p9)
		-- upvalues: (copy) v_u_2
		v_u_2.InputEgg:FireServer(p9)
	end,
	["RemoveEgg"] = function(_, p10)
		-- upvalues: (copy) v_u_2
		v_u_2.RemoveEgg:FireServer(p10)
	end,
	["Boost"] = function(_, p11)
		-- upvalues: (copy) v_u_4, (copy) v_u_2
		if p11.Parent then
			local v12 = p11.Parent:GetAttribute("CosmeticUUID")
			if v12 then
				local v13 = p11:FindFirstAncestorOfClass("Model")
				if v13 then
					local v14 = v_u_4(v13)
					if v14 then
						v_u_2.Boost:FireServer(v14, v12)
					end
				else
					return
				end
			else
				return
			end
		else
			return
		end
	end
}