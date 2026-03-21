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
	-- upvalues: (copy) v_u_2
	local v13 = TweenInfo.new(1, Enum.EasingStyle.Back, Enum.EasingDirection.In)
	local v14 = v_u_2:Create(p12.mainFrame, v13, {
		["Position"] = UDim2.new(0, 0, 1, 0)
	})
	v14:Play()
	p12:changeAllTransparency(1, 1)
	v14.Completed:Wait()
end
function v_u_5.startLoading(p15)
	-- upvalues: (copy) v_u_3
	p15:startTransparentBGfx()
	p15:hideGuis()
	p15.gui.Enabled = true
	p15.bgFrame.Visible = true
	p15:startRotateTween()
	task.wait(1)
	p15:revealLogo()
	p15:startTipCycle(7)
	task.wait(0.6)
	p15:startCounter(5)
	p15.counterFinishedEvent.Event:Wait()
	p15:fadeUpdateText(p15.mainFrame.CounterTxt, "<font color=\'#FFFF00\'>[Click Anywhere to Play]</font>", 0.6)
	v_u_3.InputBegan:Wait()
	p15:endTipCycle()
	p15:hideFrame()
	p15:endTransparentBGfx()
	p15:showGuis()
	p15:stopRotateTween()
	p15:finishedLoading()
end
return v_u_5