local v_u_1 = {}
v_u_1.__index = v_u_1
local v_u_2 = game:GetService("Debris")
local v_u_3 = game.ReplicatedStorage
local v_u_4 = game:GetService("TweenService")
local v_u_5 = game.Players.LocalPlayer
require(v_u_3.Modules.GuiController)
local v_u_6 = require(v_u_3.Modules.Utility.utils)
local v_u_7 = require(v_u_3.Field_Of_View_Module)
local v_u_8 = require(v_u_3.Modules.TradeControllers.TradeWorldController)
local v_u_9 = {
	["TextLabel"] = "TextTransparency",
	["ImageLabel"] = "ImageTransparency",
	["UIStroke"] = "Transparency"
}
function v_u_1.new(p10)
	-- upvalues: (copy) v_u_1, (copy) v_u_6
	local v11 = v_u_1
	local v12 = setmetatable({}, v11)
	v12.COUNTER_MAX = 2000
	v12.gui = p10
	v12.counterFinishedEvent = Instance.new("BindableEvent")
	v12.canSkipEvent = Instance.new("BindableEvent")
	v12.hasFiredCanSkip = false
	v12.cCounter = 0
	v12.blockTextTweens = false
	v12.guiCons = {}
	v12.tips = v_u_6.set.new({
		"<font color=\"#FFFF00\">Gold</font> plants are rare, but valuable!",
		"Your garden literally grows while you are <b>offline</b>",
		"The <i>best</i> seeds have a <i>small</i> chance of restocking!",
		"The seed store restocks every 5 minutes!",
		"You can flex your fruits and finds to other people!",
		"<font color=\"#FFFF00\">Private Servers</font> are free for everyone!",
		"Playing with friends makes the game even more fun!",
		"There is a small chance for <font color=\"#FF0000\">r</font><font color=\"#FF7F00\">a</font><font color=\"#FFFF00\">i</font><font color=\"#00FF00\">n</font><font color=\"#0000FF\">b</font><font color=\"#4B0082\">o</font><font color=\"#8B00FF\">w</font> crops!"
	})
	v12.remainingTips = v12.tips:clone()
	return v12
end
function v_u_1.setCam(_)
	-- upvalues: (copy) v_u_8
	workspace.CurrentCamera.CameraType = Enum.CameraType.Scriptable
	if v_u_8:IsInWorld() then
		workspace.CurrentCamera.CFrame = workspace.TradeworldCamPart.CFrame
	else
		workspace.CurrentCamera.CFrame = workspace.LoadingCamPart.CFrame
	end
end
function v_u_1.startTransparentBGfx(p_u_13)
	p_u_13.blur = Instance.new("BlurEffect")
	p_u_13.blur.Name = "LoadingBlur"
	p_u_13.blur.Size = 15
	p_u_13.blur.Parent = game:GetService("Lighting")
	p_u_13:setCam()
	p_u_13.camLockCon = workspace.CurrentCamera:GetPropertyChangedSignal("CameraType"):Connect(function()
		-- upvalues: (copy) p_u_13
		p_u_13:setCam()
	end)
end
function v_u_1.endTransparentBGfx(p14)
	-- upvalues: (copy) v_u_7, (copy) v_u_4, (copy) v_u_2
	workspace.CurrentCamera.FieldOfView = 100
	v_u_7.Change_FOV(70, 3)
	v_u_4:Create(p14.blur, TweenInfo.new(1, Enum.EasingStyle.Linear), {
		["Size"] = 0
	}):Play()
	v_u_2:AddItem(p14.blur, 1)
	p14.camLockCon:Disconnect()
	workspace.CurrentCamera.CameraType = Enum.CameraType.Custom
end
function v_u_1.hideOtherGui(p_u_15, p_u_16)
	if p_u_16.Enabled then
		p_u_15.originalEnabledStates[p_u_16] = p_u_16.Enabled
		p_u_16.Enabled = false
	end
	p_u_15.guiCons[p_u_16] = p_u_16:GetPropertyChangedSignal("Enabled"):Connect(function()
		-- upvalues: (copy) p_u_16, (copy) p_u_15
		if p_u_16.Enabled then
			p_u_15.originalEnabledStates[p_u_16] = p_u_16.Enabled
			p_u_16.Enabled = false
		end
	end)
end
function v_u_1.hideGuis(p_u_17)
	-- upvalues: (copy) v_u_5
	p_u_17.originalEnabledStates = {}
	p_u_17.guiAddedCon = v_u_5.PlayerGui.ChildAdded:Connect(function(p18)
		-- upvalues: (copy) p_u_17
		if p18:IsA("ScreenGui") then
			p_u_17:hideOtherGui(p18)
		end
	end)
	for _, v19 in pairs(v_u_5.PlayerGui:GetChildren()) do
		if v19:IsA("ScreenGui") and v19 ~= p_u_17.gui then
			p_u_17:hideOtherGui(v19)
		end
	end
