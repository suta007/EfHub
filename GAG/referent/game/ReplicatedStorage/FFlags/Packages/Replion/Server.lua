local v_u_1 = game:GetService("Players")
local v2 = game:GetService("RunService")
local v_u_3 = require(script.Parent.Parent.Freeze)
local v_u_4 = require(script.Parent.Internal.Utils)
local v_u_5 = require(script.Parent.Internal.Network)
local v_u_6 = require(script.ServerReplion)
local v7 = require(script.Parent.Parent.Signal)
require(script.Parent.Internal.Types)
local v_u_8 = v7.new()
local v_u_9 = v7.new()
local v_u_10 = {}
local v_u_11 = {}
local v_u_12 = {}
local v_u_13 = {}
local function v_u_18(p14, p15)
	-- upvalues: (copy) v_u_4, (copy) v_u_13
	for v16, v17 in p14 do
		if v17.thread == p15 then
			table.remove(p14, v16)
			if v17.async then
				v_u_4.safeCancelThread(p15)
			else
				pcall(task.spawn, p15)
			end
			v_u_13[p15] = nil
			return
		end
	end
end
local v_u_108 = {
	["new"] = function(p19)
		-- upvalues: (copy) v_u_10, (copy) v_u_6, (copy) v_u_9, (copy) v_u_12, (copy) v_u_8, (copy) v_u_4, (copy) v_u_11, (copy) v_u_13
		local v20 = p19.Channel
		local v_u_21 = assert(v20, "Channel is required!")
		local v22 = v_u_10
		local v_u_23 = v22[v_u_21]
		if not v_u_23 then
			v_u_23 = {}
			v22[v_u_21] = v_u_23
		end
		local v24 = p19.ReplicateTo
		for _, v25 in v_u_23 do
			local v26 = v25.ReplicateTo
			local v27 = v26 == v24
			if not v27 and (type(v26) == "table" and type(v24) == "table") then
				for _, v28 in v26 do
					v27 = table.find(v24, v28) ~= nil
					if v27 then
						break
					end
				end
			end
			if v27 then
				local v29 = nil
				if typeof(v26) == "Instance" or typeof(v29) == "userdata" then
					v29 = tostring(v26)
				elseif type(v26) == "string" then
					v29 = v26
				elseif type(v26) == "table" then
					for _, v30 in v26 do
						v29 = (not v29 and "" or v29 .. ", ") .. tostring(v30)
					end
				end
				error((("Channel \"%*\" already exists! for \"%*\""):format(v_u_21, v29)))
			end
		end
		local v_u_31 = v_u_6.new(p19)
		v_u_31:BeforeDestroy(function()
			-- upvalues: (copy) v_u_23, (ref) v_u_31, (ref) v_u_10, (copy) v_u_21, (ref) v_u_9
			v_u_23[v_u_31._id] = nil
			if not next(v_u_23) then
				v_u_10[v_u_21] = nil
			end
			v_u_9:Fire(v_u_21, v_u_31)
			v_u_31 = nil
		end)
		v_u_31._replicateToChanged:Connect(function(p32, p33)
			-- upvalues: (ref) v_u_12, (copy) v_u_21, (ref) v_u_31
			if typeof(p33) == "Player" then
				local v34 = v_u_12[p33]
				if not v34 then
					return
				end
				v34[v_u_21] = nil
			elseif typeof(p33) == "table" then
				for _, v35 in p33 do
					local v36 = v_u_12[v35]
					if v36 then
						v36[v_u_21] = nil
					end
				end
			end
			if typeof(p32) == "Player" then
				local v37 = v_u_12
				local v38 = v37[p32]
				if not v38 then
					v38 = {}
					v37[p32] = v38
				end
				v38[v_u_21] = v_u_31._id
			elseif typeof(p32) == "table" then
				for _, v39 in p32 do
					local v40 = v_u_12
					local v41 = v40[v39]
					if not v41 then
						v41 = {}
						v40[v39] = v41
					end
					v41[v_u_21] = v_u_31._id
				end
			end
		end)
		v_u_23[v_u_31._id] = v_u_31
		v_u_8:Fire(v_u_21, v_u_31)
		local v42
		if typeof(v24) == "Instance" or v_u_4.ShouldMock and typeof(v24) == "userdata" then
			local v43 = v_u_12
			local v44 = v43[v24]
			if not v44 then
				v44 = {}
				v43[v24] = v44
			end
			v44[v_u_21] = v_u_31._id
			v42 = v_u_31
		elseif type(v24) == "table" then
			v42 = v_u_31
			for _, v45 in v24 do
				local v46 = v_u_12
				local v47 = v46[v45]
				if not v47 then
					v47 = {}
					v46[v45] = v47
				end
				v47[v_u_21] = v42._id
			end
		else
			v42 = v_u_31
		end
		local v48 = v_u_11[v_u_21]
		if v48 then
			for v49 = #v48, 1, -1 do
				local v50 = v48[v49]
				local v51 = v50.thread
				local v52 = v50.player
				if v52 then
					local v53 = false
					if typeof(v24) == "Instance" or typeof(v24) == "userdata" then
						v53 = v24 == v52
					elseif type(v24) == "table" then
						v53 = table.find(v24, v52) ~= nil
					end
					if v53 then
						goto l50
					end
				else
					::l50::
					local v54 = v_u_13[v51]
					if v54 then
						v_u_4.safeCancelThread(v54)
						v_u_13[v51] = nil
					end
					if coroutine.status(v51) == "suspended" then
						task.spawn(v51, v42)
					end
					table.remove(v48, v49)
				end
			end
		end
		return v42
	end,
	["GetReplion"] = function(_, p55)
		-- upvalues: (copy) v_u_10, (copy) v_u_3
		local v56 = v_u_10[p55]
		if not v56 then
			return nil
		end
		local v57 = v_u_3.Dictionary.count(v56) == 1
		local v58 = ("There are multiple replions with the channel \"%*\". Did you mean to use GetReplionFor?"):format(p55)
		assert(v57, v58)
		local _, v59 = next(v56)
		return v59
	end,
	["GetReplionFor"] = function(_, p60, p61)
		-- upvalues: (copy) v_u_10, (copy) v_u_12
		local v62 = v_u_10[p61]
		if v62 then
			local v63 = v_u_12[p60]
			if v63 then
				return v62[v63[p61]]
			end
		end
	end,
	["GetReplionsFor"] = function(_, p64)
		-- upvalues: (copy) v_u_10
		local v65 = {}
		for _, v66 in v_u_10 do
			for _, v67 in v66 do
				local v68 = v67.ReplicateTo
				local v69 = v68 == "All"
				if not v69 then
					if type(v68) == "table" then
						v69 = table.find(v68, p64) ~= nil
					else
						v69 = v68 == p64 and true or v69
					end
				end
				if v69 then
					table.insert(v65, v67)
				end
			end
		end
		return v65
	end,
	["WaitReplion"] = function(p70, p71, p72)
		-- upvalues: (copy) v_u_11, (copy) v_u_13, (copy) v_u_18
		local v73 = p70:GetReplion(p71)
		if v73 then
			return v73
		end
		local v74 = coroutine.running()
		local v75 = v_u_11
		local v76 = v75[p71]
		if not v76 then
			v76 = {}
			v75[p71] = v76
		end
		if p72 then
			v_u_13[v74] = task.delay(p72, v_u_18, v76, v74)
		end
		table.insert(v76, {
			["thread"] = v74
		})
		return coroutine.yield()
	end,
	["WaitReplionFor"] = function(p77, p78, p79, p80)
		-- upvalues: (copy) v_u_1, (copy) v_u_11, (copy) v_u_13, (copy) v_u_18
		local v81 = p77:GetReplionFor(p78, p79)
		if v81 then
			return v81
		end
		if typeof(p78) == "Instance" and not p78:IsDescendantOf(v_u_1) then
			if _G.__DEV__ then
				local v82, v83 = debug.info(2, "sl")
				warn((("Warning: Trying to wait for a player that is not in the game at %*:%*"):format(v82, v83)))
			end
			return nil
		end
		local v84 = coroutine.running()
		local v85 = v_u_11
		local v86 = v85[p79]
		if not v86 then
			v86 = {}
			v85[p79] = v86
		end
		if p80 then
			v_u_13[v84] = task.delay(p80, v_u_18, v86, v84)
		end
		table.insert(v86, {
			["thread"] = v84,
			["player"] = p78
		})
		return coroutine.yield()
	end,
	["AwaitReplion"] = function(p87, p88, p89, p90)
		-- upvalues: (copy) v_u_11, (copy) v_u_13, (copy) v_u_18
		local v91 = p87:GetReplion(p88)
		if v91 then
			return p89(v91)
		end
		local v92 = v_u_11
		local v_u_93 = v92[p88]
		if not v_u_93 then
			v_u_93 = {}
			v92[p88] = v_u_93
		end
		local v_u_94 = coroutine.create(p89)
		if p90 then
			v_u_13[v_u_94] = task.delay(p90, v_u_18, v_u_93, v_u_94)
		end
		table.insert(v_u_93, {
			["thread"] = v_u_94,
			["async"] = true
		})
		return function()
			-- upvalues: (ref) v_u_18, (copy) v_u_93, (copy) v_u_94
			v_u_18(v_u_93, v_u_94)
		end
	end,
	["AwaitReplionFor"] = function(p95, p96, p97, p98, p99)
		-- upvalues: (copy) v_u_11, (copy) v_u_13, (copy) v_u_18
		local v100 = p95:GetReplionFor(p96, p97)
		if v100 then
			return p98(v100)
		end
		if typeof(p96) == "Instance" and p96.Parent == nil then
			if _G.__DEV__ then
				local v101, v102 = debug.info(2, "sl")
				warn((("Warning: Trying to await for a player that is not in the game at %*:%*"):format(v101, v102)))
			end
			return nil
		end
		local v103 = v_u_11
		local v_u_104 = v103[p97]
		if not v_u_104 then
			v_u_104 = {}
			v103[p97] = v_u_104
		end
		local v_u_105 = coroutine.create(p98)
		if p99 then
			v_u_13[v_u_105] = task.delay(p99, v_u_18, v_u_104, v_u_105)
		end
		table.insert(v_u_104, {
			["thread"] = v_u_105,
			["player"] = p96,
			["async"] = true
		})
		return function()
			-- upvalues: (ref) v_u_18, (copy) v_u_104, (copy) v_u_105
			v_u_18(v_u_104, v_u_105)
		end
	end,
	["OnReplionAdded"] = function(_, p106)
		-- upvalues: (copy) v_u_8
		return v_u_8:Connect(p106)
	end,
	["OnReplionRemoved"] = function(_, p107)
		-- upvalues: (copy) v_u_9
		return v_u_9:Connect(p107)
	end
}
if not v_u_4.ShouldMock and v2:IsServer() then
	v_u_5.create({
		"Added",
		"Removed",
		"Update",
		"UpdateReplicateTo",
		"Set",
		"ArrayUpdate"
	})
	local function v112(p109)
		-- upvalues: (copy) v_u_108, (copy) v_u_5
		local v110 = {}
		for _, v111 in v_u_108:GetReplionsFor(p109) do
			table.insert(v110, v111:_serialize())
		end
		if #v110 > 0 then
			v_u_5.sendTo(p109, "Added", v110)
		end
	end
	for _, v113 in v_u_1:GetPlayers() do
		task.spawn(v112, v113)
	end
	v_u_1.PlayerAdded:Connect(v112)
	v_u_1.PlayerRemoving:Connect(function(p_u_114)
		-- upvalues: (copy) v_u_10, (copy) v_u_3, (copy) v_u_12, (copy) v_u_11, (copy) v_u_4, (copy) v_u_13
		local v_u_115 = {}
		for _, v116 in v_u_10 do
			for _, v_u_117 in v116 do
				local v118 = v_u_117.ReplicateTo
				if v118 ~= "All" then
					if type(v118) == "table" then
						v_u_117:SetReplicateTo(v_u_3.List.removeValue(v118, p_u_114))
					elseif v118 == p_u_114 then
						if v_u_117.DisableAutoDestroy then
							v_u_117:BeforeDestroy(function()
								-- upvalues: (copy) v_u_115, (copy) v_u_117, (ref) v_u_12, (copy) p_u_114
								local v119 = table.find(v_u_115, v_u_117)
								if v119 then
									table.remove(v_u_115, v119)
									if #v_u_115 == 0 then
										v_u_12[p_u_114] = nil
									end
								end
							end)
							table.insert(v_u_115, v_u_117)
						else
							v_u_117:Destroy()
						end
					end
				end
			end
		end
		if #v_u_115 == 0 then
			v_u_12[p_u_114] = nil
		end
		for v120, v121 in v_u_11 do
			for v122 = #v121, 1, -1 do
				local v123 = v121[v122]
				local v124 = v123.thread
				if v123.player == p_u_114 then
					if v123.async then
						v_u_4.safeCancelThread(v124)
					else
						pcall(task.spawn, v124)
					end
					v_u_13[v124] = nil
					table.remove(v121, v122)
				end
			end
			if #v121 == 0 then
				v_u_11[v120] = nil
			end
		end
	end)
end
return v_u_108