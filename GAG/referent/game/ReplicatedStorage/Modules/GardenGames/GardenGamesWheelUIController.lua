local v1 = game:GetService("ReplicatedStorage")
local v_u_2 = game:GetService("RunService")
local v3 = game:GetService("Players")
local v_u_4 = game:GetService("TweenService")
local v_u_5 = game:GetService("SoundService")
local v_u_6 = require(v1.Modules.GuiController)
require(v1.Modules.Trove)
require(v1.Modules.ItemImageFinder)
require(v1.Modules.NumberUtil)
require(v1.Modules.CommaFormatNumber)
require(v1.Modules.GiveServiceCommon)
require(v1.Modules.UpdateService)
require(v1.Modules.Signal)
local v_u_7 = require(v1.Modules.DataService)
require(v1.Modules.GardenGuideModules.ImageCycle)
local v8 = require(v1.Modules.EventService)
local v_u_9 = require(v1.Modules.MarketController)
require(v1.Modules.UIComponents.QuestView)
local v_u_10 = require(v1.Data.SharedCycleHandlerData).GardenGamesQuest
require(v1.Data.DevProductIds)
local v_u_11 = require(v1.Data.GardenGame.WheelRewards)
local v_u_12 = require(v1.Data.CarrotCoinData)
local v_u_13 = v3.LocalPlayer.PlayerGui:WaitForChild("TheGardenGames_SpinWheel")
local v_u_14 = v_u_13.WheelFrame
local v_u_15 = v_u_14:WaitForChild("Center")
local v_u_16 = v_u_15:WaitForChild("Rewards")
local v_u_17 = v_u_14:WaitForChild("SpinButton")
local v_u_18 = v_u_14:WaitForChild("OddsFrame")
local v_u_19 = require(game.ReplicatedStorage:WaitForChild("Comma_Module"))
local v_u_20 = v_u_18.Template
v_u_20.Parent = nil
local v_u_21 = v1:WaitForChild("GameEvents"):WaitForChild("GardenGame"):WaitForChild("Spin")
local v_u_22 = v8.new("GardenWheelUIController", "Garden Games Wheel")
local v_u_23 = false
local function v_u_28()
	-- upvalues: (copy) v_u_7, (copy) v_u_17, (copy) v_u_19
	local v24 = v_u_7:GetData().SpecialCurrency.CarrotCoins or 0
	local v25 = v_u_17.TextLabel
	local v26 = v_u_19.Comma
	local v27 = math.round(v24)
	v25.Text = ("x%*"):format((v26((tostring(v27)))))
end
local function v_u_34()
	-- upvalues: (copy) v_u_18, (copy) v_u_11, (copy) v_u_16, (copy) v_u_20
	v_u_18.Visible = false
	for v29, v30 in v_u_11 do
		local v31 = v_u_16:FindFirstChild((("Reward%*"):format(v29)))
		if v31 and v30.ImageId then
			v31.Image = v30.ImageId
			if v30.Reward then
				v31.TextLabel.Text = ("x%*"):format(v30.Reward.Quantity)
			end
		end
	end
	for _, v32 in v_u_11 do
		local v33 = v_u_20:Clone()
		v33.Reward.Image = v32.ImageId
		v33.Reward.TextLabel.Text = ("x%*"):format(v32.Reward.Quantity)
		v33.TextLabel.Text = ("- %*%%"):format(v32.Weight)
		v33.LayoutOrder = v32.Weight
		v33.Parent = v_u_18
	end
end
function v_u_22.OnStarted(p35)
	-- upvalues: (copy) v_u_22, (copy) v_u_10, (copy) v_u_14, (copy) v_u_18, (copy) v_u_34, (copy) v_u_7, (copy) v_u_17, (copy) v_u_19, (copy) v_u_9, (copy) v_u_12, (copy) v_u_21, (copy) v_u_28
	if not v_u_22.IsRunning then
		v_u_10:Start()
	end
	p35:Bind(v_u_14.Header.CloseButton.Activated:Connect(function(_, _)
		-- upvalues: (ref) v_u_22
		v_u_22:Close()
	end))
	p35:Bind(v_u_14.Header.OddsBTN.Activated:Connect(function(_, _)
		-- upvalues: (ref) v_u_18
		v_u_18.Visible = not v_u_18.Visible
	end))
	v_u_34()
	v_u_22:StartIdleAnimation()
	local v36 = v_u_7:GetData().SpecialCurrency.CarrotCoins or 0
	local v37 = v_u_17.TextLabel
	local v38 = v_u_19.Comma
	local v39 = math.round(v36)
	v37.Text = ("x%*"):format((v38((tostring(v39)))))
	v_u_22:IdleSpin()
	p35:Bind(v_u_17.Activated:Connect(function()
		-- upvalues: (ref) v_u_7, (ref) v_u_9, (ref) v_u_12, (ref) v_u_21
		local v40 = v_u_7:GetData()
		if v40 then
			if v40.SpecialCurrency.CarrotCoins <= 0 then
				v_u_9:PromptPurchaseRobux(v_u_12.Shop.Products[1].ProductId, Enum.InfoType.Product)
			else
				v_u_21:FireServer()
			end
		else
			return
		end
	end))
	p35:Bind(v_u_21.OnClientEvent:Connect(function(p41)
		-- upvalues: (ref) v_u_22
		if p41 then
			v_u_22:SpinWheel(p41)
		end
	end))
	p35:Bind(v_u_7:GetPathSignal("SpecialCurrency/CarrotCoins"):Connect(v_u_28))
