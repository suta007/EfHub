local v_u_1 = game:GetService("ReplicatedStorage")
local v2 = game:GetService("Players")
local v_u_3 = game:GetService("UserInputService")
local v_u_4 = game:GetService("ReplicatedFirst").EnableCommandUI
local v_u_5 = v2.LocalPlayer
local v_u_6 = require(v_u_1.Modules.IsCommandAuthorized)
local v_u_7 = require(v_u_1.Modules.ModernInputNotificationUserInterfaceService)
local v_u_8 = require(v_u_1.Modules.Icon)
task.spawn(function()
	-- upvalues: (copy) v_u_6, (copy) v_u_5, (copy) v_u_1, (copy) v_u_4, (copy) v_u_8, (copy) v_u_7, (copy) v_u_3
	if v_u_6(v_u_5) then
		local v_u_9 = require(v_u_1:WaitForChild("CmdrClient"))
		if v_u_4.Value then
			local v_u_10 = v_u_8.new()
			v_u_10:setName("CMDR")
			v_u_10:setOrder(5)
			v_u_10:setLabel("CMDR")
			v_u_10:align("Right")
			v_u_10:setCaption("Toggle the admin console.")
			v_u_10.deselectWhenOtherIconSelected = false
			local v11 = {
				["Text"] = "You have access to the developer command console! Press [F2] to toggle!",
				["Icon"] = "rbxassetid://0",
				["EnabledComponents"] = {
					["OptionSet"] = true,
					["Confirm"] = true,
					["Decline"] = false,
					["IconSet"] = true
				},
				["Lifetime"] = 3
			}
			v_u_7:CreateNotification(v11)
			local v_u_12 = false
			v_u_3.InputEnded:Connect(function(p13)
				-- upvalues: (ref) v_u_3, (ref) v_u_12, (copy) v_u_10
				if v_u_3:GetFocusedTextBox() then
					return
				elseif p13.KeyCode == Enum.KeyCode.F2 then
					v_u_12 = not v_u_12
					if v_u_12 then
						v_u_10:select()
					else
						v_u_10:deselect()
					end
				else
					return
				end
			end)
			v_u_10.selected:Connect(function(_)
				-- upvalues: (copy) v_u_9
				v_u_9:Show()
			end)
			v_u_10.deselected:Connect(function(_)
				-- upvalues: (copy) v_u_9
				v_u_9:Hide()
			end)
		else
			v_u_9:SetActivationKeys({ Enum.KeyCode.F2 })
		end
	else
		return
	end
end)
return {}