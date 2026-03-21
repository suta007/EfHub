local v_u_1 = game:GetService("ReplicatedStorage")
local v2 = game:GetService("Players")
require(v_u_1.Data.EnumRegistry.ReversedItemTypeEnums)
require(v_u_1.Data.EnumRegistry.InventoryServiceEnums)
require(v_u_1.Modules.TradeBoothControllers.TradeBoothListingController)
require(v_u_1.Modules.TradeBoothControllers.TradeBoothBuyItemController)
require(v_u_1.Modules.TradeControllers.TradeWorldController)
require(v_u_1.Modules.GardenGuideModules.DataModules.GGStaticData)
require(v_u_1.Modules.TeleportUIController)
require(v_u_1.Modules.ReplicationReciever)
require(v_u_1.Modules.ItemRarityFinder)
require(v_u_1.Modules.ItemImageFinder)
require(v_u_1.Modules.ItemNameFinder)
require(v_u_1.Data.TradeBoothsData)
local v_u_3 = require(v_u_1.Modules.GuiController)
require(v_u_1.Modules.Notification)
require(v_u_1.Modules.NumberUtil)
require(v_u_1.Modules.Observers)
require(v_u_1.Data.TradeData)
local v_u_4 = require(v_u_1.Modules.Signal)
local v_u_5 = require(v_u_1.Modules.Trove)
require(v_u_1.Modules.InventoryService)
require(v_u_1.Data.EnumRegistry.ItemTypeEnums)
require(v_u_1.Modules.MutationHandler)
require(v_u_1.Modules.SelectiveAssetReplication)
local v6 = require(v_u_1.Data.PetRegistry)
local v_u_7 = require(v_u_1.Modules.DataService)
local v_u_8 = require(v_u_1.Data.TradeBoothSkinRegistry)
local v_u_9 = require(v_u_1.Item_Module)
local v_u_10 = require(v_u_1.Modules.UpdateService)
local v_u_11 = require(v_u_1.Field_Of_View_Module)
local v_u_12 = require(v_u_1.Blur_Module)
local v_u_13 = require(v_u_1.Modules.SetupButton)
local v_u_14 = require(v_u_1.Modules.Spring)
require(v_u_1.Modules.Chalk)
local _ = v6.PetList
local _ = v2.LocalPlayer
local _ = v_u_1.GameEvents.TradeEvents
local v_u_15 = {
	["Darkstone"] = true,
	["Greek"] = true,
	["Cyber"] = true,
	["Glowlight"] = true,
	["Pink"] = true,
	["Stone"] = true,
	["Nature"] = true,
	["Shadow"] = true
}
local v_u_16 = {
	["HIDDEN"] = {}
}
v_u_5.new()
local v_u_17 = v2.LocalPlayer.PlayerGui:WaitForChild("TradeBoothSkinSelector")
local v_u_18 = v_u_17.SkinSelector
local v_u_19 = v_u_18.Main
local v_u_20 = v_u_19.Skins.ScrollerHolder.Scroller.Content
local v_u_21 = script.ItemTemplate
local v_u_22 = v_u_4.new()
function v_u_16.Start(_)
	-- upvalues: (copy) v_u_17, (copy) v_u_18, (copy) v_u_3, (copy) v_u_14, (copy) v_u_11, (copy) v_u_12, (copy) v_u_13, (copy) v_u_7, (copy) v_u_20, (copy) v_u_8, (copy) v_u_9, (copy) v_u_21, (copy) v_u_1, (copy) v_u_22, (copy) v_u_15, (copy) v_u_10, (copy) v_u_16, (copy) v_u_19
	v_u_17.Enabled = false
	v_u_18.Interactable = false
	v_u_18.Position = UDim2.fromScale(0.5, 0.45)
	v_u_18.DropShadowHolder.DropShadowHolder.DropShadow.ImageTransparency = 1
	v_u_18.Main.GroupTransparency = 1
	v_u_18.Main.UIStroke.Transparency = 1
	local v23 = v_u_3:GetStateForGui(v_u_17)
	v23.ChangeEnabled:Set(true)
	v23.Visible:Observe(function(p24)
		-- upvalues: (ref) v_u_18, (ref) v_u_14, (ref) v_u_11, (ref) v_u_12
		v_u_18.Interactable = p24
		v_u_14.target(v_u_18, 1, 3, {
			["Position"] = UDim2.fromScale(0.5, p24 and 0.5 or 0.45)
		})
		v_u_14.target(v_u_18.DropShadowHolder.DropShadowHolder.DropShadow, 1, 3, {
			["ImageTransparency"] = p24 and 0.6 or 1
		})
		v_u_14.target(v_u_18.Main, 1, 3, {
			["GroupTransparency"] = p24 and 0 or 1
		})
		v_u_14.target(v_u_18.Main.UIStroke, 1, 3, {
			["Transparency"] = p24 and 0 or 1
		})
		v_u_11.Change_FOV(p24 and 60 or 70)
		v_u_12.Blur(p24 and 15 or 0, 0.1)
	end)
	v_u_13({
		["instance"] = v_u_18.Main.Skins.Header.Exit.SENSOR,
		["offset"] = 0.1,
		["legacy"] = true,
		["onclick"] = function()
			-- upvalues: (ref) v_u_3, (ref) v_u_17
			v_u_3:Close(v_u_17)
		end
	})
	v_u_7:GetPathSignal("TradeBoothSkinData/OwnedSkins"):Connect(function(p25, p26)
		-- upvalues: (ref) v_u_20, (ref) v_u_14, (ref) v_u_7
		local v27 = v_u_20:FindFirstChild(p25)
		if v27 then
			v_u_14.target(v27.Cover, 1, 3, {
				["BackgroundTransparency"] = p26 and 1 or 0.6
			})
			v27.LayoutOrder = p26 and 2 or 3
			v27.LockIcon.Visible = not p26
			local v28
			if p25 == "Default" then
				v28 = 1
			else
				local v29 = v_u_7:GetData()
				if v29 then
					local v30 = v29.TradeBoothSkinData.OwnedSkins
					if v30[p25] then
						local v31 = v30[p25]
						if typeof(v31) == "boolean" then
							v28 = v30[p25] and 1 or 0
						else
							v28 = v30[p25]
						end
					else
						v28 = 0
					end
				else
					v28 = 0
				end
			end
			if v28 > 0 then
				v27.ITEM_QUANTITY.Visible = true
				v27.ITEM_QUANTITY.Text = ("x%*"):format(v28)
			else
				v27.ITEM_QUANTITY.Visible = false
			end
		else
			return
		end
	end)
	v_u_7:GetPathSignal("TradeBoothSkinData/CurrentSkin"):Connect(function(_, _, _) end)
	local v_u_32 = v_u_7:GetData()
	local v_u_33 = v_u_32.TradeBoothSkinData.OwnedSkins
	local function v_u_48(p_u_34)
		-- upvalues: (ref) v_u_8, (ref) v_u_9, (ref) v_u_21, (ref) v_u_7, (copy) v_u_32, (ref) v_u_13, (copy) v_u_33, (ref) v_u_1, (ref) v_u_22, (ref) v_u_20
		if p_u_34 then
			local v35 = v_u_8[p_u_34]
			if v35 then
				if not v35.Rarity then
					v35.Rarity = v_u_9.Return_All_Seed_Rarities()[1][1]
				end
				local v_u_36 = v_u_21:Clone()
				v_u_36.Name = p_u_34
				v_u_36.ITEM_NAME.Text = v35.DisplayName or p_u_34
				v_u_36.ITEM_NAME.TextColor3 = v_u_9.Return_Rarity_Data(v35.Rarity)[2]
				v_u_36.ITEM_NAME_SHADOW.Text = v_u_36.ITEM_NAME.ContentText
				local v37 = v35.Rarity or v_u_9.Return_All_Seed_Rarities()[1][1]
				v_u_36:SetAttribute("SearchId", string.lower(p_u_34))
				v_u_36:SetAttribute("SearchDisplay", string.lower(v_u_36.ITEM_NAME.ContentText))
				v_u_36:SetAttribute("SearchRarity", string.lower(v37))
				local v38
				if p_u_34 == "Default" then
					v38 = 1
				else
					local v39 = v_u_7:GetData()
					if v39 then
						local v40 = v39.TradeBoothSkinData.OwnedSkins
						if v40[p_u_34] then
							local v41 = v40[p_u_34]
							if typeof(v41) == "boolean" then
								v38 = v40[p_u_34] and 1 or 0
							else
								v38 = v40[p_u_34]
							end
						else
							v38 = 0
						end
					else
						v38 = 0
					end
				end
				v_u_36.Cover.BackgroundTransparency = v38 > 0 and 1 or 0.6
				v_u_36.ITEM_QUANTITY.Visible = v38 > 0
				v_u_36.ITEM_QUANTITY.Text = ("x%*"):format(v38)
				local v42
				if v_u_32.TradeBoothSkinData.CurrentSkin == p_u_34 then
					v42 = "Equipped"
				else
					local v43 = v_u_36.Name
					local v44
					if v43 == "Default" then
						v44 = true
					else
						local v45 = v_u_7:GetData()
						if v45 then
							local v46 = v45.TradeBoothSkinData.OwnedSkins
							if v46[v43] == nil then
								v44 = false
							else
								local v47 = v46[v43]
								if typeof(v47) == "boolean" then
									v44 = v46[v43]
								else
									v44 = v46[v43] > 0
								end
							end
						else
							v44 = false
						end
					end
					v42 = v44 and "Owned" or "Unowned"
				end
				v_u_36.EQUIPPED_IMAGE.Visible = false
				v_u_36.LockIcon.Visible = v42 == "Unowned"
				v_u_36.LayoutOrder = v_u_36.Name == "Default" and -1 or (v42 == "Equipped" and 1 or (v42 == "Owned" and 2 or (v42 == "Unowned" and 3 or 4)))
				v_u_36.ITEM_IMAGE.Image = v35.Icon or "rbxassetid://6937742258"
				v_u_13({
					["instance"] = v_u_36.SENSOR,
					["offset"] = 0.1,
					["legacy"] = false,
					["onclick"] = function()
						-- upvalues: (ref) v_u_33, (copy) v_u_36, (ref) v_u_1, (copy) p_u_34, (ref) v_u_22
						if v_u_33[v_u_36.Name] or v_u_36.Name == "Default" then
							v_u_1.GameEvents.TradeBoothSkinService.Equip:FireServer(p_u_34)
							v_u_22:Fire()
						end
					end
				})
				v_u_36.Parent = v_u_20
			else
				warn((("FenceSkinUserInterfaceController: Failed to Fetch skinID (%*)"):format(p_u_34)))
			end
		else
			warn("FenceSkinUserInterfaceController/addFenceFrame: Got NIL skinID")
			return
		end
	end
	for v49 in v_u_8 do
		if not v_u_15[v49] then
			if v_u_10:IsHiddenFromUpdate((("TradeBoothSkins/%*"):format(v49))) then
				local v50 = v_u_16.HIDDEN
				table.insert(v50, v49)
			else
				v_u_48(v49)
			end
		end
	end
	if not v_u_10:IsUpdateDone() then
		v_u_10.OnUpdated:Connect(function()
			-- upvalues: (ref) v_u_16, (ref) v_u_15, (copy) v_u_48
			for v51 = 1, #v_u_16.HIDDEN do
				local v52 = v_u_16.HIDDEN[v51]
				v_u_16.HIDDEN[v51] = nil
				if not v_u_15[v52] then
					v_u_48(v52)
				end
			end
		end)
	end
	v_u_19.Skins.SearchBar.Main.TextBox:GetPropertyChangedSignal("Text"):Connect(function()
		-- upvalues: (ref) v_u_19, (ref) v_u_20
		local v53 = string.lower(v_u_19.Skins.SearchBar.Main.TextBox.Text)
		local v54 = {}
		for v55 in string.gmatch(v53, "%S+") do
			table.insert(v54, v55)
		end
		for _, v56 in v_u_20:GetChildren() do
			if v56:IsA("Frame") then
				if #v54 == 0 then
					v56.Visible = true
				else
					local v57 = v56:GetAttribute("SearchId") or ""
					local v58 = v56:GetAttribute("SearchDisplay") or ""
					local v59 = v56:GetAttribute("SearchRarity") or ""
					local v60 = true
					for _, v61 in v54 do
						if not (string.find(v57, v61, 1, true) or (string.find(v58, v61, 1, true) or string.find(v59, v61, 1, true))) then
							v60 = false
							break
						end
					end
					v56.Visible = v60
				end
			end
		end
	end)
