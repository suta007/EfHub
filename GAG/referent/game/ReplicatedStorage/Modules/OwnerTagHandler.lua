local v1 = {}
local v2 = game:GetService("RunService")
local v_u_3 = game:GetService("Players")
local v_u_4 = game:GetService("TweenService")
local v5 = game:GetService("ReplicatedStorage")
local v6 = v5:WaitForChild("Modules")
local v_u_7 = require(v6:WaitForChild("GetFarm"))
local v_u_8 = require(v5.Modules.Settings.SettingsService)
local v_u_9 = v_u_3.LocalPlayer
local v_u_10 = v_u_9:WaitForChild("PlayerGui")
local v_u_11 = v_u_9.Character or v_u_9.CharacterAdded:Wait()
local v_u_12 = v5.GameEvents.PlayerTeleportTriggered
v_u_9.CharacterAdded:Connect(function(p13)
	-- upvalues: (ref) v_u_11
	v_u_11 = p13
end)
local v_u_14 = {}
local v_u_15 = {}
local v_u_16 = {}
local v_u_17 = true
local v_u_18 = script:WaitForChild("OwnerTag")
local v_u_19 = game.SoundService.Hover
local v_u_20 = game.SoundService.Click
local function v_u_44(p_u_21, p_u_22)
	-- upvalues: (copy) v_u_18, (copy) v_u_10, (copy) v_u_3, (copy) v_u_9, (ref) v_u_17, (copy) v_u_4, (copy) v_u_19, (copy) v_u_7, (ref) v_u_11, (copy) v_u_12, (copy) v_u_20
	local v23 = v_u_18:Clone()
	local v24 = p_u_21:WaitForChild("Owner_Tag")
	v23:PivotTo(v24:GetPivot())
	v23.Parent = workspace
	local v_u_25 = v23.Part.BillboardGui
	v_u_25.Parent = v_u_10
	local v_u_26 = v_u_25:FindFirstChild("Headshot", true)
	local v27 = v_u_25:WaitForChild("SENSOR")
	local v_u_28 = v_u_25:FindFirstChild("Title", true)
	local v_u_29 = v_u_25:WaitForChild("bg")
	if p_u_22 then
		v_u_26.Image = v_u_3:GetUserThumbnailAsync(p_u_22.UserId, Enum.ThumbnailType.HeadShot, Enum.ThumbnailSize.Size420x420)
		if p_u_22 == v_u_9 then
			v_u_28.Text = "Your Garden"
		else
			v_u_28.Text = p_u_22.DisplayName .. "\'s Garden"
		end
	end
	local v_u_30 = false
	local function v33(p31)
		-- upvalues: (ref) v_u_17, (ref) v_u_9, (copy) v_u_25, (ref) v_u_30, (ref) v_u_4, (copy) v_u_26, (copy) v_u_29, (copy) v_u_28
		local v32
		if v_u_17 and (v_u_9:GetAttribute("DoingOfflineCutscene") ~= true and v_u_9:GetAttribute("Loading_Screen_Finished") == true) then
			v32 = v_u_9:GetAttribute("Finished_Loading") == true
		else
			v32 = false
		end
		if v32 then
			v_u_30 = p31
			if p31 then
				v_u_25.Enabled = true
			end
			v_u_4:Create(v_u_26, TweenInfo.new(0.2), {
				["ImageTransparency"] = p31 and 0 or 1
			}):Play()
			v_u_4:Create(v_u_29, TweenInfo.new(0.2), {
				["ImageTransparency"] = p31 and 0 or 1
			}):Play()
			v_u_4:Create(v_u_28, TweenInfo.new(0.2), {
				["TextTransparency"] = p31 and 0 or 1
			}):Play()
			if not p31 then
				task.delay(0.2, function()
					-- upvalues: (ref) v_u_25
					v_u_25.Enabled = false
				end)
			end
			v_u_29.ImageColor3 = Color3.new(1, 1, 1)
			v_u_26.ImageColor3 = Color3.new(1, 1, 1)
		else
			v_u_25.Enabled = false
		end
	end
	v27.MouseEnter:Connect(function()
		-- upvalues: (copy) v_u_29, (copy) v_u_26, (ref) v_u_19
		v_u_29.ImageColor3 = Color3.new(0.831373, 0.831373, 0.831373)
		v_u_26.ImageColor3 = Color3.new(0.831373, 0.831373, 0.831373)
		v_u_19.PlaybackSpeed = 1 + math.random(-15, 15) / 100
		v_u_19.TimePosition = 0
		v_u_19.Playing = true
	end)
	v27.MouseLeave:Connect(function()
		-- upvalues: (copy) v_u_29, (copy) v_u_26
		v_u_29.ImageColor3 = Color3.new(1, 1, 1)
		v_u_26.ImageColor3 = Color3.new(1, 1, 1)
	end)
	v27.MouseButton1Down:Connect(function()
		-- upvalues: (copy) v_u_29, (copy) v_u_26
		v_u_29.ImageColor3 = Color3.new(0.66666, 0.66666, 0.66666)
		v_u_26.ImageColor3 = Color3.new(0.66666, 0.66666, 0.66666)
	end)
	v27.MouseButton1Up:Connect(function()
		-- upvalues: (copy) v_u_29, (copy) v_u_26
		v_u_29.ImageColor3 = Color3.new(1, 1, 1)
		v_u_26.ImageColor3 = Color3.new(1, 1, 1)
	end)
	v27.MouseButton1Click:Connect(function()
		-- upvalues: (ref) v_u_30, (copy) p_u_22, (ref) v_u_9, (ref) v_u_7, (ref) v_u_11, (ref) v_u_12, (copy) p_u_21, (copy) v_u_29, (copy) v_u_26, (ref) v_u_20
		if v_u_30 then
			if p_u_22 == v_u_9 then
				v_u_11:PivotTo(v_u_7(v_u_9).Spawn_Point.CFrame)
				v_u_12:FireServer("Farm")
			else
				v_u_11:PivotTo(p_u_21.Spawn_Point.CFrame)
				v_u_12:FireServer("Farm")
			end
			v_u_29.ImageColor3 = Color3.new(1, 1, 1)
			v_u_26.ImageColor3 = Color3.new(1, 1, 1)
			v_u_20.PlaybackSpeed = 1 + math.random(-15, 15) / 100
			v_u_20.TimePosition = 0
			v_u_20.Playing = true
		end
	end)
	local v34 = {
		["OwnerTag"] = v23,
		["BillBoardGui"] = v_u_25,
		["Owner_Tag"] = v24,
		["ToggleTransparency"] = v33,
		["LastState"] = false,
		["CurrentState"] = v_u_30
	}
	if v_u_11 then
		local v35
		if v_u_17 and (v_u_9:GetAttribute("DoingOfflineCutscene") ~= true and v_u_9:GetAttribute("Loading_Screen_Finished") == true) then
			v35 = v_u_9:GetAttribute("Finished_Loading") == true
		else
			v35 = false
		end
		if v35 then
			local v36 = v_u_11:GetPivot().Position
			local v37 = v36.X
			local v38 = v36.Z
			local v39 = Vector3.new(v37, 0, v38)
			local v40 = v24.Position
			local v41 = v40.X
			local v42 = v40.Z
			local v43 = (Vector3.new(v41, 0, v42) - v39).Magnitude >= 80
			v33(v43)
			v34.LastState = v43
			::l20::
			return v34
		end
	end
	v33(false)
	goto l20
