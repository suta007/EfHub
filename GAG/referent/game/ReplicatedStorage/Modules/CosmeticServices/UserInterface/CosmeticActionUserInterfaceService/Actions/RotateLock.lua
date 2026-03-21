game:GetService("Players")
local v1 = game:GetService("ReplicatedStorage")
require(v1.Modules.CosmeticServices.CosmeticService)
local v_u_2 = require(v1.Modules.PlaySound)
local v_u_3 = require(v1.Modules.CosmeticServices.UserInterface.CosmeticRotationLockUserInterfaceService)
local v_u_4 = require(v1.Modules.CosmeticServices.ModelMovement.CosmeticMovementService)
return function(_)
	-- upvalues: (copy) v_u_3, (copy) v_u_2, (copy) v_u_4
	return {
		["InputBegan"] = function() end,
		["InputEnded"] = function()
			-- upvalues: (ref) v_u_3, (ref) v_u_2, (ref) v_u_4
			local v5 = v_u_3:Toggle()
			v_u_2("rbxassetid://103926661258479", v5 and Random.new():NextNumber(1, 1.1) or Random.new():NextNumber(0.8, 0.9)).Volume = 0.25
			v_u_4:ToggleRotationLock(v5)
		end,
		["InstantAction"] = true
	}
end