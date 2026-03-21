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
	-- upvalues: (copy) v_u_2
	local v14 = TweenInfo.new(1, Enum.EasingStyle.Back, Enum.EasingDirection.In)
	local v15 = v_u_2:Create(p13.mainFrame, v14, {
		["Position"] = UDim2.new(0, 0, 1, 0)
	})
	v15:Play()
	p13:changeAllTransparency(1, 1)
	v15.Completed:Wait()
end
function v_u_5.startLoading(p16)
	-- upvalues: (copy) v_u_3
	p16:startTransparentBGfx()
	p16:hideGuis()
	p16.gui.Enabled = true
	p16.bgFrame.Visible = true
	task.wait(1)
	p16:fillLogo(5)
	p16:startTipCycle(7)
	p16:startCounter(5)
	p16.counterFinishedEvent.Event:Wait()
	p16:fadeUpdateText(p16.mainFrame.CounterTxt, "<font color=\'#FFFF00\'>[Click Anywhere to Play]</font>", 0.6)
	v_u_3.InputBegan:Wait()
	p16:endTipCycle()
	p16:hideFrame()
	p16:endTransparentBGfx()
	p16:showGuis()
	p16:finishedLoading()
end
return v_u_5