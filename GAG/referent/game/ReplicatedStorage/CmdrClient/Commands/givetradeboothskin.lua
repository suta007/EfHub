local v1 = {
	["Name"] = "givetradeboothskin",
	["Description"] = "Gives a trade booth skin to specific player(s).",
	["Group"] = "GameCommands",
	["Args"] = {
		{
			["Type"] = "players",
			["Name"] = "to",
			["Description"] = "The player(s) to give the skin to."
		},
		{
			["Type"] = "stricttradeboothskinname",
			["Name"] = "skin",
			["Description"] = "The skin to give."
		},
		{
			["Type"] = "number",
			["Name"] = "quantity",
			["Description"] = "Quantity of skins",
			["Optional"] = true
		}
	}
}
return v1