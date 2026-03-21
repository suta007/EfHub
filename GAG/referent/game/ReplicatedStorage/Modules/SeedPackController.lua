local v_u_1 = game:GetService("ReplicatedStorage")
local v_u_2 = game:GetService("TweenService")
local v_u_3 = game:GetService("SoundService")
local v_u_4 = game:GetService("RunService")
local v5 = game:GetService("Players")
local v_u_6 = require(v_u_1.Modules.WeightRandom)
local v_u_7 = require(v_u_1.Data.SeedPackData)
local v_u_8 = require(v_u_1.Item_Module)
local v_u_9 = require(v_u_1.Data.SeedData)
require(v_u_1.Modules.Notification)
local v_u_10 = require(v_u_1.Data.PetRegistry)
local v_u_11 = require(v_u_1.Data.PetRegistry.PetEggs)
local v_u_12 = require(v_u_1.Modules.FastTween)
local v_u_13 = require(v_u_1.Modules.Shake)
local v_u_14 = require(v_u_1.Data.GearData)
local v_u_15 = require(v_u_1.Modules.GiveServiceCommon)
local v_u_16 = require(v_u_1.Modules.ItemImageFinder)
local v_u_17 = require(v_u_1.Data.TradeBoothSkinRegistry)
local v_u_18 = require(v_u_1.Data.CosmeticRegistry.CosmeticList)
local v_u_19 = v5.LocalPlayer.PlayerGui:WaitForChild("RollCrate_UI")
local v_u_20 = v_u_19.Frame
local v_u_21 = v_u_20.Rolled
local v_u_22 = v_u_20.Section.Spinner
local v_u_23 = table.create(150)
local v_u_24 = false
local v25 = {}
local v_u_26 = false
local v_u_27 = false
local function v_u_32(p28, p29)
	-- upvalues: (copy) v_u_21, (copy) v_u_12
	if p28 then
		if p29 then
			v_u_21.ImageTransparency = 0
			v_u_21.Label.TextTransparency = 0
			v_u_21.Label.UIStroke.Transparency = 0
		else
			local v30 = TweenInfo.new(0.5, Enum.EasingStyle.Quint, Enum.EasingDirection.Out)
			v_u_21.ImageTransparency = 1
			v_u_21.Label.TextTransparency = 1
			v_u_21.Label.UIStroke.Transparency = 1
			v_u_12(v_u_21, v30, {
				["ImageTransparency"] = 0
			})
			v_u_12(v_u_21.Label, v30, {
				["TextTransparency"] = 0
			})
			v_u_12(v_u_21.Label.UIStroke, v30, {
				["Transparency"] = 0
			})
		end
	elseif p29 then
		v_u_21.ImageTransparency = 1
		v_u_21.Label.TextTransparency = 1
		v_u_21.Label.UIStroke.Transparency = 1
	else
		local v31 = TweenInfo.new(0.5, Enum.EasingStyle.Quint, Enum.EasingDirection.Out)
		v_u_21.ImageTransparency = 0
		v_u_21.Label.TextTransparency = 0
		v_u_21.Label.UIStroke.Transparency = 0
		v_u_12(v_u_21, v31, {
			["ImageTransparency"] = 1
		})
		v_u_12(v_u_21.Label, v31, {
			["TextTransparency"] = 1
		})
		v_u_12(v_u_21.Label.UIStroke, v31, {
			["Transparency"] = 1
		})
	end
