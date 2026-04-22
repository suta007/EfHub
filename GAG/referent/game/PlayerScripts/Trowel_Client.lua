local v1 = game:GetService("Players")
local v_u_2 = game:GetService("UserInputService")
local v_u_3 = game:GetService("CollectionService")
local v4 = game:GetService("ReplicatedStorage")
local v_u_5 = game:GetService("TweenService")
local v_u_6 = game:GetService("RunService")
game:GetService("ProximityPromptService")
local v_u_7 = v4:WaitForChild("GameEvents"):WaitForChild("TrowelRemote")
local v_u_8 = require(v4.Modules.GetFarm)
local v_u_9 = require(v4.Modules.Notification)
local v_u_10 = require(v4.Modules.EffectController.Libraries.Default)
local v_u_11 = require(v4.Modules.ProximityPromptController)
local v_u_12 = v1.LocalPlayer
local v_u_13 = workspace.CurrentCamera
local v_u_14 = v_u_12.PlayerGui:WaitForChild("Trowel_Client")
local v15 = v_u_14.Frame.CancelFrame:WaitForChild("Cancel")
local v16 = v_u_14.Frame.RotateFrame:WaitForChild("Rotate")
local v_u_17 = require(v4.Modules.SoundPlayer)
local v_u_18 = require(v4.Data.SoundData)
local v_u_19 = nil
local v_u_20 = nil
local v_u_21 = nil
local v_u_22 = nil
local v_u_23 = script.Highlight
local v_u_24 = {}
local v_u_25 = nil
local v_u_26 = false
local v_u_27 = { "FriendshipPot" }
local function v_u_38(p28)
	-- upvalues: (copy) v_u_8, (copy) v_u_12, (copy) v_u_27
	local v29 = v_u_8(v_u_12)
	if not v29 then
		return false
	end
	local v30 = p28:IsDescendantOf(v29)
	local v31 = p28:FindFirstAncestor("Farm")
	if v31 then
		v31 = v31:GetAttribute("CommunityGarden") == true
	end
	local v32
	if v31 then
		v32 = p28:GetAttribute("PlantedByUserId") == v_u_12.UserId
	else
		v32 = v31
	end
	if not (v30 or v32) then
		return false
	end
	if v31 then
		local v33 = p28:HasTag("Growable")
		local v34 = p28.Parent.Name == "Fruits"
		if v33 then
			v33 = not v34
		end
		return v33
	end
	local v35 = p28:HasTag("Growable")
	local v36 = p28.Parent.Name == "Fruits"
	local v37 = p28:HasTag("PlaceableObject")
	if v37 then
		v37 = p28.Parent.Name == "Objects_Physical"
	end
	return v35 and not v36 and true or (v37 and table.find(v_u_27, p28.Name) and true or false)
end
local function v_u_43(p39)
	-- upvalues: (copy) v_u_13, (copy) v_u_3
	local v40 = v_u_13:ViewportPointToRay(p39.X, p39.Y)
	local v41 = RaycastParams.new()
	v41.FilterType = Enum.RaycastFilterType.Exclude
	v41.FilterDescendantsInstances = { v_u_3:GetTagged("ShovelIgnore") }
	local v42 = workspace:Raycast(v40.Origin, v40.Direction * 500, v41)
	if v42 and v42.Instance then
		return v42.Instance:FindFirstAncestorOfClass("Model")
	end
end
local function v_u_49(p44)
	-- upvalues: (copy) v_u_13, (ref) v_u_19, (copy) v_u_8, (copy) v_u_12
	local v45 = v_u_13:ViewportPointToRay(p44.X, p44.Y)
	local v46 = RaycastParams.new()
	local v47 = v_u_19 and v_u_19:FindFirstAncestor("Farm") or v_u_8(v_u_12)
	if not v47 then
		return nil
	end
	v46.FilterType = Enum.RaycastFilterType.Include
	v46.FilterDescendantsInstances = { v47.Important.Plant_Locations:GetChildren() }
	local v48 = workspace:Raycast(v45.Origin, v45.Direction * 500, v46)
	if v48 and v48.Instance then
		return v48
	end
