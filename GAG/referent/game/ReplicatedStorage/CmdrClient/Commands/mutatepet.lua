local v1 = {
	["Name"] = "mutatepet",
	["Aliases"] = { "mpt" },
	["Description"] = "Changes specified player(s) currently held pet to a specified PetMutation.",
	["Group"] = "GameCommands",
	["Args"] = {
		{
			["Type"] = "players",
			["Name"] = "to",
			["Description"] = "The player(s) to mutate held pet."
		},
		{
			["Type"] = "petmutation",
			["Name"] = "PetMutation",
			["Description"] = "The PetMutation type!"
		}
	}
}
return v1