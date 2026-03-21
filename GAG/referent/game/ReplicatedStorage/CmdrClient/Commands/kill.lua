local v1 = {
	["Name"] = "kill",
	["Aliases"] = { "slay" },
	["Description"] = "Kills a player or set of players.",
	["Group"] = "DefaultAdmin",
	["Args"] = {
		{
			["Type"] = "players",
			["Name"] = "victims",
			["Description"] = "The players to kill."
		}
	}
}
return v1