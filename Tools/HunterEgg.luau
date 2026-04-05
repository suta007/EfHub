local Workspace = game:GetService("Workspace")

local Players = game:GetService("Players")
local Player = Players.LocalPlayer
local PlayerGui = Player:WaitForChild("PlayerGui")
local Character = Player.Character or Player.CharacterAdded:Wait()

local fireproximityprompt = (getfenv() :: any).fireproximityprompt

local npc = Workspace.Interaction.UpdateItems:WaitForChild("Easter2026"):WaitForChild("EggHuntPlatform"):WaitForChild("EasterEggHuntNPC")
local prompt = npc:WaitForChild("RootPart"):FindFirstChildOfClass("ProximityPrompt")

local getconnections = (getfenv() :: any).getconnections

local function ClickButton(Button)
	if getconnections then
		for _, connection in pairs(getconnections(Button.Activated)) do
			connection:Fire()
		end
	end
end

Character:PivotTo(npc:GetPivot())

if typeof(fireproximityprompt) == "function" then
	fireproximityprompt(prompt)
else
	prompt:InputHoldBegin()
	task.wait(prompt.HoldDuration + 0.1)
	prompt:InputHoldEnd()
end

local billboardObjects = PlayerGui:WaitForChild("Billboard_UI"):WaitForChild("Objects")
local startTime = os.clock()
local targetButton = nil

-- Wait up to 5 seconds for the button
while os.clock() - startTime < 5 do
	for _, obj in ipairs(billboardObjects:GetChildren()) do
		local frame = obj:FindFirstChild("Frame")
		local textElem = frame and frame:FindFirstChild("Frame") and frame.Frame:FindFirstChild("Text_Element")

		if textElem then
			local textAttr = textElem:GetAttribute("Text")
			if textAttr == "Start Egg Hunt" then
				targetButton = textElem.Parent.Parent:FindFirstChildWhichIsA("ImageButton")
				break
			end
		end
	end
	if targetButton then
		break
	end
	task.wait(0.2)
end

-- 3. Click the "Start Egg Hunt" button
if targetButton and targetButton.Active then
	ClickButton(targetButton)
	print("✅ Started Easter Egg Hunt")
else
	print("❌ Could not find or click 'Start Egg Hunt' button")
end
