local v1 = game:GetService("Players")
local v2 = game:GetService("ReplicatedStorage")
local v_u_3 = require("../DataService")
local v_u_4 = require("../GuiController")
local v_u_5 = require("../../Comma_Module")
local v_u_6 = require("../GiftController")
local v_u_7 = require("../MarketController")
local v_u_8 = require("../UseDynamicPrices")
local v_u_9 = require(v2.Data.TradeTokenData)
local v_u_10 = v1.LocalPlayer.PlayerGui.BuyTokens
local v_u_19 = {
	["Start"] = function(_)
		-- upvalues: (copy) v_u_4, (copy) v_u_10, (copy) v_u_19, (copy) v_u_3
		local v11 = v_u_4:GetStateForGui(v_u_10)
		v_u_4:UsePopupAnims(v_u_10)
		v11.Visible:Observe(function(_)
			-- upvalues: (ref) v_u_19
			v_u_19:Update()
		end)
		v_u_10.Frame.Close.Activated:Connect(function()
			-- upvalues: (ref) v_u_4, (ref) v_u_10
			v_u_4:Close(v_u_10)
		end)
		v_u_19:_initTokenProducts()
		v_u_3:GetPathSignal("TradeData/Tokens"):Connect(function()
			-- upvalues: (ref) v_u_19
			v_u_19:Update()
		end)
	end,
	["_initTokenProducts"] = function(_)
		-- upvalues: (copy) v_u_9, (copy) v_u_10, (copy) v_u_8, (copy) v_u_7, (copy) v_u_5, (copy) v_u_6
		for v12, v13 in v_u_9.Shop.Tokens do
			local v14 = v_u_10.Frame:FindFirstChild(v12)
			if v14 then
				for v15, v_u_16 in v13 do
					local v17 = v14:FindFirstChild("Amt" .. v15)
					if v17 then
						if v_u_8 or v_u_16.FallbackPrice == nil then
							if not v_u_8 then
								warn((("%* is using Dynamic Pricing because there is no Fallback Price set"):format((v17:GetFullName()))))
							end
							v_u_7:SetPriceLabel(v17.Buy.Label, v_u_16.ProductId)
						else
							v17.Buy.Label.Text = "\238\128\130" .. v_u_5.Comma(v_u_16.FallbackPrice)
						end
						v17.Buy.Activated:Connect(function()
							-- upvalues: (ref) v_u_7, (copy) v_u_16
							v_u_7:PromptPurchaseRobux(v_u_16.ProductId, Enum.InfoType.Product)
						end)
						if v_u_16.GiftId then
							v17.Gift.Activated:Connect(function()
								-- upvalues: (ref) v_u_6, (copy) v_u_16
								v_u_6:PromptGiftFromGiftId(v_u_16.GiftId)
							end)
						end
					end
				end
			end
		end
	end,
	["Update"] = function(_)
		-- upvalues: (copy) v_u_3, (copy) v_u_10, (copy) v_u_5
		local v18 = v_u_3:GetData()
		v_u_10.Frame.Label.Text = "Tokens: " .. v_u_5.Comma(v18.TradeData.Tokens)
	end
}
task.spawn(v_u_19.Start, v_u_19)
return v_u_19