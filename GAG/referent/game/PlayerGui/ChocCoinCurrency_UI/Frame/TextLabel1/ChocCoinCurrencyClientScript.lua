local v1 = game:GetService("Players")
local v_u_2 = game:GetService("TweenService")
local v_u_3 = game:GetService("Debris")
local v4 = game:GetService("UserInputService")
local v5 = game:GetService("ReplicatedStorage")
local v_u_6 = game:GetService("CollectionService")
local v7 = game:GetService("RunService")
local v_u_8 = require(v5.Modules.UpdateService)
local v_u_9 = require(v5.Modules.DataService)
local v_u_10 = require(v5.Modules.TradeControllers.TradeWorldController)
local v_u_11 = require(v5.Modules.SaveSlotControllers.SaveSlotController)
local v12 = require(v5.Modules.GetFarmAsync)
local v_u_13 = require(v5:WaitForChild("Comma_Module"))
local v_u_14 = v1.LocalPlayer
assert(v_u_14, "LocalPlayer not found")
v12(v_u_14)
local v_u_15 = v_u_14.PlayerGui:WaitForChild("Sheckles_UI")
local v_u_16 = script.Parent.Parent
local v_u_17 = script.Parent
local v_u_18 = v_u_17.val
local v_u_19 = v5:WaitForChild("Appear_Effect")
local v_u_20 = TweenInfo.new(0.7, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)
local function v_u_23()
	-- upvalues: (copy) v_u_6
	local v21 = {}
	for _, v22 in v_u_6:GetTagged("EasterEventBounds") do
		if v22:IsA("BasePart") and v22:IsDescendantOf(workspace) then
			table.insert(v21, v22)
		end
	end
	return v21
end
local function v_u_26()
	-- upvalues: (copy) v_u_6
	local v24 = {}
	for _, v25 in v_u_6:GetTagged("ShecklesCurrencyPart") do
		if v25:IsA("BasePart") and v25:IsDescendantOf(workspace) then
			table.insert(v24, v25)
		end
	end
	return v24
end
local function v_u_45()
	-- upvalues: (copy) v_u_14, (copy) v_u_11, (copy) v_u_26, (copy) v_u_23
	local v27 = v_u_14.Character
	if v27 then
		local v28 = v27:FindFirstChild("HumanoidRootPart")
		if v28 and v28:IsA("BasePart") then
			if v_u_11:GetCurrentSaveSlot().IsEasterSlot or false then
				local v29 = v_u_26()
				if #v29 <= 0 then
					return true
				end
				for _, v30 in v29 do
					local v31 = v28.Position
					local v32 = v30.CFrame:PointToObjectSpace(v31)
					local v33 = v30.Size * 0.5
					local v34 = v32.X
					local v35
					if math.abs(v34) <= v33.X then
						local v36 = v32.Z
						v35 = math.abs(v36) <= v33.Z
					else
						v35 = false
					end
					if v35 then
						return false
					end
				end
				return true
			else
				local v37 = v_u_23()
				if #v37 <= 0 then
					return false
				end
				for _, v38 in v37 do
					local v39 = v28.Position
					local v40 = v38.CFrame:PointToObjectSpace(v39)
					local v41 = v38.Size * 0.5
					local v42 = v40.X
					local v43
					if math.abs(v42) <= v41.X then
						local v44 = v40.Z
						v43 = math.abs(v44) <= v41.Z
					else
						v43 = false
					end
					if v43 then
						return true
					end
				end
				return false
			end
		else
			return false
		end
	else
		return false
	end
end
local function v_u_51()
	-- upvalues: (copy) v_u_9, (copy) v_u_16, (copy) v_u_8, (copy) v_u_10, (copy) v_u_45, (copy) v_u_2, (copy) v_u_18, (copy) v_u_20
	local v46 = v_u_9:GetData()
	local v47
	if v46 then
		local v48 = v46.SpecialCurrency
		v47 = v48 and (v48.ChocCoins or 0) or 0
	else
		v47 = 0
	end
	local v49 = v_u_16
	local v50 = not (v_u_8:IsHiddenFromUpdate("EasterEventShop") or v_u_10:IsInWorld())
	if v50 then
		v50 = v_u_45()
	end
	v49.Visible = v50
	v_u_2:Create(v_u_18, v_u_20, {
		["Value"] = v47
	}):Play()
