local v1 = game:GetService("Players")
local v_u_2 = game:GetService("TweenService")
local v3 = game:GetService("RunService")
local v4 = game:GetService("ReplicatedStorage")
local v5 = require(v4.Modules.BeeEventV2Controllers.BeeColonyStateController)
local v_u_6 = require(v4.Data.BeeEvent.BeeRegistry)
local v_u_7 = require(v4.Modules.TimeHelper)
local v_u_8 = require(v4.Modules.GetFarm)
local v9 = require(v4.Data.BeeEvent.BeeEventConfig)
local v_u_10 = v1.LocalPlayer
local v_u_11 = v_u_10:WaitForChild("PlayerGui"):WaitForChild("BeeHealth_UI"):WaitForChild("Container")
local v_u_12 = v_u_11.ScrollingFrame.Frame
local v_u_13 = v_u_12.InfoTemplate
local v_u_14 = ("Player_%*"):format(v_u_10.UserId)
local v_u_15 = TweenInfo.new(0.25, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)
local v_u_16 = v9.Nesting.ExitRange
local v_u_17 = Color3.fromRGB(255, 0, 0)
local v_u_18 = Color3.fromRGB(0, 255, 0)
local v_u_19 = {}
local function v_u_31(p20) -- name: GetSecondsRemaining
	-- upvalues: (copy) v_u_6, (copy) v_u_10
	local v21 = p20.Server
	local v22 = v_u_6[v21.BeeName]
	if not v22 then
		return 0
	end
	local v23 = v_u_6[p20.Server.BeeName]
	local v24
	if v23 then
		local v25 = v_u_10:GetAttribute("BeeHealthBonus") or 0
		v24 = v23.Stats.MaxHealth + v25
	else
		v24 = 1
	end
	local v26 = v22.Stats.HealRate
	if not v26 or v26 <= 0 then
		return 0
	end
	local v27 = v_u_10:GetAttribute("BeeRespawnReduction") or 0
	local v28 = v21.State == "Nesting" and 1 or 0.5
	local v29 = v24 * (v26 / 100) * (1 + v27) * v28
	if v29 <= 0 then
		return 0
	end
	local v30 = (v24 - v21.Health) / v29
	return math.ceil(v30)
end
local function v_u_38() -- name: IsNearHive
	-- upvalues: (copy) v_u_10, (copy) v_u_8, (copy) v_u_16
	local v32 = v_u_10.Character
	if v32 then
		v32 = v32:FindFirstChild("HumanoidRootPart")
	end
	if not v32 then
		return false
	end
	local v33 = v_u_8(v_u_10)
	if not v33 then
		return false
	end
	local v34 = v33:FindFirstChild("CurrentExpansion")
	if v34 then
		v34 = v34:FindFirstChild("Custom")
	end
	if v34 then
		v34 = v34:FindFirstChild("Hive")
	end
	if not v34 then
		return false
	end
	local v35 = v34:GetPivot().Position
	local v36 = v32.Position.X - v35.X
	local v37 = v32.Position.Z - v35.Z
	return Vector3.new(v36, 0, v37).Magnitude <= v_u_16
end
local v_u_39 = false
local function v_u_53(p40) -- name: RefreshInfo
	-- upvalues: (copy) v_u_6, (copy) v_u_10, (copy) v_u_2, (copy) v_u_15, (copy) v_u_17, (copy) v_u_18, (copy) v_u_7, (copy) v_u_31
	local v41 = p40.entry.Server
	if v_u_6[v41.BeeName] then
		local v42 = v_u_6[p40.entry.Server.BeeName]
		local v43
		if v42 then
			local v44 = v_u_10:GetAttribute("BeeHealthBonus") or 0
			v43 = v42.Stats.MaxHealth + v44
		else
			v43 = 1
		end
		local v45 = v41.Health / v43
		local v46 = math.clamp(v45, 0, 1)
		local v47
		if v41.LastHealTime == nil or v41.LastHealTime <= 0 then
			v47 = false
		else
			v47 = not v41.IsInCombat
		end
		v_u_2:Create(p40.frame.Details.Bar.Inner, v_u_15, {
			["Size"] = UDim2.fromScale(v46, 1),
			["BackgroundColor3"] = v_u_17:Lerp(v_u_18, v46)
		}):Play()
		local v48 = p40.frame.Details.Bar:FindFirstChild("Timer")
		if v48 then
			if v47 then
				v48.Text = v_u_7:GenerateColonFormatFromTime((v_u_31(p40.entry)))
				v48.Visible = true
			else
				v48.Visible = false
			end
		end
		if v47 then
			local v49 = p40.frame
			local v50 = v_u_31(p40.entry)
			v49.LayoutOrder = math.clamp(v50, 0, 9999)
		else
			local v51 = p40.frame
			local v52 = v46 * 100
			v51.LayoutOrder = math.floor(v52) + 10000
		end
	else
		return
	end
