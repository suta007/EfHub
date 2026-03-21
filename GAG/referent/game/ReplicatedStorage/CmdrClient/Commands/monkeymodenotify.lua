local v1 = {
	["Name"] = "monkeymodenotify",
	["Aliases"] = { "mmn" },
	["Description"] = "Sends a cross server global notification to all players in the game.",
	["Group"] = "GameCommands",
	["Args"] = {
		{
			["Type"] = "string",
			["Name"] = "Message",
			["Description"] = "Message to send to player(s)."
		}
	}
}
return v1