local v_u_1 = game:GetService("ReplicatedStorage")
local v2 = game:GetService("Players")
game:GetService("RunService")
local v3 = game:GetService("CollectionService")
local v_u_4 = game:GetService("TweenService")
local v_u_5 = game:GetService("RunService")
game:GetService("SoundService")
require(v_u_1.Modules.Chalk)
require(v_u_1.Modules.PolicyService)
require(v_u_1.Modules.PetTraitsData)
require(v_u_1.Calculate_Weight)
require(v_u_1.Modules.UpdateService)
require(v_u_1.Modules.CountDictionary)
local v_u_6 = require(v_u_1.Modules.DataService)
local v_u_7 = require(v_u_1.Modules.TimeHelper)
require(v_u_1.Modules.NumberUtil)
local v_u_8 = require(v_u_1.Modules.SelectiveAssetReplication)
local v_u_9 = require(v_u_1.Modules.GuiController)
local v_u_10 = require(v_u_1.Modules.PetAgeBreakUIController)
local v_u_11 = require(v_u_1.Data.SoundData)
local v_u_12 = require(v_u_1.Modules.SoundPlayer)
local v_u_13 = require(v_u_1.Data.PetRegistry).PetList
local v_u_14 = require(v_u_1.Data.EnumRegistry.InventoryServiceEnums)
local v_u_15 = require(v_u_1.Data.EnumRegistry.ItemTypeEnums)
require(v_u_1.Data.DefaultData)
require(v_u_1.Data.PetAgeBreakMachineData)
local v16 = v_u_1:WaitForChild("GameEvents")
local _ = v16.PetAgeLimitBreak_Submit
local v_u_17 = v16.PetAgeLimitBreak_SubmitHeld
local _ = v16.PetAgeLimitBreak_Cancel
local v_u_18 = v16.PetAgeLimitBreak_Skip
local v_u_19 = v16.PetAgeLimitBreak_Claim
local v20 = v16.PetAgeLimitBreak_PlayEffects
local v_u_21 = v2.LocalPlayer
local v_u_22 = v_u_21:WaitForChild("PlayerGui"):WaitForChild("PetAgeBreak_UI")
local v_u_23 = false
local v_u_24 = nil
local v_u_25 = v3:GetTagged("PetAgeMachine")[1]
local v_u_26 = v_u_25:FindFirstChild("TimerTextLabel", true)
local v_u_27 = v_u_25:FindFirstChild("PetModelLocation", true)
local v_u_28 = nil
local v_u_29 = v_u_25:FindFirstChild("PetAgeMachineProximityPrompt", true)
local function v_u_31()
	-- upvalues: (copy) v_u_21, (copy) v_u_6
	if v_u_21 then
		local v30 = v_u_6:GetData()
		if v30 then
			return v30.PetAgeBreakMachine or warn((("No PetAgeBreakMachine data for %*!"):format(v_u_21.Name)))
		else
			return warn((("No PlayerData for %*!"):format(v_u_21)))
		end
	else
		return warn("No LocalPlayer!")
	end
end
local function v_u_44()
	-- upvalues: (copy) v_u_31, (ref) v_u_24, (copy) v_u_8, (copy) v_u_13, (copy) v_u_27
	local v32 = v_u_31()
	if v32 then
		if v32.SubmittedPet then
			local v33 = v_u_8:GetAssetAsync("PetAssets", v32.SubmittedPet.PetType):Clone()
			local v34 = v_u_13[v32.SubmittedPet.PetType]
			v33:SetPrimaryPartCFrame(CFrame.new(v33:GetPrimaryPartCFrame().Position) * v34.WeldOffset)
			v_u_24 = v33
			if v_u_24 then
				if v_u_24.PrimaryPart and v_u_27.PrimaryPart then
					local v35 = v_u_24:GetExtentsSize()
					local v36 = v_u_27:GetExtentsSize()
					local v37 = v36.X / v35.X
					local v38 = v36.Y / v35.Y
					local v39 = v36.Z / v35.Z
					local v40 = math.min(v37, v38, v39)
					for _, v41 in v_u_24:GetDescendants() do
						if v41:IsA("BasePart") then
							v41.Anchored = true
						end
					end
					v_u_24:ScaleTo(v40)
					local v42 = v_u_24:GetPivot().Rotation
					local v43 = v_u_27:GetPivot().Position
					v_u_24:PivotTo(CFrame.new(v43) * v42)
					v_u_24.Parent = v_u_27
				else
					warn("Both models need a PrimaryPart set.")
				end
			else
				return
			end
		else
			if v_u_24 then
				v_u_24:Destroy()
				v_u_24 = nil
			end
			return
		end
	else
		return
	end
