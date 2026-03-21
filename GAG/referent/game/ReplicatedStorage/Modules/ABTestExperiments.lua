game:GetService("RunService")
game:GetService("ReplicatedStorage")
require(script.ABTestTypes)
local v1 = {}
for _, v2 in script.Experiments:GetChildren() do
	if v2:IsA("ModuleScript") then
		local v3 = require(v2)
		local v4 = v3.RemoteConfig
		if #v4 > 16 then
			warn((("RemoteConfig \'%*\' is longer than the maximum of 15 characters, skipping \'%*\' experiment."):format(v4, v2.Name)))
		else
			v1[v2.Name] = v3
		end
	end
end
return v1