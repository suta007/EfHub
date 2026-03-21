local v_u_1 = game:GetService("Players")
local v_u_2 = game:GetService("RunService")
local v3 = game:GetService("ReplicatedStorage")
local v4 = require(v3.Modules.Signal)
local v_u_5 = require(script.Remote)
local v_u_6 = v_u_2:IsServer()
local v_u_7 = v_u_2:IsClient()
local v_u_8 = v4.new()
local v_u_9 = {}
local v_u_10 = {}
local v_u_11 = {}
local v_u_12
if v_u_7 then
	v_u_12 = v_u_1.LocalPlayer
else
	v_u_12 = nil
end
local v13 = {
	["_updateSignal"] = v_u_8,
	["_playerMaps"] = v_u_10
}
local function v_u_16(p14, p15)
	-- upvalues: (copy) v_u_2
	return p14.UserId < 0 and p15 < 0 and true or (v_u_2:IsStudio() and true or p14:IsFriendsWith(p15))
end
local function v_u_26(p17, p18)
	-- upvalues: (copy) v_u_1, (copy) v_u_10, (copy) v_u_11
	local v19 = v_u_1:GetPlayerByUserId(p18)
	if not v19 then
		local v20 = v_u_10[p17.UserId]
		if not v20 then
			v20 = {}
			v_u_10[p17.UserId] = v20
		end
		return v20[p18] == true
	end
	local v21 = v_u_10[v19.UserId]
	if not v21 then
		v21 = {}
		v_u_10[v19.UserId] = v21
	end
	if not v21[p17.UserId] then
		local v22 = v_u_10[p17.UserId]
		if not v22 then
			v22 = {}
			v_u_10[p17.UserId] = v22
		end
		if not v22[v19.UserId] then
			local v23 = v_u_11[v19.UserId]
			if not v23 then
				v23 = {}
				v_u_11[v19.UserId] = v23
			end
			local v24 = false
			local v25 = v_u_11[p17.UserId]
			if not v25 then
				v25 = {}
				v_u_11[p17.UserId] = v25
			end
			if v25[p18] == true then
				if v23 == nil then
					v24 = false
				else
					v24 = v23[p17.UserId] == true
				end
			end
			return v24
		end
	end
	return true
end
local function v_u_33(p27, p28, p29)
	-- upvalues: (copy) v_u_10, (copy) v_u_26, (copy) v_u_8, (copy) v_u_6, (copy) v_u_5, (copy) v_u_1
	if p28 == p27.UserId then
		return
	else
		local v30 = v_u_10[p27.UserId]
		if not v30 then
			v30 = {}
			v_u_10[p27.UserId] = v30
		end
		if v30[p28] ~= p29 then
			v30[p28] = p29
			local v31 = v_u_26(p27, p28)
			v_u_8:Fire(p27, p28, v31)
			if v_u_6 then
				v_u_5.Update:FireClient(p27, p28, v31)
				local v32 = v_u_1:GetPlayerByUserId(p28)
				if v32 then
					v_u_5.Update:FireClient(v32, p27.UserId, v31)
				end
			end
		end
	end
end
local function v_u_40(p34, p35, p36)
	-- upvalues: (copy) v_u_11, (copy) v_u_1, (copy) v_u_33
	if p35 == p34.UserId then
		return
	else
		local v37 = v_u_11[p34.UserId]
		if not v37 then
			v37 = {}
			v_u_11[p34.UserId] = v37
		end
		if v37[p35] ~= p36 then
			v37[p35] = p36
			local v38 = v_u_1:GetPlayerByUserId(p35)
			if p36 and v38 then
				local v39 = v_u_11[v38.UserId]
				if not v39 then
					v39 = {}
					v_u_11[v38.UserId] = v39
				end
				if v39[p34.UserId] then
					v_u_33(p34, p35, true)
				end
			end
		end
	end
end
local function v_u_47(p41, p42)
	-- upvalues: (copy) v_u_7, (copy) v_u_9, (copy) v_u_1, (copy) v_u_16, (copy) v_u_33
	if v_u_7 then
		return
	else
		local v43 = v_u_9[p41]
		if not v43 then
			v43 = {}
			v_u_9[p41] = v43
		end
		local v44
		if v43 then
			v44 = v43[p42]
		else
			v44 = v43
		end
		while v43 and v43[p42] do
			task.wait()
		end
		if v44 then
			return
		elseif p41:IsDescendantOf(v_u_1) then
			v43[p42] = true
			local v45, v46 = pcall(v_u_16, p41, p42)
			if v45 then
				v_u_33(p41, p42, v46)
				v43[p42] = nil
			else
				warn((("FriendsAPI: Failed to request: %*"):format(v46)))
				v43[p42] = nil
			end
		else
			return
		end
	end
