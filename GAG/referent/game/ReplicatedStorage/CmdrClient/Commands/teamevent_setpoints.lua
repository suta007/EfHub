local v1 = {
	["Name"] = "teamevent-setpoints",
	["Aliases"] = { "te-sp" },
	["Description"] = "Sets a player\'s points to an exact value in an event.",
	["Group"] = "GameCommands",
	["Args"] = {
		{
			["Type"] = "player",
			["Name"] = "player",
			["Description"] = "The player to set points for."
		},
		{
			["Type"] = "teamEventName",
			["Name"] = "eventName",
			["Description"] = "The event name."
		},
		{
			["Type"] = "number",
			["Name"] = "points",
			["Description"] = "The exact point value to set."
		}
	}
}
return v1