end
local function v_u_52(p_u_45)
	-- upvalues: (copy) v_u_14, (copy) v_u_3, (copy) v_u_44, (copy) v_u_15
	local v46 = p_u_45.Important:FindFirstChild("Data")
	if v46 then
		local v_u_47 = v46:FindFirstChild("Owner")
		if v_u_47 then
			if v_u_14[p_u_45] then
				if v_u_14[p_u_45].OwnerTag then
					v_u_14[p_u_45].OwnerTag:Destroy()
				end
				if v_u_14[p_u_45].BillBoardGui then
					v_u_14[p_u_45].BillBoardGui:Destroy()
				end
				v_u_14[p_u_45] = nil
			end
			local v48 = v_u_47.Value and v_u_3:FindFirstChild(v_u_47.Value)
			if v48 then
				v_u_14[p_u_45] = v_u_44(p_u_45, v48)
			end
			v_u_15[p_u_45] = v_u_47.Changed:Connect(function()
				-- upvalues: (copy) p_u_45, (ref) v_u_14, (copy) v_u_47, (ref) v_u_3, (ref) v_u_44
				local v49 = p_u_45
				if v_u_14[v49] then
					if v_u_14[v49].OwnerTag then
						v_u_14[v49].OwnerTag:Destroy()
					end
					if v_u_14[v49].BillBoardGui then
						v_u_14[v49].BillBoardGui:Destroy()
					end
					v_u_14[v49] = nil
				end
				local v50 = v_u_47.Value
				local v51 = v50 and v_u_3:FindFirstChild(v50)
				if v51 then
					v_u_14[p_u_45] = v_u_44(p_u_45, v51)
				end
			end)
		end
	else
		return
	end
