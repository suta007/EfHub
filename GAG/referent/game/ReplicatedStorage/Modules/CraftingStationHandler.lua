local v1 = game:GetService("ReplicatedStorage")
local v_u_2 = game:GetService("TweenService")
game:GetService("ServerScriptService")
local v3 = game:GetService("Players")
local v4 = game:GetService("CollectionService")
local v_u_5 = v3.LocalPlayer
local v6 = v_u_5.PlayerGui
require(v1.Modules.DataService)
require(v1.Modules.UpdateService)
require(v1.Modules.WaitForDescendant)
require(v1.Modules.MarketController)
local v_u_7 = require(v1.Modules.Notification)
local v_u_8 = require(v1.Modules.CountDictionary)
local v_u_9 = require(v1.Modules.CraftingService.CraftingGlobalObjectService)
local v_u_10 = require(v1.Modules.NumberUtil)
require(v1.Modules.SelectiveAssetReplication)
local v_u_11 = require(v1.Modules.GuiController)
local v_u_12 = require(v1.Modules.PetServices.PetsService)
local v_u_13 = require(v1.Modules.ItemImageFinder)
local v_u_14 = require(v1.Modules.InventoryService)
local v_u_15 = require(v1.Modules.RebirthUnlocksSharedService)
local v16 = v1.GameEvents.SelectCraftingRecipeBindableEvent
local v_u_17 = v1.GameEvents.OpenRecipeBindableEvent
local v18 = v1.GameEvents.CraftingGlobalObjectService
local v19 = v1.GameEvents.CraftingFailedRemoteEvent
local v_u_20 = v1.GameEvents.HideCancelCraftingBindableEvent
local v_u_21 = v1.GameEvents.ShowCancelCraftingBindableEvent
local v_u_22 = v1.GameEvents.PickupEvent
local v_u_23 = require(v1.Data.EnumRegistry.InventoryServiceEnums)
local v_u_24 = require(v1.Data.EnumRegistry.ItemTypeEnums)
local v_u_25 = require(v1.Data.EnumRegistry.ReversedItemTypeEnums)
local v_u_26 = require(v1.Data.PetRegistry.PetBoostRegistry)
local _ = require(v1.Data.CosmeticRegistry).CosmeticList
local _ = require(v1.Data.CosmeticCrateRegistry).CosmeticCrates
local v27 = require(v1.Data.PetRegistry)
local _ = v27.PetList
local _ = v27.PetEggs
require(v1.Data.SeedData)
require(v1.Data.GearData)
require(v1.Data.SeedPackData)
require(v1.Data.CraftingData.CraftingTypeRegistry)
local v28 = require(v1.Data.CraftingData.CraftingRecipeRegistry)
local v_u_29 = require(v1.Modules.DataService)
local v_u_30 = v28.ItemRecipes
local v_u_31 = v6:WaitForChild("RecipeSelection_UI")
local v_u_32 = {}
local function v_u_34(p33)
	return p33:GetAttribute("CraftingObjectType")
end
local function v_u_39(p35)
	-- upvalues: (copy) v_u_9, (copy) v_u_34, (copy) v_u_30
	local v36 = v_u_9:GetIndividualCraftingMachineData(p35, v_u_34(p35))
	if not (v36 and v36.RecipeId) then
		return nil
	end
	if not v_u_30[v36.RecipeId] then
		return nil
	end
	local v37 = {}
	for v38, _ in v36.InputItems do
		v37[tostring(v38)] = true
	end
	return v37
end
local function v_u_44(p40, p41)
	-- upvalues: (copy) v_u_13
	local v42 = script.IngredientModelTemplate:Clone()
	v42.Part.BillboardGui.ImageLabel.Image = v_u_13(p40, p41)
	if v42 then
		script.CraftingModel_BillboardGui:Clone().Parent = v42
		for _, v43 in v42:GetDescendants() do
			if v43:IsA("BasePart") then
				v43.Anchored = true
			end
		end
	end
	return v42
