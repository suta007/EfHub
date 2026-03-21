local v1 = game:GetService("ReplicatedStorage")
local v_u_2 = require(v1.Modules.CosmeticServices.UserInterface.CosmeticRotationXUserInterfaceService)
local v_u_3 = require(v1.Modules.CosmeticServices.ModelMovement.CosmeticRotationXService)
return function(p_u_4)
	-- upvalues: (copy) v_u_2, (copy) v_u_3
	return {
		["InputBegan"] = function()
			-- upvalues: (ref) v_u_2, (copy) p_u_4, (ref) v_u_3
			v_u_2:Toggle(true)
			p_u_4:Toggle(false)
			v_u_3:SetTarget(p_u_4.Target)
		end,
		["InputEnded"] = function()
			-- upvalues: (ref) v_u_2, (copy) p_u_4, (ref) v_u_3
			v_u_2:Toggle(false)
			p_u_4:Toggle(true)
			v_u_3:SetTarget(nil)
		end
	}
end