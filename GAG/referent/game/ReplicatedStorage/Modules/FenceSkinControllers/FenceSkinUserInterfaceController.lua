game:GetService("ServerScriptService")
local v1 = game:GetService("ReplicatedStorage")
game:GetService("Lighting")
local v_u_2 = game:GetService("Players")
local v_u_3 = require(v1.Modules.FenceSkinControllers.FenceSkinController)
require(v1.Modules.SaveSlotControllers.SaveSlotController)
local v_u_4 = require(v1.Data.FenceSkinRegistry)
local v_u_5 = require(v1.Modules.DataService)
local v_u_6 = require(v1.Item_Module)
local v_u_7 = require(v1.Modules.GetFarmAsync)
local v_u_8 = require(v1.Modules.GuiController)
local v_u_9 = require(v1.Field_Of_View_Module)
local v_u_10 = require(v1.Blur_Module)
local v_u_11 = require(v1.Modules.UpdateService)
local v_u_12 = v_u_2.LocalPlayer.PlayerGui:WaitForChild("FenceSkinSelector")
local v_u_13 = v_u_12.SkinSelector
local v_u_14 = v_u_13.Main
local v_u_15 = v_u_14.Skins.ScrollerHolder.Scroller.Content
local v_u_16 = script.ItemTemplate
local v_u_17 = require(v1.Modules.SetupButton)
local v_u_18 = require(v1.Modules.Spring)
require(v1.Modules.Chalk)
local v_u_19 = {
	["HIDDEN"] = {}
}
local function v_u_24(p20)
	-- upvalues: (copy) v_u_3, (copy) v_u_15
	local v21 = v_u_3:GetOwnedFences()
	for _, v22 in v_u_15:GetChildren() do
		if v22:IsA("Frame") then
			local v23 = p20 == v22.Name and "Equipped" or (v21[v22.Name] and "Owned" or "Unowned")
			v22.EQUIPPED_IMAGE.Visible = v23 == "Equipped"
			v22.LayoutOrder = v23 == "Equipped" and 1 or (v23 == "Owned" and 2 or (v23 == "Unowned" and 3 or 4))
		end
	end
