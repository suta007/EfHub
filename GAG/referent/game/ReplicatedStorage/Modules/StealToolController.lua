local v1 = game:GetService("ReplicatedStorage")
local v_u_2 = game:GetService("RunService")
local v3 = game:GetService("Players")
local v_u_4 = require(v1.Modules.GetFarm)
local v_u_5 = require(v1.Modules.PlantOutlineController)
require(v1.Modules.ProximityPromptController)
local v_u_6 = v3.LocalPlayer
local v_u_7 = v_u_4(v_u_6)
local v_u_11 = {
	["Active"] = false,
	["DisabledPrompts"] = {},
	["Conn"] = nil,
	["SetEnabled"] = function(_, p8)
		-- upvalues: (copy) v_u_11, (copy) v_u_2, (ref) v_u_7, (copy) v_u_4, (copy) v_u_6, (copy) v_u_5
		if p8 then
			if not v_u_11.Active then
				v_u_11.Active = true
				v_u_11.Conn = v_u_2.PreRender:Connect(function()
					-- upvalues: (ref) v_u_7, (ref) v_u_4, (ref) v_u_6, (ref) v_u_5
					if not v_u_7 then
						v_u_7 = v_u_4(v_u_6)
					end
					local v9 = v_u_5:GetActivePrompt()
					if v9 and (v_u_7 and not v9:IsDescendantOf(v_u_7)) then
						if v9.ActionText ~= "Steal" then
							v9.ActionText = "Steal"
						end
						if v9.HoldDuration ~= 2 then
							v9.HoldDuration = 2
						end
					end
				end)
				return
			end
		elseif v_u_11.Active then
			v_u_11.Active = false
			if v_u_11.Conn then
				v_u_11.Conn:Disconnect()
				v_u_11.Conn = nil
			end
			if not v_u_7 then
				v_u_7 = v_u_4(v_u_6)
			end
			local v10 = v_u_5:GetActivePrompt()
			if v10 and (v_u_7 and not v10:IsDescendantOf(v_u_7)) then
				if v10.ActionText ~= "Collect" then
					v10.ActionText = "Collect"
				end
				if v10.HoldDuration ~= 0 then
					v10.HoldDuration = 0
				end
			end
		end
	end
}
return v_u_11