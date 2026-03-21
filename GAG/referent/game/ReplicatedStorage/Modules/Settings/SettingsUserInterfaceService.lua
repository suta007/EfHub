local v_u_1 = {}
local v2 = game:GetService("Players")
local v3 = game:GetService("ReplicatedStorage")
game:GetService("TweenService")
local v4 = game:GetService("GuiService")
local v_u_5 = v2.LocalPlayer.PlayerGui:WaitForChild("SettingsUI")
local v6 = require(v3.Modules.WaitForDescendant)
local v7 = require(v3.Modules.SetupSounds)
local v8 = require(v3.Modules.SetupBrightnessAnimationFrame)
require(v3.Modules.FindDescendantsWithTag)
local v_u_9 = require(v3.Modules.DataService)
local v_u_10 = require(v3.Data.SettingsRegistry)
local v_u_11 = require(v3.Modules.GuiController)
local v_u_12 = require(script.Classes.BooleanSetting)
local v_u_13 = require(script.Classes.MultipleSetting)
local v_u_14 = require(v3.Modules.Settings.SettingsService)
local v_u_15 = require(v3.Modules.ClaimableCodeService)
local v16 = require(v3.Modules.Icon)
local v_u_17 = {}
local v_u_22 = {
	["Boolean"] = function(p18)
		-- upvalues: (copy) v_u_12, (copy) v_u_17
		local v19 = v_u_12.new():SetTitle(p18.Title):SetDescription(p18.Description):SetBackgroundImage(p18.BackgroundTexture):SetId(p18.Name):SetLayoutOrder(p18.LayoutOrder or 1):Complete()
		v_u_17[p18.Name] = v19
	end,
	["Multiple"] = function(p20)
		-- upvalues: (copy) v_u_13, (copy) v_u_17
		local v21 = v_u_13.new():SetTitle(p20.Title):SetDescription(p20.Description):SetBackgroundImage(p20.BackgroundTexture):SetId(p20.Name):SetLayoutOrder(p20.LayoutOrder or 1):Complete()
		v_u_17[p20.Name] = v21
	end
}
local v_u_23 = v_u_11:GetStateForGui(v_u_5)
task.spawn(function()
	-- upvalues: (copy) v_u_11, (copy) v_u_5
	v_u_11:UsePopupAnims(v_u_5)
end)
function v_u_1.Toggle(_, p24)
	-- upvalues: (copy) v_u_23, (copy) v_u_11, (copy) v_u_5
	if p24 == true then
		if not v_u_23.Visible:Get() then
			v_u_11:Open(v_u_5)
			return
		end
	elseif v_u_23.Visible:Get() then
		v_u_11:Close(v_u_5)
	end
end
function v_u_1.Synchronize(_)
	-- upvalues: (copy) v_u_9, (copy) v_u_10, (copy) v_u_17, (copy) v_u_22, (copy) v_u_14
	local v25 = v_u_9:GetData()
	if v25 then
		local _ = v25.Settings
		for v26, v27 in v_u_10 do
			if not (v27.Disabled or v_u_17[v26]) then
				local v28 = v_u_22[v27.SettingsData.Type]
				if v28 then
					v28(v27)
				end
			end
		end
		for v29, v30 in v_u_10 do
			if not v30.Disabled then
				local v31 = v_u_17[v29]
				if v31 then
					v31:Update((v_u_14:GetSetting(v29)))
				end
			end
		end
	end
end
local v32 = v6(v_u_5, "EXIT_BUTTON")
v7(v32)
v8(v32)
local v33 = v32:WaitForChild("SENSOR")
v_u_1:Synchronize()
v_u_9:GetPathSignal("Settings/@"):Connect(function()
	-- upvalues: (copy) v_u_1
	v_u_1:Synchronize()
end)
local v_u_34 = v16.new()
v_u_34:setImage("rbxassetid://132848201849699")
v_u_34:setName("Settings")
v_u_34:setImageScale(0.8)
v_u_34:setOrder(-6)
v_u_34:setCaption("Toggle Settings")
v_u_34.deselectWhenOtherIconSelected = false
v33.MouseButton1Click:Connect(function()
	-- upvalues: (copy) v_u_34
	v_u_34:deselect()
end)
v_u_34.selected:Connect(function()
	-- upvalues: (copy) v_u_1
	v_u_1:Toggle(true)
end)
v_u_34.deselected:Connect(function()
	-- upvalues: (copy) v_u_1
	v_u_1:Toggle(false)
end)
local v_u_35 = v6(v_u_5, "CODE_INPUT_BOX")
local v36 = v6(v_u_5, "CODE_CLAIM_BUTTON")
v7(v36)
v36.SENSOR.MouseButton1Click:Connect(function()
	-- upvalues: (copy) v_u_15, (copy) v_u_35
	v_u_15:ClaimCode(v_u_35.Text)
end)
local v_u_37 = game.Players.LocalPlayer.PlayerGui.TopbarStandard.Holders.Left.Settings
v4.MenuOpened:Connect(function()
	-- upvalues: (copy) v_u_34, (copy) v_u_37
	v_u_34:deselect()
	v_u_37.Visible = false
end)
v4.MenuClosed:Connect(function()
	-- upvalues: (copy) v_u_37
	v_u_37.Visible = true
end)
return v_u_1