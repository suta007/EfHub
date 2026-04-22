local v_u_1 = game:GetService("UserInputService")
local v2 = {}
local v_u_3 = game.ReplicatedStorage.NPC_UIS.Talk_UI
local v_u_4 = game.ReplicatedStorage.NPC_UIS.Response_UI
local v_u_5 = game.ReplicatedStorage.NPC_UIS.Option_UI
game:GetService("TweenService")
TweenInfo.new(0.2, Enum.EasingStyle.Sine, Enum.EasingDirection.Out, 0, false, 0)
local v_u_6 = game.SoundService.Response_Text
task.wait(1)
function effect(p7, p8, p9)
	-- upvalues: (copy) v_u_6
	local v10 = p7.Text:gsub("<.->", "")
	local v11 = string.len(v10)
	string.len(v10)
	p7.MaxVisibleGraphemes = 0
	local v12 = p9 and game.SoundService.NPC_SFX:FindFirstChild(p9) or game.SoundService.NPC_Text
	if p8 == true then
		while v11 >= 1 do
			task.wait()
			if v12.TimePosition > 0.07 or v12.Playing == false then
				v12.TimePosition = 0
				v12.Playing = true
				v12.PlaybackSpeed = 1 + math.random(-5, 5) / 100
			end
			v11 = v11 - 1
			p7.MaxVisibleGraphemes = p7.MaxVisibleGraphemes + 1
		end
	else
		while v11 >= 1 do
			task.wait()
			if v_u_6.Playing == false then
				v_u_6.Playing = true
				v_u_6.PlaybackSpeed = 1 + math.random(-15, 15) / 100
			end
			v11 = v11 - 1
			p7.MaxVisibleGraphemes = p7.MaxVisibleGraphemes + 1
		end
	end
end
function v2.NpcText(p13, p14, p15, p16, p17)
	-- upvalues: (copy) v_u_3
	local v18 = p13.Head:FindFirstChild(v_u_3.Name)
	if v18 ~= nil then
		if p15 == true then
			for _, v19 in pairs(v18:GetDescendants()) do
				if v19:IsA("LocalScript") or v19:IsA("Script") then
					v19:Destroy()
				end
			end
		end
		v18.TextLabel.Text = p14
		effect(v18.TextLabel, true, p13.Name)
		if p15 == true then
			for _, v20 in pairs(v_u_3:GetDescendants()) do
				if v20:IsA("LocalScript") or v20:IsA("Script") then
					for _, v21 in pairs(v18:GetDescendants()) do
						if v21.Name == v20.Parent.Name then
							local v22 = v20:Clone()
							v22.Parent = v21
							v22.Enabled = true
						end
					end
				end
			end
		end
		return v18
	end
	local v23 = v_u_3:Clone()
	v23.Parent = p13.Head
	v23.TextLabel.Text = p14
	if p16 then
		v23.Size = UDim2.fromScale(v23.Size.X.Scale * p16, v23.Size.Y.Scale * p16)
	end
	if p17 then
		v23.StudsOffset = v23.StudsOffset + p17
	end
	effect(v23.TextLabel, true, p13.Name)
	if p15 == true then
		for _, v24 in pairs(v23:GetDescendants()) do
			if v24:IsA("LocalScript") or v24:IsA("Script") then
				v24.Enabled = true
			end
		end
	end
	return v23
end
local v_u_25 = {}
function v2.TakeAwayNPCText(p26)
	-- upvalues: (copy) v_u_3
	if p26 ~= nil then
		local v27 = p26.Head:FindFirstChild(v_u_3.Name)
		if v27 then
			v27:Destroy()
		end
	end
end
local v_u_28 = game:GetService("TweenService")
function v2.ShowChoices(p29, p30)
	-- upvalues: (copy) v_u_25, (copy) v_u_5, (copy) v_u_1, (copy) v_u_28
	if v_u_25[p29] then
		v_u_25[p29].Cancelled = true
	end
	local v31 = {
		["Cancelled"] = false
	}
	v_u_25[p29] = v31
	local v32 = 0
	local v33 = {}
	for _, v34 in pairs(p30) do
		if v31.Cancelled then
			break
		end
		v32 = v32 + 1
		local v35 = v_u_5:Clone()
		v35.Frame.Frame.Text_Element.Text = "[\"" .. v34 .. "\"]"
		v35.Frame.Frame.TextLabel.Text = "#" .. tostring(v32)
		if v_u_1.PreferredInput == Enum.PreferredInput.Touch then
			local v36 = Instance.new("UIScale")
			v36.Scale = 1.3
			v36.Parent = v35
		end
		v35.Parent = p29.PlayerGui.Billboard_UI.Objects
		local v37 = v35.Frame.Frame.Text_Element.UIPadding
		local v38 = TweenInfo.new(0.5, Enum.EasingStyle.Sine, Enum.EasingDirection.Out)
		v37.PaddingLeft = UDim.new(string.len(v34) * 0.001 + 0.04, 0)
		local v39 = v_u_28:Create(v37, v38, {
			["PaddingLeft"] = UDim.new(0, 0)
		})
		v39:Play()
		game.Debris:AddItem(v39, v38.Time)
		table.insert(v33, v35)
		v35.Frame.Frame.Text_Element:SetAttribute("Text", v34)
		task.wait(0.075)
	end
	if not v31.Cancelled and v33[1] then
		game:GetService("GamepadService"):EnableGamepadCursor(v33[1])
	end
	return v33