end
function v_u_1.showGuis(p20)
	for _, v21 in pairs(p20.guiCons) do
		v21:Disconnect()
	end
	p20.guiAddedCon:Disconnect()
	for v22, v23 in pairs(p20.originalEnabledStates) do
		v22.Enabled = v23
	end
end
function v_u_1.startCounter(p_u_24, p_u_25)
	-- upvalues: (copy) v_u_4
	p_u_24.counterIntVal = Instance.new("IntValue")
	local v26 = TweenInfo.new(p_u_25, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut)
	p_u_24.valTween = v_u_4:Create(p_u_24.counterIntVal, v26, {
		["Value"] = p_u_24.COUNTER_MAX
	})
	p_u_24.valTween:Play()
	v_u_4:Create(p_u_24.mainFrame.CounterTxt, TweenInfo.new(0.3, Enum.EasingStyle.Linear), {
		["TextTransparency"] = 0
	}):Play()
	p_u_24.counterListener = p_u_24.counterIntVal.Changed:Connect(function(p27)
		-- upvalues: (copy) p_u_24, (copy) p_u_25
		p_u_24.mainFrame.CounterTxt.Text = "Loading " .. p27 .. "/" .. p_u_24.COUNTER_MAX
		if p_u_24.COUNTER_MAX <= p27 then
			p_u_24.counterFinishedEvent:Fire()
		end
		if p_u_24.canSkipAfter and (p27 / p_u_24.COUNTER_MAX * p_u_25 >= p_u_24.canSkipAfter and not p_u_24.hasFiredCanSkip) then
			p_u_24.hasFiredCanSkip = true
			p_u_24.canSkipEvent:Fire()
		end
	end)
end
function v_u_1.fadeUpdateText(p_u_28, p_u_29, p_u_30, p_u_31)
	-- upvalues: (copy) v_u_4
	task.spawn(function()
		-- upvalues: (copy) p_u_31, (ref) v_u_4, (copy) p_u_29, (copy) p_u_28, (copy) p_u_30
		local v32 = TweenInfo.new(p_u_31 / 2, Enum.EasingStyle.Linear)
		local v33 = v_u_4:Create(p_u_29, v32, {
			["TextTransparency"] = 1
		})
		v33:Play()
		v33.Completed:Wait()
		if not p_u_28.blockTextTweens then
			p_u_29.Text = p_u_30
			v_u_4:Create(p_u_29, v32, {
				["TextTransparency"] = 0
			}):Play()
		end
	end)
end
function v_u_1.endCounter(p34)
	p34.counterListener:Disconnect()
end
function v_u_1.startTipCycle(p_u_35, p_u_36)
	p_u_35.tipTask = task.spawn(function()
		-- upvalues: (copy) p_u_35, (copy) p_u_36
		while true do
			p_u_35:updateTip(true)
			task.wait(p_u_36)
		end
	end)
end
function v_u_1.endTipCycle(p37)
	p37.blockTextTweens = true
	task.cancel(p37.tipTask)
end
function v_u_1.changeAllTransparency(p38, p39, p40, p41)
	-- upvalues: (copy) v_u_9, (copy) v_u_4
	local v42 = TweenInfo.new(p40, Enum.EasingStyle.Linear)
	for _, v43 in pairs(p38.mainFrame:GetDescendants()) do
		local v44 = v_u_9[v43.ClassName]
		if v44 then
			v_u_4:Create(v43, v42, {
				[v44] = p39
			}):Play()
		end
	end
	if p41 then
		task.wait(p40)
	end
end
function v_u_1.updateTip(p45, p46)
	if #p45.remainingTips < 1 then
		p45.remainingTips = p45.tips:clone()
	end
	local v47 = "[" .. p45.remainingTips:popRandom() .. "]"
	if p46 then
		p45:fadeUpdateText(p45.mainFrame.TipLabel, v47, 0.6)
	else
		p45.mainFrame.TipLabel.Text = v47
	end
end
function v_u_1.startRotateTween(p48)
	-- upvalues: (copy) v_u_4
	local v49 = TweenInfo.new(3, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut, (1 / 0), true)
	p48.rotateTween = v_u_4:Create(p48.mainFrame.LogoImg.FruitImg, v49, {
		["Rotation"] = 5
	})
	p48.rotateTween:Play()
end
function v_u_1.stopRotateTween(p50)
	p50.rotateTween:Pause()
end
v_u_5:WaitForChild("PlayerGui"):WaitForChild("Seed_Shop")
function v_u_1.finishedLoading(p51)
	-- upvalues: (copy) v_u_3
	p51.gui.Enabled = false
	v_u_3.GameEvents.Finish_Loading:FireServer()
	table.clear(p51)
	table.freeze(p51)
end
return v_u_1