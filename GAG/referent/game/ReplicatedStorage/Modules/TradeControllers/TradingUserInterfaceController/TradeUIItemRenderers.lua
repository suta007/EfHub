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
			v_u_21.Text = v_u_77.ItemName
			v_u_22.Text = v_u_77.ItemName
			v_u_25.Image = v78.FruitIcon
			v_u_23.Text = v78.SeedRarity
			v_u_24.Text = v78.SeedRarity
			local v83 = v_u_11.Return_Rarity_Data(v78.SeedRarity)
			local v84 = v_u_3
			local v85 = v_u_23
			local v86 = TweenInfo.new(0.2)
			local v87 = {}
			local v88
			if v83 then
				v88 = v83[2]
			else
				v88 = Color3.fromRGB(255, 255, 255)
			end
			v87.TextColor3 = v88
			v84:Create(v85, v86, v87):Play()
			for _, v89 in v_u_20:GetChildren() do
				if v89:IsA("Frame") then
					local v90 = v_u_3
					local v91 = TweenInfo.new(0.2)
					local v92 = {}
					local v93
					if v83 then
						v93 = v83[2]
					else
						v93 = Color3.fromRGB(43, 13, 0)
					end
					v92.BackgroundColor3 = v93
					v90:Create(v89, v91, v92):Play()
				end
			end
			if v80 then
				local v94 = string.format("%0.2fkg", v_u_14.Calculate_Weight(v_u_77.Seed, v_u_77.ItemName) * (v_u_77.WeightMultiplier or 1))
				local v95 = v_u_29:Clone()
				v95.BackgroundTransparency = #v_u_30 % 2 == 0 and 0.96 or 0.9
				local v96 = v_u_30
				table.insert(v96, v95)
				v95.LayoutOrder = #v_u_30
				v95.Visible = true
				v95.Parent = v_u_27
				v95.ITEM_STAT_NAME.Text = "Weight"
				v95.ITEM_STAT_NAME_SHADOW.Text = "Weight"
				v95.STAT_VALUE.Text = v94
				v95.STAT_VALUE_SHADOW.Text = v94
				local v97 = v_u_29:Clone()
				v97.BackgroundTransparency = #v_u_30 % 2 == 0 and 0.96 or 0.9
				local v98 = v_u_30
				table.insert(v98, v97)
				v97.LayoutOrder = #v_u_30
				v97.Visible = true
				v97.Parent = v_u_27
				v97.ITEM_STAT_NAME.Text = "Sheckles"
				v97.ITEM_STAT_NAME_SHADOW.Text = "Sheckles"
				v97.STAT_VALUE.Text = v_u_5.DisplaySheckles(v80)
				v97.STAT_VALUE_SHADOW.Text = v_u_5.DisplaySheckles(v80)
			end
			if v_u_77.MutationString ~= "" or v_u_77.Variant ~= "Normal" then
				local v99 = v_u_29:Clone()
				v99.BackgroundTransparency = #v_u_30 % 2 == 0 and 0.96 or 0.9
				local v100 = v_u_30
				table.insert(v100, v99)
				v99.LayoutOrder = #v_u_30
				v99.Visible = true
				v99.Parent = v_u_27
				v99.ITEM_STAT_NAME.Text = "Mutations"
				v99.ITEM_STAT_NAME_SHADOW.Text = "Mutations"
				v99.STAT_VALUE.Visible = false
				v99.STAT_VALUE_SHADOW.Visible = false
				if v_u_77.Variant ~= "Normal" then
					local v101 = v_u_29:Clone()
					v101.BackgroundTransparency = #v_u_30 % 2 == 0 and 0.96 or 0.9
					local v102 = v_u_30
					table.insert(v102, v101)
					v101.LayoutOrder = #v_u_30
					v101.Visible = true
					v101.Parent = v_u_27
					v101.ITEM_STAT_NAME.Text = ("\t%*"):format(v_u_77.Variant)
					v101.ITEM_STAT_NAME_SHADOW.Text = ("\t%*"):format(v_u_77.Variant)
					v101.STAT_VALUE.Visible = false
					v101.STAT_VALUE_SHADOW.Visible = false
					if v_u_77.Variant == "Rainbow" then
						v101.ITEM_STAT_NAME:AddTag("RainbowText")
					elseif v_u_77.Variant == "Gold" then
						v101.ITEM_STAT_NAME.TextColor3 = Color3.fromHex("#FFD700")
					end
				end
				for _, v103 in v_u_16:ExtractMutationsFromString(v_u_77.MutationString) do
					local v104 = v_u_29:Clone()
					v104.BackgroundTransparency = #v_u_30 % 2 == 0 and 0.96 or 0.9
					local v105 = v_u_30
					table.insert(v105, v104)
					v104.LayoutOrder = #v_u_30
					v104.Visible = true
					v104.Parent = v_u_27
					v104.ITEM_STAT_NAME.Text = ("\t%*"):format(v103.Name)
					v104.ITEM_STAT_NAME_SHADOW.Text = ("\t%*"):format(v103.Name)
					v104.ITEM_STAT_NAME.TextColor3 = v103.Color
					v104.STAT_VALUE.Visible = false
					v104.STAT_VALUE_SHADOW.Visible = false
				end
			end
			v_u_26.Visible = false
			local v106 = p_u_75.tradeLock
			if v106 then
				local v107 = v106.Type
				local v108 = v106.Value
				local v109 = v_u_29:Clone()
				v109.BackgroundTransparency = #v_u_30 % 2 == 0 and 0.96 or 0.9
				local v110 = v_u_30
				table.insert(v110, v109)
				v109.LayoutOrder = #v_u_30
				v109.Visible = true
				v109.Parent = v_u_27
				v109.ITEM_STAT_NAME.Text = "Trade Cooldown"
				v109.ITEM_STAT_NAME_SHADOW.Text = "Trade Cooldown"
				if v107 == "Permanent" then
					v109.STAT_VALUE.Text = "Untradable"
					v109.STAT_VALUE_SHADOW.Text = "Untradable"
					v_u_26.Visible = true
					return
				end
				if v107 == "Date" then
					local v111 = workspace:GetServerTimeNow()
					local v112 = v108 - math.ceil(v111)
					v109.STAT_VALUE.Text = ("Tradable in %*"):format((v_u_5.compactFormat(v112)))
					v109.STAT_VALUE_SHADOW.Text = ("Tradable in %*"):format((v_u_5.compactFormat(v112)))
					v_u_26.Visible = true
					return
				end
				if v107 == "Listing" then
					v109.STAT_VALUE.Text = ("%*"):format(v108)
					v109.STAT_VALUE_SHADOW.Text = ("%*"):format(v108)
					v_u_26.Visible = false
				end
			end
		end,
		["Packaged Seed"] = function(p113)
			-- upvalues: (copy) v_u_15, (copy) v_u_4, (copy) v_u_21, (copy) v_u_22, (copy) v_u_25, (copy) v_u_23, (copy) v_u_24, (copy) v_u_11, (copy) v_u_3, (copy) v_u_20, (copy) v_u_29, (copy) v_u_30, (copy) v_u_27
			local v114 = p113.type
			local _ = p113.id
			local v115 = p113.data
			local v116 = v_u_15[v115.ItemName]
			local v117 = v_u_4[v114]
			if v117 then
				v117(p113)
			end
			v_u_21.Text = v116.SeedName
			v_u_22.Text = v116.SeedName
			v_u_25.Image = v116.Asset
			v_u_23.Text = v116.SeedRarity
			v_u_24.Text = v116.SeedRarity
			local v118 = v_u_11.Return_Rarity_Data(v116.SeedRarity)
			local v119 = v_u_3
			local v120 = v_u_23
			local v121 = TweenInfo.new(0.2)
			local v122 = {}
			local v123
			if v118 then
				v123 = v118[2]
			else
				v123 = Color3.fromRGB(255, 255, 255)
			end
			v122.TextColor3 = v123
			v119:Create(v120, v121, v122):Play()
			for _, v124 in v_u_20:GetChildren() do
				if v124:IsA("Frame") then
					local v125 = v_u_3
					local v126 = TweenInfo.new(0.2)
					local v127 = {}
					local v128
					if v118 then
						v128 = v118[2]
					else
						v128 = Color3.fromRGB(43, 13, 0)
					end
					v127.BackgroundColor3 = v128
					v125:Create(v124, v126, v127):Play()
				end
			end
			if v115.Variant ~= "Normal" then
				local v129 = v_u_29:Clone()
				v129.BackgroundTransparency = #v_u_30 % 2 == 0 and 0.96 or 0.9
				local v130 = v_u_30
				table.insert(v130, v129)
				v129.LayoutOrder = #v_u_30
				v129.Visible = true
				v129.Parent = v_u_27
				v129.ITEM_STAT_NAME.Text = ("\t%*"):format(v115.Variant)
				v129.ITEM_STAT_NAME_SHADOW.Text = ("\t%*"):format(v115.Variant)
				v129.STAT_VALUE.Visible = false
				v129.STAT_VALUE_SHADOW.Visible = false
				if v115.Variant == "Rainbow" then
					v129.ITEM_STAT_NAME:AddTag("RainbowText")
					return
				end
				if v115.Variant == "Gold" then
					v129.ITEM_STAT_NAME.TextColor3 = Color3.fromHex("#FFD700")
				end
			end
		end,
		["TradeBoothSkin"] = function(p_u_131)
			-- upvalues: (copy) v_u_13, (copy) v_u_31, (copy) v_u_28, (copy) v_u_17, (copy) v_u_6, (copy) v_u_21, (copy) v_u_22, (copy) v_u_8, (copy) v_u_25, (copy) v_u_7, (copy) v_u_23, (copy) v_u_24, (copy) v_u_11, (copy) v_u_3, (copy) v_u_20
			local v_u_132 = p_u_131.type
			local _ = p_u_131.id
			local v_u_133 = p_u_131.data
			local _ = v_u_13[v_u_133.SkinID]
			v_u_31.TradeBoothSkin = p_u_131
			local v134 = v_u_17:GetRAP(v_u_132, v_u_133)
			if v_u_31.TradeBoothSkin == p_u_131 then
				v_u_28.Price.Text = not v134 and "???" or ("%*"):format(v134)
			end
			if not v134 then
				task.defer(function()
					-- upvalues: (ref) v_u_17, (copy) v_u_132, (copy) v_u_133, (ref) v_u_31, (copy) p_u_131, (ref) v_u_28
					local v135 = v_u_17:GetRAPAsync(v_u_132, v_u_133)
					if v_u_31.TradeBoothSkin == p_u_131 then
						v_u_28.Price.Text = not v135 and "???" or ("%*"):format(v135)
					end
					return nil
				end)
			end
			local v136 = v_u_6(v_u_133.SkinID, v_u_132)
			v_u_21.Text = v136
			v_u_22.Text = v136
			v_u_25.Image = v_u_8(v_u_133.SkinID, v_u_132)
			local v137 = v_u_7(v_u_133.SkinID, v_u_132)
			v_u_23.Text = v137
			v_u_24.Text = v137
			local v138 = v_u_11.Return_Rarity_Data(v137)
			local v139 = v_u_3
			local v140 = v_u_23
			local v141 = TweenInfo.new(0.2)
			local v142 = {}
			local v143
			if v138 then
				v143 = v138[2]
			else
				v143 = Color3.fromRGB(255, 255, 255)
			end
			v142.TextColor3 = v143
			v139:Create(v140, v141, v142):Play()
			for _, v144 in v_u_20:GetChildren() do
				if v144:IsA("Frame") then
					local v145 = v_u_3
					local v146 = TweenInfo.new(0.2)
					local v147 = {}
					local v148
					if v138 then
						v148 = v138[2]
					else
						v148 = Color3.fromRGB(43, 13, 0)
					end
					v147.BackgroundColor3 = v148
					v145:Create(v144, v146, v147):Play()
				end
			end
		end
	},
	["ItemRenderTypes"] = {
		["Pet"] = function(p149, p150)
			-- upvalues: (copy) v_u_9, (copy) v_u_10, (copy) v_u_11
			local v151 = p149.Title
			local v152 = p149.Weight
			local v153 = p149.Vector
			local _ = p150.type
			local _ = p150.id
			local v154 = p150.data
			local v155 = v_u_9.PetList[v154.PetType]
			v151.Text = v154.PetType
			v152.Text = string.format("%0.2fkg", v_u_10:CalculateWeight(v154.PetData.BaseWeight, v154.PetData.Level))
			v153.Image = not v155 and "rbxassetid://6937742258" or v155.Icon
			local v156 = not v155 and "No Rarity" or v155.Rarity
			local v157 = v_u_11.Return_Rarity_Data(v156)
			local v158 = p149.Stroke
			local v159
			if v157 then
				v159 = v157[2]
			else
				v159 = Color3.fromRGB(56, 23, 8)
			end
			v158.ImageColor3 = v159
		end,
		["Holdable"] = function(p160, p161)
			-- upvalues: (copy) v_u_15, (copy) v_u_14, (copy) v_u_11
			local v162 = p160.Title
			local v163 = p160.Weight
			local v164 = p160.Vector
			local _ = p161.type
			local _ = p161.id
			local v165 = p161.data
			local v166 = v_u_15[v165.ItemName]
			v162.Text = v165.ItemName
			v163.Text = string.format("%0.2fkg", (v_u_14.Calculate_Weight(v165.Seed, v165.ItemName) or 0) * (v165.WeightMultiplier or 1))
			v164.Image = v166.FruitIcon
			local v167 = v_u_11.Return_Rarity_Data(v166.SeedRarity)
			local v168 = p160.Stroke
			local v169
			if v167 then
				v169 = v167[2]
			else
				v169 = Color3.fromRGB(56, 23, 8)
			end
			v168.ImageColor3 = v169
		end,
		["Packaged Seed"] = function(p170, p171)
			-- upvalues: (copy) v_u_15, (copy) v_u_11
			local v172 = p170.Title
			local v173 = p170.Weight
			local v174 = p170.Vector
			local _ = p171.type
			local _ = p171.id
			local v175 = p171.data
			local v176 = v_u_15[v175.ItemName]
			v172.Text = v175.ItemName
			v173.Text = "Seed"
			v174.Image = v176.Asset
			local v177 = v_u_11.Return_Rarity_Data(v176.SeedRarity)
			local v178 = p170.Stroke
			local v179
			if v177 then
				v179 = v177[2]
			else
				v179 = Color3.fromRGB(56, 23, 8)
			end
			v178.ImageColor3 = v179
		end
	},
	["CleanUpAllSegments"] = function()
		-- upvalues: (copy) v_u_30
		for _, v180 in v_u_30 do
			v180:Destroy()
		end
		table.clear(v_u_30)
	end
}