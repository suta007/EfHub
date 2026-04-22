local v1 = {
	["Name"] = "teamevent-leaveteam",
	["Aliases"] = { "te-lvt" },
	["Description"] = "Removes a player from their current team in an event.",
	["Group"] = "GameCommands",
	["Args"] = {
		{
			["Type"] = "player",
			["Name"] = "player",
			["Description"] = "The player to remove from their team."
		},
		{
			["Type"] = "teamEventName",
			["Name"] = "eventName",
			["Description"] = "The event name."
		}
	}
}
return v1