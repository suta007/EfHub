local v1 = {
	["Name"] = "globalrsvp",
	["Aliases"] = {},
	["Description"] = "Sends a RSVP Prompt to all servers",
	["Group"] = "GameCommands",
	["Args"] = {
		{
			["Type"] = "string",
			["Name"] = "eventId",
			["Description"] = "Id of the event"
		},
		{
			["Type"] = "string",
			["Name"] = "platform",
			["Description"] = "Target platforms to show RSVP example: pc/mobile/console or just pc/console. Defaults to pc/console",
			["Optional"] = true
		}
	}
}
return v1