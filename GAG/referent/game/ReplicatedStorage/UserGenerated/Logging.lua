local v1 = game:GetService("RunService")
local v2 = require(game.ReplicatedStorage.UserGenerated.Lang.Keys)
local v3 = require(game.ReplicatedStorage.UserGenerated.Lang.Asserts)
local v_u_4 = require(game.ReplicatedStorage.UserGenerated.Strings.Stringify)
local v_u_5 = {
	["Pretty"] = true,
	["IndentChar"] = " ",
	["IndentSize"] = 2
}
local function v_u_11(p6, ...)
	local v7, v8, v9 = debug.info((p6 or 0) + 2, "sln")
	local v10 = ("%*:%*"):format(v7, v8)
	if v9 then
		v10 = v10 .. (" %*"):format(v9)
	end
	return ("[%*]"):format(v10), ...
end
local function v_u_15(...)
	-- upvalues: (copy) v_u_4, (copy) v_u_5
	local v12 = table.pack(...)
	for v13 = 1, v12.n do
		local v14 = v12[v13]
		if type(v14) ~= "string" then
			if typeof(v14) == "Instance" then
				v14 = ("%*[%*]"):format(v14.ClassName, (v14:GetFullName()))
			else
				v14 = v_u_4.Serialize(v14, v_u_5)
			end
		end
		v12[v13] = v14
	end
	return table.unpack(v12)
end
local v16, v17
if v1:IsStudio() then
	v16 = print
	v17 = warn
else
	v16 = function(...)
		-- upvalues: (copy) v_u_11, (copy) v_u_15
		task.spawn(function(...)
			-- upvalues: (ref) v_u_11, (ref) v_u_15
			print(v_u_11(1, v_u_15(...)))
		end, ...)
	end
	v17 = function(...)
		-- upvalues: (copy) v_u_11, (copy) v_u_15
		task.spawn(function(...)
			-- upvalues: (ref) v_u_11, (ref) v_u_15
			warn(v_u_11(1, v_u_15(...)))
		end, ...)
	end
end
local function v_u_18() end
local v_u_19 = {
	["Trace"] = 1,
	["Debug"] = 2,
	["Info"] = 3,
	["Warn"] = 4,
	["Error"] = 5,
	["Critical"] = 6,
	["Off"] = 7
}
table.freeze(v_u_19)
local v_u_20 = {
	["Trace"] = v16,
	["Debug"] = v16,
	["Info"] = v16,
	["Warn"] = v17,
	["Error"] = v17,
	["Critical"] = v17,
	["Off"] = v_u_18
}
table.freeze(v_u_20)
local v21 = v3.Set(v2(v_u_19))
local v_u_22 = table.clone(v_u_20)
local v_u_23 = "Info"
local function v_u_32(p24, p25)
	-- upvalues: (copy) v_u_19, (ref) v_u_23, (copy) v_u_22, (copy) v_u_20, (copy) v_u_18
	local v26 = v_u_19[p24]
	assert(v26)
	local v27 = p25 == nil and true or type(p25) == "boolean"
	assert(v27)
	if v_u_23 ~= p24 or p25 then
		v_u_23 = p24
		local v28 = v_u_19[p24]
		local v29 = assert(v28)
		for v30, v31 in pairs(v_u_19) do
			if v29 <= v31 then
				v_u_22[v30] = v_u_20[v30]
			else
				v_u_22[v30] = v_u_18
			end
		end
	end
end
v_u_32(v_u_23, true)
local v33 = {
	["Levels"] = v_u_19,
	["AssertLevel"] = v21
}
setmetatable(v33, {
	["__index"] = v_u_22
})
function v33.GetLevel()
	-- upvalues: (ref) v_u_23
	return v_u_23
end
function v33.SetLevel(p34)
	-- upvalues: (copy) v_u_32
	v_u_32(p34)
end
function v33.Sink(p35)
	-- upvalues: (copy) v_u_22
	local v36 = v_u_22[p35]
	return assert(v36)
end
return table.freeze(v33)