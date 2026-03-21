local v1 = game:GetService("Players")
local v2 = game:GetService("ReplicatedStorage")
local v_u_3 = game:GetService("TweenService")
local v4 = v1.LocalPlayer.PlayerGui:WaitForChild("SettingsUI")
local v_u_5 = require(v2.Modules.WaitForDescendant)
local v_u_6 = require(v2.Modules.SetupSounds)
require(v2.Modules.SetupBrightnessAnimationFrame)
require(v2.Modules.SetupHoverAnimations)
local v_u_7 = require(v2.Modules.FindDescendantsWithTag)
local v_u_8 = require(v2.Modules.Settings.SettingsService)
local v_u_9 = v_u_5(v4, "SETTING_INSERTION_POINT")
local v_u_10 = v_u_5(v4, "TOGGLE_SETTING_TEMPLATE")
local v_u_11 = {}
v_u_11.__index = v_u_11
function v_u_11.new()
	-- upvalues: (copy) v_u_11, (copy) v_u_10, (copy) v_u_7, (copy) v_u_5, (copy) v_u_6
	local v12 = v_u_11
	local v_u_13 = setmetatable({}, v12)
	v_u_13.CurrentValue = true
	local v14 = v_u_10:Clone()
	v_u_13.Asset = v14
	local v15 = {}
	v_u_13.UIData = v15
	v15.AllStrokes = v_u_7(v14, "ColorStroke")
	local v16 = v_u_5(v14, "TOGGLE_BUTTON")
	v15.TOGGLE_BUTTON = v16
	v15.TOGGLE_STATE_TEXT = v_u_5(v14, "TOGGLE_STATE_TEXT")
	v15.SETTING_TITLE = v_u_5(v14, "SETTING_TITLE")
	v15.SETTING_DESCRIPTION = v_u_5(v14, "SETTING_DESCRIPTION")
	v15.BACKGROUND_TEXTURE = v_u_5(v14, "BACKGROUND_TEXTURE")
	v_u_6(v16)
	v16:WaitForChild("SENSOR").MouseButton1Click:Connect(function()
		-- upvalues: (copy) v_u_13
		v_u_13:Toggle()
	end)
	return v_u_13
end
function v_u_11.Toggle(p17)
	-- upvalues: (copy) v_u_8
	local v18 = not p17.CurrentValue
	p17:Update(v18)
	local v19 = p17.Id
	if v19 then
		v_u_8:SetSetting(v19, v18)
	end
end
function v_u_11.SetLayoutOrder(p20, p21)
	p20.Asset.LayoutOrder = p21
	return p20
end
function v_u_11.SetId(p22, p23)
	p22.Id = p23
	return p22
end
function v_u_11.Update(p24, p25)
	-- upvalues: (copy) v_u_3
	p24.CurrentValue = p25
	local v26 = p24.CurrentValue
	local v27 = p24.UIData
	local v28 = v27.TOGGLE_STATE_TEXT
	local v29 = v27.AllStrokes
	v28.Text = v26 and "On" or "Off"
	local v30
	if v26 then
		v30 = Color3.fromRGB(30, 100, 14)
	else
		v30 = Color3.fromRGB(118, 4, 7)
	end
	local v31
	if v26 then
		v31 = Color3.fromRGB(37, 238, 38)
	else
		v31 = Color3.fromRGB(206, 27, 24)
	end
	for _, v32 in v29 do
		v_u_3:Create(v32, TweenInfo.new(0.15), {
			["Color"] = v30
		}):Play()
	end
	v_u_3:Create(v27.TOGGLE_BUTTON, TweenInfo.new(0.15), {
		["BackgroundColor3"] = v31
	}):Play()
	return p24
end
function v_u_11.SetDescription(p33, p34)
	p33.UIData.SETTING_DESCRIPTION.Text = p34
	return p33
end
function v_u_11.SetTitle(p35, p36)
	p35.UIData.SETTING_TITLE.Text = p36
	return p35
end
function v_u_11.SetBackgroundImage(p37, p38)
	p37.UIData.BACKGROUND_TEXTURE.Image = p38
	return p37
end
function v_u_11.Complete(p39)
	-- upvalues: (copy) v_u_9
	local v40 = p39.Asset
	v40.Visible = true
	v40.Parent = v_u_9
	return p39
end
return v_u_11