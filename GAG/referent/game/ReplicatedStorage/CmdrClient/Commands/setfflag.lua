local v1 = {
	["Name"] = "setfflag",
	["Aliases"] = { "setfflag" },
	["Description"] = "set fflag!",
	["Group"] = "GameCommands",
	["Args"] = {
		{
			["Type"] = "fflag",
			["Name"] = "fflag",
			["Description"] = "The fflag to set."
		},
		{
			["Type"] = "string",
			["Name"] = "Value",
			["Description"] = "Set any arbitrary value! Numbers and Booleans will be auto serialized into proper data types!"
		}
	}
}
return v1