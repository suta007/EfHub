local v1 = game:GetService("ReplicatedStorage")
local v_u_2 = require(v1.Modules.UseDynamicPrices)
local v_u_3 = require(v1.Modules.MarketController)
return require(v1.Modules.Observers).observeTag("GrowAllPriceText", function(p4)
	-- upvalues: (copy) v_u_2, (copy) v_u_3
	if v_u_2 then
		v_u_3:SetPriceLabel(p4, 3248693418, ":value:R$")
	else
		p4.Text = "375R$"
	end
	return nil
end, { workspace })