local v1 = {}
local v2 = game:GetService("Players")
local v_u_3 = game:GetService("RunService")
local v_u_4 = game:GetService("TweenService")
local v_u_5 = game:GetService("Debris")
local v_u_6 = game:GetService("Lighting")
local v_u_7 = game:GetService("SoundService")
local v8 = game:GetService("ReplicatedStorage")
local v_u_9 = v8:WaitForChild("GameEvents"):WaitForChild("BubbleBathEvent")
local v_u_10 = require(v8.Modules.Trove)
local v_u_11 = require(v8.Modules.WeatherMusicManager)
local v_u_12 = require(v8.Data.SoundData)
local v_u_13 = require(v8.Modules.ScreenShakeCore)
local v_u_14 = require(v8.Modules.Notification)
local v_u_15 = v2.LocalPlayer
local v_u_16 = v_u_15:WaitForChild("PlayerGui")
local v_u_17 = false
local function v_u_23(p18)
	local v19 = script:FindFirstChild("ItemModels")
	if not v19 then
		warn("[BubbleBath] ItemModels folder missing from client script")
		return nil
	end
	local v20 = v19:FindFirstChild(p18)
	if v20 then
		return v20
	end
	local v21 = v19:FindFirstChild("Seeds")
	local v22 = v21 and v21:FindFirstChild(p18)
	if v22 then
		return v22
	end
	warn(string.format("[BubbleBath] no ItemModel for %q", p18))
	return nil
end
local function v_u_41(p24, p25)
	p24.BackgroundTransparency = 1
	local v_u_26
	if p25:IsA("Model") then
		v_u_26 = p25:Clone()
	else
		v_u_26 = Instance.new("Model")
		p25:Clone().Parent = v_u_26
	end
	v_u_26.Name = "ITEM_MODEL"
	for _, v27 in v_u_26:GetDescendants() do
		if v27:IsA("Script") or v27:IsA("LocalScript") then
			v27:Destroy()
		end
	end
	for _, v28 in v_u_26:GetDescendants() do
		if v28:IsA("BasePart") then
			v28.Anchored = true
			v28.CanCollide = false
			v28.CanQuery = false
			v28.CanTouch = false
		end
	end
	local v29, v30 = v_u_26:GetBoundingBox()
	local v31 = v30.X == 0 and (v30.Y == 0 and v30.Z == 0) and Vector3.new(1, 1, 1) or v30
	local v32 = Instance.new("Part")
	v32.Name = "PivotRoot"
	v32.Size = Vector3.new(0.05, 0.05, 0.05)
	v32.Transparency = 1
	v32.Anchored = true
	v32.CanCollide = false
	v32.CanQuery = false
	v32.CanTouch = false
	v32.Massless = true
	v32.CFrame = CFrame.new(v29.Position)
	v32.Parent = v_u_26
	v_u_26.PrimaryPart = v32
	local v33 = p24:FindFirstChildOfClass("Camera") or Instance.new("Camera")
	v33.FieldOfView = 15
	v33.CFrame = CFrame.new(Vector3.new(0, 0, 0), Vector3.new(0, 0, -1))
	v33.Parent = p24
	p24.CurrentCamera = v33
	v_u_26.Parent = p24
	local v34 = v31.X
	local v35 = v31.Y
	local v36 = v31.Z
	local v37 = math.max(v34, v35, v36) * 0.5 / 0.13165249758739583
	local v_u_38 = CFrame.new(0, 0, -(v37 * 1.55))
	local function v40(p39)
		-- upvalues: (ref) v_u_26, (copy) v_u_38
		if v_u_26 and v_u_26.Parent then
			v_u_26:PivotTo(v_u_38 * CFrame.Angles(-0.2617993877991494, p39, 0))
		end
	end
	if v_u_26 and v_u_26.Parent then
		v_u_26:PivotTo(v_u_38 * CFrame.Angles(-0.2617993877991494, 0, 0))
	end
	return v_u_26, v40
