local v1 = {
	["Name"] = "setcosmeticstat",
	["Aliases"] = { "scs" },
	["Description"] = "Sets the cosmetic stats to provided players.",
	["Group"] = "GameCommands",
	["Args"] = {
		{
			["Type"] = "players",
			["Name"] = "to",
			["Description"] = "The player(s) to set stat."
		},
		{
			["Type"] = "cosmeticmutablestat",
			["Name"] = "Stat Name",
			["Description"] = "Stat to set"
		},
		{
			["Type"] = "number",
			["Name"] = "Value",
			["Description"] = "Value to Set"
		}
	}
}
return v1