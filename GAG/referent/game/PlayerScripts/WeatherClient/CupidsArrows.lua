local v1 = {}
local v_u_2 = game:GetService("ReplicatedStorage")
local v_u_3 = game:GetService("TweenService")
local _ = workspace.CurrentCamera
local v_u_4 = require(v_u_2.Modules.SkyboxManager)
local v_u_5 = require(v_u_2.Modules.SoundPlayer)
local v_u_6 = require(v_u_2.Data.SoundData)
local v_u_7 = require(v_u_2.Code.Spr)
local v8 = v_u_2:WaitForChild("GameEvents"):WaitForChild("CupidsArrows")
local v_u_9 = script.Sky
v_u_4.AddSkybox(v_u_9)
local v_u_10 = nil
local v_u_11 = false
local function v_u_22(p12)
	-- upvalues: (ref) v_u_11, (copy) v_u_2, (copy) v_u_5, (copy) v_u_6, (copy) v_u_3, (copy) v_u_4, (copy) v_u_9, (ref) v_u_10
	if v_u_11 == true then
		return
	else
		v_u_11 = true
		v_u_2.Cupids_Arrows.Value = true
		task.delay(10, function()
			-- upvalues: (ref) v_u_11, (ref) v_u_2, (ref) v_u_5, (ref) v_u_6, (ref) v_u_3
			if v_u_11 == true then
				while v_u_11 == true do
					task.spawn(function()
						-- upvalues: (ref) v_u_2, (ref) v_u_5, (ref) v_u_6, (ref) v_u_3
						local v13 = v_u_2.CupidsArrow:Clone()
						local v14 = math.random(350, 550)
						local v15 = math.random
						v13.Position = Vector3.new(-4000, v14, v15(-1000, 1000))
						v13.Parent = workspace.WeatherVisuals
						if math.random(1, 2) == 1 then
							v_u_5:PlaySound(v_u_6.Weather.CupidsArrows.Starfall, {
								["PlaybackSpeed"] = 0.9 + math.random(-66, 15) * 0.01,
								["Looped"] = true
							}, nil, v13)
						end
						local v16 = math.random(13, 22)
						local v17 = v_u_3
						local v18 = TweenInfo.new(v16, Enum.EasingStyle.Linear)
						local v19 = {}
						local v20 = v13.Position
						local v21 = math.random
						v19.Position = v20 + Vector3.new(8000, -100, v21(-50, 50))
						v17:Create(v13, v18, v19):Play()
						task.wait(v16)
						v13:Destroy()
					end)
					task.wait(math.random(25, 75) * 0.01)
				end
			end
		end)
		if p12 then
			game.Lighting.ClockTime = 16
			v_u_3:Create(game.Lighting, TweenInfo.new(0.1), {
				["Ambient"] = Color3.fromRGB(138, 40, 120),
				["ExposureCompensation"] = 0.7,
				["Brightness"] = 0.6
			}):Play()
			v_u_3:Create(game.Lighting.NightColor, TweenInfo.new(0.1), {
				["Brightness"] = 0.15,
				["TintColor"] = Color3.fromRGB(238, 56, 255),
				["Contrast"] = 0.1
			}):Play()
			game.Lighting.SunRays.Intensity = 0.028
			v_u_4.UpdateSkybox(v_u_9, 4)
			v_u_10 = v_u_5:PlaySound(v_u_6.Weather.CupidsArrows.Ambience, {
				["Looped"] = true,
				["Volume"] = 0.1
			}, nil, nil, { "LazyLoadSound" })
		else
			v_u_3:Create(game.Lighting, TweenInfo.new(5), {
				["ClockTime"] = 16
			}):Play()
			task.wait(5)
			v_u_4.UpdateSkybox(v_u_9, 4)
			game.Lighting.ClockTime = 10
			task.wait(2)
			v_u_3:Create(game.Lighting, TweenInfo.new(5), {
				["Ambient"] = Color3.fromRGB(186, 42, 222),
				["ExposureCompensation"] = 0.5,
				["Brightness"] = 0.6,
				["ClockTime"] = 16
			}):Play()
			v_u_3:Create(game.Lighting.NightColor, TweenInfo.new(5), {
				["Brightness"] = 0.15,
				["TintColor"] = Color3.fromRGB(201, 211, 255),
				["Contrast"] = 0.1
			}):Play()
			game.Lighting.SunRays.Enabled = true
			v_u_10 = v_u_5:PlaySound(v_u_6.Weather.CupidsArrows.Ambience, {
				["Looped"] = true
			}, nil, nil, { "LazyLoadSound" })
			v_u_3:Create(v_u_10, TweenInfo.new(1), {
				["Volume"] = 0.1
			}):Play()
			task.delay(13, function()
				-- upvalues: (ref) v_u_3
				v_u_3:Create(game.Lighting.SunRays, TweenInfo.new(2), {
					["Intensity"] = 0.028
				}):Play()
			end)
		end
	end
