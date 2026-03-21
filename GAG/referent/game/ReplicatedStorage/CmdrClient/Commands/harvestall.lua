local v1 = {
	["Name"] = "harvestall",
	["Aliases"] = { "harvestall" },
	["Description"] = "Harvests all plants for specified player(s)",
	["Group"] = "GameCommands",
	["Args"] = {
		{
			["Type"] = "players",
			["Name"] = "to",
			["Description"] = "The player(s) trigger harvest all for."
		}
	}
}
return v1