end
local v_u_45 = 0
task.spawn(function()
	-- upvalues: (copy) v_u_31, (copy) v_u_29
	local v46 = v_u_31()
	if v46 then
		v_u_29.Enabled = true
		if v46.IsRunning or v46.TimeLeft > 0 then
			v_u_29.ActionText = "Skip"
			return
		elseif v46.PetReady then
			v_u_29.ActionText = "Claim Pet"
			return
		elseif v46.SubmittedPet and not v46.IsRunning then
			v_u_29.ActionText = "Select Dupes"
		elseif not v46.SubmittedPet then
			v_u_29.ActionText = "Submit Pet"
		end
	else
		return
	end
end)
local function v85(p47)
	-- upvalues: (copy) v_u_25, (ref) v_u_24, (copy) v_u_1, (copy) v_u_5, (ref) v_u_45, (copy) v_u_21, (copy) v_u_12, (copy) v_u_11, (copy) v_u_4, (copy) v_u_13
	local v48 = v_u_25:FindFirstChild("PetAgeMachinePoof")
	local v49 = v48.PixelSmoke
	if v_u_24 then
		local v_u_50 = v_u_24:Clone()
		v_u_50.Parent = v_u_24.Parent
		v_u_24.Parent = v_u_1
		local v55 = v_u_5.RenderStepped:Connect(function(_)
			-- upvalues: (copy) v_u_50, (ref) v_u_45
			local v51 = v_u_50
			local v52 = v_u_45
			local v53 = math.sin(v52) * 0.01
			local v54 = CFrame.Angles(0, 0.008726646259971648, 0)
			v51:PivotTo((v51:GetPivot() + Vector3.new(0, v53, 0)) * v54)
		end)
		local v56 = v_u_21.Character
		if v56 then
			v_u_12:PlaySound(v_u_11.MachineSounds.SFX, {}, nil, v48)
			local v57 = v_u_25:GetPivot()
			local v58 = 0
			while v58 < 1.5 do
				v58 = v58 + v_u_5.Heartbeat:Wait()
				local v59 = v_u_4:GetValue(v58 / 1.5, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)
				local v60 = math.lerp(0.01, 0.1, v59)
				local v61 = math.random(-100, 100) / 100 * v60
				local v62 = math.random(-100, 100) / 100 * v60
				local v63 = math.random(-100, 100) / 100 * v60
				v_u_25:PivotTo(v57 + Vector3.new(v61, v62, v63))
			end
			v49:Emit(26)
			v_u_50:Destroy()
			v55:Disconnect()
			local v64 = v_u_13[p47.Name]
			local v65
			if v64 and v64.WeldOffset then
				v65 = v64.WeldOffset
			else
				v65 = nil
			end
			local v66 = CFrame.lookAt(v_u_50:GetPivot().Position, v56:GetPivot().Position) * v65
			local v67 = p47:Clone()
			v67:ScaleTo(v_u_50:GetScale())
			v67:PivotTo(v66)
			for _, v68 in v67:GetDescendants() do
				if v68:IsA("BasePart") then
					v68.Anchored = true
				end
			end
			local v69, v70 = v67:GetBoundingBox()
			local v71 = Instance.new("Part")
			v71.CFrame = v69
			v71.Name = "TrailPart"
			v71.Anchored = true
			v71.CanCollide = false
			v71.CanQuery = false
			v71.CanTouch = false
			v71.Size = v70
			v71.Transparency = 1
			local v72 = Instance.new("Attachment")
			v72.Name = "Attachment"
			v72.CFrame = CFrame.new(0, v70.Y * 0.5, 0)
			v72.Parent = v71
			local v73 = Instance.new("Attachment")
			v73.Name = "Attachment"
			v73.CFrame = CFrame.new(0, -v70.Y * 0.5, 0)
			v73.Parent = v71
			local v74 = Instance.new("Trail")
			v74.Name = "Trail"
			v74.FaceCamera = true
			v74.Lifetime = 0.5
			v74.Attachment0 = v72
			v74.Attachment0 = v73
			v74.Transparency = NumberSequence.new({
				NumberSequenceKeypoint.new(0, 1),
				NumberSequenceKeypoint.new(0.05, 1),
				NumberSequenceKeypoint.new(0.055, 0.4875),
				NumberSequenceKeypoint.new(1, 1)
			})
			v74.WidthScale = NumberSequence.new({ NumberSequenceKeypoint.new(0, 1), NumberSequenceKeypoint.new(1, 0) })
			v74.Parent = v71
			v71.Parent = v67
			v67.Parent = workspace.CurrentCamera
			task.wait(0.8)
			local v75 = v67:GetScale()
			local v76 = 0
			while v76 < 0.8 do
				v76 = v76 + v_u_5.Heartbeat:Wait()
				local v77 = v66.Position
				local v78 = v56:GetPivot().Position
				local v79 = v77 + (v78 - v77) * 0.5 + Vector3.new(0, 14, 0)
				local v80 = v_u_4:GetValue(v76 / 0.8, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)
				local v81 = (v76 - 0.4) / 0.4
				local v82 = math.clamp(v81, 0, 1)
				v67:ScaleTo((math.lerp(v75, 0.05, v82)))
				v67:PivotTo(CFrame.new((1 - v80) ^ 2 * v77 + (1 - v80) * 2 * v80 * v79 + v80 ^ 2 * v78) * v66.Rotation)
			end
			v67:Destroy()
			local v_u_83 = workspace.Terrain.PopEffect:Clone()
			v_u_83.CFrame = v56:GetPivot()
			v_u_12:PlaySound(v_u_11.MachineSounds.Retrieve, {}, nil, v_u_83)
			v_u_83.Parent = workspace.Terrain
			for _, v84 in v_u_83:GetChildren() do
				if v84:IsA("ParticleEmitter") then
					v84:Emit(1)
				end
			end
			task.delay(1.5, function()
				-- upvalues: (copy) v_u_83
				v_u_83:Destroy()
			end)
		end
	else
		return
	end