end
local function v_u_73(p54, p55, p56, p57) -- name: UpdateInfo
	-- upvalues: (copy) v_u_6, (copy) v_u_19, (copy) v_u_11, (ref) v_u_39, (copy) v_u_10, (copy) v_u_13, (copy) v_u_12, (copy) v_u_53
	local v58 = p55.Server
	local v59 = v_u_6[v58.BeeName]
	if v59 then
		if v58.BeeName == "Skeleton Bee" then
			local v60 = v_u_19[p54]
			if v60 then
				v60.frame:Destroy()
				v_u_19[p54] = nil
				local v61 = v_u_11
				local v62
				if next(v_u_19) == nil then
					v62 = false
				else
					v62 = v_u_39
				end
				v61.Visible = v62
			end
		else
			local v63 = v_u_6[p55.Server.BeeName]
			local v64
			if v63 then
				local v65 = v_u_10:GetAttribute("BeeHealthBonus") or 0
				v64 = v63.Stats.MaxHealth + v65
			else
				v64 = 1
			end
			if p56 ~= "Health" then
				p57 = v58.Health
			end
			if v64 <= p57 then
				local v66 = v_u_19[p54]
				if v66 then
					v66.frame:Destroy()
					v_u_19[p54] = nil
					local v67 = v_u_11
					local v68
					if next(v_u_19) == nil then
						v68 = false
					else
						v68 = v_u_39
					end
					v67.Visible = v68
				end
			else
				local v69 = v_u_19[p54]
				if not v69 then
					local v70 = v_u_13:Clone()
					v70.Visible = true
					v70.BeeIcon.Image = v59.Icon
					v70.Details.BeeName.Text = v59.DisplayName or v58.BeeName
					v70.Parent = v_u_12
					v69 = {
						["frame"] = v70,
						["entry"] = p55
					}
					v_u_19[p54] = v69
				end
				v_u_53(v69)
				local v71 = v_u_11
				local v72
				if next(v_u_19) == nil then
					v72 = false
				else
					v72 = v_u_39
				end
				v71.Visible = v72
				return
			end
		end
	else
		return
	end
end
v5.OnBeeStateUpdate:Connect(function(p74, p75, p76, p77)
	-- upvalues: (copy) v_u_14, (copy) v_u_73
	if p75.Server.Player == v_u_14 then
		if p76 ~= "LastHealTime" then
			v_u_73(p74, p75, p76, p77)
		end
	else
		return
	end
end)
v5.OnBeeDestroyed:Connect(function(p78, _)
	-- upvalues: (copy) v_u_19, (copy) v_u_11, (ref) v_u_39
	if v_u_19[p78] then
		local v79 = v_u_19[p78]
		if not v79 then
			return
		end
		v79.frame:Destroy()
		v_u_19[p78] = nil
		local v80 = v_u_11
		local v81
		if next(v_u_19) == nil then
			v81 = false
		else
			v81 = v_u_39
		end
		v80.Visible = v81
	end
end)
task.spawn(function()
	-- upvalues: (copy) v_u_19, (copy) v_u_53
	while true do
		repeat
			task.wait(0.5)
		until next(v_u_19)
		for _, v82 in v_u_19 do
			v_u_53(v82)
		end
	end
end)
v_u_11.Visible = false
v_u_13.Visible = false
v3.Heartbeat:Connect(function()
	-- upvalues: (ref) v_u_39, (copy) v_u_38, (copy) v_u_11, (copy) v_u_19
	local v83 = v_u_39
	v_u_39 = v_u_38()
	if v_u_39 ~= v83 then
		local v84 = v_u_11
		local v85
		if next(v_u_19) == nil then
			v85 = false
		else
			v85 = v_u_39
		end
		v84.Visible = v85
	end
end)
return {}