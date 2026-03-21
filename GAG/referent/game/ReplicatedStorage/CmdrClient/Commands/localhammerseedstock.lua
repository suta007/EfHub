local v1 = {
	["Name"] = "localhammerseedstock",
	["Aliases"] = {},
	["Description"] = "Restocks locally the seed for the server",
	["Group"] = "GameCommands",
	["Args"] = {
		{
			["Type"] = "seedshopseedname",
			["Name"] = "seedname(s)",
			["Description"] = "The seed to restock"
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