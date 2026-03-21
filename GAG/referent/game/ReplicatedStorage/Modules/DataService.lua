local v1 = game:GetService("ReplicatedStorage")
v1:WaitForChild("Modules")
local v2 = require(v1.Modules.ReplicationClass)
require(script:WaitForChild("class"))
local v3 = v1:WaitForChild("Data")
require(v3:WaitForChild("DefaultData"))
local v4 = game:GetService("Players").LocalPlayer
local v5 = {
	["Receiver"] = v2.new((("%*_DataServiceProfile"):format(v4.Name)))
}
v5.Receiver:YieldUntilData()
function v5.GetPathSignal(p6, p7)
	local v8 = p6.Receiver
	if v8 then
		v8:YieldUntilData(25)
		return v8:GetPathSignal(p7)
	end
end
function v5.GetData(p9)
	local v10 = p9.Receiver
	if not v10 then
		return {}
	end
	v10:YieldUntilData()
	local v11 = v10:YieldUntilData(10)
	return not v11 and {} or v11.Table
end
return v5