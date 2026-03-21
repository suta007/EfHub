local v1 = {
	["Name"] = "localgearstock",
	["Aliases"] = {},
	["Description"] = "Restocks locally the gear for the server",
	["Group"] = "GameCommands",
	["Args"] = {
		{
			["Type"] = "gearshopgearname",
			["Name"] = "gearname(s)",
			["Description"] = "The gears to restock"
		},
		{
			["Type"] = "integer",
			["Name"] = "quantity",
			["Description"] = "The amount to set stock",
			["Optional"] = true
		}
	}
}
return v1