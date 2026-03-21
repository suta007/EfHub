local v_u_1 = game:GetService("Players")
local v2 = game:GetService("RunService")
local v_u_3 = require(script.Parent.Utils)
local v4 = v2:IsServer()
local v_u_5 = v2:IsClient()
local v_u_6
if v_u_3.ShouldMock then
	v_u_6 = nil
elseif v4 then
	v_u_6 = Instance.new("Folder")
	v_u_6.Name = "Remotes"
	v_u_6.Parent = script.Parent.Parent
else
	local v7 = script.Parent.Parent:WaitForChild("Remotes", 5)
	v_u_6 = assert(v7, "Did you forget to require the Replion module on the server?")
end
local v18 = {
	["get"] = function(p8)
		-- upvalues: (ref) v_u_6, (copy) v_u_5
		local v9 = v_u_6:FindFirstChild(p8)
		if v9 then
			return v9
		end
		if v_u_5 then
			error("Did you forget to require the Replion module on the server?")
		end
		local v10 = Instance.new("RemoteEvent")
		v10.Name = p8
		v10.Parent = v_u_6
		return v10
	end,
	["create"] = function(p11)
		-- upvalues: (ref) v_u_6, (copy) v_u_5
		for _, v12 in p11 do
			if not v_u_6:FindFirstChild(v12) then
				if v_u_5 then
					error("Did you forget to require the Replion module on the server?")
				end
				local v13 = Instance.new("RemoteEvent")
				v13.Name = v12
				v13.Parent = v_u_6
			end
		end
	end,
	["sendTo"] = function(p14, p15, ...)
		-- upvalues: (copy) v_u_3, (ref) v_u_6, (copy) v_u_5, (copy) v_u_1
		if v_u_3.ShouldMock then
			return
		else
			local v16 = v_u_6:FindFirstChild(p15)
			if not v16 then
				if v_u_5 then
					error("Did you forget to require the Replion module on the server?")
				end
				v16 = Instance.new("RemoteEvent")
				v16.Name = p15
				v16.Parent = v_u_6
			end
			if p14 == "All" then
				v16:FireAllClients(...)
				return
			elseif type(p14) == "table" then
				for _, v17 in p14 do
					if v17:IsDescendantOf(v_u_1) then
						v16:FireClient(v17, ...)
					end
				end
				return
			elseif typeof(p14) == "Instance" and p14:IsA("Player") then
				v16:FireClient(p14, ...)
			else
				error("Invalid replicateTo!")
			end
		end
	end
}
return table.freeze(v18)