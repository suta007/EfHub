local v1 = game:GetService("Players")
local v_u_2 = game:GetService("TweenService")
local v_u_3 = game:GetService("Debris")
local v4 = game:GetService("UserInputService")
local v_u_5 = game:GetService("SoundService")
local v6 = game:GetService("ReplicatedStorage")
require(v6.Modules.UpdateService)
local v7 = v6:WaitForChild("GameEvents"):WaitForChild("ShecklesClient")
local v8 = v1.LocalPlayer
local v_u_9 = require(v6.Modules.DataService)
local v_u_10 = require(v6.Modules.GuiController)
local v_u_11 = script.Parent.Parent
local v_u_12 = script.Parent
local v_u_13 = v_u_12.val
local v14 = v_u_11.Icons.PurchaseButtercups.ImageButton
local v_u_15 = v8.PlayerGui.ButtercupCoinShop_UI
local v_u_16 = TweenInfo.new(0.7, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)
local v_u_17 = game.ReplicatedStorage:WaitForChild("Appear_Effect")
local v_u_18 = require(game.ReplicatedStorage:WaitForChild("Comma_Module"))
local function v_u_19()
	-- upvalues: (copy) v_u_11, (copy) v_u_2, (copy) v_u_13, (copy) v_u_16, (copy) v_u_9
	v_u_11.Visible = true
	v_u_2:Create(v_u_13, v_u_16, {
		["Value"] = v_u_9:GetData().SpecialCurrency.ButtercupCoins or 0
	}):Play()
	task.wait(4)
end
local function v_u_30(p20, p21)
	-- upvalues: (copy) v_u_18, (copy) v_u_17, (copy) v_u_12, (copy) v_u_2, (copy) v_u_3, (copy) v_u_5
	local v22 = math.random(7, 11) * 0.1
	local v23 = TweenInfo.new(v22, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)
	local v24 = v_u_18.Comma(p20)
	local v25 = v_u_17:Clone()
	v25.Parent = v_u_12.Parent
	v25.Position = v_u_12.Position
	v25.TextColor3 = p21 and Color3.new(1, 1, 0) or Color3.new(1, 0, 0)
	v25.Text = (p21 and "+" or "-") .. v24 .. ""
	local v26 = p21 and 0.1 or math.random(4, 7) * 0.01
	local v27 = v_u_2:Create(v25, v23, {
		["Position"] = v25.Position - UDim2.new(0, 0, v26, 0)
	})
	local v28 = v_u_2:Create(v25, v23, {
		["TextTransparency"] = 1,
		["TextStrokeTransparency"] = 1
	})
	v27:Play()
	v28:Play()
	v_u_3:AddItem(v25, v23.Time)
	local v29 = v_u_5:FindFirstChild("Cash Register")
	if v29 then
		v29.TimePosition = 0
		v29.PlaybackSpeed = 1 + math.random(-15, 15) / 100
		v29:Play()
	end
end
v7.OnClientEvent:Connect(function(_) end)
v_u_13:GetPropertyChangedSignal("Value"):Connect(function()
	-- upvalues: (copy) v_u_12, (copy) v_u_18, (copy) v_u_13
	local v31 = v_u_12
	local v32 = v_u_18.Comma
	local v33 = v_u_13.Value
	local v34 = math.round(v33)
	v31.Text = v32((tostring(v34))) .. ""
end)
local _ = v4.GamepadEnabled
v_u_19()
local v_u_35 = v_u_9:GetData().SpecialCurrency.ButtercupCoins or 0
v_u_9:GetPathSignal("SpecialCurrency"):Connect(function()
	-- upvalues: (copy) v_u_9, (ref) v_u_35, (copy) v_u_30, (copy) v_u_19
	local v36 = v_u_9:GetData().SpecialCurrency.ButtercupCoins or 0
	if v_u_35 == v36 then
		return
	else
		local v37 = v36 - v_u_35
		local v38 = math.abs(v37)
		if v38 ~= 0 then
			v_u_30(v38, v_u_35 < v36)
			v_u_35 = v36
			v_u_19()
		end
	end
end)
v14.Activated:Connect(function()
	-- upvalues: (copy) v_u_10, (copy) v_u_15
	v_u_10:Toggle(v_u_15)
end)