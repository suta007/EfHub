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
require(v1.Comma_Module)
require(v1.Modules.MarketController)
require(v1.Modules.UIComponents.QuestView)
local _ = require(v1.Data.SharedCycleHandlerData).HeartstruckRain
require(v1.Data.DevProductIds)
local v_u_7 = require(v1.Data.ValentinesEvent.RewardsData2)
local v_u_8 = v2.LocalPlayer.PlayerGui:WaitForChild("ValentinesEvent2_UI")
local v_u_9 = v_u_8.Frame:WaitForChild("Main")
local v10 = v_u_9:WaitForChild("Content")
local v_u_11 = v10:WaitForChild("SmallRewards"):WaitForChild("List")
local v_u_12 = v10:WaitForChild("Progress")
local v_u_13 = v10:WaitForChild("ClaimButton")
local v_u_14 = v6.new("ValentinesEvent2Controller", "Valentines Event 2 2025")
local _ = v1.GameEvents.ValentinesEvent.ClaimValentineReward
local v_u_15 = v1.GameEvents.ValentinesEvent.ClaimValentineReward2
local function v_u_42()
	-- upvalues: (copy) v_u_5, (copy) v_u_7, (copy) v_u_11, (copy) v_u_4, (copy) v_u_14
	local v_u_16 = v_u_5:GetData()
	local v17 = 0
	for v_u_18 = 1, 10 do
		if v_u_7.Rewards[v_u_18] then
			local v19 = v_u_7.Rewards[v_u_18]
			local v20 = v_u_11:FindFirstChild((("Reward%*"):format(v_u_18)))
			if v20 then
				local v21 = v20:FindFirstChild("Content")
				local v22 = v21:FindFirstChild("ITEM_IMAGE")
				local v23 = v21:FindFirstChild("RewardName")
				local v_u_24 = v21:FindFirstChild("ClaimButton")
				local v_u_25 = v21:FindFirstChild("ClaimedDisplay")
				local v_u_26 = v21:FindFirstChild("Price")
				local function v35()
					-- upvalues: (copy) v_u_16, (copy) v_u_18, (copy) v_u_25, (copy) v_u_26, (copy) v_u_24, (ref) v_u_4, (ref) v_u_7
					if v_u_16.ValentinesEvent.Completed2[v_u_18] then
						v_u_25.Visible = true
						v_u_26.Visible = false
						v_u_24.Visible = false
					else
						v_u_26.Visible = true
						v_u_25.Visible = false
						v_u_24.Visible = false
					end
					local v27 = v_u_26.Counter
					local v28 = "%*"
					local v29 = v_u_4.DisplaySheckles
					local v30 = v_u_16
					local v31 = v_u_18
					local v32 = v_u_7.Rewards[v31]
					local v33
					if v32 then
						local v34 = v30.ValentinesEvent.Reward2PriceMultiplier or 1
						v33 = v32.Price * v34
					else
						v33 = 0
					end
					v27.Text = v28:format((v29(v33)))
				end
				v_u_14:Bind(v_u_5:GetPathSignal("Sheckles"):Connect(v35))
				v_u_14:Bind(v_u_5:GetPathSignal("ValentinesEvent/Completed2"):Connect(v35))
				v_u_14:Bind(v_u_5:GetPathSignal("ValentinesEvent/Reward2PriceMultiplier"):Connect(v35))
				if v_u_16.ValentinesEvent.Completed2[v_u_18] then
					v_u_25.Visible = true
					v_u_26.Visible = false
					v_u_24.Visible = false
				else
					v_u_26.Visible = true
					v_u_25.Visible = false
					v_u_24.Visible = false
				end
				local v36 = v_u_26.Counter
				local v37 = "%*"
				local v38 = v_u_4.DisplaySheckles
				local v39 = v_u_7.Rewards[v_u_18]
				local v40
				if v39 then
					local v41 = v_u_16.ValentinesEvent.Reward2PriceMultiplier or 1
					v40 = v39.Price * v41
				else
					v40 = 0
				end
				v36.Text = v37:format((v38(v40)))
				v22.Image = v19.ImageId
				v23.RewardName.Text = v19.ItemName
				v20.LayoutOrder = v17
				v17 = v17 + 100
			end
		end
	end
end
function v_u_14.OnStarted(p43)
	-- upvalues: (copy) v_u_9, (copy) v_u_14, (copy) v_u_42, (copy) v_u_5, (copy) v_u_7, (copy) v_u_12, (copy) v_u_4, (copy) v_u_13, (copy) v_u_15
	p43:Bind(v_u_9.Header.CloseButton.Activated:Connect(function(_, _)
		-- upvalues: (ref) v_u_14
		v_u_14:Close()
	end))
	v_u_42()
	local function v62()
		-- upvalues: (ref) v_u_5, (ref) v_u_7, (ref) v_u_12, (ref) v_u_4, (ref) v_u_13
		local v44 = v_u_5:GetData()
		local v45 = 1
		for v46 = 1, 10 do
			if not v44.ValentinesEvent.Completed2[v46] then
				v45 = v46
				break
			end
		end
		local v47 = v_u_7.Rewards[v45]
		local v48
		if v47 then
			local v49 = v44.ValentinesEvent.Reward2PriceMultiplier or 1
			v48 = v47.Price * v49
		else
			v48 = 0
		end
		local v50 = v44.Sheckles / v48
		local v51 = math.clamp(v50, 0, 1)
		v_u_12.ProgressBar.Bar_Actual:TweenSize(UDim2.fromScale(v51, 1), Enum.EasingDirection.Out, Enum.EasingStyle.Quad, 0.3, true)
		local v52 = v_u_12.ProgressBar.PROGRESS
		local v53 = v_u_4.DisplaySheckles
		local v54 = v44.Sheckles
		local v55 = tostring(v53(v54))
		local v56 = v_u_4.DisplaySheckles
		v52.Text = v55 .. "<font transparency=\".4\">/" .. tostring(v56(v48)) .. "</font>"
		local v57 = v_u_12.ProgressBar.PROGRESS_SHADOW
		local v58 = v_u_4.DisplaySheckles
		local v59 = v44.Sheckles
		local v60 = tostring(v58(v59))
		local v61 = v_u_4.DisplaySheckles
		v57.Text = v60 .. "<font transparency=\".4\">/" .. tostring(v61(v48)) .. "</font>"
		v_u_13.Visible = v48 <= v44.Sheckles
	end
	p43:Bind(v_u_5:GetPathSignal("Sheckles"):Connect(v62))
	p43:Bind(v_u_5:GetPathSignal("ValentinesEvent/Reward2PriceMultiplier"):Connect(v62))
	p43:Bind(v_u_13.Activated:Connect(function()
		-- upvalues: (ref) v_u_15
		v_u_15:FireServer()
	end))
	v62()
	task.spawn(function()
		-- upvalues: (ref) v_u_9, (ref) v_u_4
		while task.wait(1) do
			local v63 = game.ReplicatedFirst.GlobalUpdateTime.Value + 604800 - game.Workspace:GetServerTimeNow()
			v_u_9.Header.RefreshIn.Timer.Text = ("Ends in %*"):format((v_u_4.toDHMS(v63 or 0)))
		end
	end)
end
function v_u_14.OnEnded(_) end
function v_u_14.Open(_)
	-- upvalues: (copy) v_u_3, (copy) v_u_8
	v_u_3:Open(v_u_8)
end
function v_u_14.Close(_)
	-- upvalues: (copy) v_u_3, (copy) v_u_8
	v_u_3:Close(v_u_8)
end
v_u_3:UsePopupAnims(v_u_8)
return v_u_14