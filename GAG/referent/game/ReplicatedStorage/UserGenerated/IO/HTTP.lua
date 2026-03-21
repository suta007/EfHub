local v_u_1 = game:GetService("HttpService")
local v2 = require(game.ReplicatedStorage.UserGenerated.Lang.Asserts)
local v3 = v2.Set({
	"GET",
	"HEAD",
	"POST",
	"PUT",
	"DELETE",
	"OPTIONS",
	"TRACE",
	"PATCH"
})
local v4 = v2.Optional(v2.Enum(Enum.HttpCompression))
local v_u_5 = v2.Table({
	["Url"] = v2.String,
	["Method"] = v3,
	["Headers"] = v2.Optional(v2.Map(v2.String, v2.String)),
	["Body"] = v2.Optional(v2.RawString),
	["Compress"] = v4,
	["NoCache"] = v2.Optional(v2.Boolean)
})
return table.freeze({
	["AssertCompress"] = v4,
	["AssertMethod"] = v3,
	["AssertParams"] = v_u_5,
	["Execute"] = function(p6)
		-- upvalues: (copy) v_u_5, (copy) v_u_1
		v_u_5(p6)
		local v7 = p6.Headers or {}
		if p6.NoCache then
			v7 = table.clone(v7)
			v7["Cache-Control"] = "no-cache, no-store, must-revalidate"
			v7.Pragma = "no-cache"
			v7.Expires = "0"
		end
		local v8 = {
			["Url"] = p6.Url,
			["Method"] = p6.Method,
			["Headers"] = v7,
			["Body"] = p6.Body,
			["Compress"] = p6.Compress
		}
		local v9, v10 = pcall(v_u_1.RequestAsync, v_u_1, v8)
		return not v9 and {
			["Success"] = false,
			["StatusCode"] = 400,
			["StatusMessage"] = tostring(v10),
			["Headers"] = {}
		} or v10
	end
})