end
local v_u_45 = {}
local v_u_46 = {}
local function v_u_50(p47)
	-- upvalues: (copy) v_u_46
	local v48 = v_u_46[p47]
	if v48 then
		if v48.Timer then
			v48.Timer:Destroy()
			v48.Timer = nil
		end
		for _, v49 in v48.Items do
			v49:Destroy()
		end
		table.clear(v48.Items)
	end
end
local function v_u_108(p_u_51)
	-- upvalues: (copy) v_u_46, (copy) v_u_9, (copy) v_u_34, (copy) v_u_30, (copy) v_u_50, (copy) v_u_2, (copy) v_u_22, (copy) v_u_44, (copy) v_u_10, (copy) v_u_39, (copy) v_u_45
	local v52 = v_u_46[p_u_51]
	if v52 == nil then
		v52 = {
			["Items"] = {}
		}
		v_u_46[p_u_51] = v52
	end
	local v53 = v_u_9:GetIndividualCraftingMachineData(p_u_51, v_u_34(p_u_51))
	local v54, v55
	if v53 and v53.RecipeId then
		v54 = v_u_30[v53.RecipeId]
		if v54 then
			v55 = v53.RecipeId
		else
			v54 = nil
			v55 = nil
		end
	else
		v54 = nil
		v55 = nil
	end
	local v56 = v_u_9:GetIndividualCraftingMachineData(p_u_51, v_u_34(p_u_51))
	local v57
	if v56 then
		v57 = v56.CraftingItems[1]
	else
		v57 = nil
	end
	if v54 or v57 then
		local v58
		if v57 then
			v58 = ("Output_%*_%*"):format(v57.RecipeId, v57.IsDone)
		elseif v54 then
			v58 = ("Craft_%*"):format(v55)
		else
			v58 = nil
		end
		if v58 == nil then
			v_u_50(p_u_51)
			v52.Key = nil
		else
			local v_u_59 = v52.Items
			if v52.Key == v58 then
				if v52.Key == v58 then
					local v60 = {}
					if v57 then
						v60 = v_u_30[v57.RecipeId].Outputs
					elseif v54 then
						v60 = v54.Inputs
					end
					local v61 = 0
					local v62 = nil
					local v63 = nil
					for v64, _ in v60 do
						local v65 = v_u_59[v64]
						if v65 then
							local v66 = v65:GetExtentsSize()
							v65:PivotTo(CFrame.new(v61 + v66.X * 0.5, 0, 0))
							v65.Parent = p_u_51
							v61 = v61 - (v66.X + 2)
							v_u_59[v64] = v65
							local v67 = v65:GetPivot()
							local v68 = (v67.Position - v66 * 0.5) * Vector3.new(1, 0, 1)
							local v69 = (v67.Position + v66 * 0.5) * Vector3.new(1, 0, 1)
							if v62 then
								v62 = vector.min(v62, v68)
							else
								v62 = v68
							end
							if v63 then
								v63 = vector.max(v63, v69)
							else
								v63 = v69
							end
						end
					end
					if v62 and v63 then
						local v70 = (v62 + v63) * 0.5
						for _, v71 in v_u_59 do
							v71:PivotTo(p_u_51.PrimaryPart.CFrame * CFrame.new(v71:GetPivot().Position + Vector3.new(0, 3, 0) - v70))
						end
					end
				end
			else
				if v57 and (v52.Key and (string.find(v52.Key, "Craft_") and string.find(v58, "Output_"))) then
					task.spawn(function()
						-- upvalues: (copy) p_u_51, (copy) v_u_59, (ref) v_u_2
						local v72 = TweenInfo.new(0.6, Enum.EasingStyle.Back, Enum.EasingDirection.InOut)
						local v73 = p_u_51.PrimaryPart.CFrame
						local v74 = table.clone(v_u_59)
						table.clear(v_u_59)
						for _, v_u_75 in v74 do
							local v76 = v_u_75:FindFirstChildOfClass("BillboardGui")
							if v76 then
								v76.Enabled = false
							end
							local v_u_77 = v_u_2:Create(v_u_75.PrimaryPart, v72, {
								["CFrame"] = v73
							})
							v_u_77:Play()
							v_u_77.Completed:Connect(function()
								-- upvalues: (copy) v_u_77, (copy) v_u_75
								v_u_77:Destroy()
								v_u_75:Destroy()
							end)
							task.wait(0.6)
						end
					end)
				end
				v52.Key = v58
				v_u_50(p_u_51)
				local v78 = {}
				if v57 then
					local v79
					if v57 == nil then
						v79 = false
					else
						v79 = not v57.IsDone
					end
					if v79 and not v52.Timer then
						local v80 = script.BillboardGuiTemplate:Clone()
						v80.Name = "CraftingBillboardGui"
						v80.Parent = p_u_51.PrimaryPart
						v52.Timer = v80
						v_u_22:Fire("Craft_ActiveCrafting", p_u_51.PrimaryPart)
						local v81 = v_u_9:GetIndividualCraftingMachineData(p_u_51, v_u_34(p_u_51))
						local v82
						if v81 then
							v82 = v81.CraftingItems[1]
						else
							v82 = nil
						end
						local v83
						if v82 == nil then
							v83 = false
						else
							v83 = not v82.IsDone
						end
						p_u_51:SetAttribute("IsCrafting", v83)
					elseif not v79 and v52.Timer then
						v52.Timer:Destroy()
						v52.Timer = nil
						v_u_22:Fire("Craft_CompleteDing")
						local v84 = v_u_9:GetIndividualCraftingMachineData(p_u_51, v_u_34(p_u_51))
						local v85
						if v84 then
							v85 = v84.CraftingItems[1]
						else
							v85 = nil
						end
						local v86
						if v85 == nil then
							v86 = false
						else
							v86 = not v85.IsDone
						end
						p_u_51:SetAttribute("IsCrafting", v86)
					end
					v78 = v_u_30[v57.RecipeId].Outputs
				elseif v54 then
					v78 = v54.Inputs
				end
				local v87 = 0
				local v88 = nil
				local v89 = nil
				for v90, v91 in v78 do
					local v92 = v_u_44(v91.ItemData.ItemName, v91.ItemType)
					local v93 = v92:GetExtentsSize()
					v92:PivotTo(CFrame.new(v87 + v93.X * 0.5, 0, 0))
					v92.Parent = p_u_51
					v87 = v87 - (v93.X + 2)
					v_u_59[v90] = v92
					local v94 = v92:GetPivot()
					local v95 = (v94.Position - v93 * 0.5) * Vector3.new(1, 0, 1)
					local v96 = (v94.Position + v93 * 0.5) * Vector3.new(1, 0, 1)
					if v88 then
						v88 = vector.min(v88, v95)
					else
						v88 = v95
					end
					if v89 then
						v89 = vector.max(v89, v96)
					else
						v89 = v96
					end
				end
				if v88 and v89 then
					local v97 = (v88 + v89) * 0.5
					for _, v98 in v_u_59 do
						v98:PivotTo(p_u_51.PrimaryPart.CFrame * CFrame.new(v98:GetPivot().Position + Vector3.new(0, 3, 0) - v97))
					end
				end
			end
			local v99 = v57 and v52.Timer
			if v99 then
				v99.Timer.Text = v_u_10.compactFormat(v57.TimeRemaining)
			end
			local v100
			if v54 then
				v100 = v_u_39(p_u_51)
			else
				v100 = nil
			end
			for v101, v102 in v_u_59 do
				local v103
				if v57 then
					v103 = v_u_30[v57.RecipeId].Outputs[v101]
				elseif v54 then
					v103 = v54.Inputs[v101]
				else
					v103 = nil
				end
				if v103 then
					local v104
					if v57 then
						v104 = ("%*x"):format(v103.ItemData.Quantity) or "1x"
					else
						v104 = ("%*/%*"):format(v100 and v100[tostring(v101)] and 1 or 0, v103.ItemData.Quantity or 1)
					end
					v102.CraftingModel_BillboardGui.TextLabel.Text = ("%* %*%*"):format(v104, v103.ItemData.ItemName, v103.ItemType == "Seed" and " Seed" or "")
				end
			end
			local v105
			if v_u_45[p_u_51] == true then
				v105 = not v57 or v57.IsDone
			else
				v105 = false
			end
			for _, v106 in v_u_59 do
				if v106.Parent == p_u_51 ~= v105 then
					local v107
					if v105 then
						v107 = p_u_51
					else
						v107 = script
					end
					v106.Parent = v107
				end
			end
		end
	elseif v52.Key ~= nil then
		v_u_50(p_u_51)
		v52.Key = nil
	end
