local v1 = game:GetService("ReplicatedStorage")
local v2 = game:GetService("SoundService")
local v_u_3 = game:GetService("Players")
local v_u_4 = require(v1.Modules.Trove)
local v_u_5 = require(v1.Modules.Observers)
local v_u_6 = require(v1.Modules.DeviceController)
local v_u_7 = v2.Hover
local v_u_8 = v2.Click
local v13 = {
	["Start"] = function(_)
		-- upvalues: (copy) v_u_6, (copy) v_u_5, (copy) v_u_4, (copy) v_u_7, (copy) v_u_8, (copy) v_u_3
		local v_u_9 = v_u_6:GetCurrentDevice()
		v_u_6:Observe(function(p10)
			-- upvalues: (ref) v_u_9
			v_u_9 = p10
		end)
		v_u_5.observeTag("Button", function(p11)
			-- upvalues: (ref) v_u_4, (ref) v_u_9, (ref) v_u_7, (ref) v_u_8
			if not p11:IsA("GuiButton") then
				return nil
			end
			local v12 = v_u_4.new()
			v12:Add(p11.MouseEnter:Connect(function()
				-- upvalues: (ref) v_u_9, (ref) v_u_7
				if v_u_9 == "PC" then
					v_u_7.PlaybackSpeed = 1 + math.random(-15, 15) / 100
					v_u_7.TimePosition = 0
					v_u_7.Playing = true
				end
			end))
			v12:Add(p11.Activated:Connect(function()
				-- upvalues: (ref) v_u_8
				v_u_8.PlaybackSpeed = 1 + math.random(-15, 15) / 100
				v_u_8.TimePosition = 0
				v_u_8.Playing = true
			end))
			return v12:WrapClean()
		end, { workspace, v_u_3.LocalPlayer.PlayerGui })
	end
}
task.spawn(v13.Start, v13)
return v13