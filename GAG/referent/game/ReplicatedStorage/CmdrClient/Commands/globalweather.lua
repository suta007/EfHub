local v1 = {
	["Name"] = "globalweather",
	["Aliases"] = { "gw" },
	["Description"] = "Sends a cross server global weather event to all players in the game.",
	["Group"] = "GameCommands",
	["Args"] = {
		{
			["Type"] = "weather",
			["Name"] = "weather",
			["Description"] = "Weather to send to all server(s)."
		}
	}
}
return v1