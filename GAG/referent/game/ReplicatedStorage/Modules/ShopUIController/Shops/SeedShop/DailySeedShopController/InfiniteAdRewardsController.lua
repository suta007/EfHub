local v_u_1 = game:GetService("ReplicatedStorage")
local v_u_2 = game:GetService("AdService")
local v_u_3 = game:GetService("Players")
local v_u_4 = require(v_u_1.Modules.DataService)
local v_u_5 = require(v_u_1.Data.EventInfinitePackData)
require(v_u_1.Data.InfinitePackData)
local v_u_6 = require(v_u_1.Modules.FastTween)
local v_u_7 = require(v_u_1.Modules.ItemImageFinder)
local v_u_8 = require(v_u_1.Modules.ItemNameFinder)
local v_u_9 = require(v_u_1.Modules.GiveServiceCommon)
require(v_u_1.Modules.UseDynamicPrices)
require(v_u_1.Modules.MarketController)
require(v_u_1.Comma_Module)
local v_u_10 = require(v_u_1.Modules.NumberUtil)
local v_u_11 = require(v_u_1.Modules.GardenGuideModules.ImageCycle)
local v_u_12 = require(v_u_1.Data.InfinitePackDataAdRewards1)
local v_u_13 = v_u_1.GameEvents.InfinitePack.AdRewardsClaim
local v_u_14 = v_u_3.LocalPlayer
local v15 = v_u_14.PlayerGui
local v_u_16 = v_u_1:WaitForChild("GameEvents"):WaitForChild("AdRewardEvents"):WaitForChild("LogEvent")
local v_u_17 = v15:WaitForChild("Seed_Shop"):WaitForChild("Daily")
local v_u_18 = {}
local v_u_19 = false
local v_u_20 = false
local v_u_21 = false
local v_u_22 = {
	Enum.AdAvailabilityResult.PlayerIneligible,
	Enum.AdAvailabilityResult.DeviceIneligible,
	Enum.AdAvailabilityResult.PublisherIneligible,
	Enum.AdAvailabilityResult.ExperienceIneligible
}
function checkForAds()
	-- upvalues: (ref) v_u_21, (copy) v_u_2, (ref) v_u_19, (copy) v_u_22, (ref) v_u_20
	if v_u_21 then
		return
	end
	local v23, v24 = pcall(function()
		-- upvalues: (ref) v_u_2
		return v_u_2:GetAdAvailabilityNowAsync(Enum.AdFormat.RewardedVideo)
	end)
	if v23 and v24.AdAvailabilityResult == Enum.AdAvailabilityResult.IsAvailable then
		v_u_19 = true
	else
		v_u_19 = false
	end
	local v25 = v24.AdAvailabilityResult
	for _, v26 in ipairs(v_u_22) do
		if v25 == v26 then
			v27 = true
			::l10::
			if v27 then
				v_u_20 = false
			else
				v_u_20 = true
				print("(Daily Deals) Eligible for Daily Deals Ad Services")
			end
		end
	end
	local v27 = false
	goto l10
