local v1 = {
	["Name"] = "globalshadowseedstock",
	["Aliases"] = {},
	["Description"] = "Restocks globally the seed for the server",
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
			["Description"] = "The amount to set stock"
		}
	}
}
return v1