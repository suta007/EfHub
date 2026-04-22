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
local v_u_18 = game.GameId == 7436755782 and 822732857916245 or 881866492201934
local v_u_19 = {}
local v_u_20 = false
local v_u_21 = false
local v_u_22 = false
local v_u_23 = {
	Enum.AdAvailabilityResult.PlayerIneligible,
	Enum.AdAvailabilityResult.DeviceIneligible,
	Enum.AdAvailabilityResult.PublisherIneligible,
	Enum.AdAvailabilityResult.ExperienceIneligible
}
function checkForAds()
	-- upvalues: (ref) v_u_22, (copy) v_u_2, (ref) v_u_20, (copy) v_u_23, (ref) v_u_21
	if v_u_22 then
		return
	end
	local v24, v25 = pcall(function()
		-- upvalues: (ref) v_u_2
		return v_u_2:GetAdAvailabilityNowAsync(Enum.AdFormat.RewardedVideo)
	end)
	if v24 and v25.AdAvailabilityResult == Enum.AdAvailabilityResult.IsAvailable then
		v_u_20 = true
	else
		v_u_20 = false
	end
	local v26 = v25.AdAvailabilityResult
	for _, v27 in ipairs(v_u_23) do
		if v26 == v27 then
			v28 = true
			::l10::
			if v28 then
				v_u_21 = false
			else
				v_u_21 = true
				print("(Daily Deals) Eligible for Daily Deals Ad Services")
			end
		end
	end
	local v28 = false
	goto l10
