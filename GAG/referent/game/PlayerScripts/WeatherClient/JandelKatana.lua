local v1 = {}
local v_u_2 = game:GetService("ReplicatedStorage")
local v_u_3 = require(v_u_2.Data.SoundData)
local v_u_4 = require(v_u_2.Modules.SoundPlayer)
local v_u_5 = false
local v_u_6 = game:GetService("TweenService")
local v_u_7 = require(game.ReplicatedStorage.Code.CameraShaker)
local v_u_9 = v_u_7.new(Enum.RenderPriority.Camera.Value, function(p8)
	workspace.CurrentCamera.CFrame = workspace.CurrentCamera.CFrame * p8
end)
v_u_9:Start()
local v_u_10 = require(game.ReplicatedStorage.Modules.Notification)
local function v_u_49(_)
	-- upvalues: (ref) v_u_5, (copy) v_u_2, (copy) v_u_4, (copy) v_u_3, (copy) v_u_9, (copy) v_u_7, (copy) v_u_6, (copy) v_u_10
	if v_u_5 ~= true then
		v_u_5 = true
		local v_u_11 = v_u_2.Assets.KatanaJandel:Clone()
		v_u_11.Parent = workspace.WeatherVisuals
		local v12 = v_u_11:WaitForChild("Humanoid"):WaitForChild("Animator"):LoadAnimation(script.Anim)
		v12:Play(0, nil, 100)
		task.wait(2)
		v12:Stop(0)
		v12:Play(0)
		v_u_11:PivotTo(CFrame.new(-518.933, 100, -18.5) * CFrame.Angles(0, -1.5707963267948966, 0))
		v_u_4:PlaySound(v_u_3.Weather.JandelKatana.Poof, {
			["PlaybackSpeed"] = 0.7,
			["Volume"] = 5
		}, nil, v_u_11:WaitForChild("HumanoidRootPart"))
		for _, v13 in v_u_11:GetChildren() do
			if v13:IsA("BasePart") then
				local v14 = script.Smoke:Clone()
				v14.Parent = v13
				v14:Emit(10)
			end
		end
		v12.Stopped:Once(function()
			-- upvalues: (copy) v_u_11, (ref) v_u_4, (ref) v_u_3
			if v_u_11 ~= nil then
				v_u_4:PlaySound(v_u_3.Weather.JandelKatana.Poof, {
					["PlaybackSpeed"] = 0.7,
					["Volume"] = 5
				}, nil, v_u_11:WaitForChild("HumanoidRootPart"))
				for _, v15 in v_u_11:GetChildren() do
					if v15:IsA("BasePart") then
						local v16 = script.Smoke:Clone()
						v16.Parent = v15
						v16:Emit(10)
					end
				end
				for _, v17 in v_u_11:GetDescendants() do
					if v17:IsA("BasePart") or (v17:IsA("Decal") or v17:IsA("Texture")) then
						v17.Transparency = 1
					end
				end
			end
		end)
		task.wait(4.5)
		v_u_9:Shake(v_u_7.Presets.Bump)
		v_u_4:PlaySound(v_u_3.Weather.JandelKatana.Shimmer, {
			["PlaybackSpeed"] = 1.5,
			["Volume"] = 3
		}, nil, v_u_11.Katana.Attachment)
		v_u_4:PlaySound(v_u_3.Weather.JandelKatana.Shimmer2, {
			["Volume"] = 1
		}, nil, v_u_11.Katana.Attachment)
		v_u_11.Katana.Attachment.Sheath1:Emit(1)
		v_u_11.Katana.Attachment.Sheath2:Emit(1)
		v_u_4:PlaySound(v_u_3.Weather.JandelKatana.Slash1, {
			["PlaybackSpeed"] = 0.7
		})
		v_u_4:PlaySound(v_u_3.Weather.JandelKatana.Slash2)
		task.wait(0.5)
		v12:AdjustSpeed(0)
		v_u_9:Shake(v_u_7.Presets.Bump)
		local v18 = v_u_11:WaitForChild("cookedowl")
		for _ = 1, 10 do
			v18.CENTER.slice:Emit(3)
			v_u_4:PlaySound(v_u_3.Weather.JandelKatana.Shimmer, {
				["PlaybackSpeed"] = 1.5,
				["Volume"] = 3
			}, nil, v_u_11.Katana.Attachment)
			task.wait(0.12)
		end
		task.wait(1)
		v18.owl:Destroy()
		v_u_4:PlaySound(v_u_3.Weather.JandelKatana.Slash1, {
			["PlaybackSpeed"] = 0.7,
			["Volume"] = 7
		}, nil, v_u_11.Katana.Attachment)
		v_u_4:PlaySound(v_u_3.Weather.JandelKatana.GiantSlashHit, {
			["Volume"] = 3
		}, nil, v_u_11.Katana.Attachment)
		v18.CENTER.boom:Emit(3)
		v18.CENTER.Dust:Emit(100)
		task.wait(2)
		v12:AdjustSpeed(1)
		v_u_9:Shake(v_u_7.Presets.Bump)
		v_u_4:PlaySound(v_u_3.Weather.JandelKatana.Shimmer, {
			["PlaybackSpeed"] = 1.5,
			["Volume"] = 3
		}, nil, v_u_11.Katana.Attachment)
		v_u_4:PlaySound(v_u_3.Weather.JandelKatana.Shimmer2, {
			["Volume"] = 1
		}, nil, v_u_11.Katana.Attachment)
		v_u_11.Katana.Attachment.Sheath1:Emit(1)
		v_u_11.Katana.Attachment.Sheath2:Emit(1)
		v_u_4:PlaySound(v_u_3.Weather.JandelKatana.Slash1, {
			["PlaybackSpeed"] = 0.7,
			["Volume"] = 1
		})
		v_u_4:PlaySound(v_u_3.Weather.JandelKatana.Slash2, {
			["Volume"] = 1
		})
		task.wait(1)
		v_u_9:Shake(v_u_7.Presets.Bump)
		local v19 = script.WorldSlashPart:Clone()
		v19.Parent = workspace.WeatherVisuals
		v19.Beam.Enabled = true
		v_u_4:PlaySound(v_u_3.Weather.JandelKatana.SlashRotation, {
			["PlaybackSpeed"] = 0.75,
			["Volume"] = 1.2
		})
		v_u_4:PlaySound(v_u_3.Weather.JandelKatana.SlashRotation2, {
			["Volume"] = 2
		})
		local v20 = TweenInfo.new(0.5, Enum.EasingStyle.Cubic, Enum.EasingDirection.Out, 0, false, 0)
		local v21 = TweenInfo.new(0.25, Enum.EasingStyle.Cubic, Enum.EasingDirection.In, 0, false, 0)
		v_u_6:Create(v19.Attachment1, v20, {
			["Position"] = Vector3.new(0, 500, 0)
		}):Play()
		v_u_6:Create(v19.Attachment2, v20, {
			["Position"] = Vector3.new(0, -500, 0)
		}):Play()
		v_u_6:Create(v19, v20, {
			["Orientation"] = Vector3.new(0, 0, -179)
		}):Play()
		local v22 = script.BaseplateSlices:Clone()
		v22.Parent = workspace.BasePlate.TopBaseplate
		v22.Enabled = true
		local v23 = script.TopPlate:Clone()
		v23.Parent = workspace.WeatherVisuals
		v_u_6:Create(v23, v20, {
			["Transparency"] = 0.5
		}):Play()
		task.wait(0.35)
		v_u_4:PlaySound(v_u_3.Weather.JandelKatana.pre)
		task.wait(0.15)
		v_u_6:Create(v19.Attachment1, v21, {
			["Position"] = Vector3.new(0, 0, 0)
		}):Play()
		v_u_6:Create(v19.Attachment2, v21, {
			["Position"] = Vector3.new(0, 0, 0)
		}):Play()
		v_u_6:Create(v23, v21, {
			["Transparency"] = 1
		}):Play()
		task.wait(0.25)
		v_u_4:PlaySound(v_u_3.Weather.JandelKatana.GiantSlashHit, {
			["Volume"] = 1
		})
		v_u_4:PlaySound(v_u_3.Weather.JandelKatana.Slash3, {
			["PlaybackSpeed"] = 0.75,
			["Volume"] = 0.7
		})
		v_u_4:PlaySound(v_u_3.Weather.JandelKatana.EarthSplit, {
			["Volume"] = 3
		})
		v_u_10:CreateNotification("Some fruits have been given the Sliced mutation.")
		v_u_9:Shake(v_u_7.Presets.Explosion)
		v19.Lines.Enabled = true
		v19.Waves.Enabled = true
		v19.Sparks.Enabled = true
		v22.Enabled = false
		for _, v24 in workspace.BasePlate:GetDescendants() do
			if v24:IsA("BasePart") or (v24:IsA("Texture") or v24:IsA("Decal")) then
				v24:SetAttribute("SAVEDTRANSPARENCY", v24.Transparency)
				v24.Transparency = 1
			end
		end
		local v25 = script.PlateSplit:Clone()
		v25.Parent = workspace.WeatherVisuals
		v_u_4:PlaySound(v_u_3.Weather.JandelKatana.EarthSplit2, {
			["PlaybackSpeed"] = 0.6,
			["Volume"] = 1.5
		})
		local v26 = TweenInfo.new(2, Enum.EasingStyle.Cubic, Enum.EasingDirection.Out, 0, false, 0)
		local v27 = v_u_6
		local v28 = v25.TopBaseplate2
		local v29 = {}
		local v30 = CFrame.new(-104.5, -10, 286.5)
		local v31 = CFrame.Angles
		local v32 = math.random(-15, 15)
		local v33 = math.rad(v32)
		local v34 = math.random(-15, 15)
		local v35 = math.rad(v34)
		local v36 = math.random(-15, 15)
		v29.CFrame = v30 * v31(v33, v35, (math.rad(v36)))
		v27:Create(v28, v26, v29):Play()
		local v37 = v_u_6
		local v38 = v25.TopBaseplate1
		local v39 = {}
		local v40 = CFrame.new(-104.5, -10, -313.5)
		local v41 = CFrame.Angles
		local v42 = math.random(-15, 15)
		local v43 = math.rad(v42)
		local v44 = math.random(-15, 15)
		local v45 = math.rad(v44)
		local v46 = math.random(-15, 15)
		v39.CFrame = v40 * v41(v43, v45, (math.rad(v46)))
		v37:Create(v38, v26, v39):Play()
		task.wait(0.5)
		v19.Lines.Enabled = false
		v19.Waves.Enabled = false
		v19.Sparks.Enabled = false
		v19.Beam.Enabled = false
		task.wait(3)
		for _, v47 in v25:GetDescendants() do
			if v47:IsA("BasePart") or (v47:IsA("Texture") or v47:IsA("Decal")) then
				v_u_6:Create(v47, TweenInfo.new(1, Enum.EasingStyle.Cubic, Enum.EasingDirection.InOut, 0, false, 0), {
					["Transparency"] = 1
				}):Play()
			end
		end
		for _, v48 in workspace.BasePlate:GetDescendants() do
			if v48:IsA("BasePart") or (v48:IsA("Texture") or v48:IsA("Decal")) then
				v_u_6:Create(v48, TweenInfo.new(1, Enum.EasingStyle.Cubic, Enum.EasingDirection.InOut, 0, false, 0), {
					["Transparency"] = v48:GetAttribute("SAVEDTRANSPARENCY")
				}):Play()
				v48:SetAttribute("SAVEDTRANSPARENCY", nil)
			end
		end
		task.wait(1)
		v25:Destroy()
		v19:Destroy()
		v23:Destroy()
		v22:Destroy()
		v_u_11:Destroy()
	end
end
workspace:GetAttributeChangedSignal("JandelKatana"):Connect(function()
	-- upvalues: (copy) v_u_49, (ref) v_u_5
	if workspace:GetAttribute("JandelKatana") then
		v_u_49()
		return
	elseif v_u_5 ~= false then
		v_u_5 = false
	end
end)
if workspace:GetAttribute("JandelKatana") then
	task.defer(function()
		-- upvalues: (copy) v_u_49
		v_u_49(true)
	end)
elseif v_u_5 ~= false then
	v_u_5 = false
end
return v1