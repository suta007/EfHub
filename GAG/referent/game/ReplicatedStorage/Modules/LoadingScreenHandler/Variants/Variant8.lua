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
	v9.bgFrame = v9.gui.Variant3Frame
	v9.mainFrame = v9.bgFrame.InnerFrame
	return v9
end
function v_u_5.revealLogo(p10)
	-- upvalues: (copy) v_u_2
	local v11 = TweenInfo.new(1, Enum.EasingStyle.Linear)
	v_u_2:Create(p10.mainFrame.LogoImg, v11, {
		["ImageTransparency"] = 0
	}):Play()
	v_u_2:Create(p10.mainFrame.LogoImg.FruitImg, v11, {
		["ImageTransparency"] = 0
	}):Play()
	task.wait(1)
end
function v_u_5.hideFrame(p12)
	p12:changeAllTransparency(1, 1, true)
end
function v_u_5.startLoading(p13)
	-- upvalues: (copy) v_u_3
	p13:startTransparentBGfx()
	p13:hideGuis()
	p13.gui.Enabled = true
	p13.bgFrame.Visible = true
	p13:startRotateTween()
	task.wait(1)
	p13:revealLogo()
	p13:startTipCycle(7)
	task.wait(0.6)
	p13:startCounter(5)
	p13.counterFinishedEvent.Event:Wait()
	p13:fadeUpdateText(p13.mainFrame.CounterTxt, "<font color=\'#FFFF00\'>[Click Anywhere to Play]</font>", 0.6)
	v_u_3.InputBegan:Wait()
	p13:endTipCycle()
	p13:hideFrame()
	p13:endTransparentBGfx()
	p13:showGuis()
	p13:stopRotateTween()
	p13:finishedLoading()
end
return v_u_5