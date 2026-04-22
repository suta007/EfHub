local v1 = {
	["Name"] = "resetburntplants",
	["Aliases"] = { "rbp" },
	["Description"] = "Resets the specified player(s) BurntPlants count to 0.",
	["Group"] = "GameCommands",
	["Args"] = {
		{
			["Type"] = "players",
			["Name"] = "to",
			["Description"] = "The player(s) to reset burnt plants for."
		}
	}
}
return v1