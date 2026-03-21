local v_u_1 = game:GetService("ReplicatedStorage")
local v_u_2 = game:GetService("Players").LocalPlayer
local v_u_3 = require(v_u_1.Modules.Notification)
require(v_u_1.Modules.GetFarm)
local v_u_4 = require(v_u_1.Modules.TutorialController.TutorialUtils)
local v_u_5 = require(v_u_1.Arrow_Module)
return function()
	-- upvalues: (copy) v_u_5, (copy) v_u_2, (copy) v_u_3, (copy) v_u_4, (copy) v_u_1
	local v_u_6 = {}
	local v_u_24 = task.spawn(function()
		-- upvalues: (ref) v_u_5, (ref) v_u_2, (copy) v_u_6, (ref) v_u_3, (ref) v_u_4, (ref) v_u_1
		local v7 = workspace.Tutorial_Points.Tutorial_Point_1.Position
		local v_u_8 = v_u_5.GenerateArrow(v_u_2, v7, math.random(1, 1000000))
		local v9 = v_u_6
		table.insert(v9, v_u_8)
		local function v11()
			-- upvalues: (ref) v_u_6, (copy) v_u_8, (ref) v_u_5
			local v10 = table.find(v_u_6, v_u_8)
			if v10 then
				v_u_5.Remove_Arrow(v_u_8)
				table.remove(v_u_6, v10)
			end
		end
		local v12 = task.delay(5, function()
			-- upvalues: (ref) v_u_3
			v_u_3:CreateNotification("Go buy your first seed!")
		end)
		v_u_4.waitForSeed()
		if coroutine.status(v12) == "suspended" then
			task.cancel(v12)
		end
		v11()
		local v13 = v_u_4.waitForFarm()
		v_u_3:CreateNotification("Go plant your seed!")
		local v14 = (v13.Spawn_Point.CFrame * CFrame.new(0, 0, -10)).Position
		local v_u_15 = v_u_5.GenerateArrow(v_u_2, v14, math.random(1, 1000000))
		local v16 = v_u_6
		table.insert(v16, v_u_15)
		local function v18()
			-- upvalues: (ref) v_u_6, (copy) v_u_15, (ref) v_u_5
			local v17 = table.find(v_u_6, v_u_15)
			if v17 then
				v_u_5.Remove_Arrow(v_u_15)
				table.remove(v_u_6, v17)
			end
		end
		v_u_4.waitUntilSellableItem()
		v18()
		v_u_3:CreateNotification("Go sell your plant!")
		local v19 = workspace.Tutorial_Points.Tutorial_Point_2.Position
		local v_u_20 = v_u_5.GenerateArrow(v_u_2, v19, math.random(1, 1000000))
		local v21 = v_u_6
		table.insert(v21, v_u_20)
		local function v23()
			-- upvalues: (ref) v_u_6, (copy) v_u_20, (ref) v_u_5
			local v22 = table.find(v_u_6, v_u_20)
			if v22 then
				v_u_5.Remove_Arrow(v_u_20)
				table.remove(v_u_6, v22)
			end
		end
		v_u_4.waitUntilNoSellableItems()
		v23()
		v_u_1.GameEvents.SetTutorialFinished:FireServer()
	end)
	return function()
		-- upvalues: (copy) v_u_24, (copy) v_u_6, (ref) v_u_5
		if coroutine.status(v_u_24) == "suspended" then
			task.cancel(v_u_24)
		end
		for _, v25 in v_u_6 do
			v_u_5.Remove_Arrow(v25)
		end
		table.clear(v_u_6)
	end
end