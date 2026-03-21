local v1 = {}
local v_u_2 = game:GetService("ReplicatedStorage")
local v3 = game:GetService("Players")
game:GetService("RunService")
local v4 = game:GetService("CollectionService")
local v_u_5 = game:GetService("TweenService")
local v_u_6 = game:GetService("RunService")
game:GetService("SoundService")
require(v_u_2.Modules.MutationHandler)
require(v_u_2.Modules.Chalk)
local v_u_7 = require(v_u_2.Modules.PolicyService)
require(v_u_2.Modules.PetTraitsData)
require(v_u_2.Calculate_Weight)
require(v_u_2.Modules.UpdateService)
require(v_u_2.Modules.CountDictionary)
local v_u_8 = require(v_u_2.Modules.DataService)
local v_u_9 = require(v_u_2.Modules.TimeHelper)
local v_u_10 = require(v_u_2.Modules.NumberUtil)
local v_u_11 = require(v_u_2.Modules.SelectiveAssetReplication)
local v_u_12 = require(v_u_2.Modules.RebirthUnlocksSharedService)
local v_u_13 = require(v_u_2.Modules.ConfirmationPromptController)
local v_u_14 = require(v_u_2.Data.SoundData)
local v_u_15 = require(v_u_2.Modules.SoundPlayer)
local v_u_16 = require(v_u_2.Data.PetRegistry).PetList
local v_u_17 = require(v_u_2.Modules.PetServices.PetsService)
local v_u_18 = require(v_u_2.Data.EnumRegistry.InventoryServiceEnums)
local v_u_19 = require(v_u_2.Data.EnumRegistry.ItemTypeEnums)
require(v_u_2.Data.DefaultData)
local v_u_20 = require(v_u_2.Data.PetMutationMachineData)
local v_u_21 = v_u_2:WaitForChild("GameEvents").PetMutationMachineService_RE
local v_u_22 = v3.LocalPlayer
local v_u_23 = false
local v_u_24 = nil
local v25 = v4:GetTagged("PetMutationMachine")
if #v25 <= 0 then
	warn("Cannot find Pet Mutation machine")
	return {}
end
local v_u_26 = v25[1]
local v_u_27 = v_u_26:FindFirstChild("TimerTextLabel", true)
local v_u_28 = v_u_26:FindFirstChild("PetModelLocation", true)
local v_u_29 = {}
local v_u_30 = nil
local v_u_31 = v_u_26:FindFirstChild("PetMutationMachineProximityPrompt", true)
local function v_u_33()
	-- upvalues: (copy) v_u_22, (copy) v_u_8
	if v_u_22 then
		local v32 = v_u_8:GetData()
		if v32 then
			return v32.PetMutationMachine or warn((("No PetMuationMachine data for %*!"):format(v_u_22.Name)))
		else
			return warn((("No PlayerData for %*!"):format(v_u_22)))
		end
	else
		return warn("No LocalPlayer!")
	end
end
local function v_u_46()
	-- upvalues: (copy) v_u_33, (ref) v_u_24, (copy) v_u_11, (copy) v_u_16, (copy) v_u_28
	local v34 = v_u_33()
	if v34 then
		if v34.SubmittedPet then
			local v35 = v_u_11:GetAssetAsync("PetAssets", v34.SubmittedPet.PetType):Clone()
			local v36 = v_u_16[v34.SubmittedPet.PetType]
			v35:SetPrimaryPartCFrame(CFrame.new(v35:GetPrimaryPartCFrame().Position) * v36.WeldOffset)
			v_u_24 = v35
			if v_u_24 then
				if v_u_24.PrimaryPart and v_u_28.PrimaryPart then
					local v37 = v_u_24:GetExtentsSize()
					local v38 = v_u_28:GetExtentsSize()
					local v39 = v38.X / v37.X
					local v40 = v38.Y / v37.Y
					local v41 = v38.Z / v37.Z
					local v42 = math.min(v39, v40, v41)
					for _, v43 in v_u_24:GetDescendants() do
						if v43:IsA("BasePart") then
							v43.Anchored = true
						end
					end
					v_u_24:ScaleTo(v42)
					local v44 = v_u_24:GetPivot().Rotation
					local v45 = v_u_28:GetPivot().Position
					v_u_24:PivotTo(CFrame.new(v45) * v44)
					v_u_24.Parent = v_u_28
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
local v_u_47 = 0
local v_u_48 = nil
local function v_u_50()
	-- upvalues: (copy) v_u_29, (copy) v_u_22, (copy) v_u_31, (copy) v_u_33, (ref) v_u_48, (copy) v_u_10, (copy) v_u_20
	if v_u_29[v_u_22] then
		v_u_31.Enabled = false
		return
	else
		local v49 = v_u_33()
		if v49 then
			v_u_31.Enabled = true
			if v49.IsRunning or v49.TimeLeft > 0 then
				if v_u_48 and v_u_48.ArePaidRandomItemsRestricted then
					v_u_31.Enabled = false
				else
					v_u_31.ActionText = "Skip"
				end
			elseif v49.PetReady then
				v_u_31.ActionText = "Claim Pet"
				return
			elseif v49.SubmittedPet and not v49.IsRunning then
				v_u_31.ActionText = ("Start Mutation: %*"):format((v_u_10.DisplaySheckles(v_u_20.MUTATE_PRICE)))
			elseif not v49.SubmittedPet then
				v_u_31.ActionText = "Submit Pet"
			end
		else
			return
		end
	end
