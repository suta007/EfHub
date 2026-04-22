local v1 = game:GetService("Players")
local v_u_2 = game:GetService("TweenService")
game:GetService("Debris")
game:GetService("UserInputService")
game:GetService("SoundService")
local v3 = game:GetService("ReplicatedStorage")
local v4 = v1.LocalPlayer
v4:WaitForChild("leaderstats")
require(v3.Modules.DataService)
require(v3.Modules.NumberUtil)
local v_u_5 = script.Parent
local v_u_6 = v_u_5.val
local v_u_7 = TweenInfo.new(0.7, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)
game.ReplicatedStorage:WaitForChild("Appear_Effect")
local v_u_8 = require(game.ReplicatedStorage:WaitForChild("Comma_Module"))
v_u_6:GetPropertyChangedSignal("Value"):Connect(function()
	-- upvalues: (copy) v_u_5, (copy) v_u_8, (copy) v_u_6
	local v9 = v_u_5
	local v10 = v_u_8.Comma
	local v11 = v_u_6.Value
	local v12 = math.round(v11)
	v9.Text = "x" .. v10((tostring(v12)))
end)
local v_u_13 = v_u_2:Create(v_u_5, TweenInfo.new(0.7), {
	["TextTransparency"] = 1
})
local v_u_14 = v_u_2:Create(v_u_5.UIStroke, TweenInfo.new(0.7), {
	["Transparency"] = 1
})
local v_u_15 = v4.PlayerGui:WaitForChild("BackpackGui"):WaitForChild("Backpack"):WaitForChild("Hotbar")
v_u_6:GetAttributeChangedSignal("ActualValue"):Connect(function()
	-- upvalues: (copy) v_u_13, (copy) v_u_14, (copy) v_u_5, (copy) v_u_6, (copy) v_u_2, (copy) v_u_7, (copy) v_u_15
	v_u_13:Cancel()
	v_u_14:Cancel()
	v_u_5.TextTransparency = 0
	v_u_5.UIStroke.Transparency = 0
	if os.time() - v_u_6:GetAttribute("LastUpdate") > 2 then
		v_u_6.Value = v_u_6:GetAttribute("ActualValue")
	else
		v_u_2:Create(v_u_6, v_u_7, {
			["Value"] = v_u_6:GetAttribute("ActualValue")
		}):Play()
	end
	local v16 = v_u_15.AbsolutePosition + Vector2.new(v_u_15.AbsoluteSize.X, v_u_15.AbsoluteSize.Y)
	v_u_5.Position = UDim2.fromOffset(v16.X, v16.Y - 10)
	local v_u_17 = v_u_6:GetAttribute("ActualValue")
	task.delay(2.7, function()
		-- upvalues: (ref) v_u_6, (copy) v_u_17, (ref) v_u_13, (ref) v_u_14
		if v_u_6.Value == v_u_17 then
			v_u_13:Play()
			v_u_14:Play()
		end
	end)
end)