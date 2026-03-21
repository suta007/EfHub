local v_u_1 = game:GetService("ReplicatedStorage")
local v2 = game:GetService("Players")
local v_u_3 = game:GetService("TweenService")
local v_u_4 = v2.LocalPlayer
local v_u_5 = v_u_4.Character or v_u_4.CharacterAdded:Wait()
local v_u_6 = require(v_u_1.Modules.PetServices.PetUtilities)
local v_u_7 = require(v_u_1.Modules.PetServices.ActivePetsService)
local v8 = require(v_u_1.Data.PetRegistry)
local v_u_9 = require(v_u_1.Modules.FoodService)
local v_u_10 = require(v_u_1.Data.EnumRegistry.InventoryServiceEnums)
require(v_u_1.Modules.InventoryService)
local v_u_11 = require(v_u_1.Data.DecimalNumberFormat)
local v_u_12 = v8.PetConfig.PET_FEEDING_CONFIG.MINIMUM_DISTANCE_FOR_FEEDING
local v_u_13 = nil
local v_u_14 = {}
local v_u_15 = TweenInfo.new(0.1, Enum.EasingStyle.Linear, Enum.EasingDirection.Out, 0, false, 0)
local v_u_16 = nil
local v_u_17 = nil
local v_u_18 = nil
local function v_u_19()
	-- upvalues: (ref) v_u_17, (ref) v_u_18, (ref) v_u_13, (copy) v_u_7
	v_u_17 = Instance.new("Part")
	v_u_17.Name = "FeedPetProxPart"
	v_u_17.CanCollide = false
	v_u_17.CanQuery = false
	v_u_17.Anchored = true
	v_u_17.Transparency = 1
	v_u_17.Parent = workspace
	v_u_18 = Instance.new("ProximityPrompt")
	v_u_18.Name = "FEED_PET_PROX"
	v_u_18.Exclusivity = Enum.ProximityPromptExclusivity.AlwaysShow
	v_u_18.KeyboardKeyCode = Enum.KeyCode.F
	v_u_18.RequiresLineOfSight = false
	v_u_18.HoldDuration = 0.5
	v_u_18.MaxActivationDistance = (1 / 0)
	v_u_18.Parent = v_u_17
	v_u_18.Style = Enum.ProximityPromptStyle.Custom
	v_u_18:SetAttribute("Theme", "ShadowedPrompt")
	v_u_18.Triggered:Connect(function()
		-- upvalues: (ref) v_u_13, (ref) v_u_7
		if v_u_13 then
			v_u_7:Feed(v_u_13)
		end
	end)
end
local function v_u_33()
	-- upvalues: (copy) v_u_7, (copy) v_u_4, (copy) v_u_5, (copy) v_u_12
	local v20 = (1 / 0)
	local v21 = nil
	local v22 = nil
	for v23, v24 in v_u_7:GetClientPetState(v_u_4.Name) do
		local v25 = v24.Asset
		if v25 then
			local v26 = v25:FindFirstChildWhichIsA("Model", true)
			if v26 then
				local v27 = (v26:GetPivot().Position - v_u_5:GetPivot().Position).Magnitude
				if v20 > v27 and v_u_12 > v27 then
					v22 = v26
					v21 = v23
					v20 = v27
				end
			end
		end
	end
	for v28, v29 in v_u_7.ClientServerPetState do
		local v30 = v29.Asset
		if v30 then
			local v31 = v30:FindFirstChildWhichIsA("Model", true)
			if v31 then
				local v32 = (v31:GetPivot().Position - v_u_5:GetPivot().Position).Magnitude
				if v20 > v32 and v_u_12 > v32 then
					v22 = v31
					v21 = v28
					v20 = v32
				end
			end
		end
	end
	return v21, v22
