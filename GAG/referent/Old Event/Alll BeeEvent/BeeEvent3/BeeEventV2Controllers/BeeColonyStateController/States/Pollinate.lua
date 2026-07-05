local v_u_1 = game:GetService("Players")
local v_u_2 = v_u_1.LocalPlayer
local v_u_3 = {}
local function v_u_11(p4, p5) -- name: CreatePollinateVFX
	local v6 = Instance.new("Attachment")
	v6.Parent = p4
	local v7 = Instance.new("Attachment")
	v7.Parent = p5
	local v8 = Instance.new("ParticleEmitter")
	v8.Color = ColorSequence.new(Color3.fromRGB(255, 230, 80), Color3.fromRGB(255, 180, 0))
	v8.Size = NumberSequence.new({ NumberSequenceKeypoint.new(0, 0.3), NumberSequenceKeypoint.new(1, 0) })
	v8.Lifetime = NumberRange.new(0.6, 1.2)
	v8.Rate = 30
	v8.Speed = NumberRange.new(1, 3)
	v8.SpreadAngle = Vector2.new(180, 180)
	v8.LightEmission = 1
	v8.Parent = v6
	local v9 = Instance.new("ParticleEmitter")
	v9.Color = ColorSequence.new(Color3.fromRGB(180, 255, 100), Color3.fromRGB(255, 230, 50))
	v9.Size = NumberSequence.new({ NumberSequenceKeypoint.new(0, 0.2), NumberSequenceKeypoint.new(1, 0) })
	v9.Lifetime = NumberRange.new(0.5, 1)
	v9.Rate = 15
	v9.Speed = NumberRange.new(0.5, 2)
	v9.SpreadAngle = Vector2.new(120, 120)
	v9.LightEmission = 1
	v9.Parent = v7
	local v10 = Instance.new("Beam")
	v10.Attachment0 = v6
	v10.Attachment1 = v7
	v10.Color = ColorSequence.new(Color3.fromRGB(255, 220, 60), Color3.fromRGB(180, 255, 80))
	v10.Transparency = NumberSequence.new({ NumberSequenceKeypoint.new(0, 0.3), NumberSequenceKeypoint.new(0.5, 0.6), NumberSequenceKeypoint.new(1, 0.3) })
	v10.LightEmission = 0.8
	v10.Width0 = 0.4
	v10.Width1 = 0.2
	v10.TextureLength = 1
	v10.TextureSpeed = 1
	v10.CurveSize0 = 2
	v10.CurveSize1 = -2
	v10.FaceCamera = true
	v10.Parent = v6
	return v6, v7
end
local function v_u_21(p12, p13, p14) -- name: MoveEntryTowardCFrame
	local v15 = p12.Client.PredictedCFrame or (p12.Client.SmoothedCFrame or p12.Server.CFrame)
	if not v15 or v15.Position.Magnitude < 0.01 then
		v15 = p12.Server.CFrame
	end
	if v15 and v15.Position.Magnitude >= 0.01 then
		local v16 = (p13.Position - v15.Position).Magnitude
		if v16 < 0.01 then
			p12.Client.PredictedCFrame = p13
			return
		else
			local v17 = p12.Server.Speed * p14
			if v16 <= v17 then
				p12.Client.PredictedCFrame = p13
			else
				local v18 = (p13.Position - v15.Position).Unit
				local v19 = v15.Position + v18 * v17
				local v20 = p13.Position
				if (v20 - v19).Magnitude < 0.01 then
					v20 = v19 + p13.LookVector
				end
				p12.Client.PredictedCFrame = CFrame.new(v19, v20)
			end
		end
	else
		p12.Client.PredictedCFrame = p13
		return
	end
end
return function(p_u_22)
	-- upvalues: (copy) v_u_1, (copy) v_u_2, (copy) v_u_3, (copy) v_u_11, (copy) v_u_21
	return function(p23, p24, p25)
		-- upvalues: (ref) v_u_1, (ref) v_u_2, (ref) v_u_3, (copy) p_u_22, (ref) v_u_11, (ref) v_u_21
		local v26 = string.split(p23, "_")
		if v26[1] == "Player" and v26[2] then
			local v27 = v_u_1
			local v28 = v26[2]
			local v29 = v27:GetPlayerByUserId((tonumber(v28)))
			if v29 then
				local v30 = workspace:GetServerTimeNow()
				local v31 = v29 == v_u_2
				local v32 = v_u_3[v29]
				if not v32 then
					v32 = {}
					v_u_3[v29] = v32
				end
				local v33 = {}
				for v34, v35 in p25 do
					v35.Client.LockFacing = false
					v35.Client.FacingDirection = nil
					v35.Client.TargetFacingDirection = nil
					local v36 = v35.Server.PollinatingPlant
					if v36 and (v36.Parent and v36.PrimaryPart) then
						if not v33[v36] then
							v33[v36] = {}
						end
						local v37 = v33[v36]
						table.insert(v37, {
							["UUID"] = v34,
							["Entry"] = v35
						})
					else
						v35.Client.PredictedCFrame = nil
						p_u_22:SetPollinateSoundEnabled(v35, false)
						local v38 = v_u_3[v29]
						if v38 then
							local v39 = v38[v34]
							if v39 then
								v39.BeeAttachment:Destroy()
								v39.PlantAttachment:Destroy()
								v38[v34] = nil
							end
						end
					end
				end
				for v40, v41 in v33 do
					local v42 = v40.PrimaryPart.Position
					local v43 = #v41
					local v44 = v43 * 0.5 + 2
					for v45, v46 in v41 do
						local v47 = v46.UUID
						local v48 = v46.Entry
						local v49 = (v45 - 1) / v43 * 3.141592653589793 * 2
						local v50 = v49 + v30 * 1.5
						local v51 = v30 * 4 + v49
						local v52 = math.sin(v51) * 0.3
						v48.Client.RenderOffset = CFrame.new(0, v52, 0)
						local v53 = math.cos(v50) * v44
						local v54 = math.sin(v50) * v44
						local v55 = v42 + Vector3.new(v53, 3, v54)
						local v56 = v42.X
						local v57 = v55.Y
						local v58 = v42.Z
						local v59 = Vector3.new(v56, v57, v58)
						local v60 = CFrame.new(v55, v59)
						local v61 = v48.Client.PredictedCFrame or (v48.Client.SmoothedCFrame or v48.Server.CFrame)
						if not v61 or v61.Position.Magnitude < 0.01 then
							v61 = v48.Server.CFrame
						end
						local v62 = (v61.Position - v42).Magnitude <= v44 + 3
						p_u_22:SetPollinateSoundEnabled(v48, v62)
						if v62 then
							if v48.Client.Hitbox and not v32[v47] then
								local v63, v64 = v_u_11(v48.Client.Hitbox, v40.PrimaryPart)
								v32[v47] = {
									["BeeAttachment"] = v63,
									["PlantAttachment"] = v64
								}
							end
						else
							local v65 = v_u_3[v29]
							local v66 = v65 and v65[v47]
							if v66 then
								v66.BeeAttachment:Destroy()
								v66.PlantAttachment:Destroy()
								v65[v47] = nil
							end
						end
						if v31 then
							v_u_21(v48, v60, p24)
						else
							v48.Client.PredictedCFrame = nil
						end
					end
				end
				for v67 in v32 do
					if not p25[v67] then
						local v68 = v_u_3[v29]
						if v68 then
							local v69 = v68[v67]
							if v69 then
								v69.BeeAttachment:Destroy()
								v69.PlantAttachment:Destroy()
								v68[v67] = nil
							end
						end
					end
				end
			end
		else
			return
		end
	end
end