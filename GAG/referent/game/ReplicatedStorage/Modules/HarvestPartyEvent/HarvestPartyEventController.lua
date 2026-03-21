local v1 = game:GetService("ReplicatedStorage")
game:GetService("RunService")
local v2 = game:GetService("Players")
game:GetService("TweenService")
require(v1.Modules.GuiController)
require(v1.Modules.Trove)
require(v1.Modules.ItemImageFinder)
require(v1.Modules.NumberUtil)
require(v1.Modules.CommaFormatNumber)
require(v1.Modules.GiveServiceCommon)
require(v1.Modules.UpdateService)
require(v1.Modules.Signal)
require(v1.Modules.DataService)
require(v1.Modules.GardenGuideModules.ImageCycle)
local v3 = require(v1.Modules.EventService)
require(v1.Modules.QuestsController)
local v_u_4 = require(v1.Comma_Module)
require(v1.Code.Spr)
require(v1.Modules.MarketController)
require(v1.Modules.UIComponents.QuestView)
local _ = require(v1.Data.SharedCycleHandlerData).HeartstruckRain
require(v1.Data.DevProductIds)
local v_u_5 = require(script.ConfettiEffect)
local v_u_6 = require(script.RainbowFlashEffect)
local v_u_7 = require(script.TierPopEffect)
local v8 = v2.LocalPlayer.PlayerGui
local v_u_9 = v8:WaitForChild("EFFECTS_UI")
local v_u_10 = v8:WaitForChild("Shop_UI")
local v11 = v3.new("HarvestPartyEventController", "Harvest Party Event")
local function v_u_14(p_u_12)
	-- upvalues: (copy) v_u_9, (copy) v_u_5, (copy) v_u_6, (copy) v_u_7
	local v_u_13 = v_u_9
	task.spawn(function()
		-- upvalues: (ref) v_u_5, (copy) v_u_13, (copy) p_u_12
		v_u_5.Play(v_u_13, p_u_12)
	end)
	task.spawn(function()
		-- upvalues: (ref) v_u_6, (copy) v_u_13, (copy) p_u_12
		v_u_6.Play(v_u_13, p_u_12)
	end)
	task.spawn(function()
		-- upvalues: (ref) v_u_7, (copy) v_u_13, (copy) p_u_12
		v_u_7.Play(v_u_13, p_u_12)
	end)
end
function v11.OnStarted(p15)
	-- upvalues: (copy) v_u_10, (copy) v_u_4, (copy) v_u_14
	local v16 = game.Workspace.Interaction:WaitForChild("RichStand", 300)
	if v16 then
		local v17 = v_u_10:WaitForChild("Frame", 30):WaitForChild("ScrollingFrame", 30):WaitForChild("StartAParty", 30)
		if v17 then
			v17.Visible = true
		end
		local v_u_18 = v16.PrimaryPart:WaitForChild("BillboardGui"):WaitForChild("CanvasGroup"):WaitForChild("ProgressBar")
		local function v_u_26()
			-- upvalues: (copy) v_u_18, (ref) v_u_4
			local v19 = game.Workspace:GetAttribute("HARVEST_PARTY_COUNT")
			local v20 = game.Workspace:GetAttribute("HARVEST_PARTY_MAX_COUNT")
			local v21 = v19 or game.Workspace:GetAttributeChangedSignal("HARVEST_PARTY_COUNT"):Wait()
			local v22 = v20 or game.Workspace:GetAttributeChangedSignal("HARVEST_PARTY_MAX_COUNT"):Wait()
			v_u_18.PROGRESS.Text = v_u_4.Comma(v21) .. "\194\162/" .. v_u_4.Comma(v22) .. "\194\162<font transparency=\".1\"></font>"
			v_u_18.PROGRESS_SHADOW.Text = v_u_4.Comma(v21) .. "\194\162/" .. v_u_4.Comma(v22) .. "\194\162<font transparency=\".1\"></font>"
			local v23 = v_u_18.Bar_Actual
			local v24 = UDim2.fromScale
			local v25 = v21 / v22
			v23.Size = v24(math.clamp(v25, 0, 1), 1)
		end
		p15:Bind(game.Workspace:GetAttributeChangedSignal("HARVEST_PARTY_COUNT"):Connect(function()
			-- upvalues: (copy) v_u_26
			v_u_26()
		end))
		p15:Bind(game.Workspace:GetAttributeChangedSignal("HARVEST_PARTY_MAX_COUNT"):Connect(function()
			-- upvalues: (copy) v_u_26
			v_u_26()
		end))
		p15:Bind(game.Workspace:GetAttributeChangedSignal("HARVEST_PARTY_TIER"):Connect(function()
			-- upvalues: (ref) v_u_14, (copy) v_u_26
			local v27 = game.Workspace:GetAttribute("HARVEST_PARTY_TIER")
			if v27 and v27 > 0 then
				v_u_14(v27)
			end
			v_u_26()
		end))
		v_u_26()
	end
end
function v11.OnStopped(_)
	-- upvalues: (copy) v_u_10
	local v28 = v_u_10:WaitForChild("Frame", 30):WaitForChild("ScrollingFrame", 30):WaitForChild("StartAParty", 30)
	if v28 then
		v28.Visible = false
	end
end
function v11.Open(_) end
function v11.Close(_) end
return v11