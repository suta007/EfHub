local v_u_1 = game:GetService("Lighting")
game:GetService("ReplicatedStorage")
local v_u_2 = game:GetService("RunService")
local v_u_3 = game:GetService("TweenService")
local v_u_4 = require(script.Parent.Parent.Utility.Utility)
local v_u_5 = require(script.Parent.Parent.Utility.Tables)
local v_u_6 = require(script.Parent.BoatTween)
local v_u_52 = {
	["CreateEffect"] = function(_, p7)
		-- upvalues: (copy) v_u_52, (copy) v_u_4
		local v8 = p7.Object:Clone()
		v8.Parent = p7.Parent or workspace.Visuals
		if p7.Position then
			local v9 = p7.Position
			v8:PivotTo(typeof(v9) == "Vector3" and CFrame.new(p7.Position) or p7.Position)
		end
		if p7.Emit then
			task.delay(p7.EmitDelay, v_u_52.Emit, v_u_52, v8, 1)
		end
		if p7.Attach and (v8 and (p7.Parent and (p7.Parent:IsA("Part") or p7.Parent:IsA("BasePart")))) then
			if v8:IsA("Model") then
				v_u_52:Attach(v8.PrimaryPart, p7.Parent)
			else
				v_u_52:Attach(v8, p7.Parent)
			end
		end
		if p7.DebrisTime then
			v_u_4:AddItem(v8, p7.DebrisTime)
		end
		if p7.RaycastColored then
			local v10 = workspace:Raycast(p7.RaycastColored.Origin, p7.RaycastColored.Direction, v_u_4.RayParams)
			if not v10 then
				return
			end
			for _, v11 in v8:GetDescendants() do
				if v11:IsA("ParticleEmitter") and v11:GetAttribute("Raycast") then
					v11.Color = ColorSequence.new(v10.Instance.Color, v10.Instance.Color)
				end
			end
		end
		return v8
	end,
	["Emit"] = function(_, p12, p_u_13, p14)
		-- upvalues: (copy) v_u_3, (copy) v_u_2
		for _, v_u_15 in p12:GetDescendants() do
			if not (p14 and p14[v_u_15.Name]) then
				if v_u_15:IsA("ParticleEmitter") then
					local v16 = v_u_15:GetAttribute("EmitDuration") or 0
					if v16 < 0.05 then
						task.delay(v_u_15:GetAttribute("EmitDelay"), function()
							-- upvalues: (copy) v_u_15
							v_u_15:Emit((v_u_15:GetAttribute("EmitCount")))
						end)
					else
						local v_u_17 = os.clock() + v16
						task.spawn(function()
							-- upvalues: (copy) v_u_15, (copy) v_u_17
							repeat
								v_u_15:Emit((v_u_15:GetAttribute("EmitCount")))
								task.wait(0.1)
							until v_u_17 - os.clock() <= 0
						end)
					end
				elseif v_u_15:IsA("PointLight") or (v_u_15:IsA("SpotLight") or v_u_15:IsA("SurfaceLight")) then
					v_u_3:Create(v_u_15, TweenInfo.new(p_u_13 or 1), {
						["Brightness"] = 0
					}):Play()
				elseif v_u_15:IsA("Decal") then
					v_u_3:Create(v_u_15, TweenInfo.new(p_u_13 or 1), {
						["Transparency"] = 1
					}):Play()
				elseif v_u_15:IsA("Beam") then
					local function v_u_19(p18)
						-- upvalues: (copy) v_u_15
						v_u_15.Transparency = NumberSequence.new({ NumberSequenceKeypoint.new(0, p18), NumberSequenceKeypoint.new(1, p18) })
					end
					task.spawn(function()
						-- upvalues: (copy) v_u_15, (copy) p_u_13, (ref) v_u_3, (copy) v_u_19, (ref) v_u_2
						local v20 = os.clock()
						local v21 = v_u_15.Transparency.Keypoints[2].Value
						repeat
							local v22 = (os.clock() - v20) / p_u_13
							v_u_19((v_u_3:GetValue(math.clamp(v22, v21, 1), Enum.EasingStyle.Quad, Enum.EasingDirection.InOut)))
							v_u_2.Heartbeat:Wait()
						until p_u_13 < os.clock() - v20
						v_u_19(1)
					end)
				end
			end
		end
	end,
	["Attach"] = function(_, p23, p24, p25)
		-- upvalues: (copy) v_u_4
		local v26 = Instance.new("WeldConstraint")
		p23.Massless = true
		p23.CanCollide = false
		v26.Part0 = p24
		v26.Part1 = p23
		v26.Parent = p23
		if p25 then
			v_u_4:AddItem(v26, p25)
		end
	end,
	["PlaySound"] = function(_, p27, p28)
		-- upvalues: (copy) v_u_4
		local v29 = p27:Clone()
		v29.Parent = p28
		v29:Play()
		v_u_4:AddItem(v29, p27.TimeLength > 0.1 and p27.TimeLength or 1)
		return v29
	end,
	["SetScale"] = function(_, p30, p31, p32)
		for _, v33 in p30:GetDescendants() do
			if v33:IsA("ParticleEmitter") then
				if not (table.find(p32, v33) or table.find(p32, v33.Name)) then
					local v34 = {}
					for _, v35 in ipairs(v33.Size.Keypoints) do
						local v36 = NumberSequenceKeypoint.new
						local v37 = v35.Time
						local v38 = v35.Value * p31
						local v39 = v35.Envelope * p31
						table.insert(v34, v36(v37, v38, v39))
					end
					local v40 = NumberSequence.new(v34)
					local v41 = NumberRange.new(v33.Speed.Min * p31, v33.Speed.Max * p31)
					local v42 = v33.Acceleration * p31
					v33.Size = v40
					v33.Speed = v41
					v33.Acceleration = v42
				end
			elseif v33:IsA("Attachment") then
				v33.Position = v33.Position * p31
			elseif v33:IsA("Beam") then
				v33.CurveSize0 = v33.CurveSize0 * p31
				v33.CurveSize1 = v33.CurveSize1 * p31
				v33.Width0 = v33.Width0 * p31
				v33.Width1 = v33.Width1 * p31
			end
		end
		p30:SetAttribute("Scale", p31)
	end,
	["ScaleTo"] = function(_, p_u_43, p_u_44, p_u_45, p46)
		-- upvalues: (copy) v_u_3, (copy) v_u_52, (copy) v_u_2
		local v_u_47 = p46 or ({} or p46)
		if v_u_47 then
			task.spawn(function()
				-- upvalues: (copy) p_u_43, (copy) p_u_45, (ref) v_u_3, (copy) p_u_44, (ref) v_u_52, (ref) v_u_47, (ref) v_u_2
				local v48 = os.clock()
				local v49 = p_u_43:GetAttribute("Scale") or 1
				repeat
					local v50 = (os.clock() - v48) / p_u_45
					local v51 = v_u_3:GetValue(math.clamp(v50, 0, 1), Enum.EasingStyle.Sine, Enum.EasingDirection.InOut)
					v_u_52:SetScale(p_u_43, v49 + (p_u_44 - v49) * v51, v_u_47)
					v_u_2.Heartbeat:Wait()
				until p_u_45 < os.clock() - v48 or not p_u_43
				if p_u_43 then
					v_u_52:SetScale(p_u_43, p_u_44, v_u_47)
				end
			end)
		end
	end,
	["AdjustSpeed"] = function(_) end,
	["Recolor"] = function(_) end
}
if v_u_2:IsClient() then
	local v_u_53 = require(script.Parent.CameraShaker)
	local v_u_54 = workspace.CurrentCamera
	local v_u_56 = v_u_53.new(Enum.RenderPriority.Camera.Value, function(p55)
		-- upvalues: (copy) v_u_54
		v_u_54.CFrame = v_u_54.CFrame * p55
	end)
	v_u_56:Start()
	function v_u_52.ShakeCamera(_, p57)
		-- upvalues: (copy) v_u_56, (copy) v_u_53
		v_u_56:Shake(v_u_53.Presets[p57])
	end
	function v_u_52.ShakeSustain(_, p58)
		-- upvalues: (copy) v_u_56, (copy) v_u_53
		return v_u_56:ShakeSustain(v_u_53.Presets[p58])
	end
	function v_u_52.ShakeOnce(_, p59)
		-- upvalues: (copy) v_u_5, (copy) v_u_56
		local v60 = v_u_5.Reconcile(p59, {
			["Magnitude"] = 6,
			["Roughness"] = 4,
			["FadeInTime"] = 0.05,
			["FadeOutTime"] = 0.75,
			["PositionInfluence"] = Vector3.new(0.15, 0.15, 0.15),
			["RotationInfluence"] = Vector3.new(1, 1, 1)
		})
		v_u_56:ShakeOnce(v60.Magnitude, v60.Roughness, v60.FadeInTime, v60.FadeOutTime, v60.PosInfluence, v60.RotInfluence)
	end
