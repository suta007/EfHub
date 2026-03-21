local v1 = game:GetService("Players")
local v_u_2 = game:GetService("RunService")
local v3 = v1.LocalPlayer
local _ = game.ReplicatedStorage.GameEvents.ConfirmationPromptOpen
local _ = game.ReplicatedStorage.GameEvents.ConfirmationPromptClose
local _ = game.ReplicatedStorage.GameEvents.ConfirmationPromptUpdateText
local v_u_4 = v3.PlayerGui:WaitForChild("GenericConfirmationPrompt", 30)
local v5 = v_u_4:WaitForChild("Main", 30)
local v_u_6 = v5:WaitForChild("HeaderText", 30)
local v_u_7 = v5:WaitForChild("MiddleText", 30)
local v_u_8 = v5:WaitForChild("FooterText", 30)
local v_u_9 = v5:WaitForChild("Confirm", 30)
local v_u_10 = v5:WaitForChild("Cancel", 30)
local v11 = v5:WaitForChild("HeaderContainer", 30)
local v_u_12 = v11:WaitForChild("Title", 30)
local v_u_13 = v11:WaitForChild("Exit", 30):WaitForChild("ExitButton", 30)
local v_u_14 = {}
local v_u_15 = {}
local v_u_16 = {
	["Prismatic"] = true,
	["Transcendent"] = true
}
local v_u_17 = {}
local function v_u_20()
	-- upvalues: (copy) v_u_14, (copy) v_u_15
	for _, v18 in v_u_14 do
		v18:Disconnect()
	end
	table.clear(v_u_14)
	for _, v19 in v_u_15 do
		v19:Disconnect()
	end
	table.clear(v_u_15)
end
local function v_u_21()
	-- upvalues: (copy) v_u_20, (copy) v_u_4
	v_u_20()
	v_u_4.Enabled = false
end
local function v_u_35(p_u_22, p_u_23)
	-- upvalues: (copy) v_u_16, (copy) v_u_2
	p_u_22.RichText = true
	local v_u_24 = p_u_22.Text
	local v25 = false
	for _, v26 in pairs(p_u_23) do
		if v_u_16[v26] then
			v25 = true
			break
		end
	end
	if v25 then
		local v_u_27 = nil
		v_u_27 = v_u_2.Heartbeat:Connect(function()
			-- upvalues: (copy) p_u_22, (ref) v_u_27, (copy) v_u_24, (copy) p_u_23
			if not p_u_22.Parent then
				v_u_27:Disconnect()
				return
			end
			local v28 = v_u_24
			for v29, v30 in pairs(p_u_23) do
				local v31
				if v30 == "Prismatic" then
					v31 = os.clock() * 0.1 % 1
					::l7::
					local v32 = Color3.fromHSV(v31, 1, 1)
					local v33 = string.format("%02X%02X%02X", v32.R * 255, v32.G * 255, v32.B * 255)
					v28 = v28:gsub(v29:gsub("(%W)", "%%%1"), string.format("<font color=\"#%s\">%s</font>", v33, v29))
				elseif v30 == "Transcendent" then
					local v34 = os.clock() * 1.5
					v31 = math.sin(v34) * 0.03 + 0.72
					goto l7
				end
			end
			p_u_22.Text = v28
		end)
		return v_u_27
	end
