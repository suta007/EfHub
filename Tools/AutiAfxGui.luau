local getconnections = (getfenv() :: any).getconnections
local firesignal = (getfenv() :: any).firesignal
local statusGUI = Instance.new("ScreenGui")
local statusText = Instance.new("TextLabel")

local LocalPlayer = game:GetService("Players").LocalPlayer
local PlayerGui = LocalPlayer:WaitForChild("PlayerGui")
local VirtualUser = game:GetService("VirtualUser")
local getgenv = (getfenv() :: any).getgenv

local TargetFolder = getgenv().GetHUI and getgenv().GetHUI() or game:GetService("CoreGui")
local oldFolder = TargetFolder:FindFirstChild("AutoAfxGUI")
if oldFolder then
	oldFolder:Destroy()
end

local statusFolder = Instance.new("Folder")
statusFolder.Name = "AutoAfxGUI"
statusFolder.Parent = TargetFolder

statusGUI.Name = "statusGUI"
statusGUI.Parent = statusFolder
statusGUI.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

statusText.Name = "StatusText"
statusText.Parent = statusGUI
statusText.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
statusText.BackgroundTransparency = 1.000
statusText.BorderSizePixel = 0
statusText.Position = UDim2.fromOffset(10, 5)
statusText.Size = UDim2.fromOffset(100, 50)
statusText.Font = Enum.Font.GothamBold
statusText.Text = "Anti AFX & Gift On"
statusText.TextColor3 = Color3.fromRGB(10, 250, 50)
statusText.TextSize = 14.000
statusText.TextXAlignment = Enum.TextXAlignment.Left
statusText.TextYAlignment = Enum.TextYAlignment.Top
statusText.TextStrokeTransparency = 0.3
statusText.TextStrokeColor3 = Color3.fromRGB(50, 50, 50)

LocalPlayer.Idled:Connect(function()
	VirtualUser:CaptureController()
	VirtualUser:ClickButton2(Vector2.new())
end)

function AcceptGiftPets()
	local ReplicatedStorage = game:GetService("ReplicatedStorage")
	local GameEvents = ReplicatedStorage:WaitForChild("GameEvents")
	local notiFrame = PlayerGui:FindFirstChild("Gift_Notification"):FindFirstChild("Frame")

	local GiftPetEvent = GameEvents:WaitForChild("GiftPet")
	GiftPetEvent.OnClientEvent:Connect(function(...)
		task.spawn(function()
			task.wait(2)
			pcall(function()
				for _, obj in pairs(notiFrame:GetChildren()) do
					if obj.Name == "Gift_Notification" then
						local acceptBtn = obj.Holder.Frame.Accept
						if firesignal then
							firesignal(acceptBtn.MouseButton1Click)
							firesignal(acceptBtn.Activated)
						elseif getconnections then
							for _, connection in pairs(getconnections(acceptBtn.MouseButton1Click)) do
								if connection.Fire then
									connection:Fire()
								else
									connection.Function()
								end
							end
						end
					end
				end
			end)
		end)
	end)
end

AcceptGiftPets()
