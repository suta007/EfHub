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
local v_u_7 = require(v1.Comma_Module)
require(v1.Modules.MarketController)
require(v1.Modules.UIComponents.QuestView)
local _ = require(v1.Data.SharedCycleHandlerData).HeartstruckRain
require(v1.Data.DevProductIds)
local v_u_8 = require(v1.Data.ValentinesEvent.RewardsData)
local v9 = v2.LocalPlayer.PlayerGui
local v_u_10 = v9:WaitForChild("ValentinesEvent_UI")
local v_u_11 = v9:WaitForChild("Shop_UI")
local v_u_12 = v_u_10.Frame:WaitForChild("Main")
local v13 = v_u_12:WaitForChild("Content")
local v_u_14 = v13:WaitForChild("SmallRewards")
local v_u_15 = v13:WaitForChild("Progress")
local v_u_16 = v6.new("ValentinesEventController", "Valentines Event 2025")
local v_u_17 = v1.GameEvents.ValentinesEvent.ClaimValentineReward
local function v_u_30()
	-- upvalues: (copy) v_u_5, (copy) v_u_8, (copy) v_u_14, (copy) v_u_16, (copy) v_u_17, (copy) v_u_7
	local v_u_18 = v_u_5:GetData()
	local v19 = 0
	for v_u_20 = 1, 5 do
		if v_u_8.Rewards[v_u_20] then
			local v_u_21 = v_u_8.Rewards[v_u_20]
			local v22 = v_u_14:FindFirstChild((("Reward%*"):format(v_u_20)))
			if v22 then
				local v23 = v22:FindFirstChild("Content")
				local v24 = v23:FindFirstChild("ITEM_IMAGE")
				local v25 = v23:FindFirstChild("RewardName")
				local v_u_26 = v23:FindFirstChild("ClaimButton")
				local v_u_27 = v23:FindFirstChild("ClaimedDisplay")
				local v_u_28 = v23:FindFirstChild("Price")
				local function v29()
					-- upvalues: (copy) v_u_18, (copy) v_u_21, (copy) v_u_20, (copy) v_u_26, (copy) v_u_28, (copy) v_u_27
					if v_u_18.SpecialCurrency.HeartCoins >= v_u_21.Price and not v_u_18.ValentinesEvent.Completed[v_u_20] then
						v_u_26.Visible = true
						v_u_28.Visible = false
						v_u_27.Visible = false
						return
					elseif v_u_18.ValentinesEvent.Completed[v_u_20] then
						v_u_27.Visible = true
						v_u_28.Visible = false
						v_u_26.Visible = false
					else
						v_u_28.Visible = true
						v_u_27.Visible = false
						v_u_26.Visible = false
					end
				end
				v_u_16:Bind(v_u_5:GetPathSignal("SpecialCurrency/HeartCoins"):Connect(v29))
				v_u_16:Bind(v_u_5:GetPathSignal("ValentinesEvent/Completed"):Connect(v29))
				if v_u_18.SpecialCurrency.HeartCoins >= v_u_21.Price and not v_u_18.ValentinesEvent.Completed[v_u_20] then
					v_u_26.Visible = true
					v_u_28.Visible = false
					v_u_27.Visible = false
				elseif v_u_18.ValentinesEvent.Completed[v_u_20] then
					v_u_27.Visible = true
					v_u_28.Visible = false
					v_u_26.Visible = false
				else
					v_u_28.Visible = true
					v_u_27.Visible = false
					v_u_26.Visible = false
				end
				v_u_16:Bind(v_u_26.Activated:Connect(function()
					-- upvalues: (ref) v_u_17, (copy) v_u_20
					v_u_17:FireServer(v_u_20)
				end))
				v24.Image = v_u_21.ImageId
				v25.RewardName.Text = v_u_21.ItemName
				v_u_28.Counter.Text = ("%*"):format((v_u_7.Comma(v_u_21.Price)))
				v22.LayoutOrder = v19
				v19 = v19 + 100
			end
		end
	end
end
function v_u_16.OnStarted(p31)
	-- upvalues: (copy) v_u_11, (copy) v_u_12, (copy) v_u_16, (copy) v_u_30, (copy) v_u_5, (copy) v_u_15, (copy) v_u_7, (copy) v_u_4
	task.spawn(function()
		-- upvalues: (ref) v_u_11
		local v32 = v_u_11:WaitForChild("Frame", 30):WaitForChild("ScrollingFrame", 30):WaitForChild("ValentinesFrame", 30)
		if v32 then
			v32.Visible = true
		end
	end)
	p31:Bind(v_u_12.Header.CloseButton.Activated:Connect(function(_, _)
		-- upvalues: (ref) v_u_16
		v_u_16:Close()
	end))
	v_u_30()
	local function v42()
		-- upvalues: (ref) v_u_5, (ref) v_u_15, (ref) v_u_7
		local v33 = v_u_5:GetData()
		local v34 = v33.SpecialCurrency.HeartCoins / 10000
		local v35 = math.clamp(v34, 0, 1)
		v_u_15.ProgressBar.Bar_Actual:TweenSize(UDim2.fromScale(v35, 1), Enum.EasingDirection.Out, Enum.EasingStyle.Quad, 0.3, true)
		local v36 = v_u_15.ProgressBar.PROGRESS
		local v37 = v_u_7.Comma
		local v38 = v33.SpecialCurrency.HeartCoins
		v36.Text = tostring(v37(v38)) .. "\226\157\164\239\184\143<font transparency=\".4\">/10,000\226\157\164\239\184\143</font>"
		local v39 = v_u_15.ProgressBar.PROGRESS_SHADOW
		local v40 = v_u_7.Comma
		local v41 = v33.SpecialCurrency.HeartCoins
		v39.Text = tostring(v40(v41)) .. "\226\157\164\239\184\143<font transparency=\".4\">/10,000\226\157\164\239\184\143</font>"
	end
	p31:Bind(v_u_5:GetPathSignal("SpecialCurrency/HeartCoins"):Connect(v42))
	v42()
	task.spawn(function()
		-- upvalues: (ref) v_u_12, (ref) v_u_4
		while task.wait(1) do
			local v43 = game.ReplicatedFirst.GlobalUpdateTime.Value + 604800 - game.Workspace:GetServerTimeNow()
			v_u_12.Header.RefreshIn.Timer.Text = ("Ends in %*"):format((v_u_4.toDHMS(v43 or 0)))
		end
	end)
end
function v_u_16.OnStopped(_)
	-- upvalues: (copy) v_u_11
	local v44 = v_u_11:WaitForChild("Frame", 30):WaitForChild("ScrollingFrame", 30):WaitForChild("ValentinesFrame", 30)
	if v44 then
		v44.Visible = false
	end
end
function v_u_16.Open(_)
	-- upvalues: (copy) v_u_3, (copy) v_u_10
	v_u_3:Open(v_u_10)
end
function v_u_16.Close(_)
	-- upvalues: (copy) v_u_3, (copy) v_u_10
	v_u_3:Close(v_u_10)
end
v_u_3:UsePopupAnims(v_u_10)
return v_u_16