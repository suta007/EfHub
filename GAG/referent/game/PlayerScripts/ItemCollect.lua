local v1 = game:GetService("ReplicatedStorage")
local v_u_2 = require(game.ReplicatedStorage.Data.GearData)
local v_u_3 = require(v1.Data.SeedData)
local v_u_4 = require(v1.Data.FoodRecipeData)
task.spawn(function()
	while true do
		game:GetService("RunService").RenderStepped:Wait()
		local v5 = {}
		local v6 = {}
		for _, v7 in game.CollectionService:GetTagged("CollectionVisual") do
			if v7.Value.Value == nil or not v7.Value.Value:IsDescendantOf(workspace) then
				v7:Destroy()
			else
				local v8 = tick() * 3.141592653589793
				local v9 = (math.sin(v8) + 1) / 2
				local v10 = CFrame.new(v7.Value.Value.CFrame.Position) * CFrame.new(0, v9 * 1 + 0.5, 0)
				table.insert(v5, v10)
				table.insert(v6, v7)
			end
		end
		workspace:BulkMoveTo(v6, v5, Enum.BulkMoveMode.FireCFrameChanged)
	end
end)
local function v16(p11)
	-- upvalues: (copy) v_u_3, (copy) v_u_2
	local v12 = p11:GetAttribute("RewardType")
	if p11:GetAttribute("Owner") == nil or p11:GetAttribute("Owner") == game.Players.LocalPlayer.Name then
		local v_u_13 = game.ReplicatedStorage.RewardDropVisual:Clone()
		v_u_13.Value.Value = p11
		for _, v14 in v_u_13.BillboardGui:GetChildren() do
			v14.Visible = false
		end
		if v12 == "Coins" then
			if p11:GetAttribute("SheckleRain") then
				v_u_13.Trail.Color = ColorSequence.new(Color3.fromRGB(255, 204, 0))
			end
			v_u_13.BillboardGui.Coins.Visible = true
		elseif v12 == "Seeds" then
			if v_u_3[p11:GetAttribute("KeySeed")] then
				v_u_13.BillboardGui.Seeds.SeedColour.Image = v_u_3[p11:GetAttribute("KeySeed")].FruitIcon
			end
			v_u_13.BillboardGui.Seeds.Visible = true
		elseif v12 == "SeedPack" then
			task.spawn(function()
				-- upvalues: (copy) v_u_13
				while v_u_13.Value.Value and v_u_13.Value.Value:IsDescendantOf(workspace) do
					local v15 = tick() % 2 / 2
					v_u_13.BillboardGui.Seeds.SeedColour.ImageColor3 = Color3.fromHSV(v15, 1, 1)
					task.wait()
				end
			end)
			v_u_13.BillboardGui.Seeds.Visible = true
		elseif v12 == "Items" then
			if v_u_2[p11:GetAttribute("GearName")] then
				v_u_13.BillboardGui.Gear.Image = v_u_2[p11:GetAttribute("GearName")].Asset
			end
			v_u_13.BillboardGui.Gear.Visible = true
		end
		v_u_13.CFrame = CFrame.new(p11.CFrame.p) * CFrame.new(0, 0.5, 0)
		v_u_13.Parent = workspace
		v_u_13:AddTag("CollectionVisual")
	end
end
for _, v17 in game.CollectionService:GetTagged("Collectable") do
	v16(v17)
end
game.CollectionService:GetInstanceAddedSignal("Collectable"):Connect(v16)
local function v_u_23(p18)
	-- upvalues: (copy) v_u_3, (copy) v_u_2, (copy) v_u_4
	local v19 = p18.RewardType
	local v_u_20 = game.ReplicatedStorage.RewardDropVisual:Clone()
	for _, v21 in v_u_20.BillboardGui:GetChildren() do
		v21.Visible = false
	end
	if v19 == "Coins" then
		v_u_20.BillboardGui.Coins.Visible = true
	elseif v19 == "Seeds" then
		if v_u_3[p18.KeySeed] then
			v_u_20.BillboardGui.Seeds.SeedColour.Image = v_u_3[p18.KeySeed].FruitIcon
		end
		v_u_20.BillboardGui.Seeds.Visible = true
	elseif v19 == "SeedPack" then
		task.spawn(function()
			-- upvalues: (copy) v_u_20
			while v_u_20 and v_u_20:IsDescendantOf(workspace) do
				local v22 = tick() % 2 / 2
				v_u_20.BillboardGui.Seeds.SeedColour.ImageColor3 = Color3.fromHSV(v22, 1, 1)
				task.wait()
			end
		end)
		v_u_20.BillboardGui.Seeds.Visible = true
	elseif v19 == "Items" then
		if v_u_2[p18.GearName] then
			v_u_20.BillboardGui.Gear.Image = v_u_2[p18.GearName].Asset
		end
		v_u_20.BillboardGui.Gear.Visible = true
	elseif v19 == "Food" then
		if v_u_4.Recipes[p18.GearName] then
			v_u_20.BillboardGui.Food.Image = v_u_4.Recipes[p18.GearName].ImageId
		end
		v_u_20.BillboardGui.Food.Visible = true
	end
	v_u_20.BillboardGui.Enabled = false
	return v_u_20
