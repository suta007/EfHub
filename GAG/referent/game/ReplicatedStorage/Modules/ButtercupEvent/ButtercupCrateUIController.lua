local v1 = game:GetService("Players")
local v2 = game:GetService("ReplicatedStorage")
local v_u_3 = require("../DataService")
local v_u_4 = require("../GuiController")
require("../../Comma_Module")
require("../MarketController")
require("../UseDynamicPrices")
local v_u_5 = require(v2.Modules.Notification)
local v_u_6 = v1.LocalPlayer.PlayerGui.BuyButtercupCrate
local v7 = {}
local v_u_8 = v2.GameEvents.ButtercupEvent.BuyCrate
function v7.Start(_)
	-- upvalues: (copy) v_u_4, (copy) v_u_6, (copy) v_u_3, (copy) v_u_5, (copy) v_u_8
	v_u_4:GetStateForGui(v_u_6)
	v_u_4:UsePopupAnims(v_u_6)
	v_u_6:WaitForChild("Shadow"):WaitForChild("Products"):WaitForChild("CloseButton").Activated:Connect(function()
		-- upvalues: (ref) v_u_4, (ref) v_u_6
		v_u_4:Close(v_u_6)
	end)
	v_u_6.Shadow.Products.ButtercupCrate.Buy.Activated:Connect(function()
		-- upvalues: (ref) v_u_3, (ref) v_u_5, (ref) v_u_8
		if v_u_3:GetData().SpecialCurrency.ButtercupCoins < 3 then
			return v_u_5:CreateNotification("Not enough buttercup coins!")
		end
		v_u_8:FireServer()
	end)
end
task.spawn(v7.Start, v7)
return v7