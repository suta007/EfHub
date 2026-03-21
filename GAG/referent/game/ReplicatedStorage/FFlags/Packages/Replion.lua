local v1 = require(script.Client)
local v2 = require(script.Server)
local v3 = require(script.Parent.Freeze)
return table.freeze({
	["Server"] = v2,
	["Client"] = v1,
	["None"] = v3.None
})