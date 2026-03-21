local v1 = game:GetService("ReplicatedStorage")
local v2 = require(v1.Data.CosmeticItemShopData)
local v3 = require(v1.Data.CosmeticCrateShopData)
require(v1.Modules.UITabHelperModule)
require(v1.Modules.Chalk)
local v4 = {}
local v5 = {
	["Cosmetics"] = {
		["Crates"] = v3,
		["Items"] = v2
	}
}
local v6 = {
	["Crates"] = {}
}
local v7 = {
	["Garden Lanterns"] = {
		["CosmeticName"] = "Garden Lanterns",
		["StockAmount"] = { 1, 1 },
		["Price"] = 6000000,
		["PurchaseID"] = 3420511116,
		["FallbackPrice"] = 119
	},
	["Glass Bookshelf"] = {
		["CosmeticName"] = "Glass Bookshelf",
		["StockAmount"] = { 1, 1 },
		["Price"] = 15000000,
		["PurchaseID"] = 3420491492,
		["FallbackPrice"] = 189
	},
	["Glass Staircase"] = {
		["CosmeticName"] = "Glass Staircase",
		["StockAmount"] = { 1, 1 },
		["Price"] = 15000000,
		["PurchaseID"] = 3420489054,
		["FallbackPrice"] = 189
	},
	["Glass Table"] = {
		["CosmeticName"] = "Glass Table",
		["StockAmount"] = { 1, 1 },
		["Price"] = 2000000,
		["PurchaseID"] = 3420488284,
		["FallbackPrice"] = 119
	},
	["Party Lights"] = {
		["CosmeticName"] = "Party Lights",
		["StockAmount"] = { 1, 1 },
		["Price"] = 10000000,
		["PurchaseID"] = 3420511513,
		["FallbackPrice"] = 119
	},
	["Round Lantern"] = {
		["CosmeticName"] = "Round Lantern",
		["StockAmount"] = { 1, 1 },
		["Price"] = 2000000,
		["PurchaseID"] = 3420487839,
		["FallbackPrice"] = 119
	},
	["Street Lantern"] = {
		["CosmeticName"] = "Street Lantern",
		["StockAmount"] = { 1, 1 },
		["Price"] = 2000000,
		["PurchaseID"] = 3420511919,
		["FallbackPrice"] = 119
	},
	["Woody Sign"] = {
		["CosmeticName"] = "Woody Sign",
		["StockAmount"] = { 1, 1 },
		["Price"] = 50000,
		["PurchaseID"] = 0,
		["FallbackPrice"] = 9999
	},
	["Stalky Sign"] = {
		["CosmeticName"] = "Stalky Sign",
		["StockAmount"] = { 1, 1 },
		["Price"] = 50000,
		["PurchaseID"] = 0,
		["FallbackPrice"] = 9999
	},
	["Spicy Sign"] = {
		["CosmeticName"] = "Spicy Sign",
		["StockAmount"] = { 1, 1 },
		["Price"] = 50000,
		["PurchaseID"] = 0,
		["FallbackPrice"] = 9999
	},
	["Sweet Sign"] = {
		["CosmeticName"] = "Sweet Sign",
		["StockAmount"] = { 1, 1 },
		["Price"] = 50000,
		["PurchaseID"] = 0,
		["FallbackPrice"] = 9999
	},
	["Tropical Sign"] = {
		["CosmeticName"] = "Tropical Sign",
		["StockAmount"] = { 1, 1 },
		["Price"] = 50000,
		["PurchaseID"] = 0,
		["FallbackPrice"] = 9999
	},
	["Vegetable Sign"] = {
		["CosmeticName"] = "Vegetable Sign",
		["StockAmount"] = { 1, 1 },
		["Price"] = 50000,
		["PurchaseID"] = 0,
		["FallbackPrice"] = 9999
	},
	["Prickly Sign"] = {
		["CosmeticName"] = "Prickly Sign",
		["StockAmount"] = { 1, 1 },
		["Price"] = 50000,
		["PurchaseID"] = 0,
		["FallbackPrice"] = 9999
	},
	["Berry Sign"] = {
		["CosmeticName"] = "Berry Sign",
		["StockAmount"] = { 1, 1 },
		["Price"] = 50000,
		["PurchaseID"] = 0,
		["FallbackPrice"] = 9999
	},
	["Flower Sign"] = {
		["CosmeticName"] = "Flower Sign",
		["StockAmount"] = { 1, 1 },
		["Price"] = 50000,
		["PurchaseID"] = 0,
		["FallbackPrice"] = 9999
	},
	["Fruit Sign"] = {
		["CosmeticName"] = "Fruit Sign",
		["StockAmount"] = { 1, 1 },
		["Price"] = 50000,
		["PurchaseID"] = 0,
		["FallbackPrice"] = 9999
	},
	["Leafy Sign"] = {
		["CosmeticName"] = "Leafy Sign",
		["StockAmount"] = { 1, 1 },
		["Price"] = 50000,
		["PurchaseID"] = 0,
		["FallbackPrice"] = 9999
	}
}
v6.Items = v7
local v8 = {
	["ANCIENTOAK"] = {
		["FenceName"] = "ANCIENTOAK",
		["Price"] = 20000000000000,
		["PurchaseID"] = 0,
		["FallbackPrice"] = 9999,
		["ShecklesPurchaseOnly"] = true
	},
	["FLOWER"] = {
		["FenceName"] = "FLOWER",
		["Price"] = 20000000000000,
		["PurchaseID"] = 0,
		["FallbackPrice"] = 9999,
		["ShecklesPurchaseOnly"] = true
	},
	["LIGHT"] = {
		["FenceName"] = "LIGHT",
		["Price"] = 20000000000000,
		["PurchaseID"] = 0,
		["FallbackPrice"] = 9999,
		["ShecklesPurchaseOnly"] = true
	},
	["BAMBOO"] = {
		["FenceName"] = "BAMBOO",
		["Price"] = 20000000000000,
		["PurchaseID"] = 0,
		["FallbackPrice"] = 9999,
		["ShecklesPurchaseOnly"] = true
	},
	["CHRISTMAS"] = {
		["FenceName"] = "CHRISTMAS",
		["Price"] = 20000000000000,
		["PurchaseID"] = 0,
		["FallbackPrice"] = 9999,
		["ShecklesPurchaseOnly"] = true
	},
	["STAR"] = {
		["FenceName"] = "STAR",
		["Price"] = 20000000000000,
		["PurchaseID"] = 0,
		["FallbackPrice"] = 9999,
		["ShecklesPurchaseOnly"] = true
	},
	["ICE"] = {
		["FenceName"] = "ICE",
		["Price"] = 20000000000000,
		["PurchaseID"] = 0,
		["FallbackPrice"] = 9999,
		["ShecklesPurchaseOnly"] = true
	},
	["VINE"] = {
		["FenceName"] = "VINE",
		["Price"] = 20000000000000,
		["PurchaseID"] = 0,
		["FallbackPrice"] = 9999,
		["ShecklesPurchaseOnly"] = true
	},
	["DARKLANTERN"] = {
		["FenceName"] = "DARKLANTERN",
		["Price"] = 20000000000000,
		["PurchaseID"] = 0,
		["FallbackPrice"] = 9999,
		["ShecklesPurchaseOnly"] = true
	},
	["FAIRYLIGHT"] = {
		["FenceName"] = "FAIRYLIGHT",
		["Price"] = 20000000000000,
		["PurchaseID"] = 0,
		["FallbackPrice"] = 9999,
		["ShecklesPurchaseOnly"] = true
	}
}
v6.Fences = v8
v5.Fences = v6
v4.Tabs = v5
v4.TabTable = {}
for v9, _ in v4.Tabs do
	local v10 = v4.TabTable
	table.insert(v10, {
		["Name"] = v9,
		["IsLocked"] = false
	})
end
return v4