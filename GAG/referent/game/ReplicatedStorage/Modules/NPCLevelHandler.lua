game:GetService("CollectionService")
local v1 = game:GetService("ReplicatedStorage")
local v_u_2 = game:GetService("TweenService")
local v_u_3 = require(v1.Data.NPCLevels.NPCLevelData)
local v_u_4 = require(v1.Data.NPCLevels.NPCLevelData.NPCLevelTypes)
local v_u_5 = require(v1.Modules.DataService)
local v_u_6 = require(v1.Modules.UpdateService)
local v_u_7 = require(v1.Modules.NumberUtil)
local v8 = v1.GameEvents.SetNPCBirthday_RE
local v_u_9 = game.Players.LocalPlayer
assert(v_u_9, "LocalPlayer not found")
local v_u_10 = v_u_9:WaitForChild("PlayerGui"):WaitForChild("NPCLevelUI")
local v_u_11 = v_u_10:WaitForChild("LevelFrame"):WaitForChild("LevelText")
local v_u_12 = v_u_10:WaitForChild("TimeFrame")
local v_u_13 = v_u_12:WaitForChild("TimeText")
local v14 = v_u_10:WaitForChild("BarFrame")
local v_u_15 = v14:WaitForChild("Bar")
local v_u_16 = v14:WaitForChild("BarText")
local v_u_17 = v_u_10.Size
local v_u_18 = nil
local v_u_19 = nil
local v_u_20 = nil
local v_u_38 = {
	["GetNPCPoints"] = function(_, p21)
		-- upvalues: (copy) v_u_5, (copy) v_u_4
		local v22 = v_u_5:GetData()
		if v22 then
			return (v22.NPCPoints[p21] or v_u_4:DefaultData()).Points or 0
		end
		warn("No player data for local player")
		return 0
	end,
	["GetNPCLevel"] = function(_, p23)
		-- upvalues: (copy) v_u_3, (copy) v_u_38
		return v_u_3:GetLevelFromPoints(p23, v_u_38:GetNPCPoints(p23))
	end,
	["GetLevelProgress"] = function(_, p24)
		-- upvalues: (copy) v_u_38, (copy) v_u_3
		local v25 = v_u_38:GetNPCLevel(p24)
		local v26 = v_u_38:GetNPCPoints(p24)
		local v27 = v_u_3:GetLevelPoints(p24, v25)
		local v28 = v_u_3:GetLevelPoints(p24, v25 + 1)
		if v28 == 0 then
			return 0, 0
		else
			return v26 - v27, v28 - v27
		end
	end,
	["HasRequiredNPCLevels"] = function(_, p29)
		-- upvalues: (copy) v_u_5, (copy) v_u_38
		if p29 and next(p29) ~= nil then
			if v_u_5:GetData() then
				for v30, v31 in p29 do
					if v_u_38:GetNPCLevel(v30) < v31 then
						return false
					end
				end
				return true
			else
				warn("No player data for local player")
				return false
			end
		else
			return true
		end
	end,
	["GetLastFeedTime"] = function(_, p32)
		-- upvalues: (copy) v_u_5, (copy) v_u_9, (copy) v_u_4
		local v33 = v_u_5:GetData()
		if v33 then
			return (v33.NPCPoints[p32] or v_u_4:DefaultData()).LastFeedTime or 0
		end
		warn((("No player data for %*"):format(v_u_9.Name)))
		return 0
	end,
	["IsFeedTime"] = function(_, p34)
		-- upvalues: (copy) v_u_38, (copy) v_u_3
		local v35 = v_u_38:GetLastFeedTime(p34)
		local v36 = workspace:GetServerTimeNow() - v35
		local v37 = v_u_3.NPCEntires[p34]
		if v37 then
			return v37.FeedCooldown <= v36, v37.FeedCooldown - v36
		end
		warn((("Invalid NPC name: %*"):format(p34)))
		return false, 0
	end
}
local function v_u_40()
	-- upvalues: (copy) v_u_10, (ref) v_u_18, (ref) v_u_19, (ref) v_u_20, (copy) v_u_2, (copy) v_u_17
	if v_u_10.Enabled then
		return
	else
		v_u_10.Enabled = true
		if v_u_18 then
			v_u_18:Cancel()
			v_u_18 = nil
		end
		if v_u_19 then
			v_u_19:Cancel()
			v_u_19 = nil
		end
		if v_u_20 then
			task.cancel(v_u_20)
			v_u_20 = nil
		end
		local v39 = {
			["Size"] = v_u_17
		}
		v_u_18 = v_u_2:Create(v_u_10, TweenInfo.new(0.5), v39)
		if v_u_18 then
			v_u_18:Play()
			v_u_18.Completed:Once(function()
				-- upvalues: (ref) v_u_18
				v_u_18 = nil
			end)
		end
	end
