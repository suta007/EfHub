local v1 = {}
local v_u_2 = game:GetService("Players")
local v3 = game:GetService("RunService")
local v4 = game:GetService("ReplicatedStorage")
local v_u_5 = game:GetService("StarterGui")
local v_u_6 = v4:WaitForChild("GameEvents"):WaitForChild("FriendshipPotToolService_RE")
local v_u_7 = require(v4.Modules.Notification)
local v_u_8 = require(v4.Modules.FriendsAPI)
local v_u_9 = require(v4.Data.EnumRegistry.InventoryServiceEnums)
local v_u_10 = require(v4.Data.EnumRegistry.ItemTypeEnums)
local v_u_11 = v_u_2.LocalPlayer
local v_u_12 = nil
local v_u_13 = nil
local v_u_14 = nil
local v_u_15 = false
local v_u_16 = Instance.new("Part")
v_u_16.Size = Vector3.new(1, 1, 1)
v_u_16.Transparency = 1
v_u_16.Anchored = false
v_u_16.CanCollide = false
v_u_16.CanQuery = false
v_u_16.Massless = true
v_u_16.RootPriority = -1
v_u_16.Parent = workspace
local v_u_17 = Instance.new("Weld")
v_u_17.Part0 = v_u_16
v_u_17.Parent = v_u_16
local v_u_18 = Instance.new("ProximityPrompt")
v_u_18.Exclusivity = Enum.ProximityPromptExclusivity.OnePerButton
v_u_18.KeyboardKeyCode = Enum.KeyCode.E
v_u_18.RequiresLineOfSight = false
v_u_18.HoldDuration = 0.5
v_u_18.MaxActivationDistance = 15
v_u_18.ObjectText = "Friendship Pot"
v_u_18.Parent = v_u_16
v_u_18.Style = Enum.ProximityPromptStyle.Custom
v_u_18:SetAttribute("Theme", "ShadowedPrompt")
local v_u_19 = nil
local v_u_20 = nil
local function v_u_27()
	-- upvalues: (copy) v_u_11, (copy) v_u_2
	local v21 = v_u_11.Character
	if not v21 then
		return nil
	end
	local v22 = (1 / 0)
	local v23 = nil
	for _, v24 in v_u_2:GetPlayers() do
		if v24 ~= v_u_11 then
			local v25 = v24.Character
			if v25 then
				local v26 = (v25:GetPivot().Position - v21:GetPivot().Position).Magnitude
				if v22 > v26 and v26 < 15 then
					v23 = v25
					v22 = v26
				end
			end
		end
	end
	return v23
end
local function v33()
	-- upvalues: (ref) v_u_12, (ref) v_u_13, (ref) v_u_14, (ref) v_u_15, (copy) v_u_27, (ref) v_u_19, (copy) v_u_16, (copy) v_u_17, (copy) v_u_18
	if v_u_12 then
		v_u_12:Disconnect()
		v_u_12 = nil
	end
	if v_u_13 then
		v_u_13:Disconnect()
		v_u_13 = nil
	end
	if v_u_14 then
		v_u_14:Disconnect()
		v_u_14 = nil
	end
	v_u_15 = false
	local v28
	if v_u_15 then
		v28 = v_u_27()
	else
		v28 = nil
	end
	if v_u_19 ~= v28 then
		v_u_19 = v28
		local v29 = v_u_16
		local v30
		if v28 == nil then
			v30 = script
		else
			v30 = workspace
		end
		v29.Parent = v30
		local v31 = v_u_17
		local v32
		if v28 then
			v32 = v28.PrimaryPart
		else
			v32 = nil
		end
		v31.Part1 = v32
		v_u_18.ActionText = not v28 and "" or ("Link/Share with %*"):format(v28.Name)
	end
