local v1 = {
	["Name"] = "teamevent-createteam",
	["Aliases"] = { "te-ct" },
	["Description"] = "Creates a new team for a player in an event.",
	["Group"] = "GameCommands",
	["Args"] = {
		{
			["Type"] = "player",
			["Name"] = "player",
			["Description"] = "The player to create the team for."
		},
		{
			["Type"] = "teamEventName",
			["Name"] = "eventName",
			["Description"] = "The event name to create the team in."
		}
	}
}
return v1