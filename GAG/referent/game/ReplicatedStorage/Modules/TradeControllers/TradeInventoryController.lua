local v_u_1 = game:GetService("Players")
local v_u_2 = game:GetService("StarterGui")
local v_u_3 = game:GetService("ReplicatedStorage")
local v4 = require("../Signal")
local v_u_5 = require("../GuiController")
local v_u_6 = require("../Notification")
require("../ItemImageFinder")
local v_u_7 = require("../ItemNameFinder")
local v_u_8 = require("../ItemRarityFinder")
require("../GardenGuideModules/DataModules/GGStaticData")
local v_u_9 = require(v_u_3.Modules.TradeControllers.TradeItemHoverController)
local v_u_10 = require(v_u_3.Modules.PlayClickSound)
local v_u_11 = require(v_u_3.Modules.TradeControllers.TradeUIUtils)
local v_u_12 = require(v_u_3.Modules.TradeTokens.TokenRAPController)
local v_u_13 = require(v_u_3.Modules.FriendsAPI)
local v_u_14 = require(v_u_3.Modules.Observers)
local v_u_15 = v_u_1.LocalPlayer or v_u_1.PlayerAdded:Wait()
local v_u_16 = v_u_15.PlayerGui.PlrInventory
local v17 = v_u_16.Frame
local v_u_18 = v17.ScrollingFrame
local v_u_19 = v17.Search.TextBox
local v_u_20 = v17.Empty
local v_u_21 = v17.TopBtns
local v_u_22 = v17.Title
local v_u_23 = v17.Close
local v_u_24 = v17.AddFriend
local v_u_25 = v17.Headshot.Vector
local v_u_26 = v17.Sort
local v_u_27 = v_u_26.Vector
local v_u_28 = v_u_26.Label
local v_u_29 = v_u_3.Modules.TradeTokens.Templates.HoverableItemTemplate
local v_u_30 = {
	["Seeds"] = { "Seed", "SeedPack" },
	["Plants"] = { "Holdable" },
	["Pets"] = { "Pet" },
	["Crates"] = {}
}
local v_u_31 = {
	["Ascending"] = 180,
	["Descending"] = 0
}
local v_u_32 = { "Name", "Rarity" }
local v88 = {
	["OnUpdated"] = v4.new(),
	["OnViewPlayerChanged"] = v4.new(),
	["Query"] = "",
	["SortType"] = "Rarity",
	["SortAscending"] = true,
	["Start"] = function(p_u_33)
		-- upvalues: (copy) v_u_5, (copy) v_u_16, (copy) v_u_23, (copy) v_u_24, (copy) v_u_10, (copy) v_u_2, (copy) v_u_19, (copy) v_u_26, (copy) v_u_21, (copy) v_u_30, (copy) v_u_14
		v_u_5:UsePopupAnims(v_u_16)
		v_u_23.Activated:Connect(function()
			-- upvalues: (ref) v_u_5, (ref) v_u_16, (copy) p_u_33
			v_u_5:Close(v_u_16)
			if p_u_33.Redirect then
				v_u_5:Open(p_u_33.Redirect)
				p_u_33.Redirect = nil
			end
			p_u_33:ClearInventory()
		end)
		v_u_24.Activated:Connect(function()
			-- upvalues: (ref) v_u_10, (copy) p_u_33, (ref) v_u_2
			v_u_10()
			if p_u_33.Player then
				v_u_2:SetCore("PromptSendFriendRequest", p_u_33.Player)
			end
		end)
		v_u_19:GetPropertyChangedSignal("Text"):Connect(function()
			-- upvalues: (copy) p_u_33, (ref) v_u_19
			p_u_33.Query = v_u_19.Text:lower()
			p_u_33:RefreshDisplay()
		end)
		v_u_26.Activated:Connect(function()
			-- upvalues: (ref) v_u_10, (copy) p_u_33
			v_u_10()
			p_u_33:ToggleSortType()
		end)
		for _, v_u_34 in v_u_21:GetChildren() do
			if not v_u_34:IsA("UIComponent") then
				local v_u_35 = v_u_34.Name
				if v_u_30[v_u_35] then
					v_u_34.Activated:Connect(function()
						-- upvalues: (ref) v_u_10, (copy) p_u_33, (copy) v_u_35
						v_u_10()
						p_u_33:UpdateInventory(v_u_35)
					end)
					p_u_33.OnUpdated:Connect(function(p36)
						-- upvalues: (copy) v_u_35, (copy) v_u_34
						if p36 == v_u_35 then
							v_u_34.BackgroundColor3 = Color3.new(0.2, 0.9, 0.2)
							v_u_34.UIStroke.Color = Color3.new(0, 0.6, 0)
							v_u_34.Label.UIStroke.Color = Color3.new(0, 0.3, 0)
						else
							v_u_34.BackgroundColor3 = Color3.new(0.5, 0.3, 0.2)
							v_u_34.UIStroke.Color = Color3.new(0.4, 0.25, 0.15)
							v_u_34.Label.UIStroke.Color = Color3.new(0.25, 0.15, 0)
						end
					end)
				else
					warn((("No category types for %*"):format(v_u_35)))
				end
			end
		end
		v_u_14.observePlayer(function(p_u_37)
			-- upvalues: (copy) p_u_33
			local v_u_38 = p_u_37:GetAttributeChangedSignal("ViewInventoryPermission"):Connect(function()
				-- upvalues: (ref) p_u_33, (copy) p_u_37
				p_u_33.OnViewPlayerChanged:Fire(p_u_37)
			end)
			return function()
				-- upvalues: (copy) v_u_38
				v_u_38:Disconnect()
			end
		end)
	end,
	["CanViewInventory"] = function(_, p39)
		-- upvalues: (copy) v_u_13, (copy) v_u_15
		local v40 = p39:GetAttribute("ViewInventoryPermission")
		if v40 == "Everyone" then
			return true
		elseif v40 == "Friends" then
			return v_u_13:IsFriendsWithImmediate(v_u_15, p39)
		else
			return false
		end
	end,
	["OpenInventory"] = function(p41, p42, p43)
		-- upvalues: (copy) v_u_6, (copy) v_u_3, (copy) v_u_5, (copy) v_u_16
		if p41:CanViewInventory(p42) then
			local v44, v45 = v_u_3.GameEvents.TradeEvents.ViewInventory:InvokeServer(p42)
			if v44 and typeof(v45) == "table" then
				p41:SetRedirect(p43)
				p41:SetInventory(p42, v45)
				v_u_5:Open(v_u_16)
				return
			elseif typeof(v45) == "string" then
				v_u_6:CreateNotification(v45, false, 7)
			else
				v_u_6:CreateNotification("Failed to load inventory", false, 7)
			end
		else
			v_u_6:CreateNotification("You don\'t have permission to view the inventory of this user", false, 7)
			return
		end
	end,
	["SetInventory"] = function(p46, p_u_47, p48)
		-- upvalues: (copy) v_u_19, (copy) v_u_22, (copy) v_u_13, (copy) v_u_15, (copy) v_u_24, (copy) v_u_25, (copy) v_u_1
		p46.Player = p_u_47
		p46.Inventory = p48
		p46.Query = ""
		v_u_19.Text = ""
		v_u_22.Text = "@" .. p_u_47.DisplayName .. "\'s Inventory"
		if v_u_13:IsFriendsWithImmediate(v_u_15, p_u_47) then
			v_u_24.Visible = false
		else
			v_u_24.Visible = true
		end
		pcall(function()
			-- upvalues: (ref) v_u_25, (ref) v_u_1, (copy) p_u_47
			v_u_25.Image = v_u_1:GetUserThumbnailAsync(p_u_47.UserId, Enum.ThumbnailType.HeadShot, Enum.ThumbnailSize.Size48x48)
		end)
		p46:UpdateInventory("Plants")
	end,
	["UpdateInventory"] = function(p49, p50)
		if p49.Inventory then
			local v51 = p50 or (p49.CurrentCategory or "Seeds")
			p49.CurrentCategory = v51
			p49:RefreshDisplay()
			p49.OnUpdated:Fire(v51)
		else
			warn("Inventory is not loaded")
		end
	end,
	["RefreshDisplay"] = function(p52)
		-- upvalues: (copy) v_u_11, (copy) v_u_20
		if p52.CurrentCategory then
			local v53 = p52:FilterItems((p52:GetItemsByCategory(p52.CurrentCategory)))
			local v54 = v_u_11.SortTradeItems(p52.SortType, p52.SortAscending, v53)
			p52:ClearInventory()
			for _, v55 in v54 do
				p52:CreateItemCard(v55)
			end
			if #v54 == 0 then
				v_u_20.Visible = true
			else
				v_u_20.Visible = false
			end
		else
			return
		end
	end,
	["ClearInventory"] = function(_)
		-- upvalues: (copy) v_u_18, (copy) v_u_29
		for _, v56 in v_u_18:GetChildren() do
			if not v56:IsA("UIComponent") and v56 ~= v_u_29 then
				v56:Destroy()
			end
		end
	end,
	["SetRedirect"] = function(p57, p58)
		p57.Redirect = p58
	end,
	["CreateItemCard"] = function(p59, p60)
		-- upvalues: (copy) v_u_29, (copy) v_u_9, (copy) v_u_18
		local v61 = v_u_29:Clone()
		p59:UpdateItemCard(v61, p60)
		v61:SetAttribute("UUID", p60.id)
		v61:AddTag("TradingUserInterfaceTargetable")
		v_u_9:AddItemToData(p60.id, p60)
		if p60.tradeLock then
			local v62 = p60.tradeLock.Type == "Permanent" and true or p60.tradeLock.Type == "Date"
			v61.LockIcon.Visible = v62
		end
		v61.Price.Visible = false
		v61.Visible = true
		v61.Parent = v_u_18
		return v61
	end,
	["UpdateItemCard"] = function(_, p63, p64)
		-- upvalues: (copy) v_u_11
		v_u_11.PopulateItemFrame(p63, p64)
	end,
	["FilterItems"] = function(p65, p66)
		-- upvalues: (copy) v_u_7
		if p65.Query == "" then
			return p66
		end
		local v67 = {}
		for _, v68 in p66 do
			if v_u_7(v68.data.Name or v68.data.ItemName or (v68.data.PetType or ""), v68.type):lower():find(p65.Query, 1, true) then
				table.insert(v67, v68)
			end
		end
		return v67
	end,
	["SortItems"] = function(p_u_69, p70)
		-- upvalues: (copy) v_u_7, (copy) v_u_8, (copy) v_u_12
		local v71 = table.clone(p70)
		table.sort(v71, function(p72, p73)
			-- upvalues: (copy) p_u_69, (ref) v_u_7, (ref) v_u_8, (ref) v_u_12
			local v74 = nil
			local v75 = nil
			if p_u_69.SortType == "Name" then
				v74 = v_u_7(p72.data.Name or p72.data.ItemName or (p72.data.PetType or ""), p72.type)
				v75 = v_u_7(p73.data.Name or p73.data.ItemName or (p73.data.PetType or ""), p73.type)
			elseif p_u_69.SortType == "Rarity" then
				local v76 = v_u_8(p72.data.Name or (p72.data.ItemName or p72.data.PetType), p72.type)
				local v77 = v_u_8(p73.data.Name or (p73.data.ItemName or p73.data.PetType), p73.type)
				v74 = v76 and v76.Value or 0
				v75 = v77 and v77.Value or 0
			elseif p_u_69.SortType == "RAP" then
				v74 = v_u_12:GetRAP(p72.type, p72.data) or 0
				v75 = v_u_12:GetRAP(p73.type, p73.data) or 0
			end
			if p_u_69.SortAscending then
				return v74 < v75
			else
				return v75 < v74
			end
		end)
		return v71
	end,
	["GetItemsByCategory"] = function(p78, p79)
		-- upvalues: (copy) v_u_30
		if not p78.Inventory then
			return {}
		end
		local v80 = v_u_30[p79]
		if not v80 then
			warn((("No category types for %*"):format(p79)))
			return {}
		end
		local v81 = {}
		for _, v82 in p78.Inventory do
			if table.find(v80, v82.type) then
				table.insert(v81, v82)
			end
		end
		return v81
	end,
	["ToggleSortOrder"] = function(p83, p84)
		-- upvalues: (copy) v_u_27, (copy) v_u_31
		p83.SortAscending = not p83.SortAscending
		v_u_27.Rotation = p83.SortAscending and v_u_31.Ascending or v_u_31.Descending
		if p84 == nil or p84 == true then
			p83:RefreshDisplay()
		end
	end,
	["ToggleSortType"] = function(p85)
		-- upvalues: (copy) v_u_32
		if p85.SortAscending then
			p85:ToggleSortOrder()
		else
			p85:ToggleSortOrder(false)
			p85:SetSortType(v_u_32[table.find(v_u_32, p85.SortType) % #v_u_32 + 1])
		end
	end,
	["SetSortType"] = function(p86, p87)
		-- upvalues: (copy) v_u_28
		p86.SortType = p87
		v_u_28.Text = p87
		p86:RefreshDisplay()
	end
}
task.spawn(v88.Start, v88)
return v88