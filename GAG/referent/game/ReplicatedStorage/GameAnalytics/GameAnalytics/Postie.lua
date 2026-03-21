local v_u_1 = game:GetService("HttpService")
local v2 = game:GetService("RunService")
local v3 = game:GetService("ReplicatedStorage")
if not v3:FindFirstChild("PostieSent") then
	local v4 = Instance.new("RemoteEvent")
	v4.Name = "PostieSent"
	v4.Parent = v3
end
if not v3:FindFirstChild("PostieReceived") then
	local v5 = Instance.new("RemoteEvent")
	v5.Name = "PostieReceived"
	v5.Parent = v3
end
local v_u_6 = v3.PostieSent
local v_u_7 = v3.PostieReceived
local v_u_8 = v2:IsServer()
local v_u_9 = {}
local v_u_10 = {}
local v30 = {
	["invokeClient"] = function(p11, p_u_12, p13, ...)
		-- upvalues: (copy) v_u_8, (copy) v_u_1, (copy) v_u_10, (copy) v_u_6
		local v14 = v_u_8
		assert(v14, "Postie.invokeClient can only be called from the server")
		local v_u_15 = coroutine.running()
		local v_u_16 = false
		local v_u_17 = v_u_1:GenerateGUID(false)
		v_u_10[v_u_17] = function(p18, p19, ...)
			-- upvalues: (copy) p_u_12, (ref) v_u_16, (ref) v_u_10, (copy) v_u_17, (copy) v_u_15
			if p18 == p_u_12 then
				v_u_16 = true
				v_u_10[v_u_17] = nil
				if p19 then
					task.spawn(v_u_15, true, ...)
				else
					task.spawn(v_u_15, false)
				end
			else
				return
			end
		end
		task.delay(p13, function()
			-- upvalues: (ref) v_u_16, (ref) v_u_10, (copy) v_u_17, (copy) v_u_15
			if not v_u_16 then
				v_u_10[v_u_17] = nil
				task.spawn(v_u_15, false)
			end
		end)
		v_u_6:FireClient(p_u_12, p11, v_u_17, ...)
		return coroutine.yield()
	end,
	["invokeServer"] = function(p20, p21, ...)
		-- upvalues: (copy) v_u_8, (copy) v_u_1, (copy) v_u_10, (copy) v_u_6
		local v22 = not v_u_8
		assert(v22, "Postie.invokeServer can only be called from the client")
		local v_u_23 = coroutine.running()
		local v_u_24 = false
		local v_u_25 = v_u_1:GenerateGUID(false)
		v_u_10[v_u_25] = function(p26, ...)
			-- upvalues: (ref) v_u_24, (ref) v_u_10, (copy) v_u_25, (copy) v_u_23
			v_u_24 = true
			v_u_10[v_u_25] = nil
			if p26 then
				task.spawn(v_u_23, true, ...)
			else
				task.spawn(v_u_23, false)
			end
		end
		task.delay(p21, function()
			-- upvalues: (ref) v_u_24, (ref) v_u_10, (copy) v_u_25, (copy) v_u_23
			if not v_u_24 then
				v_u_10[v_u_25] = nil
				task.spawn(v_u_23, false)
			end
		end)
		v_u_6:FireServer(p20, v_u_25, ...)
		return coroutine.yield()
	end,
	["setCallback"] = function(p27, p28)
		-- upvalues: (copy) v_u_9
		v_u_9[p27] = p28
	end,
	["getCallback"] = function(p29)
		-- upvalues: (copy) v_u_9
		return v_u_9[p29]
	end
}
if v_u_8 then
	v_u_7.OnServerEvent:Connect(function(p31, p32, p33, ...)
		-- upvalues: (copy) v_u_10
		local v34 = v_u_10[p32]
		if v34 then
			v34(p31, p33, ...)
		end
	end)
	v_u_6.OnServerEvent:Connect(function(p35, p36, p37, ...)
		-- upvalues: (copy) v_u_9, (copy) v_u_7
		local v38 = v_u_9[p36]
		if v38 then
			v_u_7:FireClient(p35, p37, true, v38(p35, ...))
		else
			v_u_7:FireClient(p35, p37, false)
		end
	end)
	return v30
else
	v_u_7.OnClientEvent:Connect(function(p39, p40, ...)
		-- upvalues: (copy) v_u_10
		local v41 = v_u_10[p39]
		if v41 then
			v41(p40, ...)
		end
	end)
	v_u_6.OnClientEvent:Connect(function(p42, p43, ...)
		-- upvalues: (copy) v_u_9, (copy) v_u_7
		local v44 = v_u_9[p42]
		if v44 then
			v_u_7:FireServer(p43, true, v44(...))
		else
			v_u_7:FireServer(p43, false)
		end
	end)
	return v30
end