end
local v_u_24 = require(game.ReplicatedStorage.Code.Bezier)
local function v36(p25, p26)
	-- upvalues: (copy) v_u_23, (copy) v_u_24
	local v27 = v_u_23(p25)
	v27.CFrame = p26
	v27.Parent = workspace
	local v28 = 0
	while v28 < 0.5 do
		v28 = v28 + game:GetService("RunService").Heartbeat:Wait()
		local v29 = game.Players.LocalPlayer.Character.PrimaryPart.Position
		local v30 = (p26.p + v29) / 2
		local v31 = p26.p.Y + 7
		local v32 = v30 + Vector3.new(0, v31, 0)
		local v33 = v_u_24.new(p26.Position, v32, v29):Get((game.TweenService:GetValue(v28 / 0.5, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)))
		v27.CFrame = CFrame.new(v33)
	end
	v27:Destroy()
	local v34 = game.Workspace.Terrain.PopEffect:Clone()
	v34.Parent = workspace.Terrain
	v34.CFrame = CFrame.new(game.Players.LocalPlayer.Character.PrimaryPart.Position)
	for _, v35 in v34:GetChildren() do
		v35:Emit(1)
	end
	game.Debris:AddItem(v34, 2)
	game.SoundService:PlayLocalSound(game.SoundService.Rainbow)
end
game.ReplicatedStorage.GameEvents.FireDrop.OnClientEvent:Connect(v36)
game.ReplicatedStorage.GameEvents.FireDropBindable.Event:Connect(v36)
game.ReplicatedStorage.GameEvents.FireDropTarget.OnClientEvent:Connect(function(p37, p38, p39, p40)
	-- upvalues: (copy) v_u_23, (copy) v_u_24
	local v41 = v_u_23(p37)
	if p40 then
		v41.BillboardGui.Enabled = true
	end
	v41.CFrame = p38
	v41.Parent = workspace
	local v42 = 0
	while v42 < 0.5 do
		v42 = v42 + game:GetService("RunService").Heartbeat:Wait()
		local v43 = p39.Position
		local v44 = (p38.p + v43) / 2
		local v45 = p38.p.Y + 7
		local v46 = v44 + Vector3.new(0, v45, 0)
		local v47 = v_u_24.new(p38.Position, v46, v43):Get((game.TweenService:GetValue(v42 / 0.5, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)))
		v41.CFrame = CFrame.new(v47)
	end
	v41:Destroy()
	local v48 = game.Workspace.Terrain.PopEffect:Clone()
	v48.Parent = workspace.Terrain
	v48.CFrame = CFrame.new(p39.Position)
	for _, v49 in v48:GetChildren() do
		v49:Emit(1)
	end
	game.Debris:AddItem(v48, 2)
	if p37.DropLerpPercentage then
		local v50 = {
			{
				["Min"] = 80,
				["Max"] = 120
			},
			{
				["Min"] = 85,
				["Max"] = 125
			},
			{
				["Min"] = 90,
				["Max"] = 130
			}
		}
		local v51 = v50[math.random(1, #v50)]
		local v52 = game.SoundService.Rainbow
		local v53 = v51.Min
		local v54 = v51.Max
		local v55 = p37.DropLerpPercentage
		v52.PlaybackSpeed = math.lerp(v53, v54, v55) / 100
		game.SoundService:PlayLocalSound(game.SoundService.Rainbow)
		game.SoundService.Rainbow.Ended:Once(function()
			game.SoundService.Rainbow.PlaybackSpeed = 1
		end)
	else
		game.SoundService.Rainbow.PlaybackSpeed = math.random(90, 110) / 100
		game.SoundService:PlayLocalSound(game.SoundService.Rainbow)
		game.SoundService.Rainbow.Ended:Once(function()
			game.SoundService.Rainbow.PlaybackSpeed = 1
		end)
	end
end)