end
local function v_u_55()
	-- upvalues: (copy) v_u_14, (copy) v_u_15, (copy) v_u_52
	local v53 = workspace:FindFirstChild("Farm")
	if v53 then
		for _, v54 in pairs(v53:GetChildren()) do
			if not (v_u_14[v54] or v_u_15[v54]) then
				v_u_52(v54)
			end
		end
	end
end
local function v_u_61()
	-- upvalues: (copy) v_u_61, (copy) v_u_16, (copy) v_u_52, (copy) v_u_14, (copy) v_u_15, (copy) v_u_55
	local v56 = workspace:FindFirstChild("Farm")
	if v56 then
		v_u_16.ChildAdded = v56.ChildAdded:Connect(function(p57)
			-- upvalues: (ref) v_u_52
			task.wait(0.1)
			v_u_52(p57)
		end)
		v_u_16.ChildRemoved = v56.ChildRemoved:Connect(function(p58)
			-- upvalues: (ref) v_u_14, (ref) v_u_15
			if v_u_14[p58] then
				if v_u_14[p58].OwnerTag then
					v_u_14[p58].OwnerTag:Destroy()
				end
				if v_u_14[p58].BillBoardGui then
					v_u_14[p58].BillBoardGui:Destroy()
				end
				v_u_14[p58] = nil
			end
			if v_u_15[p58] then
				v_u_15[p58]:Disconnect()
				v_u_15[p58] = nil
			end
		end)
		v_u_55()
	else
		local v_u_59 = nil
		v_u_59 = workspace.ChildAdded:Connect(function(p60)
			-- upvalues: (ref) v_u_59, (ref) v_u_61
			if p60.Name == "Farm" then
				v_u_59:Disconnect()
				v_u_61()
			end
		end)
	end
end
v_u_61()
v_u_17 = v_u_8:GetSetting("YourFarmIcon")
local function v73()
	-- upvalues: (ref) v_u_17, (copy) v_u_9, (copy) v_u_14, (ref) v_u_11
	local v62
	if v_u_17 and (v_u_9:GetAttribute("DoingOfflineCutscene") ~= true and v_u_9:GetAttribute("Loading_Screen_Finished") == true) then
		v62 = v_u_9:GetAttribute("Finished_Loading") == true
	else
		v62 = false
	end
	if v62 then
		if v_u_11 then
			local v63 = v_u_11:GetPivot().Position
			local v64 = v63.X
			local v65 = v63.Z
			local v66 = Vector3.new(v64, 0, v65)
			for _, v67 in pairs(v_u_14) do
				local v68 = v67.Owner_Tag.Position
				local v69 = v68.X
				local v70 = v68.Z
				local v71 = (Vector3.new(v69, 0, v70) - v66).Magnitude >= 80
				v67.ToggleTransparency(v71)
				v67.LastState = v71
			end
		end
	else
		for _, v72 in pairs(v_u_14) do
			v72.ToggleTransparency(false)
			v72.LastState = false
		end
	end
