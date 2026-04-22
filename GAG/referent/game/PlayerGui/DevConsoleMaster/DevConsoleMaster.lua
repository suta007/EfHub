local v_u_1 = game:GetService("UserInputService")
game:GetService("GuiService")
local v_u_2 = game:GetService("TweenService")
local v3 = game:GetService("RunService")
local v4 = game:GetService("ReplicatedStorage")
local v5 = game:GetService("Players")
game:GetService("CollectionService")
if game:GetService("ReplicatedFirst").EnableServerConsole.Value then
	local v6 = require(v4.Modules.GameConfigController)
	local v7 = require(v4.Modules.ModernInputNotificationUserInterfaceService)
	local v8 = require(v4.Modules.Icon)
	local v9 = v5.LocalPlayer:GetRankInGroup(35789249)
	if table.find(v6:GetConfig("AuthorizedRolesQAGame") or {}, v9) then
		local v_u_10 = v8.new()
		v_u_10:setName("SERVER CONSOLE")
		v_u_10:setOrder(4)
		v_u_10:setLabel("SERVER CONSOLE")
		v_u_10:align("Right")
		v_u_10:setCaption("Toggle the server console.")
		v_u_10.deselectWhenOtherIconSelected = false
		local v11 = v4:WaitForChild("DevConsoleReplicator")
		v11:FireServer()
		v7:CreateNotification({
			["Text"] = "You have access to the server console! Press [C] to toggle!",
			["Icon"] = "rbxassetid://0",
			["EnabledComponents"] = {
				["OptionSet"] = true,
				["Confirm"] = true,
				["Decline"] = false,
				["IconSet"] = true
			},
			["Lifetime"] = 3
		})
		local v_u_12 = script.Parent
		local v_u_13 = v_u_12:WaitForChild("DevConsoleWindow")
		local v14 = v_u_13.DevConsoleUI
		local v15 = v14.TopBar
		local v16 = v14.MainView
		local v17 = v16.UtilAndTab.UtilBar.FilterCheckBoxes
		local v_u_18 = v16.ClientLog
		local v_u_19 = v16.UtilAndTab.UtilBar.SearchBar.InputField.TextBox
		local v_u_20 = v_u_18.LogTemplate
		local v21 = v15.CloseButton
		local v22 = v_u_13.ResizeButton
		local v_u_23 = workspace.CurrentCamera
		workspace:GetPropertyChangedSignal("CurrentCamera"):Connect(function()
			-- upvalues: (ref) v_u_23
			v_u_23 = workspace.CurrentCamera
		end)
		local v24 = v_u_23.ViewportSize
		local v25 = v_u_13.Size
		local v26 = v24.X / 2
		local v27 = v24.Y / 2
		local v28 = v26 - v25.X.Offset / 2
		local v29 = v27 - v25.Y.Offset / 2
		v_u_13.Position = UDim2.fromOffset(v28, v29)
		v_u_23:GetPropertyChangedSignal("ViewportSize"):Connect(function()
			-- upvalues: (ref) v_u_23, (copy) v_u_13
			local v30 = v_u_23.ViewportSize / 1.5
			v_u_13.Size = UDim2.fromOffset(v30.X, v30.Y)
			local v31 = v_u_23.ViewportSize
			local v32 = v_u_13.Size
			local v33 = v31.X / 2
			local v34 = v31.Y / 2
			local v35 = v33 - v32.X.Offset / 2
			local v36 = v34 - v32.Y.Offset / 2
			v_u_13.Position = UDim2.fromOffset(v35, v36)
		end)
		local v_u_45 = {
			["ConsoleActiveState"] = false,
			["IsResizingDragging"] = false,
			["IsRepositioningDragging"] = false,
			["ActiveOutputFlags"] = {
				["Error"] = true,
				["Info"] = true,
				["Output"] = true,
				["Warn"] = true
			},
			["CurrentQuery"] = "",
			["TotalLogged"] = 0,
			["Toggle"] = function(_, p37)
				-- upvalues: (copy) v_u_45, (ref) v_u_23, (copy) v_u_13, (copy) v_u_12
				v_u_45.ConsoleActiveState = p37
				if p37 then
					local v38 = v_u_23.ViewportSize / 1.5
					v_u_13.Size = UDim2.fromOffset(v38.X, v38.Y)
					local v39 = v_u_23.ViewportSize
					local v40 = v_u_13.Size
					local v41 = v39.X / 2
					local v42 = v39.Y / 2
					local v43 = v41 - v40.X.Offset / 2
					local v44 = v42 - v40.Y.Offset / 2
					v_u_13.Position = UDim2.fromOffset(v43, v44)
				end
				v_u_12.Enabled = p37
			end
		}
		local v_u_46 = {
			["Error"] = {
				["Icon"] = "rbxasset://textures/DevConsole/Error.png",
				["Color"] = Color3.fromRGB(215, 90, 74)
			},
			["Warn"] = {
				["Icon"] = "rbxasset://textures/DevConsole/Warning.png",
				["Color"] = Color3.fromRGB(255, 218, 68)
			},
			["Output"] = {
				["Icon"] = "",
				["Color"] = Color3.fromRGB(255, 255, 255)
			},
			["Info"] = {
				["Icon"] = "rbxasset://textures/DevConsole/Info.png",
				["Color"] = Color3.fromRGB(0, 162, 255)
			}
		}
		local function v_u_51(p47)
			-- upvalues: (copy) v_u_45
			if p47:IsA("Frame") then
				local v48 = p47:FindFirstChild("LogMessage")
				if v48 then
					local v49 = v_u_45.ActiveOutputFlags[p47:GetAttribute("LogType")]
					local v50 = v_u_45.CurrentQuery:lower()
					if v50 == "" then
						return v49
					else
						return v48.Text:lower():find(v50) and v49
					end
				else
					return true
				end
			else
				return true
			end
		end
		local function v_u_57(p52, p53)
			-- upvalues: (copy) v_u_46, (copy) v_u_20, (copy) v_u_45, (copy) v_u_18, (copy) v_u_51
			local v54 = v_u_46[p52]
			if v54 then
				local v_u_55 = v_u_20:Clone()
				v_u_55.LogMessage.Text = ("%* -- %*"):format(os.date("%H:%M:%S"), p53)
				v_u_55.LogMessage.TextColor3 = v54.Color
				local v56 = v_u_45
				v56.TotalLogged = v56.TotalLogged + 1
				v_u_55.LayoutOrder = -999999999 + v_u_45.TotalLogged
				v_u_55:AddTag((("Log%*"):format(p52)))
				v_u_55:SetAttribute("LogType", p52)
				v_u_55.Parent = v_u_18
				task.defer(function()
					-- upvalues: (copy) v_u_55, (ref) v_u_51
					v_u_55.Visible = v_u_51(v_u_55)
				end)
				return v_u_55
			end
		end
		function v_u_45.Error(_, p58)
			-- upvalues: (copy) v_u_57
			return v_u_57("Error", p58)
		end
		function v_u_45.Warn(_, p59)
			-- upvalues: (copy) v_u_57
			return v_u_57("Warn", p59)
		end
		function v_u_45.Output(_, p60)
			-- upvalues: (copy) v_u_57
			return v_u_57("Output", p60)
		end
		function v_u_45.Info(_, p61)
			-- upvalues: (copy) v_u_57
			return v_u_57("Info", p61)
		end
		function v_u_45.Search(_, p62)
			-- upvalues: (copy) v_u_45, (copy) v_u_18, (copy) v_u_51
			v_u_45.CurrentQuery = p62
			for _, v63 in v_u_18:GetChildren() do
				if v63:IsA("Frame") and v63:GetAttribute("LogType") then
					v63.Visible = v_u_51(v63)
				end
			end
		end
		v_u_19:GetPropertyChangedSignal("Text"):Connect(function()
			-- upvalues: (copy) v_u_45, (copy) v_u_19
			v_u_45:Search(v_u_19.Text)
		end)
		v11.OnClientEvent:Connect(function(p64, p65)
			-- upvalues: (copy) v_u_45
			local v66 = v_u_45[p65]
			if v66 then
				v66(v_u_45, p64)
			end
		end)
		local v_u_67 = v_u_45.ActiveOutputFlags
		for _, v68 in v17:GetChildren() do
			if v68:IsA("ImageButton") then
				local v_u_69 = v68.Name
				if v_u_67[v_u_69] == nil then
					warn(v_u_69, "Is not registered as a valid output flag!")
				else
					local v_u_70 = v68:FindFirstChild("Icon")
					if v_u_70 then
						local function v_u_72()
							-- upvalues: (copy) v_u_67, (copy) v_u_69, (copy) v_u_2, (copy) v_u_70, (copy) v_u_45
							local v71 = v_u_67[v_u_69]
							v_u_2:Create(v_u_70, TweenInfo.new(0.1), {
								["ImageTransparency"] = v71 and 0 or 1,
								["BackgroundColor3"] = v71 and Color3.fromRGB(50, 181, 255) or Color3.fromRGB(78, 84, 96),
								["BorderSizePixel"] = v71 and 0 or 1
							}):Play()
							v_u_45:Search(v_u_45.CurrentQuery)
						end
						v68.MouseButton1Down:Connect(function()
							-- upvalues: (copy) v_u_67, (copy) v_u_69, (copy) v_u_72
							v_u_67[v_u_69] = not v_u_67[v_u_69]
							v_u_72()
						end)
					end
				end
			end
		end
		v22.MouseButton1Down:Connect(function()
			-- upvalues: (copy) v_u_45
			v_u_45.IsResizingDragging = true
		end)
		v22.MouseButton1Up:Connect(function()
			-- upvalues: (copy) v_u_45
			v_u_45.IsResizingDragging = false
		end)
		v15.MouseButton1Down:Connect(function()
			-- upvalues: (copy) v_u_45
			v_u_45.IsRepositioningDragging = true
		end)
		v15.MouseButton1Up:Connect(function()
			-- upvalues: (copy) v_u_45
			v_u_45.IsRepositioningDragging = false
		end)
		v21.MouseButton1Down:Connect(function()
			-- upvalues: (copy) v_u_45
			v_u_45:Toggle(false)
		end)
		local v_u_73 = {}
		local v_u_74 = {
			[Enum.KeyCode.C] = {
				["TOGGLE"] = function()
					-- upvalues: (copy) v_u_45, (copy) v_u_10
					v_u_45.ConsoleActiveState = not v_u_45.ConsoleActiveState
					if v_u_45.ConsoleActiveState then
						v_u_10:select()
					else
						v_u_10:deselect()
					end
				end
			}
		}
		local v_u_75 = {
			[Enum.UserInputType.MouseMovement] = {}
		}
		local v_u_76 = v_u_1:GetMouseLocation()
		v3.RenderStepped:Connect(function()
			-- upvalues: (copy) v_u_1, (ref) v_u_76, (copy) v_u_45, (copy) v_u_13
			local v77 = v_u_1:GetMouseLocation()
			if v77 ~= v_u_76 then
				local v78 = v77.X - v_u_76.X
				local v79 = v77.Y - v_u_76.Y
				v_u_76 = v77
				if v_u_1:IsMouseButtonPressed(Enum.UserInputType.MouseButton1) then
					if v_u_45.IsResizingDragging then
						v_u_13.Size = v_u_13.Size + UDim2.fromOffset(v78, v79)
					end
					if v_u_45.IsRepositioningDragging then
						v_u_13.Position = v_u_13.Position + UDim2.fromOffset(v78, v79)
					end
				end
			end
		end)
		v_u_1.InputBegan:Connect(function(p_u_80, p81)
			-- upvalues: (copy) v_u_73
			if p81 then
				return
			else
				local v82 = v_u_73[p_u_80.KeyCode] or v_u_73[p_u_80.UserInputType]
				if v82 then
					for _, v_u_83 in v82 do
						task.spawn(function()
							-- upvalues: (copy) v_u_83, (copy) p_u_80
							v_u_83(p_u_80)
						end)
					end
				end
			end
		end)
		v_u_1.InputEnded:Connect(function(p_u_84, p85)
			-- upvalues: (copy) v_u_74
			if p85 then
				return
			else
				local v86 = v_u_74[p_u_84.KeyCode] or v_u_74[p_u_84.UserInputType]
				if v86 then
					for _, v_u_87 in v86 do
						task.spawn(function()
							-- upvalues: (copy) v_u_87, (copy) p_u_84
							v_u_87(p_u_84)
						end)
					end
				end
			end
		end)
		v_u_1.InputChanged:Connect(function(p_u_88, p89)
			-- upvalues: (copy) v_u_75
			if p89 then
				return
			else
				local v90 = v_u_75[p_u_88.KeyCode] or v_u_75[p_u_88.UserInputType]
				if v90 then
					for _, v_u_91 in v90 do
						task.spawn(function()
							-- upvalues: (copy) v_u_91, (copy) p_u_88
							v_u_91(p_u_88)
						end)
					end
				end
			end
		end)
		v_u_10.selected:Connect(function(_)
			-- upvalues: (copy) v_u_45
			v_u_45:Toggle(true)
		end)
		v_u_10.deselected:Connect(function(_)
			-- upvalues: (copy) v_u_45
			v_u_45:Toggle(false)
		end)
	end
else
	return
end