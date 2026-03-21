local v1 = game:GetService("ReplicatedStorage")
local v2 = game:GetService("Players")
local v_u_3 = game:GetService("SoundService")
local v4 = require(v1.Data.SeasonPass.SeasonPassStaticData)
local v_u_5 = require(v1.Modules.GuiController)
require(v1.Modules.TradeControllers.TradingController)
require(v1.Data.TradeData)
local v_u_6 = require(v1.Modules.DataService)
local v_u_7 = require(v1.Modules.TradeMenu.TradeMenuHistoryController)
local v_u_8 = require(v1.Modules.TradeMenu.TradeMenuSettingsController)
local v_u_9 = require(v1.Modules.TradeMenu.TradeMenuPlayersController)
local v_u_10 = require(v1.Modules.TradeMenu.TradingPinController)
local v_u_11 = require(v1.Modules.NumberUtil)
require(v1.Comma_Module)
local v_u_12 = require(v1.Modules.PlayClickSound)
local v_u_13 = require(v1.Modules.TradeControllers.TradeWorldController)
require(v1.Modules.UpdateService)
local v14 = (v2.LocalPlayer or v2.PlayerAdded:Wait()).PlayerGui
local v_u_15 = v4.ButtonColors
local v_u_16 = v14:WaitForChild("BackpackGui")
local v_u_17 = v14.Teleport_UI
local v_u_18 = v14:WaitForChild("BuyTokens")
local v_u_19 = v14:WaitForChild("TokensInfo")
local v_u_20 = v14:WaitForChild("TradeMenu")
local v_u_21 = v_u_20.TradeMenuFrame.TopBtns
local v_u_22 = v_u_20.TradeMenuFrame.FrameSECTIONS
local v42 = {
	["Start"] = function(_)
		-- upvalues: (copy) v_u_5, (copy) v_u_20, (copy) v_u_6, (copy) v_u_3, (copy) v_u_12, (copy) v_u_21, (copy) v_u_22, (copy) v_u_15, (copy) v_u_11, (copy) v_u_18, (copy) v_u_19, (copy) v_u_13, (copy) v_u_16, (copy) v_u_17, (copy) v_u_7, (copy) v_u_9, (copy) v_u_8, (copy) v_u_10
		v_u_5:UsePopupAnims(v_u_20)
		local v_u_23 = v_u_6:GetData()
		if v_u_23 then
			v_u_20.TradeMenuFrame.Close.Activated:Connect(function()
				-- upvalues: (ref) v_u_5, (ref) v_u_20
				v_u_5:Close(v_u_20)
			end)
			local function v30(p_u_24)
				-- upvalues: (ref) v_u_3, (ref) v_u_12, (ref) v_u_21, (ref) v_u_22, (ref) v_u_15
				p_u_24.MouseEnter:Connect(function()
					-- upvalues: (ref) v_u_3
					local v25 = v_u_3.Hover
					v25.PlaybackSpeed = 1 + math.random(-15, 15) / 100
					v25:Play()
				end)
				p_u_24.Activated:Connect(function()
					-- upvalues: (ref) v_u_12, (ref) v_u_21, (ref) v_u_22, (copy) p_u_24, (ref) v_u_15
					v_u_12()
					for _, v26 in v_u_21:GetChildren() do
						if v26:IsA("ImageButton") then
							local v27 = v26:FindFirstChild("UIStroke")
							local v28 = v26:FindFirstChild("TextLabel"):FindFirstChild("UIStroke")
							local v29 = v_u_22:FindFirstChild(v26.Name)
							if not v29 then
								warn((("No related section found for %*"):format(v26.Name)))
								return
							end
							if v26.Name == p_u_24.Name then
								v29.Visible = true
								v26.BackgroundColor3 = v_u_15.Yellow.Background
								v28.Color = v_u_15.Yellow.ButtonStroke
								v27.Color = v_u_15.Yellow.ButtonStroke
							else
								v29.Visible = false
								v26.BackgroundColor3 = v_u_15.Green.TextStroke
								v28.Color = v_u_15.Green.ButtonStroke
								v27.Color = v_u_15.Green.ButtonStroke
							end
						end
					end
				end)
			end
			for _, v31 in v_u_21:GetChildren() do
				if v31:IsA("ImageButton") then
					v30(v31)
				end
			end
			local v_u_32 = v_u_20.TradeMenuFrame.TokenCounter
			v_u_32.Label.Text = ("Tokens: %*"):format((v_u_11.Comma(v_u_23.TradeData.Tokens)))
			v_u_6:GetPathSignal("TradeData/Tokens"):Connect(function()
				-- upvalues: (copy) v_u_32, (ref) v_u_11, (copy) v_u_23
				v_u_32.Label.Text = ("Tokens: %*"):format((v_u_11.Comma(v_u_23.TradeData.Tokens)))
			end)
			local v_u_33 = v_u_18
			local v_u_34 = v_u_20
			v_u_32.Buy.Activated:Connect(function()
				-- upvalues: (ref) v_u_12, (copy) v_u_33, (ref) v_u_5, (copy) v_u_34
				v_u_12()
				local v35 = v_u_33:FindFirstChild("Close", true)
				if v35 then
					v35.Activated:Once(function()
						-- upvalues: (ref) v_u_5, (ref) v_u_33, (ref) v_u_34
						v_u_5:Close(v_u_33)
						v_u_5:Open(v_u_34)
					end)
				end
				v_u_5:Open(v_u_33)
			end)
			local v_u_36 = v_u_19
			local v_u_37 = v_u_20
			v_u_32.Info.Activated:Connect(function()
				-- upvalues: (ref) v_u_12, (copy) v_u_36, (ref) v_u_5, (copy) v_u_37
				v_u_12()
				local v38 = v_u_36:FindFirstChild("Close", true)
				if v38 then
					v38.Activated:Once(function()
						-- upvalues: (ref) v_u_5, (ref) v_u_36, (ref) v_u_37
						v_u_5:Close(v_u_36)
						v_u_5:Open(v_u_37)
					end)
				end
				v_u_5:Open(v_u_36)
			end)
			local v_u_39 = v_u_20.TradeMenuFrame.MainWorldButton
			local v_u_40 = v_u_20.TradeMenuFrame.TradeWorldButton
			if v_u_13:IsInWorld() then
				v_u_40.Visible = false
				v_u_39.Visible = true
				v_u_39.Button.Activated:Connect(function()
					-- upvalues: (ref) v_u_13
					v_u_13:TeleportToMainWorld()
				end)
			else
				if not v_u_13:IsPlayerANoob() then
					v_u_40.Visible = true
					v_u_39.Visible = false
				end
				v_u_40.Button.Activated:Connect(function()
					-- upvalues: (ref) v_u_13
					v_u_13:TeleportToTradeWorld()
				end)
			end
			v_u_5:GetStateForGui(v_u_20).Visible:Observe(function(p41)
				-- upvalues: (ref) v_u_13, (copy) v_u_40, (copy) v_u_39, (ref) v_u_16, (ref) v_u_17
				if p41 then
					if not (v_u_13:IsPlayerANoob() or v_u_13:IsInWorld()) then
						v_u_40.Visible = true
						v_u_39.Visible = false
					end
					v_u_16.Enabled = false
					v_u_17.Enabled = false
				else
					v_u_16.Enabled = true
					v_u_17.Enabled = true
				end
			end)
			task.spawn(v_u_7.SetUpHistoryUI)
			task.spawn(v_u_9.SetUpPlayersUI)
			task.spawn(v_u_8.SetUpSettingsUI)
			task.spawn(v_u_10.SetUpTradingPinUI, v_u_10)
		else
			warn("TradeMenuController | No player data found")
		end
	end
}
task.spawn(v42.Start, v42)
return v42