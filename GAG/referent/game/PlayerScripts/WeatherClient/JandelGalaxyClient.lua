local v1 = game:GetService("ReplicatedStorage")
local v_u_2 = game:GetService("TweenService")
local v_u_3 = game:GetService("Lighting")
local v_u_4 = game:GetService("RunService")
local v5 = game:GetService("SoundService")
local v6 = v1:WaitForChild("Modules")
local v7 = v1:WaitForChild("Code")
local v_u_8 = workspace:WaitForChild("WeatherVisuals")
local v_u_9 = v5:WaitForChild("JandelGalaxy")
local v_u_10 = require(v6.Trove)
local v_u_11 = require(v6.SkyboxManager)
local v_u_12 = require(v7.CameraShaker)
local v_u_13 = require(v7.CameraShaker.CameraShakeInstance)
local v_u_14 = require(v7.SebasUtil)
local v_u_15 = workspace.CurrentCamera
local v_u_16 = script:WaitForChild("Assets")
local v_u_17 = v_u_16.Skybox
v_u_11.AddSkybox(v_u_17)
local v18 = {}
local v_u_19 = false
local v_u_20 = nil
local v_u_21 = nil
local v_u_22 = nil
local v_u_25 = v_u_12.new(Enum.RenderPriority.Last.Value, function(p23)
	-- upvalues: (copy) v_u_15
	local v24 = v_u_15
	v24.CFrame = v24.CFrame * p23
end)
v_u_25:Start()
local v26 = {
	["Spawn"] = "rbxassetid://122524366993619",
	["SpawnBlackhole"] = "rbxassetid://83105289250588",
	["FloatStart"] = "rbxassetid://135110065258462",
	["IdleFloating"] = "rbxassetid://109260851122893",
	["FloatEnd"] = "rbxassetid://90161690466616"
}
local function v_u_29()
	-- upvalues: (copy) v_u_3, (copy) v_u_2
	local v_u_27 = Instance.new("ColorCorrectionEffect")
	v_u_27.Parent = v_u_3
	v_u_2:Create(v_u_27, TweenInfo.new(0.08, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
		["Brightness"] = 1,
		["Saturation"] = -1,
		["Contrast"] = 1
	}):Play()
	task.delay(0.08, function()
		-- upvalues: (ref) v_u_2, (copy) v_u_27
		local v28 = v_u_2:Create(v_u_27, TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.In), {
			["Brightness"] = 0,
			["Saturation"] = 0,
			["Contrast"] = 0
		})
		v28:Play()
		v28.Completed:Once(function()
			-- upvalues: (ref) v_u_27
			v_u_27:Destroy()
		end)
	end)
end
local function v_u_34(p30)
	-- upvalues: (copy) v_u_11, (copy) v_u_17, (copy) v_u_9, (ref) v_u_21, (ref) v_u_20, (copy) v_u_16, (copy) v_u_8, (copy) v_u_14, (copy) v_u_4, (ref) v_u_22, (copy) v_u_3, (copy) v_u_2
	local v31 = p30 and 0 or 0.5
	v_u_11.UpdateSkybox(v_u_17, 2)
	v_u_9.Explosion1:Play()
	if not v_u_21 then
		v_u_21 = v_u_20:Add(v_u_16.Galaxy:Clone())
		v_u_21.Parent = v_u_8
		v_u_14:EmitAll(v_u_21)
		local v_u_32 = v_u_21:GetPivot()
		v_u_20:Connect(v_u_4.Heartbeat, function(p33)
			-- upvalues: (ref) v_u_21, (ref) v_u_32
			if v_u_21 then
				v_u_32 = v_u_32 * CFrame.Angles(0, p33 * 0.025, 0)
				v_u_21:PivotTo(v_u_32)
			end
		end)
	end
	if not v_u_22 then
		v_u_22 = v_u_20:Add(v_u_16.JandelGalaxyCC:Clone())
		v_u_22.Parent = v_u_3
	end
	v_u_2:Create(v_u_3, TweenInfo.new(v31), {
		["ClockTime"] = 14
	}):Play()
	workspace.Gravity = 30
