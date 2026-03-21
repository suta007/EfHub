local v1 = {
	["Name"] = "givefriendpot",
	["Aliases"] = { "gfp" },
	["Description"] = "Gives Friendship Pot to specified player(s) with a specified amount.",
	["Group"] = "GameCommands",
	["Args"] = {
		{
			["Type"] = "players",
			["Name"] = "to",
			["Description"] = "The player(s) to give Friendship Pots to."
		},
		{
			["Type"] = "friendshippottype",
			["Name"] = "friendshippottype(s)",
			["Description"] = "The name of the Friendship Pot to give."
		},
		{
			["Type"] = "integer",
			["Name"] = "quantity",
			["Description"] = "The amount given.",
			["Optional"] = true
		}
	}
}
return v1