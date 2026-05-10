--!nocheck
local Window = {}
local reg = nil

local game = game :: any
local Fluent = loadstring(game:HttpGet("https://github.com/ActualMasterOogway/Fluent-Renewed/releases/latest/download/Fluent.luau"))()
--local Fluent = loadstring(game:HttpGet("https://github.com/dawid-scripts/Fluent/releases/latest/download/main.lua"))()
local SaveManager = loadstring(game:HttpGet("https://raw.githubusercontent.com/dawid-scripts/Fluent/master/Addons/SaveManager.lua"))()
local InterfaceManager = loadstring(game:HttpGet("https://raw.githubusercontent.com/dawid-scripts/Fluent/master/Addons/InterfaceManager.lua"))()

local CollapsibleAddon = loadstring(game:HttpGet("https://raw.githubusercontent.com/suta007/Lua_EfHub/refs/heads/master/Core/CollapsibleSection.lua"))()
--local CollapsibleAddon = loadstring(game:HttpGet("https://raw.githubusercontent.com/suta007/GHZ/refs/heads/master/src/Addons/CollapsibleSection.lua"))()
CollapsibleAddon(Fluent)

function Window.Initialize(Registry)
	reg = Registry
	Registry.IsLoading = true
	--local Constants = reg.Constants

	Registry.Interface = Fluent:CreateWindow({
		Title = "Grow a Garden",
		SubTitle = "2569.05.10-15.35",
		TabWidth = 100,
		Size = UDim2.fromOffset(580, 300),
		Resize = false,
		--MinSize = Vector2.new(580, 400),
		Acrylic = true,
		Theme = "Darker",
		MinimizeKey = Enum.KeyCode.RightControl,
	})

	SaveManager:SetLibrary(Fluent)
	InterfaceManager:SetLibrary(Fluent)
	InterfaceManager:SetFolder("EfHub")
	SaveManager:SetFolder("EfHub/GAG")

	Registry.Tabs = {}
	Registry.Fluent = Fluent
	Registry.SaveManager = SaveManager
	Registry.InterfaceManager = InterfaceManager
	Registry.Options = Fluent.Options

	------------------------------------------------------
	-- ระบบปุ่มลอย (Floating Button) - ฉบับแก้ไข
	------------------------------------------------------
	local ToggleGui = Instance.new("ScreenGui")
	local ToggleButton = Instance.new("TextButton")
	local UICorner = Instance.new("UICorner")

	ToggleGui.Name = "Ef_Toggle"
	ToggleGui.Parent = game:GetService("CoreGui")
	ToggleGui.ResetOnSpawn = false

	ToggleButton.Name = "ToggleButton"
	ToggleButton.Parent = ToggleGui
	ToggleButton.BackgroundColor3 = Color3.fromRGB(100, 20, 20)
	ToggleButton.Position = UDim2.new(0, 10, 0.10, 0)
	ToggleButton.Size = UDim2.fromOffset(50, 50)
	ToggleButton.Text = "GAG"
	ToggleButton.TextColor3 = Color3.fromRGB(255, 255, 255)
	ToggleButton.Draggable = true -- สำหรับ Delta Executor ตัวนี้ยังใช้ได้ดีค่ะ
	ToggleButton.Active = true

	UICorner.CornerRadius = UDim.new(0, 25)
	UICorner.Parent = ToggleButton

	-- ฟังก์ชันคลิกที่แยกออกมาให้ชัดเจน
	ToggleButton.MouseButton1Click:Connect(function()
		local UI = Registry.Interface
		if UI then
			-- เช็ค Instance (หน้าต่างหลัก)
			if UI.Instance then
				UI.Instance.Enabled = not UI.Instance.Enabled
			-- เช็ค Root (เผื่อบางเวอร์ชันของ Fluent ใช้ตัวแปรนี้)
			elseif UI.Root then
				UI.Root.Visible = not UI.Root.Visible
			end
		end
	end)
end

function Window.Finalize()
	reg.Tabs.Settings = reg.Interface:AddTab({ Title = "Settings", Icon = "settings" })
	reg.InterfaceManager:BuildInterfaceSection(reg.Tabs.Settings)
	reg.SaveManager:BuildConfigSection(reg.Tabs.Settings)

	reg.Interface:SelectTab(1)

	task.spawn(function()
		while not reg.SaveManager.Options.SaveManager_ConfigList do
			task.wait()
		end
		reg.SaveManager.Options.SaveManager_ConfigList:SetValue("GrowAGarden")
		reg.SaveManager:Load("GrowAGarden")
		reg.IsLoading = false
		reg.Fluent:Notify({
			Title = "EfHub",
			Content = "Settings loaded automatically",
			Duration = 3,
		})
	end)
