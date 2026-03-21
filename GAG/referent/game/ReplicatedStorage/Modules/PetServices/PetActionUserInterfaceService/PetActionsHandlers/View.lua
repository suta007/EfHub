local v1 = game:GetService("ReplicatedStorage")
require(v1.Modules.PetServices.ActivePetsService)
local v_u_2 = require(v1.Modules.PetServices.PetCardUserInterfaceService)
local v_u_3 = require(v1.Modules.ActivePetsUIController)
return {
	["Activate"] = function(p4)
		-- upvalues: (copy) v_u_2, (copy) v_u_3
		v_u_2:SetTarget(p4)
		v_u_2:Toggle(true)
		v_u_3:Close()
	end
}