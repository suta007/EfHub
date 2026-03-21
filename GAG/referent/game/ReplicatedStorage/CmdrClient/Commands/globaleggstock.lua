local v1 = {
	["Name"] = "globaleggstock",
	["Aliases"] = {},
	["Description"] = "Restocks globally an specific egg",
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