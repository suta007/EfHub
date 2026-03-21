local v1 = {
	["Name"] = "mutateplant",
	["Aliases"] = { "mp" },
	["Description"] = "Changes specified player(s) currently held plant to a specified mutation.",
	["Group"] = "GameCommands",
	["Args"] = {
		{
			["Type"] = "players",
			["Name"] = "to",
			["Description"] = "The player(s) to mutate held plants."
		},
		{
			["Type"] = "mutation",
			["Name"] = "mutation",
			["Description"] = "The mutation type!"
		}
	}
}
return v1