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
local v_u_7 = require(v1.Modules.QuestsController)
require(v1.Modules.MarketController)
local v_u_8 = require(v1.Modules.UIComponents.QuestView)
local v_u_9 = require(v1.Data.SharedCycleHandlerData).ButtercupEventQuest
require(v1.Data.DevProductIds)
local v_u_10 = v2.LocalPlayer.PlayerGui:WaitForChild("ButtercupEvent_QuestUI")
local v_u_11 = v_u_10.Main:WaitForChild("Frame")
local v_u_12 = v_u_11:WaitForChild("ScrollingFrame")
local v_u_13 = v_u_12.Template:Clone()
v_u_12.Template:Destroy()
local v_u_14 = nil
local v_u_15 = v6.new("ButtercupEventQuestsUIController", "Buttercup Event Quest")
local function v_u_17()
	-- upvalues: (copy) v_u_5, (ref) v_u_14, (copy) v_u_7
	local v16 = v_u_5:GetData().ButtercupEvent.Quests.CurrentQuestContainer
	if v16 then
		if v_u_7:GetContainerFromId(v16) then
			if v_u_14 then
				v_u_14:SetContainer(v16)
			end
		end
	else
		if v_u_14 then
			v_u_14:SetContainer(nil)
		end
		return
	end
end
function v_u_15.OnStarted(p18)
	-- upvalues: (copy) v_u_9, (copy) v_u_11, (copy) v_u_15, (copy) v_u_17, (ref) v_u_14, (copy) v_u_8, (copy) v_u_12, (copy) v_u_13, (copy) v_u_5, (copy) v_u_4
	if not v_u_9:IsRunning() then
		v_u_9:Start(1769277600)
	end
	p18:Bind(v_u_11.Header.CloseButton.Activated:Connect(function(_, _)
		-- upvalues: (ref) v_u_15
		v_u_15:Close()
	end))
	p18:Bind(v_u_9.IntervalChanged:Connect(function(_, _)
		-- upvalues: (ref) v_u_17
		v_u_17()
	end))
	local v19 = {
		["Parent"] = v_u_12,
		["Template"] = v_u_13,
		["ContainerID"] = nil,
		["AutoUpdate"] = true,
		["ShowCompleted"] = true
	}
	v_u_14 = v_u_8.new(v19)
	if v_u_14 then
		p18._trove:Add(v_u_14)
	end
	p18:Bind(v_u_5:GetPathSignal("ButtercupEvent/Quests/CurrentQuestContainer"):Connect(function()
		-- upvalues: (ref) v_u_17
		v_u_17()
	end))
	p18:Bind(v_u_5:GetPathSignal("QuestContainers/@"):Connect(function()
		-- upvalues: (ref) v_u_17
		v_u_17()
	end))
	v_u_17()
	task.spawn(function()
		-- upvalues: (ref) v_u_9, (ref) v_u_11, (ref) v_u_4
		while task.wait(1) do
			local v20 = v_u_9:GetTimeUntilNext()
			v_u_11.Header.RefreshIn.Timer.Text = ("New Quests in %*"):format((v_u_4.toHMS(v20 or 0)))
		end
	end)
end
function v_u_15.OnEnded(_)
	-- upvalues: (ref) v_u_14
	v_u_14 = nil
end
function v_u_15.Open(_)
	-- upvalues: (copy) v_u_3, (copy) v_u_10
	v_u_3:Open(v_u_10)
end
function v_u_15.Close(_)
	-- upvalues: (copy) v_u_3, (copy) v_u_10
	v_u_3:Close(v_u_10)
end
v_u_3:UsePopupAnims(v_u_10)
return v_u_15