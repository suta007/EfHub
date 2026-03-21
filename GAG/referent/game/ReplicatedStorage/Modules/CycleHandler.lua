local v1 = game:GetService("ReplicatedStorage")
local v_u_2 = game:GetService("RunService")
local v_u_3 = require(v1.Modules.Signal)
local v_u_4 = v1.GameEvents.CycleHandler.CycleForceStarted
local v_u_5 = v1.GameEvents.CycleHandler.CycleForceEnded
local v_u_6 = v1.GameEvents.CycleHandler.CycleForceStateCleared
local v_u_7 = v1:FindFirstChild("EventTimingStorage")
local v_u_8 = workspace:FindFirstChild("Interaction") or workspace
local v_u_9 = {}
v_u_9.__index = v_u_9
local v_u_10 = {}
function v_u_9.getAllHandlers()
	-- upvalues: (copy) v_u_10
	return v_u_10
end
function v_u_9.new(p11)
	-- upvalues: (copy) v_u_10, (copy) v_u_3, (copy) v_u_9
	local v12 = p11.TimeOffset or 0
	if p11.Duration > p11.Interval then
		error((("[CycleHandler] Handler %* is misconfigured: Duration is greater than Interval"):format(p11.Name)))
	end
	if v_u_10[p11.Name] then
		error((("[CycleHandler] Handler with name %* already exists"):format(p11.Name)))
	end
	local v13 = {
		["Name"] = p11.Name,
		["Interval"] = p11.Interval,
		["Duration"] = p11.Duration,
		["TimeOffset"] = v12,
		["EventFolder"] = p11.EventFolder,
		["FolderMoveMode"] = p11.FolderMoveMode or "ServerOnly",
		["PrintDebug"] = p11.PrintDebug or "None",
		["DisableCommandAutocomplete"] = p11.DisableCommandAutocomplete,
		["_isRunning"] = false,
		["_isEventActive"] = false,
		["_isForced"] = false,
		["_isForcedStop"] = false,
		["_forcedStartTime"] = nil,
		["_forcedDuration"] = nil,
		["_currentCycle"] = -1,
		["_checkThread"] = nil,
		["_endEventThread"] = nil,
		["_forcedStopEndThread"] = nil,
		["_effectiveTimeOffset"] = v12,
		["_startTime"] = 0,
		["EventStart"] = v_u_3.new(),
		["EventEnd"] = v_u_3.new(),
		["IntervalChanged"] = v_u_3.new()
	}
	local v14 = v_u_9
	local v15 = setmetatable(v13, v14)
	v_u_10[v15.Name] = v15
	return v15
end
function v_u_9._print(p16, p17)
	-- upvalues: (copy) v_u_2
	if p16.PrintDebug == "None" then
		return
	elseif p16.PrintDebug == "ServerOnly" and v_u_2:IsServer() then
		print("[CycleHandler] " .. p17)
		return
	elseif p16.PrintDebug == "ClientOnly" and v_u_2:IsClient() then
		print("[CycleHandler] " .. p17)
	elseif p16.PrintDebug == "ServerClient" then
		print("[CycleHandler] " .. p17)
	end
end
function v_u_9.GetCycleAt(p18, p19)
	if p18.Interval <= 0 then
		return 0
	end
	local v20 = (p19 - p18._startTime) / p18.Interval
	return math.floor(v20)
end
function v_u_9.GetCurrentCycle(p21)
	return p21:GetCycleAt(workspace:GetServerTimeNow())
end
function v_u_9.IsCycleActive(p22)
	return p22._isEventActive
end
function v_u_9.IsForced(p23)
	return p23._isForced or p23._isForcedStop
end
function v_u_9.GetRunInfo(p24, p25)
	if p24.Interval <= 0 or p25 < 0 then
		return {
			["Cycle"] = p25,
			["StartTime"] = 0,
			["EndTime"] = 0,
			["IsActive"] = false,
			["TimeUntilStart"] = nil,
			["TimeUntilEnd"] = nil,
			["Progress"] = nil
		}
	end
	local v26 = p24._startTime + p25 * p24.Interval + p24._effectiveTimeOffset
	local v27 = v26 + p24.Duration
	local v28 = workspace:GetServerTimeNow()
	local v29
	if v26 <= v28 then
		v29 = v28 < v27
	else
		v29 = false
	end
	local v30 = nil
	local v31 = nil
	local v32 = nil
	if v29 then
		v31 = v27 - v28
		v32 = (v28 - v26) / p24.Duration
	elseif v28 < v26 then
		v30 = v26 - v28
	else
		v30 = nil
	end
	return {
		["Cycle"] = p25,
		["StartTime"] = v26,
		["EndTime"] = v27,
		["IsActive"] = v29,
		["TimeUntilStart"] = v30,
		["TimeUntilEnd"] = v31,
		["Progress"] = v32
	}