end
local function v_u_24(p23)
	-- upvalues: (ref) v_u_11, (copy) v_u_2, (copy) v_u_3, (ref) v_u_10, (copy) v_u_4, (copy) v_u_9
	if v_u_11 == false then
		return
	else
		v_u_2.Cupids_Arrows.Value = false
		v_u_11 = false
		if not p23 then
			v_u_3:Create(game.Lighting, TweenInfo.new(5), {
				["ClockTime"] = 16
			}):Play()
			v_u_3:Create(game.Lighting.NightColor, TweenInfo.new(5), {
				["Brightness"] = 0,
				["Contrast"] = 0,
				["TintColor"] = Color3.fromRGB(255, 255, 255)
			}):Play()
			v_u_3:Create(game.Lighting.SunRays, TweenInfo.new(2), {
				["Intensity"] = 0
			}):Play()
			task.wait(5)
			v_u_3:Create(v_u_10, TweenInfo.new(1), {
				["Volume"] = 0
			}):Play()
			task.delay(1, function()
				-- upvalues: (ref) v_u_10
				v_u_10.Parent = script
				v_u_10:Stop()
			end)
			v_u_4.UpdateSkybox(v_u_9, 0)
			game.Lighting.ClockTime = 3
			v_u_3:Create(game.Lighting, TweenInfo.new(5), {
				["Ambient"] = Color3.fromRGB(138, 138, 138),
				["ExposureCompensation"] = 0.2,
				["Brightness"] = 2,
				["ClockTime"] = 14
			}):Play()
			task.delay(6, function()
				game.Lighting.SunRays.Enabled = false
			end)
		end
	end
end
local v_u_26 = require(game.ReplicatedStorage.Code.CameraShaker).new(Enum.RenderPriority.Camera.Value, function(p25)
	workspace.CurrentCamera.CFrame = workspace.CurrentCamera.CFrame * p25
end)
local function v_u_47(p27)
	-- upvalues: (copy) v_u_5, (copy) v_u_6, (copy) v_u_26, (copy) v_u_7
	local v28 = math.random(0, 360)
	local v29 = math.rad(v28)
	local v30 = math.cos(v29)
	local v31 = math.sin(v29)
	local v32 = Vector3.new(v30, 0, v31)
	local v33 = math.random(300, 500)
	local v34 = math.random(250, 350)
	local v35 = p27 + (v32 * v33 + Vector3.new(0, v34, 0))
	local v_u_36 = game.ReplicatedStorage.CupidsArrow:Clone()
	v_u_36.CFrame = CFrame.new(v35, p27)
	v_u_36.Parent = workspace.WeatherVisuals
	local v37 = (p27 - v35).Magnitude / 300
	local v38 = 0
	local v39 = false
	while v38 < v37 do
		local v40 = task.wait()
		v38 = v38 + v40
		if v37 - v38 < 3.5 and not v39 then
			v39 = true
			if Random.new():NextInteger(1, 2) == 1 then
				v_u_5:PlaySound(v_u_6.Weather.MeteorShower.Starfall, {
					["PlaybackSpeed"] = 1.25
				}, nil, v_u_36)
			else
				v_u_5:PlaySound(v_u_6.Weather.MeteorShower.Starfall, nil, nil, v_u_36)
			end
		end
		local v41 = v_u_36.Position
		local _ = (p27 - v41).Magnitude
		local v42 = v41 + (p27 - v41).Unit * 300 * v40
		v_u_36:PivotTo(CFrame.new(v42, p27))
	end
	for _, v43 in v_u_36:GetDescendants() do
		if v43:IsA("BillboardGui") then
			v43.Enabled = false
		end
	end
	v_u_26:Shake(v_u_26.Presets.Explosion)
	local v44 = game.ReplicatedStorage.StarHit:Clone()
	v44.CFrame = CFrame.new(p27)
	v44.Parent = workspace.WeatherVisuals
	for _, v45 in v44:GetDescendants() do
		if v45:IsA("ParticleEmitter") then
			v45:Emit(v45:GetAttribute("EmitCount"))
		elseif v45:IsA("Sound") then
			v45:Play()
		elseif v45:IsA("PointLight") then
			game.TweenService:Create(v45, TweenInfo.new(3), {
				["Range"] = 0
			}):Play()
		end
	end
	game.Debris:AddItem(v44, 3)
	task.delay(3, function()
		-- upvalues: (copy) v_u_36, (ref) v_u_7
		for _, v46 in pairs(v_u_36:GetDescendants()) do
			if v46:IsA("ParticleEmitter") then
				v46.Enabled = false
			end
		end
		v_u_7.target(v_u_36, 2, 1, {
			["Transparency"] = 1
		})
		task.delay(3, function()
			-- upvalues: (ref) v_u_36
			if v_u_36:IsDescendantOf(workspace) then
				v_u_36:Destroy()
			end
		end)
	end)
end
v8.OnClientEvent:Connect(function(p48)
	-- upvalues: (copy) v_u_47
	v_u_47(p48)
end)
workspace:GetAttributeChangedSignal("CupidsArrows"):Connect(function()
	-- upvalues: (copy) v_u_22, (copy) v_u_24
	if workspace:GetAttribute("CupidsArrows") then
		v_u_22()
	else
		v_u_24()
	end
end)
if workspace:GetAttribute("CupidsArrows") then
	task.defer(function()
		-- upvalues: (copy) v_u_22
		v_u_22(true)
	end)
elseif v_u_11 ~= false then
	v_u_2.Cupids_Arrows.Value = false
	v_u_11 = false
end
return v1