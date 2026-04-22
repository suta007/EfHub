local v1 = game:GetService("Players")
local v_u_2 = game:GetService("RunService")
local v3 = v1.LocalPlayer
assert(v3, "LocalPlayer is nil")
local _ = game.ReplicatedStorage.GameEvents.ConfirmationPromptOpen
local _ = game.ReplicatedStorage.GameEvents.ConfirmationPromptClose
local _ = game.ReplicatedStorage.GameEvents.ConfirmationPromptUpdateText
local v_u_4 = v3.PlayerGui:WaitForChild("GenericConfirmationPrompt", 30)
local v5 = v_u_4:WaitForChild("Main", 30)
local v_u_6 = v5:WaitForChild("HeaderText", 30)
local v_u_7 = v5:WaitForChild("MiddleText", 30)
local v_u_8 = v5:WaitForChild("FooterText", 30)
local v9 = v5:WaitForChild("Buttons", 30)
local v_u_10 = v9:WaitForChild("Confirm", 30)
local v_u_11 = v9:WaitForChild("Cancel", 30)
local v12 = v5:WaitForChild("HeaderContainer", 30)
local v_u_13 = v12:WaitForChild("Title", 30)
local v_u_14 = v12:WaitForChild("Exit", 30):WaitForChild("ExitButton", 30)
local v_u_15 = {}
local v_u_16 = {}
local v_u_17 = {
	["Prismatic"] = true,
	["Transcendent"] = true
}
local v_u_18 = {}
local function v_u_21()
	-- upvalues: (copy) v_u_15, (copy) v_u_16
	for _, v19 in v_u_15 do
		v19:Disconnect()
	end
	table.clear(v_u_15)
	for _, v20 in v_u_16 do
		v20:Disconnect()
	end
	table.clear(v_u_16)
end
local function v_u_22()
	-- upvalues: (copy) v_u_21, (copy) v_u_4
	v_u_21()
	v_u_4.Enabled = false
end
local function v_u_36(p_u_23, p_u_24)
	-- upvalues: (copy) v_u_17, (copy) v_u_2
	p_u_23.RichText = true
	local v_u_25 = p_u_23.Text
	local v26 = false
	for _, v27 in pairs(p_u_24) do
		if v_u_17[v27] then
			v26 = true
			break
		end
	end
	if v26 then
		local v_u_28 = nil
		v_u_28 = v_u_2.Heartbeat:Connect(function()
			-- upvalues: (copy) p_u_23, (ref) v_u_28, (copy) v_u_25, (copy) p_u_24
			if not p_u_23.Parent then
				v_u_28:Disconnect()
				return
			end
			local v29 = v_u_25
			for v30, v31 in pairs(p_u_24) do
				local v32
				if v31 == "Prismatic" then
					v32 = os.clock() * 0.1 % 1
					::l7::
					local v33 = Color3.fromHSV(v32, 1, 1)
					local v34 = string.format("%02X%02X%02X", v33.R * 255, v33.G * 255, v33.B * 255)
					v29 = v29:gsub(v30:gsub("(%W)", "%%%1"), string.format("<font color=\"#%s\">%s</font>", v34, v30))
				elseif v31 == "Transcendent" then
					local v35 = os.clock() * 1.5
					v32 = math.sin(v35) * 0.03 + 0.72
					goto l7
				end
			end
			p_u_23.Text = v29
		end)
		return v_u_28
	end
