local v1 = game:GetService("Players")
game:GetService("StarterGui")
local v_u_2 = game:GetService("ReplicatedStorage")
local v3 = require(v_u_2.Modules.Signal)
local v_u_4 = require(v_u_2.Modules.GuiController)
local v_u_5 = require(v_u_2.Modules.Notification)
require(v_u_2.Modules.ItemImageFinder)
local v_u_6 = require(v_u_2.Modules.ItemNameFinder)
require(v_u_2.Modules.ItemRarityFinder)
require(v_u_2.Modules.GardenGuideModules.DataModules.GGStaticData)
local v_u_7 = require(v_u_2.UserGenerated.Collections.DeepCopy)
local v_u_8 = require(v_u_2.Modules.DataService)
require(v_u_2.Data.TradeData)
local v_u_9 = require(v_u_2.Modules.TradeControllers.TradeItemHoverController)
local v_u_10 = require(v_u_2.Modules.PlayClickSound)
local v_u_11 = require(v_u_2.Modules.TradeControllers.TradeUIUtils)
require(v_u_2.Modules.TradeTokens.TokenRAPController)
require(v_u_2.Modules.GardenGuideModules.VirtualList)
local v12 = require(v_u_2.Modules.TradeControllers.TradeWorldController)
local v_u_13 = v1.LocalPlayer.PlayerGui
local v_u_14 = v_u_13.TradeBoothInventory
local v15 = v_u_14.Frame
local v_u_16 = v15.ScrollingFrame
local v_u_17 = v15.SearchFrame.SearchBox
local v_u_18 = v15.Empty
local v_u_19 = v15.TopBtns
local v_u_20 = v15.Close
local v_u_21 = v15.Sort
local v_u_22 = v_u_21.Vector
local v_u_23 = v_u_21.Label
local v_u_24 = v_u_2.Modules.TradeTokens.Templates.HoverableItemTemplate
local v_u_25 = {
	["Seeds"] = { "Seed", "SeedPack" },
	["Plants"] = { "Holdable" },
	["Pets"] = { "Pet" },
	["TradeBoothSkins"] = { "TradeBoothSkin" },
	["Crates"] = {}
}
local v_u_26 = {
	["Ascending"] = 180,
	["Descending"] = 0
}
local v_u_27 = { "Name", "Rarity" }
local v28 = {
	["_cache"] = {},
	["OnUpdated"] = v3.new(),
	["Query"] = "",
	["SortType"] = "Rarity",
	["SortAscending"] = true
}
local function v_u_34(p29)
	-- upvalues: (copy) v_u_8
	local v30 = v_u_8:GetData()
	if v30 then
		if v30.PetsData then
			if v30.InventoryData then
				local v31 = false
				local v32 = v30.InventoryData[p29.id]
				local v33 = v30.PetsData.PetInventory.Data[p29.id]
				if v32 then
					return v32.ItemData.IsFavorite or false
				end
				if v33 then
					v31 = v33.PetData.IsFavorite or false
				end
				return v31
			end
			warn("No item inventory data")
		else
			warn("No pet data")
		end
	else
		warn("No player data")
		return
	end