end
function v_u_19.Start(_)
	-- upvalues: (copy) v_u_7, (copy) v_u_2, (copy) v_u_8, (copy) v_u_12, (copy) v_u_13, (copy) v_u_18, (copy) v_u_9, (copy) v_u_10, (copy) v_u_17, (copy) v_u_5, (copy) v_u_15, (copy) v_u_24, (copy) v_u_3, (copy) v_u_4, (copy) v_u_6, (copy) v_u_16, (copy) v_u_11, (copy) v_u_19, (copy) v_u_14
	local v25 = v_u_7(v_u_2.LocalPlayer)
	if v25 then
		local v26 = v25.Sign
		local v27 = script.ProximityPrompt:Clone()
		v27.Parent = v26.PrimaryPart
		v27.Triggered:Connect(function()
			-- upvalues: (ref) v_u_8, (ref) v_u_12
			v_u_8:Toggle(v_u_12)
		end)
		v_u_12.Enabled = false
		v_u_13.Interactable = false
		v_u_13.Position = UDim2.fromScale(0.5, 0.45)
		v_u_13.DropShadowHolder.DropShadowHolder.DropShadow.ImageTransparency = 1
		v_u_13.Main.GroupTransparency = 1
		v_u_13.Main.UIStroke.Transparency = 1
		local v28 = v_u_8:GetStateForGui(v_u_12)
		v28.ChangeEnabled:Set(true)
		v28.Visible:Observe(function(p29)
			-- upvalues: (ref) v_u_13, (ref) v_u_18, (ref) v_u_9, (ref) v_u_10
			v_u_13.Interactable = p29
			v_u_18.target(v_u_13, 1, 3, {
				["Position"] = UDim2.fromScale(0.5, p29 and 0.5 or 0.45)
			})
			v_u_18.target(v_u_13.DropShadowHolder.DropShadowHolder.DropShadow, 1, 3, {
				["ImageTransparency"] = p29 and 0.6 or 1
			})
			v_u_18.target(v_u_13.Main, 1, 3, {
				["GroupTransparency"] = p29 and 0 or 1
			})
			v_u_18.target(v_u_13.Main.UIStroke, 1, 3, {
				["Transparency"] = p29 and 0 or 1
			})
			v_u_9.Change_FOV(p29 and 60 or 70)
			v_u_10.Blur(p29 and 15 or 0, 0.1)
		end)
		v_u_17({
			["instance"] = v_u_13.Main.Skins.Header.Exit.SENSOR,
			["offset"] = 0.1,
			["legacy"] = true,
			["onclick"] = function()
				-- upvalues: (ref) v_u_8, (ref) v_u_12
				v_u_8:Close(v_u_12)
			end
		})
		v_u_5:GetPathSignal("FenceSkinData/OwnedFences"):Connect(function(p30, p31)
			-- upvalues: (ref) v_u_15, (ref) v_u_18
			local v32 = v_u_15:FindFirstChild(p30)
			if v32 then
				v_u_18.target(v32.Cover, 1, 3, {
					["BackgroundTransparency"] = p31 and 1 or 0.6
				})
				v32.LayoutOrder = p31 and 2 or 3
				v32.LockIcon.Visible = not p31
			end
		end)
		v_u_5:GetPathSignal("SaveSlots/SelectedSlot/@"):Connect(function(_, p33, _)
			-- upvalues: (ref) v_u_5, (ref) v_u_24
			local v34 = v_u_5:GetData()
			if v34 then
				local v35 = v34.SaveSlots.AllSlots[p33].SelectedFenceSkin
				if v35 then
					v_u_24(v35)
				end
			else
				return
			end
		end)
		v_u_5:GetPathSignal("SaveSlots/@"):Connect(function(_, p36, p37)
			-- upvalues: (ref) v_u_24
			if p37:find("SelectedFenceSkin") then
				v_u_24(p36)
			end
		end)
		local v_u_38 = v_u_3:GetOwnedFences()
		local function v_u_44(p_u_39)
			-- upvalues: (ref) v_u_4, (ref) v_u_6, (ref) v_u_16, (copy) v_u_38, (ref) v_u_3, (ref) v_u_17, (ref) v_u_15
			if p_u_39 then
				local v40 = v_u_4[p_u_39]
				if v40 then
					if not v40.Rarity then
						v40.Rarity = v_u_6.Return_All_Seed_Rarities()[1][1]
					end
					local v41 = v_u_16:Clone()
					v41.Name = p_u_39
					v41.ITEM_NAME.Text = v40.DisplayName or p_u_39
					v41.ITEM_NAME.TextColor3 = v_u_6.Return_Rarity_Data(v40.Rarity)[2]
					v41.ITEM_NAME_SHADOW.Text = v41.ITEM_NAME.ContentText
					local v42 = v40.Rarity or v_u_6.Return_All_Seed_Rarities()[1][1]
					v41:SetAttribute("SearchId", string.lower(p_u_39))
					v41:SetAttribute("SearchDisplay", string.lower(v41.ITEM_NAME.ContentText))
					v41:SetAttribute("SearchRarity", string.lower(v42))
					v41.Cover.BackgroundTransparency = v_u_38[p_u_39] and 1 or 0.6
					local v43 = v_u_3:GetFenceSkin() == p_u_39 and "Equipped" or (v_u_38[v41.Name] and "Owned" or "Unowned")
					v41.EQUIPPED_IMAGE.Visible = v43 == "Equipped"
					v41.LockIcon.Visible = v43 == "Unowned"
					v41.LayoutOrder = v43 == "Equipped" and 1 or (v43 == "Owned" and 2 or (v43 == "Unowned" and 3 or 4))
					v41.ITEM_IMAGE.Image = ("rbxassetid://%*"):format(v40.Icon or 6937742258)
					v_u_17({
						["instance"] = v41.SENSOR,
						["offset"] = 0.1,
						["legacy"] = true,
						["onclick"] = function()
							-- upvalues: (ref) v_u_3, (copy) p_u_39
							v_u_3:Equip(p_u_39)
						end
					})
					v41.Parent = v_u_15
				else
					warn((("FenceSkinUserInterfaceController: Failed to Fetch skinID (%*)"):format(p_u_39)))
				end
			else
				warn("FenceSkinUserInterfaceController/addFenceFrame: Got NIL skinID")
				return
			end
		end
		for v45 in v_u_4 do
			if v_u_11:IsHiddenFromUpdate(v45) then
				local v46 = v_u_19.HIDDEN
				table.insert(v46, v45)
			else
				v_u_44(v45)
			end
		end
		if not v_u_11:IsUpdateDone() then
			task.spawn(function()
				-- upvalues: (ref) v_u_11, (ref) v_u_19, (copy) v_u_44
				repeat
					task.wait(1)
				until v_u_11:IsUpdateDone()
				for v47 = 1, #v_u_19.HIDDEN do
					local v48 = v_u_19.HIDDEN[v47]
					v_u_19.HIDDEN[v47] = nil
					v_u_44(v48)
				end
			end)
		end
		v_u_14.Skins.SearchBar.Main.TextBox:GetPropertyChangedSignal("Text"):Connect(function()
			-- upvalues: (ref) v_u_14, (ref) v_u_15
			local v49 = string.lower(v_u_14.Skins.SearchBar.Main.TextBox.Text)
			local v50 = {}
			for v51 in string.gmatch(v49, "%S+") do
				table.insert(v50, v51)
			end
			for _, v52 in v_u_15:GetChildren() do
				if v52:IsA("Frame") then
					if #v50 == 0 then
						v52.Visible = true
					else
						local v53 = v52:GetAttribute("SearchId") or ""
						local v54 = v52:GetAttribute("SearchDisplay") or ""
						local v55 = v52:GetAttribute("SearchRarity") or ""
						local v56 = true
						for _, v57 in v50 do
							if not (string.find(v53, v57, 1, true) or (string.find(v54, v57, 1, true) or string.find(v55, v57, 1, true))) then
								v56 = false
								break
							end
						end
						v52.Visible = v56
					end
				end
			end
		end)
	end
end
task.spawn(function()
	-- upvalues: (copy) v_u_11, (copy) v_u_19
	while v_u_11:IsHiddenFromUpdate("Fence Skins") do
		task.wait(1)
	end
	task.spawn(v_u_19.Start, v_u_19)
end)
return v_u_19