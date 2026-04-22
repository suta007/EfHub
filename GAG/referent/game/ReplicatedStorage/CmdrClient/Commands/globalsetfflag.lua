local v1 = {
	["Name"] = script.Name,
	["Aliases"] = { "sff" },
	["Description"] = script.Name,
	["Group"] = "DefaultAdmin",
	["Args"] = {
		{
			["Type"] = "flagnames",
			["Name"] = "ConfigName",
			["Description"] = "Config to set!"
		},
		{
			["Type"] = "string",
			["Name"] = "ConfigValue",
			["Description"] = "Config to set!"
		}
	}
}
return v1