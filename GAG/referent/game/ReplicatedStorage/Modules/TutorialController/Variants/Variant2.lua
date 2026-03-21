local v_u_1 = game:GetService("ReplicatedStorage")
local v_u_2 = game:GetService("Players").LocalPlayer
local v_u_3 = require(v_u_1.Modules.Notification)
require(v_u_1.Modules.GetFarm)
local v_u_4 = require(v_u_1.Modules.TutorialController.TutorialUtils)
local v_u_5 = require(v_u_1.Arrow_Module)
return function()
	-- upvalues: (copy) v_u_5, (copy) v_u_2, (copy) v_u_4, (copy) v_u_3, (copy) v_u_1
	local v_u_6 = nil
	local v_u_7 = {}
	local v_u_23 = task.spawn(function()
		-- upvalues: (ref) v_u_5, (ref) v_u_2, (copy) v_u_7, (ref) v_u_4, (ref) v_u_3, (ref) v_u_1, (ref) v_u_6
		local v8 = workspace.Tutorial_Points.Tutorial_Point_1.Position
		local v_u_9 = v_u_5.GenerateArrow(v_u_2, v8, math.random(1, 1000000))
		local v10 = v_u_7
		table.insert(v10, v_u_9)
		local function v12()
			-- upvalues: (ref) v_u_7, (copy) v_u_9, (ref) v_u_5
			local v11 = table.find(v_u_7, v_u_9)
			if v11 then
				v_u_5.Remove_Arrow(v_u_9)
				table.remove(v_u_7, v11)
			end
		end
		local v13 = v_u_4.waitForFarm()
		v_u_4.waitForSeed()
		v12()
		local v14 = (v13.Spawn_Point.CFrame * CFrame.new(0, 0, -10)).Position
		local v_u_15 = v_u_5.GenerateArrow(v_u_2, v14, math.random(1, 1000000))
		local v16 = v_u_7
		table.insert(v16, v_u_15)
		local function v18()
			-- upvalues: (ref) v_u_7, (copy) v_u_15, (ref) v_u_5
			local v17 = table.find(v_u_7, v_u_15)
			if v17 then
				v_u_5.Remove_Arrow(v_u_15)
				table.remove(v_u_7, v17)
			end
		end
		v_u_4.waitUntilDistance(v14, 30)
		v_u_4.waitUntilSeedEquipped()
		v18()
		v_u_3:CreateNotification("Click on your plot to plant!")
		local v19 = v_u_1.Tutorial_Parts.Tutorial_Click:Clone()
		v19.Size = Vector3.new(0.001, 0.001, 0.001)
		v19.Position = (v13.Spawn_Point.CFrame * CFrame.new(15, -5, -15)).Position
		v19.Parent = workspace.Click_Points
		v_u_6 = v19
		while #v13.Important.Plants_Physical:GetChildren() <= 0 do
			task.wait(0.1)
		end
		v_u_6 = nil
		v19:Destroy()
		v_u_4.waitUntilSellableItem()
		local v20 = workspace.Tutorial_Points.Tutorial_Point_2.Position
		local v21 = v_u_5.GenerateArrow(v_u_2, v20, math.random(1, 1000000))
		local v22 = v_u_7
		table.insert(v22, v21)
		v_u_1.GameEvents.SetTutorialFinished:FireServer()
	end)
	return function()
		-- upvalues: (copy) v_u_23, (ref) v_u_6, (copy) v_u_7, (ref) v_u_5
		if coroutine.status(v_u_23) == "suspended" then
			task.cancel(v_u_23)
		end
		if v_u_6 then
			v_u_6:Destroy()
			v_u_6 = nil
		end
		for _, v24 in v_u_7 do
			v_u_5.Remove_Arrow(v24)
		end
		table.clear(v_u_7)
	end
end