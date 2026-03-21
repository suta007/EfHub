local v1 = {
	["Name"] = "refreshseasonpass",
	["Aliases"] = { "rebp" },
	["Description"] = "Refreshes the SeasonPass track for a specified player(s).",
	["Group"] = "GameCommands",
	["Args"] = {
		{
			["Type"] = "players",
			["Name"] = "to",
			["Description"] = "The player(s) to refresh the SeasonPass track for."
		}
	}
}
return v1