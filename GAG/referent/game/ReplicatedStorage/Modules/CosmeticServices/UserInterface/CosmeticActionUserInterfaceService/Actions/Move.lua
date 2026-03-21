local v1 = game:GetService("ReplicatedStorage")
local v_u_2 = require(v1.Modules.CosmeticServices.UserInterface.CosmeticMovementUserInterfaceService)
require(v1.Modules.GetMouseToWorld)
local v_u_3 = require(v1.Modules.CosmeticServices.ModelMovement.CosmeticMovementService)
local v_u_4 = require(v1.Modules.PlaySound)
return function(p_u_5)
	-- upvalues: (copy) v_u_2, (copy) v_u_3, (copy) v_u_4
	return {
		["InputBegan"] = function()
			-- upvalues: (ref) v_u_2, (copy) p_u_5, (ref) v_u_3
			v_u_2:Toggle(true)
			p_u_5:Toggle(false)
			v_u_3:SetTarget(p_u_5.Target)
		end,
		["InputEnded"] = function()
			-- upvalues: (ref) v_u_2, (copy) p_u_5, (ref) v_u_3, (ref) v_u_4
			v_u_2:Toggle(false)
			p_u_5:Toggle(true)
			v_u_3:SetTarget(nil)
			v_u_4("rbxassetid://99990810464653").Volume = 0.5
		end
	}
end