end
local function v50()
	-- upvalues: (ref) v_u_19, (ref) v_u_22
	if v_u_19 then
		v_u_22 = v_u_22 * CFrame.Angles(0, 0.7853981633974483, 0)
	end
end
local function v_u_54()
	-- upvalues: (ref) v_u_19, (ref) v_u_26, (ref) v_u_20, (ref) v_u_21, (copy) v_u_7, (copy) v_u_9, (ref) v_u_24, (copy) v_u_23, (copy) v_u_12
	if v_u_19 and (not v_u_26 and v_u_20) then
		local v51 = v_u_19
		v_u_19 = nil
		v51:PivotTo(v_u_21)
		v_u_7:InvokeServer("Cancel", v_u_20, v51)
		v_u_9:CreateNotification((("Canceled moving %*!"):format(v51.Name)))
		for _, v52 in v_u_24 or {} do
			v52.Instance.CanCollide = v52.CanCollide
			v52.Instance.CanQuery = v52.CanQuery
		end
		v_u_24 = {}
		v_u_23.Adornee = nil
		local v53 = v_u_12.Character:FindFirstChildOfClass("Humanoid")
		if v53 then
			v53:UnequipTools()
		end
	end
end
v_u_6.RenderStepped:Connect(function()
	-- upvalues: (copy) v_u_14, (ref) v_u_19, (ref) v_u_20, (copy) v_u_12, (ref) v_u_25, (copy) v_u_54, (copy) v_u_2, (copy) v_u_49, (ref) v_u_22, (ref) v_u_21, (copy) v_u_43, (copy) v_u_38, (copy) v_u_23, (copy) v_u_5
	v_u_14.Enabled = v_u_19 ~= nil
	local v55 = v_u_12.Character:FindFirstChildOfClass("Tool")
	local v56
	if v55 then
		v56 = v55.Name:match("Trowel")
	else
		v56 = v55
	end
	v_u_20 = v56 and v55
	if v_u_20 then
		if not v_u_25 then
			v_u_25 = v_u_20.Destroying:Once(function()
				-- upvalues: (ref) v_u_25, (ref) v_u_54
				v_u_25:Disconnect()
				v_u_25 = nil
				v_u_54()
			end)
		end
		local v57 = v_u_2:GetMouseLocation()
		if v_u_19 then
			local v58 = v_u_49(v57)
			if v58 and v58.Position then
				v_u_19:PivotTo(CFrame.new(v58.Position) * CFrame.new(0, 3, 0) * v_u_22)
			else
				v_u_19:PivotTo(v_u_21)
			end
		else
			local v59 = v_u_43(v57)
			if v59 then
				if v_u_38(v59) then
					if v_u_23.Adornee ~= v59 then
						v_u_23.FillTransparency = 1
						v_u_5:Create(v_u_23, TweenInfo.new(0.25), {
							["FillTransparency"] = 0.65
						}):Play()
					end
					v_u_23.Adornee = v59
				else
					v_u_23.Adornee = nil
				end
			else
				return
			end
		end
	else
		if v_u_19 then
			v_u_54()
		end
		v_u_23.Adornee = nil
		return
	end
end)
v15.Activated:Connect(v_u_54)
v16.Activated:Connect(v50)
local function v_u_77(p60, p61)
	-- upvalues: (copy) v_u_12, (ref) v_u_26, (copy) v_u_9, (copy) v_u_2, (ref) v_u_19, (copy) v_u_49, (copy) v_u_8, (copy) v_u_23, (ref) v_u_22, (ref) v_u_21, (copy) v_u_6, (copy) v_u_5, (copy) v_u_7, (ref) v_u_20, (copy) v_u_10, (copy) v_u_17, (copy) v_u_18, (copy) v_u_13, (ref) v_u_24, (copy) v_u_43, (copy) v_u_38
	if v_u_12.Character then
		local v62 = v_u_12.Character:FindFirstChildOfClass("Tool")
		local v63
		if v62 then
			v63 = v62.Name:match("Trowel")
		else
			v63 = v62
		end
		if v63 and v62 and not p61 then
			if v_u_26 then
				v_u_9:CreateNotification("Please wait before trying again!")
				return
			else
				local v64 = p60 or v_u_2:GetMouseLocation()
				if v_u_19 then
					local v_u_65 = v_u_49(v64)
					if v_u_65 and v_u_65.Instance.Name == "Can_Plant" then
						local v66 = v_u_19 and v_u_19:FindFirstAncestor("Farm") or v_u_8(v_u_12)
						local v67 = RaycastParams.new()
						v67.FilterType = Enum.RaycastFilterType.Include
						v67.FilterDescendantsInstances = { v66.Important.Plants_Physical:GetChildren() }
						if not workspace:Raycast(v_u_65.Position + Vector3.new(0, 20, 0), Vector3.new(0, -25, 0), v67) then
							v_u_23.Adornee = nil
							v_u_26 = true
							task.spawn(function()
								-- upvalues: (copy) v_u_65, (ref) v_u_22, (ref) v_u_21, (ref) v_u_19, (ref) v_u_6, (ref) v_u_5, (ref) v_u_7, (ref) v_u_20, (ref) v_u_9, (ref) v_u_10, (ref) v_u_17, (ref) v_u_18, (ref) v_u_13, (ref) v_u_26
								local v68 = CFrame.new(v_u_65.Position) * CFrame.new(0, 3, 0) * v_u_22
								local v69 = CFrame.new(v_u_65.Position.X, v_u_21.Y, v_u_65.Position.Z) * v_u_22
								local v70 = v_u_19
								v70:PivotTo(v68)
								local v71 = 0
								while v71 < 0.15 do
									v71 = v71 + v_u_6.Heartbeat:Wait()
									v70:PivotTo(v68:Lerp(v69, (v_u_5:GetValue(v71 / 0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.In))))
								end
								v_u_7:InvokeServer("Place", v_u_20, v70, v69)
								v_u_9:CreateNotification((("Successfully moved %*!"):format(v70.Name)))
								v_u_10:SetScale(v_u_10:CreateEffect({
									["Object"] = script.Place,
									["Emit"] = true,
									["Position"] = v_u_65.Position,
									["DebrisTime"] = 1
								}), 3, {})
								v_u_17:PlaySound(v_u_18.Gears.PlantTrowel, nil, nil, v_u_13)
								task.wait(0.4)
								v_u_26 = false
							end)
							for _, v72 in v_u_24 or {} do
								v72.Instance.CanCollide = v72.CanCollide
								v72.Instance.CanQuery = v72.CanQuery
							end
							v_u_24 = {}
							v_u_19 = nil
						end
					else
						v_u_9:CreateNotification("Can\'t place here!")
						return
					end
				else
					local v73 = v_u_43(v64)
					if v73 then
						if v_u_38(v73) then
							if v_u_20 and v_u_20.Name then
								v_u_26 = true
								v_u_7:InvokeServer("Pickup", v_u_20, v73)
								v_u_26 = false
								v_u_9:CreateNotification((("Picked up %*!"):format(v73.Name)))
								v_u_21 = v73:GetPivot()
								v_u_22 = v_u_21.Rotation
								for _, v74 in v73:GetDescendants() do
									if v74:IsA("BasePart") then
										local v75 = v_u_24
										local v76 = {
											["Instance"] = v74,
											["CanCollide"] = v74.CanCollide,
											["CanQuery"] = v74.CanQuery
										}
										table.insert(v75, v76)
										v74.CanCollide = false
										v74.CanQuery = false
									end
								end
								v_u_19 = v73
							else
								v_u_9:CreateNotification("Trowel not detected, please try again or report if this is an error!")
							end
						else
							v_u_9:CreateNotification("Can\'t move this!")
							return
						end
					else
						return
					end
				end
			end
		end
	end
