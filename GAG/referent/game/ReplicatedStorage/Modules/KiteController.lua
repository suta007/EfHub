local v_u_1 = game:GetService("RunService")
local v_u_2 = game:GetService("TweenService")
local v_u_3 = game:GetService("Debris")
local v4 = game:GetService("ReplicatedStorage").GameEvents
local v5 = v4:WaitForChild("CreateKiteClient")
local v6 = v4:WaitForChild("RemoveKiteClient")
local v_u_7 = {}
local function v_u_10(p8)
	-- upvalues: (copy) v_u_7
	local v9 = v_u_7[p8]
	if v9 then
		if v9.KiteModel then
			v9.KiteModel:Destroy()
		end
		if v9.HandAttach then
			v9.HandAttach:Destroy()
		end
		if v9.Beam then
			v9.Beam:Destroy()
		end
		if v9.KiteAttach then
			v9.KiteAttach:Destroy()
		end
	end
	v_u_7[p8] = nil
end
v4:WaitForChild("UseKiteClient").OnClientEvent:Connect(function(p11)
	-- upvalues: (copy) v_u_7, (copy) v_u_3, (copy) v_u_2, (copy) v_u_1
	if p11 and p11:IsA("Player") then
		local v12 = v_u_7[p11]
		if v12 and v12.KiteModel then
			local v_u_13 = v12.KiteModel
			if v12.Beam then
				v12.Beam:Destroy()
			end
			if v12.HandAttach then
				v12.HandAttach:Destroy()
			end
			if v12.KiteAttach then
				v12.KiteAttach:Destroy()
			end
			v_u_7[p11] = nil
			if v_u_13.PrimaryPart then
				v_u_3:AddItem(v_u_13, 5)
				v_u_2:Create(v_u_13.PrimaryPart, TweenInfo.new(5, Enum.EasingStyle.Linear, Enum.EasingDirection.Out), {
					["CFrame"] = v_u_13.PrimaryPart.CFrame * CFrame.new(0, 100, 0)
				}):Play()
				task.spawn(function()
					-- upvalues: (copy) v_u_13, (ref) v_u_1
					local v14 = os.clock()
					while v_u_13.Parent and os.clock() - v14 < 5 do
						local v15 = v_u_13:GetPivot()
						local v16 = CFrame.Angles
						local v17 = os.clock() * 2
						local v18 = math.sin(v17) * 0.05
						local v19 = os.clock() * 1.5
						v_u_13:PivotTo(v15 * v16(0, v18, math.cos(v19) * 0.05))
						v_u_1.Heartbeat:Wait()
					end
				end)
				task.delay(3, function()
					-- upvalues: (copy) v_u_13, (ref) v_u_2
					for _, v20 in ipairs(v_u_13:GetDescendants()) do
						if v20:IsA("BasePart") then
							v_u_2:Create(v20, TweenInfo.new(2, Enum.EasingStyle.Linear), {
								["Transparency"] = 1
							}):Play()
						end
					end
				end)
			else
				v_u_13:Destroy()
			end
		else
			return
		end
	else
		return
	end
end)
v5.OnClientEvent:Connect(function(p21, p22)
	-- upvalues: (copy) v_u_10, (copy) v_u_7
	if p22 and (typeof(p22) == "Instance" or p22:IsA("Model")) then
		if p21 and (typeof(p21) == "Instance" or p21:IsA("Player")) then
			v_u_10(p21)
			local v23 = p21.Character
			if v23 then
				local v24 = v23:FindFirstChildOfClass("Tool")
				if v24 and v24:FindFirstChild("Handle") then
					local v25 = v24.Handle
					local v26 = p22:Clone()
					v26.Parent = workspace.Visuals
					v26:PivotTo(p21.Character:GetPivot() + Vector3.new(0, 5, 0))
					local v27 = Instance.new("Attachment")
					v27.Name = "KiteHandAttachment"
					v27.Parent = v25
					local v28 = Instance.new("Attachment")
					v28.Name = "KiteAttachment"
					v28.Position = Vector3.new(0, 0, 0)
					v28.Parent = v26.PrimaryPart
					local v29 = Instance.new("Beam")
					v29.Name = "KiteString"
					v29.Attachment0 = v27
					v29.Attachment1 = v28
					v29.Width0 = 0.05
					v29.Width1 = 0.05
					v29.TextureSpeed = 0
					v29.Color = ColorSequence.new(Color3.new(1, 1, 1))
					v29.Transparency = NumberSequence.new(0.1)
					v29.FaceCamera = true
					v29.Parent = v26
					v_u_7[p21] = {
						["KiteModel"] = v26,
						["HandAttach"] = v27,
						["KiteAttach"] = v28,
						["Beam"] = v29
					}
				end
			else
				return
			end
		else
			return
		end
	else
		return
	end
end)
v6.OnClientEvent:Connect(function(p30)
	-- upvalues: (copy) v_u_10
	if p30 and (typeof(p30) == "Instance" or p30:IsA("Player")) then
		v_u_10(p30)
	end
end)
v_u_1.Heartbeat:Connect(function(_)
	-- upvalues: (copy) v_u_7
	local v31 = os.clock()
	for v32, v33 in pairs(v_u_7) do
		local v34 = v33.KiteModel
		if v32.Character and (v32.Character:FindFirstChild("HumanoidRootPart") and (v34 and v34.Parent)) then
			local v35 = v32.Character.HumanoidRootPart
			local v36 = v35.CFrame:PointToWorldSpace(Vector3.new(0, 10, 5))
			local v37 = v31 * 1.5 + v32.UserId
			local v38 = math.sin(v37) * 0.5
			local v39 = v31 * 2 + v32.UserId
			local v40 = math.sin(v39) * 0.8
			local v41 = v31 * 1.2 + v32.UserId
			local v42 = math.cos(v41) * 0.5
			local v43 = v36 + Vector3.new(v38, v40, v42)
			local v44 = v34:GetPivot()
			local v45 = CFrame.new(v44.Position:Lerp(v43, 0.1), v35.Position)
			local v46 = CFrame.Angles
			local v47 = v31 + v32.UserId
			local v48 = math.sin(v47) * 0.05
			local v49 = v31 + v32.UserId
			local v50 = math.cos(v49) * 0.05
			local v51 = v31 * 0.5 + v32.UserId
			v34:PivotTo(v45 * v46(v48, v50, math.sin(v51) * 0.05))
		else
			if v33.KiteModel then
				v33.KiteModel:Destroy()
			end
			if v33.HandAttach then
				v33.HandAttach:Destroy()
			end
			if v33.Beam then
				v33.Beam:Destroy()
			end
			if v33.KiteAttach then
				v33.KiteAttach:Destroy()
			end
			v_u_7[v32] = nil
		end
	end
end)
return {}