local v1 = game:GetService("ReplicatedStorage")
local v2 = game:GetService("Players")
local v_u_3 = require(v1.Modules.GuiController)
local v_u_4 = require(v1.Modules.Notification)
local v5 = require(v1.Data.SeasonPass.SeasonPassStaticData)
local v_u_6 = require(v1.Modules.DataService)
local v_u_7 = require(v1.Modules.PlayClickSound)
local v8 = v1.GameEvents
local v_u_9 = v8.TradeEvents.SetPin
local v_u_10 = v8.TradeEvents.DisablePin
local v11 = v8.TradeEvents.RequestPin
local v_u_12 = v8.TradeEvents.ReplyPinRequest
local v_u_13 = v5.ButtonColors
local v14 = (v2.LocalPlayer or v2.PlayerAdded:Wait()).PlayerGui
local v_u_15 = v1.Modules.TradeTokens.Templates.PhraseTemplate
local v_u_16 = v14.TradingPin
local v_u_17 = v_u_16.TradingPinPadCreate
local v_u_18 = v_u_16.TradingPinPadInput
local v_u_19 = v_u_16.RecoveryPhraseDisplay
local v_u_20 = v_u_16.RecoveryPhraseInput
local v_u_21 = v_u_16.ResetOptions
local v_u_22 = ""
local v_u_23 = nil
local v_u_24 = nil
local v_u_25 = nil
local v_u_26 = false
local v27 = {}
local function v_u_30(p28)
	-- upvalues: (copy) v_u_16
	for _, v29 in v_u_16:GetChildren() do
		if not v29:IsA("UILayout") and v29.Name ~= "BlackBG" then
			v29.Visible = false
		end
	end
	p28.Visible = true
end
local function v_u_34(p31, p32)
	-- upvalues: (copy) v_u_6
	local v33 = v_u_6:GetData()
	if v33 then
		if v33.TradeData.Pin[p32] then
			p31.Text = ("You have <font color=\"rgb(255, 17, 17)\">(%*)</font> attempts remaining today"):format(v33.TradeData.Pin[p32].Attempts or -1)
		else
			warn((("No attempt type with name %*"):format(p32)))
		end
	else
		warn("TradingPinController/OpenPinInput | No player data")
		return
	end
end
local function v_u_43(p35, p36)
	-- upvalues: (copy) v_u_13
	p35.Interactable = p36 and true or false
	local v37
	if p36 then
		v37 = v_u_13.Green.Background
	else
		v37 = v_u_13.Gray.Background
	end
	p35.BackgroundColor3 = v37
	local v38 = p35:FindFirstChild("UIStroke")
	if v38 then
		local v39
		if p36 then
			v39 = v_u_13.Green.ButtonStroke
		else
			v39 = v_u_13.Gray.ButtonStroke
		end
		v38.Color = v39
	end
	local v40 = p35:FindFirstChild("Label")
	local v41 = v40 and v40:FindFirstChild("UIStroke")
	if v41 then
		local v42
		if p36 then
			v42 = v_u_13.Green.TextStroke
		else
			v42 = v_u_13.Gray.TextStroke
		end
		v41.Color = v42
	end
end
local function v_u_49(p44)
	-- upvalues: (ref) v_u_26, (copy) v_u_19, (copy) v_u_15, (copy) v_u_30
	v_u_26 = false
	for _, v45 in v_u_19.RecoveryPhraseFrame:GetChildren() do
		if v45:IsA("ImageButton") then
			v45:Destroy()
		end
	end
	local v46 = 1
	for _, v47 in p44 do
		local v48 = v_u_15:Clone()
		v48.Label.Text = ("%*. %*"):format(v46, v47)
		v48.LayoutOrder = v46
		v48.Name = ("Phrase%*"):format(v46)
		v48.Parent = v_u_19.RecoveryPhraseFrame
		v46 = v46 + 1
	end
	v_u_19.Checkbox.Checkmark.Visible = false
	v_u_30(v_u_19)