end
local v_u_78 = nil
local function v79()
	-- upvalues: (ref) v_u_78, (copy) v_u_2, (copy) v_u_77, (copy) v_u_12
	if v_u_78 then
		v_u_78:Disconnect()
	end
	if v_u_2:GetLastInputType() == Enum.UserInputType.Touch then
		v_u_78 = v_u_2.TouchTapInWorld:Connect(v_u_77)
	else
		v_u_78 = v_u_12:GetMouse().Button1Down:Connect(v_u_77)
	end
end
v_u_2.LastInputTypeChanged:Connect(v79)
task.spawn(v79)
local v_u_80 = v16:FindFirstChild("TextLabel")
local v_u_81 = v15:FindFirstChild("TextLabel")
local v_u_82 = v_u_14.Frame.RotateFrame.RotateBG
local v_u_83 = v_u_14.Frame.CancelFrame.CancelBG
local v_u_84 = v_u_82:FindFirstChild("RotateIcon")
local v_u_85 = v_u_83:FindFirstChild("CancelIcon")
local function v90()
	-- upvalues: (copy) v_u_80, (copy) v_u_81, (copy) v_u_84, (copy) v_u_85, (copy) v_u_2, (copy) v_u_82, (copy) v_u_83
	if v_u_80 and v_u_81 then
		if v_u_84 and v_u_85 then
			local v86 = v_u_2.TouchEnabled
			local v87 = v_u_2.GamepadEnabled
			if v86 then
				v_u_80.Text = "Rotate"
				v_u_81.Text = "Cancel"
				v_u_84.Visible = false
				v_u_85.Visible = false
				return
			elseif v87 then
				local v88 = v_u_2:GetImageForKeyCode(Enum.KeyCode.DPadRight)
				local v89 = v_u_2:GetImageForKeyCode(Enum.KeyCode.ButtonB)
				v_u_80.Text = "Rotate"
				v_u_81.Text = "Cancel"
				if v88 then
					v_u_84.Image = v88
					v_u_82.Visible = true
				else
					v_u_82.Visible = false
				end
				if v89 then
					v_u_85.Image = v89
					v_u_83.Visible = true
				else
					v_u_83.Visible = false
				end
			else
				v_u_80.Text = "[R] Rotate"
				v_u_81.Text = "[C] Cancel"
				v_u_82.Visible = false
				v_u_83.Visible = false
				return
			end
		else
			return
		end
	else
		return
	end
