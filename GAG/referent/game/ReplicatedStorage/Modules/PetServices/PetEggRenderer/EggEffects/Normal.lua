local v1 = game:GetService("ReplicatedStorage")
local v2 = require(game.ReplicatedStorage.Data.PetRegistry)
local v_u_3 = require(v1.Modules.SkinService)
local v_u_4 = require(v1.Modules.SelectiveAssetReplication)
local v_u_5 = require(v1.Modules.SoundPlayer)
local v_u_6 = require(v1.Data.SoundData)
local v_u_7 = v2.PetList
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
	-- upvalues: (copy) v_u_5, (copy) v_u_6, (copy) v_u_7, (copy) v_u_4, (copy) v_u_3, (copy) v_u_8
	local v_u_12 = script.EggExplode:Clone()
	v_u_12:PivotTo(p9:GetPivot())
	local v13 = v_u_12.Core
	v13.Parent = workspace.Visuals
	game.Debris:AddItem(v13, 60)
	v_u_12.Parent = game.ReplicatedStorage
	v_u_5:PlaySound(v_u_6.General.PetEggRenderer.NormalSFX, nil, nil, v13)
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
		local v36
		if v_u_35 then
			v36 = v_u_35.Variant
		else
			v36 = v_u_35
		end
		if v36 then
			v_u_3:SetSkin(v_u_34, v36)
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
	for _, v45 in v_u_12:GetDescendants() do
		if v45 ~= v13 and (v45.Name ~= "RootPart" and v45:IsA("BasePart")) then
			local v46 = v45.Position
			local v47 = CFrame.new(v13.Position, v46).LookVector * 8
			v45.Color = v28 or v45.Color
			v45.Material = v29 or v45.Material
			v45.MaterialVariant = v31 or v45.MaterialVariant
			v45.Transparency = v30 or v45.Transparency
			v45:ApplyImpulse(v47 * v45.AssemblyMass)
		end
	end
	task.delay(3, function()
		-- upvalues: (copy) v_u_12
		for _, v48 in v_u_12:GetChildren() do
			for _, v49 in v48:GetDescendants() do
				if v49:IsA("BasePart") then
					game.TweenService:Create(v49, TweenInfo.new(1), {
						["Transparency"] = 1
					}):Play()
				end
			end
		end
		game.Debris:AddItem(v_u_12, 1)
	end)
	for _, v50 in v13.Attachment:GetDescendants() do
		if v50:IsA("ParticleEmitter") then
			v50:Emit(v50:GetAttribute("EmitCount"))
		end
	end
	task.wait(3)
	local v51 = game.ReplicatedStorage.Assets.EggPoof:Clone()
	v51.CFrame = v_u_14
	v51.Parent = workspace.Visuals
	local v52 = v_u_8.Poof
	if v52 then
		local v_u_53 = v_u_5:PlaySound(v52, nil, nil, workspace)
		v_u_53.Ended:Once(function()
			-- upvalues: (copy) v_u_53
			v_u_53:Destroy()
		end)
	end
	for _, v54 in v51:GetChildren() do
		v54:Emit(v54:GetAttribute("EmitCount"))
	end
	game.Debris:AddItem(v51, 6)
	task.delay(0.2, function()
		-- upvalues: (ref) v_u_34
		if v_u_34 then
			v_u_34:Destroy()
		end
	end)
end