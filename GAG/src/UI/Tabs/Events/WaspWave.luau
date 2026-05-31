local WaspWave = {}
local reg
local sData

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer

-- โหลด Remotes ของระบบ Wasp Wave Survival
local WaspSurvivalFolder = ReplicatedStorage:WaitForChild("GameEvents"):WaitForChild("WaspWaveSurvival")
local RequestStart = WaspSurvivalFolder:WaitForChild("RequestStart") -- RemoteFunction
--local RequestExit = WaspSurvivalFolder:WaitForChild("RequestExit") -- RemoteEvent
local RequestClaim = WaspSurvivalFolder:WaitForChild("RequestClaim") -- RemoteEvent
local GetState = WaspSurvivalFolder:WaitForChild("GetState") -- RemoteFunction

local function HealBee()
	local Options = reg.Options
	local Utils = reg.Utils
	local posStr = Options.ipHealBeePos.Value
	if posStr == "" then
		reg.Log("Please set Heal Bee position.", "WARN")
		return
	end
	local parsedPos = Utils.ParseVector3(posStr)
	if not parsedPos then
		reg.Log("Invalid Heal Bee position format.", "ERROR")
		return
	end
	sData.Character:PivotTo(CFrame.new(parsedPos))
	task.spawn(function()
		task.wait(tonumber(Options.ipHealBeeTime.Value))
		Options.tgKeepPosEnable:SetValue(true)
		Options.tgWaspWarEnable:SetValue(true)
	end)
end

local function IsClaimUiVisible()
	local playerGui = LocalPlayer:FindFirstChildOfClass("PlayerGui")
	local survivalUI = playerGui and playerGui:FindFirstChild("WaspWaveSurvivalUI")
	if survivalUI then
		local victory = survivalUI:FindFirstChild("Victory")
		local conclusion = survivalUI:FindFirstChild("WaspWaveConclusionPanel")
		if (victory and victory.Visible == true) or (conclusion and conclusion.Visible == true) then
			return true
		end
	end
	return false
end

local function GetCurrentState()
	local success, state = pcall(function()
		return GetState:InvokeServer()
	end)
	if success and typeof(state) == "table" then
		return state
	end
	return nil
end

local function runDungeon()
	local Options = reg.Options
	if LocalPlayer:GetAttribute("InWaspWaveSurvival") == true then
		if IsClaimUiVisible() then
			reg.Log("[WaspWave] กำลังเคลมรางวัล...", "INFO")
			RequestClaim:FireServer()
			task.wait(1)
			HealBee()
		end
		return
	end

	local state = GetCurrentState()
	if not state then
		reg.Log("[WaspWave] ไม่สามารถดึงสถานะจากเซิร์ฟเวอร์ได้", "WARN")
		return
	end

	if state.PortalReady then
		reg.Log("[WaspWave] พอร์ทัลพร้อมแล้ว กำลังเข้าดันเจี้ยน...", "INFO")
		RequestStart:InvokeServer()
		Options.tgKeepPosEnable:SetValue(false)
		Options.tgWaspWarEnable:SetValue(false)
		task.wait(1)
		return
	end

	if state.PortalCanIgnite then
		reg.Log("[WaspWave] พอร์ทัลสามารถจุดได้ กำลังจุดพอร์ทัล...", "INFO")
		RequestStart:InvokeServer()
		task.wait(1)
		return
	end
end

function WaspWave.Initialize(registry, tab)
	reg = registry
	local Options = reg.Options
	_ = Options
	local QuickSave = reg.Window.QuickSave
	local EventsTab = tab
	sData = reg.sData
	local EfTasks = reg.EfTasks

	local WaspWaveSection = EventsTab:AddCollapsibleSection("WaspWave", false)

	WaspWaveSection:AddToggle("tgWaspWaveEnable", {
		Title = "Wasp Wave Enable",
		Default = false,
		Callback = function(Value)
			QuickSave()
			EfTasks.ToggleTask("AutoWaspWave", Value, function()
				runDungeon()
				task.wait(5)
			end)
		end,
	})
end

return WaspWave
