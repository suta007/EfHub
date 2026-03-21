local v1 = {
	["Name"] = "cycle",
	["Aliases"] = { "cycle" },
	["Description"] = "Starts Cycle",
	["Group"] = "GameCommands",
	["Args"] = {
		{
			["Type"] = "cycle",
			["Name"] = "Name",
			["Description"] = "The Cycle to trigger"
		},
		{
			["Type"] = "cycleaction",
			["Name"] = "Action",
			["Description"] = "Force start, force end the cycle, or clear the forced state."
		}
	}
}
return v1