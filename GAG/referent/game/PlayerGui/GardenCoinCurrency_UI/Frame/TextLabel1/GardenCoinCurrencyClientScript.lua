local v1 = game:GetService("Players")
local v_u_2 = game:GetService("TweenService")
local v_u_3 = game:GetService("Debris")
local v4 = game:GetService("UserInputService")
game:GetService("SoundService")
local v5 = game:GetService("ReplicatedStorage")
local v6 = require(v5.Modules.UpdateService)
local v7 = v5:WaitForChild("GameEvents"):WaitForChild("ShecklesClient")
local v_u_8 = require(v5.Modules.TradeControllers.TradeWorldController)
local _ = v1.LocalPlayer
local v_u_9 = require(v5.Modules.DataService)
local v_u_10 = script.Parent.Parent
local v_u_11 = script.Parent
local v_u_12 = v_u_11.val
local v_u_13 = TweenInfo.new(0.7, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)
local v_u_14 = game.ReplicatedStorage:WaitForChild("Appear_Effect")
local v_u_15 = require(game.ReplicatedStorage:WaitForChild("Comma_Module"))
local function v_u_17()
	-- upvalues: (copy) v_u_10, (copy) v_u_9, (copy) v_u_2, (copy) v_u_12, (copy) v_u_13
	v_u_10.Visible = true
	local v16 = v_u_9:GetData().SpecialCurrency.GardenCoins
	v_u_2:Create(v_u_12, v_u_13, {
		["Value"] = v16 or 0
	}):Play()
	task.wait(4)
	v_u_10.Visible = v16 > 0
end
local function v_u_27(p18, p19)
	-- upvalues: (copy) v_u_15, (copy) v_u_14, (copy) v_u_11, (copy) v_u_2, (copy) v_u_3
	local v20 = math.random(7, 11) * 0.1
	local v21 = TweenInfo.new(v20, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)
	local v22 = v_u_15.Comma(p18)
	local v23 = v_u_14:Clone()
	v23.Parent = v_u_11.Parent
	v23.Position = v_u_11.Position
	v23.TextColor3 = p19 and Color3.new(1, 1, 0) or Color3.new(1, 0, 0)
	v23.Text = (p19 and "+" or "-") .. v22 .. ""
	local v24 = p19 and 0.1 or math.random(4, 7) * 0.01
	local v25 = v_u_2:Create(v23, v21, {
		["Position"] = v23.Position - UDim2.new(0, 0, v24, 0)
	})
	local v26 = v_u_2:Create(v23, v21, {
		["TextTransparency"] = 1,
		["TextStrokeTransparency"] = 1
	})
	v25:Play()
	v26:Play()
	v_u_3:AddItem(v23, v21.Time)
end
v7.OnClientEvent:Connect(function(_) end)
v_u_12:GetPropertyChangedSignal("Value"):Connect(function()
	-- upvalues: (copy) v_u_11, (copy) v_u_15, (copy) v_u_12
	local v28 = v_u_11
	local v29 = v_u_15.Comma
	local v30 = v_u_12.Value
	local v31 = math.round(v30)
	v28.Text = v29((tostring(v31))) .. ""
end)
local _ = v4.GamepadEnabled
if not v6:IsHiddenFromUpdate("GardenCoinShop") then
	v_u_17()
end
local v_u_32 = v_u_9:GetData().SpecialCurrency.GardenCoins or 0
local function v35()
	-- upvalues: (copy) v_u_9, (copy) v_u_8
	local v33 = script.Parent.Parent.Parent
	local v34 = v_u_9:GetData().GardenCoinShopStats.UnlockedGardenCoins
	if v34 then
		v34 = not v_u_8:IsInWorld()
	end
	v33.Enabled = v34
end
v_u_9:GetPathSignal("GardenCoinShopStats/UnlockedGardenCoins"):Connect(v35)
task.spawn(v35)
v_u_9:GetPathSignal("SpecialCurrency"):Connect(function()
	-- upvalues: (copy) v_u_9, (ref) v_u_32, (copy) v_u_27, (copy) v_u_17
	local v36 = v_u_9:GetData().SpecialCurrency.GardenCoins or 0
	if v_u_32 == v36 then
		return
	else
		local v37 = v36 - v_u_32
		local v38 = math.abs(v37)
		if v38 ~= 0 then
			v_u_27(v38, v_u_32 < v36)
			v_u_32 = v36
			v_u_17()
		end
	end
end)