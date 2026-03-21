local v1 = game:GetService("ReplicatedStorage")
require(v1.Data.NPCLevels.NPCLevelData.NPCLevelTypes)
local v2 = require(v1.Data.SeedData)
local v3 = {
	["Broccoli"] = {
		["Seed"] = v2.Broccoli,
		["StockChance"] = 100,
		["StockAmount"] = { 1, 1 },
		["Price"] = 250000000
	},
	["Potato"] = {
		["Seed"] = v2.Potato,
		["StockChance"] = 100,
		["StockAmount"] = { 1, 1 },
		["Price"] = 500000000
	},
	["Brussels Sprout"] = {
		["Seed"] = v2["Brussels Sprout"],
		["StockChance"] = 100,
		["StockAmount"] = { 1, 1 },
		["Price"] = 1000000000
	},
	["Cocomango"] = {
		["Seed"] = v2.Cocomango,
		["StockChance"] = 100,
		["StockAmount"] = { 1, 1 },
		["Price"] = 10000000000
	},
	["Cauliflower"] = {
		["Seed"] = v2.Cauliflower,
		["StockChance"] = 10,
		["StockAmount"] = { 2, 4 },
		["Price"] = 1040
	},
	["Orange Tulip"] = {
		["Seed"] = v2["Orange Tulip"],
		["StockChance"] = 10,
		["StockAmount"] = { 2, 4 },
		["Price"] = 450
	},
	["Rafflesia"] = {
		["Seed"] = v2.Rafflesia,
		["StockChance"] = 15,
		["StockAmount"] = { 1, 3 },
		["Price"] = 2560
	},
	["Green Apple"] = {
		["Seed"] = v2["Green Apple"],
		["StockChance"] = 20,
		["StockAmount"] = { 1, 1 },
		["Price"] = 2800
	},
	["Avocado"] = {
		["Seed"] = v2.Avocado,
		["StockChance"] = 25,
		["StockAmount"] = { 1, 1 },
		["Price"] = 4000
	},
	["Banana"] = {
		["Seed"] = v2.Banana,
		["StockChance"] = 30,
		["StockAmount"] = { 1, 1 },
		["Price"] = 5600
	},
	["Pineapple"] = {
		["Seed"] = v2.Pineapple,
		["StockChance"] = 35,
		["StockAmount"] = { 1, 1 },
		["Price"] = 6000
	},
	["Kiwi"] = {
		["Seed"] = v2.Kiwi,
		["StockChance"] = 40,
		["StockAmount"] = { 1, 1 },
		["Price"] = 8000
	},
	["Bell Pepper"] = {
		["Seed"] = v2["Bell Pepper"],
		["StockChance"] = 50,
		["StockAmount"] = { 1, 1 },
		["Price"] = 44000
	},
	["Prickly Pear"] = {
		["Seed"] = v2["Prickly Pear"],
		["StockChance"] = 60,
		["StockAmount"] = { 1, 1 },
		["Price"] = 444000
	},
	["Loquat"] = {
		["Seed"] = v2.Loquat,
		["StockChance"] = 70,
		["StockAmount"] = { 1, 1 },
		["Price"] = 720000
	},
	["Feijoa"] = {
		["Seed"] = v2.Feijoa,
		["StockChance"] = 80,
		["StockAmount"] = { 1, 1 },
		["Price"] = 2200000
	},
	["Pitcher Plant"] = {
		["Seed"] = v2["Pitcher Plant"],
		["StockChance"] = 90,
		["StockAmount"] = { 1, 1 },
		["Price"] = 6000000
	},
	["Grape"] = {
		["Seed"] = v2.Grape,
		["StockChance"] = 100,
		["StockAmount"] = { 1, 1 },
		["Price"] = 680000
	},
	["Mushroom"] = {
		["Seed"] = v2.Mushroom,
		["StockChance"] = 120,
		["StockAmount"] = { 13, 25 },
		["Price"] = 120000
	},
	["Pepper"] = {
		["Seed"] = v2.Pepper,
		["StockChance"] = 140,
		["StockAmount"] = { 1, 1 },
		["Price"] = 800000
	},
	["Cacao"] = {
		["Seed"] = v2.Cacao,
		["StockChance"] = 160,
		["StockAmount"] = { 1, 1 },
		["Price"] = 2000000
	},
	["Beanstalk"] = {
		["Seed"] = v2.Beanstalk,
		["StockChance"] = 210,
		["StockAmount"] = { 1, 1 },
		["Price"] = 8000000
	},
	["Ember Lily"] = {
		["Seed"] = v2["Ember Lily"],
		["StockChance"] = 240,
		["StockAmount"] = { 1, 1 },
		["Price"] = 12000000
	},
	["Sugar Apple"] = {
		["Seed"] = v2["Sugar Apple"],
		["StockChance"] = 290,
		["StockAmount"] = { 1, 1 },
		["Price"] = 20000000
	},
	["Burning Bud"] = {
		["Seed"] = v2["Burning Bud"],
		["StockChance"] = 340,
		["StockAmount"] = { 1, 1 },
		["Price"] = 32000000
	},
	["Giant Pinecone"] = {
		["Seed"] = v2["Giant Pinecone"],
		["StockChance"] = 380,
		["StockAmount"] = { 1, 1 },
		["Price"] = 44000000
	},
	["Elder Strawberry"] = {
		["Seed"] = v2["Elder Strawberry"],
		["StockChance"] = 405,
		["StockAmount"] = { 1, 1 },
		["Price"] = 56000000
	},
	["Romanesco"] = {
		["Seed"] = v2.Romanesco,
		["StockChance"] = 440,
		["StockAmount"] = { 1, 1 },
		["Price"] = 70400000
	},
	["Crimson Thorn"] = {
		["Seed"] = v2["Crimson Thorn"],
		["StockChance"] = 777,
		["StockAmount"] = { 1, 1 },
		["Price"] = 8000000000
	}
}
return v3