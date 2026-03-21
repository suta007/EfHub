local v1 = game:GetService("ReplicatedStorage")
local v2 = game:GetService("RunService")
require(v1.UserGenerated.FastFlags.SharedFastFlags)
local v3 = nil
if v2:IsClient() then
	return require(v1.UserGenerated.Client.ClientFastFlags)
elseif v2:IsServer() then
	local v4 = game:GetService("ServerScriptService")
	return require(v4.UserGenerated.Server.ServerFastFlags)
else
	error("RunContext")
	return v3
end