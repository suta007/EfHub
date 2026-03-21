local v1 = game:GetService("Players")
local v2 = game:GetService("ReplicatedStorage")
local v3 = v1.LocalPlayer:WaitForChild("PlayerGui"):WaitForChild("SettingsUI")
local v_u_4 = require(v2.Modules.WaitForDescendant)
local v_u_5 = require(v2.Modules.SetupSounds)
require(v2.Modules.SetupHoverAnimations)
local v_u_6 = require(v2.Modules.FindDescendantsWithTag)
local v_u_7 = require(v2.Modules.Settings.SettingsService)
local v_u_8 = v_u_4(v3, "SETTING_INSERTION_POINT")
local v_u_9 = v_u_4(v3, "MULTIPLE_SETTING_TEMPLATE")
local v_u_10 = {}
v_u_10.__index = v_u_10
function v_u_10.new()
	-- upvalues: (copy) v_u_10, (copy) v_u_9, (copy) v_u_6, (copy) v_u_4, (copy) v_u_5
	local v11 = v_u_10
	local v_u_12 = setmetatable({}, v11)
	local v13 = v_u_9:Clone()
	v_u_12.Asset = v13
	v_u_12.CurrentValue = "All"
	local v14 = {}
	v_u_12.UIData = v14
	v14.AllStrokes = v_u_6(v13, "ColorStroke")
	v14.NONE_BUTTON = v_u_4(v13, "NONE_BUTTON")
	v14.LESS_BUTTON = v_u_4(v13, "LESS_BUTTON")
	v14.ALL_BUTTON = v_u_4(v13, "ALL_BUTTON")
	v14.SETTING_TITLE = v_u_4(v13, "SETTING_TITLE")
	v14.SETTING_DESCRIPTION = v_u_4(v13, "SETTING_DESCRIPTION")
	v14.BACKGROUND_TEXTURE = v_u_4(v13, "BACKGROUND_TEXTURE")
	for _, v15 in pairs({ v14.NONE_BUTTON, v14.LESS_BUTTON, v14.ALL_BUTTON }) do
		v_u_5(v15)
	end
	v14.NONE_BUTTON.SENSOR.MouseButton1Click:Connect(function()
		-- upvalues: (copy) v_u_12
		v_u_12:Set("None")
	end)
	v14.LESS_BUTTON.SENSOR.MouseButton1Click:Connect(function()
		-- upvalues: (copy) v_u_12
		v_u_12:Set("Less")
	end)
	v14.ALL_BUTTON.SENSOR.MouseButton1Click:Connect(function()
		-- upvalues: (copy) v_u_12
		v_u_12:Set("All")
	end)
	return v_u_12
end
function v_u_10.Set(p16, p17)
	-- upvalues: (copy) v_u_7
	if p16.CurrentValue ~= p17 then
		p16.CurrentValue = p17
		local v18 = p16.UIData
		for v19, v20 in {
			["None"] = v18.NONE_BUTTON,
			["Less"] = v18.LESS_BUTTON,
			["All"] = v18.ALL_BUTTON
		} do
			v20.BackgroundTransparency = v19 == p17 and 0 or 0.8
		end
		if p16.Id then
			v_u_7:SetSetting(p16.Id, p17)
		end
	end
end
function v_u_10.SetId(p21, p22)
	p21.Id = p22
	return p21
end
function v_u_10.Update(p23, p24)
	p23:Set(p24)
	return p23
end
function v_u_10.SetDescription(p25, p26)
	p25.UIData.SETTING_DESCRIPTION.Text = p26
	return p25
end
function v_u_10.SetTitle(p27, p28)
	p27.UIData.SETTING_TITLE.Text = p28
	return p27
end
function v_u_10.SetBackgroundImage(p29, p30)
	p29.UIData.BACKGROUND_TEXTURE.Image = p30
	return p29
end
function v_u_10.SetLayoutOrder(p31, p32)
	p31.Asset.LayoutOrder = p32
	return p31
end
function v_u_10.Complete(p33)
	-- upvalues: (copy) v_u_8
	local v34 = p33.Asset
	v34.Visible = true
	v34.Parent = v_u_8
	return p33
end
return v_u_10