local v1 = {
	["Name"] = "givecrate",
	["Aliases"] = { "gc" },
	["Description"] = "Gives crate to specified player(s) with a specified amount.",
	["Group"] = "GameCommands",
	["Args"] = {
		{
			["Type"] = "players",
			["Name"] = "to",
			["Description"] = "The player(s) to give crates to."
		},
		{
			["Type"] = "cratetype",
			["Name"] = "cratetype(s)",
			["Description"] = "The name of the crate to give."
		},
		{
			["Type"] = "integer",
			["Name"] = "quantity",
			["Description"] = "The amount given.",
			["Optional"] = true
		}
	}
}
return v1