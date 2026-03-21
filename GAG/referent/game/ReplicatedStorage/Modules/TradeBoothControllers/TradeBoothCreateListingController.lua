local v1 = game:GetService("ReplicatedStorage")
local v2 = game:GetService("Players")
require(v1.Data.EnumRegistry.ReversedItemTypeEnums)
require(v1.Data.EnumRegistry.InventoryServiceEnums)
require(v1.Modules.TradeBoothControllers.TradeBoothInventoryController)
local v_u_3 = require(v1.Modules.TradeControllers.TradeWorldController)
require(v1.Modules.ReplicationReciever)
local v_u_4 = require(v1.Modules.GuiController)
local v_u_5 = require(v1.Data.TradeBoothsData)
require(v1.Data.TradeTokenData)
require(v1.Modules.Notification)
require(v1.Modules.Observers)
require(v1.Data.TradeData)
require(v1.Modules.Signal)
require(v1.Modules.Trove)
local v_u_6 = require(v1.Modules.TradeControllers.TradingUserInterfaceController.TradeUIStaticData)
local v_u_7 = require(v1.Modules.GardenGuideModules.DataModules.GGStaticData)
local v_u_8 = require(v1.Modules.TradeTokens.TokenRAPController)
local v_u_9 = require(v1.Modules.ItemRarityFinder)
local v_u_10 = require(v1.Modules.ItemImageFinder)
local v_u_11 = require(v1.Modules.ItemNameFinder)
local v_u_12 = require(v1.Modules.NumberUtil)
require(v1.Modules.ConfirmationPromptController)
local v_u_13 = require(v1.Calculate_Weight)
local v_u_14 = require(v1.Modules.PetServices.PetUtilities)
local v15 = v2.LocalPlayer
local v_u_16 = v15.PlayerGui:WaitForChild("TradeBoothCreateListing")
local v_u_17 = v15.PlayerGui:WaitForChild("TradeBoothInventory")
local v_u_18 = v1.GameEvents.TradeEvents
local v_u_19 = nil
local v_u_20 = nil
local v21 = {}
local v_u_22 = nil
function v21.PromptListItem(_, p_u_23, p24)
	-- upvalues: (copy) v_u_3, (copy) v_u_17, (ref) v_u_22, (copy) v_u_16, (copy) v_u_12, (copy) v_u_5, (copy) v_u_11, (copy) v_u_10, (copy) v_u_8, (copy) v_u_9, (copy) v_u_14, (copy) v_u_13, (ref) v_u_19, (ref) v_u_20, (copy) v_u_7
	if not v_u_3:IsInWorld() then
		return false
	end
	if not p24 then
		return false
	end
	local v25 = v_u_17.Frame.RightSide.RightSideFrame
	local v_u_26 = table.clone(p_u_23)
	v_u_22 = v_u_26
	local v_u_27 = v25.Tokens.TextBox
	local v_u_28 = v25.RAPValue.Amount
	local v_u_29 = v_u_16.Frame.Tokens.Amount
	local v_u_30 = v_u_16.Frame.Receive.Amount
	local v_u_31 = v_u_16.Frame.Item.ITEM_IMAGE
	local v_u_32 = v_u_16.Frame.Item.ITEM_NAME
	local v_u_33 = p_u_23.data.Name or (p_u_23.data.ItemName or p_u_23.data.PetType or (p_u_23.data.SkinID or "Unknown"))
	local function v_u_38(p34)
		-- upvalues: (ref) v_u_22, (copy) v_u_26, (copy) v_u_29, (ref) v_u_12, (copy) v_u_30, (ref) v_u_5, (copy) v_u_32, (ref) v_u_11, (copy) v_u_33, (copy) p_u_23, (copy) v_u_31, (ref) v_u_10, (copy) v_u_27, (copy) v_u_28
		if v_u_22 ~= v_u_26 then
			return nil
		end
		v_u_26.listingPrice = p34
		v_u_29.Text = ("%*"):format((v_u_12.FormatCompactPrice(v_u_26.listingPrice)))
		local v35 = v_u_30
		local v36 = v_u_12.FormatCompactPrice
		local v37 = v_u_5.applyFee(v_u_26.listingPrice)
		v35.Text = ("%*"):format((v36((math.floor(v37)))))
		v_u_32.Text = ("%*"):format((v_u_11(v_u_33, p_u_23.type)))
		v_u_31.Image = v_u_10(v_u_33, p_u_23.type)
		v_u_27.PlaceholderText = v_u_12.FormatCompactPrice(v_u_26.listingPrice)
		v_u_28.Text = ("%*"):format((v_u_12.FormatCompactPrice(v_u_26.listingPrice)))
		v_u_27.Text = ""
		return nil
	end
	local v39 = v_u_8:GetRAP(p_u_23.type, p_u_23.data) or 1
	v_u_38(v39)
	if not v39 then
		task.defer(function()
			-- upvalues: (copy) v_u_38, (ref) v_u_8, (copy) p_u_23
			v_u_38(v_u_8:GetRAPAsync(p_u_23.type, p_u_23.data) or 1)
			return nil
		end)
	end
	local v40 = v25.Receive
	v40.Visible = true
	local v41 = v40.Amount
	local v42 = v_u_12.FormatCompactPrice
	local v43 = v_u_5.applyFee(v_u_26.listingPrice)
	v41.Text = ("%*"):format((v42((math.floor(v43)))))
	v_u_11(v_u_33, p_u_23.type)
	local v44 = v_u_9(v_u_33, p_u_23.type)
	local v45 = nil
	if p_u_23.data.PetType then
		v45 = string.format("%0.2fkg", v_u_14:CalculateWeight(p_u_23.data.PetData.BaseWeight, p_u_23.data.PetData.Level))
	elseif p_u_23.data.ItemName then
		v45 = string.format("%0.2fkg", (v_u_13.Calculate_Weight(p_u_23.data.Seed, p_u_23.data.ItemName) or 0) * (p_u_23.data.WeightMultiplier or 1))
	end
	v25.Desc.Text = ("Weight: %*\nRarity: %*"):format(v45 or "N/A", v44 or "N/A")
	v_u_19 = v_u_26
	v_u_20 = p24
	local v46 = v25.Item
	local v47 = v46.ITEM_IMAGE
	v46.ITEM_NAME.Text = v_u_11(v_u_33, p_u_23.type)
	v47.Image = v_u_10(v_u_33, p_u_23.type)
	v46:SetAttribute("Rarity", v44)
	v_u_16.Frame.Item:SetAttribute("Rarity", v44)
	local v48 = v_u_7.RarityColorMap[v44]
	if v48 then
		local v49 = v_u_7.AnimatedColors[v44]
		if v49 then
			v49(v46)
			v49(v_u_16.Frame.Item)
		else
			v46.BackgroundColor3 = Color3.fromRGB(133, 82, 51):Lerp(v48, 0.75)
			v_u_16.Frame.Item.BackgroundColor3 = Color3.fromRGB(133, 82, 51):Lerp(v48, 0.75)
		end
	else
		v46.BackgroundColor3 = Color3.new(0.3, 0.3, 0.3)
		v_u_16.Frame.Item.BackgroundColor3 = Color3.new(0.3, 0.3, 0.3)
	end
	v25.Visible = true
	return true