end

function Window.QuickSave()
	if not reg.IsLoading then
		reg.SaveManager:Save("GrowAGarden")
	end
end

function Window.myMenu()
	local Player = game:GetService("Players")
	local LocalPlayer = Player.LocalPlayer
	local PlayerGui = LocalPlayer:WaitForChild("PlayerGui")
	local Character = LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()
	local myGUIParent = PlayerGui

	local Utils = reg.Utils
	local myFarm = Utils.GetMyFarm()

	local spawnPoint
	if myFarm then
		if myFarm:FindFirstChild("Spawn_Point") then
			spawnPoint = myFarm.Spawn_Point.CFrame
		end
	end

	local ageBreakPos = CFrame.new(-287.182, 5, 168.304)

	local myGUI = Instance.new("ScreenGui", myGUIParent)
	myGUI.Name = "EfHubGUI"
	myGUI.IgnoreGuiInset = true

	local myFrame = Instance.new("Frame", myGUI)
	myFrame.Size = UDim2.new(0.4, 0, 0, 100)
	myFrame.Position = UDim2.new(0.6, 0, 0, 12)

	myFrame.BackgroundTransparency = 1
	myFrame.BorderSizePixel = 0

	local lstLayout = Instance.new("UIListLayout", myFrame)
	lstLayout.FillDirection = Enum.FillDirection.Horizontal
	lstLayout.HorizontalAlignment = Enum.HorizontalAlignment.Left
	lstLayout.VerticalAlignment = Enum.VerticalAlignment.Top
	lstLayout.SortOrder = Enum.SortOrder.LayoutOrder
	lstLayout.Padding = UDim.new(0, 8)

	local txtBtn1 = Instance.new("TextButton", myFrame)
	txtBtn1.Size = UDim2.new(0, 44, 0, 44)
	txtBtn1.Text = "🏠"
	txtBtn1.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
	txtBtn1.BorderSizePixel = 0
	txtBtn1.TextSize = 14
	txtBtn1.TextXAlignment = Enum.TextXAlignment.Center
	txtBtn1.TextYAlignment = Enum.TextYAlignment.Center
	txtBtn1.LayoutOrder = 1
	local btn1Conner = Instance.new("UICorner", txtBtn1)
	btn1Conner.CornerRadius = UDim.new(0, 22)
	txtBtn1.Activated:Connect(function()
		Character:PivotTo(spawnPoint)
	end)

	local txtBtn2 = Instance.new("TextButton", myFrame)
	txtBtn2.Size = UDim2.new(0, 44, 0, 44)
	txtBtn2.Text = "🐙"
	txtBtn2.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
	txtBtn2.BorderSizePixel = 0
	txtBtn2.TextSize = 14
	txtBtn2.TextXAlignment = Enum.TextXAlignment.Center
	txtBtn2.TextYAlignment = Enum.TextYAlignment.Center
	txtBtn2.LayoutOrder = 2
	local btn2Conner = Instance.new("UICorner", txtBtn2)
	btn2Conner.CornerRadius = UDim.new(0, 22)

	txtBtn2.Activated:Connect(function()
		Character:PivotTo(ageBreakPos)
	end)

	local txtBtn3 = Instance.new("TextButton", myFrame)
	txtBtn3.Size = UDim2.new(0, 44, 0, 44)
	txtBtn3.Text = "💎"
	txtBtn3.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
	txtBtn3.BorderSizePixel = 0
	txtBtn3.TextSize = 14
	txtBtn3.TextXAlignment = Enum.TextXAlignment.Center
	txtBtn3.TextYAlignment = Enum.TextYAlignment.Center
	txtBtn3.LayoutOrder = 3
	local btn3Conner = Instance.new("UICorner", txtBtn3)
	btn3Conner.CornerRadius = UDim.new(0, 22)
	txtBtn3.Activated:Connect(function()
		local Options = reg.Options
		Options.tgDisable3D:SetValue(true)
	end)
end

return Window
