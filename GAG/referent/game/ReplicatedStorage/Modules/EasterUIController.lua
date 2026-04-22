local v1 = game:GetService("Players")
local v2 = game:GetService("ReplicatedStorage")
game:GetService("ServerScriptService")
local v_u_3 = game:GetService("MarketplaceService")
local v_u_4 = game:GetService("PolicyService")
local v_u_5 = game:GetService("RunService")
local v_u_6 = v2:WaitForChild("GameEvents"):WaitForChild("SeedPackGiverEvent")
local v_u_7 = require(v2.Data.EASTER_SeedGiverQuestProgression)
local v_u_8 = require(v2.Modules.MarketController)
local v_u_9 = require(v2.Modules.GiftController)
local v_u_10 = require(v2.Modules.GuiController)
local v_u_11 = require(v2.Modules.DataService)
local v_u_12 = require(v2.Data.SeedPackData)
local v_u_13 = require(v2.Modules.RetryPcall)
local v_u_14 = require(v2.Comma_Module)
local v_u_15 = require(v2.Data.SeedData)
local v_u_16 = require(v2.Data.DevProductIds)
local v_u_17 = require(v2.Modules.SeedPackOddsController)
local v_u_18 = require(v2.Modules.UpdateService)
local v_u_19 = v1.LocalPlayer
assert(v_u_19, "LocalPlayer not found!")
local v_u_20 = v_u_19.PlayerGui:WaitForChild("EasterReward_UI")
local v_u_21 = v_u_20.Frame
local v_u_22 = v_u_21.Btns
local v_u_23 = false
local v_u_67 = {
	["DisplayExoticSackUI"] = function(_)
		-- upvalues: (ref) v_u_23, (copy) v_u_67, (copy) v_u_10, (copy) v_u_20, (copy) v_u_21
		if v_u_23 then
			v_u_67:UpdateProgression()
			v_u_10:Open(v_u_20)
			v_u_21.BasicVer.Visible = false
			v_u_21.ExoticVer.Visible = true
		else
			v_u_67:DisplayBasicSackUI()
		end
	end,
	["DisplayBasicSackUI"] = function(_)
		-- upvalues: (copy) v_u_67, (copy) v_u_10, (copy) v_u_20, (copy) v_u_21
		v_u_67:UpdateProgression()
		v_u_10:Open(v_u_20)
		v_u_21.BasicVer.Visible = true
		v_u_21.ExoticVer.Visible = false
	end,
	["UpdateProgression"] = function(_)
		-- upvalues: (copy) v_u_11, (copy) v_u_19, (copy) v_u_21, (copy) v_u_7
		local v24 = v_u_11:GetData()
		if v24 then
			local v25 = v24.EasterEventData
			local v26 = v_u_21.BasicVer.Prog
			local v27 = (v24.EasterEventData.Progression - 1) / #v_u_7
			v_u_21.BasicVer.Prog.Fill.Size = UDim2.new(v27, 0, 1, 0)
			if v24.EasterEventData.Progression > #v_u_7 then
				v26.Progress.Text = "Plant is fully fed! Claim your Exotic Seed Pack!"
				v_u_21.BasicVer.ClaimButton.Visible = true
			else
				v26.Progress.Text = ("%*/%*"):format(v25.Progression - 1, #v_u_7)
				v_u_21.BasicVer.ClaimButton.Visible = false
			end
			v_u_21.BasicVer.ImageFrame.ShardProgress.Text = ("%* Plants Remaining"):format(25 - (v25.CandyBlossomShardProgress or 0))
		else
			warn((("No player data for %*!"):format(v_u_19)))
		end
	end,
	["Start"] = function(_)
		-- upvalues: (copy) v_u_10, (copy) v_u_20, (copy) v_u_22, (copy) v_u_67, (copy) v_u_21, (copy) v_u_5, (copy) v_u_18, (copy) v_u_6, (copy) v_u_12, (copy) v_u_15, (copy) v_u_17, (copy) v_u_11, (copy) v_u_16, (copy) v_u_8, (copy) v_u_13, (copy) v_u_3, (copy) v_u_14, (copy) v_u_9, (copy) v_u_4, (copy) v_u_19, (ref) v_u_23
		local v_u_28 = v_u_10:GetStateForGui(v_u_20)
		v_u_10:UsePopupAnims(v_u_20)
		v_u_22.Basic.Activated:Connect(function()
			-- upvalues: (ref) v_u_67
			v_u_67:DisplayBasicSackUI()
		end)
		v_u_22.Exotic.Activated:Connect(function()
			-- upvalues: (ref) v_u_67
			v_u_67:DisplayExoticSackUI()
		end)
		v_u_21.ExitButton.Activated:Connect(function()
			-- upvalues: (ref) v_u_10, (ref) v_u_20
			v_u_10:Close(v_u_20)
		end)
		local function v30()
			-- upvalues: (ref) v_u_5, (ref) v_u_21
			v_u_5.Heartbeat:Connect(function(p29)
				-- upvalues: (ref) v_u_21
				v_u_21.BasicVer.ImageFrame.RainbowUIGradient.Rotation = (v_u_21.BasicVer.ImageFrame.RainbowUIGradient.Rotation + p29 * 30) % 360
			end)
			v_u_21.BasicVer.ImageFrame.Visible = true
		end
		if v_u_18:IsHiddenFromUpdate("Candy Blossom Shard") then
			v_u_21.BasicVer.ImageFrame.Visible = false
			v_u_18.OnUpdated:Once(v30)
		else
			v_u_5.Heartbeat:Connect(function(p31)
				-- upvalues: (ref) v_u_21
				v_u_21.BasicVer.ImageFrame.RainbowUIGradient.Rotation = (v_u_21.BasicVer.ImageFrame.RainbowUIGradient.Rotation + p31 * 30) % 360
			end)
			v_u_21.BasicVer.ImageFrame.Visible = true
		end
		v_u_21.BasicVer.ClaimButton.Claim.Activated:Connect(function()
			-- upvalues: (ref) v_u_6, (ref) v_u_21
			v_u_6:FireServer("ClaimPremiumPack")
			v_u_21.BasicVer.Prog.Progress.Text = "Well done! Exotic Seed Pack Claimed!"
			v_u_21.BasicVer.ClaimButton.Visible = false
		end)
		local function v55(p_u_32, p33)
			-- upvalues: (ref) v_u_12, (ref) v_u_15, (ref) v_u_17, (ref) v_u_20, (copy) v_u_28, (ref) v_u_5
			local v34 = table.clone(p33.Items)
			table.sort(v34, function(p35, p36)
				return (p35.Chance or (1 / 0)) < (p36.Chance or (1 / 0))
			end)
			local v37 = {}
			local v38 = {}
			for v39, v40 in v34 do
				if v39 <= 2 then
					v37[v40] = true
				elseif v39 <= 4 then
					v38[v40] = true
				end
			end
			for v41, v_u_42 in p33.Items do
				local v43 = v37[v_u_42] == true
				local v44 = not v43
				if v44 then
					v44 = v38[v_u_42] == true
				end
				local v45
				if v43 then
					v45 = p_u_32.UIListLayout.TemplateRainbow
				elseif v44 then
					v45 = p_u_32.UIListLayout.TemplateBigger
				else
					v45 = p_u_32.UIListLayout.TemplateSmaller
				end
				local v_u_46 = v45:Clone()
				v_u_46.LayoutOrder = v41
				local v47 = v_u_46.Odds
				local v48
				if v_u_42.RemoveChance then
					v48 = ""
				elseif v_u_42.HideChance then
					v48 = "???"
				else
					local v49 = v_u_42.Chance * 100
					v48 = ("%*%%"):format(math.floor(v49) / 100)
				end
				v47.Text = v48
				v_u_46.Title.Text = v_u_12:GetTextDisplayForItem(v_u_42)
				if v_u_42.Icon then
					v_u_46.Vector.Image = v_u_42.Icon
				else
					local v50 = v_u_15[v_u_42.RewardId]
					if v50 and v50.Asset then
						v_u_46.Vector.Image = v50.Asset
					end
				end
				if v_u_46:FindFirstChild("OddsButton") then
					if v_u_42.Type == "Pack" then
						v_u_46.OddsButton.Visible = true
						v_u_46.OddsButton.Activated:Connect(function()
							-- upvalues: (ref) v_u_17, (copy) v_u_42, (ref) v_u_20
							v_u_17:Open(v_u_42.RewardId, v_u_20)
						end)
					else
						v_u_46.OddsButton.Visible = false
					end
				end
				if v43 then
					local v_u_51 = nil
					v_u_28.Visible:Listen(function(p52)
						-- upvalues: (ref) v_u_51, (ref) v_u_5, (copy) v_u_46
						if p52 then
							if not v_u_51 then
								v_u_51 = v_u_5.PostSimulation:Connect(function()
									-- upvalues: (ref) v_u_46
									local v53 = Color3.fromHSV(os.clock() % 5 / 5, 1, 1)
									v_u_46.Odds.TextColor3 = v53
									v_u_46.Title.TextColor3 = v53
								end)
								return
							end
						elseif v_u_51 then
							v_u_51:Disconnect()
							v_u_51 = nil
						end
					end)
				elseif v44 then
					local v54 = Color3.fromRGB(85, 170, 255)
					v_u_46.Odds.TextColor3 = v54
					v_u_46.Title.TextColor3 = v54
				end
				v_u_46.Parent = p_u_32
				task.delay(0.01, function()
					-- upvalues: (copy) p_u_32
					if p_u_32.AbsoluteCanvasSize.X > p_u_32.AbsoluteWindowSize.X then
						p_u_32.UIListLayout.HorizontalAlignment = Enum.HorizontalAlignment.Left
					else
						p_u_32.UIListLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center
					end
				end)
			end
		end
		v55(v_u_21.BasicVer.Items.ScrollingFrame, v_u_12.Packs["Easter Seed Pack"])
		v55(v_u_21.ExoticVer.Items.ScrollingFrame, v_u_12.Packs["Exotic Easter Seed Pack"])
		local function v59()
			-- upvalues: (ref) v_u_11, (ref) v_u_16, (ref) v_u_21
			local v56 = v_u_11:GetData()
			if not v56 then
				return
			end
			local v57 = false
			for _, v58 in v56.Transactions do
				if v58.ProductId == v_u_16.EasterPackExoticBuy10.PurchaseID then
					v57 = true
					break
				end
			end
			v_u_21.ExoticVer.Frame.Gift50.Visible = v57
			v_u_21.ExoticVer.Frame.Buy50.Visible = v57
		end
		v_u_11:GetPathSignal("TotalRobuxSpent"):Connect(v59)
		v_u_11:GetPathSignal("Transactions/@"):Connect(v59)
		v59()
		v_u_8:SetPriceLabel(v_u_21.ExoticVer.Frame.Buy1.Cost, v_u_16.EasterPackExoticBuy1.PurchaseID)
		v_u_21.ExoticVer.Frame.Buy1.Activated:Connect(function()
			-- upvalues: (ref) v_u_8, (ref) v_u_16
			v_u_8:PromptPurchase(v_u_16.EasterPackExoticBuy1.PurchaseID, Enum.InfoType.Product)
		end)
		v_u_8:SetPriceLabel(v_u_21.ExoticVer.Frame.Buy3.Cost, v_u_16.EasterPackExoticBuy3.PurchaseID)
		v_u_21.ExoticVer.Frame.Buy3.Activated:Connect(function()
			-- upvalues: (ref) v_u_8, (ref) v_u_16
			v_u_8:PromptPurchase(v_u_16.EasterPackExoticBuy3.PurchaseID, Enum.InfoType.Product)
		end)
		v_u_8:SetPriceLabel(v_u_21.ExoticVer.Frame.Buy10.Cost, v_u_16.EasterPackExoticBuy10.PurchaseID)
		v_u_21.ExoticVer.Frame.Buy10.Activated:Connect(function()
			-- upvalues: (ref) v_u_8, (ref) v_u_16
			v_u_8:PromptPurchase(v_u_16.EasterPackExoticBuy10.PurchaseID, Enum.InfoType.Product)
		end)
		v_u_8:SetPriceLabel(v_u_21.ExoticVer.Frame.Buy50.Cost, v_u_16.EasterPackExoticBuy50.PurchaseID)
		v_u_21.ExoticVer.Frame.Buy50.Activated:Connect(function()
			-- upvalues: (ref) v_u_8, (ref) v_u_16
			v_u_8:PromptPurchase(v_u_16.EasterPackExoticBuy50.PurchaseID, Enum.InfoType.Product)
		end)
		task.spawn(function()
			-- upvalues: (ref) v_u_21, (ref) v_u_13, (ref) v_u_3, (ref) v_u_16, (ref) v_u_14
			v_u_21.ExoticVer.Frame.Buy10.Tag.Visible = false
			local v60, v61 = v_u_13(30, 6, function()
				-- upvalues: (ref) v_u_3, (ref) v_u_16
				return v_u_3:GetProductInfo(v_u_16.EasterPackExoticBuy1.PurchaseID, Enum.InfoType.Product)
			end)
			if v60 then
				v_u_21.ExoticVer.Frame.Buy10.Tag.Text = v_u_14.Comma(v61.PriceInRobux * 10)
				v_u_21.ExoticVer.Frame.Buy10.Tag.Visible = true
			end
		end)
		task.spawn(function()
			-- upvalues: (ref) v_u_21, (ref) v_u_13, (ref) v_u_3, (ref) v_u_16, (ref) v_u_14
			v_u_21.ExoticVer.Frame.Buy50.Tag.Visible = false
			local v62, v63 = v_u_13(30, 6, function()
				-- upvalues: (ref) v_u_3, (ref) v_u_16
				return v_u_3:GetProductInfo(v_u_16.EasterPackExoticBuy1.PurchaseID, Enum.InfoType.Product)
			end)
			if v62 then
				v_u_21.ExoticVer.Frame.Buy50.Tag.Text = v_u_14.Comma(v63.PriceInRobux * 50)
				v_u_21.ExoticVer.Frame.Buy50.Tag.Visible = true
			end
		end)
		v_u_21.ExoticVer.Frame.Gift.Activated:Connect(function()
			-- upvalues: (ref) v_u_9
			v_u_9:PromptGift("10 Exotic Easter Seed Packs")
		end)
		v_u_21.ExoticVer.Frame.Gift50.Activated:Connect(function()
			-- upvalues: (ref) v_u_9
			v_u_9:PromptGift("50 Exotic Easter Seed Packs")
		end)
		v_u_67:UpdateProgression()
		task.spawn(function()
			-- upvalues: (ref) v_u_22, (ref) v_u_21, (ref) v_u_13, (ref) v_u_4, (ref) v_u_19, (ref) v_u_23
			v_u_22.Exotic.Visible = false
			local v64 = v_u_21.ExoticVer:GetPropertyChangedSignal("Visible"):Connect(function()
				-- upvalues: (ref) v_u_21
				if v_u_21.ExoticVer.Visible then
					v_u_21.ExoticVer.Visible = false
					v_u_21.BasicVer.Visible = true
				end
			end)
			local v65, v66 = v_u_13(10, 5, function()
				-- upvalues: (ref) v_u_4, (ref) v_u_19
				return v_u_4:GetPolicyInfoForPlayerAsync(v_u_19)
			end)
			if v65 then
				if not v66.ArePaidRandomItemsRestricted then
					v_u_23 = true
					v_u_22.Exotic.Visible = true
					v64:Disconnect()
				end
			else
				return
			end
		end)
	end
}
task.spawn(v_u_67.Start, v_u_67)
return v_u_67