end
function v_u_22.IdleSpin(p42)
	-- upvalues: (copy) v_u_2, (ref) v_u_23, (copy) v_u_15
	p42:Bind(v_u_2.Heartbeat:Connect(function(p43)
		-- upvalues: (ref) v_u_23, (ref) v_u_15
		if not v_u_23 then
			v_u_15.Rotation = v_u_15.Rotation - 20 * p43
		end
	end))
end
function v_u_22.SpinWheel(_, p44)
	-- upvalues: (copy) v_u_11, (ref) v_u_23, (copy) v_u_15, (copy) v_u_4, (copy) v_u_5, (copy) v_u_16
	if p44 then
		if v_u_11[p44] then
			v_u_23 = true
			v_u_15.Rotation = 0
			local v45 = p44 * 45 - 20
			local v46 = math.random() * 15
			local v47 = v45 + 1800 + v46
			local v48 = v_u_4:Create(v_u_15, TweenInfo.new(2, Enum.EasingStyle.Quart), {
				["Rotation"] = -v47
			})
			local v_u_49 = v_u_15.Rotation
			local v55 = v_u_15:GetPropertyChangedSignal("Rotation"):Connect(function()
				-- upvalues: (ref) v_u_15, (ref) v_u_49, (ref) v_u_5
				local v50 = v_u_15.Rotation
				local v51 = v50 - v_u_49
				local v52 = math.abs(v51)
				if v52 >= 20 then
					local v53 = v_u_5.Click
					local v54 = v52 / 30
					v53.PlaybackSpeed = math.min(v54, 1) + 1
					v53:Play()
					v_u_49 = v50
				end
			end)
			v48:Play()
			v48.Completed:Wait()
			v48:Cancel()
			v48:Destroy()
			if v55 then
				v55:Disconnect()
			end
			local v56 = v_u_16:FindFirstChild((("Reward%*"):format(p44)))
			if v56 then
				if not v56:GetAttribute("OriginalSize") then
					v56:SetAttribute("OriginalSize", v56.Size)
				end
				local v57 = v56:GetAttribute("OriginalSize")
				local v58 = v_u_4:Create(v56, TweenInfo.new(0.2, Enum.EasingStyle.Linear), {
					["Size"] = v57 + UDim2.fromScale(0.1, 0.1)
				})
				v_u_5.Lucky_Seed_SFX:Play()
				v58:Play()
				v58.Completed:Wait()
				v_u_4:Create(v56, TweenInfo.new(0.15, Enum.EasingStyle.Linear), {
					["Size"] = v57
				}):Play()
			end
			task.wait(0.25)
			v_u_23 = false
		end
	else
		return
	end
end
function v_u_22.StartIdleAnimation(p59)
	-- upvalues: (copy) v_u_15, (copy) v_u_16
	p59:Bind(v_u_15:GetPropertyChangedSignal("Rotation"):Connect(function()
		-- upvalues: (ref) v_u_15, (ref) v_u_16
		local v60 = v_u_15.Rotation
		for _, v61 in pairs(v_u_16:GetChildren()) do
			if v61:IsA("ImageLabel") then
				v61.Rotation = -v60
			end
		end
	end))
end
function v_u_22.OnEnded(_) end
function v_u_22.Open(_)
	-- upvalues: (copy) v_u_6, (copy) v_u_13
	v_u_6:Open(v_u_13)
end
function v_u_22.Close(_)
	-- upvalues: (copy) v_u_6, (copy) v_u_13
	v_u_6:Close(v_u_13)
end
v_u_6:UsePopupAnims(v_u_13)
return v_u_22