end
local function v_u_121(p109)
	-- upvalues: (copy) v_u_15, (copy) v_u_5, (copy) v_u_9, (copy) v_u_34, (copy) v_u_20, (copy) v_u_30, (copy) v_u_21, (copy) v_u_8, (copy) v_u_39
	if p109.PrimaryPart then
		local v110 = p109:FindFirstChildWhichIsA("ProximityPrompt", true)
		if v110 then
			if v_u_15:HasUnlockedFeature(v_u_5, "CRAFTING") then
				v110.Enabled = true
				local v111 = v_u_9:GetIndividualCraftingMachineData(p109, v_u_34(p109))
				local v112
				if v111 then
					v112 = v111.CraftingItems[1]
				else
					v112 = nil
				end
				v110.ActionText = "Select Recipe"
				v_u_20:Fire()
				if v112 then
					if v112.IsDone then
						v110.ActionText = "Claim"
					else
						v110.ActionText = "Skip"
					end
				else
					local v113 = v_u_9:GetIndividualCraftingMachineData(p109, v_u_34(p109))
					if v113 and v113.RecipeId then
						local v114 = v_u_9:GetIndividualCraftingMachineData(p109, v_u_34(p109))
						local v115
						if v114 and v114.RecipeId then
							v115 = v_u_30[v114.RecipeId]
							if v115 then
								local _ = v114.RecipeId
							else
								v115 = nil
							end
						else
							v115 = nil
						end
						if v115 then
							v_u_21:Fire(p109)
							local v116 = v_u_9:GetIndividualCraftingMachineData(p109, v_u_34(p109))
							local v117
							if v116 and v116.RecipeId then
								local v118 = v_u_30[v116.RecipeId]
								if v118 then
									v117 = v_u_8((v_u_39(p109))) >= v_u_8(v118.Inputs)
								else
									v117 = false
								end
							else
								v117 = false
							end
							if v117 then
								local v119 = v115.Cost
								if v119 then
									local v120
									if v119 then
										v120 = v119.CurrencyType
									else
										v120 = v119
									end
									if v119 then
										local _ = v119.Amount
									end
									v110.ActionText = ("Start Crafting: %* %*"):format(v119.Amount, v120)
								else
									v110.ActionText = "Start Crafting: No Cost"
								end
							end
							v110.ActionText = "Submit Item"
						end
					end
				end
			else
				v110.Enabled = false
				return
			end
		else
			return warn("Cannot Find Prox Prompt On crafting station")
		end
	else
		return
	end
