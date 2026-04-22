local v1 = {
	["Name"] = "teamevent_clearcooldown",
	["Aliases"] = { "te-cc" },
	["Description"] = "Resets a player\'s claim cooldown in an event.",
	["Group"] = "GameCommands",
	["Args"] = {
		{
			["Type"] = "player",
			["Name"] = "player",
			["Description"] = "The player to reset cooldown for."
		},
		{
			["Type"] = "teamEventName",
			["Name"] = "eventName",
			["Description"] = "The event name."
		}
	}
}
return v1