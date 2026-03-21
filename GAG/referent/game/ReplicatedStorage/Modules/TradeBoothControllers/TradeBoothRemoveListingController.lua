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
require(v1.Modules.NumberUtil)
local v_u_9 = v2.LocalPlayer.PlayerGui:WaitForChild("TradeBoothRemoveListing")
local v_u_10 = v1.GameEvents.TradeEvents
local v_u_11 = nil
local v_u_12 = nil
local v23 = {
	["PromptRemoveListing"] = function(_, p13, p14)
		-- upvalues: (copy) v_u_3, (ref) v_u_11, (ref) v_u_12, (copy) v_u_9, (copy) v_u_8, (copy) v_u_7, (copy) v_u_6, (copy) v_u_5, (copy) v_u_4
		if not v_u_3:IsInWorld() then
			return false
		end
		if v_u_11 then
			return false
		end
		v_u_11 = table.clone(p13)
		v_u_12 = p14
		local v15 = p13.data.Name or (p13.data.ItemName or p13.data.PetType or (p13.data.SkinID or "Unknown"))
		local v16 = v_u_9.Frame.HoverableItem
		local v17 = v16.ITEM_IMAGE
		local v18 = v_u_8(v15, p13.type)
		v_u_9.Frame.ItemName.Text = v18
		v17.Image = v_u_7(v15, p13.type)
		local v19 = v_u_6(v15, p13.type)
		v16:SetAttribute("Rarity", v19)
		local v20 = v_u_5.RarityColorMap[v19]
		if v20 then
			local v21 = v_u_5.AnimatedColors[v19]
			if v21 then
				v21(v16)
			else
				v16.BackgroundColor3 = Color3.fromRGB(133, 82, 51):Lerp(v20, 0.75)
			end
		else
			v16.BackgroundColor3 = Color3.new(0.3, 0.3, 0.3)
		end
		v17:SetAttribute("UUID", p13.id)
		v17:AddTag("TradingUserInterfaceTargetable")
		v_u_4:Open(v_u_9)
		return true
	end,
	["Start"] = function(_)
		-- upvalues: (copy) v_u_3, (copy) v_u_4, (copy) v_u_9, (ref) v_u_11, (ref) v_u_12, (copy) v_u_10
		if v_u_3:IsInWorld() then
			v_u_4:UsePopupAnims(v_u_9)
			v_u_4:GetStateForGui(v_u_9).Visible:Listen(function(p22)
				-- upvalues: (ref) v_u_11
				if not p22 then
					if v_u_11 then
						v_u_11 = nil
					end
				end
			end)
			v_u_9.Frame.Confirm.Activated:Connect(function()
				-- upvalues: (ref) v_u_12, (ref) v_u_11, (ref) v_u_4, (ref) v_u_9, (ref) v_u_10
				if v_u_12 then
					v_u_12 = nil
				end
				if v_u_11 then
					if v_u_10.Booths.RemoveListing:InvokeServer(v_u_11.listingUUID) then
						v_u_4:Close(v_u_9)
					end
				else
					v_u_4:Close(v_u_9)
				end
			end)
			v_u_9.Frame.ExitButton.Activated:Connect(function()
				-- upvalues: (ref) v_u_4, (ref) v_u_9, (ref) v_u_11, (ref) v_u_12
				v_u_4:Close(v_u_9)
				v_u_11 = nil
				if v_u_12 then
					v_u_4:Open(v_u_12)
					v_u_12 = nil
				end
			end)
			v_u_9.Frame.Cancel.Activated:Connect(function()
				-- upvalues: (ref) v_u_4, (ref) v_u_9, (ref) v_u_11, (ref) v_u_12
				v_u_4:Close(v_u_9)
				v_u_11 = nil
				if v_u_12 then
					v_u_4:Open(v_u_12)
					v_u_12 = nil
				end
			end)
		end
	end
}
task.spawn(v23.Start, v23)
return v23