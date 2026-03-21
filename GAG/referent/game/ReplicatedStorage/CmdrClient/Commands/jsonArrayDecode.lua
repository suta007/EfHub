local v3 = {
	["Name"] = "json-array-decode",
	["Aliases"] = {},
	["Description"] = "Decodes a JSON Array into a comma-separated list",
	["Group"] = "DefaultUtil",
	["Args"] = {
		{
			["Type"] = "json",
			["Name"] = "JSON",
			["Description"] = "The JSON array."
		}
	},
	["ClientRun"] = function(_, p1)
		local v2 = type(p1) ~= "table" and { p1 } or p1
		return table.concat(v2, ",")
	end
}
return v3