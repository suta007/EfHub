local v_u_1 = game:GetService("ReplicatedStorage")
local v_u_2 = game:GetService("Players").LocalPlayer
local v_u_3 = require(v_u_1.Modules.Notification)
require(v_u_1.Modules.GetFarm)
local v_u_4 = require(v_u_1.Modules.TutorialController.TutorialUtils)
local v_u_5 = require(v_u_1.Arrow_Module)
local v_u_6 = require(v_u_1.Modules.DataService)
return function()
	-- upvalues: (copy) v_u_5, (copy) v_u_2, (copy) v_u_4, (copy) v_u_6, (copy) v_u_1, (copy) v_u_3
	local v_u_7 = {}
	local v_u_30 = task.spawn(function()
		-- upvalues: (ref) v_u_4, (ref) v_u_6, (ref) v_u_1, (ref) v_u_5, (ref) v_u_2, (copy) v_u_7, (ref) v_u_3
		local v8 = v_u_4.waitForFarm()
		local v9 = v_u_6:GetData()
		local v10 = v9 and v9.CropsSold
		if v10 then
			v10 = v9.CropsSold > 0
		end
		if v10 then
			v_u_1.GameEvents.SetTutorialFinished:FireServer()
			return
		end
		for _, v11 in v_u_4.getTools() do
			if v11:FindFirstChild("Item_String") then
				v29 = true
				::l11::
				local v12 = v8.Important and v8.Important.Plants_Physical
				if v12 then
					v12 = #v8.Important.Plants_Physical:GetChildren() > 0
				end
				if not (v_u_4.hasSeed() or (v12 or v29)) then
					local v13 = workspace.Tutorial_Points.Tutorial_Point_1.Position
					local v_u_14 = v_u_5.GenerateArrow(v_u_2, v13, math.random(1, 1000000))
					local v15 = v_u_7
					table.insert(v15, v_u_14)
					local function v17()
						-- upvalues: (ref) v_u_7, (copy) v_u_14, (ref) v_u_5
						local v16 = table.find(v_u_7, v_u_14)
						if v16 then
							v_u_5.Remove_Arrow(v_u_14)
							table.remove(v_u_7, v16)
						end
					end
					local v18 = task.delay(5, function()
						-- upvalues: (ref) v_u_3
						v_u_3:CreateNotification("Go buy your first seed!")
					end)
					v_u_4.waitForSeed()
					if coroutine.status(v18) == "suspended" then
						task.cancel(v18)
					end
					v17()
				end
				if not v29 then
					if v12 then
						v_u_4.waitUntilSellableItem()
					else
						v_u_3:CreateNotification("Go plant your seed!")
						local v19 = (v8.Spawn_Point.CFrame * CFrame.new(0, 0, -10)).Position
						local v_u_20 = v_u_5.GenerateArrow(v_u_2, v19, math.random(1, 1000000))
						local v21 = v_u_7
						table.insert(v21, v_u_20)
						local function v23()
							-- upvalues: (ref) v_u_7, (copy) v_u_20, (ref) v_u_5
							local v22 = table.find(v_u_7, v_u_20)
							if v22 then
								v_u_5.Remove_Arrow(v_u_20)
								table.remove(v_u_7, v22)
							end
						end
						v_u_4.waitUntilSellableItem()
						v23()
					end
				end
				v_u_3:CreateNotification("Go sell your plant!")
				local v24 = workspace.Tutorial_Points.Tutorial_Point_2.Position
				local v_u_25 = v_u_5.GenerateArrow(v_u_2, v24, math.random(1, 1000000))
				local v26 = v_u_7
				table.insert(v26, v_u_25)
				local function v28()
					-- upvalues: (ref) v_u_7, (copy) v_u_25, (ref) v_u_5
					local v27 = table.find(v_u_7, v_u_25)
					if v27 then
						v_u_5.Remove_Arrow(v_u_25)
						table.remove(v_u_7, v27)
					end
				end
				v_u_4.waitUntilNoSellableItems()
				v28()
				v_u_1.GameEvents.SetTutorialFinished:FireServer()
				return
			end
		end
		local v29 = false
		goto l11
	end)
	return function()
		-- upvalues: (copy) v_u_30, (copy) v_u_7, (ref) v_u_5
		if coroutine.status(v_u_30) == "suspended" then
			task.cancel(v_u_30)
		end
		for _, v31 in v_u_7 do
			v_u_5.Remove_Arrow(v31)
		end
		table.clear(v_u_7)
	end
end