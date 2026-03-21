local v1 = game:GetService("ReplicatedStorage")
local v2 = game:GetService("Players")
local v3 = require(v1.Data.SeasonPass.SeasonPassStaticData)
local v_u_4 = require(v1.Modules.DataService)
local v_u_5 = require(v1.Modules.TradeMenu.TradingPinController)
local v_u_6 = require(v1.Modules.PlayClickSound)
local v7 = v1.GameEvents
local v_u_8 = v7.TradeEvents.SetViewInventoryPermission
local v_u_9 = v7.TradeEvents.SetUnfairTradeWarning
local v_u_10 = v3.ButtonColors
local _ = v1.Modules.TradeTokens.Templates
local v11 = (v2.LocalPlayer or v2.PlayerAdded:Wait()).PlayerGui
v11:WaitForChild("TradingPin")
local v_u_12 = v11:WaitForChild("TradeMenu")
local v13 = v_u_12.TradeMenuFrame.FrameSECTIONS.Settings.ScrollingFrame
local v_u_14 = v13.ViewInventory
local v_u_15 = v13.TradingPin
local v_u_16 = v13.UnfairTradesWarning
local v_u_17 = v_u_12.TradeMenuFrame.FrameSECTIONS.Settings.ScrollingFrame.TradingPin
local v18 = {}
local v_u_19 = { "Everyone", "Friends", "No one" }
local v_u_20 = "No one"
local v_u_21 = true
local function v_u_28(p22, p23, p24)
	-- upvalues: (copy) v_u_10
	local v25
	if p24 then
		v25 = v_u_10.Green
	else
		v25 = v_u_10.Red
	end
	local v26 = p22:FindFirstChild("UIGradient")
	if v25.Gradient then
		v26.Color = v25.Gradient
	end
	local v27 = p22:FindFirstChild("UIStroke")
	if v25.ButtonStrokeAlt then
		v27.Color = v25.ButtonStrokeAlt
	end
	p22:FindFirstChild("Label"):FindFirstChild("UIStroke").Color = v25.TextStroke
	p23.Text = p24 and "ENABLED" or "DISABLED"
end
local function v_u_32(p29, p30)
	-- upvalues: (copy) v_u_10
	local v31
	if p30 then
		v31 = v_u_10.Green
	else
		v31 = v_u_10.Blue
	end
	p29.BackgroundColor3 = v31.Background
	p29:FindFirstChild("UIStroke").Color = v31.ButtonStroke
	p29:FindFirstChild("Label"):FindFirstChild("UIStroke").Color = v31.TextStroke
	p29:FindFirstChild("Vector").Visible = p30
end
local function v_u_35(p33)
	-- upvalues: (copy) v_u_32
	for _, v34 in p33:GetChildren() do
		if v34:IsA("ImageButton") then
			v_u_32(v34, false)
		end
	end
end
local function v_u_40()
	-- upvalues: (copy) v_u_4, (copy) v_u_17, (copy) v_u_28, (copy) v_u_15
	local v36 = v_u_4:GetData()
	if v36 then
		local v37 = v_u_17.Current
		v_u_28(v37, v37.Label, v36.TradeData.Pin.Pin and true or false)
		local v38 = v_u_15.Set
		local v39 = v_u_15.Reset
		v38.Visible = not v36.TradeData.Pin.Pin
		v39.Visible = v36.TradeData.Pin.Pin and true or false
	else
		warn("TradeMenuSettingsController/ToggleTradingPinButton | No player data")
	end
end
local function v_u_44()
	-- upvalues: (copy) v_u_4, (ref) v_u_20, (copy) v_u_14, (copy) v_u_35, (copy) v_u_32, (copy) v_u_6, (copy) v_u_19, (copy) v_u_8
	local v41 = v_u_4:GetData()
	if v41 then
		v_u_20 = v41.TradeData.ViewInventoryPermission
		local v42 = v_u_14.Options:FindFirstChild(v_u_20)
		if v42 then
			v_u_35(v_u_14.Options)
			v_u_32(v42, true)
			for _, v_u_43 in v_u_14.Options:GetChildren() do
				if v_u_43:IsA("ImageButton") then
					v_u_43.Activated:Connect(function()
						-- upvalues: (ref) v_u_6, (ref) v_u_20, (copy) v_u_43, (ref) v_u_35, (ref) v_u_14, (ref) v_u_32, (ref) v_u_19, (ref) v_u_8
						v_u_6()
						v_u_20 = v_u_43.Name
						v_u_35(v_u_14.Options)
						v_u_32(v_u_43, true)
						if table.find(v_u_19, v_u_20) then
							v_u_8:FireServer(v_u_20)
						else
							warn("Not a valid permission name")
						end
					end)
				end
			end
		else
			warn((("Cannot find inventory access button: %*"):format(v_u_20)))
		end
	else
		warn("TradeMenuSettingsController/SetupInventoryViewAcess | No player data")
		return
	end