end
local function v_u_48()
	-- upvalues: (copy) v_u_16, (ref) v_u_20, (copy) v_u_8, (copy) v_u_9, (copy) v_u_14, (copy) v_u_13, (copy) v_u_25, (copy) v_u_2, (copy) v_u_15, (copy) v_u_29, (copy) v_u_34, (copy) v_u_3
	task.spawn(function()
		-- upvalues: (ref) v_u_16, (ref) v_u_20, (ref) v_u_8, (ref) v_u_9, (ref) v_u_14, (ref) v_u_13, (ref) v_u_25, (ref) v_u_2, (ref) v_u_15
		local v_u_35 = v_u_16.BlackHole:Clone()
		v_u_20:Add(v_u_35)
		v_u_35.Parent = v_u_8
		v_u_9.HoleSpawn:Play()
		local v_u_36 = v_u_35:GetPivot()
		local v_u_37 = v_u_16.HoleStart.WorldCFrame
		v_u_35:PivotTo(v_u_37)
		local v_u_38 = false
		v_u_14:RenderStepLoopFor(3, function(_, _, p39)
			-- upvalues: (copy) v_u_35, (copy) v_u_37, (copy) v_u_36, (ref) v_u_14, (ref) v_u_38
			v_u_35:PivotTo(v_u_37:Lerp(v_u_36, p39 * p39))
			v_u_35:ScaleTo(v_u_14:lerp(0.1, 1, p39))
			if p39 >= 0.6 and not v_u_38 then
				v_u_38 = true
				v_u_14:EnableAllParticles(v_u_35.Distort1.Charge)
			end
		end, Enum.RenderPriority.Last.Value, function() end)
		local v40 = v_u_13.new(8, 10, 2, 2)
		v40.PositionInfluence = Vector3.new(0.15, 0.15, 0.15)
		v40.RotationInfluence = Vector3.new(1.25, 1, 4)
		v_u_25:ShakeSustain(v40)
		task.delay(5, function()
			-- upvalues: (ref) v_u_25, (ref) v_u_20
			v_u_25:StopSustained(0.5)
			v_u_20:Add(function()
				-- upvalues: (ref) v_u_25
				v_u_25:StopSustained(0.5)
			end)
		end)
		v_u_2:Create(v_u_15, TweenInfo.new(5, Enum.EasingStyle.Quint, Enum.EasingDirection.In), {
			["FieldOfView"] = 120
		}):Play()
		task.wait(5)
		local v_u_41 = v_u_35:GetScale()
		v_u_14:RenderStepLoopFor(0.5, function(_, _, p42)
			-- upvalues: (copy) v_u_35, (ref) v_u_14, (copy) v_u_41
			local v43 = v_u_35
			local v44 = v_u_14
			local v45 = v_u_41
			local v46 = v_u_14:EaseBackIn()(p42)
			v43:ScaleTo(v44:lerp(v45, 0.001, (math.max(v46, 0))))
		end, Enum.RenderPriority.Last.Value, function()
			-- upvalues: (ref) v_u_25, (ref) v_u_14, (copy) v_u_35, (ref) v_u_20, (ref) v_u_16
			v_u_25:ShakeOnce(6, 8.5, 0, 0.5)
			v_u_14:DisableAllParticles(v_u_35.Distort1.Charge)
			local v47 = v_u_20:Add(v_u_16.HoleDespawn:Clone())
			v47.Position = v_u_35:GetPivot().Position
			v_u_14:EmitAll(v47)
			v_u_35:Destroy()
		end)
		v_u_2:Create(v_u_15, TweenInfo.new(0.5, Enum.EasingStyle.Back, Enum.EasingDirection.In), {
			["FieldOfView"] = 70
		}):Play()
	end)
	task.delay(5.5, function()
		-- upvalues: (ref) v_u_29, (ref) v_u_34, (ref) v_u_9
		v_u_29()
		v_u_34(false)
		v_u_9.AmbienceLoop:Play()
	end)
	v_u_2:Create(v_u_3, TweenInfo.new(3), {
		["ClockTime"] = 1
	}):Play()