end
local function v57(p34)
	-- upvalues: (ref) v_u_12, (ref) v_u_13, (ref) v_u_14, (ref) v_u_15, (copy) v_u_27, (ref) v_u_19, (copy) v_u_16, (copy) v_u_17, (copy) v_u_18, (copy) v_u_9, (copy) v_u_10, (copy) v_u_7, (ref) v_u_20
	if v_u_12 then
		v_u_12:Disconnect()
		v_u_12 = nil
	end
	if v_u_13 then
		v_u_13:Disconnect()
		v_u_13 = nil
	end
	if v_u_14 then
		v_u_14:Disconnect()
		v_u_14 = nil
	end
	v_u_15 = false
	local v35
	if v_u_15 then
		v35 = v_u_27()
	else
		v35 = nil
	end
	if v_u_19 ~= v35 then
		v_u_19 = v35
		local v36 = v_u_16
		local v37
		if v35 == nil then
			v37 = script
		else
			v37 = workspace
		end
		v36.Parent = v37
		local v38 = v_u_17
		local v39
		if v35 then
			v39 = v35.PrimaryPart
		else
			v39 = nil
		end
		v38.Part1 = v39
		v_u_18.ActionText = not v35 and "" or ("Link/Share with %*"):format(v35.Name)
	end
	v_u_12 = p34.ChildAdded:Connect(function(p40)
		-- upvalues: (ref) v_u_9, (ref) v_u_10, (ref) v_u_7, (ref) v_u_20, (ref) v_u_15, (ref) v_u_27, (ref) v_u_19, (ref) v_u_16, (ref) v_u_17, (ref) v_u_18
		if p40:IsA("Tool") then
			if p40:GetAttribute(v_u_9.ITEM_TYPE) == v_u_10.FriendshipPot then
				if p40:GetAttribute(v_u_9.LinkedPlayerID) then
					v_u_7:CreateNotification("Place your pot in your garden")
				else
					v_u_20 = p40
					v_u_15 = true
					local v41
					if v_u_15 then
						v41 = v_u_27()
					else
						v41 = nil
					end
					if v_u_19 ~= v41 then
						v_u_19 = v41
						local v42 = v_u_16
						local v43
						if v41 == nil then
							v43 = script
						else
							v43 = workspace
						end
						v42.Parent = v43
						local v44 = v_u_17
						local v45
						if v41 then
							v45 = v41.PrimaryPart
						else
							v45 = nil
						end
						v44.Part1 = v45
						v_u_18.ActionText = not v41 and "" or ("Link/Share with %*"):format(v41.Name)
					end
					v_u_7:CreateNotification("Link your pot with a friend")
				end
			else
				return
			end
		else
			return
		end
	end)
	v_u_13 = p34.ChildRemoved:Connect(function(p46)
		-- upvalues: (ref) v_u_9, (ref) v_u_10, (ref) v_u_20, (ref) v_u_15, (ref) v_u_27, (ref) v_u_19, (ref) v_u_16, (ref) v_u_17, (ref) v_u_18
		if p46:IsA("Tool") then
			if p46:GetAttribute(v_u_9.ITEM_TYPE) == v_u_10.FriendshipPot then
				if not p46:GetAttribute(v_u_9.LinkedPlayerID) then
					v_u_20 = nil
					v_u_15 = false
					local v47
					if v_u_15 then
						v47 = v_u_27()
					else
						v47 = nil
					end
					if v_u_19 ~= v47 then
						v_u_19 = v47
						local v48 = v_u_16
						local v49
						if v47 == nil then
							v49 = script
						else
							v49 = workspace
						end
						v48.Parent = v49
						local v50 = v_u_17
						local v51
						if v47 then
							v51 = v47.PrimaryPart
						else
							v51 = nil
						end
						v50.Part1 = v51
						v_u_18.ActionText = not v47 and "" or ("Link/Share with %*"):format(v47.Name)
					end
				end
			else
				return
			end
		else
			return
		end
	end)
	v_u_15 = false
	local v52
	if v_u_15 then
		v52 = v_u_27()
	else
		v52 = nil
	end
	if v_u_19 ~= v52 then
		v_u_19 = v52
		local v53 = v_u_16
		local v54
		if v52 == nil then
			v54 = script
		else
			v54 = workspace
		end
		v53.Parent = v54
		local v55 = v_u_17
		local v56
		if v52 then
			v56 = v52.PrimaryPart
		else
			v56 = nil
		end
		v55.Part1 = v56
		v_u_18.ActionText = not v52 and "" or ("Link/Share with %*"):format(v52.Name)
	end
end
v_u_11.CharacterAdded:Connect(v57)
v_u_11.CharacterRemoving:Connect(v33)
if v_u_11.Character then
	task.spawn(v57, v_u_11.Character)
end
local v_u_58 = 0
v3.PostSimulation:Connect(function(p59)
	-- upvalues: (ref) v_u_15, (ref) v_u_58, (copy) v_u_27, (ref) v_u_19, (copy) v_u_16, (copy) v_u_17, (copy) v_u_18
	if v_u_15 then
		v_u_58 = v_u_58 + p59
		if v_u_58 >= 0.1 then
			v_u_58 = 0
			local v60
			if v_u_15 then
				v60 = v_u_27()
			else
				v60 = nil
			end
			if v_u_19 ~= v60 then
				v_u_19 = v60
				local v61 = v_u_16
				local v62
				if v60 == nil then
					v62 = script
				else
					v62 = workspace
				end
				v61.Parent = v62
				local v63 = v_u_17
				local v64
				if v60 then
					v64 = v60.PrimaryPart
				else
					v64 = nil
				end
				v63.Part1 = v64
				v_u_18.ActionText = not v60 and "" or ("Link/Share with %*"):format(v60.Name)
			end
		end
	else
		return
	end
end)
v_u_18.Triggered:Connect(function()
	-- upvalues: (ref) v_u_20, (copy) v_u_2, (ref) v_u_19, (copy) v_u_8, (copy) v_u_11, (copy) v_u_5, (copy) v_u_6, (copy) v_u_9, (copy) v_u_7
	if v_u_20 then
		local v_u_65 = v_u_2:GetPlayerFromCharacter(v_u_19)
		if v_u_65 then
			if v_u_8:IsFriendsWithImmediate(v_u_11, v_u_65) then
				v_u_6:FireServer("BeginTrade", v_u_65, v_u_20:GetAttribute(v_u_9.ITEM_UUID))
				v_u_7:CreateNotification("Link request sent!")
			else
				pcall(function()
					-- upvalues: (ref) v_u_5, (copy) v_u_65
					v_u_5:SetCore("PromptSendFriendRequest", v_u_65)
				end)
			end
		else
			return warn("No ReceiverPlayer")
		end
	else
		return
	end
end)
return v1