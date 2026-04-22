local v1 = {}
local v_u_2 = game:GetService("CollectionService")
local v3 = game:GetService("ReplicatedStorage")
local v_u_4 = false
local v_u_5 = false
game:GetService("RunService")
local v_u_6 = require(game.ReplicatedStorage.Modules.Notification)
local v_u_7 = require(v3.Data.SoundData)
local v_u_8 = require(v3.Modules.SoundPlayer)
local function v_u_40(_)
	-- upvalues: (ref) v_u_4, (copy) v_u_6, (copy) v_u_8, (copy) v_u_7, (ref) v_u_5, (copy) v_u_2
	if v_u_4 ~= true then
		v_u_4 = true
		v_u_6:CreateNotification("A WATER HOSE SPAWNED AT YOUR GARDENS GATE!")
		local function v_u_16(p9, p10)
			-- upvalues: (ref) v_u_8, (ref) v_u_7
			local v11 = p9.WaterHose.Holder.Value
			local v12 = p9.WaterHose:WaitForChild("Hose")
			local v13 = v12:WaitForChild("Effects")
			if v11 == nil or not v11:FindFirstChild("Right Arm") then
				v_u_8:PlaySound(v_u_7.Weather.WaterYourGardens.Hose, {
					["Looped"] = true,
					["PlaybackSpeed"] = 2,
					["RollOffMaxDistance"] = 100,
					["RollOffMinDistance"] = 1,
					["RollOffMode"] = Enum.RollOffMode.Linear
				}, nil, v13)
				v_u_8:PlaySound(v_u_7.Weather.WaterYourGardens.HoseStart, {
					["RollOffMaxDistance"] = 100,
					["RollOffMinDistance"] = 1,
					["RollOffMode"] = Enum.RollOffMode.Linear
				}, nil, v13)
				v13.Water.Enabled = false
				v13.Water2.Enabled = false
				v13.Waves.Enabled = false
				if v12:FindFirstChild("WeldConstraint") then
					v12.WeldConstraint:Destroy()
				end
				v12.Anchored = true
				v12.CFrame = p10
			else
				local v14 = v11["Right Arm"].RightGripAttachment.WorldCFrame * CFrame.new(0, -0.2, -0.5)
				v12.Anchored = false
				v12.CFrame = v14 * CFrame.Angles(-1.5707963267948966, 1.5707963267948966, 0)
				local v15 = Instance.new("WeldConstraint")
				v15.Parent = v12
				v15.Part0 = v12
				v15.Part1 = v11["Right Arm"]
				v_u_8:PlaySound(v_u_7.Weather.WaterYourGardens.Hose, {
					["PlaybackSpeed"] = 2,
					["RollOffMaxDistance"] = 100,
					["RollOffMinDistance"] = 1,
					["RollOffMode"] = Enum.RollOffMode.Linear
				}, nil, v13)
				v_u_8:PlaySound(v_u_7.Weather.WaterYourGardens.HoseStart, {
					["RollOffMaxDistance"] = 100,
					["RollOffMinDistance"] = 1,
					["RollOffMode"] = Enum.RollOffMode.Linear
				}, nil, v13)
				v13.Water.Enabled = true
				v13.Water2.Enabled = true
				v13.Waves.Enabled = true
			end
		end
		local v_u_17 = nil
		local v_u_18 = nil
		local v_u_19 = nil
		for _, v_u_20 in workspace.Farm:GetChildren() do
			v_u_20:WaitForChild("WaterHose")
			v_u_20:WaitForChild("Important"):WaitForChild("Data"):WaitForChild("Owner")
			local v_u_21 = v_u_20.WaterHose:WaitForChild("Hose")
			local v_u_22 = v_u_21.CFrame
			v_u_16(v_u_20, v_u_22)
			v_u_8:PlaySound(v_u_7.Weather.WaterYourGardens.Poof, {
				["RollOffMaxDistance"] = 100,
				["RollOffMinDistance"] = 1,
				["RollOffMode"] = Enum.RollOffMode.Linear,
				["Volume"] = 2
			}, nil, v_u_20.WaterHose.HosePart)
			v_u_20.WaterHose.HosePart.Smoke:Emit(3)
			local v_u_23 = nil
			local v_u_24 = v_u_20.WaterHose.Holder.Changed:Connect(function()
				-- upvalues: (copy) v_u_16, (copy) v_u_20, (copy) v_u_22
				v_u_16(v_u_20, v_u_22)
			end)
			v_u_20.WaterHose.Destroying:Once(function()
				-- upvalues: (ref) v_u_17, (ref) v_u_24, (ref) v_u_23, (ref) v_u_18, (ref) v_u_19
				if v_u_17 then
					task.cancel(v_u_17)
				end
				if v_u_24 then
					v_u_24:Disconnect()
				end
				if v_u_23 then
					v_u_23:Disconnect()
				end
				if v_u_18 then
					v_u_18:Stop()
				end
				if v_u_19 then
					v_u_19:Destroy()
				end
			end)
			if v_u_20.Important.Data.Owner.Value == game.Players.LocalPlayer.Name then
				local v_u_25 = v_u_20.WaterHose
				local v_u_26 = nil
				v_u_23 = game.Players.LocalPlayer.Character.ChildAdded:Connect(function(p27)
					-- upvalues: (ref) v_u_5, (ref) v_u_26, (copy) v_u_25, (copy) v_u_21, (ref) v_u_18, (ref) v_u_19
					local v28 = p27:IsA("Tool") and (v_u_5 == true and game.Players.LocalPlayer.Character)
					if v28 then
						v_u_5 = false
						if v_u_26 then
							task.cancel(v_u_26)
							v_u_26 = nil
						end
						v_u_25.HosePart.Attachment.HosePrompt.Enabled = false
						v_u_25.HosePart.Attachment.HosePrompt.ActionText = "Grab"
						game.ReplicatedStorage.GameEvents.WaterYourGardens:InvokeServer("UnequipHose", v28, v_u_21)
						if v_u_18 then
							v_u_18:Stop()
						end
						if v_u_19 then
							v_u_19:Destroy()
						end
						task.wait(0.5)
						if v_u_25 ~= nil then
							v_u_25.HosePart.Attachment.HosePrompt.Enabled = true
						end
					end
				end)
				v_u_25.HosePart.Attachment.HosePrompt.Triggered:Connect(function(p29)
					-- upvalues: (copy) v_u_21, (copy) v_u_25, (ref) v_u_5, (ref) v_u_26, (ref) v_u_2, (ref) v_u_6, (ref) v_u_18, (ref) v_u_19, (ref) v_u_4
					local v_u_30 = p29.Character
					if v_u_30 and (v_u_30:FindFirstChild("HumanoidRootPart") ~= nil and v_u_21) then
						v_u_25.HosePart.Attachment.HosePrompt.Enabled = false
						if v_u_5 == false then
							v_u_5 = true
							v_u_25.HosePart.Attachment.HosePrompt.ActionText = "Put Back"
							v_u_26 = task.spawn(function()
								-- upvalues: (ref) v_u_2, (copy) v_u_30, (ref) v_u_25, (ref) v_u_6, (ref) v_u_5, (ref) v_u_21, (ref) v_u_18, (ref) v_u_19
								local v31 = OverlapParams.new()
								local v32 = v_u_2:GetTagged("Harvestable")
								v31.FilterDescendantsInstances = { table.unpack(v32) }
								v31.FilterType = Enum.RaycastFilterType.Include
								local v33 = 5
								while true do
									repeat
										task.wait(2)
										local v34 = math.random(1, 100)
										v33 = v33 - 1
									until v34 <= 18 or v33 <= 0
									v33 = 5
									if not v_u_30 or (v_u_30:FindFirstChild("HumanoidRootPart") == nil or (v_u_30.HumanoidRootPart.Position - v_u_25.HosePart.Position).magnitude >= 70) then
										if v_u_30 then
											v_u_5 = false
											v_u_25.HosePart.Attachment.HosePrompt.Enabled = false
											v_u_25.HosePart.Attachment.HosePrompt.ActionText = "Grab"
											game.ReplicatedStorage.GameEvents.WaterYourGardens:InvokeServer("UnequipHose", v_u_30, v_u_21)
											if v_u_18 then
												v_u_18:Stop()
											end
											if v_u_19 then
												v_u_19:Destroy()
											end
											task.wait(0.5)
											if v_u_25 ~= nil then
												v_u_25.HosePart.Attachment.HosePrompt.Enabled = true
											end
										end
										return
									end
									local v35 = workspace:GetPartBoundsInBox(v_u_30.HumanoidRootPart.CFrame * CFrame.new(0, 0, -9), Vector3.new(7, 100, 11), v31)
									if #v35 > 0 then
										local v36 = {}
										for _, v37 in v35 do
											for _, v38 in v32 do
												if v37:IsDescendantOf(v38) and not table.find(v36, v38) then
													table.insert(v36, v38)
													break
												end
											end
										end
										local v39 = game.ReplicatedStorage.GameEvents.WaterYourGardens:InvokeServer("MutatePlants", v_u_30, v36, v_u_25)
										if v39 ~= "None" then
											v_u_6:CreateNotification((("Some of your fruits have been given the mutation \"<font color=\"#0384fc\">%*</font>\""):format(v39)))
										end
									end
								end
							end)
							if game.ReplicatedStorage.GameEvents.WaterYourGardens:InvokeServer("EquipHose", v_u_30, v_u_21) then
								v_u_19 = Instance.new("Animation")
								v_u_19.Name = "ToolHold"
								v_u_19.AnimationId = "rbxassetid://182393478"
								v_u_18 = v_u_30.Humanoid.Animator:LoadAnimation(v_u_19)
								v_u_18:Play()
							end
						else
							v_u_5 = false
							if v_u_26 then
								task.cancel(v_u_26)
								v_u_26 = nil
							end
							v_u_25.HosePart.Attachment.HosePrompt.ActionText = "Grab"
							game.ReplicatedStorage.GameEvents.WaterYourGardens:InvokeServer("UnequipHose", v_u_30, v_u_21)
							if v_u_18 then
								v_u_18:Stop()
							end
							if v_u_19 then
								v_u_19:Destroy()
							end
						end
						task.wait(0.5)
						if v_u_25 ~= nil and v_u_4 then
							v_u_25.HosePart.Attachment.HosePrompt.Enabled = true
						end
					end
				end)
				v_u_25.HosePart.Attachment.HosePrompt.Enabled = true
				v_u_17 = v_u_26
			end
		end
	end
end
workspace:GetAttributeChangedSignal("WaterYourGardens"):Connect(function()
	-- upvalues: (copy) v_u_40, (ref) v_u_4
	if workspace:GetAttribute("WaterYourGardens") then
		v_u_40()
		return
	elseif v_u_4 ~= false then
		v_u_4 = false
	end
end)
if workspace:GetAttribute("WaterYourGardens") then
	task.defer(function()
		-- upvalues: (copy) v_u_40
		v_u_40(true)
	end)
elseif v_u_4 ~= false then
	v_u_4 = false
end
return v1