end
local function v_u_128(p122)
	-- upvalues: (copy) v_u_9, (copy) v_u_34, (copy) v_u_30, (copy) v_u_29, (copy) v_u_7
	local v123 = v_u_9:GetIndividualCraftingMachineData(p122, v_u_34(p122))
	local v124
	if v123 and v123.RecipeId then
		v124 = v_u_30[v123.RecipeId]
		if v124 then
			local _ = v123.RecipeId
		else
			v124 = nil
		end
	else
		v124 = nil
	end
	if v124 then
		local v125 = v_u_29:GetData()
		local v126 = v124.Cost
		local v127
		if v126 then
			v127 = v126.CurrencyType
		else
			v127 = v126
		end
		if v126 then
			v126 = v126.Amount
		end
		if v127 and v126 and (v125[v127] or v125.SpecialCurrency[v127]) < v126 then
			v_u_7:CreateNotification((("You need %* to craft this."):format((("<font color=\"#ff9500\">%* %*</font>"):format(v126, v127)))))
		else
			v_u_9:Craft(p122, v_u_34(p122))
		end
	else
		return
	end
end
local function v_u_144(p129)
	-- upvalues: (copy) v_u_9, (copy) v_u_34, (copy) v_u_30, (copy) v_u_7, (copy) v_u_39, (copy) v_u_5, (copy) v_u_23, (copy) v_u_25, (copy) v_u_12, (copy) v_u_24, (copy) v_u_26, (copy) v_u_14, (copy) v_u_22
	v_u_9:GetCraftingObjectData(p129)
	local v130 = v_u_9:GetIndividualCraftingMachineData(p129, v_u_34(p129))
	local v131
	if v130 and v130.RecipeId then
		v131 = v_u_30[v130.RecipeId]
		if v131 then
			local _ = v130.RecipeId
		else
			v131 = nil
		end
	else
		v131 = nil
	end
	if not v131 then
		v_u_7:CreateNotification("No Crafting recipe has been selected")
		return
	end
	local v132 = v_u_39(p129)
	if not v132 then
		return
	end
	local v133 = v_u_5.Character
	if not v133 then
		return
	end
	local v134 = v133:FindFirstChildWhichIsA("Tool")
	if not v134 then
		v_u_7:CreateNotification("You are not holding an item!")
		return
	end
	if not v133:FindFirstChildWhichIsA("Humanoid") then
		return
	end
	if v134:GetAttribute(v_u_23.Favorite) then
		v_u_7:CreateNotification("Cannot Submit a favorited item!")
		return
	end
	if v134:GetAttribute("Traded") then
		v_u_7:CreateNotification("This item is pending trade!")
		return
	end
	local v135 = v_u_25[v134:GetAttribute(v_u_23.ITEM_TYPE)] or v134:GetAttribute("ItemType")
	local v136 = v134:GetAttribute(v_u_23.ItemName)
	local v137 = v134:GetAttribute("PET_UUID")
	local v138
	if v137 then
		v138 = v_u_12:GetPlayerPetData(v137)
	else
		v138 = v137
	end
	if v135 then
		if v135 == v_u_25[v_u_24.PetEgg] then
			v136 = v134:GetAttribute(v_u_23.EggName)
		elseif v135 == v_u_25[v_u_24.CosmeticCrate] then
			v136 = v134:GetAttribute(v_u_23.CrateType)
		elseif v137 and v138 then
			v136 = v138.PetType
		elseif v135 == v_u_25[v_u_24.SprayBottle] then
			v136 = v134:GetAttribute(v_u_23.SprayType)
		elseif v135 == v_u_25[v_u_24.PetBoost] then
			v136 = ("%* %*"):format(v134:GetAttribute(v_u_23.PetBoostSize), v_u_26.BoostTypeToPetModelName[v134:GetAttribute(v_u_23.PetBoostType)])
		elseif v135 == v_u_25[v_u_24["Seed Pack"]] then
			v136 = v134:GetAttribute(v_u_23.Type)
		elseif v135 == v_u_25[v_u_24["Harvest Tool"]] or (v135 == v_u_25[v_u_24["Watering Can"]] or v135 == v_u_25[v_u_24["Recall Wrench"]]) then
			v136 = v_u_25[v134:GetAttribute(v_u_23.ITEM_TYPE)]
		elseif v135 == v_u_25[v_u_24.PetShard] then
			v136 = v134:GetAttribute(v_u_23.ShardType)
		elseif v135 == v_u_25[v_u_24["Fairy Jar"]] then
			v136 = v_u_25[v134:GetAttribute(v_u_23.ITEM_TYPE)]
		elseif v135 == v_u_25[v_u_24["Fairy Net"]] then
			v136 = v_u_25[v134:GetAttribute(v_u_23.ITEM_TYPE)]
		elseif v135 == v_u_25[v_u_24["Luminous Wand"]] then
			v136 = v_u_25[v134:GetAttribute(v_u_23.ITEM_TYPE)]
		elseif v135 == v_u_25[v_u_24["Fairy Caller"]] then
			v136 = v_u_25[v134:GetAttribute(v_u_23.ITEM_TYPE)]
		elseif v135 == v_u_25[v_u_24["Fairy Targeter"]] then
			v136 = v_u_25[v134:GetAttribute(v_u_23.ITEM_TYPE)]
		elseif v135 == v_u_25[v_u_24["Fairy Power Extender"]] then
			v136 = v_u_25[v134:GetAttribute(v_u_23.ITEM_TYPE)]
		elseif v135 == v_u_25[v_u_24["Fairy Summoner"]] then
			v136 = v_u_25[v134:GetAttribute(v_u_23.ITEM_TYPE)]
		elseif v135 == v_u_25[v_u_24["Favorite Tool"]] then
			v136 = v_u_25[v134:GetAttribute(v_u_23.ITEM_TYPE)]
		end
	else
		if v136 then
			return
		end
		local v139 = v_u_14:GetToolData(v134)
		if not v139 then
			return
		end
		if not v139.ItemType then
			return
		end
		v136 = v139.ItemType
		v135 = v136
	end
	local v140 = v134:GetAttribute(v_u_23.ITEM_UUID) or v137
	local v141 = nil
	for v142, v143 in v131.Inputs do
		if not v132[tostring(v142)] and (v143.ItemData.ItemName == v136 and v143.ItemType == v135) then
			v141 = v142
			break
		end
	end
	if v141 then
		v_u_9:InputItem(p129, p129:GetAttribute("CraftingObjectType"), v141, {
			["ItemType"] = v135,
			["ItemData"] = {
				["UUID"] = v140
			}
		})
		v_u_22:Fire("Craft_SubmitItem")
	else
		v_u_7:CreateNotification("That is not a required item for crafting")
	end
