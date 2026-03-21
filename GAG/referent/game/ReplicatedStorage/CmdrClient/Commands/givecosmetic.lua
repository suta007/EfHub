local v1 = {
	["Name"] = "givecosmetic",
	["Aliases"] = { "gc" },
	["Description"] = "Gives cosmetic to specified player(s).",
	["Group"] = "GameCommands",
	["Args"] = {
		{
			["Type"] = "players",
			["Name"] = "to",
			["Description"] = "The player(s) to give gear to."
		},
		{
			["Type"] = "cosmeticname",
			["Name"] = "cosmeticname",
			["Description"] = "The gear to give."
		},
		{
			["Type"] = "number",
			["Name"] = "Quantity",
			["Optional"] = true,
			["Description"] = "Quantity"
		}
	}
}
return v1