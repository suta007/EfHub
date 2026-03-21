local v_u_1 = game:GetService("ReplicatedStorage")
local v2 = game:GetService("Players")
require(script.Parent.VListTypes)
local v_u_3 = require(script.Parent.VListCellRenderers)
local v_u_4 = require(v_u_1.Modules.GardenGuideModules.DataModules.GGData)
local v_u_5 = require(v_u_1.Modules.GardenGuideModules.GGUI)
local v_u_6 = require(v_u_1.Modules.PlayClickSound)
local v_u_7 = require(v_u_1.Modules.DataService)
local v_u_8 = require(v_u_1.Modules.Notification)
local v_u_9 = require(v_u_1.Modules.GardenGuideModules.DetailsViewHandler)
local v10 = require(v_u_1.Modules.GardenGuideModules.DataModules.GGStaticData)
local v_u_11 = require(v_u_1.Modules.TradeTokens.TokenRAPChartController)
require(v_u_1.Modules.TradeTokens.TokenRAPController)
require(v_u_1.Modules.NumberUtil)
local v_u_12 = v_u_1.GameEvents.GardenGuide.GardenGuide_RE_MarkOffNew
local v_u_13 = v2.LocalPlayer.PlayerGui
local _ = v_u_1.Data.TradePlaza.IndexTemplates.ItemTemplate
local v_u_14 = v10.RarityColorMap
local _ = v10.AnimatedColors
return {
	["GardenGuide"] = function(p15, p16, p17)
		-- upvalues: (copy) v_u_4, (copy) v_u_12, (copy) v_u_3, (copy) v_u_13, (copy) v_u_5, (copy) v_u_9
		local v18 = p17.DataType or ""
		if v_u_4[v18] then
			local v19 = v_u_4[v18].Data
			local v20 = v19[p15.Name] or v19[p15.Name:gsub(" ", "")]
			if v20 then
				if p15.Parent then
					local v21 = p15.Parent.Name:gsub("Menu", "")
					v_u_12:FireServer(v21, v20.Name)
					p15:SetAttribute("New", false)
					v_u_3.ToggleGGCellUI(p15, p16, p17)
					v20.New = false
					p15.Parent.Visible = false
					local v22 = v_u_13.GardenGuide.MainMenu
					local v23 = v22.MainMenuFrame
					local _ = v22.TopBar
					local v24 = v23.SearchBar
					local v25 = v22.FilterSidebar
					local v26 = v25.Main.Sort
					local v27 = v25.Main.Filter
					v25.Visible = false
					v26.Visible = false
					v27.Visible = false
					local v28 = v24.Main.TextBox.Text
					v_u_5.ChangeTopBar(v20.DisplayName or v20.Name, false)
					v24.Main.TextBox.Text = v28
					local v29 = v23:FindFirstChild((("%*Details"):format(v20.Name)))
					if not v29 then
						if v_u_5.CurrentDetail then
							v_u_5.CurrentDetail:Destroy()
						end
						v29 = v_u_9.CreateDetailsView(v23, v20, v21)
					end
					if v29 then
						v29.Visible = true
						v_u_5.CurrentDetail = v29
					end
					v_u_5.GoNextPage(v29, p15.Parent)
				else
					warn("No prev page for passing datatype")
				end
			else
				warn((("No data for %* in %*Data"):format(p15.Name, v18)))
				return
			end
		else
			warn((("No data for %* in GGData"):format(v18)))
			return
		end
	end,
	["TradePlazaIndex"] = function(p_u_30, _)
		-- upvalues: (copy) v_u_6, (copy) v_u_13, (copy) v_u_14, (copy) v_u_11
		v_u_6()
		local v31 = p_u_30:GetAttribute("Name")
		local v32 = p_u_30:GetAttribute("ImageId")
		local v33 = p_u_30:GetAttribute("Rarity")
		local v34 = p_u_30:GetAttribute("ItemID")
		local v35 = p_u_30:GetAttribute("ItemType")
		local v36 = v_u_13:WaitForChild("TradePlazaIndex").Frame
		local v37 = v36.Sections.ItemsList
		local v38 = v36.Sections.RAPHistory
		v38:SetAttribute("CurrentItem", v31)
		v38:SetAttribute("CurrentItemType", v35)
		v38.Title.Text = ("%*"):format(v31)
		v38.ItemImg.Image = v32
		local v39 = v38.RarityArea
		local v40
		if v33 then
			v40 = v_u_14[v33]
		else
			v40 = Color3.fromRGB()
		end
		v39.BackgroundColor3 = v40
		v39.TextLabel.Text = not v33 and "No Rarity" or ("%*"):format(v33)
		local v_u_41 = v38.Price.Amount
		p_u_30:GetAttributeChangedSignal("RAPValue"):Connect(function()
			-- upvalues: (copy) p_u_30, (copy) v_u_41
			local v42 = p_u_30:GetAttribute("RAPValue")
			v_u_41.Text = v42 and ("%*"):format(v42) or "??"
			return nil
		end)
		local v43 = p_u_30:GetAttribute("RAPValue")
		v_u_41.Text = v43 and ("%*"):format(v43) or "??"
		v_u_11:Show(v35, v34)
		v37.Visible = false
		v38.Visible = true
	end,
	["TradeBoothInventory"] = function(_, p44)
		-- upvalues: (copy) v_u_6, (copy) v_u_7, (copy) v_u_8, (copy) v_u_13, (copy) v_u_1
		v_u_6()
		local v45 = v_u_7:GetData().TradeData
		local v46 = p44.Item
		local v47 = v45.TradeLocks[v46.type]
		if v47 then
			v47 = v45.TradeLocks[v46.type][v46.id]
		end
		if v47 then
			v_u_8:CreateNotification("This item is on trade cooldown, you can\'t list it!")
			return
		else
			local v48 = v_u_13.TradeBoothInventory
			if v48.Frame.RightSide.RightSideFrame.Visible and v48.Frame.RightSide.RightSideFrame.Item.ITEM_NAME.Text == v46.data.ItemName then
				v48.Frame.RightSide.RightSideFrame.Visible = false
			else
				require(v_u_1.Modules.TradeBoothControllers.TradeBoothCreateListingController):PromptListItem(v46, v48)
			end
		end
	end
}