end
local function v_u_42(p_u_41)
	-- upvalues: (copy) v_u_10, (ref) v_u_20, (ref) v_u_18, (ref) v_u_19, (copy) v_u_2
	if v_u_10.Enabled then
		if not v_u_20 or coroutine.status(v_u_20) == "dead" then
			if v_u_18 then
				v_u_18:Cancel()
				v_u_18 = nil
			end
			if v_u_19 then
				v_u_19:Cancel()
				v_u_19 = nil
			end
			if v_u_20 then
				task.cancel(v_u_20)
				v_u_20 = nil
			end
			v_u_19 = v_u_2:Create(v_u_10, TweenInfo.new(0.5), {
				["Size"] = UDim2.new(0, 0, 0, 0)
			})
			v_u_20 = task.spawn(function()
				-- upvalues: (copy) p_u_41, (ref) v_u_19, (ref) v_u_10, (ref) v_u_20
				task.wait(p_u_41 or 0)
				if v_u_19 then
					v_u_19:Play()
					v_u_19.Completed:Once(function()
						-- upvalues: (ref) v_u_10, (ref) v_u_19
						v_u_10.Enabled = false
						v_u_19 = nil
					end)
					v_u_20 = nil
				else
					v_u_10.Enabled = false
				end
			end)
		end
	else
		return
	end
end
local function v_u_62()
	-- upvalues: (copy) v_u_9, (copy) v_u_42, (copy) v_u_10, (copy) v_u_3, (copy) v_u_6, (copy) v_u_38, (copy) v_u_12, (copy) v_u_13, (copy) v_u_7, (copy) v_u_16, (copy) v_u_11, (copy) v_u_2, (copy) v_u_15, (copy) v_u_40
	local v43 = v_u_9.Character or v_u_9.CharacterAdded:Wait()
	if v43 then
		local v44 = v43:FindFirstChildWhichIsA("Tool")
		if v44 then
			v44 = v44:HasTag("FoodTool")
		end
		if not v44 then
			v_u_42(3)
			if not v_u_10.Enabled then
				return
			end
		end
		local v45 = (1 / 0)
		local v46 = nil
		for v47, v48 in v_u_3:GetTrackedNPCs() do
			if (v48 == "Sam" or not v_u_6:IsHiddenFromUpdate("NPCBirthday")) and not v_u_3.NPCEntires[v48].OnlyFeedBirthday then
				local v49 = (v47:GetPivot().Position - v43:GetPivot().Position).Magnitude
				if v49 < v45 and v49 <= 30 then
					v46 = v47
					v45 = v49
				end
			end
		end
		if v46 then
			local v50 = v_u_3:TryGetNPCName(v46)
			if v50 then
				local v51 = v46:GetPivot().Position
				local v52 = v46:GetExtentsSize().Y / 2
				local v53 = v51.X
				local v54 = v51.Y + v52 + 2
				local v55 = v51.Z
				v_u_10.StudsOffsetWorldSpace = Vector3.new(v53, v54, v55)
				local v56 = v_u_38:GetNPCLevel(v50)
				local v57, v58 = v_u_38:GetLevelProgress(v50)
				local v59 = v57 / v58
				local v60, v61 = v_u_38:IsFeedTime(v50)
				v_u_12.Visible = not v60
				v_u_13.Text = ("Cooldown: %*"):format((v_u_7.compactFormat(v61)))
				if v58 == 0 then
					v_u_16.Text = "Points: MAX!"
					v_u_12.Visible = false
					v59 = 1
				else
					v_u_16.Text = ("Points: %*/%*"):format(v57, v58)
				end
				v_u_11.Text = ("Friendship Level: %* \226\173\144"):format(v56)
				v_u_2:Create(v_u_15, TweenInfo.new(0.25), {
					["Size"] = UDim2.fromScale(v59 * 0.96, 0.7)
				}):Play()
				v_u_40()
			else
				warn((("No tracked NPC for %*"):format((v46:GetFullName()))))
				v_u_42()
			end
		else
			v_u_42()
			return
		end
	else
		v_u_42()
		return
	end
end
v_u_42()
task.spawn(function()
	-- upvalues: (copy) v_u_62
	while true do
		task.wait(0.25)
		v_u_62()
	end
end)
v8.OnClientEvent:Connect(function(p63, p64, p65)
	-- upvalues: (copy) v_u_3
	local v66 = v_u_3.NPCEntires[p63]
	if v66 then
		v66.BirthdayDay = p64
		v66.BirthdayMonth = p65
		v_u_3.NPCEntires[p63] = v66
	else
		warn((("Invalid NPC name: %*"):format(p63)))
	end
end)
return v_u_38