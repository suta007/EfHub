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
local function v_u_33(p28)
	-- upvalues: (copy) v_u_8, (copy) v_u_12, (copy) v_u_27
	local v29 = v_u_8(v_u_12)
	if not v29 then
		return false
	end
	if not p28:IsDescendantOf(v29) then
		return false
	end
	local v30 = p28:HasTag("Growable")
	local v31 = p28.Parent.Name == "Fruits"
	local v32 = p28:HasTag("PlaceableObject")
	if v32 then
		v32 = p28.Parent.Name == "Objects_Physical"
	end
	return v30 and not v31 and true or (v32 and table.find(v_u_27, p28.Name) and true or false)
end
local function v_u_38(p34)
	-- upvalues: (copy) v_u_13, (copy) v_u_3
	local v35 = v_u_13:ViewportPointToRay(p34.X, p34.Y)
	local v36 = RaycastParams.new()
	v36.FilterType = Enum.RaycastFilterType.Exclude
	v36.FilterDescendantsInstances = { v_u_3:GetTagged("ShovelIgnore") }
	local v37 = workspace:Raycast(v35.Origin, v35.Direction * 500, v36)
	if v37 and v37.Instance then
		return v37.Instance:FindFirstAncestorOfClass("Model")
	end
end
local function v_u_43(p39)
	-- upvalues: (copy) v_u_13, (copy) v_u_8, (copy) v_u_12
	local v40 = v_u_13:ViewportPointToRay(p39.X, p39.Y)
	local v41 = RaycastParams.new()
	v41.FilterType = Enum.RaycastFilterType.Include
	v41.FilterDescendantsInstances = { v_u_8(v_u_12).Important.Plant_Locations:GetChildren() }
	local v42 = workspace:Raycast(v40.Origin, v40.Direction * 500, v41)
	if v42 and v42.Instance then
		return v42
	end
end
local function v44()
	-- upvalues: (ref) v_u_19, (ref) v_u_22
	if v_u_19 then
		v_u_22 = v_u_22 * CFrame.Angles(0, 0.7853981633974483, 0)
	end
end
local function v_u_48()
	-- upvalues: (ref) v_u_19, (ref) v_u_26, (ref) v_u_20, (ref) v_u_21, (copy) v_u_7, (copy) v_u_9, (ref) v_u_24, (copy) v_u_23, (copy) v_u_12
	if v_u_19 and (not v_u_26 and v_u_20) then
		local v45 = v_u_19
		v_u_19 = nil
		v45:PivotTo(v_u_21)
		v_u_7:InvokeServer("Cancel", v_u_20, v45)
		v_u_9:CreateNotification((("Canceled moving %*!"):format(v45.Name)))
		for _, v46 in v_u_24 or {} do
			v46.Instance.CanCollide = v46.CanCollide
			v46.Instance.CanQuery = v46.CanQuery
		end
		v_u_24 = {}
		v_u_23.Adornee = nil
		local v47 = v_u_12.Character:FindFirstChildOfClass("Humanoid")
		if v47 then
			v47:UnequipTools()
		end
	end