end
local function v_u_47(p34, p35)
	-- upvalues: (copy) v_u_5, (copy) v_u_10, (copy) v_u_33, (ref) v_u_18, (ref) v_u_16, (ref) v_u_17, (copy) v_u_7, (copy) v_u_4, (ref) v_u_13, (copy) v_u_6, (copy) v_u_1, (copy) v_u_9, (copy) v_u_3, (copy) v_u_15, (copy) v_u_11
	while true do
		while true do
			local v36 = v_u_5:FindFirstChildWhichIsA("Tool")
			local v37
			if v36 then
				v37 = v36:GetAttribute(v_u_10.ITEM_UUID) == p35
			else
				v37 = false
			end
			if not v37 then
				v_u_18.Enabled = false
				if v_u_16 and v_u_16.PlaybackState == Enum.PlaybackState.Playing then
					v_u_16.Completed:Wait()
				end
				v_u_17.CFrame = CFrame.new(100, 5000, 100)
				return
			end
			task.wait(0.05)
			local v38, v39 = v_u_33()
			if not v39 then
				break
			end
			local v40 = v_u_7.ClientServerPetState[v38] ~= nil
			local v41
			if v40 then
				local v42 = v_u_7:GetServerPetData(v38)
				if v42 then
					v41 = v42.PetType
					::l24::
					v_u_13 = v38
					local v43 = 0
					if p34:HasTag("FruitTool") then
						v_u_7:GetPetDataFromPetObject(v39.Parent)
						v43 = v_u_6:GetFruitWorthPercentageForAnimal(v41, p34) * 100
					elseif p34:HasTag("FoodTool") then
						local v44 = p34:GetAttribute(v_u_10.ITEM_UUID)
						local v45 = require(v_u_1.Modules.DataService):GetData().InventoryData[v44]
						if v45 then
							v43 = v_u_9:CalculateFoodValue(v44, v45)
						end
					end
					v_u_16 = v_u_3:Create(v_u_17, v_u_15, {
						["CFrame"] = v39:GetPivot()
					})
					v_u_16:Play()
					v_u_18.ObjectText = v41
					if v40 then
						v_u_18.ActionText = "FEED!"
					else
						v_u_18.ActionText = ("Feed (%*%%) %*"):format(v_u_11(v43), p34.Name)
					end
					v_u_18.Enabled = true
				else
					v_u_18.Enabled = false
					if v_u_16 and v_u_16.PlaybackState == Enum.PlaybackState.Playing then
						v_u_16.Completed:Wait()
					end
					v_u_17.CFrame = CFrame.new(100, 5000, 100)
				end
			else
				local v46 = v_u_7:GetPetData(v_u_4.Name, v38)
				if v46 then
					v41 = v46.PetType
					goto l24
				end
				v_u_18.Enabled = false
				if v_u_16 and v_u_16.PlaybackState == Enum.PlaybackState.Playing then
					v_u_16.Completed:Wait()
				end
				v_u_17.CFrame = CFrame.new(100, 5000, 100)
			end
		end
		v_u_18.Enabled = false
		if v_u_16 and v_u_16.PlaybackState == Enum.PlaybackState.Playing then
			v_u_16.Completed:Wait()
		end
		v_u_17.CFrame = CFrame.new(100, 5000, 100)
	end
end
local function v_u_56(p48)
	-- upvalues: (ref) v_u_18, (ref) v_u_16, (ref) v_u_17, (copy) v_u_10, (copy) v_u_14, (copy) v_u_47
	local function v_u_53(p_u_49)
		-- upvalues: (ref) v_u_18, (ref) v_u_16, (ref) v_u_17, (ref) v_u_10, (ref) v_u_14, (ref) v_u_47
		if p_u_49:HasTag("FruitTool") or p_u_49:HasTag("FoodTool") then
			local v_u_50 = p_u_49:GetAttribute(v_u_10.ITEM_UUID)
			if not v_u_14[v_u_50] then
				local v_u_51 = p_u_49.Equipped:Connect(function()
					-- upvalues: (ref) v_u_47, (copy) p_u_49, (copy) v_u_50
					task.spawn(v_u_47, p_u_49, v_u_50)
				end)
				local v_u_52 = p_u_49.Unequipped:Connect(function()
					-- upvalues: (ref) v_u_18, (ref) v_u_16, (ref) v_u_17
					v_u_18.Enabled = false
					if v_u_16 and v_u_16.PlaybackState == Enum.PlaybackState.Playing then
						v_u_16.Completed:Wait()
					end
					v_u_17.CFrame = CFrame.new(100, 5000, 100)
				end)
				v_u_14[v_u_50] = { v_u_51, v_u_52 }
				p_u_49.Destroying:Once(function()
					-- upvalues: (ref) v_u_14, (copy) v_u_50, (ref) v_u_51, (ref) v_u_52, (ref) v_u_18, (ref) v_u_16, (ref) v_u_17
					v_u_14[v_u_50] = nil
					v_u_51:Disconnect()
					v_u_52:Disconnect()
					v_u_18.Enabled = false
					if v_u_16 and v_u_16.PlaybackState == Enum.PlaybackState.Playing then
						v_u_16.Completed:Wait()
					end
					v_u_17.CFrame = CFrame.new(100, 5000, 100)
				end)
			end
		else
			v_u_18.Enabled = false
			if v_u_16 and v_u_16.PlaybackState == Enum.PlaybackState.Playing then
				v_u_16.Completed:Wait()
			end
			v_u_17.CFrame = CFrame.new(100, 5000, 100)
			return
		end
	end
	for _, v54 in p48:GetChildren() do
		if v54:IsA("Tool") then
			v_u_53(v54)
		end
	end
	p48.ChildAdded:Connect(function(p55)
		-- upvalues: (copy) v_u_53
		if p55:IsA("Tool") then
			v_u_53(p55)
		end
	end)
end
task.spawn(function()
	-- upvalues: (copy) v_u_19, (ref) v_u_18, (ref) v_u_16, (ref) v_u_17, (copy) v_u_56, (copy) v_u_5
	v_u_19()
	v_u_18.Enabled = false
	if v_u_16 and v_u_16.PlaybackState == Enum.PlaybackState.Playing then
		v_u_16.Completed:Wait()
	end
	v_u_17.CFrame = CFrame.new(100, 5000, 100)
	v_u_56(v_u_5)
end)
return {}