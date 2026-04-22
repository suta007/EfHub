local v1 = {
	["Name"] = "refreshegghunt",
	["Aliases"] = { "reh" },
	["Description"] = "Refreshes the egg hunt for the specified player(s).",
	["Group"] = "GameCommands",
	["Args"] = {
		{
			["Type"] = "players",
			["Name"] = "to",
			["Description"] = "The player(s) to refresh for."
		},
		{
			["Type"] = "boolean",
			["Name"] = "server-wide",
			["Description"] = "Whether the serverwide egg hunt should run."
		}
	}
}
return v1