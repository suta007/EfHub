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
	-- upvalues: (copy) v_u_11, (copy) v_u_13, (copy) v_u_3, (copy) v_u_9, (copy) v_u_8, (copy) v_u_12, (copy) v_u_7, (copy) v_u_5, (copy) v_u_6, (copy) v_u_2, (copy) v_u_4, (copy) v_u_1, (copy) v_u_10
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
		-- upvalues: (ref) v_u_12, (copy) v_u_18, (ref) v_u_7, (ref) v_u_5, (ref) v_u_6, (ref) v_u_3, (ref) v_u_2, (ref) v_u_4, (ref) v_u_1, (ref) v_u_10, (copy) v_u_14
		local v24 = v_u_12.waitForFarm()
		local v25 = v_u_18(workspace.Tutorial_Points.Tutorial_Point_1.Position)
		v_u_12.waitUntilDistance(workspace.Tutorial_Points.Tutorial_Point_1.Position, 5)
		v25()
		v_u_7:CreateNotification("Talk to Sam!")
		while not v_u_5.Enabled do
			task.wait(0.1)
		end
		local v_u_26 = nil
		local function v_u_38()
			-- upvalues: (ref) v_u_5, (ref) v_u_12, (ref) v_u_26
			v_u_5.Frame.ScrollingFrame.ScrollingEnabled = false
			local v_u_29 = v_u_12.pointToUI(function()
				-- upvalues: (ref) v_u_5
				local v27 = v_u_5.Frame.ScrollingFrame:FindFirstChild("Carrot")
				if not v27 then
					return nil
				end
				local v28 = v27.Main_Frame
				return v28.AbsolutePosition + v28.AbsoluteSize * 0.5
			end)
			local v32 = v_u_12.focusObject(function()
				-- upvalues: (ref) v_u_5
				local v30 = v_u_5.Frame.ScrollingFrame:FindFirstChild("Carrot")
				if not v30 then
					return nil
				end
				local v31 = v30.Main_Frame
				return {
					["Position"] = v31.AbsolutePosition,
					["Size"] = v31.AbsoluteSize
				}
			end)
			local v35 = v_u_5:GetPropertyChangedSignal("Enabled"):Connect(function()
				-- upvalues: (ref) v_u_5, (ref) v_u_29, (ref) v_u_12
				if v_u_5.Enabled then
					v_u_29 = v_u_12.pointToUI(function()
						-- upvalues: (ref) v_u_5
						local v33 = v_u_5.Frame.ScrollingFrame:FindFirstChild("Carrot")
						if not v33 then
							return nil
						end
						local v34 = v33.Main_Frame
						return v34.AbsolutePosition + v34.AbsoluteSize * 0.5
					end)
				else
					v_u_29()
				end
			end)
			local v36 = v_u_29
			while true do
				task.wait(0.1)
				if not v_u_5.Enabled then
					break
				end
				local v37 = v_u_5.Frame.ScrollingFrame:FindFirstChild("Carrot")
				if v37 and v37.Frame.Position.Y.Scale > 1 then
					break
				end
			end
			v35:Disconnect()
			v32()
			v36()
			while not (v_u_5.Enabled or v_u_12.hasSeed()) do
				task.wait(0.1)
			end
			v_u_26()
		end
		v_u_26 = function()
			-- upvalues: (ref) v_u_5, (ref) v_u_12, (ref) v_u_38
			v_u_5.Frame.ScrollingFrame.ScrollingEnabled = false
			local v_u_41 = v_u_12.pointToUI(function()
				-- upvalues: (ref) v_u_5
				local v39 = v_u_5.Frame.ScrollingFrame:FindFirstChild("Carrot")
				if not v39 then
					return nil
				end
				local v40 = v39.Frame.Sheckles_Buy
				return v40.AbsolutePosition + v40.AbsoluteSize * 0.5
			end)
			local v44 = v_u_12.focusObject(function()
				-- upvalues: (ref) v_u_5
				local v42 = v_u_5.Frame.ScrollingFrame:FindFirstChild("Carrot")
				if not v42 then
					return nil
				end
				local v43 = v42.Frame.Sheckles_Buy
				return {
					["Position"] = v43.AbsolutePosition,
					["Size"] = v43.AbsoluteSize
				}
			end)
			local v47 = v_u_5:GetPropertyChangedSignal("Enabled"):Connect(function()
				-- upvalues: (ref) v_u_5, (ref) v_u_41, (ref) v_u_12
				if v_u_5.Enabled then
					v_u_41 = v_u_12.pointToUI(function()
						-- upvalues: (ref) v_u_5
						local v45 = v_u_5.Frame.ScrollingFrame:FindFirstChild("Carrot")
						if not v45 then
							return nil
						end
						local v46 = v45.Frame.Sheckles_Buy
						return v46.AbsolutePosition + v46.AbsoluteSize * 0.5
					end)
				else
					v_u_41()
				end
			end)
			local v48 = v_u_41
			repeat
				task.wait(0.1)
				local v49 = v_u_5.Frame.ScrollingFrame:FindFirstChild("Carrot")
			until v49 and (v_u_12.hasSeed() or (not v_u_5.Enabled or v49.Frame.Position.Y.Scale < 1))
			v47:Disconnect()
			v44()
			v48()
			while not (v_u_5.Enabled or v_u_12.hasSeed()) do
				task.wait(0.1)
			end
			if not v_u_12.hasSeed() then
				return v_u_38()
			end
		end
		v_u_38()
		v_u_5.Frame.ScrollingFrame.ScrollingEnabled = true
		workspace:SetAttribute("InTutorialShopMovement", true)
		local v51 = v_u_12.pointToUI(function()
			-- upvalues: (ref) v_u_5
			local v50 = v_u_5.Frame.Frame.ExitButton
			return v50.AbsolutePosition + v50.AbsoluteSize * 0.5
		end)
		local v52 = v_u_12.focusObject(v_u_5.Frame.Frame.ExitButton)
		while v_u_5.Enabled do
			task.wait()
		end
		v52()
		v51()
		local v53 = (v24.Spawn_Point.CFrame * CFrame.new(0, 0, -10)).Position
		local v54 = v_u_18(v53)
		v_u_12.waitUntilDistance(v53, 10)
		local v_u_55 = nil
		local v56 = v_u_6:GetCurrentDevice() == "Gamepad"
		if v56 then
			if v_u_3.Backpack:FindFirstChild("Shovel [Destroy Plants]") ~= nil then
				pcall(function()
					-- upvalues: (ref) v_u_55, (ref) v_u_2
					v_u_55 = v_u_2:GetImageForKeyCode(Enum.KeyCode.ButtonL1)
				end)
			else
				pcall(function()
					-- upvalues: (ref) v_u_55, (ref) v_u_2
					v_u_55 = v_u_2:GetImageForKeyCode(Enum.KeyCode.ButtonR1)
				end)
			end
		end
		local v63 = v_u_12.pointToUI(function(p57)
			-- upvalues: (ref) v_u_4, (ref) v_u_55
			local v58 = v_u_4:FindFirstChild("BackpackGui")
			if v58 then
				v58 = v58:FindFirstChild("Backpack")
			end
			if v58 then
				v58 = v58:FindFirstChild("Hotbar")
			end
			if not v58 then
				return nil
			end
			local v59 = nil
			for v60 = 1, 10 do
				local v61 = v58:FindFirstChild((tostring(v60)))
				if v61 and string.find(v61.ToolName.Text, "Seed") then
					v59 = v61
					break
				end
			end
			if not v59 then
				return nil
			end
			local v62 = v59.AbsolutePosition + Vector2.new(v59.AbsoluteSize.X * 0.5, 0)
			if v_u_55 ~= nil then
				v62 = v62 + Vector2.new(0, -(v59.AbsoluteSize.Y * 1.75 + p57.AbsoluteSize.Y) * 0.5)
			end
			return v62
		end, nil, nil, v_u_55)
		v_u_12.waitUntilSeedEquipped()
		v63()
		v54()
		local v_u_64 = "R2"
		pcall(function()
			-- upvalues: (ref) v_u_64, (ref) v_u_2
			v_u_64 = string.gsub(v_u_2:GetStringForKeyCode(Enum.KeyCode.ButtonR2), "Button", "")
		end)
		v_u_7:CreateNotification(not v56 and "Click on your plot to plant!" or ("Press %* on your plot to plant!"):format(v_u_64))
		local v_u_65 = v_u_1.Tutorial_Parts.Tutorial_Click:Clone()
		v_u_65.Size = Vector3.new(0.001, 0.001, 0.001)
		v_u_65.Position = (v24.Spawn_Point.CFrame * CFrame.new(15, -5, -15)).Position
		if v56 then
			pcall(function()
				-- upvalues: (copy) v_u_65, (ref) v_u_2
				v_u_65.BillboardGui.Size = UDim2.fromScale(1.5, 1.5)
				v_u_65.BillboardGui.ImageLabel.Image = v_u_2:GetImageForKeyCode(Enum.KeyCode.ButtonR2)
			end)
		end
		v_u_65.Parent = workspace.Click_Points
		while #v24.Important.Plants_Physical:GetChildren() <= 0 do
			task.wait()
		end
		v_u_65:Destroy()
		v_u_7:CreateNotification("Wait for your plant to grow then Collect it")
		local v66 = nil
		for _, v67 in v24.Important.Plants_Physical:GetChildren() do
			if v67:IsA("Model") and v67:FindFirstChild("Grow") then
				while v67:IsDescendantOf(v24) and not v67:GetAttribute("MaxAge") do
					v67:GetAttributeChangedSignal("MaxAge"):Wait()
				end
				while v67:IsDescendantOf(v24) and v67.Grow.Age.Value < v67:GetAttribute("MaxAge") do
					v67.Grow.Age.Changed:Wait()
				end
				v66 = v67
			end
		end
		local v68 = v_u_18(v66:GetPivot().Position)
		v_u_7:CreateNotification("Collect your plant!")
		v_u_12.waitUntilSellableItem()
		v68()
		local v69 = v_u_18(workspace.Tutorial_Points.Tutorial_Point_2.Position)
		v_u_12.waitUntilDistance(workspace.Tutorial_Points.Tutorial_Point_2.Position, 5)
		v69()
		v_u_7:CreateNotification("Talk to Steven!")
		while true do
			local v70 = v_u_4:FindFirstChild("Billboard_UI")
			local v_u_71 = v70 and v70:FindFirstChild("Objects")
			if v_u_71 then
				v_u_71 = v70.Objects:FindFirstChildWhichIsA("GuiObject")
			end
			if v_u_71 and v_u_71.Frame.Frame.Text_Element:GetAttribute("Text") == "I want to sell my inventory" then
				if v_u_71 then
					local v_u_72 = Vector2.zero
					local v_u_73 = Vector2.zero
					local v_u_74 = nil
					local function v_u_81()
						-- upvalues: (ref) v_u_74, (ref) v_u_71, (ref) v_u_4, (ref) v_u_72, (ref) v_u_73
						if not v_u_74 then
							local v75 = v_u_71
							local v76 = Vector2.zero
							local v77 = v_u_4:FindFirstChild("Billboard_UI")
							if v77 then
								local v78 = v77.Adornee or v77.Parent
								if v78 and v78:IsA("PVInstance") then
									local v79, v80 = workspace.CurrentCamera:WorldToScreenPoint(v78:GetPivot().Position)
									if v80 then
										v76 = Vector2.new(v79.X, v79.Y)
									else
										v76 = v76 + Vector2.new(0, 999999999999)
									end
								end
							end
							v_u_72 = v76
							v_u_73 = v75.AbsoluteSize
							v_u_74 = true
							task.delay(0, function()
								-- upvalues: (ref) v_u_74
								v_u_74 = false
							end)
						end
					end
					local v_u_82 = Instance.new("UIStroke")
					v_u_82.Name = "UIStroke"
					v_u_82.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
					v_u_82.LineJoinMode = Enum.LineJoinMode.Bevel
					v_u_82.Thickness = 10000
					v_u_82.Transparency = 1
					v_u_10(v_u_82, TweenInfo.new(0.2), {
						["Transparency"] = 0.3
					})
					local v83 = v_u_12.pointToUI(function()
						-- upvalues: (copy) v_u_81, (ref) v_u_72, (ref) v_u_73
						v_u_81()
						return v_u_72 + Vector2.new(v_u_73.X * 0.5, 0)
					end)
					while true do
						local v84 = v_u_4:FindFirstChild("Billboard_UI")
						if not (v84 and (v84:FindFirstChild("Objects") and v84.Objects:FindFirstChildWhichIsA("GuiObject"))) then
							break
						end
						v84.ClipsDescendants = false
						v_u_82.Parent = v84.Objects:FindFirstChild("Option_UI")
						task.wait(0.1)
					end
					v83()
					v_u_10(v_u_82, TweenInfo.new(0.2), {
						["Transparency"] = 1
					}).Completed:Once(function()
						-- upvalues: (copy) v_u_82
						v_u_82:Destroy()
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
	end))
	return v_u_14:WrapClean()
end