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
function v2.NpcText(p13, p14, p15)
	-- upvalues: (copy) v_u_3
	local v16 = p13.Head:FindFirstChild(v_u_3.Name)
	if v16 ~= nil then
		if p15 == true then
			for _, v17 in pairs(v16:GetDescendants()) do
				if v17:IsA("LocalScript") or v17:IsA("Script") then
					v17:Destroy()
				end
			end
		end
		v16.TextLabel.Text = p14
		effect(v16.TextLabel, true, p13.Name)
		if p15 == true then
			for _, v18 in pairs(v_u_3:GetDescendants()) do
				if v18:IsA("LocalScript") or v18:IsA("Script") then
					for _, v19 in pairs(v16:GetDescendants()) do
						if v19.Name == v18.Parent.Name then
							local v20 = v18:Clone()
							v20.Parent = v19
							v20.Enabled = true
						end
					end
				end
			end
		end
		return v16
	end
	local v21 = v_u_3:Clone()
	v21.Parent = p13.Head
	v21.TextLabel.Text = p14
	effect(v21.TextLabel, true, p13.Name)
	if p15 == true then
		for _, v22 in pairs(v21:GetDescendants()) do
			if v22:IsA("LocalScript") or v22:IsA("Script") then
				v22.Enabled = true
			end
		end
	end
	return v21
end
local v_u_23 = {}
function v2.TakeAwayNPCText(p24)
	-- upvalues: (copy) v_u_3
	if p24 ~= nil then
		local v25 = p24.Head:FindFirstChild(v_u_3.Name)
		if v25 then
			v25:Destroy()
		end
	end
end
local v_u_26 = game:GetService("TweenService")
function v2.ShowChoices(p27, p28)
	-- upvalues: (copy) v_u_23, (copy) v_u_5, (copy) v_u_1, (copy) v_u_26
	if v_u_23[p27] then
		v_u_23[p27].Cancelled = true
	end
	local v29 = {
		["Cancelled"] = false
	}
	v_u_23[p27] = v29
	local v30 = 0
	local v31 = {}
	for _, v32 in pairs(p28) do
		if v29.Cancelled then
			break
		end
		v30 = v30 + 1
		local v33 = v_u_5:Clone()
		v33.Frame.Frame.Text_Element.Text = "[\"" .. v32 .. "\"]"
		v33.Frame.Frame.TextLabel.Text = "#" .. tostring(v30)
		if v_u_1.PreferredInput == Enum.PreferredInput.Touch then
			local v34 = Instance.new("UIScale")
			v34.Scale = 1.3
			v34.Parent = v33
		end
		v33.Parent = p27.PlayerGui.Billboard_UI.Objects
		local v35 = v33.Frame.Frame.Text_Element.UIPadding
		local v36 = TweenInfo.new(0.5, Enum.EasingStyle.Sine, Enum.EasingDirection.Out)
		v35.PaddingLeft = UDim.new(string.len(v32) * 0.001 + 0.04, 0)
		local v37 = v_u_26:Create(v35, v36, {
			["PaddingLeft"] = UDim.new(0, 0)
		})
		v37:Play()
		game.Debris:AddItem(v37, v36.Time)
		table.insert(v31, v33)
		v33.Frame.Frame.Text_Element:SetAttribute("Text", v32)
		task.wait(0.075)
	end
	if not v29.Cancelled and v31[1] then
		game:GetService("GamepadService"):EnableGamepadCursor(v31[1])
	end
	return v31
