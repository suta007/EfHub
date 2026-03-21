local v1 = game:GetService("ReplicatedStorage")
local v_u_2 = require(v1.Modules.PetServices.ActivePetsService)
return {
	["Activate"] = function(p3)
		-- upvalues: (copy) v_u_2
		v_u_2:SetPetState(p3:GetAttribute("UUID"), "Idle")
	end
}