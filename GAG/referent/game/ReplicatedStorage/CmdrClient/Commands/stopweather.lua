local v1 = {
	["Name"] = "stopweather",
	["Aliases"] = {
		"sw",
		"endweather",
		"endevent",
		"stopevent"
	},
	["Description"] = "Stops a specific weather event, or all if none specified.",
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