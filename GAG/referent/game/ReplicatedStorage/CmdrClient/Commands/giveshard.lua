local v1 = {
	["Name"] = "giveshard",
	["Aliases"] = { "gsh" },
	["Description"] = "Gives Spray Bottle to specified player(s) with a specified amount.",
	["Group"] = "GameCommands",
	["Args"] = {
		{
			["Type"] = "players",
			["Name"] = "to",
			["Description"] = "The player(s) to give Shards to."
		},
		{
			["Type"] = "shardtype",
			["Name"] = "shardtype(s)",
			["Description"] = "The name of the Shard to give."
		},
		{
			["Type"] = "integer",
			["Name"] = "quantity",
			["Description"] = "The amount given.",
			["Optional"] = true
		},
		{
			["Type"] = "petmutation",
			["Name"] = "mutation",
			["Description"] = "The pet mutation type of the shard",
			["Optional"] = true
		}
	}
}
return v1