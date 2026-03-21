local v_u_1 = game:GetService("SocialService")
local v2 = game:GetService("Players")
game:GetService("ReplicatedStorage")
local v_u_3 = game:GetService("TweenService")
local v4 = game:GetService("ReplicatedStorage")
local v5 = v4:WaitForChild("GameEvents"):WaitForChild("FriendInvitePrompterService")
local v_u_6 = v2.LocalPlayer
local v_u_7 = v_u_6.PlayerGui:WaitForChild("FriendInvites")
local v_u_8 = require(v4.Modules.WaitForDescendant)
local v_u_9 = require(v4.Modules.SetupHoverAnimations)
local v_u_10 = require(v4.Modules.SetupSounds)
local v_u_11 = {
	["CanSendGameInvite"] = false
}
task.spawn(function()
	-- upvalues: (copy) v_u_11, (copy) v_u_6, (copy) v_u_1
	local v12 = v_u_11
	local v_u_13 = v_u_6
	local v14, v15 = pcall(function()
		-- upvalues: (ref) v_u_1, (copy) v_u_13
		return v_u_1:CanSendGameInviteAsync(v_u_13)
	end)
	v12.CanSendGameInvite = v14 and v15
end)
function v_u_11.CreatePrompt(_)
	-- upvalues: (copy) v_u_11, (copy) v_u_7, (copy) v_u_8, (copy) v_u_9, (copy) v_u_10, (copy) v_u_3, (copy) v_u_1, (copy) v_u_6
	if v_u_11.CanSendGameInvite then
		local v16 = v_u_7:FindFirstChild("InsertionPoint")
		if v16 then
			local v_u_17 = v16.FriendInviteTemplate:Clone()
			local v_u_18 = v_u_17.UIScale
			v_u_18.Scale = 0
			local v19 = v_u_8(v_u_17, "ACCEPT_BUTTON")
			local v20 = v_u_8(v_u_17, "DECLINE_BUTTON")
			v_u_9(v19)
			v_u_9(v20)
			local v21 = v_u_10(v19)
			local v22 = v_u_10(v20)
			local function v_u_24()
				-- upvalues: (ref) v_u_3, (copy) v_u_18, (copy) v_u_17
				local v23 = v_u_3:Create(v_u_18, TweenInfo.new(0.2), {
					["Scale"] = 0
				})
				v23:Play()
				v23.Completed:Once(function()
					-- upvalues: (ref) v_u_17
					v_u_17:Destroy()
				end)
			end
			v21.MouseButton1Click:Connect(function()
				-- upvalues: (copy) v_u_24, (ref) v_u_1, (ref) v_u_6
				v_u_24()
				v_u_1:PromptGameInvite(v_u_6)
			end)
			v22.MouseButton1Click:Connect(function()
				-- upvalues: (copy) v_u_24
				v_u_24()
			end)
			v_u_17.Visible = true
			v_u_17.Parent = v16
			v_u_3:Create(v_u_18, TweenInfo.new(0.5), {
				["Scale"] = 1
			}):Play()
		end
	else
		return warn("Cannot send game invite!")
	end
end
local v_u_25 = { "CreatePrompt" }
v5.OnClientEvent:Connect(function(p26, ...)
	-- upvalues: (copy) v_u_25, (copy) v_u_11
	if table.find(v_u_25, p26) then
		local v27 = v_u_11[p26]
		if v27 then
			v27(v_u_11, ...)
		end
	else
		return
	end
end)
return v_u_11