local v1 = {}
local v2 = game:GetService("Players")
local v3 = game:GetService("ReplicatedStorage")
local v_u_4 = game:GetService("TweenService")
local v_u_5 = v2.LocalPlayer:WaitForChild("PlayerGui"):WaitForChild("Notifications").InsertionPoint
local v_u_6 = v_u_5:WaitForChild("NotificationTemplate")
local v_u_7 = require(v3.Modules.SetupHoverAnimations)
local v_u_8 = require(v3.Modules.PlayHoverSound)
local v_u_9 = require(v3.Modules.WaitForDescendant)
local v_u_10 = 0
function v1.CreateNotification(_, p_u_11)
	-- upvalues: (ref) v_u_10, (copy) v_u_6, (copy) v_u_9, (copy) v_u_4, (copy) v_u_7, (copy) v_u_8, (copy) v_u_5
	v_u_10 = v_u_10 + 1
	local v12 = p_u_11.Text or "Notification Text!"
	local v13 = p_u_11.Icon or "rbxassetid://13488010851"
	p_u_11.Id = p_u_11.Id or v_u_10
	local v14 = p_u_11.EnabledComponents or {
		["OptionSet"] = true,
		["Confirm"] = true,
		["Decline"] = true,
		["IconSet"] = true
	}
	local v_u_15 = v_u_6:Clone()
	v_u_15.Visible = true
	local v_u_16 = v_u_15:WaitForChild("UIScale")
	v_u_9(v_u_15, "NOTIFICATION_TEXT").Text = v12
	v_u_9(v_u_15, "NOTIFICATION_ICON").Image = v13
	local v17 = v_u_9(v_u_15, "NOTIFICATION_OPTION_SET")
	local v18 = v_u_9(v17, "NOTIFICATION_CONFIRM")
	local v19 = v_u_9(v17, "NOTIFICATION_DECLINE")
	local v20 = v_u_9(v_u_15, "NOTIFICATION_ICON_SET")
	v17.Visible = v14.OptionSet
	v18.Parent.Visible = v14.Confirm
	local function v_u_22()
		-- upvalues: (ref) v_u_4, (copy) v_u_16, (copy) v_u_15
		local v21 = v_u_4:Create(v_u_16, TweenInfo.new(0.2), {
			["Scale"] = 0
		})
		v21:Play()
		v21.Completed:Once(function()
			-- upvalues: (ref) v_u_15
			v_u_15:Destroy()
		end)
	end
	if v14.Confirm then
		local v23 = v_u_7(v18)
		local v_u_24 = p_u_11.OnConfirm
		v23.MouseEnter:Connect(function()
			-- upvalues: (ref) v_u_8
			v_u_8()
		end)
		v23.MouseButton1Down:Connect(function()
			-- upvalues: (copy) v_u_24, (copy) p_u_11, (copy) v_u_22
			if v_u_24 then
				v_u_24(p_u_11)
			end
			v_u_22()
		end)
	end
	v19.Parent.Visible = v14.Decline
	if v14.Decline then
		local v25 = v_u_7(v19)
		local v_u_26 = p_u_11.OnDecline
		v25.MouseEnter:Connect(function()
			-- upvalues: (ref) v_u_8
			v_u_8()
		end)
		v25.MouseButton1Down:Connect(function()
			-- upvalues: (copy) v_u_26, (copy) p_u_11, (copy) v_u_22
			if v_u_26 then
				v_u_26(p_u_11)
			end
			v_u_22()
		end)
	end
	v20.Visible = v14.IconSet
	v_u_15.Parent = v_u_5
	v_u_4:Create(v_u_16, TweenInfo.new(0.2), {
		["Scale"] = 1.5
	}):Play()
	local v27 = p_u_11.Lifetime
	if v27 then
		task.delay(v27, function()
			-- upvalues: (copy) v_u_22
			v_u_22()
		end)
	end
	return p_u_11
end
return v1