end
function v28.Start(p_u_35)
	-- upvalues: (copy) v_u_4, (copy) v_u_14, (copy) v_u_20, (copy) v_u_17, (copy) v_u_21, (copy) v_u_10, (copy) v_u_19, (copy) v_u_25, (copy) v_u_8, (copy) v_u_7, (copy) v_u_13
	v_u_4:UsePopupAnims(v_u_14)
	v_u_20.Activated:Connect(function()
		-- upvalues: (ref) v_u_4, (ref) v_u_14, (copy) p_u_35
		v_u_4:Close(v_u_14)
		if p_u_35.Redirect then
			v_u_4:Open(p_u_35.Redirect)
			p_u_35.Redirect = nil
		end
		p_u_35:ClearInventory()
	end)
	v_u_17:GetPropertyChangedSignal("Text"):Connect(function()
		-- upvalues: (copy) p_u_35, (ref) v_u_17
		p_u_35.Query = v_u_17.Text:lower()
		p_u_35:RefreshDisplay()
	end)
	v_u_21.Activated:Connect(function()
		-- upvalues: (ref) v_u_10, (copy) p_u_35
		v_u_10()
		p_u_35:ToggleSortType()
	end)
	for _, v_u_36 in v_u_19:GetChildren() do
		if not v_u_36:IsA("UIComponent") then
			local v_u_37 = v_u_36.Name
			if v_u_25[v_u_37] then
				v_u_36.Activated:Connect(function()
					-- upvalues: (ref) v_u_10, (copy) p_u_35, (copy) v_u_37
					v_u_10()
					p_u_35:UpdateInventory(v_u_37)
				end)
				p_u_35.OnUpdated:Connect(function(p38)
					-- upvalues: (copy) v_u_37, (copy) v_u_36
					if p38 == v_u_37 then
						v_u_36.BackgroundColor3 = Color3.new(0.2, 0.9, 0.2)
						v_u_36.UIStroke.Color = Color3.new(0, 0.6, 0)
						v_u_36.Label.UIStroke.Color = Color3.new(0, 0.3, 0)
					else
						v_u_36.BackgroundColor3 = Color3.new(0.5, 0.3, 0.2)
						v_u_36.UIStroke.Color = Color3.new(0.4, 0.25, 0.15)
						v_u_36.Label.UIStroke.Color = Color3.new(0.25, 0.15, 0)
					end
				end)
			else
				warn((("No category types for %*"):format(v_u_37)))
			end
		end
	end
	local v_u_39 = v_u_4:GetStateForGui(v_u_14)
	local v_u_40 = v_u_8:GetData()
	local function v_u_54()
		-- upvalues: (copy) v_u_40, (ref) v_u_7
		local v41 = {}
		for v42, v43 in v_u_40.InventoryData do
			if v43.ItemType == "Holdable" or v43.ItemType == "Packaged Seed" then
				local v44 = {
					["id"] = v42,
					["type"] = v43.ItemType,
					["data"] = v_u_7(v43.ItemData)
				}
				local v45 = v_u_40.TradeData.TradeLocks[v43.ItemType]
				if v45 then
					v45 = v_u_40.TradeData.TradeLocks[v43.ItemType][v42]
				end
				v44.tradeLock = v45
				table.insert(v41, v44)
			end
		end
		for v46, v47 in v_u_40.PetsData.PetInventory.Data do
			local v48 = {
				["id"] = v46,
				["type"] = "Pet",
				["data"] = v_u_7(v47)
			}
			local v49 = v_u_40.TradeData.TradeLocks.Pet
			if v49 then
				v49 = v_u_40.TradeData.TradeLocks.Pet[v46]
			end
			v48.tradeLock = v49
			table.insert(v41, v48)
		end
		for v50, v51 in v_u_40.TradeBoothSkinData.OwnedSkins do
			if typeof(v51) ~= "boolean" and v51 > 0 then
				local v52 = {
					["id"] = v50,
					["type"] = "TradeBoothSkin",
					["data"] = {
						["SkinID"] = v50
					}
				}
				local v53 = v_u_40.TradeData.TradeLocks.TradeBoothSkin
				if v53 then
					v53 = v_u_40.TradeData.TradeLocks.TradeBoothSkin[v50]
				end
				v52.tradeLock = v53
				table.insert(v41, v52)
			end
		end
		return v41
	end
	v_u_8:GetPathSignal("PetsData/PetInventory/Data/*"):Connect(function()
		-- upvalues: (copy) v_u_54, (copy) p_u_35, (copy) v_u_39
		p_u_35.Inventory = v_u_54()
		if v_u_39.Visible:Get() and p_u_35.CurrentCategory == "Pets" then
			p_u_35:UpdateInventory(p_u_35.CurrentCategory)
		end
	end)
	v_u_8:GetPathSignal("InventoryData/*"):Connect(function()
		-- upvalues: (copy) v_u_54, (copy) p_u_35, (copy) v_u_39
		p_u_35.Inventory = v_u_54()
		if v_u_39.Visible:Get() and p_u_35.CurrentCategory == "Holdable" then
			p_u_35:UpdateInventory(p_u_35.CurrentCategory)
		end
	end)
	v_u_8:GetPathSignal("TradeBoothSkinData/OwnedSkins/*"):Connect(function()
		-- upvalues: (copy) v_u_54, (copy) p_u_35, (copy) v_u_39
		p_u_35.Inventory = v_u_54()
		if v_u_39.Visible:Get() and p_u_35.CurrentCategory == "TradeBoothSkins" then
			p_u_35:UpdateInventory(p_u_35.CurrentCategory)
		end
	end)
	task.spawn(function(p55)
		-- upvalues: (copy) v_u_54, (copy) p_u_35, (copy) v_u_39
		p_u_35.Inventory = v_u_54()
		if v_u_39.Visible:Get() and (p55 == nil or p55 == p_u_35.CurrentCategory) then
			p_u_35:UpdateInventory(p_u_35.CurrentCategory)
		end
	end)
	v_u_39.Visible:Observe(function(p56)
		-- upvalues: (copy) p_u_35, (ref) v_u_17
		if p56 then
			p_u_35:UpdateInventory("Plants")
		else
			p_u_35.Query = ""
			v_u_17.Text = ""
		end
	end)
	v_u_13:WaitForChild("TradeItemHover").TradeItemHover.CanvasGroup.GroupTransparency = 1