end
v_u_9:GetAttributeChangedSignal("DoingOfflineCutscene"):Connect(v73)
v_u_9:GetAttributeChangedSignal("Loading_Screen_Finished"):Connect(v73)
v_u_9:GetAttributeChangedSignal("Finished_Loading"):Connect(v73)
function v1.SettingUpdated(_, _)
	-- upvalues: (copy) v_u_8, (ref) v_u_17, (copy) v_u_9, (copy) v_u_14, (ref) v_u_11
	local v74 = v_u_8:GetSetting("YourFarmIcon")
	if v74 ~= v_u_17 then
		v_u_17 = v74
		local v75
		if v_u_17 and (v_u_9:GetAttribute("DoingOfflineCutscene") ~= true and v_u_9:GetAttribute("Loading_Screen_Finished") == true) then
			v75 = v_u_9:GetAttribute("Finished_Loading") == true
		else
			v75 = false
		end
		if not v75 then
			for _, v76 in pairs(v_u_14) do
				v76.BillBoardGui.Enabled = false
				v76.CurrentState = false
				v76.LastState = false
			end
			return
		end
		if v_u_11 then
			local v77 = v_u_11:GetPivot().Position
			local v78 = v77.X
			local v79 = v77.Z
			local v80 = Vector3.new(v78, 0, v79)
			for _, v81 in pairs(v_u_14) do
				local v82 = v81.Owner_Tag.Position
				local v83 = v82.X
				local v84 = v82.Z
				local v85 = (Vector3.new(v83, 0, v84) - v80).Magnitude >= 80
				v81.ToggleTransparency(v85)
				v81.LastState = v85
			end
		end
	end
end
v2.RenderStepped:Connect(function()
	-- upvalues: (ref) v_u_11, (ref) v_u_17, (copy) v_u_9, (copy) v_u_14
	if v_u_11 then
		local v86
		if v_u_17 and (v_u_9:GetAttribute("DoingOfflineCutscene") ~= true and v_u_9:GetAttribute("Loading_Screen_Finished") == true) then
			v86 = v_u_9:GetAttribute("Finished_Loading") == true
		else
			v86 = false
		end
		if v86 then
			local v87 = v_u_11:GetPivot().Position
			local v88 = v87.X
			local v89 = v87.Z
			local v90 = Vector3.new(v88, 0, v89)
			for _, v91 in pairs(v_u_14) do
				if v91.Owner_Tag then
					local v92 = v91.Owner_Tag.Position
					local v93 = v92.X
					local v94 = v92.Z
					local v95 = (Vector3.new(v93, 0, v94) - v90).Magnitude >= 80
					if v91.LastState ~= v95 then
						v91.LastState = v95
						v91.ToggleTransparency(v95)
					end
				end
			end
			return
		end
	end
	for _, v96 in pairs(v_u_14) do
		if v96.CurrentState then
			v96.ToggleTransparency(false)
		end
	end
end)
function v1.Cleanup(_)
	-- upvalues: (copy) v_u_14, (copy) v_u_15, (copy) v_u_16
	for v97, _ in pairs(v_u_14) do
		if v_u_14[v97] then
			if v_u_14[v97].OwnerTag then
				v_u_14[v97].OwnerTag:Destroy()
			end
			if v_u_14[v97].BillBoardGui then
				v_u_14[v97].BillBoardGui:Destroy()
			end
			v_u_14[v97] = nil
		end
	end
	for v98, _ in pairs(v_u_15) do
		if v_u_15[v98] then
			v_u_15[v98]:Disconnect()
			v_u_15[v98] = nil
		end
	end
	for _, v99 in pairs(v_u_16) do
		v99:Disconnect()
	end
end
v_u_3.PlayerRemoving:Connect(function(_)
	-- upvalues: (copy) v_u_14
	for _, v100 in workspace.Farm:GetChildren() do
		local v101 = v100:FindFirstChild("Important"):FindFirstChild("Data")
		if (v101.Owner.Value == "" or #v101.Owner.Value == 0) and v_u_14[v100] then
			if v_u_14[v100].OwnerTag then
				v_u_14[v100].OwnerTag:Destroy()
			end
			if v_u_14[v100].BillBoardGui then
				v_u_14[v100].BillBoardGui:Destroy()
			end
			v_u_14[v100] = nil
		end
	end
end)
return v1