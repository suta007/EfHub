local v1 = game:GetService("Players")
local v_u_2 = game:GetService("UserInputService")
local v_u_3 = game:GetService("CollectionService")
local v_u_4 = game:GetService("TweenService")
local v5 = game:GetService("RunService")
local v6 = game:GetService("ReplicatedStorage")
local v7 = game:GetService("ProximityPromptService")
local v_u_8 = v6:WaitForChild("GameEvents"):WaitForChild("FavoriteToolRemote")
local v_u_9 = require(v6.Modules.GetFarm)
local v_u_10 = require(v6.Modules.ProximityPromptController)
local v_u_11 = require(v6.Modules.Notification)
local v_u_12 = require(v6.Code.Manhattan2D)
local v_u_13 = v1.LocalPlayer
local v_u_14 = workspace.CurrentCamera
local v_u_15 = script:WaitForChild("Highlight")
local v_u_16 = nil
local v_u_17 = nil
local v_u_18 = false
local v_u_19 = false
local function v_u_23(p20)
	-- upvalues: (copy) v_u_9, (copy) v_u_13, (copy) v_u_3
	local v21 = p20:FindFirstAncestorOfClass("Model")
	if v21 then
		local v22 = v_u_9(v_u_13)
		if v22 then
			if v_u_3:HasTag(v21, "Harvestable") then
				if v21:IsDescendantOf(v22) then
					return v21
				else
					return false
				end
			else
				return false
			end
		else
			return false
		end
	else
		return false
	end
end
local function v_u_30()
	-- upvalues: (copy) v_u_2, (copy) v_u_14, (copy) v_u_3, (copy) v_u_13, (copy) v_u_23
	local v24 = v_u_2:GetMouseLocation()
	local v25 = v_u_14:ViewportPointToRay(v24.X, v24.Y)
	local v26 = RaycastParams.new()
	local v27 = v_u_3:GetTagged("ShovelIgnore")
	v26.FilterType = Enum.RaycastFilterType.Exclude
	v26.FilterDescendantsInstances = v27
	v26:AddToFilter(v_u_13.Character)
	v26:AddToFilter(v_u_14)
	local v28 = workspace:Raycast(v25.Origin, v25.Direction * 500, v26)
	if v28 and v28.Instance then
		local v29 = v28.Instance:FindFirstAncestorOfClass("Model")
		if v29 and v_u_23(v28.Instance) then
			return v29
		end
	end
end
local function v_u_39(_, p31)
	-- upvalues: (ref) v_u_18, (copy) v_u_30, (copy) v_u_11, (ref) v_u_16, (copy) v_u_8, (ref) v_u_17
	if v_u_18 and not p31 then
		local v_u_32 = v_u_30()
		if v_u_32 then
			local v33 = v_u_32:FindFirstChild("Grow")
			if v33 and v33:FindFirstChild("Age") then
				local v34 = v_u_32:GetAttribute("MaxAge")
				if not v34 or v33.Age.Value < v34 then
					v_u_11:CreateNotification("You can only favorite fully grown fruit!")
					return
				end
			end
			v_u_16 = v_u_32
			local v_u_35 = not v_u_32:GetAttribute("Favorited")
			local v36, v37 = pcall(function()
				-- upvalues: (ref) v_u_8, (ref) v_u_17, (copy) v_u_32, (copy) v_u_35
				return v_u_8:InvokeServer(v_u_17, v_u_32, v_u_35)
			end)
			if v36 then
				if v37 == true then
					if v_u_35 then
						v_u_11:CreateNotification((("Favorited %*"):format(v_u_32.Name)))
					else
						v_u_11:CreateNotification((("Unfavorited %*"):format(v_u_32.Name)))
						for _, v38 in v_u_32:GetDescendants() do
							if v38:IsA("ProximityPrompt") then
								v38.Enabled = true
							end
						end
					end
				else
					v_u_11:CreateNotification("You have no more uses!")
					return
				end
			else
				warn("Failed to toggle favorite state:", v37)
				return
			end
		else
			return
		end
	else
		return
	end
