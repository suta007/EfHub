local v1 = {
	["Name"] = "teamevent-resetpoints",
	["Aliases"] = { "te-rp" },
	["Description"] = "Resets a player\'s points and claimed tiers in an event.",
	["Group"] = "GameCommands",
	["Args"] = {
		{
			["Type"] = "player",
			["Name"] = "player",
			["Description"] = "The player to reset points for."
		},
		{
			["Type"] = "teamEventName",
			["Name"] = "eventName",
			["Description"] = "The event name."
		}
	}
}
return v1