local v_u_18 = {
	["DeepCopy"] = function(_, p1)
		-- upvalues: (copy) v_u_18
		local v2 = table.clone(p1)
		for v3, v4 in v2 do
			if type(v4) == "table" then
				v2[v3] = v_u_18:DeepCopy(v4)
			end
		end
		return v2
	end,
	["MakeTable"] = function(_, ...)
		local v_u_5 = {}
		local function v_u_9(p6)
			-- upvalues: (copy) v_u_9, (copy) v_u_5
			if typeof(p6) == "table" then
				for _, v7 in p6 do
					v_u_9(v7)
				end
			else
				local v8 = v_u_5
				table.insert(v8, p6)
			end
		end
		for _, v10 in { ... } do
			if typeof(v10) == "table" then
				for _, v11 in v10 do
					v_u_9(v11)
				end
			else
				table.insert(v_u_5, v10)
			end
		end
		return v_u_5
	end,
	["SetSubtract"] = function(_, p12, p13)
		local v14 = {}
		local v15 = {}
		for _, v16 in ipairs(p13) do
			v14[v16] = true
		end
		for _, v17 in ipairs(p12) do
			if not v14[v17] then
				table.insert(v15, v17)
			end
		end
		return v15
	end
}
return v_u_18