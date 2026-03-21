local v1 = {}
local v2 = {
	["Icon"] = "rbxassetid://77599265819344",
	["Default"] = 75,
	["Text"] = "Placement Slots",
	["LayoutOrder"] = 1,
	["UpgradeData"] = {
		["Cost"] = 1000000000,
		["Increment"] = 5,
		["MaxUpgrade"] = 20,
		["Scale"] = 2,
		["FallbackPrice"] = 399,
		["Enabled"] = true,
		["ProductId"] = 3295618467
	}
}
v1.MaxEquippedCosmetics = v2
local v3 = {
	["Icon"] = "rbxassetid://77599265819344",
	["Default"] = 275,
	["Text"] = "Inventory Slots",
	["LayoutOrder"] = 2,
	["UpgradeData"] = {
		["Cost"] = 1000000000,
		["Increment"] = 5,
		["MaxUpgrade"] = 40,
		["Scale"] = 2,
		["FallbackPrice"] = 399,
		["Enabled"] = true,
		["ProductId"] = 3295618581
	}
}
v1.MaxCosmeticsInInventory = v3
local v4 = {
	["Icon"] = "rbxassetid://77599265819344",
	["Default"] = 60,
	["Text"] = "Crate Slots",
	["LayoutOrder"] = 3,
	["UpgradeData"] = {
		["Cost"] = 1000000000,
		["Increment"] = 5,
		["MaxUpgrade"] = 60,
		["Scale"] = 2,
		["FallbackPrice"] = 399,
		["Enabled"] = false,
		["ProductId"] = 3295618615
	}
}
v1.MaxCratesInFarm = v4
return v1