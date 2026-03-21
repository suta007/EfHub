local v1 = game:GetService("Players")
local v2 = game:GetService("ReplicatedStorage")
local v3 = require(v2.UserGenerated.ABTests.SharedABTests)
local v_u_4 = require(v2.UserGenerated.Collections.DeepFreezeUnsafe)
local v5 = require(v2.UserGenerated.Concurrency.Bindable)
local v_u_6 = v1.LocalPlayer
local v_u_7 = false
local v_u_8 = v5.new()
local function v9()
	-- upvalues: (ref) v_u_7
	return v_u_7
end
local v_u_10 = nil
local function v_u_16(p11, p12)
	-- upvalues: (copy) v_u_6, (ref) v_u_10
	local v13
	if typeof(p11) == "Instance" then
		v13 = p11:IsA("Player")
	else
		v13 = false
	end
	assert(v13)
	local v14 = type(p12) == "boolean"
	assert(v14)
	if p11 ~= v_u_6 then
		return nil
	end
	while true do
		local v15 = v_u_10
		if v15 then
			break
		end
		if not p12 then
			return nil
		end
		if not p11.Parent then
			return nil
		end
		task.wait()
	end
	return v15
end
local v_u_17 = nil
local function v20(p18)
	-- upvalues: (copy) v_u_6, (ref) v_u_17
	if p18 == v_u_6 then
		return v_u_17
	end
	local v19
	if typeof(p18) == "Instance" then
		v19 = p18:IsA("Player")
	else
		v19 = false
	end
	assert(v19)
	return nil
end
local function v_u_27(p21, p22, p23)
	-- upvalues: (copy) v_u_6, (ref) v_u_17
	local v24 = type(p22) == "string"
	assert(v24)
	local v25
	if p21 == v_u_6 then
		v25 = v_u_17
	else
		local v26
		if typeof(p21) == "Instance" then
			v26 = p21:IsA("Player")
		else
			v26 = false
		end
		assert(v26)
		v25 = nil
	end
	if v25 then
		v25 = v25[p22]
	end
	if v25 == nil then
		return p23, false
	else
		return v25, true
	end
end
local function v_u_32(p28, p29, p30)
	-- upvalues: (copy) v_u_16, (copy) v_u_27
	local v31 = type(p29) == "string"
	assert(v31)
	if v_u_16(p28, true) then
		return v_u_27(p28, p29, p30)
	else
		return p30, false
	end
end
local function v35()
	-- upvalues: (copy) v_u_6, (ref) v_u_17
	local v33 = v_u_6
	if v33 == v_u_6 then
		return v_u_17
	end
	local v34
	if typeof(v33) == "Instance" then
		v34 = v33:IsA("Player")
	else
		v34 = false
	end
	assert(v34)
	return nil
end
local function v36()
	-- upvalues: (ref) v_u_10
	return v_u_10
end
local v_u_37 = v5.new()
local v_u_38 = v5.new()
v3.UpdateRemote.OnClientEvent:Connect(function(p39, p40)
	-- upvalues: (copy) v_u_4, (ref) v_u_17, (ref) v_u_10, (ref) v_u_7, (copy) v_u_8, (copy) v_u_37, (copy) v_u_6, (copy) v_u_38
	v_u_4(p39)
	v_u_4(p40)
	v_u_17 = p39
	v_u_10 = p40
	v_u_7 = true
	v_u_8:Fire()
	v_u_37:Fire(v_u_6)
	v_u_38:Fire()
end)
return table.freeze({
	["GetAttributes"] = v20,
	["GetAttribute"] = v_u_27,
	["GetAttributeAsync"] = v_u_32,
	["GetAssignmentsAsync"] = v_u_16,
	["GetJobAttributes"] = v35,
	["GetJobAttribute"] = function(p41, p42)
		-- upvalues: (copy) v_u_27, (copy) v_u_6
		return v_u_27(v_u_6, p41, p42)
	end,
	["GetJobAttributeAsync"] = function(p43, p44)
		-- upvalues: (copy) v_u_32, (copy) v_u_6
		return v_u_32(v_u_6, p43, p44)
	end,
	["GetJobAssignments"] = v36,
	["GetJobAssignmentsAsync"] = function(p45)
		-- upvalues: (copy) v_u_16, (copy) v_u_6
		return v_u_16(v_u_6, p45)
	end,
	["IsLoaded"] = v9,
	["Loaded"] = v_u_8,
	["PlayerUpdated"] = v_u_37,
	["JobUpdated"] = v_u_38
})