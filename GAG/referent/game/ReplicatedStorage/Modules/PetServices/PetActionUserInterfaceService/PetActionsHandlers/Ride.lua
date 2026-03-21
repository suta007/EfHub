local v1 = game:GetService("ReplicatedStorage")
local v_u_2 = game:GetService("Players").LocalPlayer
require(v1.Modules.PetServices.PetsService)
local v_u_3 = require(v1.Modules.PetServices.ActivePetsService)
require(v1.Modules.Notification)
require(v1.Types.PetTypes)
require(v1.Modules.Notification)
local _ = v1.GameEvents.PetBoostService
local v_u_4 = require(v1.Data.PetRegistry.PetMutationRegistry)
local v_u_5 = require(v1.Modules.PetServices.PetRidingService)
return {
	["Verifier"] = function(p6)
		-- upvalues: (copy) v_u_3, (copy) v_u_2, (copy) v_u_4
		local v7 = p6:GetAttribute("OWNER")
		local v8 = v_u_3:GetPetData(v_u_2.Name, p6:GetAttribute("UUID"))
		local v9
		if v7 == v_u_2.Name then
			v9 = v_u_4.EnumToPetMutation[v8.MutationType] == "Rideable"
		else
			v9 = false
		end
		return v9
	end,
	["Activate"] = function(p10)
		-- upvalues: (copy) v_u_5
		v_u_5:RidePet(p10:GetAttribute("UUID"))
	end
}