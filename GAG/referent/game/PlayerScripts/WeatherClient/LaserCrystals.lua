local v1 = {}
local v2 = game:GetService("ReplicatedStorage")
local v_u_3 = require(v2.Modules.SoundPlayer)
local v_u_4 = require(v2.Data.SoundData)
local v_u_5 = {}
local v_u_6 = {}
local v_u_7 = false
local v_u_8 = game:GetService("TweenService")
local v_u_9 = require(game.ReplicatedStorage.Modules.Notification)
local v_u_10 = require(v2.Modules.ScreenShakeCore)
local function v_u_36(_)
	-- upvalues: (ref) v_u_7, (copy) v_u_9, (copy) v_u_3, (copy) v_u_4, (copy) v_u_10, (copy) v_u_5, (copy) v_u_6, (copy) v_u_8
	if v_u_7 ~= true then
		v_u_7 = true
		v_u_9:CreateNotification("Crystals have appeared circling the map!")
		local v_u_11 = script.CrystalCenter:Clone()
		v_u_11.Parent = workspace.WeatherVisuals
		task.spawn(function()
			-- upvalues: (copy) v_u_11, (ref) v_u_3, (ref) v_u_4, (ref) v_u_10
			for _, v12 in v_u_11:GetChildren() do
				v12.Flash:Emit(8)
				local v13 = {
					["RollOffMaxDistance"] = 10000,
					["RollOffMinDistance"] = 10,
					["RollOffMode"] = Enum.RollOffMode.Inverse,
					["Volume"] = 3,
					["PlaybackSpeed"] = 1.8,
					["TimePosition"] = 0
				}
				local v14 = {
					["RollOffMaxDistance"] = 10000,
					["RollOffMinDistance"] = 100,
					["RollOffMode"] = Enum.RollOffMode.Linear,
					["Volume"] = 2,
					["PlaybackSpeed"] = 1.1,
					["TimePosition"] = 0
				}
				v_u_3:PlaySound(v_u_4.Weather.LaserCrystals.Appear, v13, nil, v12)
				v_u_3:PlaySound(v_u_4.Weather.LaserCrystals.Appear2, v14, nil, v12)
				v12.Transparency = 0
				v_u_10:ScreenShake("Normal", { "Vector" }, 2, 0.3, 0.2)
				v_u_10:ScreenShake("Normal", { "Tilt", 3 }, 5, 0.5, 0.5)
				task.wait(0.3)
			end
		end)
		local v_u_15 = {
			math.random(2, 5),
			math.random(2, 5),
			math.random(2, 5),
			math.random(2, 5)
		}
		local function v_u_31(p16)
			-- upvalues: (ref) v_u_10, (ref) v_u_3, (ref) v_u_4, (ref) v_u_5, (ref) v_u_6, (ref) v_u_8
			if p16 ~= nil and p16.Transparency < 1 then
				local v17 = math.random(-352, 143)
				local v18 = math.random
				local v19 = Vector3.new(v17, 0.5, v18(-212, 185))
				local v20 = math.random(-352, 143)
				local v21 = math.random
				local v22 = Vector3.new(v20, 0.5, v21(-212, 185))
				v_u_10:ScreenShake("Normal", { "Vector" }, 2, 0.5, 0.4)
				v_u_10:ScreenShake("Normal", { "Tilt", 6 }, 6, 0.7, 0.7)
				p16.Att2.WorldPosition = v19
				local v23 = {
					["RollOffMaxDistance"] = 10000,
					["RollOffMinDistance"] = 50,
					["RollOffMode"] = Enum.RollOffMode.Inverse,
					["Volume"] = 2.5,
					["PlaybackSpeed"] = 1,
					["TimePosition"] = 0,
					["Looped"] = true
				}
				local v24 = v_u_3:PlaySound(v_u_4.Weather.LaserCrystals.BeamConstant, v23, nil, p16)
				local v25 = {
					["RollOffMaxDistance"] = 10000,
					["RollOffMinDistance"] = 100,
					["RollOffMode"] = Enum.RollOffMode.Inverse,
					["Volume"] = 3,
					["PlaybackSpeed"] = 2,
					["TimePosition"] = 0
				}
				v_u_3:PlaySound(v_u_4.Weather.LaserCrystals.Boom, v25, nil, p16)
				local v26 = v_u_5
				table.insert(v26, v24)
				p16.Flash:Emit(5)
				p16.Att1.Dots.Enabled = true
				p16.Att1.Waves.Enabled = true
				p16.Att1.Waves:Emit(1)
				local v27 = v_u_3:PlaySound(v_u_4.Weather.LaserCrystals.BeamConstant, v23, nil, p16.Att2)
				local v28 = v_u_6
				table.insert(v28, v27)
				local v29 = {
					["RollOffMaxDistance"] = 50000,
					["RollOffMinDistance"] = 50,
					["RollOffMode"] = Enum.RollOffMode.Inverse,
					["Volume"] = 9,
					["PlaybackSpeed"] = 2,
					["TimePosition"] = 0
				}
				v_u_3:PlaySound(v_u_4.Weather.LaserCrystals.Att2.Impact, v29, nil, p16.Att2)
				p16.Att2.Active.Enabled = true
				p16.Att2.Waves.Enabled = true
				p16.b1.Enabled = true
				p16.b2.Enabled = true
				p16.b3.Enabled = true
				local v30 = TweenInfo.new(1.8, Enum.EasingStyle.Cubic, Enum.EasingDirection.Out, 0, false, 0)
				v_u_8:Create(p16.Att2, v30, {
					["WorldPosition"] = v22
				}):Play()
				task.wait(1.8)
				v24:Stop()
				p16.Flash:Emit(5)
				p16.Att1.Dots.Enabled = false
				p16.Att1.Waves.Enabled = false
				v27:Stop()
				p16.Att2.Active.Enabled = false
				p16.Att2.Waves.Enabled = false
				p16.b1.Enabled = false
				p16.b2.Enabled = false
				p16.b3.Enabled = false
			end
		end
		local function v35()
			-- upvalues: (copy) v_u_11, (copy) v_u_15, (copy) v_u_31
			if v_u_11 ~= nil then
				for v_u_32, v33 in v_u_15 do
					if v33 - 1 <= 0 then
						v_u_15[v_u_32] = math.random(1, 5)
						task.spawn(function()
							-- upvalues: (ref) v_u_31, (ref) v_u_11, (copy) v_u_32
							v_u_31(v_u_11["Crystal" .. v_u_32])
						end)
					else
						local v34 = v_u_15
						v34[v_u_32] = v34[v_u_32] - 1
					end
				end
			end
		end
		while v_u_11 ~= nil do
			v35()
			v_u_8:Create(v_u_11, TweenInfo.new(2, Enum.EasingStyle.Linear, Enum.EasingDirection.InOut, 0, false, 0), {
				["CFrame"] = v_u_11.CFrame * CFrame.Angles(0, 0.7853981633974483, 0)
			}):Play()
			task.wait(2)
		end
		table.clear(v_u_15)
	end
