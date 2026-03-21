if script.RobloxAdServiceTesting.Value ~= false then
	local v1 = game:GetService("ReplicatedStorage")
	local v_u_2 = game:GetService("AdService")
	local v3 = game:GetService("Players")
	local v_u_4 = game:GetService("Workspace")
	local v_u_5 = v3.LocalPlayer
	local v_u_6 = v_u_5:WaitForChild("PlayerGui")
	require(v1.Data.AdRewardsWateringCanRewards)
	local v_u_7 = require(v1.Modules.FastTween)
	local v_u_8 = require(v1.Modules.ItemImageFinder)
	local v_u_9 = require(v1.Modules.ItemNameFinder)
	local v_u_10 = require(v1.Modules.GiveServiceCommon)
	local v_u_11 = require(v1.Modules.NumberUtil)
	require(v1.Modules.GardenGuideModules.ImageCycle)
	local v_u_12 = require(v1.Modules.GuiController)
	local v13 = v1:WaitForChild("GameEvents")
	local v14 = v13:WaitForChild("AdRewardsWateringCan")
	local v15 = v13:WaitForChild("AdRewardEvents")
	local v_u_16 = v14:WaitForChild("WateringCanDataRefreshed")
	local v_u_17 = v14:WaitForChild("WateringCanGetData")
	local v_u_18 = v14:WaitForChild("WateringCanClaim")
	local v_u_19 = v14:WaitForChild("WateringCanClaimResult")
	local v_u_20 = v15:WaitForChild("LogEvent")
	local v_u_21 = v_u_6:WaitForChild("_Roblox_Ad_Services_Team_WaterPot")
	local v_u_22 = v_u_21:WaitForChild("Main")
	local v_u_23 = v_u_22:WaitForChild("INF")
	local v_u_24 = v_u_22:WaitForChild("Frame"):WaitForChild("Timer")
	local v_u_25 = v_u_22:WaitForChild("Frame"):WaitForChild("ExitButton")
	local v_u_26 = v_u_21:WaitForChild("waterpot_holder")
	local v_u_27 = v_u_26:WaitForChild("WateringCan")
	local v_u_28 = v_u_26:WaitForChild("WateringCanInv")
	local v_u_29 = {}
	local v_u_30 = false
	local v_u_31 = false
	local v_u_32 = false
	local v_u_33 = nil
	local v_u_34 = nil
	local v_u_35 = 0
	local v_u_36 = {
		Enum.AdAvailabilityResult.PlayerIneligible,
		Enum.AdAvailabilityResult.DeviceIneligible,
		Enum.AdAvailabilityResult.PublisherIneligible,
		Enum.AdAvailabilityResult.ExperienceIneligible
	}
	local function v_u_39(p37)
		-- upvalues: (copy) v_u_36
		for _, v38 in ipairs(v_u_36) do
			if p37 == v38 then
				print("Ineligible For Ad Service: ", p37)
				return true
			end
		end
		return false
	end
	local function v_u_42()
		-- upvalues: (ref) v_u_32, (copy) v_u_2, (ref) v_u_30, (ref) v_u_35, (copy) v_u_27, (copy) v_u_28, (ref) v_u_31, (copy) v_u_39, (copy) v_u_26, (copy) v_u_6
		if v_u_32 then
			return
		else
			local v40, v41 = pcall(function()
				-- upvalues: (ref) v_u_2
				return v_u_2:GetAdAvailabilityNowAsync(Enum.AdFormat.RewardedVideo)
			end)
			if v40 and v41.AdAvailabilityResult == Enum.AdAvailabilityResult.IsAvailable then
				v_u_30 = true
				if v_u_35 < 4 then
					v_u_27.Visible = true
					v_u_28.Visible = false
				else
					v_u_27.Visible = false
					print("No watering cans remaining this period.")
				end
			else
				v_u_30 = false
				if v_u_31 == true then
					v_u_27.Visible = false
				end
			end
			if v40 and v_u_39(v41.AdAvailabilityResult) then
				v_u_31 = false
				v_u_26.Visible = false
				print("Ineligible for Water Can Ad Services")
			elseif v40 then
				v_u_31 = true
				v_u_26.Visible = true
				v_u_26.Parent = v_u_6.Teleport_UI
				print("(Water Pot) Eligible for Water Can Ad Services")
			end
		end
	end
	local function v_u_96()
		-- upvalues: (copy) v_u_23, (copy) v_u_12, (copy) v_u_21, (copy) v_u_5, (copy) v_u_20, (ref) v_u_35, (ref) v_u_30, (copy) v_u_2, (ref) v_u_33, (copy) v_u_7, (ref) v_u_32, (copy) v_u_42, (ref) v_u_31, (copy) v_u_18, (copy) v_u_8, (copy) v_u_9, (copy) v_u_10, (ref) v_u_34, (copy) v_u_4, (copy) v_u_11, (copy) v_u_24, (copy) v_u_16, (copy) v_u_19, (copy) v_u_25, (copy) v_u_27, (copy) v_u_28, (copy) v_u_22
		local v_u_43 = v_u_23.Holder
		local v_u_44 = v_u_43.Template
		v_u_12:UsePopupAnims(v_u_21)
		local v_u_45 = Instance.new("NumberValue")
		v_u_45.Value = 0
		local v46 = {
			["eventName"] = "WateringCanRegistered",
			["value"] = 1,
			["fields"] = {
				["playerId"] = v_u_5.UserId,
				["playerName"] = v_u_5.Name
			}
		}
		v_u_20:FireServer(v46)
		local function v_u_49()
			-- upvalues: (copy) v_u_43
			for _, v47 in v_u_43:GetChildren() do
				if v47:IsA("GuiObject") then
					local v48 = v47.Name
					if tonumber(v48) then
						v47:Destroy()
					end
				end
			end
		end
		local function v_u_56()
			-- upvalues: (copy) v_u_43, (ref) v_u_35, (ref) v_u_30, (ref) v_u_2
			for _, v50 in v_u_43:GetChildren() do
				local v51 = v50.Name
				local v52 = tonumber(v51)
				if v52 then
					local v_u_53 = v50:FindFirstChild("CLAIM_BUTTON")
					local v54 = v50:FindFirstChild("CLAIM_BUTTON_DISABLED")
					local v55 = v50:FindFirstChild("CLAIM_BUTTON_LOCKED")
					if v_u_53 then
						v_u_53.Visible = false
						if v_u_53:FindFirstChild("SENSOR") then
							v_u_53.SENSOR.Active = false
						end
					end
					if v54 then
						v54.Visible = false
						if v54:FindFirstChild("SENSOR") then
							v54.SENSOR.Active = false
						end
					end
					if v55 then
						v55.Visible = false
						if v55:FindFirstChild("SENSOR") then
							v55.SENSOR.Active = false
						end
					end
					if v52 <= v_u_35 then
						if v54 then
							v54.Visible = true
						end
					elseif v_u_35 < 4 and (v52 == v_u_35 + 1 and v_u_30 == true) then
						if v_u_53 then
							v_u_53.Visible = true
							if v_u_53:FindFirstChild("SENSOR") then
								v_u_53.SENSOR.Active = true
								local _, _ = pcall(function()
									-- upvalues: (ref) v_u_2, (copy) v_u_53
									v_u_2:RegisterAdOpportunityAsync(v_u_53.SENSOR, 680725949261319)
								end)
							end
						end
					elseif v55 then
						v55.Visible = true
					end
				end
			end
		end
		local function v_u_82()
			-- upvalues: (ref) v_u_33, (ref) v_u_7, (copy) v_u_45, (ref) v_u_35, (copy) v_u_49, (copy) v_u_44, (ref) v_u_32, (ref) v_u_42, (ref) v_u_30, (ref) v_u_31, (ref) v_u_5, (ref) v_u_20, (ref) v_u_18, (ref) v_u_8, (ref) v_u_9, (ref) v_u_10, (copy) v_u_43, (copy) v_u_56
			if v_u_33 then
				local v57 = v_u_33.Rewards or {}
				if type(v57) == "table" then
					local v58 = {
						["Value"] = v_u_35
					}
					v_u_7(v_u_45, TweenInfo.new(0.2), v58)
					v_u_49()
					local v59 = #v57
					local v60 = math.min(4, v59)
					for v_u_61 = 1, v60 do
						local v62 = v57[v_u_61]
						if v62 then
							local v63 = v_u_44:Clone()
							v63.Name = tostring(v_u_61)
							v63.LayoutOrder = v_u_61
							v63.ZIndex = v60 - v_u_61
							v63.Visible = true
							if v63:FindFirstChild("CLAIM_BUTTON") then
								v63.CLAIM_BUTTON.Visible = false
							end
							if v63:FindFirstChild("CLAIM_BUTTON_DISABLED") then
								v63.CLAIM_BUTTON_DISABLED.Visible = false
							end
							if v63:FindFirstChild("CLAIM_BUTTON_LOCKED") then
								v63.CLAIM_BUTTON_LOCKED.Visible = false
							end
							if v_u_61 == 4 then
								v63.Arrow.Visible = false
							end
							v63.CLAIM_BUTTON.SENSOR.Activated:Connect(function()
								-- upvalues: (ref) v_u_32, (ref) v_u_35, (copy) v_u_61, (ref) v_u_42, (ref) v_u_30, (ref) v_u_31, (ref) v_u_5, (ref) v_u_20, (ref) v_u_18
								if v_u_32 == true then
									return
								elseif v_u_35 >= 4 then
									print("No watering cans remaining this period.")
									return
								elseif v_u_35 + 1 == v_u_61 then
									v_u_42()
									if v_u_30 and v_u_31 then
										v_u_30 = false
										v_u_32 = true
										local v64 = {
											["eventName"] = "WateringCanClaimAttempt",
											["value"] = 1,
											["fields"] = {
												["playerId"] = v_u_5.UserId,
												["playerName"] = v_u_5.Name,
												["slotIndex"] = v_u_61,
												["totalClaimsBefore"] = v_u_35
											}
										}
										v_u_20:FireServer(v64)
										v_u_18:FireServer()
									end
								end
							end)
							local v65 = v62.Rewards
							if v65 then
								v65 = v62.Rewards[1]
							end
							if v65 then
								v63.IMAGE_CONTAINER.ITEM_IMAGE.Image = v_u_8(v65.RewardName, v65.Type)
								local v66 = ("%*%*"):format(v_u_9(v65.RewardName, v65.Type) or v65.RewardName, v65.Amount <= 1 and "" or (" x%*"):format(v65.Amount))
								v63.IMAGE_CONTAINER.RewardName.Text = v66
								local v67 = v_u_10:GetRarityColor({
									["Type"] = v65.Type,
									["Value"] = v65.RewardName or "Normal",
									["Quantity"] = v65.Amount or 1
								})
								local v68 = v67 or Color3.fromRGB(127, 127, 127)
								local v69 = v67 or Color3.fromRGB(127, 127, 127)
								local v70 = v63.IMAGE_CONTAINER
								local v71, v72, v73 = v69:ToHSV()
								local v74 = Color3.fromHSV
								local v75 = v73 / 1.3
								v70.BackgroundColor3 = v74(v71, v72, (math.clamp(v75, 0, 1)))
								local v76 = v63.IMAGE_CONTAINER.RewardName
								local v77, v78, v79 = v68:ToHSV()
								local v80 = Color3.fromHSV
								local v81 = v79 / 3
								v76.TextStrokeColor3 = v80(v77, v78, (math.clamp(v81, 0, 1)))
							end
							v63.CLAIM_BUTTON.CLAIM.Text = "Watch"
							v63.CLAIM_BUTTON.CLAIM_BUTTON.Text = "Watch"
							v63.Parent = v_u_43
						end
					end
					v_u_56()
				end
			else
				return
			end
		end
		task.spawn(function()
			-- upvalues: (ref) v_u_34, (ref) v_u_4, (ref) v_u_11, (ref) v_u_24, (ref) v_u_30, (ref) v_u_31, (ref) v_u_42, (copy) v_u_56
			task.spawn(function()
				-- upvalues: (ref) v_u_34, (ref) v_u_4, (ref) v_u_11, (ref) v_u_24
				while true do
					repeat
						wait(1)
					until v_u_34
					local v83 = v_u_34 - v_u_4:GetServerTimeNow()
					local v84 = math.max(0, v83)
					v_u_24.Text = "Refresh in: " .. v_u_11.compactFormat((math.max(0, v84)))
				end
			end)
			local v85 = 0
			while true do
				while true do
					task.wait(3)
					v85 = v85 + 1
					if not v_u_30 then
						break
					end
					wait(5)
				end
				if v85 >= 10 and (v_u_30 == false and v_u_31 == true) then
					v_u_42()
					v_u_56()
					if v_u_31 == false then
						return
					end
					v85 = 0
				end
			end
		end)
		v_u_42()
		print("Ad Service Checked")
		v_u_56()
		v_u_16.OnClientEvent:Connect(function(p86, p87, p88)
			-- upvalues: (ref) v_u_33, (ref) v_u_34, (ref) v_u_35, (ref) v_u_32, (copy) v_u_82, (ref) v_u_42
			v_u_33 = p86
			v_u_34 = p87
			v_u_35 = p88 or 0
			local v89 = 4 - v_u_35
			math.max(0, v89)
			v_u_32 = false
			v_u_82()
			v_u_42()
		end)
		v_u_19.OnClientEvent:Connect(function(p90, p91, _)
			-- upvalues: (ref) v_u_35, (ref) v_u_32, (ref) v_u_33, (ref) v_u_5, (ref) v_u_20, (ref) v_u_42, (copy) v_u_56
			v_u_35 = p91 or v_u_35
			v_u_32 = false
			if p90 then
				print("Claim Success")
				local v92 = v_u_33 and v_u_33.Rewards
				if v92 then
					v92 = v_u_33.Rewards[p91]
				end
				local v93 = v92 and v92.Rewards
				if v93 then
					v93 = v92.Rewards[1]
				end
				local v94 = {
					["eventName"] = "WateringCanClaimResult",
					["value"] = 1,
					["fields"] = {
						["playerId"] = v_u_5.UserId,
						["playerName"] = v_u_5.Name,
						["slotIndex"] = p91,
						["totalClaimsAfter"] = p91,
						["itemName"] = v93 and v93.RewardName or nil,
						["wasSuccessful"] = true
					}
				}
				v_u_20:FireServer(v94)
			else
				print("Claim failed")
				local v95 = {
					["eventName"] = "WateringCanClaimResult",
					["value"] = 1,
					["fields"] = {
						["playerId"] = v_u_5.UserId,
						["playerName"] = v_u_5.Name,
						["totalClaimsAfter"] = p91 or v_u_35,
						["wasSuccessful"] = false
					}
				}
				v_u_20:FireServer(v95)
			end
			v_u_42()
			v_u_56()
		end)
		v_u_25.MouseButton1Up:Connect(function()
			-- upvalues: (ref) v_u_12, (ref) v_u_21
			v_u_12:Toggle(v_u_21)
		end)
		v_u_27.MouseButton1Up:Connect(function()
			-- upvalues: (ref) v_u_12, (ref) v_u_21
			v_u_12:Toggle(v_u_21)
		end)
		v_u_28.MouseButton1Up:Connect(function()
			-- upvalues: (ref) v_u_22
			v_u_22.Visible = not v_u_22.Visible
		end)
	end
	function v_u_29.Start(_)
		-- upvalues: (copy) v_u_17, (ref) v_u_33, (ref) v_u_34, (ref) v_u_35, (copy) v_u_96
		local v97, v98, v99, v100 = pcall(function()
			-- upvalues: (ref) v_u_17
			return v_u_17:InvokeServer()
		end)
		if v97 then
			v_u_33 = v98
			v_u_34 = v99
			v_u_35 = v100 or 0
			local v101 = 4 - v_u_35
			math.max(0, v101)
		else
			warn("WateringCanGetData failed:", v98)
		end
		v_u_96()
	end
	task.spawn(function()
		-- upvalues: (copy) v_u_5, (copy) v_u_29
		game:GetService("RunService")
		wait(35)
		print("Roblox Ad Services Team - Watering Can Testing")
		if v_u_5:GetAttribute("AB_rewarded_video_ad_WateringCan") == true then
			v_u_29:Start()
		else
			warn("Watering Can UI not started: AB_rewarded_video_ad_WateringCan is not enabled for this player")
		end
	end)
	return v_u_29
end