end
function v21.Start(_)
	-- upvalues: (copy) v_u_3, (copy) v_u_4, (copy) v_u_16, (ref) v_u_19, (copy) v_u_17, (copy) v_u_6, (copy) v_u_12, (copy) v_u_5, (ref) v_u_20, (copy) v_u_18
	if v_u_3:IsInWorld() then
		v_u_4:UsePopupAnims(v_u_16)
		v_u_4:GetStateForGui(v_u_16).Visible:Listen(function(p50)
			-- upvalues: (ref) v_u_19
			if not p50 then
				if v_u_19 then
					v_u_19 = nil
				end
			end
		end)
		local v_u_51 = v_u_17.Frame.RightSide.RightSideFrame.Tokens.TextBox
		local v_u_52 = v_u_17.Frame.RightSide.RightSideFrame.Receive
		local v_u_53 = v_u_16.Frame.Tokens.Amount
		local v_u_54 = v_u_16.Frame.Receive.Amount
		local function v_u_70()
			-- upvalues: (ref) v_u_19, (ref) v_u_6, (copy) v_u_51, (ref) v_u_12, (copy) v_u_53, (copy) v_u_52, (ref) v_u_5, (copy) v_u_54
			if not v_u_19 then
				return
			end
			local v55 = v_u_6.Suffixes
			local v56 = string.upper(v_u_51.Text)
			if v56 == "" then
				v56 = v_u_51.PlaceholderText
			end
			for v57 = #v55, 1, -1 do
				local v58 = string.match(v56, (("^([%%d%%.,]*)[%*]$"):format(v55[v57]))) or ""
				local v59 = tonumber(v58)
				if v59 then
					local v60 = v59 * 1000 ^ (#v55 - v57 + 1)
					v56 = tostring(v60)
					break
				end
			end
			local v61 = string.gsub(v56, "%D+", "")
			local v62 = tonumber(v61) or 1
			local v63 = math.clamp(v62, 1, 100000000) or 1
			v_u_19.listingPrice = v63
			v_u_51.PlaceholderText = v_u_12.Comma(v63)
			v_u_51.Text = ""
			v_u_53.Text = ("%*"):format((v_u_12.Comma(v63)))
			v_u_52.Visible = true
			local v64 = v_u_52.Amount
			local v65 = v_u_12.Comma
			local v66 = v_u_5.applyFee(v63)
			v64.Text = ("%*"):format((v65((math.floor(v66)))))
			local v67 = v_u_54
			local v68 = v_u_12.Comma
			local v69 = v_u_5.applyFee(v63)
			v67.Text = ("%*"):format((v68((math.floor(v69)))))
		end
		v_u_51.FocusLost:Connect(function()
			-- upvalues: (copy) v_u_70
			v_u_70()
		end)
		v_u_17.Frame.RightSide.RightSideFrame.Sell.Activated:Connect(function()
			-- upvalues: (ref) v_u_19, (ref) v_u_4, (ref) v_u_17, (ref) v_u_16
			if v_u_19 then
				v_u_4:Close(v_u_17)
				v_u_4:Open(v_u_16)
			else
				v_u_4:Close(v_u_17)
				v_u_17.Frame.RightSide.RightSideFrame.Visible = false
			end
		end)
		v_u_16.Frame.Options.Yes.Activated:Connect(function()
			-- upvalues: (ref) v_u_20, (ref) v_u_19, (ref) v_u_4, (ref) v_u_16, (ref) v_u_18
			if v_u_20 then
				v_u_20 = nil
			end
			if v_u_19 then
				if v_u_18.Booths.CreateListing:InvokeServer(v_u_19.type, v_u_19.id, v_u_19.listingPrice) then
					v_u_4:Close(v_u_16)
				end
			else
				v_u_4:Close(v_u_16)
			end
		end)
		v_u_16.Frame.Close.Activated:Connect(function()
			-- upvalues: (ref) v_u_4, (ref) v_u_16, (ref) v_u_19, (ref) v_u_20
			v_u_4:Close(v_u_16)
			v_u_19 = nil
			if v_u_20 then
				v_u_4:Open(v_u_20)
				v_u_20 = nil
			end
		end)
		v_u_16.Frame.Options.No.Activated:Connect(function()
			-- upvalues: (ref) v_u_4, (ref) v_u_16, (ref) v_u_19, (ref) v_u_20
			v_u_4:Close(v_u_16)
			v_u_19 = nil
			if v_u_20 then
				v_u_4:Open(v_u_20)
				v_u_20 = nil
			end
		end)
	end
end
task.spawn(v21.Start, v21)
return v21