end
local function v_u_48()
	-- upvalues: (copy) v_u_4, (copy) v_u_15, (copy) v_u_6, (copy) v_u_5, (copy) v_u_12, (copy) v_u_28
	local v45 = v_u_4:GetData()
	if v45 then
		local v46 = v_u_15.Set
		v46.Activated:Connect(function()
			-- upvalues: (ref) v_u_6, (ref) v_u_5, (ref) v_u_12
			v_u_6()
			v_u_5.CreateTradingPin(v_u_12)
		end)
		local v47 = v_u_15.Reset
		v47.Activated:Connect(function()
			-- upvalues: (ref) v_u_6, (ref) v_u_5, (ref) v_u_12
			v_u_6()
			v_u_5.ResetPinSystem(v_u_12)
		end)
		v46.Visible = not v45.TradeData.Pin.Pin
		v47.Visible = not v46.Visible
		v_u_28(v_u_15.Current, v_u_15.Current.Label, v47.Visible)
	else
		warn("TradeMenuSettingsController/SetupTradingPin | No player data")
	end
end
local function v_u_54()
	-- upvalues: (copy) v_u_4, (copy) v_u_16, (ref) v_u_21, (copy) v_u_28, (copy) v_u_9, (copy) v_u_6
	local v49 = v_u_4:GetData()
	if v49 then
		local v50 = v_u_16.Options
		local v_u_51 = v50.Enable
		local v_u_52 = v50.Disable
		local v_u_53 = v_u_16.Current
		v_u_21 = v49.TradeData.UnfairTradeWarning
		v_u_52.BackgroundTransparency = v_u_21 and 0 or 0.5
		v_u_52.Label.TextTransparency = v_u_21 and 0 or 0.5
		v_u_51.BackgroundTransparency = v_u_21 and 0.5 or 0
		v_u_51.Label.TextTransparency = v_u_21 and 0.5 or 0
		v_u_28(v_u_53, v_u_53.Label, v_u_21)
		v_u_9:FireServer(v_u_21)
		v_u_51.Activated:Connect(function()
			-- upvalues: (ref) v_u_6, (ref) v_u_21, (copy) v_u_52, (copy) v_u_51, (ref) v_u_28, (copy) v_u_53, (ref) v_u_9
			v_u_6()
			v_u_21 = true
			v_u_52.BackgroundTransparency = v_u_21 and 0 or 0.5
			v_u_52.Label.TextTransparency = v_u_21 and 0 or 0.5
			v_u_51.BackgroundTransparency = v_u_21 and 0.5 or 0
			v_u_51.Label.TextTransparency = v_u_21 and 0.5 or 0
			v_u_28(v_u_53, v_u_53.Label, v_u_21)
			v_u_9:FireServer(v_u_21)
		end)
		v_u_52.Activated:Connect(function()
			-- upvalues: (ref) v_u_6, (ref) v_u_21, (copy) v_u_52, (copy) v_u_51, (ref) v_u_28, (copy) v_u_53, (ref) v_u_9
			v_u_6()
			v_u_21 = false
			v_u_52.BackgroundTransparency = v_u_21 and 0 or 0.5
			v_u_52.Label.TextTransparency = v_u_21 and 0 or 0.5
			v_u_51.BackgroundTransparency = v_u_21 and 0.5 or 0
			v_u_51.Label.TextTransparency = v_u_21 and 0.5 or 0
			v_u_28(v_u_53, v_u_53.Label, v_u_21)
			v_u_9:FireServer(v_u_21)
		end)
	else
		warn("TradeMenuSettingsController/SetupUnfairTradeWarning | No player data")
	end
end
function v18.SetUpSettingsUI()
	-- upvalues: (copy) v_u_44, (copy) v_u_48, (copy) v_u_54
	v_u_44()
	v_u_48()
	v_u_54()
end
local v55 = v_u_4:GetPathSignal("TradeData/Pin/@")
if v55 then
	v55:Connect(function(_, p56, p57)
		-- upvalues: (copy) v_u_4, (copy) v_u_40
		if p56 then
			local v58 = string.split(p57, "/")
			local v59
			if #v58 >= 3 then
				v59 = v58[3]
			else
				v59 = nil
			end
			if v59 then
				local v60 = v_u_4:GetData()
				if v60 then
					if v59 == "Pin" and v60.TradeData.Pin.Pin then
						v_u_40()
						return
					elseif v59 == "Match" and v60.TradeData.Pin.Pin == nil then
						v_u_40()
					end
				else
					warn("No player data")
					return
				end
			else
				warn(("No changes %*"):format(v59), v58)
				return
			end
		else
			return
		end
	end)
end
return v18