end
v_u_29.Triggered:Connect(function()
	-- upvalues: (ref) v_u_23, (copy) v_u_31, (copy) v_u_18, (copy) v_u_19, (copy) v_u_10, (copy) v_u_21, (copy) v_u_14, (copy) v_u_15, (copy) v_u_17
	if v_u_23 then
		return
	else
		v_u_23 = true
		task.delay(0.5, function()
			-- upvalues: (ref) v_u_23
			v_u_23 = false
		end)
		local v86 = v_u_31()
		if v86 then
			if v86.IsRunning or v86.TimeLeft > 0 then
				v_u_18:FireServer()
			end
			if v86.PetReady then
				v_u_19:FireServer()
				return
			elseif v86.SubmittedPet and not v86.IsRunning then
				v_u_10:Open()
			elseif not v86.SubmittedPet then
				local v87 = v_u_21.Character
				if not v87 then
					return
				end
				local v88 = v87:FindFirstChildWhichIsA("Tool")
				if not v88 then
					return
				end
				if v88:GetAttribute(v_u_14.ITEM_TYPE) ~= v_u_15.Pet then
					return
				end
				v_u_17:FireServer()
			end
		else
			return
		end
	end
end)
local function v_u_92()
	-- upvalues: (copy) v_u_6
	local v89 = v_u_6:GetData()
	local v90 = false
	for _, v91 in v89.PetsData.PetInventory.Data do
		if v91 and (v91.PetData and v91.PetData.Level >= 70) then
			v90 = true
			break
		end
	end
	return (v89.PetAgeBreakMachine.IsRunning or (v89.PetAgeBreakMachine.PetReady or v89.PetAgeBreakMachine.SubmittedPet)) and true or v90
