local v1 = game:GetService("ReplicatedStorage")
local v_u_2 = require(v1.Modules.Signal)
local v_u_3 = {}
v_u_3.__index = v_u_3
function v_u_3.new(p4, ...)
	-- upvalues: (copy) v_u_3, (copy) v_u_2
	local v5 = v_u_3
	local v6 = setmetatable({}, v5)
	v6._func = p4
	v6._args = { ... }
	v6._status = "Pending"
	v6._thread = nil
	v6._result = nil
	v6._error = nil
	v6.OnCompleted = v_u_2.new()
	v6.OnFailed = v_u_2.new()
	v6.OnCancelled = v_u_2.new()
	return v6
end
function v_u_3.run(p7, ...)
	-- upvalues: (copy) v_u_3
	local v8 = v_u_3.new(p7, ...)
	v8:Start()
	return v8
end
function v_u_3.Start(p_u_9)
	if p_u_9._status ~= "Pending" then
		warn("Task cannot be started - current status:", p_u_9._status)
		return p_u_9
	end
	p_u_9._status = "Running"
	p_u_9._thread = task.spawn(function()
		-- upvalues: (copy) p_u_9
		if p_u_9._status == "Cancelled" then
			return
		else
			local v10 = xpcall
			local v11 = p_u_9._func
			local v12 = p_u_9._args
			local v14, v15 = v10(v11, function(p13)
				return debug.traceback(tostring(p13), 2)
			end, table.unpack(v12))
			if p_u_9._status ~= "Cancelled" then
				if v14 then
					p_u_9._status = "Completed"
					p_u_9._result = v15
					p_u_9.OnCompleted:Fire(v15)
				else
					p_u_9._status = "Failed"
					p_u_9._error = v15
					warn("Task failed with error:\n" .. p_u_9._error)
					p_u_9.OnFailed:Fire(p_u_9._error)
				end
				task.defer(function()
					-- upvalues: (ref) p_u_9
					task.wait(0.1)
					if p_u_9.OnCompleted and p_u_9.OnCompleted.Destroy then
						p_u_9.OnCompleted:Destroy()
					end
					if p_u_9.OnFailed and p_u_9.OnFailed.Destroy then
						p_u_9.OnFailed:Destroy()
					end
					if p_u_9.OnCancelled and p_u_9.OnCancelled.Destroy then
						p_u_9.OnCancelled:Destroy()
					end
				end)
			end
		end
	end)
	return p_u_9
end
function v_u_3.Cancel(p16)
	if p16._status == "Completed" or p16._status == "Failed" then
		return false
	end
	if p16._status == "Cancelled" then
		return false
	end
	p16._status = "Cancelled"
	if p16._thread then
		task.cancel(p16._thread)
	end
	p16.OnCancelled:Fire()
	if p16.OnCompleted and p16.OnCompleted.Destroy then
		p16.OnCompleted:Destroy()
	end
	if p16.OnFailed and p16.OnFailed.Destroy then
		p16.OnFailed:Destroy()
	end
	if p16.OnCancelled and p16.OnCancelled.Destroy then
		p16.OnCancelled:Destroy()
	end
	return true
end
function v_u_3.IsAlive(p17)
	return p17._status == "Pending" and true or p17._status == "Running"
end
function v_u_3.GetStatus(p18)
	return p18._status
end
function v_u_3.Await(p19)
	if p19._status == "Completed" then
		return p19._result
	end
	if p19._status == "Failed" or p19._status == "Cancelled" then
		return nil
	end
	local v_u_20 = false
	local v_u_21 = nil
	local v23 = p19.OnCompleted:Connect(function(p22)
		-- upvalues: (ref) v_u_21, (ref) v_u_20
		v_u_21 = p22
		v_u_20 = true
	end)
	local v24 = p19.OnFailed:Connect(function()
		-- upvalues: (ref) v_u_20
		v_u_20 = true
	end)
	local v25 = p19.OnCancelled:Connect(function()
		-- upvalues: (ref) v_u_20
		v_u_20 = true
	end)
	local v26 = v_u_21
	while not v_u_20 do
		task.wait()
	end
	v23:Disconnect()
	v24:Disconnect()
	v25:Disconnect()
	return v26
end
function v_u_3.Then(p27, p28)
	p27.OnCompleted:Connect(p28)
	return p27
end
function v_u_3.Catch(p29, p30)
	p29.OnFailed:Connect(p30)
	return p29
end
function v_u_3.Finally(p31, p32)
	p31.OnCompleted:Connect(p32)
	p31.OnFailed:Connect(p32)
	p31.OnCancelled:Connect(p32)
	return p31
end
function v_u_3.WhenAll(p_u_33)
	-- upvalues: (copy) v_u_3
	return v_u_3.run(function()
		-- upvalues: (copy) p_u_33
		local v_u_34 = table.create(#p_u_33)
		local v_u_35 = 0
		local v36 = #p_u_33
		if v36 == 0 then
			return v_u_34
		end
		for v_u_37, v_u_38 in p_u_33 do
			task.spawn(function()
				-- upvalues: (copy) v_u_34, (copy) v_u_37, (copy) v_u_38, (ref) v_u_35
				v_u_34[v_u_37] = v_u_38:Await()
				v_u_35 = v_u_35 + 1
			end)
		end
		while v_u_35 < v36 do
			task.wait()
		end
		return v_u_34
	end)
end
function v_u_3.WhenAny(p39)
	if #p39 == 0 then
		return nil
	end
	local v_u_40 = false
	local v_u_41 = nil
	for _, v_u_42 in ipairs(p39) do
		task.spawn(function()
			-- upvalues: (ref) v_u_40, (copy) v_u_42, (ref) v_u_41
			if not v_u_40 then
				local v43 = v_u_42:Await()
				if not v_u_40 then
					v_u_40 = true
					v_u_41 = v43
				end
			end
		end)
	end
	while not v_u_40 do
		task.wait()
	end
	return v_u_41
end
function v_u_3.Delay(p_u_44)
	-- upvalues: (copy) v_u_3
	return v_u_3.new(function()
		-- upvalues: (copy) p_u_44
		task.wait(p_u_44)
	end)
end
function v_u_3.FromTween(p_u_45)
	-- upvalues: (copy) v_u_3
	local v46 = v_u_3.new(function()
		-- upvalues: (copy) p_u_45
		if p_u_45.PlaybackState ~= Enum.PlaybackState.Completed then
			if p_u_45.PlaybackState ~= Enum.PlaybackState.Playing then
				p_u_45:Play()
			end
			p_u_45.Completed:Wait()
		end
	end)
	v46.OnCancelled:Connect(function()
		-- upvalues: (copy) p_u_45
		if p_u_45.PlaybackState == Enum.PlaybackState.Playing then
			p_u_45:Cancel()
		end
	end)
	if p_u_45.PlaybackState ~= Enum.PlaybackState.Begin then
		v46:Start()
	end
	return v46
end
function v_u_3.FromResult(p_u_47)
	-- upvalues: (copy) v_u_3
	local v48 = v_u_3.new(function()
		-- upvalues: (copy) p_u_47
		return p_u_47
	end)
	v48:Start()
	return v48
end
function v_u_3.StartAll(p49)
	for _, v50 in p49 do
		v50:Start()
	end
end
function v_u_3.RunSequence(p51)
	local v52 = {}
	for v53, v54 in ipairs(p51) do
		v52[v53] = v54():Await()
	end
	return v52
end
function v_u_3.CancelAll(p55)
	for _, v56 in ipairs(p55) do
		v56:Cancel()
	end
end
return v_u_3