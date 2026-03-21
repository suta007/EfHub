local v_u_1 = require(script.Parent.Parent.Parent.Signal)
require(script.Parent.Types)
local v_u_2 = require(script.Parent.Utils)
local v_u_3 = {}
v_u_3.__index = v_u_3
function v_u_3.new()
	-- upvalues: (copy) v_u_3
	local v4 = v_u_3
	return setmetatable({
		["_containers"] = {}
	}, v4)
end
function v_u_3._getContainer(p5, p6, p7)
	local v8 = p5._containers
	assert(v8, "You\'re trying to use a Replion that has been destroyed!")
	if p7 and not p5._containers[p6] then
		p5._containers[p6] = {}
	end
	return p5._containers[p6]
end
function v_u_3.Connect(p9, p10, p11, p12)
	-- upvalues: (copy) v_u_2
	if _G.__DEV__ and not _G.__IGNORE_INSTANCES_WARNING__ then
		local v13 = false
		for _, v14 in v_u_2.getPathTable(p11) do
			if typeof(v14) == "Instance" then
				v13 = true
				break
			end
		end
		if v13 then
			local v15, v16 = debug.info(3, "sl")
			task.spawn(error, ("[Memory Leak Warning] Instance used as a Connection index at %*:%*. "):format(v15, v16) .. "Using Instances will cause memory leaks as Replion cannot automatically dispose of such connections. Consider using a string or number as your index to prevent this issue.")
		end
	end
	local v17 = p9:Get(p10, p11)
	return assert(v17, "Signal does not exist!"):Connect(p12)
end
function v_u_3.Get(p18, p19, p20, p21)
	-- upvalues: (copy) v_u_2, (copy) v_u_1
	local v22 = p21 == nil and true or p21
	local v23 = p18:_getContainer(p19, v22)
	if v23 then
		for _, v24 in v_u_2.getPathTable(p20) do
			if not v23[v24] then
				if not v22 then
					return nil
				end
				v23[v24] = {}
			end
			v23 = v23[v24]
			if not v23 then
				return nil
			end
		end
		if v22 and not v23.__signal then
			v23.__signal = v_u_1.new()
		end
		return v23.__signal
	end
end
function v_u_3.FireEvent(p25, p26, p27, ...)
	local v28 = p25:Get(p26, p27, false)
	if v28 then
		v28:Fire(...)
	end
end
function v_u_3.FireChange(p29, p30, p31, p32)
	-- upvalues: (copy) v_u_2
	if not (p29._containers and next(p29._containers)) then
		return
	end
	local v33 = v_u_2.getPathTable(p30)
	local v34 = #v33
	local v35 = p29._containers.onDescendantChange ~= nil
	for v36 = v34, 1, -1 do
		if v36 < v34 then
			v33[v36 + 1] = nil
		end
		local v37 = p29._containers.onChange
		for _, v38 in v33 do
			if not v37 then
				v37 = nil
				break
			end
			v37 = v37[v38]
		end
		local v39
		if v37 then
			v39 = v37.__signal
		else
			v39 = nil
		end
		local v40
		if v35 and v36 > 1 then
			local v41 = v33[v36]
			v33[v36] = nil
			local v42 = p29._containers.onDescendantChange
			for _, v43 in v33 do
				if not v42 then
					v42 = nil
					break
				end
				v42 = v42[v43]
			end
			if v42 then
				v40 = v42.__signal
			else
				v40 = nil
			end
			v33[v36] = v41
		else
			v40 = nil
		end
		if v39 or v40 then
			local v44 = p31
			for _, v45 in v33 do
				if not p31 then
					p31 = nil
					break
				end
				p31 = p31[v45]
			end
			local v46 = p32
			for _, v47 in v33 do
				if not p32 then
					p32 = nil
					break
				end
				p32 = p32[v47]
			end
			if v39 then
				v39:Fire(p31, p32)
			end
			if v40 then
				v40:Fire(table.clone(v33), p31, p32)
				p32 = v46
				p31 = v44
			else
				p32 = v46
				p31 = v44
			end
		end
	end
end
function v_u_3.Destroy(p48)
	local v49 = p48._containers
	assert(v49, "This Replion has already been destroyed!")
	local function v_u_52(p50)
		-- upvalues: (copy) v_u_52
		if p50.__signal then
			p50.__signal:Destroy()
			p50.__signal = nil
		end
		for _, v51 in p50 do
			v_u_52(v51)
		end
	end
	for _, v53 in p48._containers do
		if v53.__signal then
			v53.__signal:Destroy()
			v53.__signal = nil
		end
		for _, v54 in v53 do
			v_u_52(v54)
		end
	end
	p48._containers = nil
end
return v_u_3