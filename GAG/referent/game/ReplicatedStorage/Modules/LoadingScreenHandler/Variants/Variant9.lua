local v1 = game.ReplicatedStorage
local v_u_2 = game:GetService("TweenService")
local v_u_3 = game:GetService("UserInputService")
local _ = game.Players.LocalPlayer
local v_u_4 = require(script.Parent.Parent.LoadingScreen)
require(v1.Field_Of_View_Module)
local v_u_5 = setmetatable({}, v_u_4)
v_u_5.__index = v_u_5
function v_u_5.new(p6)
	-- upvalues: (copy) v_u_4, (copy) v_u_5
	local v7 = v_u_4.new(p6)
	local v8 = v_u_5
	local v9 = setmetatable(v7, v8)
	v9.bgFrame = v9.gui.Variant4Frame
	v9.mainFrame = v9.bgFrame.InnerFrame
	return v9
end
function v_u_5.fillLogo(p10, p11)
	-- upvalues: (copy) v_u_2
	local v12 = TweenInfo.new(p11, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut)
	v_u_2:Create(p10.mainFrame.LogoCG.UIGradient, v12, {
		["Offset"] = Vector2.new(0, 0)
	}):Play()
end
function v_u_5.hideFrame(p13)
	p13:changeAllTransparency(1, 1, true)
end
function v_u_5.startLoading(p14)
	-- upvalues: (copy) v_u_3
	p14:startTransparentBGfx()
	p14:hideGuis()
	p14.gui.Enabled = true
	p14.bgFrame.Visible = true
	task.wait(1)
	p14:fillLogo(5)
	p14:startTipCycle(7)
	p14:startCounter(5)
	p14.counterFinishedEvent.Event:Wait()
	p14:fadeUpdateText(p14.mainFrame.CounterTxt, "<font color=\'#FFFF00\'>[Click Anywhere to Play]</font>", 0.6)
	v_u_3.InputBegan:Wait()
	p14:endTipCycle()
	p14:hideFrame()
	p14:endTransparentBGfx()
	p14:showGuis()
	p14:finishedLoading()
end
return v_u_5