local v1 = {
	["Name"] = "teamevent-jointeam",
	["Aliases"] = { "te-jt" },
	["Description"] = "Joins a player to an existing team in an event.",
	["Group"] = "GameCommands",
	["Args"] = {
		{
			["Type"] = "player",
			["Name"] = "player",
			["Description"] = "The player to join the team."
		},
		{
			["Type"] = "teamEventName",
			["Name"] = "eventName",
			["Description"] = "The event name."
		},
		{
			["Type"] = "string",
			["Name"] = "teamId",
			["Description"] = "The team ID to join."
		}
	}
}
return v1