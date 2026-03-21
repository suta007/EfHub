local v_u_30 = {
	["ClassName"] = "Maid",
	["new"] = function()
		-- upvalues: (copy) v_u_30
		local v1 = v_u_30
		return setmetatable({
			["_tasks"] = {}
		}, v1)
	end,
	["isMaid"] = function(p2)
		local v3
		if type(p2) == "table" then
			v3 = p2.ClassName == "Maid"
		else
			v3 = false
		end
		return v3
	end,
	["__index"] = function(p4, p5)
		-- upvalues: (copy) v_u_30
		if v_u_30[p5] then
			return v_u_30[p5]
		else
			return p4._tasks[p5]
		end
	end,
	["__newindex"] = function(p6, p7, p8)
		-- upvalues: (copy) v_u_30
		if v_u_30[p7] ~= nil then
			error(string.format("Cannot use \'%s\' as a Maid key", (tostring(p7))), 2)
		end
		local v9 = p6._tasks
		local v_u_10 = v9[p7]
		if v_u_10 ~= p8 then
			v9[p7] = p8
			if v_u_10 then
				if typeof(v_u_10) == "function" then
					v_u_10()
					return
				end
				if typeof(v_u_10) == "table" then
					local v11 = v_u_10.Destroy
					if type(v11) == "function" then
						v_u_10:Destroy()
						return
					end
				else
					if typeof(v_u_10) == "Instance" then
						v_u_10:Destroy()
						return
					end
					if typeof(v_u_10) == "thread" then
						local v12
						if coroutine.running() == v_u_10 then
							v12 = nil
						else
							v12 = pcall(function()
								-- upvalues: (copy) v_u_10
								task.cancel(v_u_10)
							end)
						end
						if not v12 then
							task.defer(function()
								-- upvalues: (copy) v_u_10
								task.cancel(v_u_10)
							end)
							return
						end
					elseif typeof(v_u_10) == "RBXScriptConnection" then
						v_u_10:Disconnect()
					end
				end
			end
		end
	end,
	["Add"] = function(p13, p14)
		if not p14 then
			error("Task cannot be false or nil", 2)
		end
		p13[#p13._tasks + 1] = p14
		if type(p14) == "table" and not p14.Destroy then
			warn("[Maid.Add] - Gave table task without .Destroy\n\n" .. debug.traceback())
		end
		return p14
	end,
	["GiveTask"] = function(p15, p16)
		if not p16 then
			error("Task cannot be false or nil", 2)
		end
		local v17 = #p15._tasks + 1
		p15[v17] = p16
		if type(p16) == "table" and not p16.Destroy then
			warn("[Maid.GiveTask] - Gave table task without .Destroy\n\n" .. debug.traceback())
		end
		return v17
	end,
	["GivePromise"] = function(p_u_18, p19)
		if not p19:IsPending() then
			return p19
		end
		local v20 = p19.resolved(p19)
		local v_u_21 = p_u_18:GiveTask(v20)
		v20:Finally(function()
			-- upvalues: (copy) p_u_18, (copy) v_u_21
			p_u_18[v_u_21] = nil
		end)
		return v20
	end,
	["DoCleaning"] = function(p22)
		local v23 = p22._tasks
		for v24, v25 in v23 do
			if typeof(v25) == "RBXScriptConnection" then
				v23[v24] = nil
				v25:Disconnect()
			end
		end
		local v26, v_u_27 = next(v23)
		while true do
			if v_u_27 == nil then
				return
			end
			v23[v26] = nil
			if typeof(v_u_27) ~= "function" then
				break
			end
			v_u_27()
			::l9::
			v26, v_u_27 = next(v23)
		end
		if typeof(v_u_27) == "table" then
			local v28 = v_u_27.Destroy
			if type(v28) == "function" then
				v_u_27:Destroy()
				goto l9
			end
		end
		if typeof(v_u_27) == "Instance" then
			v_u_27:Destroy()
		elseif typeof(v_u_27) == "thread" then
			local v29
			if coroutine.running() == v_u_27 then
				v29 = nil
			else
				v29 = pcall(function()
					-- upvalues: (ref) v_u_27
					task.cancel(v_u_27)
				end)
			end
			if not v29 then
				task.defer(function()
					-- upvalues: (copy) v_u_27
					task.cancel(v_u_27)
				end)
			end
		elseif typeof(v_u_27) == "RBXScriptConnection" then
			v_u_27:Disconnect()
		end
		goto l9
	end
}
v_u_30.Destroy = v_u_30.DoCleaning
return v_u_30