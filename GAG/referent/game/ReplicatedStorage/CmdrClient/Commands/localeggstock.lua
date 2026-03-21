local v1 = {
	["Name"] = "localeggstock",
	["Aliases"] = {},
	["Description"] = "Restocks locally the egg for the server",
	["Group"] = "GameCommands",
	["Args"] = {
		{
			["Type"] = "peteggshopname",
			["Name"] = "egg(s)",
			["Description"] = "The egg to restock"
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