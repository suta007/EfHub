local v_u_32 = {
	["CopyTable"] = function(p1)
		-- upvalues: (copy) v_u_32
		local v2 = {}
		for v3, v5 in p1 do
			if typeof(v5) == "table" then
				local v5 = v_u_32.CopyTable(v5) or v5
			end
			v2[v3] = v5
		end
		return v2
	end,
	["Reconcile"] = function(p6, p7, p8)
		-- upvalues: (copy) v_u_32
		if p8 then
			p6 = v_u_32.CopyTable(p6) or p6
		end
		for v9, v11 in p7 do
			if not p6[v9] then
				if typeof(v11) == "table" then
					local v11 = v_u_32.CopyTable(v11) or v11
				end
				p6[v9] = v11
			end
		end
		return p6
	end,
	["CacheDirectory"] = function(p12, p13)
		-- upvalues: (copy) v_u_32
		local v14 = {}
		for _, v15 in p12:GetChildren() do
			local v16
			if v15:IsA("ModuleScript") then
				v16 = p13 and p13(v15) or require(v15)
			else
				v16 = nil
			end
			local v17 = v15.Name
			if not (v16 and v16) then
				if v15:IsA("Instance") or (v15:IsA("Model") or v15:IsA("Folder")) then
					v16 = v_u_32.CacheDirectory(v15, p13) or nil
				else
					v16 = nil
				end
			end
			v14[v17] = v16
		end
		return v14
	end,
	["DeepCopy"] = function(p18)
		-- upvalues: (copy) v_u_32
		if type(p18) ~= "table" then
			return p18
		end
		local v19 = {}
		for v20, v21 in next, p18 do
			v19[v_u_32.DeepCopy(v20)] = v_u_32.DeepCopy(v21)
		end
		local v22 = v_u_32.DeepCopy
		local v23 = getmetatable(p18)
		setmetatable(v19, v22(v23))
		return v19
	end,
	["DeepCopyRecursive"] = function(p24, p25)
		-- upvalues: (copy) v_u_32
		local v26 = p25 or {}
		if type(p24) ~= "table" then
			return p24
		end
		if v26[p24] then
			return v26[p24]
		end
		local v27 = {}
		v26[p24] = v27
		for v28, v29 in next, p24 do
			v27[v_u_32.DeepCopyRecursive(v28, v26)] = v_u_32.DeepCopyRecursive(v29, v26)
		end
		local v30 = v_u_32.DeepCopyRecursive
		local v31 = getmetatable(p24)
		setmetatable(v27, v30(v31, v26))
		return v27
	end
}
return v_u_32