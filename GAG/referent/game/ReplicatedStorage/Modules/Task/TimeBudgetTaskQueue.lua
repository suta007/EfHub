local v1 = game:GetService("ReplicatedStorage")
local v_u_2 = require(v1.Modules.Task)
local v_u_3 = {}
v_u_3.__index = v_u_3
function v_u_3.new(p4, p5)
	-- upvalues: (copy) v_u_3
	local v6 = p4 > 0
	assert(v6, "TimeBudget must be greater than 0")
	local v7 = v_u_3
	local v8 = setmetatable({}, v7)
	v8._timeBudget = p4
	v8._concurrentLimit = p5 or (1 / 0)
	v8._queue = {}
	v8._runningTasks = {}
	v8._isRunning = true
	v8._processingThread = nil
	v8:_startProcessing()
	return v8
end
function v_u_3.Enqueue(p9, p10)
	if p9._isRunning then
		local v11 = p9._queue
		table.insert(v11, p10)
	else
		warn("TimeBudgetTaskQueue: Cannot enqueue task - queue is stopped")
	end
end
function v_u_3.EnqueueNew(p12, p13, ...)
	-- upvalues: (copy) v_u_2
	local v14 = v_u_2.new(p13, ...)
	p12:Enqueue(v14)
	return v14
end
function v_u_3.Clear(p15)
	table.clear(p15._queue)
end
function v_u_3.GetQueueSize(p16)
	return #p16._queue
end
function v_u_3.GetPendingCount(p17)
	local v18 = 0
	for _, v19 in ipairs(p17._queue) do
		if v19:GetStatus() == "Pending" then
			v18 = v18 + 1
		end
	end
	return v18
end
function v_u_3.GetRunningCount(p20)
	return #p20._runningTasks
end
function v_u_3.IsRunning(p21)
	return p21._isRunning
end
function v_u_3.Stop(p22)
	p22._isRunning = false
end
function v_u_3.Resume(p23)
	if not p23._isRunning then
		p23._isRunning = true
		if not p23._processingThread then
			p23:_startProcessing()
		end
	end
end
function v_u_3.SetTimeBudget(p24, p25)
	local v26 = p25 > 0
	assert(v26, "TimeBudget must be greater than 0")
	p24._timeBudget = p25
end
function v_u_3.GetTimeBudget(p27)
	return p27._timeBudget
end
function v_u_3.Destroy(p28)
	p28._isRunning = false
	if p28._processingThread then
		task.cancel(p28._processingThread)
		p28._processingThread = nil
	end
	for _, v29 in p28._queue do
		v29:Cancel()
	end
	for _, v30 in p28._runningTasks do
		v30:Cancel()
	end
	table.clear(p28._queue)
	table.clear(p28._runningTasks)
end
function v_u_3._canStartTask(p31)
	return #p31._runningTasks < p31._concurrentLimit
end
function v_u_3._removeRunningTask(p32, p33)
	for v34, v35 in ipairs(p32._runningTasks) do
		if v35 == p33 then
			table.remove(p32._runningTasks, v34)
			return
		end
	end
end
function v_u_3._startProcessing(p_u_36)
	p_u_36._processingThread = task.spawn(function()
		-- upvalues: (copy) p_u_36
		while p_u_36._isRunning do
			local v37 = os.clock()
			local v38 = 0
			while p_u_36._isRunning and (#p_u_36._queue > 0 and (v38 < p_u_36._timeBudget and p_u_36:_canStartTask())) do
				local v_u_39 = table.remove(p_u_36._queue, 1)
				if v_u_39 then
					local v40 = p_u_36._runningTasks
					table.insert(v40, v_u_39)
					os.clock()
					v_u_39:Start()
					v38 = os.clock() - v37
					task.spawn(function()
						-- upvalues: (copy) v_u_39, (ref) p_u_36
						v_u_39:Await()
						p_u_36:_removeRunningTask(v_u_39)
					end)
				end
			end
			task.wait()
		end
		p_u_36._processingThread = nil
	end)
end
return v_u_3