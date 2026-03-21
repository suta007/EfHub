local v1 = {
	["Name"] = "givefence",
	["Aliases"] = { "gf" },
	["Description"] = "Gives a fence to specific player(s).",
	["Group"] = "GameCommands",
	["Args"] = {
		{
			["Type"] = "players",
			["Name"] = "to",
			["Description"] = "The player(s) to give seed to."
		},
		{
			["Type"] = "strictfencename",
			["Name"] = "fencename(s)",
			["Description"] = "The Seeds to give."
		}
	}
}
return v1