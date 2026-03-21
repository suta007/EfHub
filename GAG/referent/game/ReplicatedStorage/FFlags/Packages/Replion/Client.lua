local v1 = game:GetService("RunService")
local v_u_2 = require(script.Parent.Internal.Utils)
local v3 = require(script.Parent.Parent.Signal)
local v4 = require(script.Parent.Internal.Network)
local v_u_5 = require(script.ClientReplion)
require(script.Parent.Internal.Types)
local v_u_6 = {}
local v_u_7 = {}
local v_u_8 = {}
local v_u_9 = v3.new()
local v_u_10 = v3.new()
local function v_u_15(p11, p12)
	-- upvalues: (copy) v_u_2, (copy) v_u_8
	for v13, v14 in p11 do
		if v14.thread == p12 then
			table.remove(p11, v13)
			if v14.async then
				v_u_2.safeCancelThread(p12)
			else
				pcall(task.spawn, p12)
			end
			v_u_8[p12] = nil
			return
		end
	end
end
local function v_u_21(p16)
	-- upvalues: (copy) v_u_6, (copy) v_u_5, (copy) v_u_9, (copy) v_u_7
	local v17 = p16[2]
	if not v_u_6[v17] then
		local v18 = v_u_5.new(p16)
		v_u_6[v17] = v18
		v_u_6[p16[1]] = v18
		v_u_9:Fire(v18)
		local v19 = v_u_7[v17]
		if v19 then
			for _, v20 in v19 do
				pcall(task.spawn, v20.thread, v18)
			end
			v_u_7[v17] = nil
		end
	end
end
local v48 = {
	["OnReplionAdded"] = function(_, p22)
		-- upvalues: (copy) v_u_9
		return v_u_9:Connect(p22)
	end,
	["OnReplionRemoved"] = function(_, p23)
		-- upvalues: (copy) v_u_10
		return v_u_10:Connect(p23)
	end,
	["OnReplionAddedWithTag"] = function(p24, p_u_25, p_u_26)
		return p24:OnReplionAdded(function(p27)
			-- upvalues: (copy) p_u_25, (copy) p_u_26
			local v28 = p27.Tags
			if v28 and table.find(v28, p_u_25) ~= nil then
				p_u_26(p27)
			end
		end)
	end,
	["OnReplionRemovedWithTag"] = function(p29, p_u_30, p_u_31)
		return p29:OnReplionRemoved(function(p32)
			-- upvalues: (copy) p_u_30, (copy) p_u_31
			local v33 = p32.Tags
			if v33 and table.find(v33, p_u_30) ~= nil then
				p_u_31(p32)
			end
		end)
	end,
	["GetReplion"] = function(_, p34)
		-- upvalues: (copy) v_u_6
		return v_u_6[p34]
	end,
	["WaitReplion"] = function(_, p35, p36)
		-- upvalues: (copy) v_u_6, (copy) v_u_7, (copy) v_u_8, (copy) v_u_15
		local v37 = v_u_6[p35]
		if v37 then
			return v37
		end
		local v38 = coroutine.running()
		local v39 = v_u_7[p35]
		if not v39 then
			v39 = {}
			v_u_7[p35] = v39
		end
		local v40 = assert(v39, "Invalid wait list")
		if p36 then
			v_u_8[v38] = task.delay(p36, v_u_15, v40, v38)
		end
		table.insert(v40, {
			["thread"] = v38
		})
		return coroutine.yield()
	end,
	["AwaitReplion"] = function(_, p41, p42, p43)
		-- upvalues: (copy) v_u_6, (copy) v_u_7, (copy) v_u_8, (copy) v_u_15
		local v44 = v_u_6[p41]
		if v44 then
			return p42(v44)
		end
		local v45 = v_u_7[p41]
		if not v45 then
			v45 = {}
			v_u_7[p41] = v45
		end
		local v_u_46 = assert(v45, "Invalid wait list")
		local v_u_47 = coroutine.create(p42)
		if p43 then
			v_u_8[v_u_47] = task.delay(p43, v_u_15, v_u_46, v_u_47)
		end
		table.insert(v_u_46, {
			["thread"] = v_u_47,
			["async"] = true
		})
		return function()
			-- upvalues: (ref) v_u_15, (copy) v_u_46, (copy) v_u_47
			v_u_15(v_u_46, v_u_47)
		end
	end
}
if not v_u_2.ShouldMock and v1:IsClient() then
	local v49 = v4.get("Added")
	local v50 = v4.get("Removed")
	local v51 = v4.get("Update")
	local v52 = v4.get("Set")
	local v53 = v4.get("UpdateReplicateTo")
	local v54 = v4.get("ArrayUpdate")
	v49.OnClientEvent:Connect(function(p55)
		-- upvalues: (copy) v_u_21
		local v56 = p55[1]
		if type(v56) == "table" then
			for _, v57 in p55 do
				v_u_21(v57)
			end
		else
			v_u_21(p55)
		end
	end)
	v50.OnClientEvent:Connect(function(p58)
		-- upvalues: (copy) v_u_6, (copy) v_u_10
		local v59 = v_u_6[p58]
		if v59 then
			v_u_6[p58] = nil
			v_u_6[v59._channel] = nil
			v_u_10:Fire(v59)
			v59:Destroy()
		end
	end)
	v51.OnClientEvent:Connect(function(p60, p61, p62, p63)
		-- upvalues: (copy) v_u_6
		local v64 = v_u_6[p60]
		if v64 then
			v64:_update(p61, p62, p63)
		end
	end)
	v53.OnClientEvent:Connect(function(p65, p66)
		-- upvalues: (copy) v_u_6
		local v67 = v_u_6[p65]
		if v67 then
			v67.ReplicateTo = p66
		end
	end)
	v52.OnClientEvent:Connect(function(p68, p69, p70)
		-- upvalues: (copy) v_u_6
		local v71 = v_u_6[p68]
		if v71 then
			v71:_set(p69, p70)
		end
	end)
	v54.OnClientEvent:Connect(function(p72, p73, ...)
		-- upvalues: (copy) v_u_6
		local v74 = v_u_6[p72]
		if v74 then
			if p73 == "i" then
				v74:_insert(...)
				return
			end
			if p73 == "r" then
				v74:_remove(...)
				return
			end
			if p73 == "c" then
				v74:_clear(...)
			end
		end
	end)
end
return table.freeze(v48)