end
function v28.SetRedirect(p57, p58)
	p57.Redirect = p58
end
function v28.CreateItemCard(p59, p_u_60)
	-- upvalues: (copy) v_u_24, (copy) v_u_9, (copy) v_u_34, (copy) v_u_14, (copy) v_u_10, (copy) v_u_8, (copy) v_u_5, (copy) v_u_2, (copy) v_u_16
	local v61 = v_u_24:Clone()
	p59:UpdateItemCard(v61, p_u_60)
	v61:SetAttribute("UUID", p_u_60.id)
	v61:AddTag("TradingUserInterfaceTargetable")
	v_u_9:AddItemToData(p_u_60.id, p_u_60)
	if p_u_60.tradeLock then
		local v62 = p_u_60.tradeLock.Type == "Permanent" and true or p_u_60.tradeLock.Type == "Date"
		v61.LockIcon.Visible = v62
	end
	v61.FavIcon.Visible = v_u_34(p_u_60)
	v_u_14.Frame.RightSide.RightSideFrame:SetAttribute("ItemID", p_u_60.id)
	local v_u_65 = v61.SENSOR.Activated:Connect(function()
		-- upvalues: (ref) v_u_10, (ref) v_u_8, (copy) p_u_60, (ref) v_u_5, (ref) v_u_14, (ref) v_u_34, (ref) v_u_2
		v_u_10()
		local v63 = v_u_8:GetData()
		local v64 = v63.TradeData.TradeLocks[p_u_60.type]
		if v64 then
			v64 = v63.TradeData.TradeLocks[p_u_60.type][p_u_60.id]
		end
		if v64 then
			v_u_5:CreateNotification("This item is on trade cooldown, you can\'t list it!")
			v_u_14.Frame.RightSide.RightSideFrame.Visible = false
			return
		elseif v_u_34(p_u_60) then
			v_u_5:CreateNotification("This item is favorited, you can\'t list it!")
			v_u_14.Frame.RightSide.RightSideFrame.Visible = false
			return
		elseif v_u_14.Frame.RightSide.RightSideFrame.Visible and v_u_14.Frame.RightSide.RightSideFrame:GetAttribute("ItemID") == p_u_60.id then
			v_u_14.Frame.RightSide.RightSideFrame.Visible = false
		else
			require(v_u_2.Modules.TradeBoothControllers.TradeBoothCreateListingController):PromptListItem(p_u_60, v_u_14)
		end
	end)
	v61.Destroying:Once(function()
		-- upvalues: (copy) v_u_65
		v_u_65:Disconnect()
	end)
	v61.Visible = true
	v61.Parent = v_u_16
	p59._cache[p_u_60.id] = v61
	return v61
end
function v28.UpdateItemCard(_, p66, p67)
	-- upvalues: (copy) v_u_11
	v_u_11.PopulateItemFrame(p66, p67)