end
local function v_u_51()
	-- upvalues: (copy) v_u_20, (copy) v_u_34, (copy) v_u_30
	v_u_34(v_u_20.Attempts, "Disable")
	for _, v50 in v_u_20.PhraseInputFrame:GetChildren() do
		if v50:IsA("ImageButton") then
			v50:FindFirstChild("TextBox").Text = ""
		end
	end
	v_u_30(v_u_20)
end
local function v_u_59(p_u_52, p_u_53)
	-- upvalues: (copy) v_u_18, (ref) v_u_24, (ref) v_u_23, (ref) v_u_25, (ref) v_u_22, (copy) v_u_30, (copy) v_u_34, (copy) v_u_3, (copy) v_u_16, (copy) v_u_12
	local v54 = v_u_18.Attempts
	local v55 = {
		["RequestUUID"] = p_u_52
	}
	v_u_24 = "Trade"
	v_u_23 = v55.PrevGui
	v_u_25 = v55.RequestUUID
	v_u_18.Header.Title.Text = v_u_24 == "Trade" and "Trading Pin <font color=\"#ff2929\">(5.0s)</font>" or "Trading Pin"
	v_u_22 = ""
	v_u_18.Input_Box.Input.Text = ("%*"):format(v_u_22)
	v_u_30(v_u_18)
	v_u_34(v54, "Match")
	v_u_3:Open(v_u_16)
	task.spawn(function()
		-- upvalues: (ref) v_u_18, (copy) p_u_53, (ref) v_u_16, (ref) v_u_3, (ref) v_u_12, (copy) p_u_52
		local v56 = v_u_18.Header.Title
		local v57 = p_u_53
		while v57 > 0 and v_u_16.Enabled do
			local v58 = v57 * 10 / 10
			v56.Text = ("Trading Pin <font color=\"#ff2929\">(%*s)</font>"):format((math.round(v58)))
			task.wait(0.1)
			v57 = v57 - 0.1
		end
		v_u_3:Close(v_u_16)
		if v57 <= 0 then
			v_u_12:InvokeServer(p_u_52, false)
		end
	end)
end
local function v_u_70()
	-- upvalues: (copy) v_u_20, (copy) v_u_7, (ref) v_u_23, (copy) v_u_3, (copy) v_u_16, (copy) v_u_4, (copy) v_u_10, (copy) v_u_34
	v_u_20.Close.Activated:Connect(function()
		-- upvalues: (ref) v_u_7, (ref) v_u_23, (ref) v_u_3, (ref) v_u_16
		v_u_7()
		local v60 = v_u_23
		v_u_3:Close(v_u_16)
		if v60 then
			v_u_3:Open(v60)
		end
	end)
	v_u_20.Confirm.Activated:Connect(function()
		-- upvalues: (ref) v_u_7, (ref) v_u_20, (ref) v_u_4, (ref) v_u_10, (ref) v_u_34, (ref) v_u_23, (ref) v_u_3, (ref) v_u_16
		v_u_7()
		local v61 = {}
		local v62 = {}
		for _, v63 in v_u_20.PhraseInputFrame:GetChildren() do
			if v63:IsA("ImageButton") then
				table.insert(v61, v63)
			end
		end
		table.sort(v61, function(p64, p65)
			return p64.LayoutOrder < p65.LayoutOrder
		end)
		for _, v66 in v61 do
			local v67 = v66:FindFirstChild("TextBox")
			if v67 then
				if v67.Text == "" then
					v_u_4:CreateNotification("Not all boxes are filled")
					return
				end
				local v68 = v67.Text
				table.insert(v62, v68)
			end
		end
		if v_u_10:InvokeServer("RecoveryPhrase", v62) then
			local v69 = v_u_23
			v_u_3:Close(v_u_16)
			if v69 then
				v_u_3:Open(v69)
			end
		else
			v_u_4:CreateNotification("Incorrect recovery phrase!")
			v_u_34(v_u_20.Attempts, "Disable")
		end
	end)
