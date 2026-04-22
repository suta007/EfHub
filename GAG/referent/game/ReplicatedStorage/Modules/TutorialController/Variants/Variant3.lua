local v_u_1 = game:GetService("ReplicatedStorage")
local v_u_2 = game:GetService("Players").LocalPlayer
local v_u_3 = v_u_2.PlayerGui
local v_u_4 = v_u_3.Seed_Shop
local v_u_5 = require(v_u_1.Modules.Notification)
require(v_u_1.Modules.GetFarm)
local v_u_6 = require(v_u_1.Modules.Trove)
local v_u_7 = require(v_u_1.Modules.TutorialController.TutorialUtils)
local v_u_8 = require(v_u_1.Arrow_Module)
local v_u_9 = require(v_u_1.Modules.DataService)
return function()
	-- upvalues: (copy) v_u_6, (copy) v_u_8, (copy) v_u_2, (copy) v_u_7, (copy) v_u_9, (copy) v_u_1, (copy) v_u_5, (copy) v_u_4, (copy) v_u_3
	local v_u_10 = v_u_6.new()
	local function v_u_14(p11)
		-- upvalues: (copy) v_u_10, (ref) v_u_8, (ref) v_u_2
		local v12 = v_u_10:Extend()
		local v_u_13 = v_u_8.GenerateArrow(v_u_2, p11, math.random(1, 1000000))
		v12:Add(function()
			-- upvalues: (ref) v_u_8, (copy) v_u_13
			v_u_8.Remove_Arrow(v_u_13)
		end)
		return v12:WrapClean()
	end
	workspace:SetAttribute("InTutorial", true)
	v_u_10:Add(function()
		workspace:SetAttribute("InTutorial", nil)
	end)
	v_u_10:Add(task.spawn(function()
		-- upvalues: (ref) v_u_7, (ref) v_u_9, (copy) v_u_10, (ref) v_u_1, (copy) v_u_14, (ref) v_u_5, (ref) v_u_4, (ref) v_u_3
		local v15 = v_u_7.waitForFarm()
		local v16 = v_u_9:GetData()
		local v17 = v16 and v16.CropsSold
		if v17 then
			v17 = v16.CropsSold > 0
		end
		if v17 then
			workspace:SetAttribute("InTutorial", nil)
			v_u_10:Clean()
			v_u_1.GameEvents.SetTutorialFinished:FireServer()
			return
		end
		for _, v18 in v_u_7.getTools() do
			if v18:FindFirstChild("Item_String") then
				v52 = true
				::l11::
				local v19 = v15.Important and v15.Important.Plants_Physical
				if v19 then
					v19 = #v15.Important.Plants_Physical:GetChildren() > 0
				end
				if not (v_u_7.hasSeed() or (v19 or v52)) then
					local v20 = v_u_14(workspace.Tutorial_Points.Tutorial_Point_1.Position)
					v_u_7.waitUntilDistance(workspace.Tutorial_Points.Tutorial_Point_1.Position, 5)
					v20()
					v_u_5:CreateNotification("Talk to Sam!")
					while not v_u_4.Enabled do
						task.wait(0.1)
					end
					local v_u_21 = v_u_4.Frame.ScrollingFrame:WaitForChild("Carrot")
					local v_u_23 = v_u_7.pointToUI(function()
						-- upvalues: (copy) v_u_21
						local v22 = v_u_21.Main_Frame
						return v22.AbsolutePosition + v22.AbsoluteSize * 0.5
					end)
					local v25 = v_u_4:GetPropertyChangedSignal("Enabled"):Connect(function()
						-- upvalues: (ref) v_u_4, (ref) v_u_23, (ref) v_u_7, (copy) v_u_21
						if v_u_4.Enabled then
							v_u_23 = v_u_7.pointToUI(function()
								-- upvalues: (ref) v_u_21
								local v24 = v_u_21.Main_Frame
								return v24.AbsolutePosition + v24.AbsoluteSize * 0.5
							end)
						else
							v_u_23()
						end
					end)
					local v26 = v_u_23
					while v_u_21.Frame.Position.Y.Scale < 1 do
						task.wait(0.1)
					end
					v25:Disconnect()
					v26()
					local v_u_28 = v_u_7.pointToUI(function()
						-- upvalues: (copy) v_u_21
						local v27 = v_u_21.Frame.Sheckles_Buy
						return v27.AbsolutePosition + v27.AbsoluteSize * 0.5
					end)
					local v30 = v_u_4:GetPropertyChangedSignal("Enabled"):Connect(function()
						-- upvalues: (ref) v_u_4, (ref) v_u_28, (ref) v_u_7, (copy) v_u_21
						if v_u_4.Enabled then
							v_u_28 = v_u_7.pointToUI(function()
								-- upvalues: (ref) v_u_21
								local v29 = v_u_21.Frame.Sheckles_Buy
								return v29.AbsolutePosition + v29.AbsoluteSize * 0.5
							end)
						else
							v_u_28()
						end
					end)
					v_u_7.waitForSeed()
					v30:Disconnect()
					v_u_28()
					local v32 = v_u_7.pointToUI(function()
						-- upvalues: (ref) v_u_4
						local v31 = v_u_4.Frame.Frame.ExitButton
						return v31.AbsolutePosition + v31.AbsoluteSize * 0.5
					end)
					while v_u_4.Enabled do
						task.wait()
					end
					v32()
				end
				if not (v19 or v52) then
					local v33 = (v15.Spawn_Point.CFrame * CFrame.new(0, 0, -10)).Position
					local v34 = v_u_14(v33)
					v_u_7.waitUntilDistance(v33, 10)
					local v39 = v_u_7.pointToUI(function()
						-- upvalues: (ref) v_u_3
						local v35 = v_u_3:FindFirstChild("BackpackGui")
						if v35 then
							v35 = v35:FindFirstChild("Backpack")
						end
						if v35 then
							v35 = v35:FindFirstChild("Hotbar")
						end
						if not v35 then
							return nil
						end
						local v36 = nil
						for v37 = 1, 10 do
							local v38 = v35:FindFirstChild((tostring(v37)))
							if v38 and string.find(v38.ToolName.Text, "Seed") then
								v36 = v38
								break
							end
						end
						if v36 then
							return v36.AbsolutePosition + Vector2.new(v36.AbsoluteSize.X * 0.5, 0)
						else
							return nil
						end
					end)
					v_u_7.waitUntilSeedEquipped()
					v39()
					v34()
					v_u_5:CreateNotification("Click on your plot to plant!")
					local v40 = v_u_1.Tutorial_Parts.Tutorial_Click:Clone()
					v40.Size = Vector3.new(0.001, 0.001, 0.001)
					v40.Position = (v15.Spawn_Point.CFrame * CFrame.new(15, -5, -15)).Position
					v40.Parent = workspace.Click_Points
					while #v15.Important.Plants_Physical:GetChildren() <= 0 do
						task.wait()
					end
					v40:Destroy()
					v_u_5:CreateNotification("Wait for your plant to grow then Collect it")
				end
				if not v52 then
					v_u_7.waitUntilSellableItem()
				end
				local v41 = v_u_14(workspace.Tutorial_Points.Tutorial_Point_2.Position)
				v_u_7.waitUntilDistance(workspace.Tutorial_Points.Tutorial_Point_2.Position, 5)
				v41()
				v_u_5:CreateNotification("Talk to Steven!")
				while true do
					local v42 = v_u_3:FindFirstChild("Billboard_UI")
					local v_u_43 = v42 and v42:FindFirstChild("Objects")
					if v_u_43 then
						v_u_43 = v42.Objects:FindFirstChildWhichIsA("GuiObject")
					end
					if v_u_43 and v_u_43.Frame.Frame.Text_Element:GetAttribute("Text") == "I want to sell my inventory" then
						if v_u_43 then
							local v50 = v_u_7.pointToUI(function()
								-- upvalues: (ref) v_u_43, (ref) v_u_3
								local v44 = v_u_43
								local v45 = Vector2.zero
								local v46 = v_u_3:FindFirstChild("Billboard_UI")
								if v46 then
									local v47 = v46.Adornee or v46.Parent
									if v47:IsA("PVInstance") then
										local v48, v49 = workspace.CurrentCamera:WorldToScreenPoint(v47:GetPivot().Position)
										if v49 then
											v45 = Vector2.new(v48.X, v48.Y)
										else
											v45 = v45 + Vector2.new(0, 999999999999)
										end
									end
								end
								return v45 + Vector2.new(v44.AbsoluteSize.X * 0.5, 0)
							end)
							while true do
								local v51 = v_u_3:FindFirstChild("Billboard_UI")
								if not (v51 and (v51:FindFirstChild("Objects") and v51.Objects:FindFirstChildWhichIsA("GuiObject"))) then
									break
								end
								task.wait(0.1)
							end
							v50()
						end
						workspace:SetAttribute("InTutorial", nil)
						v_u_10:Clean()
						v_u_1.GameEvents.SetTutorialFinished:FireServer()
						return
					end
					task.wait(0.1)
				end
			end
		end
		local v52 = false
		goto l11
	end))
	return v_u_10:WrapClean()
end