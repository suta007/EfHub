local v_u_1 = require(script.Parent.Promise)
local v_u_2 = {}
v_u_2.__index = v_u_2
function v_u_2.__tostring(_)
	return "Cleaner"
end
local v_u_3 = newproxy(false)
local v_u_4 = {
	["INVALID_LINK_INSTANCES_ITEM"] = "Invalid item argument to \'Cleaner.LinkToInstances\' (pass Arrays or Instances ONLY) Traceback: %*",
	["INVALID_LINK_INSTANCE_ERROR"] = "Invalid item argument #1 to \'Cleaner.LinkToInstance\' (pass Instances ONLY) Traceback: %*",
	["INVALID_METHOD_NAME"] = "Object is a %* and as such expected `true?` for the method name and instead got %*. Traceback: %*",
	["METHOD_NOT_FOUND_ERROR"] = "Object %* doesn\'t have method %*, are you sure you want to add it? Traceback: %*",
	["NOT_A_PROMISE"] = "Invalid argument #1 to \'Cleaner:AddPromise\' (Promise expected, got %* (%*)) Traceback: %*",
	["INVALID_OBJECT"] = "Invalid argument #1 to \'Cleaner.Add\' (Object expected, got nil) Traceback: %*",
	["INVALID_ADD_INDEX"] = "Invalid argument #3 to \'Cleaner.Add\' (not recommended to use number) Traceback: %*",
	["INVALID_REMOVE_INDEX"] = "Invalid argument #1 to \'Cleaner.Remove\' (Index expected, got nil) Traceback: %*"
}
local v_u_5 = {
	["thread"] = true,
	["function"] = true,
	["RBXScriptConnection"] = "Disconnect"
}
function v_u_2.new()
	-- upvalues: (copy) v_u_2
	local v6 = v_u_2
	local v7 = setmetatable({}, v6)
	v7.isDestroying = false
	v7._tasks = {}
	return v7
end
function v_u_2.Get(p8, p9)
	local v10 = p8._tasks[p9]
	if v10 and v10.object then
		return v10.object
	else
		return nil
	end
end
function v_u_2.GetAll(p11)
	local v12 = p11._tasks
	local v13 = {}
	for v14, v15 in next, v12 do
		if v15.object then
			v13[v14] = v15.object
		end
	end
	return table.freeze(v13)
end
function v_u_2.Is(p16)
	-- upvalues: (copy) v_u_2
	local v17
	if type(p16) == "table" and getmetatable(p16) == v_u_2 then
		v17 = not p16.isDestroying
	else
		v17 = false
	end
	return v17
end
function v_u_2.AddPromise(p_u_18, p_u_19, p20)
	-- upvalues: (copy) v_u_1
	if p_u_19:getStatus() ~= v_u_1.Status.Started then
		return p_u_19
	end
	local v_u_21 = p20 or newproxy(false)
	local v24 = p_u_18:Add(v_u_1.new(function(p22, _, p23)
		-- upvalues: (copy) p_u_19
		if p23(function()
			-- upvalues: (ref) p_u_19
			p_u_19:cancel()
			return nil
		end) then
			return nil
		end
		p22(p_u_19)
		return nil
	end), "cancel", v_u_21)
	v24:finally(function()
		-- upvalues: (copy) p_u_18, (copy) v_u_21
		p_u_18:Remove(v_u_21)
	end)
	return v24
end
function v_u_2.Add(p25, p26, p27, p28)
	-- upvalues: (copy) v_u_4, (copy) v_u_5
	if not p26 then
		error(v_u_4.INVALID_OBJECT:format(debug.traceback(nil, 2)))
	end
	if type(p28) == "number" then
		warn(v_u_4.INVALID_ADD_INDEX:format(debug.traceback(nil, 2)))
	end
	local v29 = typeof(p26)
	local v30 = p27 or (v_u_5[v29] or "Destroy")
	if v29 == "table" and p26 == p25 then
		error("CANNOT ADD YOURSELF TO THE CLEANER, WHAT\'RE YOU DOING??")
	end
	if v29 == "function" or v29 == "thread" then
		if v30 ~= true then
			warn(v_u_4.INVALID_METHOD_NAME:format(v29, ("%*"):format(v30), debug.traceback(nil, 2)))
		end
	elseif not p26[v30] then
		warn(v_u_4.METHOD_NOT_FOUND_ERROR:format(("%*"):format(p26), ("%*"):format(v30), debug.traceback(nil, 2)))
	end
	local v31 = {
		["object"] = p26,
		["classifier"] = v30
	}
	if not p28 then
		local v32 = #p25._tasks + 1
		p25._tasks[v32] = v31
		return p26
	end
	p25:Remove(p28)
	p25._tasks[p28] = v31
	if p25.isDestroying then
		p25:Remove(p28)
	end
	return p26
