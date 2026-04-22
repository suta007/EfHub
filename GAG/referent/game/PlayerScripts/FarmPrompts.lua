local v_u_1 = game:GetService("ReplicatedStorage")
local v_u_2 = game:GetService("Players")
local v_u_3 = game:GetService("StarterGui")
local v_u_4 = require(v_u_1.Modules.Notification)
local v_u_5 = require(v_u_1.Modules.GetPlayerFromFarm)
local v_u_6 = require(v_u_1.Modules.DataService)
local v_u_7 = require(v_u_1.Modules.SaveSlotControllers.SaveSlotUIController)
local v_u_8 = v_u_2.LocalPlayer
local function v_u_14()
	-- upvalues: (copy) v_u_6, (copy) v_u_8, (copy) v_u_2
	local v9 = v_u_6:GetData()
	for _, v10 in workspace.Farm:GetChildren() do
		if not v10:GetAttribute("CommunityGarden") then
			local v11 = v10.Important.Data:WaitForChild("Owner").Value
			local v12 = v10:WaitForChild("Sign").Core_Part.ProximityPrompt
			if v11 == "" or v11 == v_u_8.Name then
				v12.Enabled = false
			else
				v12.Enabled = true
				local v13 = v_u_2:FindFirstChild(v11)
				if v13 and table.find(v9.GardenLikes.LikedGardens, v13.UserId) then
					v12.ActionText = "Friend"
					v12.HoldDuration = 0
				else
					v12.ActionText = "Like"
					v12.HoldDuration = 1
				end
			end
			v10:WaitForChild("Mailbox").Core_Part.Attachment.ProximityPrompt.Enabled = v11 == v_u_8.Name
		end
	end
end
local function v_u_19(_, p15)
	-- upvalues: (copy) v_u_6, (copy) v_u_5, (copy) v_u_8, (copy) v_u_1, (copy) v_u_4, (copy) v_u_3
	local v16 = v_u_6:GetData()
	local v17 = v_u_5(p15)
	if v17 then
		if v17 == v_u_8 then
			return
		elseif table.find(v16.GardenLikes.LikedGardens, v17.UserId) then
			local v18 = v_u_5(p15)
			if v18 then
				if v18 == v_u_8 then
					v_u_4:CreateNotification("This is your garden!")
				else
					v_u_3:SetCore("PromptSendFriendRequest", v18)
				end
			else
				v_u_4:CreateNotification("This garden is empty!")
				return
			end
		else
			v_u_1.GameEvents.LikeGarden:InvokeServer(v17)
			return
		end
	else
		return
	end
end
task.spawn(function()
	-- upvalues: (copy) v_u_6, (copy) v_u_14, (copy) v_u_19, (copy) v_u_7
	v_u_6:GetData()
	task.spawn(v_u_14)
	for _, v_u_20 in workspace.Farm:GetChildren() do
		if not v_u_20:GetAttribute("CommunityGarden") then
			xpcall(function()
				-- upvalues: (copy) v_u_20, (ref) v_u_14
				v_u_20.Important.Data:WaitForChild("Owner"):GetPropertyChangedSignal("Value"):Connect(v_u_14)
			end, warn)
			task.spawn(function()
				-- upvalues: (copy) v_u_20, (ref) v_u_19
				local v_u_21 = v_u_20:WaitForChild("Sign").Core_Part.ProximityPrompt
				v_u_21.Triggered:Connect(function()
					-- upvalues: (ref) v_u_19, (copy) v_u_21, (ref) v_u_20
					v_u_19(v_u_21, v_u_20)
				end)
			end)
			task.spawn(function()
				-- upvalues: (copy) v_u_20, (ref) v_u_7
				v_u_20:WaitForChild("Mailbox").Core_Part.Attachment.ProximityPrompt.Triggered:Connect(function()
					-- upvalues: (ref) v_u_7
					v_u_7:Toggle(not v_u_7.State)
				end)
			end)
		end
	end
	local v22 = v_u_6
	assert(v22:GetPathSignal("GardenLikes/@")):Connect(function()
		-- upvalues: (ref) v_u_14
		v_u_14()
	end)
end)