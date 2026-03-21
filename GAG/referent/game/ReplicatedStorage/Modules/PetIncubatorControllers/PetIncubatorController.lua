local v1 = game:GetService("ReplicatedStorage")
local v_u_2 = v1.GameEvents:WaitForChild("PetIncubatorService")
local v_u_3 = require(v1.Modules.DataService)
return {
	["GetMachineData"] = function(_, p4)
		-- upvalues: (copy) v_u_3
		if p4 then
			local v5 = p4.Parent:GetAttribute("CosmeticUUID")
			if v5 then
				local v6 = v_u_3:GetData()
				if v6 then
					return v6.PetsData.PetIncubatorData.IncubatorData[v5]
				end
			end
		else
			return
		end
	end,
	["InputPet"] = function(_, p7)
		-- upvalues: (copy) v_u_2
		v_u_2.InputPet:FireServer(p7)
	end,
	["SubmitItem"] = function(_, p8)
		-- upvalues: (copy) v_u_2
		v_u_2.SubmitItem:FireServer(p8)
	end,
	["RemovePet"] = function(_, p9)
		-- upvalues: (copy) v_u_2
		v_u_2.RemovePet:FireServer(p9)
	end,
	["Boost"] = function(_, p10)
		-- upvalues: (copy) v_u_2
		v_u_2.Boost:FireServer(p10)
	end
}