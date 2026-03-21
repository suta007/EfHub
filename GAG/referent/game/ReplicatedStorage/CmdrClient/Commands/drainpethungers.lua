local v1 = {
	["Name"] = "drainpethungers",
	["Aliases"] = { "dph" },
	["Description"] = "Drains all pet hunger bars for the specified player",
	["Group"] = "GameCommands",
	["Args"] = {
		{
			["Type"] = "player",
			["Name"] = "to",
			["Description"] = "The player to drain pets hunger for."
		}
	}
}
return v1