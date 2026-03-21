local v1 = game:GetService("ReplicatedStorage")
local v_u_2 = require(v1.Modules.PetServices.ActivePetsService)
local v_u_3 = require(v1.Modules.GeneralTargettingService)
return {
	["Activate"] = function(p_u_4)
		-- upvalues: (copy) v_u_3, (copy) v_u_2
		v_u_3:CreateTargetingHandler({
			["OnConfirm"] = function(p5)
				-- upvalues: (ref) v_u_2, (copy) p_u_4
				print("Confirmed", p5)
				v_u_2:SetPetState(p_u_4:GetAttribute("UUID"), "TargetPlant", {
					["TargetedPlant"] = p5
				})
			end,
			["OnCancelled"] = function(...)
				print("Cancelled")
			end,
			["TargetType"] = "Plant",
			["Targeter"] = p_u_4
		})
	end
}