end
local v_u_57 = {
	[v26.Spawn] = function(p49, p_u_50)
		-- upvalues: (copy) v_u_9, (copy) v_u_25, (copy) v_u_12, (copy) v_u_16, (ref) v_u_20, (copy) v_u_8, (copy) v_u_14
		p49:GetMarkerReachedSignal("Spawn"):Connect(function()
			-- upvalues: (ref) v_u_9, (ref) v_u_25, (ref) v_u_12, (ref) v_u_16, (ref) v_u_20, (ref) v_u_8, (copy) p_u_50, (ref) v_u_14
			v_u_9.JandelSpawn:Play()
			v_u_25:Shake(v_u_12.Presets.Bump)
			local v51 = v_u_16.PortalSpawn:Clone()
			v_u_20:Add(v51)
			v51.Parent = v_u_8
			v51.Position = p_u_50.Torso.Position
			v_u_14:EmitAll(v51)
		end)
		p49:GetMarkerReachedSignal("Land"):Connect(function()
			-- upvalues: (ref) v_u_25, (ref) v_u_16, (ref) v_u_20, (ref) v_u_8, (ref) v_u_14
			v_u_25:ShakeOnce(4, 8, 0, 0.5)
			local v52 = v_u_16.SpawnCrack:Clone()
			v_u_20:Add(v52)
			v52.Parent = v_u_8
			v_u_14:EmitAll(v52)
			v_u_14:fadeAllLights(v52, 3)
		end)
	end,
	[v26.SpawnBlackhole] = function(p53)
		-- upvalues: (copy) v_u_48
		p53:GetMarkerReachedSignal("HoleSpawn"):Connect(function()
			-- upvalues: (ref) v_u_48
			v_u_48()
		end)
	end,
	[v26.FloatStart] = function(_) end,
	[v26.IdleFloating] = function(_) end,
	[v26.FloatEnd] = function(p54, p_u_55)
		-- upvalues: (copy) v_u_9, (ref) v_u_20, (copy) v_u_16, (copy) v_u_8, (copy) v_u_14, (copy) v_u_25
		v_u_9.JandelLeaves:Play()
		v_u_20:Connect(p54.Stopped, function()
			-- upvalues: (ref) v_u_20, (ref) v_u_16, (ref) v_u_8, (copy) p_u_55, (ref) v_u_14, (ref) v_u_25
			if v_u_20 then
				local v56 = v_u_20:Add(v_u_16.PortalSpawn:Clone())
				v56.Parent = v_u_8
				v56.Position = p_u_55.Torso.Position
				v_u_14:EmitAll(v56)
				v_u_25:ShakeOnce(4, 8, 0, 0.5)
				p_u_55:PivotTo(CFrame.new(0, -2000, 0))
			end
		end)
	end
}
local function v_u_77()
	-- upvalues: (ref) v_u_19, (ref) v_u_20, (copy) v_u_10, (copy) v_u_8, (copy) v_u_34, (copy) v_u_16, (copy) v_u_9, (copy) v_u_14, (copy) v_u_13, (copy) v_u_25, (copy) v_u_2, (copy) v_u_15, (copy) v_u_57
	if v_u_19 then
		return
	else
		v_u_19 = true
		v_u_20 = v_u_10.new()
		local v_u_58 = v_u_8:WaitForChild("JandelGalaxyNPC", 30)
		if v_u_58 and v_u_19 then
			local v59 = v_u_58:WaitForChild("Humanoid"):WaitForChild("Animator")
			if workspace:GetAttribute("JandelGalaxy_Phase") == "inSpace" then
				v_u_34(true)
				task.spawn(function()
					-- upvalues: (ref) v_u_16, (ref) v_u_20, (ref) v_u_8, (ref) v_u_9, (ref) v_u_14, (ref) v_u_13, (ref) v_u_25, (ref) v_u_2, (ref) v_u_15
					local v_u_60 = v_u_16.BlackHole:Clone()
					v_u_20:Add(v_u_60)
					v_u_60.Parent = v_u_8
					v_u_9.HoleSpawn:Play()
					local v_u_61 = v_u_60:GetPivot()
					local v_u_62 = v_u_16.HoleStart.WorldCFrame
					v_u_60:PivotTo(v_u_62)
					local v_u_63 = false
					v_u_14:RenderStepLoopFor(3, function(_, _, p64)
						-- upvalues: (copy) v_u_60, (copy) v_u_62, (copy) v_u_61, (ref) v_u_14, (ref) v_u_63
						v_u_60:PivotTo(v_u_62:Lerp(v_u_61, p64 * p64))
						v_u_60:ScaleTo(v_u_14:lerp(0.1, 1, p64))
						if p64 >= 0.6 and not v_u_63 then
							v_u_63 = true
							v_u_14:EnableAllParticles(v_u_60.Distort1.Charge)
						end
					end, Enum.RenderPriority.Last.Value, function() end)
					local v65 = v_u_13.new(8, 10, 2, 2)
					v65.PositionInfluence = Vector3.new(0.15, 0.15, 0.15)
					v65.RotationInfluence = Vector3.new(1.25, 1, 4)
					v_u_25:ShakeSustain(v65)
					task.delay(5, function()
						-- upvalues: (ref) v_u_25, (ref) v_u_20
						v_u_25:StopSustained(0.5)
						v_u_20:Add(function()
							-- upvalues: (ref) v_u_25
							v_u_25:StopSustained(0.5)
						end)
					end)
					v_u_2:Create(v_u_15, TweenInfo.new(5, Enum.EasingStyle.Quint, Enum.EasingDirection.In), {
						["FieldOfView"] = 120
					}):Play()
					task.wait(5)
					local v_u_66 = v_u_60:GetScale()
					v_u_14:RenderStepLoopFor(0.5, function(_, _, p67)
						-- upvalues: (copy) v_u_60, (ref) v_u_14, (copy) v_u_66
						local v68 = v_u_60
						local v69 = v_u_14
						local v70 = v_u_66
						local v71 = v_u_14:EaseBackIn()(p67)
						v68:ScaleTo(v69:lerp(v70, 0.001, (math.max(v71, 0))))
					end, Enum.RenderPriority.Last.Value, function()
						-- upvalues: (ref) v_u_25, (ref) v_u_14, (copy) v_u_60, (ref) v_u_20, (ref) v_u_16
						v_u_25:ShakeOnce(6, 8.5, 0, 0.5)
						v_u_14:DisableAllParticles(v_u_60.Distort1.Charge)
						local v72 = v_u_20:Add(v_u_16.HoleDespawn:Clone())
						v72.Position = v_u_60:GetPivot().Position
						v_u_14:EmitAll(v72)
						v_u_60:Destroy()
					end)
					v_u_2:Create(v_u_15, TweenInfo.new(0.5, Enum.EasingStyle.Back, Enum.EasingDirection.In), {
						["FieldOfView"] = 70
					}):Play()
				end)
			end
			for _, v73 in v59:GetPlayingAnimationTracks() do
				local v74 = v_u_57[v73.Animation.AnimationId]
				if v74 then
					v74(v73, v_u_58)
				end
			end
			v_u_20:Connect(v59.AnimationPlayed, function(p75)
				-- upvalues: (ref) v_u_57, (copy) v_u_58
				local v76 = v_u_57[p75.Animation.AnimationId]
				if v76 then
					v76(p75, v_u_58)
				end
			end)
		end
	end
