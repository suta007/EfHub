local v1 = game:GetService("ReplicatedStorage")
local v2 = game:GetService("Players")
require(v1.Data.EnumRegistry.ReversedItemTypeEnums)
require(v1.Data.EnumRegistry.InventoryServiceEnums)
local v_u_3 = require(v1.Modules.TradeControllers.TradeWorldController)
require(v1.Modules.ReplicationReciever)
require(v1.Data.TradeBoothsData)
local v_u_4 = require(v1.Modules.GuiController)
require(v1.Modules.Notification)
require(v1.Modules.Observers)
require(v1.Data.TradeData)
require(v1.Modules.Signal)
require(v1.Modules.Trove)
require(v1.Modules.TradeControllers.TradingUserInterfaceController.TradeUIStaticData)
local v_u_5 = require(v1.Modules.GardenGuideModules.DataModules.GGStaticData)
require(v1.Modules.TradeTokens.TokenRAPController)
local v_u_6 = require(v1.Modules.ItemRarityFinder)
local v_u_7 = require(v1.Modules.ItemImageFinder)
local v_u_8 = require(v1.Modules.ItemNameFinder)
local v_u_9 = require(v1.Modules.NumberUtil)
local v_u_10 = v2.LocalPlayer.PlayerGui:WaitForChild("TradeBoothBuyItem")
local v_u_11 = v1.GameEvents.TradeEvents
local v_u_12 = nil
local v_u_13 = nil
local v31 = {
	["PromptBuyListing"] = function(_, p14, p15)
		-- upvalues: (copy) v_u_3, (ref) v_u_12, (ref) v_u_13, (copy) v_u_10, (copy) v_u_7, (copy) v_u_8, (copy) v_u_6, (copy) v_u_5, (copy) v_u_9, (copy) v_u_4
		if not v_u_3:IsInWorld() then
			return false
		end
		if v_u_12 then
			return false
		end
		local v16 = table.clone(p14)
		v_u_12 = v16
		v_u_13 = p15
		local v17 = p14.data.Name or (p14.data.ItemName or p14.data.PetType or (p14.data.SkinID or "Unknown"))
		local v18 = v_u_10.Frame.Item
		local v19 = v18.ITEM_IMAGE
		local v20 = v18.ITEM_NAME
		local v21 = v_u_10.Frame.Description
		v19.Image = v_u_7(v17, p14.type)
		v20.Text = v_u_8(v17, p14.type)
		v21.Text = ("Are you sure you want to buy this item from @%*?"):format(v16.listingOwner and v16.listingOwner.Name or "???")
		local v22 = v_u_6(v17, p14.type)
		local v23 = v_u_5.RarityColorMap[v22]
		if v23 then
			local v24 = v_u_5.AnimatedColors[v22]
			if v24 then
				v24(v18)
			else
				v18.BackgroundColor3 = Color3.fromRGB(133, 82, 51):Lerp(v23, 0.75)
			end
		else
			v18.BackgroundColor3 = Color3.new(0.3, 0.3, 0.3)
		end
		v19:SetAttribute("UUID", p14.id)
		v19:AddTag("TradingUserInterfaceTargetable")
		local v25 = v_u_10.Frame.Price.Amount
		if p14.listingPrice then
			v25.Text = v_u_9.Comma(p14.listingPrice)
		else
			v25.Text = "???"
		end
		v_u_4:Open(v_u_10)
		return true
	end,
	["Start"] = function(_)
		-- upvalues: (copy) v_u_3, (copy) v_u_4, (copy) v_u_10, (ref) v_u_12, (ref) v_u_13, (copy) v_u_11
		if v_u_3:IsInWorld() then
			v_u_4:UsePopupAnims(v_u_10)
			v_u_4:GetStateForGui(v_u_10).Visible:Listen(function(p26)
				-- upvalues: (ref) v_u_12
				if not p26 then
					if v_u_12 then
						v_u_12 = nil
					end
				end
			end)
			v_u_10.Frame.Options.Yes.Activated:Connect(function()
				-- upvalues: (ref) v_u_13, (ref) v_u_12, (ref) v_u_4, (ref) v_u_10, (ref) v_u_11
				if v_u_13 then
					v_u_13 = nil
				end
				if v_u_12 then
					local v27 = v_u_12.listingOwner
					local v28 = v_u_12.listingUUID
					v_u_4:Close(v_u_10)
					local v29, v30 = v_u_11.Booths.BuyListing:InvokeServer(v27, v28)
					if not v29 then
						warn(v29, v30)
					end
				else
					v_u_4:Close(v_u_10)
				end
			end)
			v_u_10.Frame.Close.Activated:Connect(function()
				-- upvalues: (ref) v_u_4, (ref) v_u_10, (ref) v_u_12, (ref) v_u_13
				v_u_4:Close(v_u_10)
				v_u_12 = nil
				if v_u_13 then
					v_u_4:Open(v_u_13)
					v_u_13 = nil
				end
			end)
			v_u_10.Frame.Options.No.Activated:Connect(function()
				-- upvalues: (ref) v_u_4, (ref) v_u_10, (ref) v_u_12, (ref) v_u_13
				v_u_4:Close(v_u_10)
				v_u_12 = nil
				if v_u_13 then
					v_u_4:Open(v_u_13)
					v_u_13 = nil
				end
			end)
		end
	end
}
task.spawn(v31.Start, v31)
return v31