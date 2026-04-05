local efHunterEgg = {}
local reg = nil
local sData = nil
local Utils = nil
local fVar = nil

local fireproximityprompt = (getfenv() :: any).fireproximityprompt

function efHunterEgg.Initialize(registry)
	reg = registry
	sData = reg.sData
	Utils = reg.Utils
	fVar = reg.fVar
end

function efHunterEgg.Start()
	if not reg or fVar.IsStartingEggHunt then return end

	Utils.RunWithFlag("IsStartingEggHunt", "StartEggHunt", function()
		local npc = workspace.Interaction.UpdateItems:WaitForChild("Easter2026"):WaitForChild("EggHuntPlatform"):WaitForChild("EasterEggHuntNPC")
		local prompt = npc:WaitForChild("RootPart"):FindFirstChildOfClass("ProximityPrompt")

		if not (npc and prompt) then
			reg.Log("🟡 NPC or ProximityPrompt not found")
			return
		end

		-- Teleport to NPC first
		if sData.Character then
			sData.Character:PivotTo(npc:GetPivot())
			task.wait(0.2)
		end

		-- 1. Click NPC (Trigger Dialogue)
		if typeof(fireproximityprompt) == "function" then
			fireproximityprompt(prompt)
		else
			-- Fallback if fireproximityprompt is not available
			prompt:InputHoldBegin()
			task.wait(prompt.HoldDuration + 0.1)
			prompt:InputHoldEnd()
		end

		-- 2. Wait for dialogue options to appear
		local billboardObjects = sData.PlayerGui:WaitForChild("Billboard_UI"):WaitForChild("Objects")
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
			if targetButton then break end
			task.wait(0.2)
		end

		-- 3. Click the "Start Egg Hunt" button
		if targetButton and targetButton.Active then
			Utils.ClickButton(targetButton)
			reg.Log("✅ Started Easter Egg Hunt")
		else
			reg.Log("❌ Could not find or click 'Start Egg Hunt' button")
		end
	end)
end

function efHunterEgg.CollectEggs()
	if not reg or fVar.IsCollectingEggs then return end

	Utils.RunWithFlag("IsCollectingEggs", "CollectEggs", function()
		reg.Log("🥚 Scanning for eggs...")
		
		while true do
			local targetPrompt = nil
			local targetPos = nil

			-- 1. Scan for collectible eggs
			for _, obj in ipairs(workspace:GetChildren()) do
				if obj.Name == "Model" or obj:IsA("Model") then
					local prompt = obj:FindFirstChildWhichIsA("ProximityPrompt", true)
					if prompt and prompt.ActionText == "Collect" then
						targetPrompt = prompt
						targetPos = (obj.PrimaryPart or obj:FindFirstChildWhichIsA("BasePart") or obj):GetPivot().Position
						break
					end
				end
			end

			if not targetPrompt then
				reg.Log("✅ No more eggs found.")
				break
			end

			-- 2. Teleport to egg
			if sData.Character then
				sData.Character:PivotTo(CFrame.new(targetPos))
				task.wait(0.2)
			end

			-- 3. Trigger collection
			if typeof(fireproximityprompt) == "function" then
				fireproximityprompt(targetPrompt)
			else
				targetPrompt:InputHoldBegin()
				task.wait(targetPrompt.HoldDuration + 0.1)
				targetPrompt:InputHoldEnd()
			end

			task.wait(0.5) -- Cool down
		end
	end)
end

return efHunterEgg
