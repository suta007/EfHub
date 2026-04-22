local v1 = {
	["Name"] = "startliveevent",
	["Aliases"] = { "sle", "startliveevent" },
	["Description"] = "Starts a live event. Local to this server by default, pass global to broadcast to all servers.",
	["Group"] = "GameCommands",
	["Args"] = {
		{
			["Type"] = "liveevent",
			["Name"] = "event",
			["Description"] = "The live event to start."
		},
		{
			["Type"] = "boolean",
			["Name"] = "global",
			["Description"] = "If true, broadcasts to all servers. Defaults to false (local only).",
			["Optional"] = true
		}
	}
}
return v1