local v1 = game:GetService("ReplicatedStorage")
local v_u_2 = require(v1.Modules.SkinService)
local v3 = require(game.ReplicatedStorage.Data.PetRegistry)
local v_u_4 = require(v1.Modules.SelectiveAssetReplication)
local v_u_5 = require(v1.Modules.SoundPlayer)
local v_u_6 = require(v1.Data.SoundData)
local v_u_7 = v3.PetList
local v_u_8 = {
	["Black Bunny"] = "rbxassetid://137209605666415",
	["Bunny"] = "rbxassetid://104391359688443",
	["Caterpillar"] = "rbxassetid://74906642952986",
	["Deer"] = "rbxassetid://113898066898530",
	["Cow"] = "rbxassetid://80626295210133",
	["Giant Ant"] = "rbxassetid://110042917722868",
	["Cat"] = "rbxassetid://74848025639589",
	["Dog"] = "rbxassetid://88539564087126",
	["Golden Lab"] = "rbxassetid://125173635572785",
	["Monkey"] = "rbxassetid://83148221430148",
	["Pig"] = "rbxassetid://110554034996387",
	["Praying Mantis"] = "rbxassetid://80710971415313",
	["Polar Bear"] = "rbxassetid://97880140636687",
	["Snail"] = "rbxassetid://100791898582300",
	["Silver Monkey"] = "rbxassetid://106847532475922",
	["Purple Dragonfly"] = "rbxassetid://96794025089185",
	["Turtle"] = "rbxassetid://93929754369579",
	["Orange Tabby"] = "rbxassetid://96707297910956",
	["Poof"] = "rbxassetid://80584356758887"
}
return function(p9, p_u_10, p_u_11)
	-- upvalues: (copy) v_u_5, (copy) v_u_6, (copy) v_u_7, (copy) v_u_4, (copy) v_u_2, (copy) v_u_8
	local v_u_12 = script.EggExplode:Clone()
	v_u_12:PivotTo(p9:GetPivot())
	local v13 = v_u_12.Core
	v13.Parent = workspace.Visuals
	game.Debris:AddItem(v13, 60)
	v_u_12.Parent = game.ReplicatedStorage
	v_u_5:PlaySound(v_u_6.General.PetEggRenderer.RareSFX, nil, nil, v13)
	task.wait(0.4)
	local v_u_14 = p9:GetPivot()
	local v_u_15 = p9:GetExtentsSize()
	local v16 = 0
	while v16 < 0.8 do
		v16 = v16 + game:GetService("RunService").Heartbeat:Wait()
		local v17 = 1 - v16 / 0.8
		local v18 = tick() * 90
		local v19 = v17 * math.sin(v18) * 7
		p9:PivotTo(v_u_14 * CFrame.Angles(0, 0, (math.rad(v19))))
	end
	task.wait(0.5)
	local v20 = 0
	while v20 < 0.8 do
		v20 = v20 + game:GetService("RunService").Heartbeat:Wait()
		local v21 = 1 - v20 / 0.8
		local v22 = tick() * 90
		local v23 = v21 * math.sin(v22) * 9
		p9:PivotTo(v_u_14 * CFrame.Angles(0, 0, (math.rad(v23))))
	end
	task.wait(0.5)
	local v24 = 0
	while v24 < 0.8 do
		v24 = v24 + game:GetService("RunService").Heartbeat:Wait()
		local v25 = 1 - v24 / 0.8
		local v26 = tick() * 90
		local v27 = v25 * math.sin(v26) * 13
		p9:PivotTo(v_u_14 * CFrame.Angles(0, 0, (math.rad(v27))))
	end
	local v28 = p9:GetAttribute("EggColor")
	local v29 = p9:GetAttribute("EggMaterial")
	local v30 = p9:GetAttribute("EggTransparency")
	local v31 = p9:GetAttribute("EggMaterialVariant")
	p9:Destroy()
	v_u_12.Parent = workspace.Visuals
	for _, v32 in v_u_12:GetDescendants() do
		if v32 ~= v13 and (v32.Name ~= "RootPart" and v32:IsA("BasePart")) then
			v32.Anchored = false
		end
	end
	local v33 = p_u_10:find("Egg/")
	local v_u_34
	if p_u_10 and (p_u_10 ~= "" and not v33) then
		local v_u_35 = v_u_7[p_u_10]
		v_u_34 = v_u_4:GetAssetAsync("PetAssets", p_u_10):Clone()
		local v36 = v_u_35 and v_u_35.Variant
		if v36 then
			v_u_2:SetSkin(v_u_34, v36)
		end
		if v_u_34.PrimaryPart then
			v_u_34.PrimaryPart.Anchored = true
		end
		local v37 = script.Highlight:Clone()
		v37.Parent = v_u_34
		v37.Adornee = v_u_34
		v_u_34.Parent = workspace.Visuals
		local v_u_38 = 0
		task.spawn(function()
			-- upvalues: (ref) v_u_38, (ref) v_u_34, (copy) p_u_11, (copy) v_u_35, (copy) v_u_14, (copy) v_u_15
			while v_u_38 < 1 do
				v_u_38 = v_u_38 + game:GetService("RunService").Heartbeat:Wait()
				local v39 = game.TweenService:GetValue(v_u_38 / 1, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut)
				v_u_34:ScaleTo(1 + (p_u_11 - 1) * v39)
				local v40 = v_u_35 and v_u_35.WeldOffset or CFrame.identity
				v_u_34:PivotTo(v_u_14 * CFrame.new(0, -v_u_15.Y / 2, 0) * CFrame.new(0, v_u_34:GetExtentsSize().Y / 2, 0) * v40)
			end
		end)
		local v41 = v_u_35 and v_u_35.Animations.Idle
		if v41 then
			v_u_34.AnimationController:LoadAnimation(v41):Play()
		end
		for _, v42 in v_u_34:GetDescendants() do
			if v42:IsA("BasePart") then
				v42.CanCollide = false
				v42.CanQuery = false
			end
		end
		game.TweenService:Create(v37, TweenInfo.new(0.5), {
			["FillTransparency"] = 1
		}):Play()
		task.delay(0.5, function()
			-- upvalues: (copy) p_u_10, (ref) v_u_8, (ref) v_u_5
			local v43 = v_u_8[p_u_10]
			if v43 then
				local v_u_44 = v_u_5:PlaySound(v43, nil, nil, workspace)
				v_u_44.Ended:Once(function()
					-- upvalues: (copy) v_u_44
					v_u_44:Destroy()
				end)
			end
		end)
	else
		v_u_34 = nil
	end
	for _, v45 in v_u_12:GetChildren() do
		if not v45:IsA("BasePart") then
			local v46, v47 = v45:GetBoundingBox()
			local v48 = Instance.new("Part")
			v48.Transparency = 1
			v48.CanCollide = false
			v48.CanQuery = false
			v48.CanTouch = false
			v48.CFrame = v46
			v48.Size = v47
			local v49 = Instance.new("WeldConstraint")
			v49.Part0 = v48
			v49.Part1 = v45.PrimaryPart
			v49.Parent = v48
			v48.Parent = v45
			local v50 = Instance.new("Attachment")
			local v51 = Instance.new("Attachment")
			v50.Parent = v48
			v51.Parent = v48
			local v52 = v47.Y / 2
			v50.Position = Vector3.new(0, v52, 0)
			local v53 = -v47.Y / 2
			v51.Position = Vector3.new(0, v53, 0)
			local v54 = script.Trail:Clone()
			v54.Attachment0 = v50
			v54.Attachment1 = v51
			v54.Color = ColorSequence.new(v28)
			v54.Parent = v50
			v54.Enabled = true
		end
	end
	for _, v55 in v_u_12:GetDescendants() do
		if v55 ~= v13 and (v55.Name ~= "RootPart" and v55:IsA("BasePart")) then
			local v56 = v55.Position
			local v57 = CFrame.new(v13.Position, v56).LookVector * 16
			v55.Color = v28 or v55.Color
			v55.Material = v29 or v55.Material
			v55.MaterialVariant = v31 or v55.MaterialVariant
			v55.Transparency = v30 or v55.Transparency
			v55:ApplyImpulse(v57 * v55.AssemblyMass)
		end
	end
	task.delay(3, function()
		-- upvalues: (copy) v_u_12
		for _, v58 in v_u_12:GetChildren() do
			for _, v59 in v58:GetDescendants() do
				if v59:IsA("BasePart") then
					game.TweenService:Create(v59, TweenInfo.new(1), {
						["Transparency"] = 1
					}):Play()
				end
			end
		end
		game.Debris:AddItem(v_u_12, 1)
	end)
	for _, v60 in v13.Attachment:GetDescendants() do
		if v60:IsA("ParticleEmitter") then
			if v60.Name == "ColorMe" then
				v60.Color = ColorSequence.new(v28)
			end
			v60:Emit(v60:GetAttribute("EmitCount"))
		end
	end
	for _, v61 in v13.Rare:GetDescendants() do
		if v61:IsA("ParticleEmitter") then
			v61.Color = ColorSequence.new(v28)
			v61:Emit(v61:GetAttribute("EmitCount"))
		end
	end
	task.wait(3)
	local v62 = game.ReplicatedStorage.Assets.EggPoof:Clone()
	v62.CFrame = v_u_14
	v62.Parent = workspace.Visuals
	local v63 = v_u_8.Poof
	if v63 then
		local v_u_64 = v_u_5:PlaySound(v63, nil, nil, workspace)
		v_u_64.Ended:Once(function()
			-- upvalues: (copy) v_u_64
			v_u_64:Destroy()
		end)
	end
	for _, v65 in v62:GetChildren() do
		v65:Emit(v65:GetAttribute("EmitCount"))
	end
	game.Debris:AddItem(v62, 6)
	task.delay(0.2, function()
		-- upvalues: (ref) v_u_34
		if v_u_34 then
			v_u_34:Destroy()
		end
	end)
end