end
v_u_6.RenderStepped:Connect(function()
	-- upvalues: (copy) v_u_14, (ref) v_u_19, (ref) v_u_20, (copy) v_u_12, (ref) v_u_25, (copy) v_u_48, (copy) v_u_2, (copy) v_u_43, (ref) v_u_22, (ref) v_u_21, (copy) v_u_38, (copy) v_u_33, (copy) v_u_23, (copy) v_u_5
	v_u_14.Enabled = v_u_19 ~= nil
	local v49 = v_u_12.Character:FindFirstChildOfClass("Tool")
	local v50
	if v49 then
		v50 = v49.Name:match("Trowel")
	else
		v50 = v49
	end
	v_u_20 = v50 and v49
	if v_u_20 then
		if not v_u_25 then
			v_u_25 = v_u_20.Destroying:Once(function()
				-- upvalues: (ref) v_u_25, (ref) v_u_48
				v_u_25:Disconnect()
				v_u_25 = nil
				v_u_48()
			end)
		end
		local v51 = v_u_2:GetMouseLocation()
		if v_u_19 then
			local v52 = v_u_43(v51)
			if v52 and v52.Position then
				v_u_19:PivotTo(CFrame.new(v52.Position) * CFrame.new(0, 3, 0) * v_u_22)
			else
				v_u_19:PivotTo(v_u_21)
			end
		else
			local v53 = v_u_38(v51)
			if v53 then
				if v_u_33(v53) then
					if v_u_23.Adornee ~= v53 then
						v_u_23.FillTransparency = 1
						v_u_5:Create(v_u_23, TweenInfo.new(0.25), {
							["FillTransparency"] = 0.65
						}):Play()
					end
					v_u_23.Adornee = v53
				else
					v_u_23.Adornee = nil
				end
			else
				return
			end
		end
	else
		if v_u_19 then
			v_u_48()
		end
		v_u_23.Adornee = nil
		return
	end
end)
v15.Activated:Connect(v_u_48)
v16.Activated:Connect(v44)
local function v_u_70(p54, p55)
	-- upvalues: (copy) v_u_12, (ref) v_u_26, (copy) v_u_9, (copy) v_u_2, (ref) v_u_19, (copy) v_u_43, (copy) v_u_8, (copy) v_u_23, (ref) v_u_22, (ref) v_u_21, (copy) v_u_6, (copy) v_u_5, (copy) v_u_7, (ref) v_u_20, (copy) v_u_10, (copy) v_u_17, (copy) v_u_18, (copy) v_u_13, (ref) v_u_24, (copy) v_u_38, (copy) v_u_33
	if v_u_12.Character then
		local v56 = v_u_12.Character:FindFirstChildOfClass("Tool")
		local v57
		if v56 then
			v57 = v56.Name:match("Trowel")
		else
			v57 = v56
		end
		if v57 and v56 and not p55 then
			if v_u_26 then
				v_u_9:CreateNotification("Please wait before trying again!")
				return
			else
				local v58 = p54 or v_u_2:GetMouseLocation()
				if v_u_19 then
					local v_u_59 = v_u_43(v58)
					if v_u_59 and v_u_59.Instance.Name == "Can_Plant" then
						local v60 = RaycastParams.new()
						v60.FilterType = Enum.RaycastFilterType.Include
						v60.FilterDescendantsInstances = { v_u_8(v_u_12).Important.Plants_Physical:GetChildren() }
						if not workspace:Raycast(v_u_59.Position + Vector3.new(0, 20, 0), Vector3.new(0, -25, 0), v60) then
							v_u_23.Adornee = nil
							v_u_26 = true
							task.spawn(function()
								-- upvalues: (copy) v_u_59, (ref) v_u_22, (ref) v_u_21, (ref) v_u_19, (ref) v_u_6, (ref) v_u_5, (ref) v_u_7, (ref) v_u_20, (ref) v_u_9, (ref) v_u_10, (ref) v_u_17, (ref) v_u_18, (ref) v_u_13, (ref) v_u_26
								local v61 = CFrame.new(v_u_59.Position) * CFrame.new(0, 3, 0) * v_u_22
								local v62 = CFrame.new(v_u_59.Position.X, v_u_21.Y, v_u_59.Position.Z) * v_u_22
								local v63 = v_u_19
								v63:PivotTo(v61)
								local v64 = 0
								while v64 < 0.15 do
									v64 = v64 + v_u_6.Heartbeat:Wait()
									v63:PivotTo(v61:Lerp(v62, (v_u_5:GetValue(v64 / 0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.In))))
								end
								v_u_7:InvokeServer("Place", v_u_20, v63, v62)
								v_u_9:CreateNotification((("Successfully moved %*!"):format(v63.Name)))
								v_u_10:SetScale(v_u_10:CreateEffect({
									["Object"] = script.Place,
									["Emit"] = true,
									["Position"] = v_u_59.Position,
									["DebrisTime"] = 1
								}), 3, {})
								v_u_17:PlaySound(v_u_18.Gears.PlantTrowel, nil, nil, v_u_13)
								task.wait(0.4)
								v_u_26 = false
							end)
							for _, v65 in v_u_24 or {} do
								v65.Instance.CanCollide = v65.CanCollide
								v65.Instance.CanQuery = v65.CanQuery
							end
							v_u_24 = {}
							v_u_19 = nil
						end
					else
						v_u_9:CreateNotification("Can\'t place here!")
						return
					end
				else
					local v66 = v_u_38(v58)
					if v66 then
						if v_u_33(v66) then
							if v_u_20 and v_u_20.Name then
								v_u_26 = true
								v_u_7:InvokeServer("Pickup", v_u_20, v66)
								v_u_26 = false
								v_u_9:CreateNotification((("Picked up %*!"):format(v66.Name)))
								v_u_21 = v66:GetPivot()
								v_u_22 = v_u_21.Rotation
								for _, v67 in v66:GetDescendants() do
									if v67:IsA("BasePart") then
										local v68 = v_u_24
										local v69 = {
											["Instance"] = v67,
											["CanCollide"] = v67.CanCollide,
											["CanQuery"] = v67.CanQuery
										}
										table.insert(v68, v69)
										v67.CanCollide = false
										v67.CanQuery = false
									end
								end
								v_u_19 = v66
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
local v_u_71 = nil
local function v72()
	-- upvalues: (ref) v_u_71, (copy) v_u_2, (copy) v_u_70, (copy) v_u_12
	if v_u_71 then
		v_u_71:Disconnect()
	end
	if v_u_2:GetLastInputType() == Enum.UserInputType.Touch then
		v_u_71 = v_u_2.TouchTapInWorld:Connect(v_u_70)
	else
		v_u_71 = v_u_12:GetMouse().Button1Down:Connect(v_u_70)
	end
