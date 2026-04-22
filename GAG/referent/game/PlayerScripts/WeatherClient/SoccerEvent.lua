local v1 = {}
local v_u_2 = false
local v3 = game:GetService("ReplicatedStorage")
local v_u_4 = game.Lighting.ColorCorrection:Clone()
v_u_4.Name = script.Name
v_u_4.Parent = game.Lighting
local v_u_5 = script.Sky
require(v3.Code.BodyShaker)
local v_u_6 = require(v3.Modules.SkyboxManager)
local v_u_7 = require(v3.Modules.SoundPlayer)
local v_u_8 = require(v3.Data.SoundData)
v_u_6.AddSkybox(v_u_5)
local v_u_9 = require(v3:WaitForChild("Cutscene_Module"))
local v_u_10 = require(v3.Field_Of_View_Module)
local v_u_11 = game:GetService("TweenService")
require(v3.Code.CameraShaker).new(Enum.RenderPriority.Camera.Value, function(p12)
	workspace.CurrentCamera.CFrame = workspace.CurrentCamera.CFrame * p12
end)
local v_u_13 = require(v3.Modules.Trove)
local function v_u_32()
	-- upvalues: (ref) v_u_2, (copy) v_u_13, (copy) v_u_9, (copy) v_u_10, (copy) v_u_7, (copy) v_u_8, (copy) v_u_6, (copy) v_u_5, (copy) v_u_11, (copy) v_u_4
	v_u_2 = true
	local v_u_14 = v_u_13.new()
	task.spawn(function()
		-- upvalues: (ref) v_u_9, (ref) v_u_10, (copy) v_u_14, (ref) v_u_7, (ref) v_u_8
		v_u_9.Flash(1.5)
		v_u_10.Change_FOV(70, 0.5)
		task.delay(0.25, function()
			-- upvalues: (ref) v_u_14, (ref) v_u_7, (ref) v_u_8
			v_u_14:Add(v_u_7:PlaySound(v_u_8.Weather.SoccerEvent.Snap, {
				["Volume"] = 1
			}, nil, nil, { "LazyLoadSound" }))
		end)
		task.wait(0.75)
		v_u_14:Add(v_u_7:PlaySound(v_u_8.Weather.SoccerEvent.Whistle, {
			["Volume"] = 0.3
		}, nil))
	end)
	task.delay(4, function()
		-- upvalues: (copy) v_u_14
		local v_u_15 = game.Workspace.WeatherVisuals:FindFirstChild("Goals")
		local v_u_16 = game.Workspace.WeatherVisuals:FindFirstChild("SoccerBall")
		if v_u_15 and (v_u_16 and game.Players.LocalPlayer:GetAttribute("SoccerTeam")) then
			local v_u_17 = v_u_14:Add(script.Arrow:Clone())
			v_u_17.Parent = game.Workspace.WeatherVisuals
			local function v_u_20(p18)
				-- upvalues: (copy) v_u_15
				for _, v19 in ipairs(v_u_15:GetDescendants()) do
					if v19:IsA("BasePart") and v19:GetAttribute("Team") == p18 then
						return v19
					end
				end
				return nil
			end
			local v_u_21 = nil
			v_u_21 = v_u_14:Add(game:GetService("RunService").Heartbeat:Connect(function()
				-- upvalues: (copy) v_u_15, (copy) v_u_16, (ref) v_u_21, (copy) v_u_17, (copy) v_u_20
				if v_u_15 and (v_u_15.Parent and (v_u_16 and v_u_16.Parent)) then
					local v22 = game.Players.LocalPlayer:GetAttribute("SoccerTeam")
					if v22 then
						local v23 = v_u_20(v22 == 1 and 2 or 1)
						if v23 then
							local v24 = v_u_16.Position
							local v25 = v23.Position
							local v26 = v25.X - v24.X
							local v27 = v25.Z - v24.Z
							local v28 = Vector3.new(v26, 0, v27)
							local v29 = v24 + Vector3.new(0, 8, 0)
							if v28.Magnitude < 0.001 then
								v_u_17:PivotTo(CFrame.new(v29))
							else
								v_u_17:PivotTo(CFrame.lookAt(v29, v29 + v28.Unit, Vector3.new(0, 1, 0)) * CFrame.Angles(0, -1.5707963267948966, 0))
							end
						else
							return
						end
					else
						return
					end
				else
					if v_u_21 then
						v_u_21:Disconnect()
					end
					if v_u_17 then
						v_u_17:Destroy()
					end
					return
				end
			end))
		end
	end)
	task.delay(4, function()
		-- upvalues: (copy) v_u_14
		task.spawn(function()
			-- upvalues: (ref) v_u_14
			local v_u_30 = v_u_14:Add(script:FindFirstChild("ObbyTimer"):Clone())
			v_u_30.Parent = game.Players.LocalPlayer.PlayerGui
			v_u_14:Add(workspace:GetAttributeChangedSignal("SoccerEventTimer"):Connect(function()
				-- upvalues: (copy) v_u_30
				local v31 = workspace:GetAttribute("SoccerEventTimer")
				if v31 then
					v_u_30.TextLabel.Text = v31
				else
					v_u_30:Destroy()
				end
			end))
		end)
	end)
	repeat
		task.wait()
	until v_u_2 == false
	v_u_14:Destroy()
	v_u_6.UpdateSkybox(v_u_5, 0)
	v_u_11:Create(game.Lighting, TweenInfo.new(3), {
		["Ambient"] = Color3.fromRGB(138, 138, 138),
		["Brightness"] = 2,
		["ClockTime"] = 14,
		["ColorShift_Bottom"] = Color3.fromRGB(0, 0, 0),
		["ColorShift_Top"] = Color3.fromRGB(0, 0, 0),
		["EnvironmentDiffuseScale"] = 0,
		["EnvironmentSpecularScale"] = 0,
		["ExposureCompensation"] = 0,
		["GeographicLatitude"] = 29.475,
		["OutdoorAmbient"] = Color3.fromRGB(128, 128, 128)
	}):Play()
	v_u_11:Create(game.Lighting.Atmosphere, TweenInfo.new(3), {
		["Density"] = 0,
		["Offset"] = 0,
		["Color"] = Color3.fromRGB(215, 244, 255),
		["Decay"] = Color3.fromRGB(190, 238, 255),
		["Glare"] = 0,
		["Haze"] = 0
	}):Play()
	v_u_11:Create(v_u_4, TweenInfo.new(3), {
		["Brightness"] = 0,
		["Contrast"] = 0,
		["Saturation"] = 0,
		["TintColor"] = Color3.fromRGB(255, 255, 255)
	}):Play()
	v_u_11:Create(game.Workspace.Terrain.Clouds, TweenInfo.new(3), {
		["Cover"] = 0,
		["Density"] = 0.097,
		["Color"] = Color3.fromRGB(22, 40, 70)
	}):Play()
	v_u_11:Create(game.Workspace.BasePlate.TopBaseplate, TweenInfo.new(3), {
		["Color"] = Color3.fromRGB(91, 154, 76)
	}):Play()
end
workspace:GetAttributeChangedSignal("SoccerEvent"):Connect(function()
	-- upvalues: (copy) v_u_32, (ref) v_u_2
	if workspace:GetAttribute("SoccerEvent") then
		v_u_32()
	else
		v_u_2 = false
	end
end)
if workspace:GetAttribute("SoccerEvent") then
	task.defer(v_u_32)
else
	v_u_2 = false
end
return v1