local v_u_1 = {
	["_canSafelyClose"] = true,
	["_endThread"] = false,
	["_isRunning"] = false,
	["_blocks"] = {},
	["_scheduledBlock"] = nil,
	["_hasScheduledBlockRun"] = true
}
local v_u_2 = require(script.Parent.Logger)
local v_u_3 = game:GetService("RunService")
local function v_u_11()
	-- upvalues: (copy) v_u_2, (copy) v_u_1, (copy) v_u_3
	task.spawn(function()
		-- upvalues: (ref) v_u_2, (ref) v_u_1
		v_u_2:d("Starting GA thread")
		while not v_u_1._endThread do
			v_u_1._canSafelyClose = false
			if #v_u_1._blocks ~= 0 then
				for _, v4 in pairs(v_u_1._blocks) do
					local v5, v6 = pcall(v4.block)
					if not v5 then
						v_u_2:e(v6)
					end
				end
				v_u_1._blocks = {}
			end
			local v7 = tick()
			local v8
			if v_u_1._hasScheduledBlockRun or (v_u_1._scheduledBlock == nil or v_u_1._scheduledBlock.deadline > v7) then
				v8 = nil
			else
				v_u_1._hasScheduledBlockRun = true
				v8 = v_u_1._scheduledBlock
			end
			if v8 ~= nil then
				local v9, v10 = pcall(v8.block)
				if not v9 then
					v_u_2:e(v10)
				end
			end
			v_u_1._canSafelyClose = true
			task.wait(1)
		end
		v_u_2:d("GA thread stopped")
	end)
	game:BindToClose(function()
		-- upvalues: (ref) v_u_3, (ref) v_u_1
		if not v_u_3:IsStudio() then
			task.wait(1)
			if not v_u_1._canSafelyClose then
				repeat
					task.wait()
				until v_u_1._canSafelyClose
			end
			task.wait(3)
		end
	end)
end
function v_u_1.scheduleTimer(p12, p13, p14)
	-- upvalues: (copy) v_u_11
	if not p12._endThread then
		if not p12._isRunning then
			p12._isRunning = true
			v_u_11()
		end
		local v15 = {
			["block"] = p14,
			["deadline"] = tick() + p13
		}
		if p12._hasScheduledBlockRun then
			p12._scheduledBlock = v15
			p12._hasScheduledBlockRun = false
		end
	end
end
function v_u_1.performTaskOnGAThread(p16, p17)
	-- upvalues: (copy) v_u_11
	if not p16._endThread then
		if not p16._isRunning then
			p16._isRunning = true
			v_u_11()
		end
		p16._blocks[#p16._blocks + 1] = {
			["block"] = p17
		}
	end
end
function v_u_1.stopThread(p18)
	p18._endThread = true
end
return v_u_1