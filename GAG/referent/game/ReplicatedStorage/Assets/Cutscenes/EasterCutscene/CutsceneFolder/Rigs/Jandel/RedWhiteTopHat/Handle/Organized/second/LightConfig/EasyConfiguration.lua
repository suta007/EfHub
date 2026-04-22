local v_u_1 = print(script.Parent:WaitForChild("Type"))
local v2 = {}
local function v_u_8(p3, p4)
	local v5 = type(p4) == "table"
	assert(v5, "Values is not a table")
	for v6, v7 in next, p4 do
		if type(v6) == "number" then
			v7.Parent = p3
		else
			p3[v6] = v7
		end
	end
	return p3
end
local v_u_9 = {
	["StringValue"] = true,
	["IntValue"] = true,
	["NumberValue"] = true,
	["BrickColorValue"] = true,
	["BoolValue"] = true,
	["Color3Value"] = true,
	["Vector3Value"] = true,
	["IntConstrainedValue"] = true
}
local function v11(p10)
	-- upvalues: (copy) v_u_9
	return v_u_9[p10]
end
v2.TypeIsAcceptable = v11
v2.typeIsAcceptable = v11
local function v14(p12, p13)
	-- upvalues: (copy) v_u_8
	return p13:FindFirstChild(p12) or v_u_8(Instance.new("Configuration"), {
		["Name"] = p12,
		["Parent"] = p13,
		["Archivable"] = true
	})
end
v2.AddSubDataLayer = v14
v2.addSubDataLayer = v14
local v_u_15 = {}
setmetatable(v_u_15, {
	["__mode"] = "k"
})
local function v34(p_u_16)
	-- upvalues: (copy) v_u_15, (copy) v_u_8, (copy) v_u_9, (copy) v_u_1
	if v_u_15[p_u_16] then
		return v_u_15[p_u_16]
	end
	local v17 = {}
	local function v_u_19(p18)
		-- upvalues: (copy) p_u_16
		return p_u_16:FindFirstChild(p18)
	end
	local v33 = {
		["__index"] = function(_, p20)
			-- upvalues: (copy) p_u_16, (ref) v_u_8, (copy) v_u_19, (ref) v_u_9, (ref) v_u_1
			if not type(p20) == "string" then
				error("Only Indexing with strings is supported with easyConfiguration", 2)
			end
			local v21 = p20:lower()
			if v21 == "add" or v21 == "addvalue" then
				return function(p22, p23)
					-- upvalues: (ref) p_u_16, (ref) v_u_8
					local v24 = nil
					if p23 and p23.Name then
						local v25 = p23.Name
						if type(v25) == "string" then
							v24 = p_u_16:FindFirstChild(p23.Name)
							if v24 and v24.ClassName ~= p22 then
								print("[EasyConfiguration] - Invalid class \'" .. v24.ClassName .. "\' in configuration, being replaced by new data \'" .. p22 .. "\'")
								v24:Destroy()
								v24 = nil
							end
							::l6::
							if not v24 then
								local v26 = Instance.new(p22)
								v_u_8(v26, p23)
								v26.Parent = p_u_16
							end
							return
						end
					end
					error("[EasyConfiguration] - No values received in the add method of easy configuration. Please give a table of default properties including the name. ", 2)
					goto l6
				end
			end
			if v21 == "get" or v21 == "getvalue" then
				return function(p27)
					-- upvalues: (ref) v_u_19
					return v_u_19(p27)
				end
			end
			if v21 == "getcontainer" then
				return function(p28)
					-- upvalues: (ref) v_u_19
					return v_u_19(p28)
				end
			end
			local v29 = p_u_16:FindFirstChild(p20)
			if v29 and v_u_9[v29.ClassName] then
				return v29.Value
			end
			error("[EasyConfiguration] - " .. (v29 and "Object \'" .. p20 .. "\' was a " .. v_u_1.getType(v29) .. " value, and not acceptable, so no return was given" or "Could not find Object \'" .. p20 .. "\' in the configuration"), 2)
		end,
		["__newindex"] = function(_, p30, p31)
			-- upvalues: (copy) p_u_16, (ref) v_u_9
			if type(p30) == "string" then
				local v32 = p_u_16:FindFirstChild(p30)
				if v32 and v_u_9[v32.ClassName] then
					v32.Value = p31
				else
					error("[EasyConfiguration] - Value \'" .. p30 .. "\' was not accepted, or wasn\'t in the configuration", 2)
				end
			else
				error("[EasyConfiguration] - Index with a string")
				return
			end
		end
	}
	setmetatable(v17, v33)
	v_u_15[p_u_16] = v17
	return v17
end
v2.Make = v34
v2.MakeEasyConfiguration = v34
return v2