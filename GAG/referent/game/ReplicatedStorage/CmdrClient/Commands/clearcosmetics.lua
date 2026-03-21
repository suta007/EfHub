local v1 = {
	["Name"] = "clearcosmetics",
	["Aliases"] = { "cc" },
	["Description"] = "Clear Cosmetics to specified player(s).",
	["Group"] = "GameCommands",
	["Args"] = {
		{
			["Type"] = "players",
			["Name"] = "to",
			["Description"] = "The player(s) to give gear to."
		},
		{
			["Type"] = "boolean",
			["Name"] = "FarmOnly",
			["Description"] = "Optional: delete only cosmetics on farm",
			["Optional"] = true
		},
		{
			["Type"] = "string",
			["Name"] = "cosmetic",
			["Description"] = "Optional: delete only cosmetics of this type.",
			["Optional"] = true
		}
	}
}
return v1