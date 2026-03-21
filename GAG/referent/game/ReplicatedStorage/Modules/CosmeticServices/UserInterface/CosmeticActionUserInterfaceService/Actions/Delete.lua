local v1 = game:GetService("ReplicatedStorage")
local v_u_2 = require(v1.Modules.CosmeticServices.CosmeticService)
local v_u_3 = require(v1.Modules.PlaySound)
return function(p_u_4)
	-- upvalues: (copy) v_u_2, (copy) v_u_3
	return {
		["InputBegan"] = function() end,
		["InputEnded"] = function()
			-- upvalues: (copy) p_u_4, (ref) v_u_2, (ref) v_u_3
			local v5 = p_u_4.Target
			if v5 then
				local v6 = v5.Parent
				if v6 then
					v_u_2:Unequip(v6:GetAttribute("CosmeticUUID"))
					p_u_4:Toggle(false)
					v_u_3("rbxassetid://139578759536123").Volume = 0.5
				end
			else
				return
			end
		end,
		["InstantAction"] = true
	}
end