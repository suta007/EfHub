local v1 = game:GetService("ReplicatedStorage")
local v2 = game:GetService("Players")
local v_u_3 = require(v1.Modules.PetServices.ActivePetsService)
local v_u_4 = v2.LocalPlayer
return {
	["Verifier"] = function(p5)
		-- upvalues: (copy) v_u_4
		return p5:GetAttribute("OWNER") == v_u_4.Name
	end,
	["Activate"] = function(p6)
		-- upvalues: (copy) v_u_3
		print("Follow Player")
		v_u_3:SetPetState(p6:GetAttribute("UUID"), "FollowPlayer")
	end
}