local v1 = game:GetService("ReplicatedStorage")
local v_u_2 = game:GetService("UserInputService")
local v_u_10 = {
	["DeviceChanged"] = require(v1.Modules.Signal).new(),
	["GetCurrentDevice"] = function(_)
		-- upvalues: (copy) v_u_2
		local v3 = v_u_2:GetLastInputType()
		return v3 == Enum.UserInputType.Touch and "Touch" or ((v3 == Enum.UserInputType.Keyboard or string.find(v3.Name, "Mouse", 1, true)) and "PC" or (string.find(v3.Name, "Gamepad", 1, true) and "Gamepad" or "PC"))
	end,
	["Observe"] = function(_, p_u_4)
		-- upvalues: (copy) v_u_10
		local v_u_5 = v_u_10.DeviceChanged:Connect(function()
			-- upvalues: (copy) p_u_4, (ref) v_u_10
			task.spawn(p_u_4, v_u_10:GetCurrentDevice())
		end)
		task.spawn(p_u_4, v_u_10:GetCurrentDevice())
		return function()
			-- upvalues: (copy) v_u_5
			v_u_5:Disconnect()
		end
	end,
	["Start"] = function(_)
		-- upvalues: (copy) v_u_10, (copy) v_u_2
		local v_u_6 = nil
		local function v8()
			-- upvalues: (ref) v_u_10, (ref) v_u_6
			local v7 = v_u_10:GetCurrentDevice()
			if v7 ~= v_u_6 then
				v_u_6 = v7
				v_u_10.DeviceChanged:Fire(v7)
			end
		end
		v_u_2.LastInputTypeChanged:Connect(v8)
		local v9 = v_u_10:GetCurrentDevice()
		if v9 ~= v_u_6 then
			v_u_6 = v9
			v_u_10.DeviceChanged:Fire(v9)
		end
	end
}
task.spawn(v_u_10.Start, v_u_10)
return v_u_10