end
local function v_u_76()
	-- upvalues: (copy) v_u_19, (copy) v_u_7, (ref) v_u_23, (copy) v_u_3, (copy) v_u_16, (copy) v_u_13, (ref) v_u_26, (copy) v_u_43
	v_u_19.Close.Activated:Connect(function()
		-- upvalues: (ref) v_u_7, (ref) v_u_23, (ref) v_u_3, (ref) v_u_16
		v_u_7()
		local v71 = v_u_23
		v_u_3:Close(v_u_16)
		if v71 then
			v_u_3:Open(v71)
		end
	end)
	local v72 = v_u_19.Checkbox
	local v_u_73 = v72.Checkmark
	v72.Activated:Connect(function()
		-- upvalues: (ref) v_u_7, (copy) v_u_73
		v_u_7()
		v_u_73.Visible = not v_u_73.Visible
	end)
	local v_u_74 = v_u_19.Confirm
	v_u_74.Interactable = false
	v_u_74.BackgroundColor3 = v_u_13.Gray.Background
	v_u_74.UIStroke.Color = v_u_13.Gray.ButtonStroke
	v_u_74.Label.UIStroke.Color = v_u_13.Gray.TextStroke
	v_u_74.Activated:Connect(function()
		-- upvalues: (ref) v_u_7, (ref) v_u_26, (ref) v_u_23, (ref) v_u_3, (ref) v_u_16
		v_u_7()
		v_u_26 = true
		local v75 = v_u_23
		v_u_3:Close(v_u_16)
		if v75 then
			v_u_3:Open(v75)
		end
	end)
	v_u_73:GetPropertyChangedSignal("Visible"):Connect(function()
		-- upvalues: (ref) v_u_43, (copy) v_u_74, (copy) v_u_73
		v_u_43(v_u_74, v_u_73.Visible)
	end)
end
local function v_u_84()
	-- upvalues: (copy) v_u_16, (copy) v_u_7, (ref) v_u_23, (copy) v_u_3, (ref) v_u_22, (copy) v_u_9, (copy) v_u_4, (copy) v_u_17, (copy) v_u_19, (copy) v_u_49
	v_u_16.TradingPinPadCreate.Header.Close.Activated:Connect(function()
		-- upvalues: (ref) v_u_7, (ref) v_u_23, (ref) v_u_3, (ref) v_u_16
		v_u_7()
		local v77 = v_u_23
		v_u_3:Close(v_u_16)
		if v77 then
			v_u_3:Open(v77)
		end
	end)
	v_u_16.TradingPinPadCreate.Buttons.Confirm.Activated:Connect(function()
		-- upvalues: (ref) v_u_7, (ref) v_u_22, (ref) v_u_9, (ref) v_u_4, (ref) v_u_17, (ref) v_u_19, (ref) v_u_49
		v_u_7()
		local v78 = {}
		for _, v79 in v_u_22:split("") do
			local v80 = tonumber(v79)
			local v81 = assert(v80)
			table.insert(v78, v81)
		end
		local v82, v83 = v_u_9:InvokeServer(v78)
		if v82 then
			v_u_17.Visible = false
			v_u_19.Visible = false
			v_u_49(v83)
		else
			v_u_4:CreateNotification("Failed to set trading pin")
		end
	end)
