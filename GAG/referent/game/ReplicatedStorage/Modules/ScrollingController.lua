local v1 = game:GetService("ReplicatedStorage")
game:GetService("SoundService")
game:GetService("Players")
local v_u_2 = require(v1.Modules.Observers)
local v8 = {
	["Start"] = function(_)
		-- upvalues: (copy) v_u_2
		v_u_2.observeTag("AutomaticScrollBarThickness", function(p_u_3)
			if not p_u_3:IsA("ScrollingFrame") then
				return nil
			end
			local v_u_4 = nil
			local function v6()
				-- upvalues: (ref) v_u_4, (copy) p_u_3
				if v_u_4 and coroutine.status(v_u_4) == "suspended" then
					pcall(task.cancel, v_u_4)
				end
				v_u_4 = task.delay(0.15, function()
					-- upvalues: (ref) p_u_3, (ref) v_u_4
					local v5 = p_u_3.Parent
					if v5 and v5:IsA("GuiObject") then
						p_u_3.ScrollBarThickness = v5.AbsoluteSize.X * 0.025
						v_u_4 = nil
					end
				end)
			end
			local v_u_7 = p_u_3:GetPropertyChangedSignal("AbsoluteSize"):Connect(v6)
			task.spawn(v6)
			return function()
				-- upvalues: (copy) v_u_7
				v_u_7:Disconnect()
			end
		end)
	end
}
task.spawn(v8.Start, v8)
return v8