local v1 = game:GetService("Players")
local v_u_2 = game:GetService("TweenService")
local v_u_3 = game:GetService("Debris")
game:GetService("UserInputService")
local v_u_4 = game:GetService("SoundService")
local v5 = game:GetService("ReplicatedStorage")
local v6 = v5:WaitForChild("GameEvents"):WaitForChild("ShecklesClient")
local v7 = v1.LocalPlayer
if not v7.Character then
	v7.CharacterAdded:Wait()
end
local v_u_8 = require(v5.Modules.DataService)
local v_u_9 = require(v5.Modules.NumberUtil)
require(v5:WaitForChild("Comma_Module"))
local v_u_10 = require(v5.Data.CurrencyData).Sheckles
local v_u_11 = script.Parent
local v_u_12 = v_u_11.val
local v_u_13 = v_u_11.UIStroke
local v_u_14 = script.Parent.Parent.FlowersConvert
local v_u_15 = v5:WaitForChild("Appear_Effect")
local v_u_16 = TweenInfo.new(0.7, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)
local function v_u_24(p17, p18)
	-- upvalues: (copy) v_u_15, (copy) v_u_11, (copy) v_u_9, (copy) v_u_2, (copy) v_u_3
	local v19 = math.random(7, 11) * 0.1
	local v20 = TweenInfo.new(v19, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)
	local v21 = v_u_15:Clone()
	v21.Parent = v_u_11.Parent
	v21.Position = v_u_11.Position
	local v22
	if p18 then
		v22 = Color3.new(1, 1, 0)
	else
		v22 = Color3.new(1, 0, 0)
	end
	v21.TextColor3 = v22
	v21.Text = (p18 and "+" or "-") .. v_u_9.DisplaySheckles(p17)
	local v23 = p18 and 0.1 or math.random(4, 7) * 0.01
	v_u_2:Create(v21, v20, {
		["Position"] = v21.Position - UDim2.new(0, 0, v23, 0)
	}):Play()
	v_u_2:Create(v21, v20, {
		["TextTransparency"] = 1,
		["TextStrokeTransparency"] = 1
	}):Play()
	v_u_3:AddItem(v21, v20.Time)
end
v_u_12:GetPropertyChangedSignal("Value"):Connect(function()
	-- upvalues: (copy) v_u_11, (copy) v_u_9, (copy) v_u_12, (copy) v_u_10, (copy) v_u_13, (copy) v_u_14
	v_u_11.Text = v_u_9.DisplaySheckles(v_u_12.Value)
	if v_u_12.Value >= v_u_10.Limit then
		v_u_13.Color = Color3.fromRGB(157, 62, 38)
		v_u_11.TextColor3 = Color3.fromRGB(255, 255, 144)
	else
		v_u_13.Color = Color3.fromRGB(61, 31, 17)
		v_u_11.TextColor3 = Color3.fromRGB(255, 255, 255)
	end
	v_u_14.Visible = v_u_12.Value > 1000000000000000
end)
v6.OnClientEvent:Connect(function(p25)
	-- upvalues: (copy) v_u_4
	local v26 = v_u_4:FindFirstChild(p25, true)
	if v26 then
		v26.TimePosition = 0
		v26.PlaybackSpeed = 1 + math.random(-15, 15) / 100
		v26:Play()
	end
end)
v_u_2:Create(v_u_12, v_u_16, {
	["Value"] = v_u_8:GetData().Sheckles or 0
}):Play()
local v_u_27 = v_u_8:GetData().Sheckles or 0
v_u_8:GetPathSignal("Sheckles"):Connect(function()
	-- upvalues: (copy) v_u_8, (ref) v_u_27, (copy) v_u_24, (copy) v_u_2, (copy) v_u_12, (copy) v_u_16
	local v28 = v_u_8:GetData().Sheckles or 0
	if v_u_27 ~= v28 then
		local v29 = v28 - v_u_27
		local v30 = math.abs(v29)
		if v30 > 0 then
			v_u_24(v30, v_u_27 < v28)
		end
		v_u_27 = v28
		v_u_2:Create(v_u_12, v_u_16, {
			["Value"] = v_u_8:GetData().Sheckles or 0
		}):Play()
	end
end)