end
local function v_u_94()
	-- upvalues: (copy) v_u_18, (copy) v_u_43, (ref) v_u_22, (copy) v_u_7, (ref) v_u_23, (copy) v_u_3, (copy) v_u_16, (ref) v_u_24, (copy) v_u_12, (ref) v_u_25, (copy) v_u_10, (copy) v_u_4
	local function v_u_85()
		-- upvalues: (ref) v_u_18, (ref) v_u_43, (ref) v_u_22
		v_u_18.Input_Box.WarningText.Text = "<font color=\"rgb(255, 17, 17)\">Wrong pin or no attempts!</font>"
		v_u_18.Input_Box.Input.Visible = false
		v_u_18.Input_Box.WarningText.Visible = true
		v_u_43(v_u_18.Buttons.Confirm, false)
		task.wait(3)
		v_u_22 = ""
		v_u_18.Input_Box.Input.Text = ("%*"):format(v_u_22)
		v_u_18.Input_Box.Input.Visible = true
		v_u_18.Input_Box.WarningText.Visible = false
		v_u_43(v_u_18.Buttons.Confirm, true)
	end
	v_u_18.Header.Close.Activated:Connect(function()
		-- upvalues: (ref) v_u_7, (ref) v_u_23, (ref) v_u_3, (ref) v_u_16, (ref) v_u_24, (ref) v_u_12, (ref) v_u_25
		v_u_7()
		local v86 = v_u_23
		v_u_3:Close(v_u_16)
		if v86 then
			v_u_3:Open(v86)
		end
		if v_u_24 == "Trade" then
			v_u_12:InvokeServer(v_u_25, false)
		end
	end)
	v_u_18.Buttons.Confirm.Activated:Connect(function()
		-- upvalues: (ref) v_u_7, (ref) v_u_22, (ref) v_u_24, (ref) v_u_10, (copy) v_u_85, (ref) v_u_12, (ref) v_u_25, (ref) v_u_4, (ref) v_u_23, (ref) v_u_3, (ref) v_u_16
		v_u_7()
		local v87 = {}
		for _, v88 in v_u_22:split("") do
			local v89 = tonumber(v88)
			local v90 = assert(v89)
			table.insert(v87, v90)
		end
		if v_u_24 == "Reset" then
			if not v_u_10:InvokeServer("Pin", v87) then
				task.spawn(v_u_85)
				return
			end
		elseif v_u_24 == "Trade" then
			local v91, v92 = v_u_12:InvokeServer(v_u_25, v87)
			if not v91 then
				task.spawn(v_u_85)
				return
			end
			if v91 and not v92 then
				v_u_4:CreateNotification("Wrong pin or no attempts!")
			end
		end
		local v93 = v_u_23
		v_u_3:Close(v_u_16)
		if v93 then
			v_u_3:Open(v93)
		end
	end)
end
local function v_u_98()
	-- upvalues: (copy) v_u_21, (copy) v_u_7, (ref) v_u_23, (copy) v_u_3, (copy) v_u_16, (copy) v_u_18, (ref) v_u_24, (ref) v_u_25, (ref) v_u_22, (copy) v_u_30, (copy) v_u_34, (copy) v_u_51
	v_u_21.Close.Activated:Connect(function()
		-- upvalues: (ref) v_u_7, (ref) v_u_23, (ref) v_u_3, (ref) v_u_16
		v_u_7()
		local v95 = v_u_23
		v_u_3:Close(v_u_16)
		if v95 then
			v_u_3:Open(v95)
		end
	end)
	v_u_21.Options.Pin.Activated:Connect(function()
		-- upvalues: (ref) v_u_7, (ref) v_u_18, (ref) v_u_23, (ref) v_u_24, (ref) v_u_25, (ref) v_u_22, (ref) v_u_30, (ref) v_u_34
		v_u_7()
		local v96 = v_u_18.Attempts
		local v97 = {
			["PrevGui"] = v_u_23
		}
		v_u_24 = "Reset"
		v_u_23 = v97.PrevGui
		v_u_25 = v97.RequestUUID
		v_u_18.Header.Title.Text = v_u_24 == "Trade" and "Trading Pin <font color=\"#ff2929\">(5.0s)</font>" or "Trading Pin"
		v_u_22 = ""
		v_u_18.Input_Box.Input.Text = ("%*"):format(v_u_22)
		v_u_30(v_u_18)
		v_u_34(v96, "Disable")
	end)
	v_u_21.Options.Phrase.Activated:Connect(function()
		-- upvalues: (ref) v_u_7, (ref) v_u_51
		v_u_7()
		v_u_51()
	end)