end
v_u_29.PromptHidden:Connect(function()
	-- upvalues: (copy) v_u_9, (copy) v_u_22
	v_u_9:Close(v_u_22)
end)
v_u_6:GetPathSignal("PetAgeBreakMachine/IsRunning"):Connect(function()
	-- upvalues: (copy) v_u_31, (copy) v_u_29, (copy) v_u_7, (copy) v_u_26, (copy) v_u_12, (copy) v_u_11, (copy) v_u_25, (ref) v_u_28
	local v93 = v_u_31()
	if v93 then
		local v94 = v_u_31()
		if v94 then
			v_u_29.Enabled = true
			if v94.IsRunning or v94.TimeLeft > 0 then
				v_u_29.ActionText = "Skip"
			elseif v94.PetReady then
				v_u_29.ActionText = "Claim Pet"
			elseif v94.SubmittedPet and not v94.IsRunning then
				v_u_29.ActionText = "Select Dupes"
			elseif not v94.SubmittedPet then
				v_u_29.ActionText = "Submit Pet"
			end
		end
		local v95 = v_u_31()
		if v95 then
			local v96 = v_u_7:GenerateColonFormatFromTime(v95.TimeLeft)
			if v95.TimeLeft > 0 then
				v_u_26.Text = ("%*"):format(v96)
			elseif v95.PetReady then
				v_u_26.Text = "READY"
			else
				v_u_26.Text = ""
			end
		end
		if v93.IsRunning then
			v_u_12:PlaySound(v_u_11.MachineSounds.Start, {}, nil, v_u_25)
			if v_u_28 then
				v_u_28:Play()
			else
				v_u_28 = v_u_12:PlaySound(v_u_11.MachineSounds.Loop, {
					["Looped"] = true
				}, nil, v_u_25)
			end
		else
			v_u_12:PlaySound(v_u_11.MachineSounds.LoopDone)
			v_u_28:Stop()
			task.spawn(function()
				-- upvalues: (ref) v_u_12, (ref) v_u_11
				task.wait(1)
				v_u_12:PlaySound(v_u_11.MachineSounds.Finished)
			end)
			return
		end
	else
		return
	end
end)
v_u_6:GetPathSignal("PetAgeBreakMachine/SubmittedPet"):Connect(function()
	-- upvalues: (copy) v_u_31, (copy) v_u_29, (copy) v_u_7, (copy) v_u_26, (copy) v_u_44, (copy) v_u_12, (copy) v_u_11
	local v97 = v_u_31()
	if v97 then
		local v98 = v_u_31()
		if v98 then
			v_u_29.Enabled = true
			if v98.IsRunning or v98.TimeLeft > 0 then
				v_u_29.ActionText = "Skip"
			elseif v98.PetReady then
				v_u_29.ActionText = "Claim Pet"
			elseif v98.SubmittedPet and not v98.IsRunning then
				v_u_29.ActionText = "Select Dupes"
			elseif not v98.SubmittedPet then
				v_u_29.ActionText = "Submit Pet"
			end
		end
		local v99 = v_u_31()
		if v99 then
			local v100 = v_u_7:GenerateColonFormatFromTime(v99.TimeLeft)
			if v99.TimeLeft > 0 then
				v_u_26.Text = ("%*"):format(v100)
			elseif v99.PetReady then
				v_u_26.Text = "READY"
			else
				v_u_26.Text = ""
			end
		end
		v_u_44()
		if v97.SubmittedPet then
			v_u_12:PlaySound(v_u_11.MachineSounds.Insert)
		end
	end
end)
v_u_5.RenderStepped:Connect(function(p101)
	-- upvalues: (ref) v_u_24, (ref) v_u_45
	if v_u_24 then
		if v_u_24.PrimaryPart then
			v_u_45 = v_u_45 + p101
			local v102 = v_u_24
			local v103 = v_u_45
			local v104 = math.sin(v103) * 0.01
			local v105 = CFrame.Angles(0, 0.008726646259971648, 0)
			v102:PivotTo((v102:GetPivot() + Vector3.new(0, v104, 0)) * v105)
		end
	end
end)
task.spawn(function()
	-- upvalues: (copy) v_u_31, (copy) v_u_29, (copy) v_u_7, (copy) v_u_26
	while true do
		task.wait(0.5)
		local v106 = v_u_31()
		if v106 then
			v_u_29.Enabled = true
			if v106.IsRunning or v106.TimeLeft > 0 then
				v_u_29.ActionText = "Skip"
			elseif v106.PetReady then
				v_u_29.ActionText = "Claim Pet"
			elseif v106.SubmittedPet and not v106.IsRunning then
				v_u_29.ActionText = "Select Dupes"
			elseif not v106.SubmittedPet then
				v_u_29.ActionText = "Submit Pet"
			end
		end
		local v107 = v_u_31()
		if v107 then
			local v108 = v_u_7:GenerateColonFormatFromTime(v107.TimeLeft)
			if v107.TimeLeft > 0 then
				v_u_26.Text = ("%*"):format(v108)
			elseif v107.PetReady then
				v_u_26.Text = "READY"
			else
				v_u_26.Text = ""
			end
		end
	end
end)
task.spawn(function()
	-- upvalues: (copy) v_u_31, (copy) v_u_29, (copy) v_u_7, (copy) v_u_26, (copy) v_u_44
	if v_u_31() then
		local v109 = v_u_31()
		if v109 then
			v_u_29.Enabled = true
			if v109.IsRunning or v109.TimeLeft > 0 then
				v_u_29.ActionText = "Skip"
			elseif v109.PetReady then
				v_u_29.ActionText = "Claim Pet"
			elseif v109.SubmittedPet and not v109.IsRunning then
				v_u_29.ActionText = "Select Dupes"
			elseif not v109.SubmittedPet then
				v_u_29.ActionText = "Submit Pet"
			end
		end
		local v110 = v_u_31()
		if v110 then
			local v111 = v_u_7:GenerateColonFormatFromTime(v110.TimeLeft)
			if v110.TimeLeft > 0 then
				v_u_26.Text = ("%*"):format(v111)
			elseif v110.PetReady then
				v_u_26.Text = "READY"
			else
				v_u_26.Text = ""
			end
		end
		v_u_44()
	end
end)
task.spawn(function()
	-- upvalues: (copy) v_u_25, (copy) v_u_92
	v_u_25.Parent = script
	while not v_u_92() do
		v_u_25.Parent = script
		task.wait(5)
	end
	v_u_25.Parent = workspace
end)
v20.OnClientEvent:Connect(v85)
return {}