end
local function v_u_53(p48, p49, p50)
	-- upvalues: (copy) v_u_7, (copy) v_u_12, (copy) v_u_10, (copy) v_u_1, (copy) v_u_47, (copy) v_u_26
	local v51 = p50 ~= false
	if v_u_7 and p48 ~= v_u_12 then
		error("FriendsAPI:IsFriendsWithByUserId | this function can only be used with LocalPlayer in the Client")
	end
	local v52 = v_u_10[p48.UserId]
	if not v52 then
		v52 = {}
		v_u_10[p48.UserId] = v52
	end
	if v_u_7 then
		return v52[p49] == true
	end
	if v_u_1:GetPlayerByUserId(p49) then
		return v_u_26(p48, p49)
	end
	if v52[p49] == nil then
		if v51 then
			v_u_47(p48, p49)
		else
			task.spawn(v_u_47, p48, p49)
		end
	end
	return v52[p49] == true
end
local function v61()
	-- upvalues: (copy) v_u_1, (copy) v_u_47, (copy) v_u_5, (copy) v_u_40
	local function v56(p54)
		-- upvalues: (ref) v_u_1, (ref) v_u_47
		for _, v55 in v_u_1:GetPlayers() do
			if v55 ~= p54 then
				v_u_47(p54, v55.UserId)
			end
		end
	end
	v_u_1.PlayerAdded:Connect(v56)
	for _, v57 in v_u_1:GetPlayers() do
		task.spawn(v56, v57)
	end
	v_u_5.Update.OnServerEvent:Connect(function(p58, p59, p60)
		-- upvalues: (ref) v_u_40
		if typeof(p59) == "Instance" and (p59:IsA("Player") and p59 ~= p58) then
			if p60 == nil or type(p60) == "boolean" then
				v_u_40(p58, p59.UserId, p60)
			end
		else
			return
		end
	end)
end
local function v66()
	-- upvalues: (copy) v_u_5, (copy) v_u_33, (copy) v_u_12
	v_u_5.Update.OnClientEvent:Connect(function(p62, p63)
		-- upvalues: (ref) v_u_33, (ref) v_u_12
		v_u_33(v_u_12, p62, p63)
	end)
	local v_u_64 = game:GetService("StarterGui")
	for _ = 1, 5 do
		if pcall(function()
			-- upvalues: (copy) v_u_64, (ref) v_u_5
			v_u_64:GetCore("PlayerFriendedEvent").Event:Connect(function(p65)
				-- upvalues: (ref) v_u_5
				v_u_5.Update:FireServer(p65, true)
			end)
		end) then
			break
		end
		task.wait(5)
	end
end
local function v68()
	-- upvalues: (copy) v_u_1, (copy) v_u_9, (copy) v_u_10, (copy) v_u_11
	v_u_1.PlayerRemoving:Connect(function(p67)
		-- upvalues: (ref) v_u_9, (ref) v_u_10, (ref) v_u_11
		v_u_9[p67] = nil
		v_u_10[p67.UserId] = nil
		v_u_11[p67.UserId] = nil
	end)
end
function v13.OnFriendshipUpdate(_, p_u_69, p_u_70)
	-- upvalues: (copy) v_u_8
	return v_u_8:Connect(function(p71, p72, p73)
		-- upvalues: (copy) p_u_69, (copy) p_u_70
		if p71 == p_u_69 or p72 == p_u_69.UserId then
			if p_u_69.UserId == p72 then
				p_u_70(p_u_69.UserId, p73)
			else
				p_u_70(p72, p73)
			end
		else
			return
		end
	end)
end
function v13.IsFriendsWithImmediate(_, p74, p75)
	-- upvalues: (copy) v_u_53
	local v76 = v_u_53
	if typeof(p75) == "Instance" then
		p75 = p75.UserId
	end
	return v76(p74, p75, false)
end
function v13.IsFriendsWith(_, p77, p78)
	-- upvalues: (copy) v_u_53
	local v79 = v_u_53
	if typeof(p78) == "Instance" then
		p78 = p78.UserId
	end
	return v79(p77, p78, true)
end
if v_u_6 then
	task.spawn(v61)
else
	task.spawn(v66)
end
task.spawn(v68)
return v13