end
v90()
v_u_2.LastInputTypeChanged:Connect(v90)
local function v_u_99()
	-- upvalues: (copy) v_u_12, (copy) v_u_8, (copy) v_u_11, (copy) v_u_2, (ref) v_u_19, (ref) v_u_22, (copy) v_u_54, (ref) v_u_99
	local v91 = false
	while not v91 do
		local v92 = v_u_12.Character:FindFirstChildOfClass("Tool")
		v92 = v92
		local v93
		if v92 then
			v93 = v92.Name:match("Trowel")
		else
			v93 = v92
		end
		local v94 = v93 and v92
		v_u_8(v_u_12)
		local v_u_95 = nil
		if v_u_12.Character and v94 then
			v94.Equipped:Connect(function()
				-- upvalues: (ref) v_u_11, (ref) v_u_95, (ref) v_u_2, (ref) v_u_19, (ref) v_u_22, (ref) v_u_54
				v_u_11:AddDisabler("Trowel")
				v_u_95 = v_u_2.InputBegan:Connect(function(p96, p97)
					-- upvalues: (ref) v_u_19, (ref) v_u_22, (ref) v_u_54
					if p97 then
						return
					elseif p96.KeyCode == Enum.KeyCode.R or p96.KeyCode == Enum.KeyCode.DPadRight then
						if v_u_19 then
							v_u_22 = v_u_22 * CFrame.Angles(0, 0.7853981633974483, 0)
						end
					else
						if p96.KeyCode == Enum.KeyCode.C or p96.KeyCode == Enum.KeyCode.ButtonB then
							v_u_54()
						end
						return
					end
				end)
			end)
			v94.Unequipped:Connect(function()
				-- upvalues: (ref) v_u_11, (ref) v_u_54, (ref) v_u_95
				v_u_11:RemoveDisabler("Trowel")
				v_u_54()
				if v_u_95 then
					local v98 = v_u_95
					if typeof(v98) == "RBXScriptConnection" then
						v_u_95:Disconnect()
					end
				end
			end)
			v94.Destroying:Once(v_u_99)
			v91 = true
		end
		task.wait(0.1)
	end
end
task.spawn(v_u_99)