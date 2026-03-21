local v1 = game:GetService("Players")
local v2 = game:GetService("ReplicatedStorage")
local v_u_3 = require("../DataService")
local v_u_4 = require("../GuiController")
local v_u_5 = require("../../Comma_Module")
require("../GiftController")
local v_u_6 = require("../MarketController")
local v_u_7 = require("../UseDynamicPrices")
local v_u_8 = require(v2.Data.CarrotCoinData)
local v_u_9 = v1.LocalPlayer.PlayerGui.BuyCarrotsUI
local v_u_18 = {
	["Start"] = function(_)
		-- upvalues: (copy) v_u_4, (copy) v_u_9, (copy) v_u_18, (copy) v_u_3
		local v10 = v_u_4:GetStateForGui(v_u_9)
		v_u_4:UsePopupAnims(v_u_9)
		v10.Visible:Observe(function(_)
			-- upvalues: (ref) v_u_18
			v_u_18:Update()
		end)
		v_u_9.Shadow.Frame.Header.CloseButton.Activated:Connect(function()
			-- upvalues: (ref) v_u_4, (ref) v_u_9
			v_u_4:Close(v_u_9)
		end)
		v_u_18:_initProducts()
		v_u_3:GetPathSignal("SpecialCurrency/CarrotCoins"):Connect(function()
			-- upvalues: (ref) v_u_18
			v_u_18:Update()
		end)
	end,
	["_initProducts"] = function(_)
		-- upvalues: (copy) v_u_8, (copy) v_u_9, (copy) v_u_7, (copy) v_u_6, (copy) v_u_5
		for v11, v12 in v_u_8.Shop do
			local v13 = v_u_9.Shadow.Frame:FindFirstChild(v11)
			if v13 then
				for v14, v_u_15 in v12 do
					local v16 = v13:FindFirstChild("Package" .. v14)
					if v16 then
						if v_u_7 or v_u_15.FallbackPrice == nil then
							if not v_u_7 then
								warn((("%* is using Dynamic Pricing because there is no Fallback Price set"):format((v16:GetFullName()))))
							end
							v_u_6:SetPriceLabel(v16.Buy.Label, v_u_15.ProductId)
						else
							v16.Buy.Label.Text = "\238\128\130" .. v_u_5.Comma(v_u_15.FallbackPrice)
						end
						v16.Buy.Activated:Connect(function()
							-- upvalues: (ref) v_u_6, (copy) v_u_15
							v_u_6:PromptPurchaseRobux(v_u_15.ProductId, Enum.InfoType.Product)
						end)
					end
				end
			end
		end
	end,
	["Update"] = function(_)
		-- upvalues: (copy) v_u_3, (copy) v_u_9, (copy) v_u_5
		local v17 = v_u_3:GetData()
		v_u_9.Shadow.Frame.Header.CoinCounter.Label.Text = "Coins: " .. v_u_5.Comma(v17.SpecialCurrency.CarrotCoins)
	end
}
task.spawn(v_u_18.Start, v_u_18)
return v_u_18