local v1 = {
	["Name"] = "setweather",
	["Aliases"] = { "w", "startweather", "startevent" },
	["Description"] = "Changes the weather to a specified type.",
	["Group"] = "GameCommands",
	["Args"] = {
		{
			["Type"] = "weathers",
			["Name"] = "weather",
			["Description"] = "The weather to spawn."
		}
	}
}
return v1