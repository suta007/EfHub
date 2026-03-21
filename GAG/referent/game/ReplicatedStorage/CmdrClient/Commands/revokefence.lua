local v1 = {
	["Name"] = "revokefence",
	["Aliases"] = { "rf" },
	["Description"] = "Revoke a fence from specific player(s).",
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