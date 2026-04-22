local v1 = game:GetService("ReplicatedStorage")
local v2 = game:GetService("Players")
local v_u_3 = game:GetService("TweenService")
local v_u_4 = require(script.Parent.TradeUIItemValueCalculators)
require(v1.Data.TradeData)
local v_u_5 = require(v1.Modules.NumberUtil)
local v_u_6 = require(v1.Modules.ItemNameFinder)
local v_u_7 = require(v1.Modules.ItemRarityFinder)
local v_u_8 = require(v1.Modules.ItemImageFinder)
local v_u_9 = require(v1.Data.PetRegistry)
local v_u_10 = require(v1.Modules.PetServices.PetUtilities)
local v_u_11 = require(v1.Item_Module)
local v_u_12 = require(v1.Data.PetRegistry.PetMutationRegistry)
local v_u_13 = require(v1.Data.TradeBoothSkinRegistry)
local v_u_14 = require(v1.Calculate_Weight)
local v_u_15 = require(v1.Data.SeedData)
local v_u_16 = require(v1.Modules.MutationHandler)
local v_u_17 = require(v1.Modules.TradeTokens.TokenRAPController)
local v18 = v2.LocalPlayer.PlayerGui
local v19 = v18:WaitForChild("TradeItemHover").TradeItemHover
local v_u_20 = v19.CanvasGroup.Main.Item.Item.Detail
local v_u_21 = v19.CanvasGroup.Main.Item.ITEM_NAME
local v_u_22 = v19.CanvasGroup.Main.Item.ITEM_NAME_SHADOW
local v_u_23 = v19.CanvasGroup.Main.Item.ITEM_RARITY
local v_u_24 = v19.CanvasGroup.Main.Item.ITEM_RARITY_SHADOW
local v_u_25 = v19.CanvasGroup.Main.Item.Item.ITEM_IMAGE
local v_u_26 = v19.CanvasGroup.Main.Item.LockIcon
local v_u_27 = v19.CanvasGroup.Main.Stats
local v_u_28 = v19.CanvasGroup.Main.RAPValue
local v_u_29 = v_u_27.SegmentTemplate
local _ = v18:WaitForChild("TradingUI").LiveTrade.MyPlr.ScrollingFrame.ItemTemplate
v_u_29.Visible = false
local v_u_30 = {}
local v_u_31 = {}
return {
	["ItemRenderers"] = {
		["Pet"] = function(p_u_32)
			-- upvalues: (copy) v_u_4, (copy) v_u_31, (copy) v_u_28, (copy) v_u_17, (copy) v_u_9, (copy) v_u_21, (copy) v_u_22, (copy) v_u_25, (copy) v_u_23, (copy) v_u_24, (copy) v_u_11, (copy) v_u_3, (copy) v_u_20, (copy) v_u_10, (copy) v_u_29, (copy) v_u_30, (copy) v_u_27, (copy) v_u_5, (copy) v_u_12, (copy) v_u_26
			local v_u_33 = p_u_32.type
			local _ = p_u_32.id
			local v_u_34 = p_u_32.data
			local v35 = v_u_4[v_u_33]
			local v36
			if v_u_34.FakeItem then
				v36 = nil
			else
				v36 = not v35 and 0 or v35(p_u_32)
			end
			v_u_31.Pet = p_u_32
			local v37 = v_u_17:GetRAP(v_u_33, v_u_34)
			if v_u_31.Pet == p_u_32 then
				v_u_28.Price.Text = not v37 and "???" or ("%*"):format(v37)
			end
			if not v37 then
				task.defer(function()
					-- upvalues: (ref) v_u_17, (copy) v_u_33, (copy) v_u_34, (ref) v_u_31, (copy) p_u_32, (ref) v_u_28
					local v38 = v_u_17:GetRAPAsync(v_u_33, v_u_34)
					if v_u_31.Pet == p_u_32 then
						v_u_28.Price.Text = not v38 and "???" or ("%*"):format(v38)
					end
					return nil
				end)
			end
			local v39 = v_u_9.PetList[v_u_34.PetType]
			v_u_21.Text = v_u_34.PetType
			v_u_22.Text = v_u_34.PetType
			local v40 = not v39 and "No Rarity" or v39.Rarity
			v_u_25.Image = not v39 and "rbxassetid://6937742258" or v39.Icon
			v_u_23.Text = v40
			v_u_24.Text = v40
			local v41 = v_u_11.Return_Rarity_Data(v40)
			local v42 = v_u_3
			local v43 = v_u_23
			local v44 = TweenInfo.new(0.2)
			local v45 = {}
			local v46
			if v41 then
				v46 = v41[2]
			else
				v46 = Color3.fromRGB(255, 255, 255)
			end
			v45.TextColor3 = v46
			v42:Create(v43, v44, v45):Play()
			for _, v47 in v_u_20:GetChildren() do
				if v47:IsA("Frame") then
					local v48 = v_u_3
					local v49 = TweenInfo.new(0.2)
					local v50 = {}
					local v51
					if v41 then
						v51 = v41[2]
					else
						v51 = Color3.fromRGB(43, 13, 0)
					end
					v50.BackgroundColor3 = v51
					v48:Create(v47, v49, v50):Play()
				end
			end
			if v36 then
				local v52 = string.format("%0.2fkg", v_u_10:CalculateWeight(v_u_34.PetData.BaseWeight, v_u_34.PetData.Level))
				local v53 = v_u_29:Clone()
				v53.BackgroundTransparency = #v_u_30 % 2 == 0 and 0.96 or 0.9
				local v54 = v_u_30
				table.insert(v54, v53)
				v53.LayoutOrder = #v_u_30
				v53.Visible = true
				v53.Parent = v_u_27
				v53.ITEM_STAT_NAME.Text = "Weight"
				v53.ITEM_STAT_NAME_SHADOW.Text = "Weight"
				v53.STAT_VALUE.Text = v52
				v53.STAT_VALUE_SHADOW.Text = v52
				local v55 = v_u_29:Clone()
				v55.BackgroundTransparency = #v_u_30 % 2 == 0 and 0.96 or 0.9
				local v56 = v_u_30
				table.insert(v56, v55)
				v55.LayoutOrder = #v_u_30
				v55.Visible = true
				v55.Parent = v_u_27
				v55.ITEM_STAT_NAME.Text = "Sheckles"
				v55.ITEM_STAT_NAME_SHADOW.Text = "Sheckles"
				v55.STAT_VALUE.Text = ("%*"):format((v_u_5.DisplaySheckles(v36)))
				v55.STAT_VALUE_SHADOW.Text = ("%*"):format((v_u_5.DisplaySheckles(v36)))
			end
			if not v_u_34.FakeItem then
				local v57 = v_u_29:Clone()
				v57.BackgroundTransparency = #v_u_30 % 2 == 0 and 0.96 or 0.9
				local v58 = v_u_30
				table.insert(v58, v57)
				v57.LayoutOrder = #v_u_30
				v57.Visible = true
				v57.Parent = v_u_27
				v57.ITEM_STAT_NAME.Text = "Name"
				v57.ITEM_STAT_NAME_SHADOW.Text = "Name"
				v57.STAT_VALUE.Text = v_u_34.PetType
				v57.STAT_VALUE_SHADOW.Text = v_u_34.PetType
				local v59 = v_u_29:Clone()
				v59.BackgroundTransparency = #v_u_30 % 2 == 0 and 0.96 or 0.9
				local v60 = v_u_30
				table.insert(v60, v59)
				v59.LayoutOrder = #v_u_30
				v59.Visible = true
				v59.Parent = v_u_27
				v59.ITEM_STAT_NAME.Text = "Age"
				v59.ITEM_STAT_NAME_SHADOW.Text = "Age"
				v59.STAT_VALUE.Text = v_u_34.PetData.Level
				v59.STAT_VALUE_SHADOW.Text = v_u_34.PetData.Level
			end
			local v61 = v_u_34.PetData.MutationType
			if v61 and not v_u_34.FakeItem then
				local v62 = v_u_12.EnumToPetMutation[v61]
				local v63 = v_u_12.PetMutationRegistry[v62]
				local v64 = v_u_29:Clone()
				v64.BackgroundTransparency = #v_u_30 % 2 == 0 and 0.96 or 0.9
				local v65 = v_u_30
				table.insert(v65, v64)
				v64.LayoutOrder = #v_u_30
				v64.Visible = true
				v64.Parent = v_u_27
				v64.ITEM_STAT_NAME.Text = "Mutations"
				v64.ITEM_STAT_NAME_SHADOW.Text = "Mutations"
				v64.STAT_VALUE.Visible = false
				v64.STAT_VALUE_SHADOW.Visible = false
				local v66 = v_u_29:Clone()
				v66.BackgroundTransparency = #v_u_30 % 2 == 0 and 0.96 or 0.9
				local v67 = v_u_30
				table.insert(v67, v66)
				v66.LayoutOrder = #v_u_30
				v66.Visible = true
				v66.Parent = v_u_27
				v66.ITEM_STAT_NAME.Text = ("\t%*"):format(v62)
				v66.ITEM_STAT_NAME_SHADOW.Text = ("\t%*"):format(v62)
				v66.STAT_VALUE.Visible = false
				v66.STAT_VALUE_SHADOW.Visible = false
				if v_u_12.PetMutationRegistry.Rainbow.EnumId == v61 then
					v66.ITEM_STAT_NAME:AddTag("RainbowText")
				else
					v66.ITEM_STAT_NAME.TextColor3 = v63.Color
				end
			end
			v_u_26.Visible = false
			local v68 = p_u_32.tradeLock
			if v68 then
				local v69 = v68.Type
				local v70 = v68.Value
				local v71 = v_u_29:Clone()
				v71.BackgroundTransparency = #v_u_30 % 2 == 0 and 0.96 or 0.9
				local v72 = v_u_30
				table.insert(v72, v71)
				v71.LayoutOrder = #v_u_30
				v71.Visible = true
				v71.Parent = v_u_27
				v71.ITEM_STAT_NAME.Text = "Trade Cooldown"
				v71.ITEM_STAT_NAME_SHADOW.Text = "Trade Cooldown"
				if v69 == "Permanent" then
					v71.STAT_VALUE.Text = "Untradable"
					v71.STAT_VALUE_SHADOW.Text = "Untradable"
					v_u_26.Visible = true
					return
				end
				if v69 == "Date" then
					local v73 = workspace:GetServerTimeNow()
					local v74 = v70 - math.ceil(v73)
					v71.STAT_VALUE.Text = ("Tradable in %*"):format((v_u_5.compactFormat(v74)))
					v71.STAT_VALUE_SHADOW.Text = ("Tradable in %*"):format((v_u_5.compactFormat(v74)))
					v_u_26.Visible = true
					return
				end
				if v69 == "Listing" then
					v71.STAT_VALUE.Text = ("%*"):format(v70)
					v71.STAT_VALUE_SHADOW.Text = ("%*"):format(v70)
					v_u_26.Visible = false
				end
			end
		end,
		["Holdable"] = function(p_u_75)
			-- upvalues: (copy) v_u_15, (copy) v_u_4, (copy) v_u_31, (copy) v_u_28, (copy) v_u_17, (copy) v_u_21, (copy) v_u_22, (copy) v_u_25, (copy) v_u_23, (copy) v_u_24, (copy) v_u_11, (copy) v_u_3, (copy) v_u_20, (copy) v_u_14, (copy) v_u_29, (copy) v_u_30, (copy) v_u_27, (copy) v_u_5, (copy) v_u_16, (copy) v_u_26
			local v_u_76 = p_u_75.type
			local _ = p_u_75.id
			local v_u_77 = p_u_75.data
			local v78 = v_u_15[v_u_77.ItemName]
			local v79 = v_u_4[v_u_76]
			local v80
			if v_u_77.FakeItem then
				v80 = nil
			else
				v80 = not v79 and 0 or v79(p_u_75)
			end
			v_u_31.Holdable = p_u_75
			local v81 = v_u_17:GetRAP(v_u_76, v_u_77)
			if v_u_31.Holdable == p_u_75 then
				v_u_28.Price.Text = not v81 and "???" or ("%*"):format(v81)
			end
			if not v81 then
				task.defer(function()
					-- upvalues: (ref) v_u_17, (copy) v_u_76, (copy) v_u_77, (ref) v_u_31, (copy) p_u_75, (ref) v_u_28
					local v82 = v_u_17:GetRAPAsync(v_u_76, v_u_77)
					if v_u_31.Holdable == p_u_75 then
						v_u_28.Price.Text = not v82 and "???" or ("%*"):format(v82)
					end
					return nil
				end)
			end
			local v83 = v78.DisplayName
			if v_u_76 ~= "Fruit" then
				v83 = v83:gsub("Seed", "")
			end
			v_u_21.Text = v83 or v_u_77.ItemName
			v_u_22.Text = v_u_21.Text
			v_u_25.Image = v78.FruitIcon
			v_u_23.Text = v78.SeedRarity
			v_u_24.Text = v78.SeedRarity
			local v84 = v_u_11.Return_Rarity_Data(v78.SeedRarity)
			local v85 = v_u_3
			local v86 = v_u_23
			local v87 = TweenInfo.new(0.2)
			local v88 = {}
			local v89
			if v84 then
				v89 = v84[2]
			else
				v89 = Color3.fromRGB(255, 255, 255)
			end
			v88.TextColor3 = v89
			v85:Create(v86, v87, v88):Play()
			for _, v90 in v_u_20:GetChildren() do
				if v90:IsA("Frame") then
					local v91 = v_u_3
					local v92 = TweenInfo.new(0.2)
					local v93 = {}
					local v94
					if v84 then
						v94 = v84[2]
					else
						v94 = Color3.fromRGB(43, 13, 0)
					end
					v93.BackgroundColor3 = v94
					v91:Create(v90, v92, v93):Play()
				end
			end
			if v80 then
				local v95 = string.format("%0.2fkg", v_u_14.Calculate_Weight(v_u_77.Seed, v_u_77.ItemName) * (v_u_77.WeightMultiplier or 1))
				local v96 = v_u_29:Clone()
				v96.BackgroundTransparency = #v_u_30 % 2 == 0 and 0.96 or 0.9
				local v97 = v_u_30
				table.insert(v97, v96)
				v96.LayoutOrder = #v_u_30
				v96.Visible = true
				v96.Parent = v_u_27
				v96.ITEM_STAT_NAME.Text = "Weight"
				v96.ITEM_STAT_NAME_SHADOW.Text = "Weight"
				v96.STAT_VALUE.Text = v95
				v96.STAT_VALUE_SHADOW.Text = v95
				local v98 = v_u_29:Clone()
				v98.BackgroundTransparency = #v_u_30 % 2 == 0 and 0.96 or 0.9
				local v99 = v_u_30
				table.insert(v99, v98)
				v98.LayoutOrder = #v_u_30
				v98.Visible = true
				v98.Parent = v_u_27
				v98.ITEM_STAT_NAME.Text = "Sheckles"
				v98.ITEM_STAT_NAME_SHADOW.Text = "Sheckles"
				v98.STAT_VALUE.Text = v_u_5.DisplaySheckles(v80)
				v98.STAT_VALUE_SHADOW.Text = v_u_5.DisplaySheckles(v80)
			end
			if v_u_77.MutationString ~= "" or v_u_77.Variant ~= "Normal" then
				local v100 = v_u_29:Clone()
				v100.BackgroundTransparency = #v_u_30 % 2 == 0 and 0.96 or 0.9
				local v101 = v_u_30
				table.insert(v101, v100)
				v100.LayoutOrder = #v_u_30
				v100.Visible = true
				v100.Parent = v_u_27
				v100.ITEM_STAT_NAME.Text = "Mutations"
				v100.ITEM_STAT_NAME_SHADOW.Text = "Mutations"
				v100.STAT_VALUE.Visible = false
				v100.STAT_VALUE_SHADOW.Visible = false
				if v_u_77.Variant ~= "Normal" then
					local v102 = v_u_29:Clone()
					v102.BackgroundTransparency = #v_u_30 % 2 == 0 and 0.96 or 0.9
					local v103 = v_u_30
					table.insert(v103, v102)
					v102.LayoutOrder = #v_u_30
					v102.Visible = true
					v102.Parent = v_u_27
					v102.ITEM_STAT_NAME.Text = ("\t%*"):format(v_u_77.Variant)
					v102.ITEM_STAT_NAME_SHADOW.Text = ("\t%*"):format(v_u_77.Variant)
					v102.STAT_VALUE.Visible = false
					v102.STAT_VALUE_SHADOW.Visible = false
					if v_u_77.Variant == "Rainbow" then
						v102.ITEM_STAT_NAME:AddTag("RainbowText")
					elseif v_u_77.Variant == "Gold" then
						v102.ITEM_STAT_NAME.TextColor3 = Color3.fromHex("#FFD700")
					end
				end
				for _, v104 in v_u_16:ExtractMutationsFromString(v_u_77.MutationString) do
					local v105 = v_u_29:Clone()
					v105.BackgroundTransparency = #v_u_30 % 2 == 0 and 0.96 or 0.9
					local v106 = v_u_30
					table.insert(v106, v105)
					v105.LayoutOrder = #v_u_30
					v105.Visible = true
					v105.Parent = v_u_27
					v105.ITEM_STAT_NAME.Text = ("\t%*"):format(v104.Name)
					v105.ITEM_STAT_NAME_SHADOW.Text = ("\t%*"):format(v104.Name)
					v105.ITEM_STAT_NAME.TextColor3 = v104.Color
					v105.STAT_VALUE.Visible = false
					v105.STAT_VALUE_SHADOW.Visible = false
				end
			end
			v_u_26.Visible = false
			local v107 = p_u_75.tradeLock
			if v107 then
				local v108 = v107.Type
				local v109 = v107.Value
				local v110 = v_u_29:Clone()
				v110.BackgroundTransparency = #v_u_30 % 2 == 0 and 0.96 or 0.9
				local v111 = v_u_30
				table.insert(v111, v110)
				v110.LayoutOrder = #v_u_30
				v110.Visible = true
				v110.Parent = v_u_27
				v110.ITEM_STAT_NAME.Text = "Trade Cooldown"
				v110.ITEM_STAT_NAME_SHADOW.Text = "Trade Cooldown"
				if v108 == "Permanent" then
					v110.STAT_VALUE.Text = "Untradable"
					v110.STAT_VALUE_SHADOW.Text = "Untradable"
					v_u_26.Visible = true
					return
				end
				if v108 == "Date" then
					local v112 = workspace:GetServerTimeNow()
					local v113 = v109 - math.ceil(v112)
					v110.STAT_VALUE.Text = ("Tradable in %*"):format((v_u_5.compactFormat(v113)))
					v110.STAT_VALUE_SHADOW.Text = ("Tradable in %*"):format((v_u_5.compactFormat(v113)))
					v_u_26.Visible = true
					return
				end
				if v108 == "Listing" then
					v110.STAT_VALUE.Text = ("%*"):format(v109)
					v110.STAT_VALUE_SHADOW.Text = ("%*"):format(v109)
					v_u_26.Visible = false
				end
			end
		end,
		["Packaged Seed"] = function(p114)
			-- upvalues: (copy) v_u_15, (copy) v_u_4, (copy) v_u_21, (copy) v_u_22, (copy) v_u_25, (copy) v_u_23, (copy) v_u_24, (copy) v_u_11, (copy) v_u_3, (copy) v_u_20, (copy) v_u_29, (copy) v_u_30, (copy) v_u_27
			local v115 = p114.type
			local _ = p114.id
			local v116 = p114.data
			local v117 = v_u_15[v116.ItemName]
			local v118 = v_u_4[v115]
			if v118 then
				v118(p114)
			end
			v_u_21.Text = v117.SeedName
			v_u_22.Text = v117.SeedName
			v_u_25.Image = v117.Asset
			v_u_23.Text = v117.SeedRarity
			v_u_24.Text = v117.SeedRarity
			local v119 = v_u_11.Return_Rarity_Data(v117.SeedRarity)
			local v120 = v_u_3
			local v121 = v_u_23
			local v122 = TweenInfo.new(0.2)
			local v123 = {}
			local v124
			if v119 then
				v124 = v119[2]
			else
				v124 = Color3.fromRGB(255, 255, 255)
			end
			v123.TextColor3 = v124
			v120:Create(v121, v122, v123):Play()
			for _, v125 in v_u_20:GetChildren() do
				if v125:IsA("Frame") then
					local v126 = v_u_3
					local v127 = TweenInfo.new(0.2)
					local v128 = {}
					local v129
					if v119 then
						v129 = v119[2]
					else
						v129 = Color3.fromRGB(43, 13, 0)
					end
					v128.BackgroundColor3 = v129
					v126:Create(v125, v127, v128):Play()
				end
			end
			if v116.Variant ~= "Normal" then
				local v130 = v_u_29:Clone()
				v130.BackgroundTransparency = #v_u_30 % 2 == 0 and 0.96 or 0.9
				local v131 = v_u_30
				table.insert(v131, v130)
				v130.LayoutOrder = #v_u_30
				v130.Visible = true
				v130.Parent = v_u_27
				v130.ITEM_STAT_NAME.Text = ("\t%*"):format(v116.Variant)
				v130.ITEM_STAT_NAME_SHADOW.Text = ("\t%*"):format(v116.Variant)
				v130.STAT_VALUE.Visible = false
				v130.STAT_VALUE_SHADOW.Visible = false
				if v116.Variant == "Rainbow" then
					v130.ITEM_STAT_NAME:AddTag("RainbowText")
					return
				end
				if v116.Variant == "Gold" then
					v130.ITEM_STAT_NAME.TextColor3 = Color3.fromHex("#FFD700")
				end
			end
		end,
		["TradeBoothSkin"] = function(p_u_132)
			-- upvalues: (copy) v_u_13, (copy) v_u_31, (copy) v_u_28, (copy) v_u_17, (copy) v_u_6, (copy) v_u_21, (copy) v_u_22, (copy) v_u_8, (copy) v_u_25, (copy) v_u_7, (copy) v_u_23, (copy) v_u_24, (copy) v_u_11, (copy) v_u_3, (copy) v_u_20
			local v_u_133 = p_u_132.type
			local _ = p_u_132.id
			local v_u_134 = p_u_132.data
			local _ = v_u_13[v_u_134.SkinID]
			v_u_31.TradeBoothSkin = p_u_132
			local v135 = v_u_17:GetRAP(v_u_133, v_u_134)
			if v_u_31.TradeBoothSkin == p_u_132 then
				v_u_28.Price.Text = not v135 and "???" or ("%*"):format(v135)
			end
			if not v135 then
				task.defer(function()
					-- upvalues: (ref) v_u_17, (copy) v_u_133, (copy) v_u_134, (ref) v_u_31, (copy) p_u_132, (ref) v_u_28
					local v136 = v_u_17:GetRAPAsync(v_u_133, v_u_134)
					if v_u_31.TradeBoothSkin == p_u_132 then
						v_u_28.Price.Text = not v136 and "???" or ("%*"):format(v136)
					end
					return nil
				end)
			end
			local v137 = v_u_6(v_u_134.SkinID, v_u_133)
			v_u_21.Text = v137
			v_u_22.Text = v137
			v_u_25.Image = v_u_8(v_u_134.SkinID, v_u_133)
			local v138 = v_u_7(v_u_134.SkinID, v_u_133)
			v_u_23.Text = v138
			v_u_24.Text = v138
			local v139 = v_u_11.Return_Rarity_Data(v138)
			local v140 = v_u_3
			local v141 = v_u_23
			local v142 = TweenInfo.new(0.2)
			local v143 = {}
			local v144
			if v139 then
				v144 = v139[2]
			else
				v144 = Color3.fromRGB(255, 255, 255)
			end
			v143.TextColor3 = v144
			v140:Create(v141, v142, v143):Play()
			for _, v145 in v_u_20:GetChildren() do
				if v145:IsA("Frame") then
					local v146 = v_u_3
					local v147 = TweenInfo.new(0.2)
					local v148 = {}
					local v149
					if v139 then
						v149 = v139[2]
					else
						v149 = Color3.fromRGB(43, 13, 0)
					end
					v148.BackgroundColor3 = v149
					v146:Create(v145, v147, v148):Play()
				end
			end
		end
	},
	["ItemRenderTypes"] = {
		["Pet"] = function(p150, p151)
			-- upvalues: (copy) v_u_9, (copy) v_u_10, (copy) v_u_11
			local v152 = p150.Title
			local v153 = p150.Weight
			local v154 = p150.Vector
			local _ = p151.type
			local _ = p151.id
			local v155 = p151.data
			local v156 = v_u_9.PetList[v155.PetType]
			v152.Text = v155.PetType
			v153.Text = string.format("%0.2fkg", v_u_10:CalculateWeight(v155.PetData.BaseWeight, v155.PetData.Level))
			v154.Image = not v156 and "rbxassetid://6937742258" or v156.Icon
			local v157 = not v156 and "No Rarity" or v156.Rarity
			local v158 = v_u_11.Return_Rarity_Data(v157)
			local v159 = p150.Stroke
			local v160
			if v158 then
				v160 = v158[2]
			else
				v160 = Color3.fromRGB(56, 23, 8)
			end
			v159.ImageColor3 = v160
		end,
		["Holdable"] = function(p161, p162)
			-- upvalues: (copy) v_u_15, (copy) v_u_14, (copy) v_u_11
			local v163 = p161.Title
			local v164 = p161.Weight
			local v165 = p161.Vector
			local v166 = p162.type
			local _ = p162.id
			local v167 = p162.data
			local v168 = v_u_15[v167.ItemName]
			local v169 = v168.DisplayName
			if v166 ~= "Fruit" and v169 then
				v169 = v169:gsub("Seed", "")
			end
			v163.Text = v169 or v167.ItemName
			v164.Text = string.format("%0.2fkg", (v_u_14.Calculate_Weight(v167.Seed, v167.ItemName) or 0) * (v167.WeightMultiplier or 1))
			v165.Image = v168.FruitIcon
			local v170 = v_u_11.Return_Rarity_Data(v168.SeedRarity)
			local v171 = p161.Stroke
			local v172
			if v170 then
				v172 = v170[2]
			else
				v172 = Color3.fromRGB(56, 23, 8)
			end
			v171.ImageColor3 = v172
		end,
		["Packaged Seed"] = function(p173, p174)
			-- upvalues: (copy) v_u_15, (copy) v_u_11
			local v175 = p173.Title
			local v176 = p173.Weight
			local v177 = p173.Vector
			local _ = p174.type
			local _ = p174.id
			local v178 = p174.data
			local v179 = v_u_15[v178.ItemName]
			v175.Text = v178.ItemName
			v176.Text = "Seed"
			v177.Image = v179.Asset
			local v180 = v_u_11.Return_Rarity_Data(v179.SeedRarity)
			local v181 = p173.Stroke
			local v182
			if v180 then
				v182 = v180[2]
			else
				v182 = Color3.fromRGB(56, 23, 8)
			end
			v181.ImageColor3 = v182
		end
	},
	["CleanUpAllSegments"] = function()
		-- upvalues: (copy) v_u_30
		for _, v183 in v_u_30 do
			v183:Destroy()
		end
		table.clear(v_u_30)
	end
}