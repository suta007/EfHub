local v1 = game:GetService("Players")
local v_u_2 = game:GetService("TweenService")
local v_u_3 = game:GetService("Debris")
local v4 = game:GetService("UserInputService")
local v_u_5 = game:GetService("SoundService")
local v6 = game:GetService("ReplicatedStorage")
require(v6.Modules.UpdateService)
local v7 = v6:WaitForChild("GameEvents"):WaitForChild("ShecklesClient")
local v_u_8 = v1.LocalPlayer
local v_u_9 = require(v6.Modules.DataService)
local v10 = workspace:FindFirstChild("SpecialCurrencyUIOverlap", true)
local v_u_11 = false
local v_u_12 = script.Parent.Parent
local v_u_13 = script.Parent
local v_u_14 = v_u_13.val
local v_u_15 = TweenInfo.new(0.7, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)
local v_u_16 = game.ReplicatedStorage:WaitForChild("Appear_Effect")
local v_u_17 = require(game.ReplicatedStorage:WaitForChild("Comma_Module"))
local function v_u_18()
	-- upvalues: (copy) v_u_12, (copy) v_u_2, (copy) v_u_14, (copy) v_u_15, (copy) v_u_9, (ref) v_u_11
	v_u_12.Visible = true
	v_u_2:Create(v_u_14, v_u_15, {
		["Value"] = v_u_9:GetData().SpecialCurrency.Honey or 0
	}):Play()
	task.wait(4)
	v_u_12.Visible = v_u_11
end
local function v_u_29(p19, p20)
	-- upvalues: (copy) v_u_17, (copy) v_u_16, (copy) v_u_13, (copy) v_u_2, (copy) v_u_3, (copy) v_u_5
	local v21 = math.random(7, 11) * 0.1
	local v22 = TweenInfo.new(v21, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)
	local v23 = v_u_17.Comma(p19)
	local v24 = v_u_16:Clone()
	v24.Parent = v_u_13.Parent
	v24.Position = v_u_13.Position
	v24.TextColor3 = p20 and Color3.new(1, 1, 0) or Color3.new(1, 0, 0)
	v24.Text = (p20 and "+" or "-") .. v23 .. ""
	local v25 = p20 and 0.1 or math.random(4, 7) * 0.01
	local v26 = v_u_2:Create(v24, v22, {
		["Position"] = v24.Position - UDim2.new(0, 0, v25, 0)
	})
	local v27 = v_u_2:Create(v24, v22, {
		["TextTransparency"] = 1,
		["TextStrokeTransparency"] = 1
	})
	v26:Play()
	v27:Play()
	v_u_3:AddItem(v24, v22.Time)
	local v28 = v_u_5:FindFirstChild("Cash Register")
	if v28 then
		v28.TimePosition = 0
		v28.PlaybackSpeed = 1 + math.random(-15, 15) / 100
		v28:Play()
	end
end
v7.OnClientEvent:Connect(function(_) end)
v_u_14:GetPropertyChangedSignal("Value"):Connect(function()
	-- upvalues: (copy) v_u_13, (copy) v_u_17, (copy) v_u_14
	local v30 = v_u_13
	local v31 = v_u_17.Comma
	local v32 = v_u_14.Value
	local v33 = math.round(v32)
	v30.Text = v31((tostring(v33))) .. ""
end)
local _ = v4.GamepadEnabled
v_u_18()
local v_u_34 = v_u_9:GetData().SpecialCurrency.Honey or 0
v_u_9:GetPathSignal("SpecialCurrency"):Connect(function()
	-- upvalues: (copy) v_u_9, (ref) v_u_34, (copy) v_u_29, (copy) v_u_18
	local v35 = v_u_9:GetData().SpecialCurrency.Honey or 0
	if v_u_34 == v35 then
		return
	else
		local v36 = v35 - v_u_34
		local v37 = math.abs(v36)
		if v37 ~= 0 then
			v_u_29(v37, v_u_34 < v35)
			v_u_34 = v35
			v_u_18()
		end
	end
end)
local function v39(p38)
	-- upvalues: (copy) v_u_8, (copy) v_u_12, (ref) v_u_11
	if p38.Parent == v_u_8.character then
		v_u_12.Visible = true
		v_u_11 = true
	end
end
local function v41(p40)
	-- upvalues: (copy) v_u_8, (copy) v_u_12, (ref) v_u_11
	if p40.Parent == v_u_8.character then
		v_u_12.Visible = false
		v_u_11 = false
	end
end
v10.Touched:Connect(v39)
v10.TouchEnded:Connect(v41)