end
local v_u_40 = nil
local function v41()
	-- upvalues: (ref) v_u_40, (copy) v_u_2, (copy) v_u_39, (copy) v_u_13
	if v_u_40 then
		v_u_40:Disconnect()
	end
	if v_u_2:GetLastInputType() == Enum.UserInputType.Touch then
		v_u_40 = v_u_2.TouchTapInWorld:Connect(v_u_39)
	else
		v_u_40 = v_u_13:GetMouse().Button1Down:Connect(function()
			-- upvalues: (ref) v_u_39, (ref) v_u_2
			v_u_39(v_u_2:GetMouseLocation(), false)
		end)
	end
end
v_u_2.LastInputTypeChanged:Connect(v41)
task.spawn(v41)
v5.RenderStepped:Connect(function()
	-- upvalues: (ref) v_u_18, (copy) v_u_15, (ref) v_u_16, (copy) v_u_30, (copy) v_u_4
	if v_u_18 then
		local v42 = v_u_30()
		if v42 and v42 ~= v_u_16 then
			v_u_15.Adornee = v42
			v_u_15.FillTransparency = 1
			v_u_4:Create(v_u_15, TweenInfo.new(0.2), {
				["FillTransparency"] = 0.5
			}):Play()
			v_u_16 = v42
		elseif not v42 then
			v_u_15.Adornee = nil
			v_u_16 = nil
		end
	else
		v_u_15.Adornee = nil
		v_u_16 = nil
		return
	end
end)
v7.PromptShown:Connect(function(p43, _)
	-- upvalues: (copy) v_u_9, (copy) v_u_13
	local v44 = p43:FindFirstAncestorOfClass("Model")
	if v44 then
		if v44:GetAttribute("Favorited") then
			local v45 = v_u_9(v_u_13)
			if v45 and v44:IsDescendantOf(v45) then
				p43.Enabled = false
			end
		end
	end
end)
v7.PromptTriggered:Connect(function(p46, p47)
	-- upvalues: (copy) v_u_13, (copy) v_u_9
	if p47 == v_u_13 then
		local v48 = p46:FindFirstAncestorOfClass("Model")
		if v48 then
			if v48:GetAttribute("Favorited") then
				local v49 = v_u_9(v_u_13)
				if v49 and v48:IsDescendantOf(v49) then
					p46.Enabled = false
					return
				end
			end
		end
	else
		return
	end
end)
local function v_u_53()
	-- upvalues: (copy) v_u_13, (copy) v_u_10, (copy) v_u_12
	local v50 = v_u_13.Character
	if v50 then
		v50 = v50.PrimaryPart
	end
	if v50 then
		for _, v51 in workspace.Farm:GetChildren() do
			local v52 = v51:FindFirstChild("PetArea")
			if v52 and v_u_12(v50.Position, v52) then
				v_u_10:AddDisabler("Favorite Tool")
				return
			end
		end
	else
		v_u_10:RemoveDisabler("Favorite Tool")
	end
end
task.spawn(function()
	-- upvalues: (copy) v_u_13, (copy) v_u_53, (copy) v_u_10
	while true do
		task.wait(0.5)
		local v54 = v_u_13.Character
		if v54 then
			v54 = v_u_13.Character:FindFirstChildOfClass("Tool")
		end
		if not (v54 and v54.Name:match("Favorite")) then
			v54 = nil
		end
		if v_u_13.Character and v54 then
			v_u_53()
		else
			v_u_10:RemoveDisabler("Favorite Tool")
		end
	end
end)
task.spawn(function()
	-- upvalues: (ref) v_u_19, (copy) v_u_13, (ref) v_u_17, (ref) v_u_18, (copy) v_u_15, (ref) v_u_16
	while not v_u_19 do
		task.wait(0.1)
		local v_u_55 = v_u_13.Character
		if v_u_55 then
			v_u_55 = v_u_13.Character:FindFirstChildOfClass("Tool")
		end
		if not (v_u_55 and v_u_55.Name:match("Favorite")) then
			v_u_55 = nil
		end
		if v_u_13.Character and v_u_55 then
			v_u_55.Equipped:Connect(function()
				-- upvalues: (ref) v_u_17, (copy) v_u_55, (ref) v_u_18
				v_u_17 = v_u_55
				v_u_18 = true
			end)
			v_u_55.Unequipped:Connect(function()
				-- upvalues: (ref) v_u_17, (ref) v_u_18, (ref) v_u_15, (ref) v_u_16
				v_u_17 = nil
				v_u_18 = false
				v_u_15.Adornee = nil
				v_u_16 = nil
			end)
			v_u_19 = true
		end
	end
end)