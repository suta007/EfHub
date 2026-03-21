local v1 = game:GetService("ReplicatedStorage")
local v_u_2 = require(v1.Item_Module)
local v_u_3 = require(v1.Modules.MutationHandler)
local v_u_4 = require(v1.Data.EnumRegistry.InventoryServiceEnums)
local v_u_5 = {
	{
		["X"] = 0,
		["Y"] = 0
	},
	{
		["X"] = 1000000000000,
		["Y"] = 1000000000000
	},
	{
		["X"] = 20000000000000,
		["Y"] = 12000000000000
	},
	{
		["X"] = 50000000000000,
		["Y"] = 28000000000000
	},
	{
		["X"] = 100000000000000,
		["Y"] = 50000000000000
	},
	{
		["X"] = 750000000000000,
		["Y"] = 310000000000000
	}
}
local v_u_6 = {
	0,
	1000000000000,
	10000000000000,
	25000000000000,
	40000000000000,
	280000000000000
}
local v_u_7 = DateTime.fromUniversalTime(2025, 10, 11, 14).UnixTimestamp // 86400
local v_u_8 = DateTime.fromUniversalTime(2025, 10, 18, 14).UnixTimestamp // 86400
local v_u_9 = v_u_8 - v_u_7
local function v_u_20()
	-- upvalues: (copy) v_u_7, (copy) v_u_8, (copy) v_u_9, (copy) v_u_5, (copy) v_u_6
	local v10 = workspace:GetServerTimeNow() // 86400
	local v11 = v_u_7
	local v12 = v_u_8
	local v13 = (math.clamp(v10, v11, v12) - v_u_7) / v_u_9
	local v14 = math.clamp(v13, 0, 1)
	local v15 = table.clone(v_u_5)
	for v16 = 1, #v15 do
		local v17 = {
			["X"] = v15[v16].X
		}
		local v18 = v15[v16].Y
		local v19 = v_u_6[v16]
		v17.Y = math.lerp(v18, v19, v14) // 1
		v15[v16] = v17
	end
	return v15
end
local function v_u_28(p21)
	-- upvalues: (copy) v_u_20
	local v22 = v_u_20()
	for v23 = 2, #v22 do
		local v24 = v22[v23 - 1]
		local v25 = v22[v23]
		if v24.X <= p21 and p21 <= v25.X then
			return (v25.Y - v24.Y) / (v25.X - v24.X) * (p21 - v24.X) + v24.Y
		end
	end
	local v26 = v22[#v22 - 1]
	local v27 = v22[#v22]
	return (v27.Y - v26.Y) / (v27.X - v26.X) * (p21 - v26.X) + v26.Y
end
local function v_u_43(p29, p30, p31, p32, p33)
	-- upvalues: (copy) v_u_2, (copy) v_u_28
	local v34 = v_u_2.Return_Data(p29)
	if not v34 or #v34 < 3 then
		warn("CalculatePlantValueFromData | ItemData is invalid for plant:", p29)
		return 0
	end
	local v35 = v34[3]
	local v36 = v34[2]
	local v37 = v_u_2.Return_Variant_Multiplier(p30)
	local v38 = v35 * p32 * v37
	local v39 = p31 / v36
	local v40 = math.clamp(v39, 0.95, 100000000)
	local v41 = v38 * (v40 * v40)
	if (p33 or 0) >= 1 then
		local v42 = v_u_28(v41)
		v41 = math.max(v42, 0)
	end
	return math.round(v41)
end
local function v_u_51(p44)
	-- upvalues: (copy) v_u_3, (copy) v_u_4, (copy) v_u_43
	local v45 = p44:FindFirstChild("Item_String")
	local v46 = v45 and v45.Value or p44.Name
	local v47 = p44:FindFirstChild("Variant")
	if not v47 then
		return 0
	end
	local v48 = p44:FindFirstChild("Weight")
	if not v48 then
		return 0
	end
	local v49 = v_u_3:CalcValueMulti(p44)
	local v50 = p44:GetAttribute("FruitVersion") or (p44:GetAttribute(v_u_4.FruitVersion) or 0)
	return v_u_43(v46, v47.Value, v48.Value, v49, v50)
end
return function(p52)
	-- upvalues: (copy) v_u_51, (copy) v_u_43
	if not p52 then
		warn("No plant or Values given!")
		return 0
	end
	if typeof(p52) == "Instance" then
		return v_u_51(p52)
	end
	if typeof(p52) == "table" then
		return v_u_43(p52.name, p52.variant, p52.weight, p52.mutationMultiplier, p52.fruitVersion)
	end
	warn((("CalculatePlantValue | Invalid plant/value type: %*"):format((typeof(p52)))))
	return 0
end