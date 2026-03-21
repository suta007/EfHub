local v1 = game:GetService("ReplicatedStorage")
local v_u_2 = require(v1.UserGenerated.Lang.Asserts)
local v_u_3 = require(v1.UserGenerated.Randoms.ISAAC).Unique()
local v_u_4 = v_u_2.Table({
	["Weight"] = v_u_2.FinitePositive,
	["Value"] = v_u_2.Any
})
local v5 = v_u_2.Table({
	["Weight"] = v_u_2.FinitePositive,
	["Chance"] = v_u_2.Range(0, 1),
	["Value"] = v_u_2.Any
})
local v6 = {}
local function v_u_12(p7, p8)
	local v9 = #p7
	local v10 = 1
	while v10 < v9 do
		local v11 = v10 + (v9 - v10) // 2
		if p8 < p7[v11] then
			v9 = v11
		else
			v10 = v11 + 1
		end
	end
	return v10
end
function v6.Next(p13)
	-- upvalues: (copy) v_u_3, (copy) v_u_12
	local v14 = v_u_3:NextDouble()
	local v15 = v_u_12(p13.Uppers, p13.TotalWeight * v14)
	local v16 = p13.Entries[v15]
	return v16.Value, v16
end
function v6.Pick(p17, p18)
	-- upvalues: (copy) v_u_12
	local v19
	if p18 >= 0 then
		v19 = p18 <= 1
	else
		v19 = false
	end
	assert(v19)
	local v20 = v_u_12(p17.Uppers, p17.TotalWeight * p18)
	local v21 = p17.Entries[v20]
	return v21.Value, v21
end
local v_u_22 = table.freeze({
	["__index"] = table.freeze(v6)
})
local function v_u_25(p23, p24)
	if p23.Weight == p24.Weight then
		return p23.Index < p24.Index
	else
		return p23.Weight < p24.Weight
	end
end
local function v_u_44(p26)
	-- upvalues: (copy) v_u_2, (copy) v_u_4, (copy) v_u_25, (copy) v_u_22
	v_u_2.Array(v_u_4)(p26)
	local v27 = #p26
	local v28 = v27 > 0
	assert(v28)
	local v29 = {}
	for v30, v31 in ipairs(p26) do
		local v32 = {
			["Index"] = v30,
			["Weight"] = v31.Weight
		}
		table.insert(v29, v32)
	end
	table.sort(v29, v_u_25)
	local v33 = table.create(v27, 0)
	local v34 = 0
	local v35 = {}
	for v36, v37 in ipairs(v29) do
		local v38 = p26[v37.Index]
		local v39 = v38.Weight
		v34 = v34 + v39
		v33[v36] = v34
		local v40 = {
			["Weight"] = v39,
			["Chance"] = 0,
			["Value"] = v38.Value
		}
		table.insert(v35, v40)
	end
	table.freeze(v33)
	for _, v41 in ipairs(v35) do
		v41.Chance = v41.Weight / v34
		table.freeze(v41)
	end
	table.freeze(v35)
	local v42 = v_u_22
	local v43 = setmetatable({
		["TotalWeight"] = v34,
		["Entries"] = v35,
		["Uppers"] = v33
	}, v42)
	table.freeze(v43)
	return v43
end
local v_u_50 = table.freeze({
	["__index"] = table.freeze({
		["Add"] = function(p45, p46, p47)
			-- upvalues: (copy) v_u_2
			v_u_2.FinitePositive(p46)
			p45.AssertValue(p47)
			local v48 = p45.Entries
			table.insert(v48, {
				["Weight"] = p46,
				["Value"] = p47
			})
			return p45
		end,
		["Build"] = function(p49)
			-- upvalues: (copy) v_u_44
			return v_u_44(p49.Entries)
		end
	})
})
return table.freeze({
	["new"] = v_u_44,
	["IsA"] = function(p51)
		-- upvalues: (copy) v_u_22
		local v52
		if type(p51) == "table" then
			v52 = getmetatable(p51) == v_u_22
		else
			v52 = false
		end
		return v52
	end,
	["Assert"] = function(p53)
		-- upvalues: (copy) v_u_22
		if type(p53) ~= "table" then
			error("table", 2)
		end
		if getmetatable(p53) ~= v_u_22 then
			error("DropTable", 2)
		end
		return p53
	end,
	["AssertEntry"] = v5,
	["Builder"] = function(p54)
		-- upvalues: (copy) v_u_2, (copy) v_u_50
		v_u_2.Function(p54)
		local v55 = v_u_50
		local v56 = setmetatable({
			["AssertValue"] = p54,
			["Entries"] = {}
		}, v55)
		table.freeze(v56)
		return v56
	end,
	["IsABuilder"] = function(p57)
		-- upvalues: (copy) v_u_50
		local v58
		if type(p57) == "table" then
			v58 = getmetatable(p57) == v_u_50
		else
			v58 = false
		end
		return v58
	end,
	["AssertBuilder"] = function(p59)
		-- upvalues: (copy) v_u_50
		if type(p59) ~= "table" then
			error("table", 2)
		end
		if getmetatable(p59) ~= v_u_50 then
			error("table", 2)
		end
		return p59
	end,
	["AssertBuilderEntry"] = v_u_4
})