end
task.spawn(function()
	-- upvalues: (ref) v_u_48, (copy) v_u_7, (copy) v_u_22, (copy) v_u_50
	v_u_48 = v_u_7:GetPolicyInfoForPlayerAsync(v_u_22)
	v_u_50()
end)
local function v90(p51, p52)
	-- upvalues: (copy) v_u_26, (ref) v_u_24, (copy) v_u_2, (copy) v_u_6, (ref) v_u_47, (copy) v_u_22, (copy) v_u_15, (copy) v_u_14, (copy) v_u_5, (copy) v_u_16
	local v53 = v_u_26:FindFirstChild("PetMutationMachinePoof")
	local v54 = v53.PixelSmoke
	if v_u_24 then
		local v_u_55 = v_u_24:Clone()
		v_u_55.Parent = v_u_24.Parent
		v_u_24.Parent = v_u_2
		local v60 = v_u_6.RenderStepped:Connect(function(_)
			-- upvalues: (copy) v_u_55, (ref) v_u_47
			local v56 = v_u_55
			local v57 = v_u_47
			local v58 = math.sin(v57) * 0.01
			local v59 = CFrame.Angles(0, 0.008726646259971648, 0)
			v56:PivotTo((v56:GetPivot() + Vector3.new(0, v58, 0)) * v59)
		end)
		local v61 = v_u_22.Character
		if v61 then
			v_u_15:PlaySound(v_u_14.MachineSounds.SFX, {}, nil, v53)
			local v62 = v_u_26:GetPivot()
			local v63 = 0
			while v63 < 1.5 do
				v63 = v63 + v_u_6.Heartbeat:Wait()
				local v64 = v_u_5:GetValue(v63 / 1.5, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)
				local v65 = math.lerp(0.01, 0.1, v64)
				local v66 = math.random(-100, 100) / 100 * v65
				local v67 = math.random(-100, 100) / 100 * v65
				local v68 = math.random(-100, 100) / 100 * v65
				v_u_26:PivotTo(v62 + Vector3.new(v66, v67, v68))
			end
			v54:Emit(26)
			v_u_55:Destroy()
			v60:Disconnect()
			local v69 = v_u_16[p51.Name]
			local v70
			if v69 and v69.WeldOffset then
				v70 = v69.WeldOffset
			else
				v70 = nil
			end
			local v71 = CFrame.lookAt(v_u_55:GetPivot().Position, v61:GetPivot().Position) * v70
			local v72 = p51:Clone()
			v72:ScaleTo(v_u_55:GetScale() * p52)
			v72:PivotTo(v71)
			for _, v73 in v72:GetDescendants() do
				if v73:IsA("BasePart") then
					v73.Anchored = true
				end
			end
			local v74, v75 = v72:GetBoundingBox()
			local v76 = Instance.new("Part")
			v76.CFrame = v74
			v76.Name = "TrailPart"
			v76.Anchored = true
			v76.CanCollide = false
			v76.CanQuery = false
			v76.CanTouch = false
			v76.Size = v75
			v76.Transparency = 1
			local v77 = Instance.new("Attachment")
			v77.Name = "Attachment"
			v77.CFrame = CFrame.new(0, v75.Y * 0.5, 0)
			v77.Parent = v76
			local v78 = Instance.new("Attachment")
			v78.Name = "Attachment"
			v78.CFrame = CFrame.new(0, -v75.Y * 0.5, 0)
			v78.Parent = v76
			local v79 = Instance.new("Trail")
			v79.Name = "Trail"
			v79.FaceCamera = true
			v79.Lifetime = 0.5
			v79.Attachment0 = v77
			v79.Attachment0 = v78
			v79.Transparency = NumberSequence.new({
				NumberSequenceKeypoint.new(0, 1),
				NumberSequenceKeypoint.new(0.05, 1),
				NumberSequenceKeypoint.new(0.055, 0.4875),
				NumberSequenceKeypoint.new(1, 1)
			})
			v79.WidthScale = NumberSequence.new({ NumberSequenceKeypoint.new(0, 1), NumberSequenceKeypoint.new(1, 0) })
			v79.Parent = v76
			v76.Parent = v72
			v72.Parent = workspace.CurrentCamera
			task.wait(0.8)
			local v80 = v72:GetScale()
			local v81 = 0
			while v81 < 0.8 do
				v81 = v81 + v_u_6.Heartbeat:Wait()
				local v82 = v71.Position
				local v83 = v61:GetPivot().Position
				local v84 = v82 + (v83 - v82) * 0.5 + Vector3.new(0, 14, 0)
				local v85 = v_u_5:GetValue(v81 / 0.8, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)
				local v86 = (v81 - 0.4) / 0.4
				local v87 = math.clamp(v86, 0, 1)
				v72:ScaleTo((math.lerp(v80, 0.05, v87)))
				v72:PivotTo(CFrame.new((1 - v85) ^ 2 * v82 + (1 - v85) * 2 * v85 * v84 + v85 ^ 2 * v83) * v71.Rotation)
			end
			v72:Destroy()
			local v_u_88 = workspace.Terrain.PopEffect:Clone()
			v_u_88.CFrame = v61:GetPivot()
			v_u_15:PlaySound(v_u_14.MachineSounds.Retrieve, {}, nil, v_u_88)
			v_u_88.Parent = workspace.Terrain
			for _, v89 in v_u_88:GetChildren() do
				if v89:IsA("ParticleEmitter") then
					v89:Emit(1)
				end
			end
			task.delay(1.5, function()
				-- upvalues: (copy) v_u_88
				v_u_88:Destroy()
			end)
		end
	else
		return
	end
