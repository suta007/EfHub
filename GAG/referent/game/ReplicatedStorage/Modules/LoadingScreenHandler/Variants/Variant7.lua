local v1 = game.ReplicatedStorage
local v_u_2 = game:GetService("TweenService")
local v_u_3 = game:GetService("UserInputService")
local _ = game.Players.LocalPlayer
local v_u_4 = require(script.Parent.Parent.LoadingScreen)
local v_u_5 = require(v1.Field_Of_View_Module)
local v_u_6 = require(v1.Modules.Utility.utils)
local v_u_7 = setmetatable({}, v_u_4)
v_u_7.__index = v_u_7
function v_u_7.new(p8)
	-- upvalues: (copy) v_u_4, (copy) v_u_7
	local v9 = v_u_4.new(p8)
	local v10 = v_u_7
	local v11 = setmetatable(v9, v10)
	v11.bgFrame = v11.gui.Variant2Frame
	v11.mainFrame = v11.bgFrame.InnerFrame
	v11.canSkipAfter = 3
	v11.skipped = false
	v11.finished = false
	return v11
end
function v_u_7.revealLogo(p12)
	-- upvalues: (copy) v_u_2
	local v13 = TweenInfo.new(1, Enum.EasingStyle.Linear)
	v_u_2:Create(p12.mainFrame.LogoImg, v13, {
		["ImageTransparency"] = 0
	}):Play()
	v_u_2:Create(p12.mainFrame.LogoImg.FruitImg, v13, {
		["ImageTransparency"] = 0
	}):Play()
	task.wait(1)
end
function v_u_7.hideFrame(p14)
	-- upvalues: (copy) v_u_2
	p14:changeAllTransparency(1, 1)
	local v15 = TweenInfo.new(1, Enum.EasingStyle.Linear)
	local v16 = v_u_2:Create(p14.bgFrame, v15, {
		["BackgroundTransparency"] = 1
	})
	v16:Play()
	v16.Completed:Wait()
end
function v_u_7.startLoading(p_u_17)
	-- upvalues: (copy) v_u_3, (copy) v_u_6, (copy) v_u_5
	p_u_17.gui.Enabled = true
	p_u_17.bgFrame.Visible = true
	p_u_17:startRotateTween()
	p_u_17:startTipCycle(7)
	p_u_17:startCounter(15)
	p_u_17.canSkipEvent.Event:Wait()
	p_u_17:fadeUpdateText(p_u_17.mainFrame.SkipTxt, "Click to skip!", 0.6)
	p_u_17.inputCon = v_u_3.InputBegan:Connect(function()
		-- upvalues: (copy) p_u_17
		p_u_17.skipped = true
	end)
	p_u_17.counterFinishedEvent.Event:Connect(function()
		-- upvalues: (copy) p_u_17
		p_u_17.finished = true
		p_u_17:fadeUpdateText(p_u_17.mainFrame.CounterTxt, "Fully Loaded!", 0.6)
	end)
	while not (p_u_17.skipped or p_u_17.finished) do
		task.wait()
	end
	if p_u_17.finished then
		local v18 = v_u_6.isMobile() and "Tap anywhere to play!" or "Press any key to play!"
		p_u_17:fadeUpdateText(p_u_17.mainFrame.PressAnyTxt, v18, 0.6)
	end
	while not p_u_17.skipped do
		task.wait()
	end
	p_u_17:endCounter()
	p_u_17:endTipCycle()
	p_u_17.inputCon:Disconnect()
	workspace.CurrentCamera.FieldOfView = 100
	v_u_5.Change_FOV(70, 3)
	p_u_17:hideFrame()
	p_u_17:stopRotateTween()
	p_u_17:finishedLoading()
end
return v_u_7