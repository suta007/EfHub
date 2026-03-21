local v1 = game:GetService("ReplicatedStorage")
require(v1.UserGenerated.Concurrency.Bindable)
local v2 = require(v1.UserGenerated.FastFlags)
local v3 = require(v1.UserGenerated.Lang.Asserts)
local v4 = v2.Replicated("UserGenerated.ABTestDefaults", v3.Map(v3.String, v3.Any), {})
return table.freeze({
	["UpdateRemote"] = script:WaitForChild("Update"),
	["ABTestDefaults"] = v4
})