end
function v_u_9.GetCurrentRunInfo(p33)
	local v34 = p33:GetRunInfo(p33:GetCurrentCycle())
	if p33._isForcedStop then
		return {
			["Cycle"] = v34.Cycle,
			["StartTime"] = v34.StartTime,
			["EndTime"] = v34.EndTime,
			["IsActive"] = false,
			["TimeUntilStart"] = nil,
			["TimeUntilEnd"] = nil,
			["Progress"] = nil
		}
	end
	if not p33._isForced then
		return v34
	end
	if not (p33._isEventActive and (p33._forcedStartTime and p33._forcedDuration)) then
		return p33._isEventActive and {
			["Cycle"] = v34.Cycle,
			["StartTime"] = v34.StartTime,
			["EndTime"] = v34.EndTime,
			["IsActive"] = true,
			["TimeUntilStart"] = nil,
			["TimeUntilEnd"] = nil,
			["Progress"] = nil
		} or v34
	end
	local v35 = workspace:GetServerTimeNow() - p33._forcedStartTime
	local v36 = p33._forcedDuration - v35
	local v37 = math.max(0, v36)
	local v38 = v35 / p33._forcedDuration
	local v39 = math.clamp(v38, 0, 1)
	local v40 = p33._forcedStartTime + p33._forcedDuration
	return {
		["Cycle"] = v34.Cycle,
		["StartTime"] = p33._forcedStartTime,
		["EndTime"] = v40,
		["IsActive"] = true,
		["TimeUntilStart"] = nil,
		["TimeUntilEnd"] = v37,
		["Progress"] = v39
	}
end
function v_u_9.GetRunInfoAt(p41, p42)
	return p41:GetRunInfo((p41:GetCycleAt(p42)))
end
function v_u_9._moveFolderToWorkspace(p43)
	-- upvalues: (copy) v_u_2, (copy) v_u_8
	if p43.EventFolder then
		if ((p43.FolderMoveMode == "ServerOnly" and v_u_2:IsServer() or p43.FolderMoveMode == "ClientOnly" and v_u_2:IsClient()) and true or (p43.FolderMoveMode == "ServerClient" and true or false)) and p43.EventFolder.Parent ~= v_u_8 then
			p43:_print((("[%*] Moving folder to workspace"):format(p43.Name)))
			p43.EventFolder.Parent = v_u_8
		end
	end
end
function v_u_9._moveFolderToStorage(p44)
	-- upvalues: (copy) v_u_7, (copy) v_u_2
	if p44.EventFolder and v_u_7 then
		if ((p44.FolderMoveMode == "ServerOnly" and v_u_2:IsServer() or p44.FolderMoveMode == "ClientOnly" and v_u_2:IsClient()) and true or (p44.FolderMoveMode == "ServerClient" and true or false)) and p44.EventFolder.Parent ~= v_u_7 then
			p44:_print((("[%*] Moving folder to storage"):format(p44.Name)))
			p44.EventFolder.Parent = v_u_7
		end
	end
end
function v_u_9._startEvent(p45, p46)
	if p45._isEventActive then
		p45:_print((("[%*] Event already active"):format(p45.Name)))
	else
		p45._isEventActive = true
		if p46 then
			p45._isForced = true
		end
		p45:_print((("[%*] Event starting%*"):format(p45.Name, p46 and " (FORCED)" or "")))
		p45:_moveFolderToWorkspace()
		p45.EventStart:Fire()
	end
end
function v_u_9._endEvent(p47, p48)
	if p47._isEventActive then
		p47._isEventActive = false
		if p48 then
			if p47._isForced then
				p47._isForced = false
				p47._forcedStartTime = nil
				p47._forcedDuration = nil
			end
		elseif p47._isForced then
			p47._isForced = false
			p47._forcedStartTime = nil
			p47._forcedDuration = nil
		end
		p47:_print((("[%*] Event ending%*"):format(p47.Name, p48 and " (FORCED)" or "")))
		p47:_moveFolderToStorage()
		if p47._endEventThread then
			pcall(task.cancel, p47._endEventThread)
			p47._endEventThread = nil
		end
		p47.EventEnd:Fire()
	else
		p47:_print((("[%*] Event not active, cannot end"):format(p47.Name)))
	end