end
v_u_31.Triggered:Connect(function()
	-- upvalues: (ref) v_u_23, (copy) v_u_33, (copy) v_u_21, (copy) v_u_22, (copy) v_u_18, (copy) v_u_19, (copy) v_u_17, (copy) v_u_2, (copy) v_u_13
	if v_u_23 then
		return
	else
		v_u_23 = true
		task.delay(0.5, function()
			-- upvalues: (ref) v_u_23
			v_u_23 = false
		end)
		local v91 = v_u_33()
		if v91 then
			if v91.IsRunning or v91.TimeLeft > 0 then
				v_u_21:FireServer("AuthoriseSkip")
			end
			if v91.PetReady then
				v_u_21:FireServer("ClaimMutatedPet")
				return
			elseif v91.SubmittedPet and not v91.IsRunning then
				v_u_21:FireServer("StartMachine")
			elseif not v91.SubmittedPet then
				local v92 = v_u_22.Character
				if not v92 then
					return
				end
				local v93 = v92:FindFirstChildWhichIsA("Tool")
				if not v93 then
					return
				end
				if v93:GetAttribute(v_u_18.ITEM_TYPE) ~= v_u_19.Pet then
					return
				end
				local v94 = v_u_17:GetPlayerPetData(v93:GetAttribute("PET_UUID"))
				local v95 = require(v_u_2.Data.PetRegistry.PetList)[v94.PetType]
				local v96 = not v95 and "Common" or v95.Rarity
				local v97 = {
					["Title"] = "Submit Pet To Mutation Machine",
					["Header"] = "Are you sure you want to submit that pet?"
				}
				local v98 = v93:GetAttribute(v_u_18.ItemName) or v93.Name
				v97.Middle = ("%*"):format((tostring(v98)))
				v97.Footer = "Your pet will reset back to age 1."
				local v99 = {}
				local v100 = v93:GetAttribute(v_u_18.ItemName) or v93.Name
				v99[("%*"):format((tostring(v100)))] = v96
				v97.AnimatedWords = v99
				v_u_13:Open(v97, {
					["ConfirmEvent"] = v_u_21,
					["ConfirmEventData"] = { "SubmitHeldPet" }
				})
			end
		else
			return
		end
	end
end)
v_u_8:GetPathSignal("PetMutationMachine/IsRunning"):Connect(function()
	-- upvalues: (copy) v_u_33, (copy) v_u_50, (copy) v_u_9, (copy) v_u_27, (copy) v_u_15, (copy) v_u_14, (copy) v_u_26, (ref) v_u_30
	local v101 = v_u_33()
	if v101 then
		v_u_50()
		local v102 = v_u_33()
		if v102 then
			local v103 = v_u_9:GenerateColonFormatFromTime(v102.TimeLeft)
			if v102.TimeLeft > 0 then
				v_u_27.Text = ("%*"):format(v103)
			elseif v102.PetReady then
				v_u_27.Text = "READY"
			else
				v_u_27.Text = ""
			end
		end
		if v101.IsRunning then
			v_u_15:PlaySound(v_u_14.MachineSounds.Start, {}, nil, v_u_26)
			if v_u_30 then
				v_u_30:Play()
			else
				v_u_30 = v_u_15:PlaySound(v_u_14.MachineSounds.Loop, {
					["Looped"] = true
				}, nil, v_u_26)
			end
		else
			v_u_15:PlaySound(v_u_14.MachineSounds.LoopDone)
			v_u_30:Stop()
			task.spawn(function()
				-- upvalues: (ref) v_u_15, (ref) v_u_14
				task.wait(1)
				v_u_15:PlaySound(v_u_14.MachineSounds.Finished)
			end)
			return
		end
	else
		return
	end
end)
v_u_8:GetPathSignal("PetMutationMachine/SubmittedPet"):Connect(function()
	-- upvalues: (copy) v_u_33, (copy) v_u_50, (copy) v_u_9, (copy) v_u_27, (copy) v_u_46, (copy) v_u_15, (copy) v_u_14
	local v104 = v_u_33()
	if v104 then
		v_u_50()
		local v105 = v_u_33()
		if v105 then
			local v106 = v_u_9:GenerateColonFormatFromTime(v105.TimeLeft)
			if v105.TimeLeft > 0 then
				v_u_27.Text = ("%*"):format(v106)
			elseif v105.PetReady then
				v_u_27.Text = "READY"
			else
				v_u_27.Text = ""
			end
		end
		v_u_46()
		if v104.SubmittedPet then
			v_u_15:PlaySound(v_u_14.MachineSounds.Insert)
		end
	end
end)
v_u_6.RenderStepped:Connect(function(p107)
	-- upvalues: (ref) v_u_24, (ref) v_u_47
	if v_u_24 then
		if v_u_24.PrimaryPart then
			v_u_47 = v_u_47 + p107
			local v108 = v_u_24
			local v109 = v_u_47
			local v110 = math.sin(v109) * 0.01
			local v111 = CFrame.Angles(0, 0.008726646259971648, 0)
			v108:PivotTo((v108:GetPivot() + Vector3.new(0, v110, 0)) * v111)
		end
	end
end)
task.spawn(function()
	-- upvalues: (copy) v_u_50, (copy) v_u_33, (copy) v_u_9, (copy) v_u_27
	while true do
		repeat
			task.wait(0.5)
			v_u_50()
			local v112 = v_u_33()
		until v112
		local v113 = v_u_9:GenerateColonFormatFromTime(v112.TimeLeft)
		if v112.TimeLeft > 0 then
			v_u_27.Text = ("%*"):format(v113)
		elseif v112.PetReady then
			v_u_27.Text = "READY"
		else
			v_u_27.Text = ""
		end
	end
end)
task.spawn(function()
	-- upvalues: (copy) v_u_33, (copy) v_u_50, (copy) v_u_9, (copy) v_u_27, (copy) v_u_46, (copy) v_u_12, (copy) v_u_22, (copy) v_u_29
	if v_u_33() then
		v_u_50()
		local v114 = v_u_33()
		if v114 then
			local v115 = v_u_9:GenerateColonFormatFromTime(v114.TimeLeft)
			if v114.TimeLeft > 0 then
				v_u_27.Text = ("%*"):format(v115)
			elseif v114.PetReady then
				v_u_27.Text = "READY"
			else
				v_u_27.Text = ""
			end
		end
		v_u_46()
		if not v_u_12:HasUnlockedFeature(v_u_22, "PET_MUTATION_MACHINE") then
			v_u_29[v_u_22] = true
			v_u_50()
			local v_u_116 = nil
			v_u_116 = v_u_12.OnRebirthUnlock:Connect(function(p117, p118)
				-- upvalues: (ref) v_u_22, (ref) v_u_116, (ref) v_u_29
				if p117 == v_u_22 then
					if p118 == "PET_MUTATION_MACHINE" then
						if v_u_116 then
							v_u_116:Disconnect()
							v_u_116 = nil
						end
						v_u_29[p117] = nil
					end
				else
					return
				end
			end)
		end
	else
		return
	end
end)
v_u_2.GameEvents.PetMutationClaimAnimation.OnClientEvent:Connect(v90)
return v1