end
function v28.FilterItems(p68, p69)
	-- upvalues: (copy) v_u_8, (copy) v_u_6
	local v70 = {}
	for _, v71 in v_u_8:GetData().TradeData.Listings do
		v70[v71.ItemId] = true
	end
	if p68.Query == "" then
		local v72 = {}
		for _, v73 in p69 do
			if not v70[v73.id] then
				table.insert(v72, v73)
			end
		end
		return v72
	else
		local v74 = {}
		for _, v75 in p69 do
			if not v70[v75.id] and v_u_6(v75.data.Name or v75.data.ItemName or (v75.data.PetType or ""), v75.type):lower():find(p68.Query, 1, true) then
				table.insert(v74, v75)
			end
		end
		return v74
	end
end
function v28.GetItemsByCategory(p76, p77)
	-- upvalues: (copy) v_u_8, (copy) v_u_25
	if not p76.Inventory then
		return {}
	end
	local v78 = v_u_8:GetData()
	if v78 then
		local v79 = v_u_25[p77]
		if not v79 then
			warn((("No category types for %*"):format(p77)))
			return {}
		end
		local v80 = {}
		for _, v81 in p76.Inventory do
			if table.find(v79, v81.type) and (v81.type ~= "TradeBoothSkin" or v81.id ~= "Default" and v81.id ~= v78.TradeBoothSkinData.CurrentSkin) then
				table.insert(v80, v81)
			end
		end
		return v80
	end
end
function v28.UpdateInventory(p82, p83)
	if p82.Inventory then
		local v84 = p83 or (p82.CurrentCategory or "Seeds")
		p82.CurrentCategory = v84
		p82:RefreshDisplay()
		p82.OnUpdated:Fire(v84)
	else
		warn("Inventory is not loaded")
	end
end
function v28.RefreshDisplay(p85)
	-- upvalues: (copy) v_u_11, (copy) v_u_18, (copy) v_u_14
	if p85.CurrentCategory then
		local v86 = p85:FilterItems((p85:GetItemsByCategory(p85.CurrentCategory)))
		local v87 = v_u_11.SortTradeItems(p85.SortType, p85.SortAscending, v86)
		local v88 = {}
		for v89, v90 in v87 do
			v88[v90.id] = true
			local v91 = p85._cache[v90.id]
			if v91 then
				p85:UpdateItemCard(v91, v90)
				v91.LayoutOrder = v89
			else
				p85:CreateItemCard(v90).LayoutOrder = v89
			end
		end
		for v92, v93 in p85._cache do
			if not v88[v92] then
				v93:Destroy()
				p85._cache[v92] = nil
			end
		end
		if #v87 == 0 then
			v_u_18.Visible = true
		else
			v_u_18.Visible = false
		end
		v_u_14.Frame.RightSide.RightSideFrame.Visible = false
	end
end
function v28.ClearInventory(p94)
	-- upvalues: (copy) v_u_16, (copy) v_u_24
	for _, v95 in v_u_16:GetChildren() do
		if not v95:IsA("UIComponent") and v95 ~= v_u_24 then
			v95:Destroy()
		end
	end
	table.clear(p94._cache)
end
function v28.ToggleSortOrder(p96, p97)
	-- upvalues: (copy) v_u_22, (copy) v_u_26
	p96.SortAscending = not p96.SortAscending
	v_u_22.Rotation = p96.SortAscending and v_u_26.Ascending or v_u_26.Descending
	if p97 == nil or p97 == true then
		p96:RefreshDisplay()
	end
end
function v28.ToggleSortType(p98)
	-- upvalues: (copy) v_u_27
	if p98.SortAscending then
		p98:ToggleSortOrder()
	else
		p98:ToggleSortOrder(false)
		p98:SetSortType(v_u_27[table.find(v_u_27, p98.SortType) % #v_u_27 + 1])
	end
end
function v28.SetSortType(p99, p100)
	-- upvalues: (copy) v_u_23
	p99.SortType = p100
	v_u_23.Text = p100
	p99:RefreshDisplay()
end
if v12:IsInWorld() then
	task.spawn(v28.Start, v28)
end
return v28