end
local function v_u_99(p28)
	-- upvalues: (copy) v_u_17, (copy) v_u_14, (copy) v_u_16, (copy) v_u_4, (copy) v_u_12, (copy) v_u_3, (copy) v_u_6, (ref) v_u_21, (ref) v_u_19, (ref) v_u_20, (copy) v_u_1, (copy) v_u_7, (copy) v_u_8, (copy) v_u_9, (copy) v_u_2, (copy) v_u_13, (copy) v_u_10, (copy) v_u_5, (copy) v_u_11
	local v_u_29 = v_u_17.ScrollingFrame.InfiniteAdRewards
	v_u_29.Visible = true
	local v30 = {
		["eventName"] = "DailyAdRewardScrollerRegistered",
		["value"] = 1,
		["fields"] = {
			["playerId"] = v_u_14.UserId,
			["playerName"] = v_u_14.Name
		}
	}
	v_u_16:FireServer(v30)
	local v_u_31 = v_u_29.INF.Holder
	local v_u_32 = v_u_31.Template
	local v_u_33 = nil
	local v_u_34 = Instance.new("NumberValue")
	local function v_u_63()
		-- upvalues: (ref) v_u_4, (ref) v_u_12, (ref) v_u_3, (ref) v_u_6, (copy) v_u_34, (copy) v_u_31, (copy) v_u_32, (ref) v_u_21, (ref) v_u_19, (ref) v_u_20, (ref) v_u_14, (ref) v_u_16, (ref) v_u_1, (ref) v_u_7, (ref) v_u_8, (ref) v_u_9, (ref) v_u_2
		local v_u_35 = v_u_4:GetData()
		if v_u_35 then
			local v36 = v_u_35.InfinitePack_AdRewards2.Depth
			local v37 = v_u_12.GetRewardsAsync(v_u_3.LocalPlayer, v_u_35.InfinitePack_AdRewards2.Day, v36 + 5)
			v_u_6(v_u_34, TweenInfo.new(0.2), {
				["Value"] = v36
			})
			for _, v_u_38 in v_u_31:GetChildren() do
				local v39 = v_u_38.Name
				local v40 = tonumber(v39)
				if v40 and v40 <= v36 then
					task.delay(0.2, function()
						-- upvalues: (copy) v_u_38
						v_u_38:Destroy()
					end)
				end
			end
			local v41 = #v37 - 5 + 1
			for v_u_42 = math.max(v41, 1), #v37 do
				local v43 = v37[v_u_42]
				local v_u_44 = v_u_31:FindFirstChild((tostring(v_u_42)))
				if not v_u_44 then
					v_u_44 = v_u_32:Clone()
					v_u_44.Name = tostring(v_u_42)
					v_u_44.Position = UDim2.fromScale((v_u_42 - 1) * 0.38, 0)
					v_u_44.LayoutOrder = v_u_42
					v_u_44.ZIndex = #v37 - v_u_42
					v_u_44.Position = UDim2.fromScale((v_u_42 - 1) * 0.38, 0)
					v_u_44.Visible = true
					v_u_44.CLAIM_BUTTON.SENSOR.Activated:Connect(function()
						-- upvalues: (ref) v_u_21, (ref) v_u_35, (ref) v_u_4, (copy) v_u_42, (ref) v_u_19, (ref) v_u_20, (ref) v_u_14, (ref) v_u_16, (ref) v_u_1
						if v_u_21 == true then
							return
						else
							v_u_35 = v_u_4:GetData()
							if v_u_35.InfinitePack_AdRewards2.Depth + 1 == v_u_42 then
								checkForAds()
								if v_u_19 and v_u_20 then
									v_u_19 = false
									v_u_21 = true
									local v45 = {
										["eventName"] = "InfiniteAdRewardsClaimAttempt",
										["value"] = 1,
										["fields"] = {
											["playerId"] = v_u_14.UserId,
											["playerName"] = v_u_14.Name,
											["slotIndex"] = v_u_42,
											["totalClaimsBefore"] = v_u_35.InfinitePack_AdRewards2.Depth
										}
									}
									v_u_16:FireServer(v45)
									v_u_1.GameEvents.InfinitePack.AdRewardsClaim:FireServer()
								end
							end
						end
					end)
					if v43 then
						local v46 = v43.Rewards[1]
						v_u_44.IMAGE_CONTAINER.ITEM_IMAGE.Image = v_u_7(v46.RewardName, v46.Type)
						local v47 = ("%*%*"):format(v_u_8(v46.RewardName, v46.Type) or v46.RewardName, v46.Amount <= 1 and "" or (" x%*"):format(v46.Amount))
						v_u_44.IMAGE_CONTAINER.RewardName.Text = v47
						local v48 = v_u_9:GetRarityColor({
							["Type"] = v46.Type,
							["Value"] = v46.RewardName or "Normal",
							["Quantity"] = v46.Amount or 1
						})
						local v49 = v48 or Color3.fromRGB(127, 127, 127)
						local v50 = v_u_44.IMAGE_CONTAINER
						local v51, v52, v53 = v48:ToHSV()
						local v54 = Color3.fromHSV
						local v55 = v53 / 1.3
						v50.BackgroundColor3 = v54(v51, v52, (math.clamp(v55, 0, 1)))
						local v56 = v_u_44.IMAGE_CONTAINER.RewardName
						local v57, v58, v59 = v49:ToHSV()
						local v60 = Color3.fromHSV
						local v61 = v59 / 3
						v56.TextStrokeColor3 = v60(v57, v58, (math.clamp(v61, 0, 1)))
					end
					v_u_44.Parent = v_u_31
					local v_u_62 = task.spawn(function()
						-- upvalues: (ref) v_u_12, (copy) v_u_44
						local _ = v_u_12.FallbackPrices[0]
						v_u_44.CLAIM_BUTTON.CLAIM.Text = "Watch"
						v_u_44.CLAIM_BUTTON.CLAIM_BUTTON.Text = "Watch"
					end)
					v_u_44.Destroying:Once(function()
						-- upvalues: (copy) v_u_62
						if coroutine.status(v_u_62) == "suspended" then
							pcall(task.cancel, v_u_62)
						end
					end)
				end
				v_u_44.ZIndex = #v37 - v_u_42
				if v_u_42 == v_u_35.InfinitePack_AdRewards2.Depth + 1 then
					v_u_44.CLAIM_BUTTON.Visible = true
					v_u_44.CLAIM_BUTTON_DISABLED.Visible = false
					local _, _ = pcall(function()
						-- upvalues: (ref) v_u_2, (ref) v_u_44
						v_u_2:RegisterAdOpportunityAsync(v_u_44.CLAIM_BUTTON.SENSOR, 822732857916245)
					end)
				else
					v_u_44.CLAIM_BUTTON.Visible = false
					v_u_44.CLAIM_BUTTON_DISABLED.Visible = true
				end
			end
		end
	end
	local function v64()
		-- upvalues: (copy) v_u_31, (copy) v_u_34
		v_u_31.Position = UDim2.fromScale(-0.38 * v_u_34.Value, 0)
	end
	local v_u_65 = nil
	local function v69()
		-- upvalues: (ref) v_u_65, (copy) v_u_31, (copy) v_u_34
		if v_u_65 and coroutine.status(v_u_65) == "suspended" then
			task.cancel(v_u_65)
		end
		v_u_65 = task.delay(0.1, function()
			-- upvalues: (ref) v_u_31, (ref) v_u_34, (ref) v_u_65
			v_u_31.Position = UDim2.fromScale(-0.38 * v_u_34.Value, 0)
			for _, v66 in v_u_31:GetChildren() do
				local v67 = v66.Name
				local v68 = tonumber(v67)
				if v68 then
					v66.Position = UDim2.fromScale((v68 - 1) * 0.38, 0)
				end
			end
			v_u_65 = nil
		end)
	end
	local function v_u_74()
		-- upvalues: (ref) v_u_4, (ref) v_u_33, (copy) v_u_31, (copy) v_u_63
		local v70 = v_u_4:GetData()
		if v70 then
			local v71 = v70.InfinitePack_AdRewards2.Day
			if v_u_33 ~= v71 then
				for _, v72 in v_u_31:GetChildren() do
					if v72:IsA("GuiObject") then
						local v73 = v72.Name
						if tonumber(v73) then
							v72:Destroy()
						end
					end
				end
				v_u_33 = v71
				v_u_63()
			end
		else
			return
		end
	end
	v_u_34.Changed:Connect(v64)
	task.spawn(v64)
	v_u_31:GetPropertyChangedSignal("AbsoluteSize"):Connect(v69)
	task.spawn(v69)
	task.spawn(function()
		-- upvalues: (copy) v_u_74, (ref) v_u_4, (copy) v_u_63
		task.spawn(v_u_74)
		local v75 = v_u_4
		assert(v75:GetPathSignal("InfinitePack_AdRewards2/@")):Connect(function()
			-- upvalues: (ref) v_u_74, (ref) v_u_63
			v_u_74()
			v_u_63()
		end)
	end)
	v_u_13.OnClientEvent:Connect(function(p76, p77)
		-- upvalues: (ref) v_u_4, (ref) v_u_12, (ref) v_u_3, (ref) v_u_14, (ref) v_u_16, (ref) v_u_21
		if p76 then
			print("Infinite Ad Reward claim success")
			local v78 = v_u_4:GetData()
			if not v78 then
				return
			end
			local v79 = p77 or v78.InfinitePack_AdRewards2.Depth
			local v80 = v_u_12.GetRewardsAsync(v_u_3.LocalPlayer, v78.InfinitePack_AdRewards2.Day, v79)
			if v80 then
				v80 = v80[#v80]
			end
			local v81 = v80 and v80.Rewards
			if v81 then
				v81 = v80.Rewards[1]
			end
			local v82 = {
				["eventName"] = "InfiniteAdRewardsClaimResult",
				["value"] = 1,
				["fields"] = {
					["playerId"] = v_u_14.UserId,
					["playerName"] = v_u_14.Name,
					["slotIndex"] = v79,
					["totalClaimsAfter"] = v79,
					["itemName"] = v81 and v81.RewardName or nil,
					["wasSuccessful"] = true
				}
			}
			v_u_16:FireServer(v82)
		else
			print("Infinite Ad Reward claim failed")
			local v83 = v_u_4:GetData()
			local v84 = v83 and v83.InfinitePack_AdRewards2.Depth or nil
			v_u_16:FireServer({
				["eventName"] = "InfiniteAdRewardsClaimResult",
				["value"] = 1,
				["fields"] = {
					["playerId"] = v_u_14.UserId,
					["playerName"] = v_u_14.Name,
					["totalClaimsAfter"] = v84,
					["wasSuccessful"] = false
				}
			})
		end
		wait(1)
		v_u_21 = false
	end)
	task.spawn(function()
		-- upvalues: (ref) v_u_10, (copy) v_u_29, (ref) v_u_19, (ref) v_u_20
		local v85 = 0
		while true do
			local v86 = workspace:GetServerTimeNow()
			local v87 = (v86 // 86400 + 1) * 86400 - v86
			local v88 = v_u_10.compactFormat(v87)
			v_u_29.Header.Timer.Text = v88
			v_u_29.Header.Timer.TimerShadow.Text = v88
			task.wait(1)
			v85 = v85 + 1
			if v85 >= 20 and (v_u_19 == false and v_u_20 == true) then
				checkForAds()
				v85 = 0
			end
			if v_u_20 == false then
				v_u_29.Visible = false
				return
			end
		end
	end)
	local v89 = v_u_29.PossibleRewardsContainer:FindFirstChild("AdPackRewards")
	local v90 = v89.REWARD_IMAGE
	v89.Visible = false
	local v91 = {}
	local v92 = v_u_12.Rewards
	if p28 ~= "DEFAULT" then
		v92 = v_u_5.Rewards
	end
	if v92 then
		for _, v93 in v92.Free do
			if v93.Type then
				if v90 then
					local v94 = {
						["Type"] = v93.Type,
						["Value"] = v93.RewardName or "Normal",
						["Quantity"] = v93.Amount or 1
					}
					table.insert(v91, v94)
				end
			else
				warn("No reward type")
			end
		end
		for _, v95 in v92.Paid do
			if v95.Type then
				if v90 then
					local v96 = {
						["Type"] = v95.Type,
						["Value"] = v95.RewardName or "Normal",
						["Quantity"] = v95.Amount or 1
					}
					table.insert(v91, v96)
				end
			else
				warn("No reward type")
			end
		end
		local v97 = v89.ITEM_NAME.REWARD_NAME
		local v98 = v89.ITEM_NAME.REWARD_NAME_SHADOW
		v_u_11.CycleRewardImages(v90, v97, v98, v89, v91)
		v89.Visible = true
	else
		warn("Current Infinite Pack Type [packRewards] does not exist!")
	end
end
function v_u_18.Start(_)
	-- upvalues: (ref) v_u_20, (copy) v_u_99
	checkForAds()
	if v_u_20 then
		v_u_99("DEFAULT")
	else
		warn("Daily Infinite Ad Rewards not started: player is not eligible for AdService")
	end
end
task.spawn(function()
	-- upvalues: (copy) v_u_14, (copy) v_u_18
	game:GetService("RunService")
	wait(35)
	if v_u_14:GetAttribute("AB_rewarded_video_ad_DailyDealsInf") == true then
		v_u_18:Start()
	else
		warn("Daily Infinite Ad Rewards not started: AB_rewarded_video_ad_DailyDealsInf is not enabled for this player")
	end
end)
return v_u_18