end
function v_u_17.Open(_, p36, p_u_37)
	-- upvalues: (copy) v_u_20, (copy) v_u_12, (copy) v_u_6, (copy) v_u_7, (copy) v_u_8, (copy) v_u_35, (copy) v_u_14, (copy) v_u_9, (copy) v_u_21, (copy) v_u_15, (copy) v_u_13, (copy) v_u_10, (copy) v_u_4
	v_u_20()
	v_u_12.Text = p36.Title or "Confirmation Prompt"
	v_u_6.Text = p36.Header or "Are you sure?"
	v_u_7.Text = p36.Middle or "Action"
	v_u_8.Text = p36.Footer or "This action is irreversible."
	if p36.AnimatedWords then
		if p36.TextLabel then
			local v38 = p36.TextLabel
			local v39 = v_u_7
			if v38 == "Title" then
				v39 = v_u_12
			elseif v38 == "Header" then
				v39 = v_u_6
			elseif v38 == "Footer" then
				v39 = v_u_8
			end
			local v40 = v_u_35(v39, p36.AnimatedWords)
			local v41 = v_u_14
			table.insert(v41, v40)
		else
			local v42 = v_u_35(v_u_7, p36.AnimatedWords)
			local v43 = v_u_14
			table.insert(v43, v42)
		end
	end
	if p_u_37.ConfirmEvent then
		local v44 = v_u_14
		local v45 = v_u_9.Activated
		table.insert(v44, v45:Connect(function()
			-- upvalues: (copy) p_u_37
			local v46 = p_u_37.ConfirmEvent
			local v47 = p_u_37.ConfirmEventData or {}
			v46:FireServer(unpack(v47))
		end))
	end
	if p_u_37.ConfirmCallback then
		local v48 = v_u_14
		local v49 = v_u_9.Activated
		table.insert(v48, v49:Connect(function()
			-- upvalues: (copy) p_u_37
			local v50 = p_u_37.ConfirmCallback
			local v51 = p_u_37.ConfirmCallbackData or {}
			v50(unpack(v51))
		end))
	end
	local v52 = v_u_14
	local v53 = v_u_9.Activated
	local function v54()
		-- upvalues: (ref) v_u_21
		task.defer(v_u_21)
	end
	table.insert(v52, v53:Connect(v54))
	if p_u_37.RejectEvent then
		local function v57()
			-- upvalues: (copy) p_u_37
			local v55 = p_u_37.RejectEvent
			local v56 = p_u_37.RejectEventData or {}
			v55:FireServer(unpack(v56))
		end
		local v58 = v_u_15
		local v59 = v_u_13.Activated
		table.insert(v58, v59:Connect(v57))
		local v60 = v_u_15
		local v61 = v_u_10.Activated
		table.insert(v60, v61:Connect(v57))
	end
	if p_u_37.RejectCallback then
		local function v64()
			-- upvalues: (copy) p_u_37
			local v62 = p_u_37.RejectCallback
			local v63 = p_u_37.RejectCallbackData or {}
			v62(unpack(v63))
		end
		local v65 = v_u_15
		local v66 = v_u_13.Activated
		table.insert(v65, v66:Connect(v64))
		local v67 = v_u_15
		local v68 = v_u_10.Activated
		table.insert(v67, v68:Connect(v64))
	end
	v_u_4.Enabled = true
end
function v_u_17.Close(_, p69)
	-- upvalues: (copy) v_u_12, (copy) v_u_20, (copy) v_u_4
	if not p69 or v_u_12.Text == p69 then
		v_u_20()
		v_u_4.Enabled = false
	end
end
function v_u_17.UpdateText(_, p70, p71)
	-- upvalues: (copy) v_u_17, (copy) v_u_12, (copy) v_u_6, (copy) v_u_7, (copy) v_u_8
	if p70 then
		if v_u_17:IsThisOpen(p71 or p70.Title) then
			v_u_12.Text = p70.Title or v_u_12.Text
			v_u_6.Text = p70.Header or v_u_6.Text
			v_u_7.Text = p70.Middle or v_u_7.Text
			v_u_8.Text = p70.Footer or v_u_8.Text
		end
	else
		return
	end
end
function v_u_17.IsThisOpen(_, p72)
	-- upvalues: (copy) v_u_4, (copy) v_u_12
	return v_u_4.Enabled and v_u_12.Text == p72 and true or v_u_4.Enabled
end
v_u_13.Activated:Connect(v_u_21)
v_u_10.Activated:Connect(v_u_21)
return v_u_17