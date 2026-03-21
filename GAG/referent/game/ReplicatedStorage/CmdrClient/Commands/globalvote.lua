local v1 = {
	["Name"] = "globalvote",
	["Aliases"] = { "gv" },
	["Description"] = "Start a vote for players to choose from globally.",
	["Group"] = "GameCommands",
	["Args"] = {
		{
			["Type"] = "string",
			["Name"] = "vote topic",
			["Description"] = "The topic to vote."
		},
		{
			["Type"] = "strings",
			["Name"] = "vote options",
			["Description"] = "The options to vote."
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