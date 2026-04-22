local v1 = {
	["Name"] = "teamevent-addpoints",
	["Aliases"] = { "te-ap" },
	["Description"] = "Adds points to a player in an event.",
	["Group"] = "GameCommands",
	["Args"] = {
		{
			["Type"] = "player",
			["Name"] = "player",
			["Description"] = "The player to add points to."
		},
		{
			["Type"] = "teamEventName",
			["Name"] = "eventName",
			["Description"] = "The event name."
		},
		{
			["Type"] = "number",
			["Name"] = "amount",
			["Description"] = "The number of points to add."
		}
	}
}
return v1