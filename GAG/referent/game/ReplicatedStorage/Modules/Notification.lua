local v_u_1 = game.Players.LocalPlayer:WaitForChild("PlayerGui"):WaitForChild("Top_Notification"):WaitForChild("Frame")
local v_u_2 = game:GetService("TweenService")
local v_u_3 = game.SoundService.Notification
require(game.ReplicatedStorage.Modules.Chalk)
local v_u_4 = require(script.NotificationCondenser)
local v_u_5 = game.ReplicatedStorage.Notification_UI_Mobile
local v_u_6 = game.ReplicatedStorage.Notification_UI
local v_u_7 = require(game.ReplicatedStorage.Modules.Settings.SettingsService)
local v_u_8 = {}
local v_u_9 = {}
local function v_u_14(p10)
	-- upvalues: (copy) v_u_2, (copy) v_u_3
	local v11 = TweenInfo.new(0.25, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)
	local v12 = TweenInfo.new(0.5, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)
	local v13 = {
		["Position"] = p10.TextLabel.Position
	}
	v_u_2:Create(p10.TextLabel, v12, v13):Play()
	v_u_2:Create(p10.ImageLabel, v11, {
		["ImageTransparency"] = 0.5
	}):Play()
	v_u_2:Create(p10.TextLabel, v11, {
		["TextTransparency"] = 0
	}):Play()
	v_u_2:Create(p10.TextLabel, v11, {
		["TextStrokeTransparency"] = 0
	}):Play()
	v_u_3.PlaybackSpeed = 1 + math.random(-15, 15) / 100
	v_u_3.Playing = true
	v_u_3.TimePosition = 0
end
local function v_u_19(p15)
	-- upvalues: (copy) v_u_2
	local v16 = TweenInfo.new(0.25, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)
	local v17 = TweenInfo.new(0.5, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)
	local v18 = p15.TextLabel.Position
	v_u_2:Create(p15.TextLabel, v17, {
		["Position"] = v18 + UDim2.new(0, 0, 0.2, 0)
	}):Play()
	v_u_2:Create(p15.ImageLabel, v16, {
		["ImageTransparency"] = 1
	}):Play()
	v_u_2:Create(p15.TextLabel, v16, {
		["TextTransparency"] = 1
	}):Play()
	v_u_2:Create(p15.TextLabel, v16, {
		["TextStrokeTransparency"] = 1
	}):Play()
	game.Debris:AddItem(p15, v16.Time)
end
local function v_u_25(p20, p21, p22)
	-- upvalues: (copy) v_u_1
	local v23 = p20:Clone()
	v23.TextLabel.Text = p21
	v23:SetAttribute("OG", p21)
	v23:SetAttribute("NotificationTimer", p22)
	local v24 = Instance.new("IntValue")
	v24.Name = "VAL_OBJ"
	v24.Value = 1
	v24.Parent = v23
	local _ = v23.TextLabel.Position
	v23.ImageLabel.ImageTransparency = 1
	v23.TextLabel.TextTransparency = 1
	v23.TextLabel.TextStrokeTransparency = 1
	v23.Parent = v_u_1
	return v23
end
task.spawn(function()
	-- upvalues: (copy) v_u_1, (copy) v_u_19, (copy) v_u_8, (copy) v_u_5, (copy) v_u_6, (copy) v_u_25, (copy) v_u_14
	while true do
		for _, v26 in v_u_1:GetChildren() do
			if v26:IsA("Frame") and (v26.Name == "Notification_UI" or v26.Name == "Notification_UI_Mobile") then
				local v27 = v26:GetAttribute("NotificationTimer")
				if v27 and type(v27) == "number" then
					local v28 = v27 - 1
					if v28 <= 0 then
						v26:SetAttribute("NotificationTimer", nil)
						local v29 = v26:GetAttribute("CondenseKey")
						v_u_19(v26)
						if v29 then
							local v30 = v_u_8[v29] or {}
							if #v30 >= 1 then
								local v31 = v30[1]
								table.remove(v30, 1)
								local v_u_32 = v_u_25(v31.IsMobile and v_u_5 or v_u_6, v31.Text, v31.Duration)
								v_u_32:SetAttribute("CondenseKey", v29)
								task.spawn(function()
									-- upvalues: (ref) v_u_14, (copy) v_u_32
									task.wait(0.4)
									v_u_14(v_u_32)
								end)
							end
						end
					else
						v26:SetAttribute("NotificationTimer", v28)
					end
				end
			end
		end
		task.wait(1)
	end
end)
local function v_u_50(p33, p34, p35, p36)
	-- upvalues: (copy) v_u_7, (copy) v_u_5, (copy) v_u_6, (copy) v_u_4, (copy) v_u_1, (copy) v_u_9, (copy) v_u_8, (copy) v_u_25, (copy) v_u_14
	if not v_u_7:GetSetting("ToggleNotifications") then
		return
	end
	local v37 = p36 or 3.5
	local v38 = p33 and v_u_5 or v_u_6
	local v39 = v_u_4:GetCondenseKey(p34)
	local v40 = nil
	if v39 then
		for _, v41 in ipairs(v_u_1:GetChildren()) do
			if v41:IsA("Frame") and v41:GetAttribute("CondenseKey") == v39.Rule.Key then
				v40 = v41
				break
			end
		end
		if v40 then
			if p33 then
				local v42 = v_u_8[v39.Rule.Key] or {}
				table.insert(v42, {
					["Text"] = p34,
					["Duration"] = v37,
					["IsMobile"] = p33
				})
				v_u_8[v39.Rule.Key] = v42
			else
				local v43 = v_u_9[v40] or {}
				local v44 = {}
				for _, v45 in ipairs(v43) do
					v44[v45.Plain] = true
				end
				if not v44[v39.Variant.Plain] then
					local v46 = v39.Variant
					table.insert(v43, v46)
				end
				v_u_9[v40] = v43
				if #v43 >= 2 then
					v40.TextLabel.RichText = true
					v40.TextLabel.Text = v_u_4:BuildCondensedText(v43, v39.Rule.Suffix, v39.Rule.PluralSuffix)
				end
				v40:SetAttribute("NotificationTimer", v37)
			end
		end
	elseif not p35 then
		for _, v47 in ipairs(v_u_1:GetChildren()) do
			if v47.Name == "Notification_UI" and v47:GetAttribute("OG") == p34 then
				v40 = v47
				break
			end
		end
		if v40 then
			local v48 = v40:FindFirstChild("VAL_OBJ")
			if v48 then
				v48.Value = v48.Value + 1
				v40.TextLabel.Text = p34 .. " [X" .. v48.Value .. "]"
			end
			v40:SetAttribute("NotificationTimer", v37)
			return
		end
	end
	local v49 = v_u_25(v38, p34, v37)
	if v39 then
		v49:SetAttribute("CondenseKey", v39.Rule.Key)
		v_u_9[v49] = { v39.Variant }
	end
	v_u_14(v49)
end
if game:GetService("UserInputService").TouchEnabled then
	game.ReplicatedStorage:WaitForChild("GameEvents").Notification.OnClientEvent:Connect(function(...)
		-- upvalues: (copy) v_u_50
		v_u_50(true, ...)
	end)
else
	game.ReplicatedStorage:WaitForChild("GameEvents").Notification.OnClientEvent:Connect(function(...)
		-- upvalues: (copy) v_u_50
		v_u_50(false, ...)
	end)
end
return {
	["CreateNotification"] = function(_, p51, p52, p53)
		-- upvalues: (copy) v_u_50
		v_u_50(game.UserInputService.TouchEnabled, p51, p52, p53)
	end
}