end
function v_u_32.SubmitAllRequiredItems(_, p145)
	-- upvalues: (copy) v_u_39, (copy) v_u_22, (copy) v_u_9, (copy) v_u_34, (copy) v_u_30, (copy) v_u_7, (copy) v_u_5, (copy) v_u_14, (copy) v_u_25, (copy) v_u_24, (copy) v_u_26
	local v146 = v_u_39(p145)
	v_u_22:Fire("Click")
	if not v146 then
		return
	end
	local v147 = v_u_9:GetIndividualCraftingMachineData(p145, v_u_34(p145))
	local v148
	if v147 and v147.RecipeId then
		v148 = v_u_30[v147.RecipeId]
		if v148 then
			local _ = v147.RecipeId
		else
			v148 = nil
		end
	else
		v148 = nil
	end
	if not v148 then
		v_u_7:CreateNotification("No Crafting recipe has been selected")
		return
	end
	if not v_u_5.Character then
		return
	end
	local _ = v_u_5.Backpack
	for v149, v150 in v148.Inputs do
		if not v146[tostring(v149)] then
			local v_u_151 = v150.ItemData.ItemName
			local v_u_152 = v150.ItemType
			for v155, v156 in v_u_14:Find(v_u_152, function(p153)
				-- upvalues: (copy) v_u_152, (ref) v_u_25, (ref) v_u_24, (ref) v_u_26, (copy) v_u_151
				local v154
				if v_u_152 == v_u_25[v_u_24.PetEgg] then
					v154 = p153.EggName
				elseif v_u_152 == v_u_25[v_u_24.CosmeticCrate] then
					v154 = p153.CrateType
				elseif v_u_152 == v_u_25[v_u_24.SprayBottle] then
					v154 = p153.SprayType
				elseif v_u_152 == v_u_25[v_u_24.PetBoost] then
					v154 = ("%* %*"):format(p153.PetBoostSize, v_u_26.BoostTypeToPetModelName[p153.PetBoostType])
				elseif v_u_152 == v_u_25[v_u_24["Seed Pack"]] then
					v154 = p153.Type
				elseif v_u_152 == v_u_25[v_u_24.PetShard] then
					v154 = p153.ShardType
				else
					v154 = p153.ITEM_TYPE
				end
				return v_u_151 == (v154 or p153.ItemName or v_u_152)
			end) do
				if not v156.ItemData.IsFavorite then
					v_u_9:InputItem(p145, p145:GetAttribute("CraftingObjectType"), v149, {
						["ItemType"] = v156.ItemType,
						["ItemData"] = {
							["UUID"] = v155
						}
					})
					task.delay(0.1 + v149 * 0.1, function()
						-- upvalues: (ref) v_u_22
						v_u_22:Fire("Craft_SubmitItem")
					end)
					break
				end
			end
		end
	end