end
v_u_18:GetPropertyChangedSignal("Value"):Connect(function()
	-- upvalues: (copy) v_u_17, (copy) v_u_13, (copy) v_u_18
	local v52 = v_u_17
	local v53 = v_u_13.Comma
	local v54 = v_u_18.Value
	local v55 = math.round(v54)
	v52.Text = v53((tostring(v55)))
end)
local _ = v4.GamepadEnabled
local v56 = v_u_9:GetData()
local v_u_57
if v56 then
	local v58 = v56.SpecialCurrency
	v_u_57 = v58 and (v58.ChocCoins or 0) or 0
else
	v_u_57 = 0
end
local function v_u_68(p59, p60)
	-- upvalues: (copy) v_u_13, (copy) v_u_19, (copy) v_u_17, (copy) v_u_2, (copy) v_u_3
	local v61 = math.random(7, 11) * 0.1
	local v62 = TweenInfo.new(v61, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)
	local v63 = v_u_13.Comma(p59)
	local v64 = v_u_19:Clone()
	v64.Parent = v_u_17.Parent
	v64.Position = v_u_17.Position
	v64.TextColor3 = p60 and Color3.fromRGB(123, 74, 42) or Color3.fromRGB(255, 80, 80)
	v64.Text = ("%*%*"):format(p60 and "+" or "-", v63)
	local v65 = p60 and 0.1 or math.random(4, 7) * 0.01
	local v66 = v_u_2:Create(v64, v62, {
		["Position"] = v64.Position - UDim2.new(0, 0, v65, 0)
	})
	local v67 = v_u_2:Create(v64, v62, {
		["TextTransparency"] = 1,
		["TextStrokeTransparency"] = 1
	})
	v66:Play()
	v67:Play()
	v_u_3:AddItem(v64, v62.Time)
end
v_u_9:GetPathSignal("SpecialCurrency"):Connect(function()
	-- upvalues: (copy) v_u_9, (ref) v_u_57, (copy) v_u_68, (copy) v_u_8, (copy) v_u_10, (copy) v_u_45, (copy) v_u_16, (copy) v_u_15, (copy) v_u_51
	local v69 = v_u_9:GetData()
	local v70
	if v69 then
		local v71 = v69.SpecialCurrency
		v70 = v71 and (v71.ChocCoins or 0) or 0
	else
		v70 = 0
	end
	if v_u_57 ~= v70 then
		local v72 = v70 - v_u_57
		local v73 = math.abs(v72)
		if v73 > 0 then
			v_u_68(v73, v_u_57 < v70)
		end
		v_u_57 = v70
		local v74 = not (v_u_8:IsHiddenFromUpdate("EasterEventShop") or v_u_10:IsInWorld())
		if v74 then
			v74 = v_u_45()
		end
		script.Parent.Parent.Parent.Enabled = v74
		v_u_16.Visible = v74
		v_u_15.Enabled = not v74
		v_u_51()
	end
end)
v7.RenderStepped:Connect(function()
	-- upvalues: (copy) v_u_8, (copy) v_u_10, (copy) v_u_45, (copy) v_u_16, (copy) v_u_15
	local v75 = not (v_u_8:IsHiddenFromUpdate("EasterEventShop") or v_u_10:IsInWorld())
	if v75 then
		v75 = v_u_45()
	end
	script.Parent.Parent.Parent.Enabled = v75
	v_u_16.Visible = v75
	v_u_15.Enabled = not v75
end)
task.spawn(function()
	-- upvalues: (copy) v_u_8, (copy) v_u_10, (copy) v_u_45, (copy) v_u_16, (copy) v_u_15, (copy) v_u_51
	local v76 = not (v_u_8:IsHiddenFromUpdate("EasterEventShop") or v_u_10:IsInWorld())
	if v76 then
		v76 = v_u_45()
	end
	script.Parent.Parent.Parent.Enabled = v76
	v_u_16.Visible = v76
	v_u_15.Enabled = not v76
	v_u_51()
end)