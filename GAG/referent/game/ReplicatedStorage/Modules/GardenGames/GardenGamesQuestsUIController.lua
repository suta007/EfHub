local v1 = game:GetService("ReplicatedStorage")
game:GetService("RunService")
local v2 = game:GetService("Players")
game:GetService("TweenService")
local v_u_3 = require(v1.Modules.GuiController)
require(v1.Modules.Trove)
require(v1.Modules.ItemImageFinder)
local v_u_4 = require(v1.Modules.NumberUtil)
require(v1.Modules.CommaFormatNumber)
require(v1.Modules.GiveServiceCommon)
require(v1.Modules.UpdateService)
require(v1.Modules.Signal)
local v_u_5 = require(v1.Modules.DataService)
require(v1.Modules.GardenGuideModules.ImageCycle)
local v6 = require(v1.Modules.EventService)
require(v1.Modules.QuestsController)
require(v1.Modules.MarketController)
local v_u_7 = require(v1.Modules.UIComponents.QuestView)
local v_u_8 = require(v1.Data.SharedCycleHandlerData).GardenGamesQuest
require(v1.Data.DevProductIds)
local v_u_9 = v2.LocalPlayer.PlayerGui:WaitForChild("TheGardenGames_QuestUI")
local v_u_10 = v_u_9.Main:WaitForChild("Frame")
local v_u_11 = v_u_10:WaitForChild("ScrollingFrame")
local v_u_12 = v_u_11.Template:Clone()
v_u_11.Template:Destroy()
local v_u_13 = nil
local v_u_14 = v6.new("GardenQuestUIController", "Garden Games Quest")
local function v_u_18()
	-- upvalues: (copy) v_u_5, (ref) v_u_13
	local v15 = v_u_5:GetData()
	if v15.GardenGames.Quests.CurrentQuestContainer then
		local v16 = v15.GardenGames.Quests.CurrentQuestContainer
		local v17 = tostring(v16)
		if v_u_13 then
			v_u_13:SetContainer(v17)
		end
	elseif v_u_13 then
		v_u_13:SetContainer(nil)
	end
end
function v_u_14.OnStarted(p19)
	-- upvalues: (copy) v_u_14, (copy) v_u_8, (copy) v_u_10, (ref) v_u_13, (copy) v_u_7, (copy) v_u_11, (copy) v_u_12, (copy) v_u_5, (copy) v_u_18, (copy) v_u_4
	if not v_u_14.IsRunning then
		v_u_8:Start()
	end
	p19:Bind(v_u_10.Header.CloseButton.Activated:Connect(function(_, _)
		-- upvalues: (ref) v_u_14
		v_u_14:Close()
	end))
	p19:Bind(v_u_8.IntervalChanged:Connect(function(_, _) end))
	local v20 = {
		["Parent"] = v_u_11,
		["Template"] = v_u_12,
		["ContainerID"] = nil,
		["AutoUpdate"] = true,
		["ShowCompleted"] = true
	}
	v_u_13 = v_u_7.new(v20)
	if v_u_13 then
		p19._trove:Add(v_u_13)
	end
	local v21 = v_u_5:GetData()
	if v21.GardenGames.Quests.CurrentQuestContainer then
		local v22 = v21.GardenGames.Quests.CurrentQuestContainer
		local v23 = tostring(v22)
		if v_u_13 then
			v_u_13:SetContainer(v23)
		end
	elseif v_u_13 then
		v_u_13:SetContainer(nil)
	end
	p19:Bind(v_u_5:GetPathSignal("GardenGames/Quests/CurrentQuestContainer"):Connect(v_u_18))
	task.spawn(function()
		-- upvalues: (ref) v_u_8, (ref) v_u_10, (ref) v_u_4
		while task.wait(1) do
			v_u_8:GetCurrentCycle()
			local v24 = v_u_8:GetTimeUntilNext()
			v_u_10.Header.RefreshIn.Timer.Text = ("New Quests in %*"):format((v_u_4.toHMS(v24 or 0)))
		end
	end)
end
function v_u_14.OnEnded(_)
	-- upvalues: (ref) v_u_13
	v_u_13 = nil
end
function v_u_14.Open(_)
	-- upvalues: (copy) v_u_3, (copy) v_u_9
	v_u_3:Open(v_u_9)
end
function v_u_14.Close(_)
	-- upvalues: (copy) v_u_3, (copy) v_u_9
	v_u_3:Close(v_u_9)
end
v_u_3:UsePopupAnims(v_u_9)
return v_u_14