end
function v_u_52.CreateLighting(_, p61, p62, p63)
	-- upvalues: (copy) v_u_1, (copy) v_u_4
	local v64 = Instance.new(p61)
	v64.Parent = v_u_1
	for v65, v66 in p62 do
		if v64[v65] then
			v64[v65] = v66
		end
	end
	if p63 then
		v_u_4:AddItem(v64, p63)
	end
	return v64
end
function v_u_52.UpdateStatus(_, p67, p_u_68, p69)
	-- upvalues: (copy) v_u_6, (copy) v_u_3
	if typeof(p67) == "Instance" then
		p67 = p67:GetDescendants() or p67
	end
	for _, v_u_70 in p67 do
		if not (p69 and p69[v_u_70.Name]) then
			task.spawn(function()
				-- upvalues: (copy) v_u_70, (copy) p_u_68, (ref) v_u_6, (ref) v_u_3
				if v_u_70:IsA("ParticleEmitter") then
					v_u_70.Enabled = p_u_68
					return
				elseif v_u_70:IsA("Beam") or v_u_70:IsA("Trail") then
					if p_u_68 then
						v_u_70.Enabled = true
					else
						local v_u_71 = v_u_6:Create(v_u_70, {
							["Time"] = 1,
							["EasingStyle"] = "EntranceExpressive",
							["EasingDirection"] = "Out",
							["StepType"] = "RenderStepped",
							["Goal"] = v_u_70:IsA("Beam") and {
								["Transparency"] = NumberSequence.new(1, 1),
								["TextureSpeed"] = 0
							} or {
								["Transparency"] = NumberSequence.new(1, 1)
							}
						})
						v_u_71:Play()
						v_u_71.Completed:Connect(function()
							-- upvalues: (copy) v_u_71
							v_u_71:Destroy()
						end)
					end
				else
					if v_u_70:IsA("PointLight") or v_u_70:IsA("SpotLight") then
						if p_u_68 then
							v_u_70.Enabled = false
							return
						end
						v_u_3:Create(v_u_70, TweenInfo.new(1), {
							["Brightness"] = 0
						}):Play()
					end
					return
				end
			end)
		end
	end
end
return v_u_52