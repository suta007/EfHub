local v1 = game.ReplicatedStorage
local v_u_2 = game:GetService("TweenService")
local v_u_3 = game:GetService("UserInputService")
local _ = game.Players.LocalPlayer
local v_u_4 = require(script.Parent.Parent.LoadingScreen)
local v_u_5 = require(v1.Modules.Utility.utils)
local v_u_6 = setmetatable({}, v_u_4)
v_u_6.__index = v_u_6
function v_u_6.new(p7)
	-- upvalues: (copy) v_u_4, (copy) v_u_6
	local v8 = v_u_4.new(p7)
	local v9 = v_u_6
	local v10 = setmetatable(v8, v9)
	v10.bgFrame = v10.gui.Variant1Frame
	v10.mainFrame = v10.bgFrame.InnerFrame
	v10.canSkipAfter = 3
	v10.skipped = false
	v10.finished = false
	return v10
end
function v_u_6.revealLogo(p11)
	-- upvalues: (copy) v_u_2
	local v12 = TweenInfo.new(1, Enum.EasingStyle.Linear)
	v_u_2:Create(p11.mainFrame.LogoImg, v12, {
		["ImageTransparency"] = 0
	}):Play()
	v_u_2:Create(p11.mainFrame.LogoImg.FruitImg, v12, {
		["ImageTransparency"] = 0
	}):Play()
	task.wait(1)
end
function v_u_6.hideFrame(p13)
	-- upvalues: (copy) v_u_2
	p13:changeAllTransparency(1, 1)
	local v14 = TweenInfo.new(1, Enum.EasingStyle.Linear)
	local v15 = v_u_2:Create(p13.bgFrame, v14, {
		["BackgroundTransparency"] = 1
	})
	v15:Play()
	v15.Completed:Wait()
end
function v_u_6.startLoading(p_u_16)
	-- upvalues: (copy) v_u_3, (copy) v_u_5
	p_u_16:startTransparentBGfx()
	p_u_16:hideGuis()
	p_u_16.gui.Enabled = true
	p_u_16.bgFrame.Visible = true
	p_u_16:startRotateTween()
	p_u_16:startTipCycle(7)
	p_u_16:startCounter(15)
	p_u_16.canSkipEvent.Event:Wait()
	p_u_16:fadeUpdateText(p_u_16.mainFrame.SkipTxt, "Click to skip!", 0.6)
	p_u_16.inputCon = v_u_3.InputBegan:Connect(function()
		-- upvalues: (copy) p_u_16
		p_u_16.skipped = true
	end)
	p_u_16.counterFinishedEvent.Event:Connect(function()
		-- upvalues: (copy) p_u_16
		p_u_16.finished = true
		p_u_16:fadeUpdateText(p_u_16.mainFrame.CounterTxt, "Fully Loaded!", 0.6)
	end)
	while not (p_u_16.skipped or p_u_16.finished) do
		task.wait()
	end
	if p_u_16.finished then
		local v17 = "<font color=\'#FFFF00\'>[" .. (v_u_5.isMobile() and "Tap anywhere to play!" or "Press any key to play!") .. "]</font>"
		p_u_16:fadeUpdateText(p_u_16.mainFrame.PressAnyTxt, v17, 0.6)
	end
	while not p_u_16.skipped do
		task.wait()
	end
	p_u_16:endCounter()
	p_u_16:endTipCycle()
	p_u_16.inputCon:Disconnect()
	p_u_16:hideFrame()
	p_u_16:endTransparentBGfx()
	p_u_16:stopRotateTween()
	p_u_16:showGuis()
	p_u_16:finishedLoading()
end
return v_u_6