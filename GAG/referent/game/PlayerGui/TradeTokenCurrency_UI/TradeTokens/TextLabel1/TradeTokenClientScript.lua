local v1 = game:GetService("Players")
local v_u_2 = game:GetService("TweenService")
local v_u_3 = game:GetService("Debris")
local v4 = game:GetService("UserInputService")
game:GetService("SoundService")
local v5 = game:GetService("ReplicatedStorage")
local v_u_6 = require(v5.Modules.UpdateService)
require(v5.Modules.TradeControllers.TradeWorldController)
local v_u_7 = require(v5.Modules.GuiController)
local v8 = v5:WaitForChild("GameEvents"):WaitForChild("ShecklesClient")
local v9 = v1.LocalPlayer
local v_u_10 = require(v5.Modules.DataService)
local v_u_11 = script.Parent.Parent
local v_u_12 = script.Parent
local v_u_13 = v_u_12.val
local v14 = script.Parent.Parent.Icons.PurchaseTokens.ImageButton
local v_u_15 = v9.PlayerGui.BuyTokens
local v_u_16 = TweenInfo.new(0.7, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)
local v_u_17 = game.ReplicatedStorage:WaitForChild("Appear_Effect")
local v_u_18 = require(game.ReplicatedStorage:WaitForChild("Comma_Module"))
local function v_u_20()
	-- upvalues: (copy) v_u_11, (copy) v_u_10, (copy) v_u_2, (copy) v_u_13, (copy) v_u_16
	v_u_11.Visible = true
	local v19 = v_u_10:GetData().TradeData.Tokens
	v_u_2:Create(v_u_13, v_u_16, {
		["Value"] = v19 or 0
	}):Play()
	task.wait(4)
	v_u_11.Visible = v19 > 0
end
local function v_u_30(p21, p22)
	-- upvalues: (copy) v_u_18, (copy) v_u_17, (copy) v_u_12, (copy) v_u_2, (copy) v_u_3
	local v23 = math.random(7, 11) * 0.1
	local v24 = TweenInfo.new(v23, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)
	local v25 = v_u_18.Comma(p21)
	local v26 = v_u_17:Clone()
	v26.Parent = v_u_12.Parent
	v26.Position = v_u_12.Position
	v26.TextColor3 = p22 and Color3.new(1, 1, 0) or Color3.new(1, 0, 0)
	v26.Text = (p22 and "+" or "-") .. v25 .. ""
	local v27 = p22 and 0.1 or math.random(4, 7) * 0.01
	local v28 = v_u_2:Create(v26, v24, {
		["Position"] = v26.Position - UDim2.new(0, 0, v27, 0)
	})
	local v29 = v_u_2:Create(v26, v24, {
		["TextTransparency"] = 1,
		["TextStrokeTransparency"] = 1
	})
	v28:Play()
	v29:Play()
	v_u_3:AddItem(v26, v24.Time)
end
v8.OnClientEvent:Connect(function(_) end)
v_u_13:GetPropertyChangedSignal("Value"):Connect(function()
	-- upvalues: (copy) v_u_12, (copy) v_u_18, (copy) v_u_13
	local v31 = v_u_12
	local v32 = v_u_18.Comma
	local v33 = v_u_13.Value
	local v34 = math.round(v33)
	v31.Text = v32((tostring(v34))) .. ""
end)
local _ = v4.GamepadEnabled
v14.Activated:Connect(function()
	-- upvalues: (copy) v_u_7, (copy) v_u_15
	v_u_7:Toggle(v_u_15)
end)
task.spawn(function()
	-- upvalues: (copy) v_u_10, (copy) v_u_13, (copy) v_u_12, (copy) v_u_18, (copy) v_u_11
	local v35 = v_u_10:GetData()
	while not v35 or (not v35.TradeData or v35.TradeData.Tokens == nil) do
		task.wait()
		v35 = v_u_10:GetData()
	end
	local v36 = v35.TradeData.Tokens
	lastSheckles = v36
	v_u_13.Value = v36
	v_u_12.Text = v_u_18.Comma(v36)
	v_u_11.Visible = v36 > 0
end)
task.spawn(function()
	-- upvalues: (copy) v_u_6
	script.Parent.Parent.Visible = false
	while v_u_6:IsHiddenFromUpdate("Trade Tokens") do
		task.wait(1)
	end
	script.Parent.Parent.Visible = true
end)
v_u_10:GetPathSignal("TradeData/Tokens"):Connect(function()
	-- upvalues: (copy) v_u_10, (copy) v_u_30, (copy) v_u_20
	local v37 = v_u_10:GetData().TradeData.Tokens or 0
	if lastSheckles == v37 then
		return
	else
		local v38 = v37 - lastSheckles
		local v39 = math.abs(v38)
		if v39 ~= 0 then
			v_u_30(v39, lastSheckles < v37)
			lastSheckles = v37
			v_u_20()
		end
	end
end)