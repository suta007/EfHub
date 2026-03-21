local v1 = {
	["Name"] = "randomfarm",
	["Aliases"] = { "rf" },
	["Description"] = "Spawns in completely random plants (or a specific crop) on the player(s) farm",
	["Group"] = "GameCommands",
	["Args"] = {
		{
			["Type"] = "players",
			["Name"] = "to",
			["Description"] = "The player(s) to spawn plants for."
		},
		{
			["Type"] = "integer",
			["Name"] = "quantity",
			["Description"] = "The amount of plants to add.",
			["Optional"] = true
		},
		{
			["Type"] = "string",
			["Name"] = "crop",
			["Description"] = "Optional: specify a crop type to only spawn that.",
			["Optional"] = true
		}
	}
}
return v1