local v1 = {
	["Name"] = "teamevent-listteams",
	["Aliases"] = { "te-lt" },
	["Description"] = "Lists all current teams for a given event.",
	["Group"] = "GameCommands",
	["Args"] = {
		{
			["Type"] = "teamEventName",
			["Name"] = "eventName",
			["Description"] = "The event name to list teams for."
		}
	}
}
return v1