local v1 = game:GetService("ReplicatedStorage")
return {
	["RefreshTime"] = 300,
	["ShopItems"] = require(v1.Data.SeasonPass.SeasonPassData).ShopItems
}