end
v_u_2.LastInputTypeChanged:Connect(v72)
task.spawn(v72)
local v_u_73 = v16:FindFirstChild("TextLabel")
local v_u_74 = v15:FindFirstChild("TextLabel")
local v_u_75 = v_u_14.Frame.RotateFrame.RotateBG
local v_u_76 = v_u_14.Frame.CancelFrame.CancelBG
local v_u_77 = v_u_75:FindFirstChild("RotateIcon")
local v_u_78 = v_u_76:FindFirstChild("CancelIcon")
local function v83()
	-- upvalues: (copy) v_u_73, (copy) v_u_74, (copy) v_u_77, (copy) v_u_78, (copy) v_u_2, (copy) v_u_75, (copy) v_u_76
	if v_u_73 and v_u_74 then
		if v_u_77 and v_u_78 then
			local v79 = v_u_2.TouchEnabled
			local v80 = v_u_2.GamepadEnabled
			if v79 then
				v_u_73.Text = "Rotate"
				v_u_74.Text = "Cancel"
				v_u_77.Visible = false
				v_u_78.Visible = false
				return
			elseif v80 then
				local v81 = v_u_2:GetImageForKeyCode(Enum.KeyCode.DPadRight)
				local v82 = v_u_2:GetImageForKeyCode(Enum.KeyCode.ButtonB)
				v_u_73.Text = "Rotate"
				v_u_74.Text = "Cancel"
				if v81 then
					v_u_77.Image = v81
					v_u_75.Visible = true
				else
					v_u_75.Visible = false
				end
				if v82 then
					v_u_78.Image = v82
					v_u_76.Visible = true
				else
					v_u_76.Visible = false
				end
			else
				v_u_73.Text = "[R] Rotate"
				v_u_74.Text = "[C] Cancel"
				v_u_75.Visible = false
				v_u_76.Visible = false
				return
			end
		else
			return
		end
	else
		return
	end
end
v83()
v_u_2.LastInputTypeChanged:Connect(v83)
local function v_u_92()
	-- upvalues: (copy) v_u_12, (copy) v_u_8, (copy) v_u_11, (copy) v_u_2, (ref) v_u_19, (ref) v_u_22, (copy) v_u_48, (ref) v_u_92
	local v84 = false
	while not v84 do
		local v85 = v_u_12.Character:FindFirstChildOfClass("Tool")
		v85 = v85
		local v86
		if v85 then
			v86 = v85.Name:match("Trowel")
		else
			v86 = v85
		end
		local v87 = v86 and v85
		v_u_8(v_u_12)
		local v_u_88 = nil
		if v_u_12.Character and v87 then
			v87.Equipped:Connect(function()
				-- upvalues: (ref) v_u_11, (ref) v_u_88, (ref) v_u_2, (ref) v_u_19, (ref) v_u_22, (ref) v_u_48
				v_u_11:AddDisabler("Trowel")
				v_u_88 = v_u_2.InputBegan:Connect(function(p89, p90)
					-- upvalues: (ref) v_u_19, (ref) v_u_22, (ref) v_u_48
					if p90 then
						return
					elseif p89.KeyCode == Enum.KeyCode.R or p89.KeyCode == Enum.KeyCode.DPadRight then
						if v_u_19 then
							v_u_22 = v_u_22 * CFrame.Angles(0, 0.7853981633974483, 0)
						end
					else
						if p89.KeyCode == Enum.KeyCode.C or p89.KeyCode == Enum.KeyCode.ButtonB then
							v_u_48()
						end
						return
					end
				end)
			end)
			v87.Unequipped:Connect(function()
				-- upvalues: (ref) v_u_11, (ref) v_u_48, (ref) v_u_88
				v_u_11:RemoveDisabler("Trowel")
				v_u_48()
				if v_u_88 then
					local v91 = v_u_88
					if typeof(v91) == "RBXScriptConnection" then
						v_u_88:Disconnect()
					end
				end
			end)
			v87.Destroying:Once(v_u_92)
			v84 = true
		end
		task.wait(0.1)
	end
end
task.spawn(v_u_92)