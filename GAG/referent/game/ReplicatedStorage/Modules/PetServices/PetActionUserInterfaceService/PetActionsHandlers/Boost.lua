local v1 = game:GetService("ReplicatedStorage")
local v_u_2 = game:GetService("Players").LocalPlayer
require(v1.Modules.PetServices.PetsService)
require(v1.Modules.PetServices.ActivePetsService)
local v_u_3 = require(v1.Modules.Notification)
require(v1.Types.PetTypes)
local v_u_4 = v1.GameEvents.PetBoostService
return {
	["Verifier"] = function(p5)
		-- upvalues: (copy) v_u_2
		local v6 = v_u_2.Character
		if v6 then
			local v7 = v6:FindFirstChildWhichIsA("Tool")
			if v7 then
				local v8
				if p5:GetAttribute("OWNER") == v_u_2.Name then
					v8 = v7:HasTag("PetBoost")
				else
					v8 = false
				end
				return v8
			end
		else
			warn("No Character? how?")
		end
	end,
	["Activate"] = function(p9)
		-- upvalues: (copy) v_u_2, (copy) v_u_3, (copy) v_u_4
		local v10 = v_u_2.Character
		if v10 then
			local v11 = v10:FindFirstChildWhichIsA("Tool")
			if not v11 then
				return v_u_3:CreateNotification("You are not holding a pet boost!")
			end
			if not v11:HasTag("PetBoost") then
				return v_u_3:CreateNotification("You are not holding a pet boost!")
			end
			v_u_4:FireServer("ApplyBoost", p9:GetAttribute("UUID"))
		else
			warn("No Character? how?")
		end
	end
}