end
local function v_u_103(p99)
	-- upvalues: (ref) v_u_22
	local v100 = p99.Buttons
	local v_u_101 = p99.Input_Box.Input
	for _, v_u_102 in v100:GetChildren() do
		if string.find(v_u_102.Name, "Num") then
			v_u_102.Activated:Connect(function()
				-- upvalues: (ref) v_u_22, (copy) v_u_102, (copy) v_u_101
				if #v_u_22 < 4 then
					v_u_22 = ("%*%*"):format(v_u_22, (v_u_102.Name:gsub("Num", "")))
					v_u_101.Text = v_u_22
				end
			end)
		end
	end
	v100.Delete.Activated:Connect(function()
		-- upvalues: (ref) v_u_22, (copy) v_u_101
		if #v_u_22 > 0 then
			v_u_22 = v_u_22:sub(1, #v_u_22 - 1)
			v_u_101.Text = v_u_22
		end
	end)
end
function v27.CreateTradingPin(p104)
	-- upvalues: (ref) v_u_23, (ref) v_u_22, (copy) v_u_17, (copy) v_u_30, (copy) v_u_3, (copy) v_u_16
	v_u_23 = p104
	v_u_22 = ""
	v_u_17.Input_Box.Input.Text = ("%*"):format(v_u_22)
	v_u_30(v_u_17)
	v_u_3:Open(v_u_16)
	if v_u_23 then
		v_u_3:Close(v_u_23)
	end
end
function v27.ResetPinSystem(p105)
	-- upvalues: (ref) v_u_23, (copy) v_u_30, (copy) v_u_21, (copy) v_u_3, (copy) v_u_16
	v_u_23 = p105
	v_u_30(v_u_21)
	v_u_3:Open(v_u_16)
	if v_u_23 then
		v_u_3:Close(v_u_23)
	end
end
function v27.SetUpTradingPinUI(_)
	-- upvalues: (copy) v_u_76, (copy) v_u_70, (copy) v_u_84, (copy) v_u_94, (copy) v_u_98, (copy) v_u_103, (copy) v_u_18, (copy) v_u_17, (copy) v_u_16, (ref) v_u_22, (copy) v_u_43
	v_u_76()
	v_u_70()
	v_u_84()
	v_u_94()
	v_u_98()
	v_u_103(v_u_18)
	v_u_103(v_u_17)
	local v_u_106 = nil
	v_u_16:GetPropertyChangedSignal("Enabled"):Connect(function()
		-- upvalues: (ref) v_u_16, (ref) v_u_106, (ref) v_u_22, (ref) v_u_43
		if v_u_16.Enabled then
			v_u_106 = task.spawn(function()
				-- upvalues: (ref) v_u_16, (ref) v_u_22, (ref) v_u_43
				while v_u_16.Enabled do
					local v107
					if #v_u_22 == 4 then
						v107 = true
					else
						v107 = false
					end
					local v108 = v_u_16.TradingPinPadCreate.Buttons.Confirm
					local v109 = v_u_16.TradingPinPadInput.Buttons.Confirm
					v_u_43(v108, v107)
					v_u_43(v109, v107)
					task.wait()
				end
			end)
		elseif v_u_106 then
			task.cancel(v_u_106)
		end
	end)
end
v11.OnClientEvent:Connect(function(p110, p111)
	-- upvalues: (copy) v_u_59
	v_u_59(p110, p111 - workspace:GetServerTimeNow())
end)
local v112 = v_u_6:GetPathSignal("TradeData/Pin/Disable/Attempts")
if v112 then
	v112:Connect(function(_, _, _)
		-- upvalues: (copy) v_u_6, (copy) v_u_18
		local v113 = v_u_6:GetData()
		if v113 then
			local v114 = v113.TradeData.Pin.Disable.Attempts
			v_u_18.Attempts.Text = ("You have <font color=\"rgb(255, 17, 17)\">(%*)</font> attempts remaining today"):format(v114)
		end
	end)
end
local v115 = v_u_6:GetPathSignal("TradeData/Pin/Match/Attempts")
if v115 then
	v115:Connect(function(_, _, _)
		-- upvalues: (copy) v_u_6, (copy) v_u_18
		local v116 = v_u_6:GetData()
		if v116 then
			local v117 = v116.TradeData.Pin.Match.Attempts
			v_u_18.Attempts.Text = ("You have <font color=\"rgb(255, 17, 17)\">(%*)</font> attempts remaining today"):format(v117)
		end
	end)
end
return v27