end
local function v_u_51(p42)
	-- upvalues: (copy) v_u_5, (copy) v_u_13, (copy) v_u_15, (copy) v_u_4, (copy) v_u_7
	local v43 = script:FindFirstChild("CollectFX")
	if v43 then
		local v44 = Instance.new("Attachment")
		v44.WorldPosition = p42
		v44.Parent = workspace.Terrain
		local v45 = v43:Clone()
		v45.Parent = v44
		for _, v46 in v45:GetDescendants() do
			if v46:IsA("ParticleEmitter") then
				v46:Emit(math.random(8, 10))
			end
		end
		v_u_5:AddItem(v44, 3)
	end
	v_u_13:ScreenShake("Normal", { "Vector" }, 2, 0.25, 0.6)
	local v47 = v_u_15.Character
	if v47 then
		local v48 = Instance.new("Highlight")
		v48.FillColor = Color3.fromRGB(160, 210, 255)
		v48.FillTransparency = 0.4
		v48.OutlineColor = Color3.fromRGB(180, 225, 255)
		v48.OutlineTransparency = 0.3
		v48.Parent = v47
		v_u_4:Create(v48, TweenInfo.new(0.5, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
			["FillTransparency"] = 1,
			["OutlineTransparency"] = 1
		}):Play()
		v_u_5:AddItem(v48, 0.6)
	end
	local v49 = script:FindFirstChild("CollectSFX")
	if v49 then
		local v50 = v49:Clone()
		v50.Parent = v_u_7
		v50.PlayOnRemove = true
		v50:Destroy()
	end
end
local function v_u_56(p52)
	-- upvalues: (copy) v_u_5
	local v53 = script:FindFirstChild("OtherPopSFX")
	if v53 then
		local v54 = Instance.new("Part")
		v54.Anchored = true
		v54.CanCollide = false
		v54.CanQuery = false
		v54.CanTouch = false
		v54.Transparency = 1
		v54.Size = Vector3.new(0.1, 0.1, 0.1)
		v54.Position = p52
		v54.Parent = workspace
		local v55 = v53:Clone()
		v55.Parent = v54
		v55:Play()
		v_u_5:AddItem(v54, 2)
	end
end
local function v_u_67(p57)
	-- upvalues: (copy) v_u_6, (copy) v_u_4, (copy) v_u_12, (copy) v_u_11
	local v58 = Instance.new("ColorCorrectionEffect")
	v58.Name = "BubbleBath_CC"
	v58.Brightness = 0
	v58.Contrast = 0
	v58.Saturation = 0
	v58.TintColor = Color3.fromRGB(255, 255, 255)
	v58.Parent = v_u_6
	p57:Add(v58)
	v_u_4:Create(v58, TweenInfo.new(3, Enum.EasingStyle.Sine), {
		["Brightness"] = 0.08,
		["Contrast"] = 0.12,
		["Saturation"] = 0.35,
		["TintColor"] = Color3.fromRGB(222, 238, 255)
	}):Play()
	local v59 = Instance.new("BloomEffect")
	v59.Name = "BubbleBath_Bloom"
	v59.Intensity = 0
	v59.Size = 56
	v59.Threshold = 2
	v59.Parent = v_u_6
	p57:Add(v59)
	v_u_4:Create(v59, TweenInfo.new(3, Enum.EasingStyle.Sine), {
		["Intensity"] = 0.13,
		["Threshold"] = 0.3
	}):Play()
	local v_u_60 = v_u_6:FindFirstChildOfClass("Atmosphere")
	if v_u_60 then
		local v_u_61 = v_u_60.Haze
		local v_u_62 = v_u_60.Density
		local v_u_63 = v_u_60.Color
		local v_u_64 = v_u_60.Decay
		v_u_4:Create(v_u_60, TweenInfo.new(3, Enum.EasingStyle.Sine), {
			["Haze"] = 1.2,
			["Density"] = 0.35,
			["Color"] = Color3.fromRGB(215, 230, 255),
			["Decay"] = Color3.fromRGB(190, 215, 255)
		}):Play()
		p57:Add(function()
			-- upvalues: (ref) v_u_4, (copy) v_u_60, (copy) v_u_61, (copy) v_u_62, (copy) v_u_63, (copy) v_u_64
			local v65 = {
				["Haze"] = v_u_61,
				["Density"] = v_u_62,
				["Color"] = v_u_63,
				["Decay"] = v_u_64
			}
			v_u_4:Create(v_u_60, TweenInfo.new(3, Enum.EasingStyle.Sine), v65):Play()
		end)
	end
	local v66 = v_u_12.Weather
	if v66 then
		v66 = v_u_12.Weather.BubbleBath
	end
	if v66 then
		v66 = v66.Music
	end
	if v66 and v66 ~= "" then
		v_u_11.Start("BubbleBath", {
			["soundId"] = v66,
			["priority"] = 7,
			["volume"] = 0.55,
			["fadeIn"] = 2,
			["fadeOut"] = 2
		})
		p57:Add(function()
			-- upvalues: (ref) v_u_11
			v_u_11.Stop("BubbleBath")
		end)
	end