end
local function v_u_90(p33)
	-- upvalues: (ref) v_u_27, (copy) v_u_19, (copy) v_u_20, (copy) v_u_12, (copy) v_u_7, (copy) v_u_21, (copy) v_u_6, (copy) v_u_23, (copy) v_u_9, (copy) v_u_8, (copy) v_u_10, (copy) v_u_17, (copy) v_u_18, (copy) v_u_14, (copy) v_u_15, (copy) v_u_16, (copy) v_u_11, (copy) v_u_3, (copy) v_u_22, (copy) v_u_2, (copy) v_u_13, (copy) v_u_4, (copy) v_u_32
	local v34 = v_u_27
	local v35 = false
	v_u_19.Enabled = true
	if v34 then
		v_u_20.Position = UDim2.fromScale(0.5, 0.5)
	else
		v_u_20.Position = UDim2.fromScale(0.5, 1.5)
		v_u_12(v_u_20, TweenInfo.new(0.5, Enum.EasingStyle.Quint, Enum.EasingDirection.Out), {
			["Position"] = UDim2.fromScale(0.5, 0.5)
		})
	end
	v_u_20.Visible = true
	local v36 = Random.new()
	local v37 = v_u_7.Packs[p33.seedPackType]
	local v38 = p33.seedPackType
	local v39 = string.find(v38, "Rainbow", 1, true) and "Rainbow" or (string.find(p33.seedPackType, "Night") and "Night" or "Normal")
	local v40 = v37.Items
	local v41 = v40[p33.resultIndex]
	local v42 = 140
	for _, v43 in v_u_20.Decorations:GetChildren() do
		v43.Visible = v43.Name == v39
	end
	for _, v44 in v_u_21.Decorations:GetChildren() do
		v44.Visible = v44.Name == v39
	end
	if v41.Type == "Pack" then
		local v45 = v41.RewardId
		v35 = (string.find(v45, "Rainbow", 1, true) or string.find(v41.RewardId, "Special", 1, true)) and true or v35
	end
	local v46 = nil
	for v47 = 1, 150 do
		local v48
		if v47 == v42 then
			v48 = v41
		else
			v48 = v_u_6.array(v40, v36)
		end
		if v48 then
			local v49 = v_u_23[v47]
			local v50 = nil
			local v51
			if v48.Type == "Pack" then
				local v52 = v48.RewardId
				v51 = string.find(v52, "Rainbow", 1, true) and "Custom_RainbowCrate" or v39
			else
				v51 = v39
			end
			for _, v53 in v49:GetChildren() do
				local v54 = v53.Name == v51
				v53.Visible = v54
				if v54 then
					v50 = v53
				end
			end
			if v50 then
				if v47 == v42 then
					v46 = v50
				end
				if (v48.Type == "Seed" or (v48.Type == "RainbowSeed" or v48.Type == "SilverSeed")) and v_u_9[v48.RewardId] then
					local v55 = v_u_9[v48.RewardId]
					local v56 = v_u_8.Return_Rarity_Data(v55.SeedRarity)
					if v56 then
						v50.Rarity.Text = v56[1]
						v50.Rarity.TextColor3 = v56[2]
					end
					v50.Vector.Visible = true
					v50.Vector.Image = v55.Asset
				elseif v48.Type == "Pack" then
					v50.Vector.Image = v48.Icon or ""
					v50.Vector.Visible = true
				elseif v48.Type == "Pet" then
					local v57 = v_u_10.PetList[v48.RewardId]
					local v58 = v_u_8.Return_Rarity_Data(v57.Rarity)
					if v58 then
						v50.Rarity.Text = v58[1]
						v50.Rarity.TextColor3 = v58[2]
					else
						v50.Rarity.Text = v57.Rarity
						v50.Rarity.TextColor3 = v_u_10.PetRarities[v57.Rarity].Color
					end
					v50.Vector.Image = v48.Icon or (v57.Icon or "")
					v50.Vector.Visible = true
				elseif v48.Type == "TradeBoothSkin" then
					local v59 = v_u_17[v48.RewardId]
					local v60 = v_u_8.Return_Rarity_Data(v59.Rarity)
					if v60 then
						v50.Rarity.Text = v60[1]
						v50.Rarity.TextColor3 = v60[2]
					end
					v50.Vector.Image = v48.Icon or (v59.Icon or "")
					v50.Vector.Visible = true
				elseif v48.Type == "Cosmetic" then
					local v61 = v_u_18[v48.RewardId]
					local v62 = v_u_8.Return_Rarity_Data(v61.Rarity)
					if v62 then
						v50.Rarity.Text = v62[1]
						v50.Rarity.TextColor3 = v62[2]
					end
					v50.Vector.Image = v48.Icon or (v61.Icon or "")
					v50.Vector.Visible = true
				elseif v48.Type == "Gear" then
					local v63 = v_u_14[v48.RewardId]
					local v64 = v_u_8.Return_Rarity_Data(v63.GearRarity)
					if v64 then
						v50.Rarity.Text = v64[1]
						v50.Rarity.TextColor3 = v64[2]
					else
						v50.Rarity.Text = v63.GearRarity
						v50.Rarity.TextColor3 = v_u_15:GetRarityColor({
							["Type"] = "Gear",
							["Value"] = v48.RewardId,
							["Quantity"] = 1
						})
					end
					v50.Vector.Image = v_u_16(v48.RewardId, v48.Type) or "rbxassetid://6937742258"
					v50.Vector.Visible = true
				elseif v48.Type == "Egg" then
					local v65 = v_u_11[v48.RewardId]
					print(v48.RewardId)
					local v66 = v_u_8.Return_Rarity_Data(v65.EggRarity)
					if v66 then
						v50.Rarity.Text = v66[1]
						v50.Rarity.TextColor3 = v66[2]
					else
						v50.Rarity.Text = v65.EggRarity
						v50.Rarity.TextColor3 = v_u_15:GetRarityColor({
							["Type"] = "Egg",
							["Value"] = v48.RewardId,
							["Quantity"] = 1
						})
					end
					v50.Vector.Image = v_u_16(v48.RewardId, v48.Type) or "rbxassetid://6937742258"
					v50.Vector.Visible = true
				elseif v48.Type == "Currency" then
					v50.Rarity.Text = ""
					v50.Vector.Image = v_u_16(v48.RewardId, v48.Type) or "rbxassetid://6937742258"
					v50.Vector.Visible = true
				else
					warn((("Seed data not found for %*"):format(v48.RewardId)))
				end
				v50.Label.Text = v_u_7:GetTextDisplayForItem(v48)
			end
		else
			v42 = v42 - 1
		end
	end
	local v_u_67 = Instance.new("NumberValue")
	v_u_67.Value = 5
	local v_u_68 = nil
	local v_u_69 = nil
	local function v_u_74()
		-- upvalues: (copy) v_u_67, (ref) v_u_68, (ref) v_u_69, (ref) v_u_3, (ref) v_u_27, (ref) v_u_22
		local v70 = v_u_67.Value
		local v71 = v70 // 1
		if v71 ~= v_u_68 then
			if v_u_68 and (not v_u_69 or os.clock() - v_u_69 > 0.05) then
				local v72 = v_u_3
				local v73
				if v_u_27 then
					v73 = v_u_3["Seed Pack"].RainbowTick
				else
					v73 = v_u_3["Seed Pack"].NormalTick
				end
				v72:PlayLocalSound(v73)
				v_u_69 = os.clock()
			end
			v_u_68 = v71
		end
		v_u_22.Position = UDim2.new(0.5, -v70 * v_u_22.AbsoluteSize.Y, 0.5, 0)
	end
	local v75 = v_u_22:GetPropertyChangedSignal("AbsoluteSize"):Connect(v_u_74)
	local v76 = v_u_67.Changed:Connect(v_u_74)
	task.spawn(v_u_74)
	local v_u_77 = v42 - 0.5 + (math.random() - 0.5) * 0.5
	local v78 = v_u_2:Create(v_u_67, TweenInfo.new(5, Enum.EasingStyle.Quint, Enum.EasingDirection.Out), {
		["Value"] = v_u_77
	})
	v78:Play()
	local v_u_79 = false
	local v_u_80 = coroutine.running()
	local function v81()
		-- upvalues: (ref) v_u_79, (copy) v_u_80
		if not v_u_79 then
			v_u_79 = true
			if coroutine.status(v_u_80) == "suspended" then
				task.spawn(v_u_80)
			end
		end
	end
	local v82 = v_u_20.Skip.Activated:Once(v81)
	local v83 = v78.Completed:Once(v81)
	if not v_u_79 then
		coroutine.yield()
	end
	v82:Disconnect()
	v83:Disconnect()
	v78:Cancel()
	v78:Destroy()
	v76:Disconnect()
	v75:Disconnect()
	task.defer(function()
		-- upvalues: (copy) v_u_67, (copy) v_u_77, (copy) v_u_74
		v_u_67.Value = v_u_77
		v_u_74()
		v_u_67:Destroy()
	end)
	if v35 and v46 then
		v_u_3["Seed Pack"].RainbowReward:Play()
		local v84 = v_u_12(v46.Vector, TweenInfo.new(0.1, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut, -1, true), {
			["ImageColor3"] = Color3.new(1, 1, 1)
		})
		local v85 = v_u_12(v46, TweenInfo.new(0.1, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut, -1, true), {
			["ImageColor3"] = Color3.new(1, 1, 1)
		})
		task.wait(0.3)
		local v_u_86 = v_u_13.new()
		v_u_86.FadeInTime = 0.5
		v_u_86.FadeOutTime = 1.5
		v_u_86.Frequency = 0.08
		v_u_86.Amplitude = 15
		v_u_86.Sustain = true
		v_u_86.PositionInfluence = Vector3.new(1, 1, 0)
		v_u_86.RotationInfluence = Vector3.new(0, 0, 0)
		local v_u_87 = nil
		v_u_87 = v_u_4.PostSimulation:Connect(function()
			-- upvalues: (copy) v_u_86, (ref) v_u_20, (ref) v_u_87
			local v88, _, v89 = v_u_86:Update()
			v_u_20.Position = UDim2.fromScale(0.5, 0.5) + UDim2.fromOffset(v88.X, v88.Y)
			if v89 then
				v_u_87:Disconnect()
			end
		end)
		task.wait(1.2)
		v_u_19.Fade.BackgroundTransparency = 0
		v_u_12(v_u_19.Fade, TweenInfo.new(1.5, Enum.EasingStyle.Sine, Enum.EasingDirection.Out, 0, false, 0.2), {
			["BackgroundTransparency"] = 1
		})
		v84:Cancel()
		v85:Cancel()
		task.delay(0.3, function()
			-- upvalues: (copy) v_u_86
			v_u_86:StopSustain()
		end)
	else
		v_u_3["Seed Pack"].Reward:Play()
		v_u_21.Label.Text = ("x1 %*"):format((v_u_7:GetTextDisplayForItem(v41)))
		v_u_32(true)
		task.wait(2)
		v_u_20.Position = UDim2.fromScale(0.5, 0.5)
		v_u_12(v_u_20, TweenInfo.new(0.5, Enum.EasingStyle.Quint, Enum.EasingDirection.In), {
			["Position"] = UDim2.fromScale(0.5, 1.5)
		})
		task.wait(0.5)
		v_u_32(false)
	end
	v_u_20.Visible = false
	v_u_19.Enabled = false
	if v34 then
		v_u_27 = false
	end
	if v35 then
		v_u_27 = true
	end