end
function v_u_18.Open(_, p37, p38)
	-- upvalues: (copy) v_u_21, (copy) v_u_13, (copy) v_u_6, (copy) v_u_7, (copy) v_u_8, (copy) v_u_36, (copy) v_u_15, (copy) v_u_10, (copy) v_u_11, (copy) v_u_22, (copy) v_u_16, (copy) v_u_14, (copy) v_u_4
	v_u_21()
	local v39 = p37 or {}
	local v_u_40 = p38 or {}
	v_u_13.Text = v39.Title or "Confirmation Prompt"
	v_u_6.Text = v39.Header or "Are you sure?"
	v_u_7.Text = v39.Middle or "Action"
	v_u_8.Text = v39.Footer or "This action is irreversible."
	if v39.AnimatedWords then
		if v39.TextLabel then
			local v41 = v39.TextLabel
			local v42 = v_u_7
			if v41 == "Title" then
				v42 = v_u_13
			elseif v41 == "Header" then
				v42 = v_u_6
			elseif v41 == "Footer" then
				v42 = v_u_8
			end
			local v43 = v_u_36(v42, v39.AnimatedWords)
			local v44 = v_u_15
			table.insert(v44, v43)
		else
			local v45 = v_u_36(v_u_7, v39.AnimatedWords)
			local v46 = v_u_15
			table.insert(v46, v45)
		end
	end
	v_u_10.TextLabel.Text = v39.ConfirmText or "Confirm"
	v_u_11.TextLabel.Text = v39.RejectText or "Cancel"
	v_u_10.Visible = not v39.HideConfirm
	v_u_11.Visible = not v39.HideReject
	if v_u_40.ConfirmEvent then
		local v47 = v_u_15
		local v48 = v_u_10.Activated
		table.insert(v47, v48:Connect(function()
			-- upvalues: (ref) v_u_40
			local v49 = v_u_40.ConfirmEvent
			local v50 = v_u_40.ConfirmEventData or {}
			v49:FireServer(unpack(v50))
		end))
	end
	if v_u_40.ConfirmCallback then
		local v51 = v_u_15
		local v52 = v_u_10.Activated
		table.insert(v51, v52:Connect(function()
			-- upvalues: (ref) v_u_40
			local v53 = v_u_40.ConfirmCallback
			local v54 = v_u_40.ConfirmCallbackData or {}
			v53(unpack(v54))
		end))
	end
	local v55 = v_u_15
	local v56 = v_u_10.Activated
	local function v57()
		-- upvalues: (ref) v_u_22
		task.defer(v_u_22)
	end
	table.insert(v55, v56:Connect(v57))
	if v_u_40.RejectEvent then
		local function v60()
			-- upvalues: (ref) v_u_40
			local v58 = v_u_40.RejectEvent
			local v59 = v_u_40.RejectEventData or {}
			v58:FireServer(unpack(v59))
		end
		local v61 = v_u_16
		local v62 = v_u_14.Activated
		table.insert(v61, v62:Connect(v60))
		local v63 = v_u_16
		local v64 = v_u_11.Activated
		table.insert(v63, v64:Connect(v60))
	end
	if v_u_40.RejectCallback then
		local function v67()
			-- upvalues: (ref) v_u_40
			local v65 = v_u_40.RejectCallback
			local v66 = v_u_40.RejectCallbackData or {}
			v65(unpack(v66))
		end
		local v68 = v_u_16
		local v69 = v_u_14.Activated
		table.insert(v68, v69:Connect(v67))
		local v70 = v_u_16
		local v71 = v_u_11.Activated
		table.insert(v70, v71:Connect(v67))
	end
	v_u_4.Enabled = true
end
function v_u_18.Close(_, p72)
	-- upvalues: (copy) v_u_13, (copy) v_u_21, (copy) v_u_4
	if not p72 or v_u_13.Text == p72 then
		v_u_21()
		v_u_4.Enabled = false
	end
end
function v_u_18.UpdateText(_, p73, p74)
	-- upvalues: (copy) v_u_18, (copy) v_u_13, (copy) v_u_6, (copy) v_u_7, (copy) v_u_8
	if p73 then
		if v_u_18:IsThisOpen(p74 or p73.Title) then
			v_u_13.Text = p73.Title or v_u_13.Text
			v_u_6.Text = p73.Header or v_u_6.Text
			v_u_7.Text = p73.Middle or v_u_7.Text
			v_u_8.Text = p73.Footer or v_u_8.Text
		end
	else
		return
	end
end
function v_u_18.IsThisOpen(_, p75)
	-- upvalues: (copy) v_u_4, (copy) v_u_13
	return v_u_4.Enabled and v_u_13.Text == p75 and true or v_u_4.Enabled
end
v_u_14.Activated:Connect(v_u_22)
v_u_11.Activated:Connect(v_u_22)
return v_u_18