end
function v_u_16.Prompt(_)
	-- upvalues: (copy) v_u_4, (copy) v_u_5, (copy) v_u_3, (copy) v_u_17, (copy) v_u_22
	local v_u_62 = v_u_4.new()
	local v_u_63 = v_u_5.new()
	v_u_63:Add(v_u_62)
	v_u_3:Open(v_u_17)
	v_u_63:Add(v_u_3:GetStateForGui(v_u_17).Visible:Listen(function(p64)
		-- upvalues: (copy) v_u_62, (copy) v_u_63, (ref) v_u_3, (ref) v_u_17
		if not p64 then
			v_u_62:Fire(false)
			v_u_63:Destroy()
			v_u_3:Close(v_u_17)
		end
	end))
	v_u_63:Add(v_u_22:Connect(function()
		-- upvalues: (copy) v_u_62, (copy) v_u_63, (ref) v_u_3, (ref) v_u_17
		v_u_62:Fire(true)
		v_u_63:Destroy()
		v_u_3:Close(v_u_17)
	end))
	return v_u_62
end
function v_u_16.Close(_)
	-- upvalues: (copy) v_u_3, (copy) v_u_17
	v_u_3:Close(v_u_17)
end
function v_u_16.Open(_)
	-- upvalues: (copy) v_u_3, (copy) v_u_17
	v_u_3:Open(v_u_17)
end
task.spawn(v_u_16.Start, v_u_16)
return v_u_16