local v_u_1 = game:GetService("MarketplaceService")
local v2 = require(game.ReplicatedStorage.UserGenerated.Concurrency.Cache)
local v_u_3 = require(game.ReplicatedStorage.UserGenerated.Lang.Asserts)
local v4 = v_u_3.TablePermissive({
	["PurchaseId"] = v_u_3.String,
	["PlayerId"] = v_u_3.Integer,
	["ProductId"] = v_u_3.Integer,
	["PlaceIdWherePurchased"] = v_u_3.Integer,
	["CurrencySpent"] = v_u_3.IntegerNonNegative,
	["CurrencyType"] = v_u_3.AnyOf(v_u_3.Enum(Enum.CurrencyType), v_u_3.String),
	["ProductPurchaseChannel"] = v_u_3.Enum(Enum.ProductPurchaseChannel)
})
local v_u_5 = v_u_3.Table({
	["AssetId"] = v_u_3.Integer,
	["InfoType"] = v_u_3.Enum(Enum.InfoType)
})
local v_u_8 = v2.new({
	["Callback"] = function(p6)
		-- upvalues: (copy) v_u_1
		return v_u_1:GetProductInfo(p6.AssetId, p6.InfoType)
	end,
	["AssertKey"] = function(p7)
		-- upvalues: (copy) v_u_5
		v_u_5(p7)
		return ("%*,%*"):format(p7.AssetId, p7.InfoType.Value)
	end
})
return table.freeze({
	["AssertReceiptInfo"] = v4,
	["GetInfoAsync"] = function(p9, p10, p11)
		-- upvalues: (copy) v_u_3, (copy) v_u_8
		v_u_3.Integer(p9)
		v_u_3.Enum(Enum.InfoType)(p10)
		v_u_3.Optional(v_u_3.Boolean)(p11)
		local v12 = {
			["AssetId"] = p9,
			["InfoType"] = p10
		}
		if p11 then
			return v_u_8:Get(v12)
		else
			return v_u_8:GetAsync(v12)
		end
	end
})