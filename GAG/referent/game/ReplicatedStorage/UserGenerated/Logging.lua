local v1 = game:GetService("RunService")
local v2 = require(game.ReplicatedStorage.UserGenerated.Lang.Keys)
local v3 = require(game.ReplicatedStorage.UserGenerated.Lang.Asserts)
local v_u_4 = require(game.ReplicatedStorage.UserGenerated.Strings.Stringify)
local v_u_5 = {
	["Pretty"] = true,
	["IndentChar"] = " ",
	["IndentSize"] = 2
}
local function v_u_9(...)
	-- upvalues: (copy) v_u_4, (copy) v_u_5
	local v6 = table.pack(...)
	for v7 = 1, v6.n do
		local v8 = v6[v7]
		if type(v8) ~= "string" then
			if typeof(v8) == "Instance" then
				v8 = ("%*[%*]"):format(v8.ClassName, (v8:GetFullName()))
			else
				v8 = v_u_4.Serialize(v8, v_u_5)
			end
		end
		v6[v7] = v8
	end
	return table.unpack(v6)
end
local v10, v11
if v1:IsStudio() then
	v10 = print
	v11 = warn
else
	v10 = function(...)
		-- upvalues: (copy) v_u_9
		local v12 = task.spawn
		local function v14(p13, ...)
			-- upvalues: (ref) v_u_9
			print(p13, v_u_9(...))
		end
		local v15, v16, v17 = debug.info(2, "sln")
		local v18 = ("%*:%*"):format(v15, v16)
		if v17 then
			v18 = v18 .. (" %*"):format(v17)
		end
		v12(v14, ("[%*]"):format(v18), ...)
	end
	v11 = function(...)
		-- upvalues: (copy) v_u_9
		local v19 = task.spawn
		local function v21(p20, ...)
			-- upvalues: (ref) v_u_9
			warn(p20, v_u_9(...))
		end
		local v22, v23, v24 = debug.info(2, "sln")
		local v25 = ("%*:%*"):format(v22, v23)
		if v24 then
			v25 = v25 .. (" %*"):format(v24)
		end
		v19(v21, ("[%*]"):format(v25), ...)
	end
end
local function v_u_26() end
local v_u_27 = {
	["Trace"] = 1,
	["Debug"] = 2,
	["Info"] = 3,
	["Warn"] = 4,
	["Error"] = 5,
	["Critical"] = 6,
	["Off"] = 7
}
table.freeze(v_u_27)
local v_u_28 = {
	["Trace"] = v10,
	["Debug"] = v10,
	["Info"] = v10,
	["Warn"] = v11,
	["Error"] = v11,
	["Critical"] = v11,
	["Off"] = v_u_26
}
table.freeze(v_u_28)
local v29 = v3.Set(v2(v_u_27))
local v_u_30 = table.clone(v_u_28)
local v_u_31 = "Info"
local function v_u_40(p32, p33)
	-- upvalues: (copy) v_u_27, (ref) v_u_31, (copy) v_u_30, (copy) v_u_28, (copy) v_u_26
	local v34 = v_u_27[p32]
	assert(v34)
	local v35 = p33 == nil and true or type(p33) == "boolean"
	assert(v35)
	if v_u_31 ~= p32 or p33 then
		v_u_31 = p32
		local v36 = v_u_27[p32]
		local v37 = assert(v36)
		for v38, v39 in pairs(v_u_27) do
			if v37 <= v39 then
				v_u_30[v38] = v_u_28[v38]
			else
				v_u_30[v38] = v_u_26
			end
		end
	end
end
v_u_40(v_u_31, true)
local v41 = {
	["Levels"] = v_u_27,
	["AssertLevel"] = v29
}
setmetatable(v41, {
	["__index"] = v_u_30
})
function v41.GetLevel()
	-- upvalues: (ref) v_u_31
	return v_u_31
end
function v41.SetLevel(p42)
	-- upvalues: (copy) v_u_40
	v_u_40(p42)
end
function v41.Sink(p43)
	-- upvalues: (copy) v_u_30
	local v44 = v_u_30[p43]
	return assert(v44)
end
return table.freeze(v41)