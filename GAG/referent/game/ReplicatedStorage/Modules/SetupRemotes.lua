local v_u_1 = game:GetService("RunService")
return function(p2, p_u_3)
	-- upvalues: (copy) v_u_1
	for _, v4 in p2:GetChildren() do
		local v5 = v4:IsA("RemoteEvent")
		local v6 = v4:IsA("RemoteFunction")
		local v7 = v4:IsA("UnreliableRemoteEvent")
		if not (v5 or (v6 or v7)) then
			return
		end
		local v_u_8 = p_u_3[v4.Name]
		if v_u_8 then
			local v9
			if v6 then
				v9 = nil
			elseif v_u_1:IsServer() then
				v9 = v4.OnServerEvent
			else
				v9 = v4.OnClientEvent
			end
			local function v10(...)
				-- upvalues: (copy) v_u_8, (copy) p_u_3
				return v_u_8(p_u_3, ...)
			end
			if v5 or v7 then
				v9:Connect(v10)
			elseif v6 then
				v4[v_u_1:IsServer() and "OnServerInvoke" or "OnClientInvoke"] = v10
			end
		else
			warn(v4, "has no associated operation?")
		end
	end
end