local v_u_1 = game:GetService("ReplicatedStorage")
local v_u_2 = game:GetService("Players").LocalPlayer
local v_u_3 = v_u_2.PlayerGui
local v_u_4 = v_u_3.Seed_Shop
local v_u_5 = require(v_u_1.Modules.Notification)
require(v_u_1.Modules.GetFarm)
local v_u_6 = require(v_u_1.Modules.Trove)
local v_u_7 = require(v_u_1.Modules.TutorialController.TutorialUtils)
local v_u_8 = require(v_u_1.Arrow_Module)
return function()
	-- upvalues: (copy) v_u_6, (copy) v_u_8, (copy) v_u_2, (copy) v_u_7, (copy) v_u_5, (copy) v_u_4, (copy) v_u_3, (copy) v_u_1
	local v_u_9 = v_u_6.new()
	local function v_u_13(p10)
		-- upvalues: (copy) v_u_9, (ref) v_u_8, (ref) v_u_2
		local v11 = v_u_9:Extend()
		local v_u_12 = v_u_8.GenerateArrow(v_u_2, p10, math.random(1, 1000000))
		v11:Add(function()
			-- upvalues: (ref) v_u_8, (copy) v_u_12
			v_u_8.Remove_Arrow(v_u_12)
		end)
		return v11:WrapClean()
	end
	workspace:SetAttribute("InTutorial", true)
	v_u_9:Add(function()
		workspace:SetAttribute("InTutorial", nil)
	end)
	v_u_9:Add(task.spawn(function()
		-- upvalues: (ref) v_u_7, (copy) v_u_13, (ref) v_u_5, (ref) v_u_4, (ref) v_u_3, (ref) v_u_1, (copy) v_u_9
		local v14 = v_u_7.waitForFarm()
		local v15 = v_u_13(workspace.Tutorial_Points.Tutorial_Point_1.Position)
		v_u_7.waitUntilDistance(workspace.Tutorial_Points.Tutorial_Point_1.Position, 5)
		v15()
		v_u_5:CreateNotification("Talk to Sam!")
		while not v_u_4.Enabled do
			task.wait(0.1)
		end
		local v_u_16 = v_u_4.Frame.ScrollingFrame:WaitForChild("Carrot")
		local v_u_18 = v_u_7.pointToUI(function()
			-- upvalues: (copy) v_u_16
			local v17 = v_u_16.Main_Frame
			return v17.AbsolutePosition + v17.AbsoluteSize * 0.5
		end)
		local v20 = v_u_4:GetPropertyChangedSignal("Enabled"):Connect(function()
			-- upvalues: (ref) v_u_4, (ref) v_u_18, (ref) v_u_7, (copy) v_u_16
			if v_u_4.Enabled then
				v_u_18 = v_u_7.pointToUI(function()
					-- upvalues: (ref) v_u_16
					local v19 = v_u_16.Main_Frame
					return v19.AbsolutePosition + v19.AbsoluteSize * 0.5
				end)
			else
				v_u_18()
			end
		end)
		local v21 = v_u_18
		while v_u_16.Frame.Position.Y.Scale < 1 do
			task.wait(0.1)
		end
		v20:Disconnect()
		v21()
		local v_u_23 = v_u_7.pointToUI(function()
			-- upvalues: (copy) v_u_16
			local v22 = v_u_16.Frame.Sheckles_Buy
			return v22.AbsolutePosition + v22.AbsoluteSize * 0.5
		end)
		local v25 = v_u_4:GetPropertyChangedSignal("Enabled"):Connect(function()
			-- upvalues: (ref) v_u_4, (ref) v_u_23, (ref) v_u_7, (copy) v_u_16
			if v_u_4.Enabled then
				v_u_23 = v_u_7.pointToUI(function()
					-- upvalues: (ref) v_u_16
					local v24 = v_u_16.Frame.Sheckles_Buy
					return v24.AbsolutePosition + v24.AbsoluteSize * 0.5
				end)
			else
				v_u_23()
			end
		end)
		v_u_7.waitForSeed()
		v25:Disconnect()
		v_u_23()
		local v27 = v_u_7.pointToUI(function()
			-- upvalues: (ref) v_u_4
			local v26 = v_u_4.Frame.Frame.ExitButton
			return v26.AbsolutePosition + v26.AbsoluteSize * 0.5
		end)
		while v_u_4.Enabled do
			task.wait()
		end
		v27()
		local v28 = (v14.Spawn_Point.CFrame * CFrame.new(0, 0, -10)).Position
		local v29 = v_u_13(v28)
		v_u_7.waitUntilDistance(v28, 10)
		local v34 = v_u_7.pointToUI(function()
			-- upvalues: (ref) v_u_3
			local v30 = v_u_3:FindFirstChild("BackpackGui")
			if v30 then
				v30 = v30:FindFirstChild("Backpack")
			end
			if v30 then
				v30 = v30:FindFirstChild("Hotbar")
			end
			if not v30 then
				return nil
			end
			local v31 = nil
			for v32 = 1, 10 do
				local v33 = v30:FindFirstChild((tostring(v32)))
				if v33 and string.find(v33.ToolName.Text, "Seed") then
					v31 = v33
					break
				end
			end
			if v31 then
				return v31.AbsolutePosition + Vector2.new(v31.AbsoluteSize.X * 0.5, 0)
			else
				return nil
			end
		end)
		v_u_7.waitUntilSeedEquipped()
		v34()
		v29()
		v_u_5:CreateNotification("Click on your plot to plant!")
		local v35 = v_u_1.Tutorial_Parts.Tutorial_Click:Clone()
		v35.Size = Vector3.new(0.001, 0.001, 0.001)
		v35.Position = (v14.Spawn_Point.CFrame * CFrame.new(15, -5, -15)).Position
		v35.Parent = workspace.Click_Points
		while #v14.Important.Plants_Physical:GetChildren() <= 0 do
			task.wait()
		end
		v35:Destroy()
		v_u_5:CreateNotification("Wait for your plant to grow then Collect it")
		v_u_7.waitUntilSellableItem()
		local v36 = v_u_13(workspace.Tutorial_Points.Tutorial_Point_2.Position)
		v_u_7.waitUntilDistance(workspace.Tutorial_Points.Tutorial_Point_2.Position, 5)
		v36()
		v_u_5:CreateNotification("Talk to Steven!")
		while true do
			local v37 = v_u_3:FindFirstChild("Billboard_UI")
			local v_u_38 = v37 and v37:FindFirstChild("Objects")
			if v_u_38 then
				v_u_38 = v37.Objects:FindFirstChildWhichIsA("GuiObject")
			end
			if v_u_38 and v_u_38.Frame.Frame.Text_Element:GetAttribute("Text") == "I want to sell my inventory" then
				if v_u_38 then
					local v45 = v_u_7.pointToUI(function()
						-- upvalues: (ref) v_u_38, (ref) v_u_3
						local v39 = v_u_38
						local v40 = Vector2.zero
						local v41 = v_u_3:FindFirstChild("Billboard_UI")
						if v41 then
							local v42 = v41.Adornee or v41.Parent
							if v42:IsA("PVInstance") then
								local v43, v44 = workspace.CurrentCamera:WorldToScreenPoint(v42:GetPivot().Position)
								if v44 then
									v40 = Vector2.new(v43.X, v43.Y)
								else
									v40 = v40 + Vector2.new(0, 999999999999)
								end
							end
						end
						return v40 + Vector2.new(v39.AbsoluteSize.X * 0.5, 0)
					end)
					while true do
						local v46 = v_u_3:FindFirstChild("Billboard_UI")
						if not (v46 and (v46:FindFirstChild("Objects") and v46.Objects:FindFirstChildWhichIsA("GuiObject"))) then
							break
						end
						task.wait(0.1)
					end
					v45()
				end
				workspace:SetAttribute("InTutorial", nil)
				v_u_9:Clean()
				v_u_1.GameEvents.SetTutorialFinished:FireServer()
				return
			end
			task.wait(0.1)
		end
	end))
	return v_u_9:WrapClean()
end