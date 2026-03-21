local v1 = {
	["Name"] = "setweather",
	["Aliases"] = { "w" },
	["Description"] = "Changes the weather to a specified type.",
	["Group"] = "GameCommands",
	["Args"] = {
		{
			["Type"] = "weather",
			["Name"] = "weather",
			["Description"] = "The weather to spawn."
		}
	}
}
return v1