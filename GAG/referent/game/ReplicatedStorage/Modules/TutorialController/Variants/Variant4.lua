local v_u_1 = game:GetService("ReplicatedStorage")
local v_u_2 = game:GetService("UserInputService")
local v_u_3 = game:GetService("Players").LocalPlayer
local v_u_4 = v_u_3.PlayerGui
local v_u_5 = v_u_4.Seed_Shop
local v_u_6 = require(v_u_1.Modules.DeviceController)
local v_u_7 = require(v_u_1.Modules.Notification)
local v_u_8 = require(v_u_1.Modules.DataService)
local v_u_9 = require(v_u_1.Modules.Observers)
local v_u_10 = require(v_u_1.Modules.FastTween)
require(v_u_1.Modules.GetFarm)
local v_u_11 = require(v_u_1.Modules.Trove)
local v_u_12 = require(v_u_1.Modules.TutorialController.TutorialUtils)
local v_u_13 = require(v_u_1.Arrow_Module)
return function()
	-- upvalues: (copy) v_u_11, (copy) v_u_13, (copy) v_u_3, (copy) v_u_9, (copy) v_u_8, (copy) v_u_12, (copy) v_u_1, (copy) v_u_7, (copy) v_u_5, (copy) v_u_6, (copy) v_u_2, (copy) v_u_4, (copy) v_u_10
	local v_u_14 = v_u_11.new()
	local function v_u_18(p15)
		-- upvalues: (copy) v_u_14, (ref) v_u_13, (ref) v_u_3
		local v16 = v_u_14:Extend()
		local v_u_17 = v_u_13.GenerateArrow(v_u_3, p15, math.random(1, 1000000))
		v16:Add(function()
			-- upvalues: (ref) v_u_13, (copy) v_u_17
			v_u_13.Remove_Arrow(v_u_17)
		end)
		return v16:WrapClean()
	end
	local v_u_20 = v_u_9.observeTag("GrowSign", function(p_u_19)
		p_u_19:SetAttribute("Visible", false)
		return function()
			-- upvalues: (copy) p_u_19
			p_u_19:SetAttribute("Visible", true)
		end
	end)
	task.spawn(function()
		-- upvalues: (ref) v_u_8, (copy) v_u_20
		local v_u_21 = v_u_8:GetData()
		local v_u_22 = nil
		local v23 = v_u_8
		v_u_22 = assert(v23:GetPathSignal("CropsSold")):Connect(function()
			-- upvalues: (copy) v_u_21, (ref) v_u_20, (ref) v_u_22
			if v_u_21.CropsSold >= 5 then
				v_u_20()
				if v_u_22 then
					v_u_22:Disconnect()
					v_u_22 = nil
				end
			end
		end)
	end)
	workspace:SetAttribute("InTutorial", true)
	v_u_14:Add(function()
		workspace:SetAttribute("InTutorial", nil)
	end)
	v_u_14:Add(task.spawn(function()
		-- upvalues: (ref) v_u_12, (ref) v_u_8, (copy) v_u_14, (ref) v_u_1, (copy) v_u_18, (ref) v_u_7, (ref) v_u_5, (ref) v_u_6, (ref) v_u_3, (ref) v_u_2, (ref) v_u_4, (ref) v_u_10
		local v24 = v_u_12.waitForFarm()
		local v25 = v_u_8:GetData()
		local v26 = v25 and v25.CropsSold
		if v26 then
			v26 = v25.CropsSold > 0
		end
		if v26 then
			workspace:SetAttribute("InTutorialShopMovement", nil)
			workspace:SetAttribute("InTutorial", nil)
			v_u_14:Clean()
			v_u_1.GameEvents.SetTutorialFinished:FireServer()
			return
		end
		for _, v27 in v_u_12.getTools() do
			if v27:FindFirstChild("Item_String") then
				v89 = true
				::l11::
				local v28 = v24.Important and v24.Important.Plants_Physical
				if v28 then
					v28 = #v24.Important.Plants_Physical:GetChildren() > 0
				end
				if not (v_u_12.hasSeed() or (v28 or v89)) then
					local v29 = v_u_18(workspace.Tutorial_Points.Tutorial_Point_1.Position)
					v_u_12.waitUntilDistance(workspace.Tutorial_Points.Tutorial_Point_1.Position, 5)
					v29()
					v_u_7:CreateNotification("Talk to Sam!")
					while not v_u_5.Enabled do
						task.wait(0.1)
					end
					local v_u_30 = nil
					local function v_u_42()
						-- upvalues: (ref) v_u_5, (ref) v_u_12, (ref) v_u_30
						v_u_5.Frame.ScrollingFrame.ScrollingEnabled = false
						local v_u_33 = v_u_12.pointToUI(function()
							-- upvalues: (ref) v_u_5
							local v31 = v_u_5.Frame.ScrollingFrame:FindFirstChild("Carrot")
							if not v31 then
								return nil
							end
							local v32 = v31.Main_Frame
							return v32.AbsolutePosition + v32.AbsoluteSize * 0.5
						end)
						local v36 = v_u_12.focusObject(function()
							-- upvalues: (ref) v_u_5
							local v34 = v_u_5.Frame.ScrollingFrame:FindFirstChild("Carrot")
							if not v34 then
								return nil
							end
							local v35 = v34.Main_Frame
							return {
								["Position"] = v35.AbsolutePosition,
								["Size"] = v35.AbsoluteSize
							}
						end)
						local v39 = v_u_5:GetPropertyChangedSignal("Enabled"):Connect(function()
							-- upvalues: (ref) v_u_5, (ref) v_u_33, (ref) v_u_12
							if v_u_5.Enabled then
								v_u_33 = v_u_12.pointToUI(function()
									-- upvalues: (ref) v_u_5
									local v37 = v_u_5.Frame.ScrollingFrame:FindFirstChild("Carrot")
									if not v37 then
										return nil
									end
									local v38 = v37.Main_Frame
									return v38.AbsolutePosition + v38.AbsoluteSize * 0.5
								end)
							else
								v_u_33()
							end
						end)
						local v40 = v_u_33
						while true do
							task.wait(0.1)
							if not v_u_5.Enabled then
								break
							end
							local v41 = v_u_5.Frame.ScrollingFrame:FindFirstChild("Carrot")
							if v41 and v41.Frame.Position.Y.Scale > 1 then
								break
							end
						end
						v39:Disconnect()
						v36()
						v40()
						while not (v_u_5.Enabled or v_u_12.hasSeed()) do
							task.wait(0.1)
						end
						v_u_30()
					end
					v_u_30 = function()
						-- upvalues: (ref) v_u_5, (ref) v_u_12, (ref) v_u_42
						v_u_5.Frame.ScrollingFrame.ScrollingEnabled = false
						local v_u_45 = v_u_12.pointToUI(function()
							-- upvalues: (ref) v_u_5
							local v43 = v_u_5.Frame.ScrollingFrame:FindFirstChild("Carrot")
							if not v43 then
								return nil
							end
							local v44 = v43.Frame.Sheckles_Buy
							return v44.AbsolutePosition + v44.AbsoluteSize * 0.5
						end)
						local v48 = v_u_12.focusObject(function()
							-- upvalues: (ref) v_u_5
							local v46 = v_u_5.Frame.ScrollingFrame:FindFirstChild("Carrot")
							if not v46 then
								return nil
							end
							local v47 = v46.Frame.Sheckles_Buy
							return {
								["Position"] = v47.AbsolutePosition,
								["Size"] = v47.AbsoluteSize
							}
						end)
						local v51 = v_u_5:GetPropertyChangedSignal("Enabled"):Connect(function()
							-- upvalues: (ref) v_u_5, (ref) v_u_45, (ref) v_u_12
							if v_u_5.Enabled then
								v_u_45 = v_u_12.pointToUI(function()
									-- upvalues: (ref) v_u_5
									local v49 = v_u_5.Frame.ScrollingFrame:FindFirstChild("Carrot")
									if not v49 then
										return nil
									end
									local v50 = v49.Frame.Sheckles_Buy
									return v50.AbsolutePosition + v50.AbsoluteSize * 0.5
								end)
							else
								v_u_45()
							end
						end)
						local v52 = v_u_45
						repeat
							task.wait(0.1)
							local v53 = v_u_5.Frame.ScrollingFrame:FindFirstChild("Carrot")
						until v53 and (v_u_12.hasSeed() or (not v_u_5.Enabled or v53.Frame.Position.Y.Scale < 1))
						v51:Disconnect()
						v48()
						v52()
						while not (v_u_5.Enabled or v_u_12.hasSeed()) do
							task.wait(0.1)
						end
						if not v_u_12.hasSeed() then
							return v_u_42()
						end
					end
					v_u_42()
					v_u_5.Frame.ScrollingFrame.ScrollingEnabled = true
					workspace:SetAttribute("InTutorialShopMovement", true)
					local v55 = v_u_12.pointToUI(function()
						-- upvalues: (ref) v_u_5
						local v54 = v_u_5.Frame.Frame.ExitButton
						return v54.AbsolutePosition + v54.AbsoluteSize * 0.5
					end)
					local v56 = v_u_12.focusObject(v_u_5.Frame.Frame.ExitButton)
					while v_u_5.Enabled do
						task.wait()
					end
					v56()
					v55()
				end
				if not (v28 or v89) then
					local v57 = (v24.Spawn_Point.CFrame * CFrame.new(0, 0, -10)).Position
					local v58 = v_u_18(v57)
					v_u_12.waitUntilDistance(v57, 10)
					local v_u_59 = nil
					local v60 = v_u_6:GetCurrentDevice() == "Gamepad"
					if v60 then
						if v_u_3.Backpack:FindFirstChild("Shovel [Destroy Plants]") ~= nil then
							pcall(function()
								-- upvalues: (ref) v_u_59, (ref) v_u_2
								v_u_59 = v_u_2:GetImageForKeyCode(Enum.KeyCode.ButtonL1)
							end)
						else
							pcall(function()
								-- upvalues: (ref) v_u_59, (ref) v_u_2
								v_u_59 = v_u_2:GetImageForKeyCode(Enum.KeyCode.ButtonR1)
							end)
						end
					end
					local v67 = v_u_12.pointToUI(function(p61)
						-- upvalues: (ref) v_u_4, (ref) v_u_59
						local v62 = v_u_4:FindFirstChild("BackpackGui")
						if v62 then
							v62 = v62:FindFirstChild("Backpack")
						end
						if v62 then
							v62 = v62:FindFirstChild("Hotbar")
						end
						if not v62 then
							return nil
						end
						local v63 = nil
						for v64 = 1, 10 do
							local v65 = v62:FindFirstChild((tostring(v64)))
							if v65 and string.find(v65.ToolName.Text, "Seed") then
								v63 = v65
								break
							end
						end
						if not v63 then
							return nil
						end
						local v66 = v63.AbsolutePosition + Vector2.new(v63.AbsoluteSize.X * 0.5, 0)
						if v_u_59 ~= nil then
							v66 = v66 + Vector2.new(0, -(v63.AbsoluteSize.Y * 1.75 + p61.AbsoluteSize.Y) * 0.5)
						end
						return v66
					end, nil, nil, v_u_59)
					v_u_12.waitUntilSeedEquipped()
					v67()
					v58()
					local v_u_68 = "R2"
					pcall(function()
						-- upvalues: (ref) v_u_68, (ref) v_u_2
						v_u_68 = string.gsub(v_u_2:GetStringForKeyCode(Enum.KeyCode.ButtonR2), "Button", "")
					end)
					v_u_7:CreateNotification(not v60 and "Click on your plot to plant!" or ("Press %* on your plot to plant!"):format(v_u_68))
					local v_u_69 = v_u_1.Tutorial_Parts.Tutorial_Click:Clone()
					v_u_69.Size = Vector3.new(0.001, 0.001, 0.001)
					v_u_69.Position = (v24.Spawn_Point.CFrame * CFrame.new(15, -5, -15)).Position
					if v60 then
						pcall(function()
							-- upvalues: (copy) v_u_69, (ref) v_u_2
							v_u_69.BillboardGui.Size = UDim2.fromScale(1.5, 1.5)
							v_u_69.BillboardGui.ImageLabel.Image = v_u_2:GetImageForKeyCode(Enum.KeyCode.ButtonR2)
						end)
					end
					v_u_69.Parent = workspace.Click_Points
					while #v24.Important.Plants_Physical:GetChildren() <= 0 do
						task.wait()
					end
					v_u_69:Destroy()
					v_u_7:CreateNotification("Wait for your plant to grow then Collect it")
				end
				if not v89 then
					local v70 = nil
					for _, v71 in v24.Important.Plants_Physical:GetChildren() do
						if v71:IsA("Model") and v71:FindFirstChild("Grow") then
							while v71:IsDescendantOf(v24) and not v71:GetAttribute("MaxAge") do
								v71:GetAttributeChangedSignal("MaxAge"):Wait()
							end
							while v71:IsDescendantOf(v24) and v71.Grow.Age.Value < v71:GetAttribute("MaxAge") do
								v71.Grow.Age.Changed:Wait()
							end
							v70 = v71
						end
					end
					if v70 then
						local v72 = v_u_18(v70:GetPivot().Position)
						v_u_7:CreateNotification("Collect your plant!")
						v_u_12.waitUntilSellableItem()
						v72()
					else
						v_u_12.waitUntilSellableItem()
					end
				end
				local v73 = v_u_18(workspace.Tutorial_Points.Tutorial_Point_2.Position)
				v_u_12.waitUntilDistance(workspace.Tutorial_Points.Tutorial_Point_2.Position, 5)
				v73()
				v_u_7:CreateNotification("Talk to Steven!")
				while true do
					local v74 = v_u_4:FindFirstChild("Billboard_UI")
					local v_u_75 = v74 and v74:FindFirstChild("Objects")
					if v_u_75 then
						v_u_75 = v74.Objects:FindFirstChildWhichIsA("GuiObject")
					end
					if v_u_75 and v_u_75.Frame.Frame.Text_Element:GetAttribute("Text") == "I want to sell my inventory" then
						if v_u_75 then
							local v_u_76 = Vector2.zero
							local v_u_77 = Vector2.zero
							local v_u_78 = nil
							local function v_u_85()
								-- upvalues: (ref) v_u_78, (ref) v_u_75, (ref) v_u_4, (ref) v_u_76, (ref) v_u_77
								if not v_u_78 then
									local v79 = v_u_75
									local v80 = Vector2.zero
									local v81 = v_u_4:FindFirstChild("Billboard_UI")
									if v81 then
										local v82 = v81.Adornee or v81.Parent
										if v82 and v82:IsA("PVInstance") then
											local v83, v84 = workspace.CurrentCamera:WorldToScreenPoint(v82:GetPivot().Position)
											if v84 then
												v80 = Vector2.new(v83.X, v83.Y)
											else
												v80 = v80 + Vector2.new(0, 999999999999)
											end
										end
									end
									v_u_76 = v80
									v_u_77 = v79.AbsoluteSize
									v_u_78 = true
									task.delay(0, function()
										-- upvalues: (ref) v_u_78
										v_u_78 = false
									end)
								end
							end
							local v_u_86 = Instance.new("UIStroke")
							v_u_86.Name = "UIStroke"
							v_u_86.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
							v_u_86.LineJoinMode = Enum.LineJoinMode.Bevel
							v_u_86.Thickness = 10000
							v_u_86.Transparency = 1
							v_u_10(v_u_86, TweenInfo.new(0.2), {
								["Transparency"] = 0.3
							})
							local v87 = v_u_12.pointToUI(function()
								-- upvalues: (copy) v_u_85, (ref) v_u_76, (ref) v_u_77
								v_u_85()
								return v_u_76 + Vector2.new(v_u_77.X * 0.5, 0)
							end)
							while true do
								local v88 = v_u_4:FindFirstChild("Billboard_UI")
								if not (v88 and (v88:FindFirstChild("Objects") and v88.Objects:FindFirstChildWhichIsA("GuiObject"))) then
									break
								end
								v88.ClipsDescendants = false
								v_u_86.Parent = v88.Objects:FindFirstChild("Option_UI")
								task.wait(0.1)
							end
							v87()
							v_u_10(v_u_86, TweenInfo.new(0.2), {
								["Transparency"] = 1
							}).Completed:Once(function()
								-- upvalues: (copy) v_u_86
								v_u_86:Destroy()
							end)
						end
						workspace:SetAttribute("InTutorialShopMovement", nil)
						workspace:SetAttribute("InTutorial", nil)
						v_u_14:Clean()
						v_u_1.GameEvents.SetTutorialFinished:FireServer()
						return
					end
					task.wait(0.1)
				end
			end
		end
		local v89 = false
		goto l11
	end))
	return v_u_14:WrapClean()
end