end
local function v_u_42(_)
	-- upvalues: (ref) v_u_7, (copy) v_u_3, (copy) v_u_4, (copy) v_u_5, (copy) v_u_6
	if v_u_7 ~= false then
		v_u_7 = false
		local v37 = workspace.WeatherVisuals:FindFirstChild("CrystalCenter")
		if v37 then
			local v38 = 1
			for _, v39 in v37:GetChildren() do
				v39.Flash:Emit(8)
				local v40 = {
					["RollOffMaxDistance"] = 10000,
					["RollOffMinDistance"] = 10,
					["RollOffMode"] = Enum.RollOffMode.Inverse,
					["Volume"] = 3,
					["PlaybackSpeed"] = 1.8,
					["TimePosition"] = 0
				}
				local v41 = {
					["RollOffMaxDistance"] = 10000,
					["RollOffMinDistance"] = 100,
					["RollOffMode"] = Enum.RollOffMode.Linear,
					["Volume"] = 2,
					["PlaybackSpeed"] = 1.1,
					["TimePosition"] = 0
				}
				v_u_3:PlaySound(v_u_4.Weather.LaserCrystals.Appear, v40, nil, v39)
				v_u_3:PlaySound(v_u_4.Weather.LaserCrystals.Appear2, v41, nil, v39)
				v39.Transparency = 1
				if v38 <= #v_u_5 then
					v_u_5[v38]:Stop()
				end
				v38 = v38 + 1
				v39.Flash:Emit(5)
				v39.Att1.Dots.Enabled = false
				v39.Att1.Waves.Enabled = false
				if v38 <= #v_u_6 then
					v_u_6[v38]:Stop()
				end
				v39.Att2.Active.Enabled = false
				v39.Att2.Waves.Enabled = false
				v39.b1.Enabled = false
				v39.b2.Enabled = false
				v39.b3.Enabled = false
				task.wait(0.2)
			end
			task.wait(5)
			if v37 then
				v37:Destroy()
			end
		end
	end
end
workspace:GetAttributeChangedSignal("LaserCrystals"):Connect(function()
	-- upvalues: (copy) v_u_36, (copy) v_u_42
	if workspace:GetAttribute("LaserCrystals") then
		v_u_36()
	else
		v_u_42()
	end
end)
if workspace:GetAttribute("LaserCrystals") then
	task.defer(function()
		-- upvalues: (copy) v_u_36
		v_u_36(true)
	end)
else
	v_u_42(true)
end
return v1