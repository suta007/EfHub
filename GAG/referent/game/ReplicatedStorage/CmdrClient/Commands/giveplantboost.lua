local v1 = {
	["Name"] = "giveplantboost",
	["Aliases"] = { "gpb" },
	["Description"] = "Gives plant boost to specified player(s) with a specified boost amount.",
	["Group"] = "GameCommands",
	["Args"] = {
		{
			["Type"] = "players",
			["Name"] = "to",
			["Description"] = "The player(s) to give plant boost to."
		},
		{
			["Type"] = "integer",
			["Name"] = "Boost amount",
			["Description"] = "The name of the Friendship Pot to give."
		}
	}
}
return v1