end
function v_u_32.CancelRecipe(_, p157)
	-- upvalues: (copy) v_u_9
	v_u_9:Cancel(p157, (p157:GetAttribute("CraftingObjectType")))
end
function v_u_32.CanCancelRecipe(_, p158)
	-- upvalues: (copy) v_u_9, (copy) v_u_34, (copy) v_u_30, (copy) v_u_45
	local v159 = v_u_9:GetIndividualCraftingMachineData(p158, v_u_34(p158))
	local v160
	if v159 then
		v160 = v159.CraftingItems[1]
	else
		v160 = nil
	end
	local v161 = not v160
	if v161 then
		v161 = false
		local v162 = v_u_9:GetIndividualCraftingMachineData(p158, v_u_34(p158))
		local v163
		if v162 and v162.RecipeId then
			v163 = v_u_30[v162.RecipeId]
			if v163 then
				local _ = v162.RecipeId
			else
				v163 = nil
			end
		else
			v163 = nil
		end
		if v163 ~= nil then
			v161 = v_u_45[p158] == true
		end
	end
	return v161
end
function v_u_32.SetupProximityPromptForCraftingStation(_, p_u_164)
	-- upvalues: (copy) v_u_121, (copy) v_u_9, (copy) v_u_34, (copy) v_u_30, (copy) v_u_8, (copy) v_u_39, (copy) v_u_128, (copy) v_u_144, (copy) v_u_17, (copy) v_u_45, (copy) v_u_108, (copy) v_u_29
	local v165 = Instance.new("ProximityPrompt")
	v165.Style = Enum.ProximityPromptStyle.Default
	v165.RequiresLineOfSight = false
	v165.HoldDuration = 0
	v165.KeyboardKeyCode = Enum.KeyCode.E
	v165.Name = "CraftingProximityPrompt"
	v165.ActionText = "Select Recipe"
	v165.ObjectText = "Crafting"
	v165.MaxActivationDistance = 10
	v165.Parent = p_u_164.PrimaryPart
	v165.Style = Enum.ProximityPromptStyle.Custom
	v165:SetAttribute("Theme", "ShadowedPrompt")
	v_u_121(p_u_164)
	v165.Triggered:Connect(function()
		-- upvalues: (copy) p_u_164, (ref) v_u_9, (ref) v_u_34, (ref) v_u_30, (ref) v_u_8, (ref) v_u_39, (ref) v_u_128, (ref) v_u_144, (ref) v_u_17, (ref) v_u_121
		local v166 = p_u_164
		local v167 = v_u_9:GetIndividualCraftingMachineData(v166, v_u_34(v166))
		local v168
		if v167 then
			v168 = v167.CraftingItems[1]
		else
			v168 = nil
		end
		if v168 == nil then
			local v169 = p_u_164
			local v170 = v_u_9:GetIndividualCraftingMachineData(v169, v_u_34(v169))
			local v171
			if v170 and v170.RecipeId then
				v171 = v_u_30[v170.RecipeId]
				if v171 then
					local _ = v170.RecipeId
				else
					v171 = nil
				end
			else
				v171 = nil
			end
			if v171 then
				local v172 = p_u_164
				local v173 = v_u_9:GetIndividualCraftingMachineData(v172, v_u_34(v172))
				local v174
				if v173 and v173.RecipeId then
					local v175 = v_u_30[v173.RecipeId]
					if v175 then
						v174 = v_u_8((v_u_39(v172))) >= v_u_8(v175.Inputs)
					else
						v174 = false
					end
				else
					v174 = false
				end
				if v174 then
					v_u_128(p_u_164)
				else
					v_u_144(p_u_164)
				end
			else
				v_u_17:Fire(p_u_164)
			end
		elseif v168.IsDone then
			v_u_9:Claim(p_u_164, p_u_164:GetAttribute("CraftingObjectType"), 1)
		else
			v_u_9:Skip(p_u_164, p_u_164:GetAttribute("CraftingObjectType"), 1)
		end
		v_u_121(p_u_164)
	end)
	v165.PromptShown:Connect(function()
		-- upvalues: (ref) v_u_45, (copy) p_u_164, (ref) v_u_121, (ref) v_u_108
		v_u_45[p_u_164] = true
		v_u_121(p_u_164)
		v_u_108(p_u_164)
	end)
	v165.PromptHidden:Connect(function()
		-- upvalues: (ref) v_u_45, (copy) p_u_164, (ref) v_u_121, (ref) v_u_108
		v_u_45[p_u_164] = nil
		v_u_121(p_u_164)
		v_u_108(p_u_164)
	end)
	local function v_u_180()
		-- upvalues: (ref) v_u_121, (copy) p_u_164, (ref) v_u_108, (ref) v_u_9, (ref) v_u_34
		v_u_121(p_u_164)
		v_u_108(p_u_164)
		local v176 = p_u_164
		local v177 = v_u_9:GetIndividualCraftingMachineData(v176, v_u_34(v176))
		local v178
		if v177 then
			v178 = v177.CraftingItems[1]
		else
			v178 = nil
		end
		local v179
		if v178 == nil then
			v179 = false
		else
			v179 = not v178.IsDone
		end
		v176:SetAttribute("IsCrafting", v179)
	end
	task.spawn(function()
		-- upvalues: (ref) v_u_29, (copy) v_u_180
		local v181 = v_u_29:GetPathSignal("CraftingData/@")
		if v181 then
			v181:Connect(v_u_180)
		end
		local v182 = v_u_29:GetPathSignal("CraftingData")
		if v182 then
			v182:Connect(v_u_180)
		end
		v_u_29:GetPathSignal("RebirthData/TotalRebirths"):Connect(v_u_180)
	end)
	v_u_121(p_u_164)
	v_u_108(p_u_164)
	local v183 = v_u_9:GetIndividualCraftingMachineData(p_u_164, v_u_34(p_u_164))
	local v184
	if v183 then
		v184 = v183.CraftingItems[1]
	else
		v184 = nil
	end
	local v185
	if v184 == nil then
		v185 = false
	else
		v185 = not v184.IsDone
	end
	p_u_164:SetAttribute("IsCrafting", v185)
end
v18.OnClientEvent:Connect(function(_) end)
v19.OnClientEvent:Connect(function(p186)
	-- upvalues: (copy) v_u_32, (copy) v_u_7
	v_u_32:CancelRecipe(p186)
	v_u_7:CreateNotification("Crafting failed! Try again!")
end)
v16.Event:Connect(function(p187, p188, _)
	-- upvalues: (copy) v_u_11, (copy) v_u_31, (copy) v_u_9, (copy) v_u_22
	v_u_11:Close(v_u_31)
	v_u_9:SetRecipe(p187, p187:GetAttribute("CraftingObjectType"), p188)
	v_u_22:Fire("Craft_SelectRecipe")
end)
local v189 = v4:GetTagged("CraftingObject")
if #v189 < 0 then
	error("CraftingStationHandler: Cannot find CraftingStation")
	return {}
end
for _, v190 in v189 do
	v_u_32:SetupProximityPromptForCraftingStation(v190)
end
v4:GetInstanceAddedSignal("CraftingObject"):Connect(function(p191)
	-- upvalues: (copy) v_u_32
	v_u_32:SetupProximityPromptForCraftingStation(p191)
end)
return v_u_32