end
function v2.TakeAwayResponses(p40, p41)
	-- upvalues: (copy) v_u_25, (copy) v_u_28
	if v_u_25[p41] then
		v_u_25[p41].Cancelled = true
	end
	for _, v42 in pairs(p41.PlayerGui.Billboard_UI.Objects:GetChildren()) do
		if v42.Name ~= "UIListLayout" then
			v42:Destroy()
		end
	end
	if p40 and p40:FindFirstChild("Head") then
		for _, v43 in pairs(p40.Head:GetChildren()) do
			if v43:IsA("BillboardGui") and (v43.Name == "Response_UI" or v43.Name == "Talk_UI") then
				for _, v44 in pairs(v43:GetChildren()) do
					if v44:IsA("TextLabel") then
						v_u_28:Create(v44, TweenInfo.new(0.25), {
							["TextTransparency"] = 1
						}):Play()
					elseif v44:IsA("ImageLabel") then
						v_u_28:Create(v44, TweenInfo.new(0.25), {
							["ImageTransparency"] = 1
						}):Play()
					end
				end
				game.Debris:AddItem(v43, 0.25)
			end
		end
	end
end
function v2.RemovePlayerSideFrame(p45)
	-- upvalues: (copy) v_u_25
	if v_u_25[p45] then
		v_u_25[p45].Cancelled = true
	end
	for _, v46 in pairs(p45.PlayerGui.Billboard_UI.Objects:GetChildren()) do
		if v46.Name ~= "UIListLayout" then
			v46:Destroy()
		end
	end
	game:GetService("GamepadService"):DisableGamepadCursor()
end
function v2.ShowResponse(p47, p48, p49)
	-- upvalues: (copy) v_u_3
	local v50 = p47.Head:FindFirstChild(v_u_3.Name)
	if v50 ~= nil then
		if p49 == true then
			for _, v51 in pairs(v50:GetDescendants()) do
				if v51:IsA("LocalScript") or v51:IsA("Script") then
					v51:Destroy()
				end
			end
		end
		v50.TextLabel.Text = p48
		effect(v50.TextLabel, true)
		if p49 == true then
			for _, v52 in pairs(v_u_3:GetDescendants()) do
				if v52:IsA("LocalScript") or v52:IsA("Script") then
					for _, v53 in pairs(v50:GetDescendants()) do
						if v53.Name == v52.Parent.Name then
							v52.Enabled = false
							local v54 = v52:Clone()
							v54.Parent = v53
							v54.Enabled = true
						end
					end
				end
			end
		end
		return v50
	end
	local v55 = v_u_3:Clone()
	v55.Parent = p47.Head
	v55.TextLabel.Text = p48
	effect(v55.TextLabel, true)
	if p49 == true then
		for _, v56 in pairs(v55:GetDescendants()) do
			if v56:IsA("LocalScript") or v56:IsA("Script") then
				v56.Enabled = true
			end
		end
	end
	return v55
end
function v2.PlayerResponse(p57, p58, p59)
	-- upvalues: (copy) v_u_3, (copy) v_u_4
	if p58 ~= nil then
		local v60 = p57.Head:FindFirstChild(v_u_3.Name)
		if v60 ~= nil then
			if p59 == true then
				for _, v61 in pairs(v60:GetDescendants()) do
					if v61:IsA("LocalScript") or v61:IsA("Script") then
						v61:Destroy()
					end
				end
			end
			v60.TextLabel.Text = p58
			effect(v60.TextLabel, false)
			if p59 == true then
				for _, v62 in pairs(v_u_4:GetDescendants()) do
					if v62:IsA("LocalScript") or v62:IsA("Script") then
						for _, v63 in pairs(v60:GetDescendants()) do
							if v63.Name == v62.Parent.Name then
								v62.Enabled = false
								local v64 = v62:Clone()
								v64.Parent = v63
								v64.Enabled = true
							end
						end
					end
				end
			end
			return v60
		end
		local v65 = v_u_4:Clone()
		v65.Parent = p57.Head
		v65.TextLabel.Text = p58
		effect(v65.TextLabel, false)
		if p59 == true then
			for _, v66 in pairs(v65:GetDescendants()) do
				if v66:IsA("LocalScript") or v66:IsA("Script") then
					v66.Enabled = true
				end
			end
		end
		return v65
	end
end
return v2