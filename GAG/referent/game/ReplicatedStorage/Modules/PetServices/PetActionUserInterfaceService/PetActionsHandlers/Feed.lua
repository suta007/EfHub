local v1 = game:GetService("ReplicatedStorage")
local v2 = game:GetService("Players")
require(v1.Modules.PetServices.PetsService)
local v_u_3 = v2.LocalPlayer
local v_u_4 = require(v1.Modules.PetServices.ActivePetsService)
local v_u_5 = require(v1.Modules.Notification)
local v_u_6 = v1.GameEvents.PetBoostService
return {
	["Verifier"] = function(p7)
		-- upvalues: (copy) v_u_3
		return p7:GetAttribute("OWNER") == v_u_3.Name
	end,
	["Activate"] = function(p8)
		-- upvalues: (copy) v_u_3, (copy) v_u_6, (copy) v_u_5, (copy) v_u_4
		local v9 = v_u_3.Character
		if v9 then
			local v10 = v9:FindFirstChildWhichIsA("Tool")
			if v10 and v10:HasTag("PetBoost") then
				v_u_6:FireServer("ApplyBoost", p8:GetAttribute("UUID"))
			else
				if not v10 then
					return v_u_5:CreateNotification("You are not holding a fruit!")
				end
				if not v10:HasTag("FruitTool") then
					return v_u_5:CreateNotification("You are not holding a fruit!")
				end
				v_u_4:Feed(p8:GetAttribute("UUID"))
			end
		else
			return
		end
	end
}