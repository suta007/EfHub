local getgenv = (getfenv() :: any).getgenv
local EfTasks = {}
local ActiveTasks = {}
local reg

function EfTasks.Initialize(registry)
	reg = registry
	--reg.ActiveTasks = ActiveTasks
end

function EfTasks.ToggleTask(taskName, enabled, funcBody)
	local Options = reg.Options
	if enabled then
		if ActiveTasks[taskName] then
			return
		end
		ActiveTasks[taskName] = task.spawn(function()
			while true do
				local ok, err = pcall(funcBody)
				if not ok then
					getgenv().fLog("🔴 Task '" .. taskName .. "' error: " .. tostring(err))
				end
				task.wait(0.1)
			end
		end)
	else
		if ActiveTasks[taskName] then
			task.cancel(ActiveTasks[taskName])
			ActiveTasks[taskName] = nil
		end
	end
end

return EfTasks
