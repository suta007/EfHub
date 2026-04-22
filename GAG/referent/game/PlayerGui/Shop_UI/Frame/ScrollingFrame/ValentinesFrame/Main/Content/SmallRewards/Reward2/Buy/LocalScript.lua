local v_u_1 = game:GetService("MarketplaceService")
local v2 = script.Parent
local v_u_3 = game.Players.LocalPlayer
v2.MouseButton1Click:Connect(function()
	-- upvalues: (copy) v_u_1, (copy) v_u_3
	v_u_1:PromptProductPurchase(v_u_3, 3536600169)
end)