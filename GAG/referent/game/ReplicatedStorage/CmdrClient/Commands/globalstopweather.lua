local v1 = {
	["Name"] = "globalstopweather",
	["Aliases"] = {
		"gsw",
		"globalendweather",
		"globalendevent",
		"globalstopevent"
	},
	["Description"] = "Sends a cross server stop weather event to all servers.",
	["Group"] = "GameCommands",
	["Args"] = {
		{
			["Type"] = "weathers",
			["Name"] = "weather",
			["Description"] = "The weather(s) to stop."
		}
	}
}
return v1