end
local function v_u_111()
	-- upvalues: (ref) v_u_17, (copy) v_u_10, (copy) v_u_15, (copy) v_u_67, (copy) v_u_16, (copy) v_u_23, (copy) v_u_41, (copy) v_u_9, (copy) v_u_4, (copy) v_u_56, (copy) v_u_3, (copy) v_u_51, (copy) v_u_14
	v_u_17 = true
	local v68 = v_u_10.new()
	local v_u_69 = nil
	local function v70()
		-- upvalues: (ref) v_u_15, (ref) v_u_69
		v_u_69 = (v_u_15.Character or v_u_15.CharacterAdded:Wait()):WaitForChild("HumanoidRootPart", 5)
	end
	v_u_69 = (v_u_15.Character or v_u_15.CharacterAdded:Wait()):WaitForChild("HumanoidRootPart", 5)
	v68:Add(v_u_15.CharacterAdded:Connect(v70))
	v_u_67(v68)
	local v_u_71 = v68:Add(Instance.new("Folder"))
	v_u_71.Name = "BubbleBathGuis"
	v_u_71.Parent = v_u_16
	local v_u_72 = {}
	local v_u_73 = {}
	local v_u_74 = script:FindFirstChild("BubbleItem")
	assert(v_u_74, "[BubbleBath] client is missing script.BubbleItem template")
	local function v_u_85(p75)
		-- upvalues: (copy) v_u_74, (copy) v_u_71, (ref) v_u_23, (ref) v_u_41
		local v76 = v_u_74:Clone()
		v76.Name = "Bubble_" .. p75.UUID
		local v77 = v76:FindFirstChild("Root")
		local v78 = v76:FindFirstChild("Hitbox")
		if not v77 then
			warn("[BubbleBath] BubbleItem template missing Root part")
			v76:Destroy()
			return nil
		end
		if v76.PrimaryPart then
			v76:PivotTo(CFrame.new(p75.StartPosition))
		else
			v77.CFrame = CFrame.new(p75.StartPosition)
			if v78 then
				v78.CFrame = CFrame.new(p75.StartPosition)
			end
		end
		v76.Parent = workspace.WeatherVisuals
		local v79 = v77:FindFirstChildOfClass("BillboardGui")
		local v80
		if v79 then
			v80 = v79:FindFirstChildOfClass("ViewportFrame")
		else
			v80 = v79
		end
		local v81
		if v79 then
			v81 = v79.Size
		else
			v81 = v79
		end
		if v79 then
			v79.LightInfluence = 0
			v79.Brightness = 1.4
			v79.Adornee = v77
			v79.Parent = v_u_71
		end
		local v82 = v_u_23(p75.ItemName)
		local v83
		if v80 and v82 then
			local v84
			v84, v83 = v_u_41(v80, v82)
		else
			v83 = nil
		end
		return {
			["UUID"] = p75.UUID,
			["StartTime"] = p75.StartTime,
			["StartPosition"] = p75.StartPosition,
			["Duration"] = p75.Duration,
			["ItemName"] = p75.ItemName,
			["Model"] = v76,
			["Root"] = v77,
			["Hitbox"] = v78,
			["Billboard"] = v79,
			["Viewport"] = v80,
			["OriginalBillboardSize"] = v81,
			["SetRotation"] = v83,
			["Rotation"] = 0
		}
	end
	v68:Add(v_u_9.OnClientEvent:Connect(function(p86, p87)
		-- upvalues: (copy) v_u_85, (copy) v_u_72, (ref) v_u_15, (copy) v_u_73, (ref) v_u_4, (ref) v_u_56
		if p86 == "Spawn" then
			local v88 = v_u_85(p87)
			if v88 then
				v_u_72[p87.UUID] = v88
				return
			end
		elseif p86 == "Collected" then
			local v89 = p87.UUID
			local v_u_90 = v_u_72[v89]
			if not v_u_90 then
				return
			end
			v_u_72[v89] = nil
			if p87.CollectorId == v_u_15.UserId then
				v_u_90.FlyStartTime = workspace:GetServerTimeNow()
				v_u_90.FlyStartPos = v_u_90.Root and v_u_90.Root.Position or v_u_90.StartPosition
				v_u_73[v89] = v_u_90
				if v_u_90.Billboard then
					v_u_4:Create(v_u_90.Billboard, TweenInfo.new(0.5, Enum.EasingStyle.Quad, Enum.EasingDirection.In), {
						["Size"] = UDim2.fromOffset(0, 0)
					}):Play()
				end
				if v_u_90.Root then
					v_u_4:Create(v_u_90.Root, TweenInfo.new(0.5, Enum.EasingStyle.Quad), {
						["Size"] = v_u_90.Root.Size * 0.4
					}):Play()
					return
				end
			else
				v_u_56(v_u_90.Root and v_u_90.Root.Position or v_u_90.StartPosition)
				if v_u_90.Billboard then
					v_u_4:Create(v_u_90.Billboard, TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.In), {
						["Size"] = UDim2.fromOffset(0, 0)
					}):Play()
				end
				if v_u_90.Root then
					v_u_4:Create(v_u_90.Root, TweenInfo.new(0.25), {
						["Size"] = v_u_90.Root.Size * 1.3
					}):Play()
				end
				task.delay(0.3, function()
					-- upvalues: (copy) v_u_90
					local v91 = v_u_90
					if v91.Billboard and v91.Billboard.Parent then
						v91.Billboard:Destroy()
					end
					if v91.Model and v91.Model.Parent then
						v91.Model:Destroy()
					end
				end)
			end
		end
	end))
	v68:Add(v_u_3.RenderStepped:Connect(function(_)
		-- upvalues: (copy) v_u_72, (ref) v_u_69, (copy) v_u_73, (ref) v_u_4, (ref) v_u_51, (ref) v_u_14
		local v92 = workspace:GetServerTimeNow()
		for v93, v94 in v_u_72 do
			local v95 = (v92 - v94.StartTime) / v94.Duration
			local v96 = math.clamp(v95, 0, 1)
			local v97 = v94.StartPosition
			local v98 = v96 * 12
			local v99 = v97 + Vector3.new(0, v98, 0)
			if v94.Model and v94.Model.PrimaryPart then
				v94.Model:PivotTo(CFrame.new(v99))
			elseif v94.Root then
				v94.Root.CFrame = CFrame.new(v99)
				if v94.Hitbox then
					v94.Hitbox.CFrame = CFrame.new(v99)
				end
			end
			if v94.SetRotation then
				v94.Rotation = v94.Rotation + 0.017453292519943295
				v94.SetRotation(v94.Rotation)
			end
			if v96 >= 0.85 and (v94.Billboard and v94.OriginalBillboardSize) then
				local v100 = (v96 - 0.85) / 0.15000000000000002
				v94.Billboard.Size = v94.OriginalBillboardSize:Lerp(UDim2.fromOffset(0, 0), v100)
			end
			if v96 >= 1 then
				v_u_72[v93] = nil
				if v94.Billboard and v94.Billboard.Parent then
					v94.Billboard:Destroy()
				end
				if v94.Model and v94.Model.Parent then
					v94.Model:Destroy()
				end
			end
		end
		if v_u_69 and v_u_69.Parent then
			for v101, v102 in v_u_73 do
				local v103 = (v92 - v102.FlyStartTime) / 0.5
				local v104 = math.clamp(v103, 0, 1)
				local v105 = v_u_4:GetValue(v104, Enum.EasingStyle.Quad, Enum.EasingDirection.In)
				local v106 = v102.FlyStartPos:Lerp(v_u_69.Position, v105)
				if v102.Model and v102.Model.PrimaryPart then
					v102.Model:PivotTo(CFrame.new(v106))
				elseif v102.Root then
					v102.Root.CFrame = CFrame.new(v106)
				end
				if v102.SetRotation then
					v102.Rotation = v102.Rotation + 0.027925268031909273
					v102.SetRotation(v102.Rotation)
				end
				if v104 >= 1 then
					local v107 = v102.Root and v102.Root.Position or v102.FlyStartPos
					local v108 = v102.ItemName
					v_u_73[v101] = nil
					if v102.Billboard and v102.Billboard.Parent then
						v102.Billboard:Destroy()
					end
					if v102.Model and v102.Model.Parent then
						v102.Model:Destroy()
					end
					v_u_51(v107)
					v_u_14:CreateNotification("You popped a " .. v108 .. "!")
				end
			end
		end
	end))
	repeat
		task.wait()
	until v_u_17 == false
	for _, v109 in v_u_72 do
		if v109.Billboard and v109.Billboard.Parent then
			v109.Billboard:Destroy()
		end
		if v109.Model and v109.Model.Parent then
			v109.Model:Destroy()
		end
	end
	for _, v110 in v_u_73 do
		if v110.Billboard and v110.Billboard.Parent then
			v110.Billboard:Destroy()
		end
		if v110.Model and v110.Model.Parent then
			v110.Model:Destroy()
		end
	end
	table.clear(v_u_72)
	table.clear(v_u_73)
	v68:Destroy()
end
workspace:GetAttributeChangedSignal("BubbleBath"):Connect(function()
	-- upvalues: (ref) v_u_17, (copy) v_u_111
	if workspace:GetAttribute("BubbleBath") then
		if not v_u_17 then
			v_u_111()
			return
		end
	else
		v_u_17 = false
	end
end)
if workspace:GetAttribute("BubbleBath") then
	task.defer(v_u_111)
end
return v1