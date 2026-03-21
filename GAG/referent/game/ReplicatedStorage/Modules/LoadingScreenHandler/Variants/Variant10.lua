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
	v9.bgFrame = v9.gui.Variant5Frame
	v9.mainFrame = v9.bgFrame.InnerFrame
	return v9
end
function v_u_5.startBarFill(p_u_10, p_u_11)
	-- upvalues: (copy) v_u_2
	task.spawn(function()
		-- upvalues: (ref) v_u_2, (copy) p_u_10, (copy) p_u_11
		local v12 = TweenInfo.new(0.3, Enum.EasingStyle.Linear)
		v_u_2:Create(p_u_10.mainFrame.LoadingBar, v12, {
			["GroupTransparency"] = 0
		}):Play()
		v_u_2:Create(p_u_10.mainFrame.LoadingBar.UIStroke, v12, {
			["Transparency"] = 0
		}):Play()
		local v13 = p_u_10.mainFrame.LoadingBar.BackFill.AbsoluteSize.X / p_u_11
		local v14 = p_u_10.mainFrame.LoadingBar.UIStroke.Thickness / v13
		local v15 = TweenInfo.new(v14, Enum.EasingStyle.Linear)
		local v16 = v_u_2:Create(p_u_10.mainFrame.LoadingBar.UIStroke.UIGradient, v15, {
			["Offset"] = Vector2.new(-0.495, 0)
		})
		v16:Play()
		v16.Completed:Wait()
		local v17 = TweenInfo.new(p_u_11, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut)
		v_u_2:Create(p_u_10.mainFrame.LoadingBar.FrontFill, v17, {
			["Size"] = UDim2.new(1, 0, 1, 0)
		}):Play()
		local v18 = v_u_2:Create(p_u_10.mainFrame.LoadingBar.UIStroke.UIGradient, v17, {
			["Offset"] = Vector2.new(0.495, 0)
		})
		v18:Play()
		v18.Completed:Wait()
		v_u_2:Create(p_u_10.mainFrame.LoadingBar.UIStroke.UIGradient, v15, {
			["Offset"] = Vector2.new(0.5, 0)
		}):Play()
	end)
end
function v_u_5.revealLogo(p19)
	-- upvalues: (copy) v_u_2
	local v20 = TweenInfo.new(1, Enum.EasingStyle.Linear)
	v_u_2:Create(p19.mainFrame.LogoImg, v20, {
		["ImageTransparency"] = 0
	}):Play()
	v_u_2:Create(p19.mainFrame.LogoImg.FruitImg, v20, {
		["ImageTransparency"] = 0
	}):Play()
	task.wait(1)
end
function v_u_5.hideFrame(p21)
	p21:changeAllTransparency(1, 1, true)
end
function v_u_5.startLoading(p22)
	-- upvalues: (copy) v_u_3
	local v23 = script.dbdbdb:Clone()
	v23.Parent = workspace
	v23.CFrame = workspace.CurrentCamera.CFrame
	print(v23.CFrame)
	p22:startTransparentBGfx()
	p22:hideGuis()
	p22.gui.Enabled = true
	p22.bgFrame.Visible = true
	p22:startRotateTween()
	task.wait(1)
	p22:revealLogo()
	p22:startBarFill(5)
	p22:startTipCycle(7)
	task.wait(0.6)
	p22:startCounter(5)
	p22.counterFinishedEvent.Event:Wait()
	p22:fadeUpdateText(p22.mainFrame.CounterTxt, "<font color=\'#FFFF00\'>[Click Anywhere to Play]</font>", 0.6)
	v_u_3.InputBegan:Wait()
	p22:endTipCycle()
	p22:hideFrame()
	p22:endTransparentBGfx()
	p22:stopRotateTween()
	p22:showGuis()
	p22:finishedLoading()
end
return v_u_5