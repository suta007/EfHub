game:GetService("HttpService")
local v1 = game:GetService("ReplicatedStorage")
local v_u_2 = game:GetService("Players").LocalPlayer
v_u_2:SetAttribute("ByteSize", 300)
local v_u_3 = require(v1.Modules.DumpTable)
print("Loaded Network Anaylyzer")
for _, v_u_4 in game:GetDescendants() do
	if v_u_4:IsA("RemoteEvent") then
		v_u_4.OnClientEvent:Connect(function(...)
			-- upvalues: (copy) v_u_3, (copy) v_u_2, (copy) v_u_4
			local v5 = { ... }
			local v6 = v_u_3(v5)
			if v_u_2:GetAttribute("OutputAll") then
				print("[IncomingNetwork]", v_u_4:GetFullName(), v_u_3(v5), (("Incoming Size: %*"):format(#v6)))
			end
			if #v6 >= v_u_2:GetAttribute("ByteSize") then
				warn((("[FlaggedNetwork] %* Incoming Size: %*, %*"):format(v_u_4:GetFullName(), #v6, v6)))
			end
		end)
	end
end