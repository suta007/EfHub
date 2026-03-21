local v1 = game:GetService("ReplicatedStorage")
local v2 = game:GetService("RunService")
game:GetService("Players")
assert(v2:IsClient())
local v_u_3 = require(v1.UserGenerated.Concurrency.Bindable)
local v4 = require(v1.UserGenerated.FastFlags.SharedFastFlags)
local v_u_5 = require(v1.UserGenerated.Lang.Asserts)
local v_u_6 = require(v1.UserGenerated.Collections.DeepEqualsPureUnsafe)
local v_u_7 = require(v1.UserGenerated.Collections.DeepCopyPureUnsafe)
local v_u_8 = require(v1.UserGenerated.Collections.DeepFreezeUnsafe)
local v_u_9 = require(v1.UserGenerated.Strings.ObjectPaths)
local v10 = {}
local v_u_11 = table.freeze({
	["__index"] = v10
})
function v10.Get(p12)
	return p12.Value
end
function v10.GetAsync(p13)
	if p13.ValueLoaded then
		return p13.Value
	end
	local v_u_14 = coroutine.running()
	local v15 = p13.Loaded:Connect(function()
		-- upvalues: (copy) v_u_14
		task.spawn(v_u_14)
	end)
	coroutine.yield()
	v15:Disconnect()
	return p13.Value
end
function v10.IsLoaded(p16)
	return p16.ValueLoaded
end
table.freeze(v10)
local v_u_17 = v4.NullValue
local v18 = v4.UpdateRemote
local v_u_19 = {}
local v_u_20 = false
local v_u_21 = {}
local v_u_22 = v_u_3.new()
local function v34(p23, p24)
	-- upvalues: (copy) v_u_8, (ref) v_u_21, (copy) v_u_19, (copy) v_u_17, (copy) v_u_6, (ref) v_u_20, (copy) v_u_22
	v_u_8(p23)
	v_u_21 = p23
	local v25 = {}
	local v26 = {}
	for v27, v30 in pairs(p23) do
		local v29 = v_u_19[v27]
		if v29 then
			if v30 == v_u_17 then
				local v30 = nil
			end
			local v31 = v29.Value
			if not v_u_6(v30, v31) then
				v29.Value = v30
				table.insert(v26, {
					["instance"] = v29,
					["value"] = v30,
					["prevValue"] = v31
				})
			end
			if p24 and not v29.ValueLoaded then
				v29.ValueLoaded = true
				table.insert(v25, v29)
			end
		end
	end
	if p24 then
		p24 = not v_u_20
	end
	if p24 then
		v_u_20 = true
	end
	for _, v32 in ipairs(v25) do
		v32.Loaded:Fire()
	end
	if p24 then
		v_u_22:Fire()
	end
	for _, v33 in ipairs(v26) do
		v33.instance.Changed:Fire(v33.value, v33.prevValue)
	end
end
local function v_u_47(p35, p36, p37)
	-- upvalues: (copy) v_u_5, (copy) v_u_7, (copy) v_u_8, (copy) v_u_19, (copy) v_u_9, (ref) v_u_21, (copy) v_u_17, (ref) v_u_20, (copy) v_u_3, (copy) v_u_11
	v_u_5.String(p35)
	v_u_5.Function(p36)
	p36(p37)
	v_u_5.Storable(p37)
	local v38 = v_u_7(p37)
	v_u_8(v38)
	local v39 = not v_u_19[p35]
	local v40 = ("ConflictingKeys: %*, %*"):format(p35, p35)
	assert(v39, v40)
	for v41, _ in pairs(v_u_19) do
		if v_u_9.HasHierarchicalOverlap(p35, v41) then
			error((("ConflictingKeys: %*, %*"):format(p35, v41)))
		end
	end
	local v42 = v_u_21[p35]
	local v43
	if v42 == nil then
		v42 = v38
		v43 = false
	else
		if v42 == v_u_17 then
			v42 = nil
		end
		v43 = v_u_20
	end
	local v44 = {
		["Changed"] = v_u_3.new(),
		["Loaded"] = v_u_3.new(),
		["Replicated"] = true,
		["Key"] = p35,
		["DefaultValue"] = v38,
		["Assertion"] = p36,
		["ValueLoaded"] = v43,
		["Value"] = v42
	}
	local v45 = v_u_11
	local v46 = setmetatable(v44, v45)
	v_u_19[p35] = v46
	return v46
end
local v57 = {
	["Loaded"] = v_u_22,
	["IsA"] = function(p48)
		-- upvalues: (copy) v_u_11
		local v49
		if type(p48) == "table" then
			v49 = getmetatable(p48) == v_u_11
		else
			v49 = false
		end
		return v49
	end,
	["Assert"] = function(p50)
		-- upvalues: (copy) v_u_11
		local v51
		if type(p50) == "table" then
			v51 = getmetatable(p50) == v_u_11
		else
			v51 = false
		end
		if not v51 then
			error("FastFlag", 2)
		end
		return p50
	end,
	["Replicated"] = function(p52, p53, p54)
		-- upvalues: (copy) v_u_47
		return v_u_47(p52, p53, p54)
	end,
	["Private"] = function(_, _, _)
		error("ServerOnly")
	end,
	["Get"] = function(p55)
		-- upvalues: (copy) v_u_19, (copy) v_u_5
		local v56 = v_u_19[p55]
		if v56 then
			return v56
		end
		v_u_5.String(p55)
		error((("UnknownKey: \'%*\'"):format(p55)))
	end,
	["IsLoaded"] = function()
		-- upvalues: (ref) v_u_20
		return v_u_20
	end
}
v18.OnClientEvent:Connect(v34)
table.freeze(v57)
return v57