local v1 = {
	["Name"] = "clearpetinventory",
	["Aliases"] = { "cpi" },
	["Description"] = "Clears the specified player(s) pet inventory.",
	["Group"] = "GameCommands",
	["Args"] = {
		{
			["Type"] = "players",
			["Name"] = "to",
			["Description"] = "The player(s) to clear pet inventory."
		}
	}
}
return v1