end
function v_u_9._checkCycle(p49)
	while p49._isRunning do
		local v50 = p49:GetCurrentCycle()
		local v51 = p49:GetCurrentRunInfo()
		if v50 ~= p49._currentCycle then
			local v52 = p49._currentCycle
			p49._currentCycle = v50
			if v52 >= 0 then
				p49:_print((("[%*] Cycle changed: %* -> %*"):format(p49.Name, v52, v50)))
				p49.IntervalChanged:Fire(v50, v52)
			end
		end
		if p49._isForced or p49._isForcedStop then
			p49:_print((("[%*] In forced mode - ignoring natural cycle (Active: %*, ForcedStop: %*)"):format(p49.Name, p49._isEventActive, p49._isForcedStop)))
		elseif v51.IsActive and not p49._isEventActive then
			p49:_startEvent(false)
		elseif not v51.IsActive and p49._isEventActive then
			p49:_endEvent(false)
		end
		task.wait(1)
	end
end
function v_u_9.Start(p_u_53, p54)
	if p_u_53._isRunning then
		warn((("[%*] CycleHandler already running"):format(p_u_53.Name)))
	else
		if p54 and p54 > 0 then
			p_u_53._startTime = p54 + p_u_53.TimeOffset
		else
			p_u_53._startTime = p_u_53.TimeOffset
		end
		p_u_53._effectiveTimeOffset = 0
		p_u_53:_print((("[%*] CycleHandler starting (Interval: %*s, Duration: %*s, TimeOffset: %*s, StartTime: %*)"):format(p_u_53.Name, p_u_53.Interval, p_u_53.Duration, p_u_53.TimeOffset, p_u_53._startTime)))
		p_u_53._isRunning = true
		p_u_53._currentCycle = p_u_53:GetCurrentCycle()
		if p_u_53:GetCurrentRunInfo().IsActive then
			p_u_53:_startEvent(false)
		else
			p_u_53:_moveFolderToStorage()
		end
		p_u_53._checkThread = task.spawn(function()
			-- upvalues: (copy) p_u_53
			p_u_53:_checkCycle()
		end)
	end
end
function v_u_9.Stop(p55)
	if p55._isRunning then
		p55:_print((("[%*] CycleHandler stopping"):format(p55.Name)))
		p55._isRunning = false
		if p55._isEventActive then
			p55:_endEvent(true)
		end
		if p55._checkThread then
			pcall(task.cancel, p55._checkThread)
			p55._checkThread = nil
		end
		p55._currentCycle = -1
		p55._isForced = false
		p55._isForcedStop = false
		p55._forcedStartTime = nil
		p55._forcedDuration = nil
	end
end
function v_u_9.ForceStart(p_u_56, p57)
	-- upvalues: (copy) v_u_2, (copy) v_u_4
	if p_u_56._isRunning then
		if p_u_56._isForcedStop then
			p_u_56._isForcedStop = false
			if p_u_56._forcedStopEndThread then
				pcall(task.cancel, p_u_56._forcedStopEndThread)
				p_u_56._forcedStopEndThread = nil
			end
		end
		local v58 = p57 or p_u_56.Duration
		p_u_56._forcedStartTime = workspace:GetServerTimeNow()
		p_u_56._forcedDuration = v58
		p_u_56:_print((("[%*] Force starting event for %*s"):format(p_u_56.Name, v58)))
		p_u_56:_startEvent(true)
		if v_u_2:IsServer() then
			v_u_4:FireAllClients(p_u_56.Name, v58)
		end
		if v58 and v58 > 0 then
			p_u_56._endEventThread = task.delay(v58, function()
				-- upvalues: (copy) p_u_56
				p_u_56:_endEvent(true)
				p_u_56._forcedStartTime = nil
				p_u_56._forcedDuration = nil
			end)
		end
	end
