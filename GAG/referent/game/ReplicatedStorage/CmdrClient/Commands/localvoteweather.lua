local v1 = {
	["Name"] = "localvoteweather",
	["Aliases"] = { "lvw" },
	["Description"] = "Start a vote for players to choose the next weather type.",
	["Group"] = "GameCommands",
	["Args"] = {
		{
			["Type"] = "weathers",
			["Name"] = "weather option",
			["Description"] = "The weather to vote."
		},
		{
			["Type"] = "duration",
			["Name"] = "duration seconds",
			["Description"] = "How long the vote lasts",
			["Optional"] = true
		}
	}
}
return v1