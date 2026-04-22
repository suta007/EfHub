local v_u_1 = game:GetService("ReplicatedStorage")
local v_u_2 = game:GetService("Players").LocalPlayer
local v_u_3 = require(v_u_1.Modules.Notification)
require(v_u_1.Modules.GetFarm)
local v_u_4 = require(v_u_1.Modules.TutorialController.TutorialUtils)
local v_u_5 = require(v_u_1.Arrow_Module)
local v_u_6 = require(v_u_1.Modules.DataService)
return function()
	-- upvalues: (copy) v_u_5, (copy) v_u_2, (copy) v_u_4, (copy) v_u_6, (copy) v_u_1, (copy) v_u_3
	local v_u_7 = nil
	local v_u_8 = {}
	local v_u_29 = task.spawn(function()
		-- upvalues: (ref) v_u_4, (ref) v_u_6, (ref) v_u_1, (ref) v_u_5, (ref) v_u_2, (copy) v_u_8, (ref) v_u_3, (ref) v_u_7
		local v9 = v_u_4.waitForFarm()
		local v10 = v_u_6:GetData()
		local v11 = v10 and v10.CropsSold
		if v11 then
			v11 = v10.CropsSold > 0
		end
		if v11 then
			v_u_1.GameEvents.SetTutorialFinished:FireServer()
			return
		end
		for _, v12 in v_u_4.getTools() do
			if v12:FindFirstChild("Item_String") then
				v28 = true
				::l11::
				local v13 = v9.Important and v9.Important.Plants_Physical
				if v13 then
					v13 = #v9.Important.Plants_Physical:GetChildren() > 0
				end
				if not (v_u_4.hasSeed() or (v13 or v28)) then
					local v14 = workspace.Tutorial_Points.Tutorial_Point_1.Position
					local v_u_15 = v_u_5.GenerateArrow(v_u_2, v14, math.random(1, 1000000))
					local v16 = v_u_8
					table.insert(v16, v_u_15)
					local function v18()
						-- upvalues: (ref) v_u_8, (copy) v_u_15, (ref) v_u_5
						local v17 = table.find(v_u_8, v_u_15)
						if v17 then
							v_u_5.Remove_Arrow(v_u_15)
							table.remove(v_u_8, v17)
						end
					end
					v_u_4.waitForSeed()
					v18()
				end
				if not (v13 or v28) then
					local v19 = (v9.Spawn_Point.CFrame * CFrame.new(0, 0, -10)).Position
					local v_u_20 = v_u_5.GenerateArrow(v_u_2, v19, math.random(1, 1000000))
					local v21 = v_u_8
					table.insert(v21, v_u_20)
					local function v23()
						-- upvalues: (ref) v_u_8, (copy) v_u_20, (ref) v_u_5
						local v22 = table.find(v_u_8, v_u_20)
						if v22 then
							v_u_5.Remove_Arrow(v_u_20)
							table.remove(v_u_8, v22)
						end
					end
					v_u_4.waitUntilDistance(v19, 30)
					v_u_4.waitUntilSeedEquipped()
					v23()
					v_u_3:CreateNotification("Click on your plot to plant!")
					local v24 = v_u_1.Tutorial_Parts.Tutorial_Click:Clone()
					v24.Size = Vector3.new(0.001, 0.001, 0.001)
					v24.Position = (v9.Spawn_Point.CFrame * CFrame.new(15, -5, -15)).Position
					v24.Parent = workspace.Click_Points
					v_u_7 = v24
					while #v9.Important.Plants_Physical:GetChildren() <= 0 do
						task.wait(0.1)
					end
					v_u_7 = nil
					v24:Destroy()
				end
				if not v28 then
					v_u_4.waitUntilSellableItem()
				end
				local v25 = workspace.Tutorial_Points.Tutorial_Point_2.Position
				local v26 = v_u_5.GenerateArrow(v_u_2, v25, math.random(1, 1000000))
				local v27 = v_u_8
				table.insert(v27, v26)
				v_u_1.GameEvents.SetTutorialFinished:FireServer()
				return
			end
		end
		local v28 = false
		goto l11
	end)
	return function()
		-- upvalues: (copy) v_u_29, (ref) v_u_7, (copy) v_u_8, (ref) v_u_5
		if coroutine.status(v_u_29) == "suspended" then
			task.cancel(v_u_29)
		end
		if v_u_7 then
			v_u_7:Destroy()
			v_u_7 = nil
		end
		for _, v30 in v_u_8 do
			v_u_5.Remove_Arrow(v30)
		end
		table.clear(v_u_8)
	end
end