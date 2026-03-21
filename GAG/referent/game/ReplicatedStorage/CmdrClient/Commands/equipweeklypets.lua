local v1 = {
	["Name"] = "equipweeklypets",
	["Aliases"] = { "ep" },
	["Description"] = "Equips weekly pets for the specified player(s)",
	["Group"] = "GameCommands",
	["Args"] = {
		{
			["Type"] = "players",
			["Name"] = "to",
			["Description"] = "The player(s) to equip the pets to."
		}
	}
}
return v1