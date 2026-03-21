local v2 = {
	["Name"] = "len",
	["Aliases"] = {},
	["Description"] = "Returns the length of a comma-separated list",
	["Group"] = "DefaultUtil",
	["Args"] = {
		{
			["Type"] = "string",
			["Name"] = "CSV",
			["Description"] = "The comma-separated list"
		}
	},
	["Run"] = function(_, p1)
		return #p1:split(",")
	end
}
return v2