end
function v2.TakeAwayResponses(p38, p39)
	-- upvalues: (copy) v_u_23, (copy) v_u_26
	if v_u_23[p39] then
		v_u_23[p39].Cancelled = true
	end
	for _, v40 in pairs(p39.PlayerGui.Billboard_UI.Objects:GetChildren()) do
		if v40.Name ~= "UIListLayout" then
			v40:Destroy()
		end
	end
	if p38 and p38:FindFirstChild("Head") then
		for _, v41 in pairs(p38.Head:GetChildren()) do
			if v41:IsA("BillboardGui") and (v41.Name == "Response_UI" or v41.Name == "Talk_UI") then
				for _, v42 in pairs(v41:GetChildren()) do
					if v42:IsA("TextLabel") then
						v_u_26:Create(v42, TweenInfo.new(0.25), {
							["TextTransparency"] = 1
						}):Play()
					elseif v42:IsA("ImageLabel") then
						v_u_26:Create(v42, TweenInfo.new(0.25), {
							["ImageTransparency"] = 1
						}):Play()
					end
				end
				game.Debris:AddItem(v41, 0.25)
			end
		end
	end
end
function v2.RemovePlayerSideFrame(p43)
	-- upvalues: (copy) v_u_23
	if v_u_23[p43] then
		v_u_23[p43].Cancelled = true
	end
	for _, v44 in pairs(p43.PlayerGui.Billboard_UI.Objects:GetChildren()) do
		if v44.Name ~= "UIListLayout" then
			v44:Destroy()
		end
	end
	game:GetService("GamepadService"):DisableGamepadCursor()
end
function v2.ShowResponse(p45, p46, p47)
	-- upvalues: (copy) v_u_3
	local v48 = p45.Head:FindFirstChild(v_u_3.Name)
	if v48 ~= nil then
		if p47 == true then
			for _, v49 in pairs(v48:GetDescendants()) do
				if v49:IsA("LocalScript") or v49:IsA("Script") then
					v49:Destroy()
				end
			end
		end
		v48.TextLabel.Text = p46
		effect(v48.TextLabel, true)
		if p47 == true then
			for _, v50 in pairs(v_u_3:GetDescendants()) do
				if v50:IsA("LocalScript") or v50:IsA("Script") then
					for _, v51 in pairs(v48:GetDescendants()) do
						if v51.Name == v50.Parent.Name then
							v50.Enabled = false
							local v52 = v50:Clone()
							v52.Parent = v51
							v52.Enabled = true
						end
					end
				end
			end
		end
		return v48
	end
	local v53 = v_u_3:Clone()
	v53.Parent = p45.Head
	v53.TextLabel.Text = p46
	effect(v53.TextLabel, true)
	if p47 == true then
		for _, v54 in pairs(v53:GetDescendants()) do
			if v54:IsA("LocalScript") or v54:IsA("Script") then
				v54.Enabled = true
			end
		end
	end
	return v53
end
function v2.PlayerResponse(p55, p56, p57)
	-- upvalues: (copy) v_u_3, (copy) v_u_4
	if p56 ~= nil then
		local v58 = p55.Head:FindFirstChild(v_u_3.Name)
		if v58 ~= nil then
			if p57 == true then
				for _, v59 in pairs(v58:GetDescendants()) do
					if v59:IsA("LocalScript") or v59:IsA("Script") then
						v59:Destroy()
					end
				end
			end
			v58.TextLabel.Text = p56
			effect(v58.TextLabel, false)
			if p57 == true then
				for _, v60 in pairs(v_u_4:GetDescendants()) do
					if v60:IsA("LocalScript") or v60:IsA("Script") then
						for _, v61 in pairs(v58:GetDescendants()) do
							if v61.Name == v60.Parent.Name then
								v60.Enabled = false
								local v62 = v60:Clone()
								v62.Parent = v61
								v62.Enabled = true
							end
						end
					end
				end
			end
			return v58
		end
		local v63 = v_u_4:Clone()
		v63.Parent = p55.Head
		v63.TextLabel.Text = p56
		effect(v63.TextLabel, false)
		if p57 == true then
			for _, v64 in pairs(v63:GetDescendants()) do
				if v64:IsA("LocalScript") or v64:IsA("Script") then
					v64.Enabled = true
				end
			end
		end
		return v63
	end
end
return v2