end
function v_u_9.ForceEnd(p_u_59, p60)
	-- upvalues: (copy) v_u_2, (copy) v_u_5
	if p_u_59._isRunning then
		p_u_59:_print((("[%*] Force ending event%*"):format(p_u_59.Name, not p60 and " until next cycle" or (" for %*s"):format(p60))))
		if p_u_59._isForced then
			p_u_59._isForced = false
			p_u_59._forcedStartTime = nil
			p_u_59._forcedDuration = nil
			if p_u_59._endEventThread then
				pcall(task.cancel, p_u_59._endEventThread)
				p_u_59._endEventThread = nil
			end
		end
		if p_u_59._isEventActive then
			p_u_59:_endEvent(true)
		end
		p_u_59._isForcedStop = true
		if v_u_2:IsServer() then
			v_u_5:FireAllClients(p_u_59.Name)
		end
		if not p60 or p60 <= 0 then
			local v61 = workspace:GetServerTimeNow()
			p60 = p_u_59:GetRunInfo(p_u_59:GetCurrentCycle() + 1).StartTime - v61
		end
		if p60 > 0 then
			p_u_59._forcedStopEndThread = task.delay(p60, function()
				-- upvalues: (copy) p_u_59
				p_u_59:_print((("[%*] Exiting forced stop mode"):format(p_u_59.Name)))
				p_u_59._isForcedStop = false
				p_u_59._forcedStopEndThread = nil
				if p_u_59:GetCurrentRunInfo().IsActive and not p_u_59._isEventActive then
					p_u_59:_startEvent(false)
				end
			end)
		end
	end
end
function v_u_9.ClearForced(p62)
	-- upvalues: (copy) v_u_2, (copy) v_u_6
	if p62._isForced or p62._isForcedStop then
		p62:_print((("[%*] Clearing forced mode, returning to natural cycle"):format(p62.Name)))
		p62._isForced = false
		p62._isForcedStop = false
		p62._forcedStartTime = nil
		p62._forcedDuration = nil
		if p62._endEventThread then
			pcall(task.cancel, p62._endEventThread)
			p62._endEventThread = nil
		end
		if p62._forcedStopEndThread then
			pcall(task.cancel, p62._forcedStopEndThread)
			p62._forcedStopEndThread = nil
		end
		local v63 = p62:GetRunInfo(p62:GetCurrentCycle())
		if v63.IsActive and not p62._isEventActive then
			p62:_startEvent(false)
		elseif not v63.IsActive and p62._isEventActive then
			p62:_endEvent(false)
		end
		if v_u_2:IsServer() then
			v_u_6:FireAllClients(p62.Name)
		end
	end
end
function v_u_9.GetTimeRemaining(p64)
	if p64._isEventActive then
		return p64:GetCurrentRunInfo().TimeUntilEnd
	else
		return nil
	end
end
function v_u_9.GetTimeUntilNext(p65)
	if p65._isForcedStop then
		return nil
	elseif p65._isForced and (p65._isEventActive and not p65._endEventThread) then
		return 999999999
	else
		local v66 = p65:GetCurrentRunInfo()
		if v66.IsActive then
			return p65:GetRunInfo(p65:GetCurrentCycle() + 1).TimeUntilStart
		elseif v66.TimeUntilStart then
			return v66.TimeUntilStart
		else
			return p65:GetRunInfo(p65:GetCurrentCycle() + 1).TimeUntilStart
		end
	end
end
function v_u_9.IsRunning(p67)
	return p67._isRunning
end
function v_u_9.Destroy(p68)
	-- upvalues: (copy) v_u_10
	p68:Stop()
	p68.EventStart:Destroy()
	p68.EventEnd:Destroy()
	p68.IntervalChanged:Destroy()
	v_u_10[p68.Name] = nil
end
if v_u_2:IsClient() then
	v_u_4.OnClientEvent:Connect(function(p69, p70)
		-- upvalues: (copy) v_u_10
		local v71 = v_u_10[p69]
		if v71 then
			v71:ForceStart(p70 or nil)
		end
	end)
	v_u_5.OnClientEvent:Connect(function(p72)
		-- upvalues: (copy) v_u_10
		local v73 = v_u_10[p72]
		if v73 then
			v73:ForceEnd()
		end
	end)
	v_u_6.OnClientEvent:Connect(function(p74)
		-- upvalues: (copy) v_u_10
		local v75 = v_u_10[p74]
		if v75 then
			v75:ClearForced()
		end
	end)
end
return v_u_9