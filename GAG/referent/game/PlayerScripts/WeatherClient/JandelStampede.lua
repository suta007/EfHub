local v1 = {}
local v_u_2 = game:GetService("TweenService")
local v3 = game:GetService("Players")
local v4 = game.Lighting
require(game.ReplicatedStorage.Modules.Notification)
local v_u_5 = require(game.ReplicatedStorage.Code.CameraShaker)
local v_u_6 = v3.LocalPlayer
local v_u_7 = workspace.CurrentCamera
local v_u_8 = false
local v_u_9 = 0
local v_u_10 = {}
local v_u_12 = v_u_5.new(Enum.RenderPriority.Camera.Value, function(p11)
	-- upvalues: (copy) v_u_7
	v_u_7.CFrame = v_u_7.CFrame * p11
end)
v_u_12:Start()
local v_u_13 = v4.ColorCorrection:Clone()
v_u_13.Name = "JandelStampede"
v_u_13.Parent = v4
local v_u_14 = nil
local v_u_15 = nil
local function v_u_19()
	-- upvalues: (ref) v_u_15, (copy) v_u_2
	if v_u_15 and v_u_15.Parent then
		local v16 = v_u_15
		v_u_2:Create(v16, TweenInfo.new(0.8, Enum.EasingStyle.Back, Enum.EasingDirection.In), {
			["Position"] = UDim2.new(0.5, 0, -0.1, 0)
		}):Play()
		local v17 = v16:FindFirstChildOfClass("UIStroke")
		if v17 then
			v_u_2:Create(v17, TweenInfo.new(0.8), {
				["Transparency"] = 1
			}):Play()
		end
		v_u_2:Create(v16, TweenInfo.new(0.8), {
			["BackgroundTransparency"] = 1
		}):Play()
		local v18 = v16:FindFirstChild("Title")
		if v18 then
			v_u_2:Create(v18, TweenInfo.new(0.8), {
				["TextTransparency"] = 1
			}):Play()
		end
	end
end
local function v_u_23()
	-- upvalues: (ref) v_u_15, (copy) v_u_2
	if v_u_15 and v_u_15.Parent then
		local v20 = v_u_15
		v_u_2:Create(v20, TweenInfo.new(0.6, Enum.EasingStyle.Back, Enum.EasingDirection.Out), {
			["Position"] = UDim2.new(0.5, 0, 0.3, 0)
		}):Play()
		v20.BackgroundTransparency = 0.25
		local v21 = v20:FindFirstChildOfClass("UIStroke")
		if v21 then
			v21.Transparency = 0.2
		end
		local v22 = v20:FindFirstChild("Title")
		if v22 then
			v22.TextTransparency = 0
		end
	end
end
local v_u_24 = 0
local function v_u_28(p25)
	-- upvalues: (ref) v_u_15, (ref) v_u_24, (copy) v_u_23, (copy) v_u_19
	if v_u_15 then
		local v26 = v_u_15:FindFirstChild("Title")
		if v26 then
			if p25 > 0 then
				v26.Text = ("FOUND %* JANDEL%*! KEEP LOOKING!"):format(p25, p25 > 1 and "S" or "")
			end
			v_u_24 = v_u_24 + 1
			local v_u_27 = v_u_24
			v_u_23()
			task.delay(3, function()
				-- upvalues: (ref) v_u_24, (copy) v_u_27, (ref) v_u_15, (ref) v_u_19
				if v_u_24 == v_u_27 and (v_u_15 and v_u_15.Parent) then
					v_u_19()
				end
			end)
		end
	else
		return
	end
end
local function v_u_32()
	-- upvalues: (ref) v_u_14, (copy) v_u_6, (ref) v_u_15, (copy) v_u_2, (copy) v_u_19
	v_u_14 = Instance.new("ScreenGui")
	v_u_14.Name = "JandelStampedeHud"
	v_u_14.ResetOnSpawn = false
	v_u_14.DisplayOrder = -20
	v_u_14.Parent = v_u_6.PlayerGui
	v_u_15 = Instance.new("Frame")
	v_u_15.Name = "Banner"
	v_u_15.AnchorPoint = Vector2.new(0.5, 0)
	v_u_15.Size = UDim2.new(0.3, 0, 0.05, 0)
	v_u_15.BackgroundColor3 = Color3.fromRGB(20, 15, 10)
	v_u_15.BackgroundTransparency = 0.25
	v_u_15.BorderSizePixel = 0
	v_u_15.Parent = v_u_14
	local v29 = Instance.new("UICorner")
	v29.CornerRadius = UDim.new(0, 10)
	v29.Parent = v_u_15
	local v30 = Instance.new("UIStroke")
	v30.Color = Color3.fromRGB(230, 170, 60)
	v30.Thickness = 2
	v30.Transparency = 0.2
	v30.Parent = v_u_15
	local v31 = Instance.new("TextLabel")
	v31.Name = "Title"
	v31.Size = UDim2.new(1, 0, 1, 0)
	v31.BackgroundTransparency = 1
	v31.Text = "FIND JANDEL IN THE CROWD!"
	v31.TextColor3 = Color3.fromRGB(255, 210, 80)
	v31.TextScaled = true
	v31.Font = Enum.Font.Cartoon
	v31.Parent = v_u_15
	v_u_15.Position = UDim2.new(0.5, 0, 0.22, 0)
	v_u_2:Create(v_u_15, TweenInfo.new(0.6, Enum.EasingStyle.Back, Enum.EasingDirection.Out), {
		["Position"] = UDim2.new(0.5, 0, 0.3, 0)
	}):Play()
	task.delay(4, function()
		-- upvalues: (ref) v_u_15, (ref) v_u_19
		if v_u_15 and v_u_15.Parent then
			v_u_19()
		end
	end)
