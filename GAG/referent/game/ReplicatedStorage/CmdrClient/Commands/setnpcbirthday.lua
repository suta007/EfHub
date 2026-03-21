local v1 = {
	["Name"] = "setnpcbirthday",
	["Aliases"] = { "npcbday" },
	["Description"] = "Sets the given NPC\'s birthday to the given date",
	["Group"] = "GameCommands",
	["Args"] = {
		{
			["Type"] = "npcnametype",
			["Name"] = "npcName",
			["Description"] = "The NPC to set"
		},
		{
			["Type"] = "integer",
			["Name"] = "day",
			["Description"] = "The day of the month the NPC\'s birthday is on",
			["Optional"] = true
		},
		{
			["Type"] = "integer",
			["Name"] = "month",
			["Description"] = "The month the NPC\'s birthday is in",
			["Optional"] = true
		}
	}
}
return v1