end
function v_u_2.Remove(p33, p34)
	-- upvalues: (copy) v_u_4, (copy) v_u_1
	if not p34 then
		error(v_u_4.INVALID_REMOVE_INDEX:format(debug.traceback(nil, 2)))
	end
	local v35 = p33._tasks
	local v36 = v35[p34]
	if v36 then
		local v37 = v36.classifier
		local v_u_38 = v36.object
		if v37 == true then
			if type(v_u_38) == "function" then
				local v39, v40 = v_u_1.CreateErrorTracedXpcall(debug.traceback(), v_u_38)
				if not v39 then
					warn(v40)
				end
			else
				local v41
				if coroutine.running() == v_u_38 then
					v41 = nil
				else
					v41 = pcall(function()
						-- upvalues: (copy) v_u_38
						task.cancel(v_u_38)
					end)
				end
				if not v41 then
					task.defer(function()
						-- upvalues: (copy) v_u_38
						if v_u_38 then
							task.cancel(v_u_38)
						end
					end)
				end
			end
		else
			local v42 = v_u_38[v37]
			if v42 then
				if v37 == "Destroy" and typeof(v_u_38) == "Instance" then
					pcall(v42, v_u_38)
				else
					v42(v_u_38)
				end
			end
		end
		v35[p34] = nil
	end
	return nil
end
function v_u_2.RemoveList(p43, ...)
	for _, v44 in ipairs({ ... }) do
		if type(v44) == "string" then
			p43:Remove(v44)
		else
			for _, v45 in ipairs(v44) do
				p43:Remove(v45)
			end
		end
	end
	return nil
end
function v_u_2.RemoveNoClean(p46, p47)
	-- upvalues: (copy) v_u_4
	if not p47 then
		error(v_u_4.INVALID_REMOVE_INDEX:format(debug.traceback(nil, 2)))
	end
	p46._tasks[p47] = nil
	return nil
end
function v_u_2.RemoveListNoClean(p48, ...)
	for _, v49 in ipairs({ ... }) do
		if type(v49) == "string" then
			p48:RemoveNoClean(v49)
		else
			for _, v50 in ipairs(v49) do
				p48:RemoveNoClean(v50)
			end
		end
	end
	return nil
end
function v_u_2.LinkToInstance(p_u_51, p_u_52, p53)
	-- upvalues: (copy) v_u_4, (copy) v_u_3, (copy) v_u_2
	if p_u_51.isDestroying then
		return function()
			return nil
		end
	end
	if typeof(p_u_52) ~= "Instance" then
		error(v_u_4.INVALID_LINK_INSTANCE_ERROR:format(debug.traceback(nil, 2)))
	end
	local v_u_54
	if p53 then
		v_u_54 = newproxy(false)
	else
		v_u_54 = v_u_3
	end
	local v55 = v_u_2.new()
	local function v56()
		-- upvalues: (ref) v_u_2, (copy) p_u_51, (copy) v_u_54
		if v_u_2.Is(p_u_51) then
			p_u_51:Remove(v_u_54)
		end
		return nil
	end
	local function v57()
		-- upvalues: (copy) p_u_52, (copy) p_u_51
		if p_u_52.Parent == nil then
			p_u_51:Destroy()
		end
	end
	v55:Add(p_u_52:GetPropertyChangedSignal("Parent"):Connect(v57), "Disconnect")
	v55:Add(p_u_52.Destroying:Connect(v57), "Disconnect")
	p_u_51:Add(v55, "Destroy", v_u_54)
	return v56
end
function v_u_2.LinkToInstances(p_u_58, ...)
	-- upvalues: (copy) v_u_2, (copy) v_u_4
	if p_u_58.isDestroying then
		return function()
			return nil
		end
	end
	local v_u_59 = v_u_2.new()
	local function v_u_62(p60)
		-- upvalues: (copy) v_u_59, (copy) p_u_58, (copy) v_u_62, (ref) v_u_4
		for _, v61 in p60 do
			if typeof(v61) == "Instance" then
				v_u_59:Add(p_u_58:LinkToInstance(v61, true))
			elseif typeof(v61) == "table" then
				v_u_62(v61)
			else
				warn(v_u_4.INVALID_LINK_INSTANCES_ITEM:format(debug.traceback(nil, 2)))
			end
		end
	end
	v_u_62({ ... })
	p_u_58:Add(v_u_59)
	return function()
		-- upvalues: (ref) v_u_2, (copy) v_u_59
		if v_u_2.Is(v_u_59) then
			v_u_59:Destroy()
		end
		return nil
	end
end
function v_u_2.Cleanup(p63)
	local v64 = p63._tasks
	for v65, v66 in pairs(p63._tasks) do
		if v66.classifier == "Disconnect" then
			p63._tasks[v65] = nil
			v66.object:Disconnect()
		end
	end
	local v67, v68 = next(v64)
	local v69 = 0
	while v68 ~= nil do
		p63:Remove(v67)
		v67, v68 = next(v64)
		v69 = v69 + 1
		if v69 >= 50 then
			task.wait()
		end
	end
	return nil
end
function v_u_2.Destroy(p70, p71)
	if p70.isDestroying or not p70.Cleanup then
		return nil
	else
		p70.isDestroying = true
		if p71 then
			task.spawn(p70.Cleanup, p70)
			return nil
		else
			p70:Cleanup()
			return nil
		end
	end
end
v_u_2.instanceof = v_u_2.Is
return v_u_2