end
local function v_u_35(p33)
	if p33 and p33.Parent then
		if not p33:FindFirstChildWhichIsA("Highlight") then
			local v34 = Instance.new("Highlight")
			v34.FillTransparency = 1
			v34.OutlineTransparency = 0
			v34.OutlineColor = Color3.fromRGB(80, 255, 80)
			v34.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
			v34.Parent = p33
		end
	else
		return
	end
end
local function v_u_36()
	-- upvalues: (copy) v_u_12, (copy) v_u_5, (copy) v_u_2, (copy) v_u_13
	v_u_12:Shake(v_u_5.Presets.Bump)
	v_u_2:Create(v_u_13, TweenInfo.new(0.07), {
		["Brightness"] = 0.45,
		["TintColor"] = Color3.fromRGB(220, 255, 220)
	}):Play()
	task.delay(0.12, function()
		-- upvalues: (ref) v_u_2, (ref) v_u_13
		v_u_2:Create(v_u_13, TweenInfo.new(1, Enum.EasingStyle.Sine), {
			["Brightness"] = 0.08,
			["TintColor"] = Color3.fromRGB(255, 245, 220)
		}):Play()
	end)
end
local function v_u_38()
	-- upvalues: (ref) v_u_8, (ref) v_u_9, (copy) v_u_10, (copy) v_u_12, (copy) v_u_2, (copy) v_u_13, (copy) v_u_7, (ref) v_u_14, (ref) v_u_15
	v_u_8 = false
	v_u_9 = 0
	for _, v37 in v_u_10 do
		if typeof(v37) == "RBXScriptConnection" then
			v37:Disconnect()
		end
	end
	table.clear(v_u_10)
	v_u_12:StopSustained(1.5)
	v_u_2:Create(v_u_13, TweenInfo.new(3), {
		["TintColor"] = Color3.fromRGB(255, 255, 255),
		["Brightness"] = 0
	}):Play()
	v_u_2:Create(v_u_7, TweenInfo.new(1), {
		["FieldOfView"] = 70
	}):Play()
	if v_u_14 then
		v_u_14:Destroy()
		v_u_14 = nil
		v_u_15 = nil
	end
end
local function v_u_50()
	-- upvalues: (ref) v_u_8, (ref) v_u_9, (copy) v_u_6, (copy) v_u_32, (copy) v_u_28, (copy) v_u_2, (copy) v_u_13, (copy) v_u_36, (copy) v_u_10, (copy) v_u_35, (copy) v_u_38
	if not v_u_8 then
		v_u_8 = true
		local v39 = workspace:GetAttribute("JandelStampede_Found") or ""
		v_u_9 = 0
		for v40 in string.gmatch(v39, "[^;]+") do
			if v40 == v_u_6.Name then
				v_u_9 = v_u_9 + 1
			end
		end
		v_u_32()
		if v_u_9 > 0 then
			v_u_28(v_u_9)
		end
		v_u_2:Create(v_u_13, TweenInfo.new(3, Enum.EasingStyle.Quad), {
			["TintColor"] = Color3.fromRGB(255, 245, 220),
			["Brightness"] = 0.08
		}):Play()
		local v44 = workspace:GetAttributeChangedSignal("JandelStampede_Found"):Connect(function()
			-- upvalues: (ref) v_u_8, (ref) v_u_6, (ref) v_u_9, (ref) v_u_36, (ref) v_u_28
			if v_u_8 then
				local v41 = workspace:GetAttribute("JandelStampede_Found") or ""
				local v42 = 0
				for v43 in string.gmatch(v41, "[^;]+") do
					if v43 == v_u_6.Name then
						v42 = v42 + 1
					end
				end
				if v_u_9 < v42 then
					v_u_9 = v42
					v_u_36()
					v_u_28(v_u_9)
				end
			end
		end)
		local v45 = v_u_10
		table.insert(v45, v44)
		local v46 = game.ReplicatedStorage.GameEvents:FindFirstChild("JS_JandelFound")
		if v46 then
			local v48 = v46.OnClientEvent:Connect(function(p47)
				-- upvalues: (ref) v_u_35
				if p47 and p47:IsA("Model") then
					v_u_35(p47)
				end
			end)
			local v49 = v_u_10
			table.insert(v49, v48)
		end
		repeat
			task.wait(0.5)
		until not workspace:GetAttribute("JandelStampede")
		v_u_38()
	end
end
workspace:GetAttributeChangedSignal("JandelStampede"):Connect(function()
	-- upvalues: (copy) v_u_50, (ref) v_u_8, (copy) v_u_38
	if workspace:GetAttribute("JandelStampede") then
		task.defer(v_u_50)
	elseif v_u_8 then
		v_u_38()
	end
end)
if workspace:GetAttribute("JandelStampede") then
	task.defer(v_u_50)
end
return v1