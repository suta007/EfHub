local v1 = {
	["Name"] = "setnpcpoints",
	["Aliases"] = { "snp" },
	["Description"] = "Sets specified NPC points to amount for player(s)",
	["Group"] = "GameCommands",
	["Args"] = {
		{
			["Type"] = "players",
			["Name"] = "to",
			["Description"] = "The player(s) to set NPC Points for."
		},
		{
			["Type"] = "npcnametype",
			["Name"] = "for",
			["Description"] = "The NPC to set points for."
		},
		{
			["Type"] = "integer",
			["Name"] = "quantity",
			["Description"] = "The amount to set to.",
			["Optional"] = true
		}
	}
}
return v1