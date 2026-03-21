local v_u_1 = game:GetService("ExperienceNotificationService")
local v2 = game:GetService("Players")
game:GetService("ReplicatedStorage")
local v_u_3 = game:GetService("TweenService")
local v4 = game:GetService("ReplicatedStorage")
local v5 = v4:WaitForChild("GameEvents"):WaitForChild("ExperienceNotificationServicePrompterController")
local v_u_6 = v2.LocalPlayer.PlayerGui:WaitForChild("ExperienceNotifications")
local v_u_7 = require(v4.Modules.WaitForDescendant)
local v_u_8 = require(v4.Modules.SetupHoverAnimations)
local v_u_9 = require(v4.Modules.SetupSounds)
local v_u_10 = {
	["CanPromptOptIn"] = false
}
local v11, v12 = pcall(function()
	-- upvalues: (copy) v_u_1
	return v_u_1:CanPromptOptInAsync()
end)
if not v11 then
	v12 = false
end
v_u_10.CanPromptOptIn = v12
function v_u_10.CreatePrompt(_)
	-- upvalues: (copy) v_u_10, (copy) v_u_6, (copy) v_u_7, (copy) v_u_8, (copy) v_u_9, (copy) v_u_3, (copy) v_u_1
	if v_u_10.CanPromptOptIn then
		local v13 = v_u_6:FindFirstChild("InsertionPoint")
		if v13 then
			local v_u_14 = v13.ExperienceNotificationTemplate:Clone()
			local v_u_15 = v_u_14.UIScale
			v_u_15.Scale = 0
			local v16 = v_u_7(v_u_14, "ACCEPT_BUTTON")
			local v17 = v_u_7(v_u_14, "DECLINE_BUTTON")
			v_u_8(v16)
			v_u_8(v17)
			local v18 = v_u_9(v16)
			local v19 = v_u_9(v17)
			local function v_u_21()
				-- upvalues: (ref) v_u_3, (copy) v_u_15, (copy) v_u_14
				local v20 = v_u_3:Create(v_u_15, TweenInfo.new(0.2), {
					["Scale"] = 0
				})
				v20:Play()
				v20.Completed:Once(function()
					-- upvalues: (ref) v_u_14
					v_u_14:Destroy()
				end)
			end
			v18.MouseButton1Click:Connect(function()
				-- upvalues: (copy) v_u_21, (ref) v_u_1
				v_u_21()
				v_u_1:PromptOptIn()
			end)
			v19.MouseButton1Click:Connect(function()
				-- upvalues: (copy) v_u_21
				v_u_21()
			end)
			v_u_14.Visible = true
			v_u_14.Parent = v13
			v_u_3:Create(v_u_15, TweenInfo.new(0.5), {
				["Scale"] = 1
			}):Play()
		end
	else
		return warn("Cannot prompt notification because not eligiblE!")
	end
end
local v_u_22 = { "CreatePrompt" }
v5.OnClientEvent:Connect(function(p23, ...)
	-- upvalues: (copy) v_u_22, (copy) v_u_10
	if table.find(v_u_22, p23) then
		local v24 = v_u_10[p23]
		if v24 then
			v24(v_u_10, ...)
		end
	else
		return
	end
end)
v_u_1.OptInPromptClosed:Connect(function()
	task.wait(5)
end)
return v_u_10