end
local function v_u_100(p29)
	-- upvalues: (copy) v_u_17, (copy) v_u_14, (copy) v_u_16, (copy) v_u_4, (copy) v_u_12, (copy) v_u_3, (copy) v_u_6, (ref) v_u_22, (ref) v_u_20, (ref) v_u_21, (copy) v_u_1, (copy) v_u_7, (copy) v_u_8, (copy) v_u_9, (copy) v_u_2, (copy) v_u_18, (copy) v_u_13, (copy) v_u_10, (copy) v_u_5, (copy) v_u_11
	local v_u_30 = v_u_17.ScrollingFrame.InfiniteAdRewards
	v_u_30.Visible = true
	local v31 = {
		["eventName"] = "DailyAdRewardScrollerRegistered",
		["value"] = 1,
		["fields"] = {
			["playerId"] = v_u_14.UserId,
			["playerName"] = v_u_14.Name
		}
	}
	v_u_16:FireServer(v31)
	local v_u_32 = v_u_30.INF.Holder
	local v_u_33 = v_u_32.Template
	local v_u_34 = nil
	local v_u_35 = Instance.new("NumberValue")
	local function v_u_64()
		-- upvalues: (ref) v_u_4, (ref) v_u_12, (ref) v_u_3, (ref) v_u_6, (copy) v_u_35, (copy) v_u_32, (copy) v_u_33, (ref) v_u_22, (ref) v_u_20, (ref) v_u_21, (ref) v_u_14, (ref) v_u_16, (ref) v_u_1, (ref) v_u_7, (ref) v_u_8, (ref) v_u_9, (ref) v_u_2, (ref) v_u_18
		local v_u_36 = v_u_4:GetData()
		if v_u_36 then
			local v37 = v_u_36.InfinitePack_AdRewards2.Depth
			local v38 = v_u_12.GetRewardsAsync(v_u_3.LocalPlayer, v_u_36.InfinitePack_AdRewards2.Day, v37 + 5)
			v_u_6(v_u_35, TweenInfo.new(0.2), {
				["Value"] = v37
			})
			for _, v_u_39 in v_u_32:GetChildren() do
				local v40 = v_u_39.Name
				local v41 = tonumber(v40)
				if v41 and v41 <= v37 then
					task.delay(0.2, function()
						-- upvalues: (copy) v_u_39
						v_u_39:Destroy()
					end)
				end
			end
			local v42 = #v38 - 5 + 1
			for v_u_43 = math.max(v42, 1), #v38 do
				local v44 = v38[v_u_43]
				local v_u_45 = v_u_32:FindFirstChild((tostring(v_u_43)))
				if not v_u_45 then
					v_u_45 = v_u_33:Clone()
					v_u_45.Name = tostring(v_u_43)
					v_u_45.Position = UDim2.fromScale((v_u_43 - 1) * 0.38, 0)
					v_u_45.LayoutOrder = v_u_43
					v_u_45.ZIndex = #v38 - v_u_43
					v_u_45.Position = UDim2.fromScale((v_u_43 - 1) * 0.38, 0)
					v_u_45.Visible = true
					v_u_45.CLAIM_BUTTON.SENSOR.Activated:Connect(function()
						-- upvalues: (ref) v_u_22, (ref) v_u_36, (ref) v_u_4, (copy) v_u_43, (ref) v_u_20, (ref) v_u_21, (ref) v_u_14, (ref) v_u_16, (ref) v_u_1
						if v_u_22 == true then
							return
						else
							v_u_36 = v_u_4:GetData()
							if v_u_36.InfinitePack_AdRewards2.Depth + 1 == v_u_43 then
								checkForAds()
								if v_u_20 and v_u_21 then
									v_u_20 = false
									v_u_22 = true
									local v46 = {
										["eventName"] = "InfiniteAdRewardsClaimAttempt",
										["value"] = 1,
										["fields"] = {
											["playerId"] = v_u_14.UserId,
											["playerName"] = v_u_14.Name,
											["slotIndex"] = v_u_43,
											["totalClaimsBefore"] = v_u_36.InfinitePack_AdRewards2.Depth
										}
									}
									v_u_16:FireServer(v46)
									v_u_1.GameEvents.InfinitePack.AdRewardsClaim:FireServer()
								end
							end
						end
					end)
					if v44 then
						local v47 = v44.Rewards[1]
						v_u_45.IMAGE_CONTAINER.ITEM_IMAGE.Image = v_u_7(v47.RewardName, v47.Type)
						local v48 = ("%*%*"):format(v_u_8(v47.RewardName, v47.Type) or v47.RewardName, v47.Amount <= 1 and "" or (" x%*"):format(v47.Amount))
						v_u_45.IMAGE_CONTAINER.RewardName.Text = v48
						local v49 = v_u_9:GetRarityColor({
							["Type"] = v47.Type,
							["Value"] = v47.RewardName or "Normal",
							["Quantity"] = v47.Amount or 1
						})
						local v50 = v49 or Color3.fromRGB(127, 127, 127)
						local v51 = v_u_45.IMAGE_CONTAINER
						local v52, v53, v54 = v49:ToHSV()
						local v55 = Color3.fromHSV
						local v56 = v54 / 1.3
						v51.BackgroundColor3 = v55(v52, v53, (math.clamp(v56, 0, 1)))
						local v57 = v_u_45.IMAGE_CONTAINER.RewardName
						local v58, v59, v60 = v50:ToHSV()
						local v61 = Color3.fromHSV
						local v62 = v60 / 3
						v57.TextStrokeColor3 = v61(v58, v59, (math.clamp(v62, 0, 1)))
					end
					v_u_45.Parent = v_u_32
					local v_u_63 = task.spawn(function()
						-- upvalues: (ref) v_u_12, (copy) v_u_45
						local _ = v_u_12.FallbackPrices[0]
						v_u_45.CLAIM_BUTTON.CLAIM.Text = "Watch"
						v_u_45.CLAIM_BUTTON.CLAIM_BUTTON.Text = "Watch"
					end)
					v_u_45.Destroying:Once(function()
						-- upvalues: (copy) v_u_63
						if coroutine.status(v_u_63) == "suspended" then
							pcall(task.cancel, v_u_63)
						end
					end)
				end
				v_u_45.ZIndex = #v38 - v_u_43
				if v_u_43 == v_u_36.InfinitePack_AdRewards2.Depth + 1 then
					v_u_45.CLAIM_BUTTON.Visible = true
					v_u_45.CLAIM_BUTTON_DISABLED.Visible = false
					local _, _ = pcall(function()
						-- upvalues: (ref) v_u_2, (ref) v_u_45, (ref) v_u_18
						v_u_2:RegisterAdOpportunityAsync(v_u_45.CLAIM_BUTTON.SENSOR, v_u_18)
					end)
				else
					v_u_45.CLAIM_BUTTON.Visible = false
					v_u_45.CLAIM_BUTTON_DISABLED.Visible = true
				end
			end
		end
	end
	local function v65()
		-- upvalues: (copy) v_u_32, (copy) v_u_35
		v_u_32.Position = UDim2.fromScale(-0.38 * v_u_35.Value, 0)
	end
	local v_u_66 = nil
	local function v70()
		-- upvalues: (ref) v_u_66, (copy) v_u_32, (copy) v_u_35
		if v_u_66 and coroutine.status(v_u_66) == "suspended" then
			task.cancel(v_u_66)
		end
		v_u_66 = task.delay(0.1, function()
			-- upvalues: (ref) v_u_32, (ref) v_u_35, (ref) v_u_66
			v_u_32.Position = UDim2.fromScale(-0.38 * v_u_35.Value, 0)
			for _, v67 in v_u_32:GetChildren() do
				local v68 = v67.Name
				local v69 = tonumber(v68)
				if v69 then
					v67.Position = UDim2.fromScale((v69 - 1) * 0.38, 0)
				end
			end
			v_u_66 = nil
		end)
	end
	local function v_u_75()
		-- upvalues: (ref) v_u_4, (ref) v_u_34, (copy) v_u_32, (copy) v_u_64
		local v71 = v_u_4:GetData()
		if v71 then
			local v72 = v71.InfinitePack_AdRewards2.Day
			if v_u_34 ~= v72 then
				for _, v73 in v_u_32:GetChildren() do
					if v73:IsA("GuiObject") then
						local v74 = v73.Name
						if tonumber(v74) then
							v73:Destroy()
						end
					end
				end
				v_u_34 = v72
				v_u_64()
			end
		else
			return
		end
	end
	v_u_35.Changed:Connect(v65)
	task.spawn(v65)
	v_u_32:GetPropertyChangedSignal("AbsoluteSize"):Connect(v70)
	task.spawn(v70)
	task.spawn(function()
		-- upvalues: (copy) v_u_75, (ref) v_u_4, (copy) v_u_64
		task.spawn(v_u_75)
		local v76 = v_u_4
		assert(v76:GetPathSignal("InfinitePack_AdRewards2/@")):Connect(function()
			-- upvalues: (ref) v_u_75, (ref) v_u_64
			v_u_75()
			v_u_64()
		end)
	end)
	v_u_13.OnClientEvent:Connect(function(p77, p78)
		-- upvalues: (ref) v_u_4, (ref) v_u_12, (ref) v_u_3, (ref) v_u_14, (ref) v_u_16, (ref) v_u_22
		if p77 then
			print("Infinite Ad Reward claim success")
			local v79 = v_u_4:GetData()
			if not v79 then
				return
			end
			local v80 = p78 or v79.InfinitePack_AdRewards2.Depth
			local v81 = v_u_12.GetRewardsAsync(v_u_3.LocalPlayer, v79.InfinitePack_AdRewards2.Day, v80)
			if v81 then
				v81 = v81[#v81]
			end
			local v82 = v81 and v81.Rewards
			if v82 then
				v82 = v81.Rewards[1]
			end
			local v83 = {
				["eventName"] = "InfiniteAdRewardsClaimResult",
				["value"] = 1,
				["fields"] = {
					["playerId"] = v_u_14.UserId,
					["playerName"] = v_u_14.Name,
					["slotIndex"] = v80,
					["totalClaimsAfter"] = v80,
					["itemName"] = v82 and v82.RewardName or nil,
					["wasSuccessful"] = true
				}
			}
			v_u_16:FireServer(v83)
		else
			print("Infinite Ad Reward claim failed")
			local v84 = v_u_4:GetData()
			local v85 = v84 and v84.InfinitePack_AdRewards2.Depth or nil
			v_u_16:FireServer({
				["eventName"] = "InfiniteAdRewardsClaimResult",
				["value"] = 1,
				["fields"] = {
					["playerId"] = v_u_14.UserId,
					["playerName"] = v_u_14.Name,
					["totalClaimsAfter"] = v85,
					["wasSuccessful"] = false
				}
			})
		end
		wait(1)
		v_u_22 = false
	end)
	task.spawn(function()
		-- upvalues: (ref) v_u_10, (copy) v_u_30, (ref) v_u_20, (ref) v_u_21
		local v86 = 0
		while true do
			local v87 = workspace:GetServerTimeNow()
			local v88 = (v87 // 86400 + 1) * 86400 - v87
			local v89 = v_u_10.compactFormat(v88)
			v_u_30.Header.Timer.Text = v89
			v_u_30.Header.Timer.TimerShadow.Text = v89
			task.wait(1)
			v86 = v86 + 1
			if v86 >= 20 and (v_u_20 == false and v_u_21 == true) then
				checkForAds()
				v86 = 0
			end
			if v_u_21 == false then
				v_u_30.Visible = false
				return
			end
		end
	end)
	local v90 = v_u_30.PossibleRewardsContainer:FindFirstChild("AdPackRewards")
	local v91 = v90.REWARD_IMAGE
	v90.Visible = false
	local v92 = {}
	local v93 = v_u_12.Rewards
	if p29 ~= "DEFAULT" then
		v93 = v_u_5.Rewards
	end
	if v93 then
		for _, v94 in v93.Free do
			if v94.Type then
				if v91 then
					local v95 = {
						["Type"] = v94.Type,
						["Value"] = v94.RewardName or "Normal",
						["Quantity"] = v94.Amount or 1
					}
					table.insert(v92, v95)
				end
			else
				warn("No reward type")
			end
		end
		for _, v96 in v93.Paid do
			if v96.Type then
				if v91 then
					local v97 = {
						["Type"] = v96.Type,
						["Value"] = v96.RewardName or "Normal",
						["Quantity"] = v96.Amount or 1
					}
					table.insert(v92, v97)
				end
			else
				warn("No reward type")
			end
		end
		local v98 = v90.ITEM_NAME.REWARD_NAME
		local v99 = v90.ITEM_NAME.REWARD_NAME_SHADOW
		v_u_11.CycleRewardImages(v91, v98, v99, v90, v92)
		v90.Visible = true
	else
		warn("Current Infinite Pack Type [packRewards] does not exist!")
	end
end
function v_u_19.Start(_)
	-- upvalues: (ref) v_u_21, (copy) v_u_100
	checkForAds()
	if v_u_21 then
		v_u_100("DEFAULT")
	else
		warn("Daily Infinite Ad Rewards not started: player is not eligible for AdService")
	end
end
task.spawn(function()
	-- upvalues: (copy) v_u_14, (copy) v_u_19
	game:GetService("RunService")
	if script.RobloxAdServiceTesting.Value == true then
		wait(35)
		if v_u_14:GetAttribute("AB_rewarded_video_ad_DailyDealsInf") == true then
			v_u_19:Start()
		else
			warn("Daily Infinite Ad Rewards not started: AB_rewarded_video_ad_DailyDealsInf is not enabled for this player")
		end
	else
		print("Daily Infinite Ad Rewards Controller Disabled")
		return
	end
end)
return v_u_19