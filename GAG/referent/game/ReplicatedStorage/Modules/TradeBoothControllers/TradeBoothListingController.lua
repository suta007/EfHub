local v1 = game:GetService("Players")
game:GetService("StarterGui")
local v_u_2 = game:GetService("ReplicatedStorage")
local v_u_3 = require(v_u_2.Modules.TradeControllers.TradeItemHoverController)
local v_u_4 = require(v_u_2.Modules.TradeBoothControllers.TradeBoothBuyItemController)
require(v_u_2.Modules.GardenGuideModules.DataModules.GGStaticData)
local v5 = require(v_u_2.Modules.ReplicationReciever)
require(v_u_2.UserGenerated.Collections.DeepCopy)
require(v_u_2.Modules.ItemRarityFinder)
require(v_u_2.Modules.ItemImageFinder)
local v_u_6 = require(v_u_2.Modules.ItemNameFinder)
local v_u_7 = require(v_u_2.Data.TradeBoothsData)
local v_u_8 = require(v_u_2.Modules.GuiController)
require(v_u_2.Modules.Notification)
local v_u_9 = require(v_u_2.Modules.DataService)
local v_u_10 = require(v_u_2.Modules.NumberUtil)
local v11 = require(v_u_2.Modules.Signal)
local v_u_12 = require(v_u_2.Modules.PlayClickSound)
local v_u_13 = require(v_u_2.Modules.TradeControllers.TradeUIUtils)
local v_u_14 = v_u_2.GameEvents.TradeEvents.Booths.RemoveBooth
local v_u_15 = v1.LocalPlayer
local v_u_16 = v_u_15.PlayerGui
local v_u_17 = v_u_16.TradeBoothSkinSelector
local v_u_18 = v_u_16.TradeBoothHistory
local v_u_19 = v_u_16.TradeBooth
local v_u_20 = v_u_19.Frame.ItemsList.ScrollingFrame
local v_u_21 = v_u_19.Frame.SearchFrame.SearchBox
local v_u_22 = v_u_19.Frame.Close
local v_u_23 = v_u_19.Frame.Sort
local v_u_24 = v_u_23.Vector
local v_u_25 = v_u_23.Label
local v_u_26 = v_u_19.Frame.Frame.Unclaim
local v_u_27 = v_u_19.Frame.Frame.History
local v_u_28 = v_u_19.Frame.Frame.Edit
local v_u_29 = v_u_2.Modules.TradeTokens.Templates.HoverableItemTemplate
local v_u_30 = v5.new("Booths")
local v_u_31 = {
	["Ascending"] = 180,
	["Descending"] = 0
}
local v_u_32 = { "Name", "Rarity", "Price" }
local v99 = {
	["OnUpdated"] = v11.new(),
	["Query"] = "",
	["SortType"] = "Rarity",
	["SortAscending"] = true,
	["Start"] = function(p_u_33)
		-- upvalues: (copy) v_u_30, (copy) v_u_8, (copy) v_u_19, (copy) v_u_20, (copy) v_u_12, (copy) v_u_16, (copy) v_u_22, (copy) v_u_21, (copy) v_u_23, (copy) v_u_27, (copy) v_u_18, (copy) v_u_28, (copy) v_u_17, (copy) v_u_26, (copy) v_u_14, (copy) v_u_9, (copy) v_u_10
		v_u_30:GetDataAsync()
		v_u_8:UsePopupAnims(v_u_19)
		v_u_20.Add.SENSOR.Activated:Connect(function()
			-- upvalues: (ref) v_u_12, (ref) v_u_8, (ref) v_u_16
			v_u_12()
			v_u_8:Open(v_u_16.TradeBoothInventory)
		end)
		v_u_22.Activated:Connect(function()
			-- upvalues: (ref) v_u_8, (ref) v_u_19, (copy) p_u_33
			v_u_8:Close(v_u_19)
			if p_u_33.Redirect then
				v_u_8:Open(p_u_33.Redirect)
				p_u_33.Redirect = nil
			end
			p_u_33:ClearInventory()
		end)
		v_u_21:GetPropertyChangedSignal("Text"):Connect(function()
			-- upvalues: (copy) p_u_33, (ref) v_u_21
			p_u_33.Query = v_u_21.Text:lower()
			p_u_33:RefreshDisplay()
		end)
		v_u_23.Activated:Connect(function()
			-- upvalues: (ref) v_u_12, (copy) p_u_33
			v_u_12()
			p_u_33:ToggleSortType()
		end)
		v_u_27.Activated:Connect(function()
			-- upvalues: (ref) v_u_8, (ref) v_u_19, (ref) v_u_18
			v_u_8:Close(v_u_19)
			v_u_8:Open(v_u_18)
		end)
		v_u_28.Activated:Connect(function()
			-- upvalues: (ref) v_u_8, (ref) v_u_19, (ref) v_u_17
			v_u_8:Close(v_u_19)
			v_u_8:Open(v_u_17)
		end)
		v_u_26.Activated:Connect(function()
			-- upvalues: (ref) v_u_14
			v_u_14:FireServer()
		end)
		v_u_8:GetStateForGui(v_u_19).Visible:Observe(function(p34)
			-- upvalues: (copy) p_u_33, (ref) v_u_21
			if p34 then
				p_u_33:UpdateInventory()
			else
				p_u_33.Query = ""
				v_u_21.Text = ""
			end
		end)
		local v_u_35 = v_u_9:GetData()
		local v_u_36 = v_u_19.Frame.TokenCounter
		v_u_36.Label.Text = ("Tokens: %*"):format((v_u_10.Comma(v_u_35.TradeData.Tokens)))
		v_u_9:GetPathSignal("TradeData/Tokens"):Connect(function()
			-- upvalues: (copy) v_u_36, (ref) v_u_10, (copy) v_u_35
			v_u_36.Label.Text = ("Tokens: %*"):format((v_u_10.Comma(v_u_35.TradeData.Tokens)))
		end)
		local v37 = v_u_36.Buy
		local v_u_38 = v_u_16:WaitForChild("BuyTokens")
		local v_u_39 = v_u_19
		v37.Activated:Connect(function()
			-- upvalues: (copy) v_u_38, (ref) v_u_8, (copy) v_u_39
			local v40 = v_u_38:FindFirstChild("Close", true)
			if v40 then
				v40.Activated:Once(function()
					-- upvalues: (ref) v_u_8, (ref) v_u_38, (ref) v_u_39
					v_u_8:Close(v_u_38)
					v_u_8:Open(v_u_39)
				end)
			end
			v_u_8:Open(v_u_38)
		end)
		local v41 = v_u_36.Info
		local v_u_42 = v_u_16:WaitForChild("TokensInfo")
		local v_u_43 = v_u_19
		v41.Activated:Connect(function()
			-- upvalues: (copy) v_u_42, (ref) v_u_8, (copy) v_u_43
			local v44 = v_u_42:FindFirstChild("Close", true)
			if v44 then
				v44.Activated:Once(function()
					-- upvalues: (ref) v_u_8, (ref) v_u_42, (ref) v_u_43
					v_u_8:Close(v_u_42)
					v_u_8:Open(v_u_43)
				end)
			end
			v_u_8:Open(v_u_42)
		end)
	end,
	["SetBooth"] = function(p_u_45, p_u_46)
		-- upvalues: (copy) v_u_30
		if p_u_45._playerBoothConn then
			p_u_45._playerBoothConn:Disconnect()
			p_u_45._playerBoothConn = nil
		end
		if p_u_45._boothConn then
			p_u_45._boothConn:Disconnect()
			p_u_45._boothConn = nil
		end
		p_u_45.BoothUUID = p_u_46
		p_u_45:RefreshDisplay()
		local v_u_47 = v_u_30:GetDataAsync()
		local v48 = v_u_30:GetPathSignal((("Booths/%*/Owner"):format(p_u_46)))
		if v48 then
			p_u_45._boothConn = v48:Connect(function()
				-- upvalues: (copy) p_u_45, (copy) v_u_47, (copy) p_u_46, (ref) v_u_30
				if p_u_45._playerBoothConn then
					p_u_45._playerBoothConn:Disconnect()
					p_u_45._playerBoothConn = nil
				end
				local v49 = v_u_47 and (p_u_46 and v_u_47.Booths[p_u_46])
				if v49 then
					v49 = v_u_47.Booths[p_u_46].Owner
				end
				local v50 = v49 and v_u_30:GetPathSignal((("Players/%*/@"):format(v49)))
				if v50 then
					p_u_45._playerBoothConn = v50:Connect(function()
						-- upvalues: (ref) p_u_45
						p_u_45:RefreshDisplay()
					end)
				end
				p_u_45:RefreshDisplay()
			end)
		end
		local v51 = v_u_47 and (p_u_46 and v_u_47.Booths[p_u_46])
		if v51 then
			v51 = v_u_47.Booths[p_u_46].Owner
		end
		local v52 = v51 and v_u_30:GetPathSignal((("Players/%*/@"):format(v51)))
		if v52 then
			p_u_45._playerBoothConn = v52:Connect(function()
				-- upvalues: (copy) p_u_45
				p_u_45:RefreshDisplay()
			end)
		end
	end,
	["SetRedirect"] = function(p53, p54)
		p53.Redirect = p54
	end,
	["CreateItemCard"] = function(p_u_55, p_u_56)
		-- upvalues: (copy) v_u_29, (copy) v_u_30, (copy) v_u_7, (copy) v_u_15, (copy) v_u_3, (copy) v_u_2, (copy) v_u_19, (copy) v_u_4, (copy) v_u_20
		local v_u_57 = v_u_29:Clone()
		p_u_55:UpdateItemCard(v_u_57, p_u_56)
		local v_u_60 = v_u_57.SENSOR.MouseEnter:Connect(function()
			-- upvalues: (ref) v_u_30, (copy) p_u_55, (ref) v_u_7, (ref) v_u_15, (copy) v_u_57
			local v58 = v_u_30:GetData()
			local v59 = v58 and (p_u_55.BoothUUID and v58.Booths[p_u_55.BoothUUID])
			if v59 then
				v59 = v58.Booths[p_u_55.BoothUUID].Owner
			end
			if v59 == v_u_7.getPlayerId(v_u_15) then
				v_u_57.TrashImg.Visible = true
			end
		end)
		local v_u_61 = v_u_57.SENSOR.MouseLeave:Connect(function()
			-- upvalues: (copy) v_u_57
			v_u_57.TrashImg.Visible = false
		end)
		v_u_57:SetAttribute("UUID", p_u_56.id)
		v_u_57:AddTag("TradingUserInterfaceTargetable")
		v_u_3:AddItemToData(p_u_56.id, p_u_56)
		local v_u_64 = v_u_57.SENSOR.Activated:Connect(function()
			-- upvalues: (ref) v_u_30, (copy) p_u_55, (ref) v_u_7, (ref) v_u_15, (ref) v_u_2, (copy) p_u_56, (ref) v_u_19, (ref) v_u_4
			local v62 = v_u_30:GetDataAsync()
			local v63 = v62 and (p_u_55.BoothUUID and v62.Booths[p_u_55.BoothUUID])
			if v63 then
				v63 = v62.Booths[p_u_55.BoothUUID].Owner
			end
			if v63 == v_u_7.getPlayerId(v_u_15) then
				require(v_u_2.Modules.TradeBoothControllers.TradeBoothRemoveListingController):PromptRemoveListing(p_u_56, v_u_19)
			else
				v_u_4:PromptBuyListing(p_u_56, v_u_19)
			end
		end)
		v_u_57.Destroying:Once(function()
			-- upvalues: (copy) v_u_60, (copy) v_u_61, (copy) v_u_64
			v_u_60:Disconnect()
			v_u_61:Disconnect()
			v_u_64:Disconnect()
		end)
		v_u_57.Visible = true
		v_u_57.Parent = v_u_20
		return v_u_57
	end,
	["UpdateItemCard"] = function(_, p65, p66)
		-- upvalues: (copy) v_u_13
		v_u_13.PopulateItemFrame(p65, p66)
	end,
	["FilterItems"] = function(p67, p68)
		-- upvalues: (copy) v_u_6
		if p67.Query == "" then
			return p68
		end
		local v69 = {}
		for _, v70 in p68 do
			if v_u_6(v70.data.Name or v70.data.ItemName or (v70.data.PetType or ""), v70.type):lower():find(p67.Query, 1, true) then
				table.insert(v69, v70)
			end
		end
		return v69
	end,
	["GetInventory"] = function(p71)
		-- upvalues: (copy) v_u_30, (copy) v_u_7
		if not p71.BoothUUID then
			return {}
		end
		local v72 = v_u_30:GetDataAsync()
		local v73 = v72.Booths[p71.BoothUUID]
		if not v73 then
			return {}
		end
		local v74 = v73.Owner
		if not v74 then
			return {}
		end
		local v75 = v72.Players[v74]
		if not v75 then
			return {}
		end
		local v76 = v_u_7.getPlayerById(v74)
		local v77 = {}
		for v78, v79 in v75.Listings do
			local v80 = v75.Items[v79.ItemId]
			if v80 then
				local v81 = {
					["id"] = v79.ItemId,
					["type"] = v79.ItemType,
					["data"] = v80,
					["listingOwner"] = v76,
					["listingUUID"] = v78,
					["listingPrice"] = v79.Price
				}
				table.insert(v77, v81)
			end
		end
		return v77
	end,
	["UpdateInventory"] = function(p82)
		p82:RefreshDisplay()
		p82.OnUpdated:Fire()
	end,
	["RefreshDisplay"] = function(p83)
		-- upvalues: (copy) v_u_30, (copy) v_u_7, (copy) v_u_15, (copy) v_u_8, (copy) v_u_19, (copy) v_u_20, (copy) v_u_26, (copy) v_u_27, (copy) v_u_13
		local v84 = v_u_30:GetDataAsync()
		local v85 = v84 and (p83.BoothUUID and v84.Booths[p83.BoothUUID])
		if v85 then
			v85 = v84.Booths[p83.BoothUUID].Owner
		end
		local v86 = v85 == v_u_7.getPlayerId(v_u_15)
		if v85 then
			local v87 = v_u_7.getPlayerById(v85)
			v_u_20.Add.Visible = v86
			local v88 = v_u_19.Frame.Title
			local v89
			if v86 then
				v89 = "My Booth"
			elseif v87 then
				v89 = ("@%*\'s\' Booth"):format(v87.Name)
			else
				v89 = ("%* Booth"):format(v85)
			end
			v88.Text = v89
			v_u_26.Visible = v86
			v_u_27.Visible = v86
			local v90 = p83:FilterItems((p83:GetInventory()))
			local v91 = v_u_13.SortTradeItems(p83.SortType, p83.SortAscending, v90)
			p83:ClearInventory()
			for _, v92 in v91 do
				p83:CreateItemCard(v92)
			end
		else
			v_u_8:Close(v_u_19)
		end
	end,
	["ClearInventory"] = function(_)
		-- upvalues: (copy) v_u_20, (copy) v_u_29
		for _, v93 in v_u_20:GetChildren() do
			if not v93:IsA("UIComponent") and (v93 ~= v_u_29 and v93.Name ~= "Add") then
				v93:Destroy()
			end
		end
	end,
	["ToggleSortOrder"] = function(p94, p95)
		-- upvalues: (copy) v_u_24, (copy) v_u_31
		p94.SortAscending = not p94.SortAscending
		v_u_24.Rotation = p94.SortAscending and v_u_31.Ascending or v_u_31.Descending
		if p95 == nil or p95 == true then
			p94:RefreshDisplay()
		end
	end,
	["ToggleSortType"] = function(p96)
		-- upvalues: (copy) v_u_32
		if p96.SortAscending then
			p96:ToggleSortOrder()
		else
			p96:ToggleSortOrder(false)
			p96:SetSortType(v_u_32[table.find(v_u_32, p96.SortType) % #v_u_32 + 1])
		end
	end,
	["SetSortType"] = function(p97, p98)
		-- upvalues: (copy) v_u_25
		p97.SortType = p98
		v_u_25.Text = p98
		p97:RefreshDisplay()
	end
}
task.spawn(v99.Start, v99)
return v99