local v1 = game:GetService("ReplicatedStorage")
game:GetService("RunService")
local v_u_2 = game:GetService("Players")
local v3 = game:GetService("ReplicatedFirst")
local v_u_4 = require(v1.Modules.TimeHelper)
local v_u_5 = require(v1.Modules.DataService)
local v6 = require(v1.Modules.GetFarmAsync)
local v_u_7 = require(v1.Modules.GetFarmAncestor)
local v_u_8 = v3.DayInSeconds.Value
local v_u_9 = v_u_2.LocalPlayer
local v_u_10 = v_u_9.Character or v_u_9.CharacterAdded:Wait()
local v_u_11 = v6(v_u_9)
v_u_9.CharacterAdded:Connect(function(p12)
	-- upvalues: (ref) v_u_10
	v_u_10 = p12
end)
local v_u_13 = {
	["LinkedPotsToLocalPlayer"] = {},
	["OwnedPots"] = {},
	["MaxPotDistance"] = 15
}
local v_u_14 = v_u_13.LinkedPotsToLocalPlayer
local v_u_15 = v_u_13.OwnedPots
local v16 = require(v1.Modules.CreateTagHandler)
local v_u_17 = script:WaitForChild("PotUI")
local v18 = v_u_17.BillboardGui.MainFrame
local v_u_19 = v18.STATE_TEXT
local v_u_20 = v18.TIMER_TEXT
local v_u_21 = v18.EXPIRY_TEXT
v16({
	["Tag"] = "FriendshipPotServer",
	["OnInstanceAdded"] = function(p22)
		-- upvalues: (copy) v_u_9, (copy) v_u_14, (copy) v_u_11, (copy) v_u_7, (copy) v_u_15
		if p22:GetAttribute("LinkedPlayerID") == v_u_9.UserId then
			v_u_14[p22] = true
		elseif v_u_11 == v_u_7(p22) then
			v_u_15[p22] = true
		end
	end,
	["OnInstanceRemoved"] = function(p23)
		-- upvalues: (copy) v_u_14, (copy) v_u_15
		v_u_14[p23] = nil
		v_u_15[p23] = nil
	end
})
local function v_u_29()
	-- upvalues: (ref) v_u_10, (copy) v_u_14, (copy) v_u_13
	local v24 = v_u_10:GetPivot().Position
	local v25 = (1 / 0)
	local v26 = nil
	for v27 in v_u_14 do
		local v28 = (v27:GetPivot().Position - v24).Magnitude
		if v25 > v28 and v_u_13.MaxPotDistance > v28 then
			v26 = v27
			v25 = v28
		end
	end
	return v26, v25
end
local function v_u_35()
	-- upvalues: (ref) v_u_10, (copy) v_u_15, (copy) v_u_13
	local v30 = v_u_10:GetPivot().Position
	local v31 = (1 / 0)
	local v32 = nil
	for v33 in v_u_15 do
		local v34 = (v33:GetPivot().Position - v30).Magnitude
		if v31 > v34 and v_u_13.MaxPotDistance > v34 then
			v32 = v33
			v31 = v34
		end
	end
	return v32, v31
end
local function v_u_40(p36, p37)
	-- upvalues: (copy) v_u_5
	for _, v38 in v_u_5:GetData().SavedObjects do
		if v38.ObjectType == "FriendshipPot" then
			local v39 = v38.Data
			if v39.PotType == p37 and v39.LinkedPlayerID == p36.UserId then
				return true
			end
		end
	end
end
local function v_u_43(p41)
	-- upvalues: (copy) v_u_2
	local v42 = p41:FindFirstAncestor("Farm")
	if v42 then
		v42 = v42:FindFirstChild("Important")
	end
	if v42 then
		v42 = v42:FindFirstChild("Data")
	end
	if v42 then
		v42 = v42:FindFirstChild("Owner")
	end
	return v_u_2:FindFirstChild(v42.Value)
end
local v_u_44 = false
local function v_u_49(p45)
	-- upvalues: (copy) v_u_2
	local v_u_46 = p45:GetAttribute("LinkedPlayerID")
	if v_u_46 then
		local v47, v48 = pcall(function()
			-- upvalues: (ref) v_u_2, (copy) v_u_46
			return v_u_2:GetNameFromUserIdAsync(v_u_46)
		end)
		if v47 then
			p45:SetAttribute("LinkedPlayerID_NAME", v48)
		end
	end
	return p45:GetAttribute("LinkedPlayerID_NAME") or "UNKNOWN"