end
function v25.Spin(_, p91)
	-- upvalues: (ref) v_u_24, (ref) v_u_26, (copy) v_u_90, (copy) v_u_1
	while not v_u_24 do
		task.wait()
	end
	while v_u_26 do
		task.wait()
	end
	v_u_26 = true
	xpcall(v_u_90, warn, p91)
	v_u_26 = false
	v_u_1.GameEvents.SeedPack.SpinFinished:FireServer()
end
function v25.Start(p_u_92)
	-- upvalues: (copy) v_u_19, (copy) v_u_1, (copy) v_u_22, (copy) v_u_23, (ref) v_u_24
	v_u_19.Frame.Visible = false
	v_u_19.Frame.Position = UDim2.fromScale(0.5, 1.5)
	v_u_19.Frame.Rolled.ImageTransparency = 1
	v_u_19.Frame.Rolled.Label.TextTransparency = 1
	v_u_19.Frame.Rolled.Label.UIStroke.Transparency = 1
	for _, v_u_93 in v_u_19.Frame.Rolled.Decorations:GetChildren() do
		v_u_93.ImageTransparency = v_u_19.Frame.Rolled.ImageTransparency
		v_u_19.Frame.Rolled:GetPropertyChangedSignal("ImageTransparency"):Connect(function()
			-- upvalues: (copy) v_u_93, (ref) v_u_19
			v_u_93.ImageTransparency = v_u_19.Frame.Rolled.ImageTransparency
		end)
	end
	v_u_1.GameEvents.SeedPack.Result.OnClientEvent:Connect(function(p94)
		-- upvalues: (copy) p_u_92
		p_u_92:Spin(p94)
	end)
	for v95 = 1, 150 do
		local v96 = v_u_22.UIListLayout.Template:Clone()
		v96.Name = tostring(v95)
		v96.LayoutOrder = v95
		v96.Parent = v_u_22
		v_u_23[v95] = v96
		if v95 % 10 == 0 then
			task.wait(0.1)
		end
	end
	v_u_24 = true
end
task.spawn(v25.Start, v25)
return v25