end
workspace:GetAttributeChangedSignal("JandelGalaxy"):Connect(function()
	-- upvalues: (copy) v_u_77, (ref) v_u_19, (copy) v_u_16, (ref) v_u_20, (copy) v_u_8, (copy) v_u_9, (copy) v_u_14, (copy) v_u_13, (copy) v_u_25, (copy) v_u_2, (copy) v_u_15, (copy) v_u_11, (copy) v_u_17, (copy) v_u_29, (ref) v_u_21, (copy) v_u_3, (ref) v_u_22
	if workspace:GetAttribute("JandelGalaxy") then
		task.defer(v_u_77)
		return
	elseif v_u_19 then
		v_u_19 = false
		task.spawn(function()
			-- upvalues: (ref) v_u_16, (ref) v_u_20, (ref) v_u_8, (ref) v_u_9, (ref) v_u_14, (ref) v_u_13, (ref) v_u_25, (ref) v_u_2, (ref) v_u_15
			local v_u_78 = v_u_16.BlackHole:Clone()
			v_u_20:Add(v_u_78)
			v_u_78.Parent = v_u_8
			v_u_9.HoleSpawn:Play()
			local v_u_79 = v_u_78:GetPivot()
			local v_u_80 = v_u_16.HoleStart.WorldCFrame
			v_u_78:PivotTo(v_u_80)
			local v_u_81 = false
			v_u_14:RenderStepLoopFor(3, function(_, _, p82)
				-- upvalues: (copy) v_u_78, (copy) v_u_80, (copy) v_u_79, (ref) v_u_14, (ref) v_u_81
				v_u_78:PivotTo(v_u_80:Lerp(v_u_79, p82 * p82))
				v_u_78:ScaleTo(v_u_14:lerp(0.1, 1, p82))
				if p82 >= 0.6 and not v_u_81 then
					v_u_81 = true
					v_u_14:EnableAllParticles(v_u_78.Distort1.Charge)
				end
			end, Enum.RenderPriority.Last.Value, function() end)
			local v83 = v_u_13.new(8, 10, 2, 2)
			v83.PositionInfluence = Vector3.new(0.15, 0.15, 0.15)
			v83.RotationInfluence = Vector3.new(1.25, 1, 4)
			v_u_25:ShakeSustain(v83)
			task.delay(5, function()
				-- upvalues: (ref) v_u_25, (ref) v_u_20
				v_u_25:StopSustained(0.5)
				v_u_20:Add(function()
					-- upvalues: (ref) v_u_25
					v_u_25:StopSustained(0.5)
				end)
			end)
			v_u_2:Create(v_u_15, TweenInfo.new(5, Enum.EasingStyle.Quint, Enum.EasingDirection.In), {
				["FieldOfView"] = 120
			}):Play()
			task.wait(5)
			local v_u_84 = v_u_78:GetScale()
			v_u_14:RenderStepLoopFor(0.5, function(_, _, p85)
				-- upvalues: (copy) v_u_78, (ref) v_u_14, (copy) v_u_84
				local v86 = v_u_78
				local v87 = v_u_14
				local v88 = v_u_84
				local v89 = v_u_14:EaseBackIn()(p85)
				v86:ScaleTo(v87:lerp(v88, 0.001, (math.max(v89, 0))))
			end, Enum.RenderPriority.Last.Value, function()
				-- upvalues: (ref) v_u_25, (ref) v_u_14, (copy) v_u_78, (ref) v_u_20, (ref) v_u_16
				v_u_25:ShakeOnce(6, 8.5, 0, 0.5)
				v_u_14:DisableAllParticles(v_u_78.Distort1.Charge)
				local v90 = v_u_20:Add(v_u_16.HoleDespawn:Clone())
				v90.Position = v_u_78:GetPivot().Position
				v_u_14:EmitAll(v90)
				v_u_78:Destroy()
			end)
			v_u_2:Create(v_u_15, TweenInfo.new(0.5, Enum.EasingStyle.Back, Enum.EasingDirection.In), {
				["FieldOfView"] = 70
			}):Play()
		end)
		task.delay(5.5, function()
			-- upvalues: (ref) v_u_11, (ref) v_u_17, (ref) v_u_29, (ref) v_u_9, (ref) v_u_21, (ref) v_u_2, (ref) v_u_3, (ref) v_u_22
			v_u_11.UpdateSkybox(v_u_17, 0)
			v_u_29()
			v_u_9.Explosion2:Play()
			v_u_9.AmbienceLoop:Stop()
			if v_u_21 then
				v_u_21:Destroy()
				v_u_21 = nil
			end
			v_u_2:Create(v_u_3, TweenInfo.new(0.5), {
				["ClockTime"] = v_u_3:GetAttribute("DefaultClockTime")
			}):Play()
			if v_u_22 then
				v_u_2:Create(v_u_22, TweenInfo.new(0.5), {
					["Brightness"] = 0,
					["Saturation"] = 0,
					["Contrast"] = 0,
					["TintColor"] = Color3.fromRGB(255, 255, 255)
				}):Play()
			end
			workspace.Gravity = 192.6
		end)
		task.delay(8.5, function()
			-- upvalues: (ref) v_u_20
			if v_u_20 then
				v_u_20:Destroy()
				v_u_20 = nil
			end
		end)
	end
end)
if workspace:GetAttribute("JandelGalaxy") then
	task.defer(v_u_77)
end
return v18