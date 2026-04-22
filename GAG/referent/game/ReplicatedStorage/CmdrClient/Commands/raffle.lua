local v1 = {
	["Name"] = "raffle",
	["Aliases"] = {},
	["Description"] = "Manage raffles: draw, reset, status, flush.",
	["Group"] = "GameCommands",
	["Args"] = {
		{
			["Type"] = "string",
			["Name"] = "subcommand",
			["Description"] = "Action to perform: draw, reset, status, flush."
		},
		{
			["Type"] = "string",
			["Name"] = "args",
			["Description"] = "Subcommand arguments (space-separated). See usage below.",
			["Optional"] = true,
			["Default"] = ""
		}
	}
}
return v1