local v_u_1 = game:GetService("HttpService")
local v3 = {
	["Name"] = "json-array-encode",
	["Aliases"] = {},
	["Description"] = "Encodes a comma-separated list into a JSON array",
	["Group"] = "DefaultUtil",
	["Args"] = {
		{
			["Type"] = "string",
			["Name"] = "CSV",
			["Description"] = "The comma-separated list"
		}
	},
	["Run"] = function(_, p2)
		-- upvalues: (copy) v_u_1
		return v_u_1:JSONEncode(p2:split(","))
	end
}
return v3