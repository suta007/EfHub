local v1 = game:GetService("ReplicatedStorage")
local v_u_2 = require(v1.Modules.Task)
local v_u_3 = {}
v_u_3.__index = v_u_3
function v_u_3.new(p4, p5, p6)
	-- upvalues: (copy) v_u_3
	local v7 = p4 > 0
	assert(v7, "MaxInvocations must be greater than 0")
	local v8 = p5 > 0
	assert(v8, "TimeWindow must be greater than 0")
	local v9 = v_u_3
	local v10 = setmetatable({}, v9)
	v10._maxInvocations = p4
	v10._timeWindow = p5
	v10._concurrentLimit = p6 or p4
	v10._queue = {}
	v10._runningTasks = {}
	v10._invocationTimestamps = {}
	v10._isRunning = true
	v10._processingThread = nil
	v10:_startProcessing()
	return v10
end
function v_u_3.Enqueue(p11, p12)
	if p11._isRunning then
		local v13 = p11._queue
		table.insert(v13, p12)
	else
		warn("ThrottledTaskQueue: Cannot enqueue task - queue is stopped")
	end
end
function v_u_3.EnqueueNew(p14, p15, ...)
	-- upvalues: (copy) v_u_2
	local v16 = v_u_2.new(p15, ...)
	p14:Enqueue(v16)
	return v16
end
function v_u_3.Clear(p17)
	table.clear(p17._queue)
end
function v_u_3.GetQueueSize(p18)
	return #p18._queue
end
function v_u_3.GetPendingCount(p19)
	local v20 = 0
	for _, v21 in ipairs(p19._queue) do
		if v21:GetStatus() == "Pending" then
			v20 = v20 + 1
		end
	end
	return v20
end
function v_u_3.GetRunningCount(p22)
	return #p22._runningTasks
end
function v_u_3.IsRunning(p23)
	return p23._isRunning
end
function v_u_3.Stop(p24)
	p24._isRunning = false
end
function v_u_3.Resume(p25)
	if not p25._isRunning then
		p25._isRunning = true
		if not p25._processingThread then
			p25:_startProcessing()
		end
	end
end
function v_u_3.Destroy(p26)
	p26._isRunning = false
	if p26._processingThread then
		task.cancel(p26._processingThread)
		p26._processingThread = nil
	end
	for _, v27 in ipairs(p26._queue) do
		v27:Cancel()
	end
	for _, v28 in ipairs(p26._runningTasks) do
		v28:Cancel()
	end
	table.clear(p26._queue)
	table.clear(p26._runningTasks)
	table.clear(p26._invocationTimestamps)
end
function v_u_3._canStartTask(p29)
	if #p29._runningTasks >= p29._concurrentLimit then
		return false
	end
	local v30 = os.clock() - p29._timeWindow
	local v31 = 1
	while v31 <= #p29._invocationTimestamps do
		if p29._invocationTimestamps[v31] < v30 then
			table.remove(p29._invocationTimestamps, v31)
		else
			v31 = v31 + 1
		end
	end
	return #p29._invocationTimestamps < p29._maxInvocations
end
function v_u_3._recordInvocation(p32)
	local v33 = p32._invocationTimestamps
	local v34 = os.clock
	table.insert(v33, v34())
end
function v_u_3._removeRunningTask(p35, p36)
	for v37, v38 in ipairs(p35._runningTasks) do
		if v38 == p36 then
			table.remove(p35._runningTasks, v37)
			return
		end
	end
end
function v_u_3._startProcessing(p_u_39)
	p_u_39._processingThread = task.spawn(function()
		-- upvalues: (copy) p_u_39
		while true do
			if not p_u_39._isRunning then
				p_u_39._processingThread = nil
				return
			end
			if p_u_39._isRunning and (#p_u_39._queue > 0 and p_u_39:_canStartTask()) then
				break
			end
			task.wait(0.05)
		end
		local v_u_40 = table.remove(p_u_39._queue, 1)
		if v_u_40 then
			local v41 = p_u_39._runningTasks
			table.insert(v41, v_u_40)
			p_u_39:_recordInvocation()
			v_u_40:Start()
			task.spawn(function()
				-- upvalues: (copy) v_u_40, (ref) p_u_39
				v_u_40:Await()
				p_u_39:_removeRunningTask(v_u_40)
			end)
		end
		continue
	end)
end
return v_u_3