end
local v_u_50 = 0
task.spawn(function()
	-- upvalues: (ref) v_u_50
	while true do
		v_u_50 = workspace:GetServerTimeNow()
		task.wait(1)
	end
end)
local function v_u_82()
	-- upvalues: (copy) v_u_35, (copy) v_u_29, (copy) v_u_8, (copy) v_u_43, (copy) v_u_40, (ref) v_u_50, (copy) v_u_4, (copy) v_u_49, (copy) v_u_19, (copy) v_u_20, (copy) v_u_21, (ref) v_u_44, (copy) v_u_17
	local v51, v52 = v_u_35()
	local v53, v54 = v_u_29()
	local v55
	if v51 and v53 then
		if v54 <= v52 then
			v55 = v53
		else
			v55 = v51
		end
	else
		v55 = v51 or v53
	end
	if v55 then
		local v56 = (v55:GetAttribute("LastStreakTime") or 0) / v_u_8
		math.floor(v56)
	end
	local v57
	if v55 then
		v57 = v_u_43(v55)
	else
		v57 = v55
	end
	local v58
	if v51 then
		v58 = true
	elseif v57 then
		v58 = v_u_40(v57, v55:GetAttribute("PotType"))
	else
		v58 = v57
	end
	local v59 = v_u_50 / v_u_8
	local v60 = v_u_4:GenerateColonFormatFromTime((math.floor(v59) + 1) * v_u_8 - v_u_50)
	local v61
	if v55 then
		v61 = v_u_49(v55)
	else
		v61 = v55
	end
	local v62
	if v55 then
		local v63 = (v55:GetAttribute("LastStreakTime") or 0) / v_u_8
		v62 = math.floor(v63)
	else
		v62 = 0
	end
	local v64 = v_u_50 / v_u_8
	local _ = v62 == math.floor(v64)
	local v65
	if v55 then
		local v66 = v_u_50 / v_u_8
		local v67 = math.floor(v66)
		local v68 = v55:GetAttribute("LastStreakTime") / v_u_8
		local v69 = math.floor(v68)
		if v69 > 0 then
			v65 = v69 + 1 < v67
		else
			v65 = false
		end
	else
		v65 = v55
	end
	v_u_19.Text = not v58 and "You haven\'t placed down your friend\'s pot yet!" or ("[%s Pot]: %s \226\157\164\239\184\143  "):format(("%* & %*\'s"):format(v57.Name, v61), v55:GetAttribute("CurrentStreak") or 0)
	if not v51 then
		if v53 then
			local v70 = v_u_20
			if v58 then
				local v71 = (not v55 and 0 or v55:GetAttribute("LastTendTime")) / v_u_8
				local v72 = math.floor(v71)
				local v73 = v_u_50 / v_u_8
				if v72 ~= math.floor(v73) then
					local v74 = v_u_50 / v_u_8
					v75 = ("Tend this pot within %*!"):format((v_u_4:GenerateColonFormatFromTime((math.floor(v74) + 1) * v_u_8 - v_u_50)))
					::l56::
					v70.Text = v75
					goto l45
				end
			end
			local v75 = ("%* until you can tend!"):format(v60)
			goto l56
		end
		goto l45
	end
	local v76 = v_u_20
	if v58 then
		local v77 = (not v55 and 0 or v55:GetAttribute("LastTendTime")) / v_u_8
		local v78 = math.floor(v77)
		local v79 = v_u_50 / v_u_8
		if v78 ~= math.floor(v79) then
			local v80 = v_u_50 / v_u_8
			v81 = ("Get %* to tend to your pot within %*"):format(v61, (v_u_4:GenerateColonFormatFromTime((math.floor(v80) + 1) * v_u_8 - v_u_50)))
			::l44::
			v76.Text = v81
			::l45::
			v_u_20.Visible = not v65 and v58
			v_u_21.Visible = v65
			v_u_21.Text = "STREAK FAILED!"
			v_u_44 = v55
			if v55 then
				v_u_17:PivotTo(v55:GetPivot())
				v_u_17.Parent = workspace
			else
				v_u_17.Parent = script
			end
		end
	end
	local v81 = ("%* until your friend can tend!"):format(v60)
	goto l44
end
task.spawn(function()
	-- upvalues: (copy) v_u_82
	while true do
		task.wait(0.25)
		v_u_82()
	end
end)
return v_u_13