local v1 = {}
local v_u_2 = game:GetService("GuiService")
local v_u_3 = game:GetService("UserInputService")
local v_u_4 = game:GetService("ReplicatedStorage")
local v_u_5 = game:GetService("ScriptContext")
function v1.initClient()
	-- upvalues: (copy) v_u_5, (copy) v_u_4, (copy) v_u_2, (copy) v_u_3
	local v6 = require(script.Parent.GameAnalytics.Postie)
	v_u_5.Error:Connect(function(p7, p8, p_u_9)
		-- upvalues: (ref) v_u_4
		if p_u_9 then
			local v_u_10 = nil
			local v11, _ = pcall(function()
				-- upvalues: (ref) v_u_10, (copy) p_u_9
				v_u_10 = p_u_9:GetFullName()
			end)
			if v11 then
				v_u_4.GameAnalyticsError:FireServer(p7, p8, v_u_10)
			end
		else
			return
		end
	end)
	local function v12()
		-- upvalues: (ref) v_u_2, (ref) v_u_3
		return v_u_2:IsTenFootInterface() and "Console" or (v_u_3.TouchEnabled and not v_u_3.MouseEnabled and "Mobile" or "Desktop")
	end
	v6.setCallback("getPlatform", v12)
end
return v1