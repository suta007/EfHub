local function v_u_33(p1, p2, p3)
	local v4 = bit32.bor(p1, 0)
	local v5 = bit32.bor(p2, 0)
	local v6 = bit32.bor(p3, 0)
	local v7 = v4 - v5 - v6
	local v8 = bit32.rshift(v6, 13)
	local v9 = bit32.bxor(v7, v8)
	local v10 = v5 - v6 - v9
	local v11 = bit32.lshift(v9, 8)
	local v12 = bit32.bxor(v10, v11)
	local v13 = v6 - v9 - v12
	local v14 = bit32.rshift(v12, 13)
	local v15 = bit32.bxor(v13, v14)
	local v16 = v9 - v12 - v15
	local v17 = bit32.rshift(v15, 12)
	local v18 = bit32.bxor(v16, v17)
	local v19 = v12 - v15 - v18
	local v20 = bit32.lshift(v18, 16)
	local v21 = bit32.bxor(v19, v20)
	local v22 = v15 - v18 - v21
	local v23 = bit32.rshift(v21, 5)
	local v24 = bit32.bxor(v22, v23)
	local v25 = v18 - v21 - v24
	local v26 = bit32.rshift(v24, 3)
	local v27 = bit32.bxor(v25, v26)
	local v28 = v21 - v24 - v27
	local v29 = bit32.lshift(v27, 10)
	local v30 = bit32.bxor(v28, v29)
	local v31 = v24 - v27 - v30
	local v32 = bit32.rshift(v30, 15)
	return bit32.bxor(v31, v32)
end
local function v_u_42(p34)
	local v35 = string.sub(p34, 1, 8)
	local v36 = tonumber(v35, 16)
	local v37 = string.sub(p34, 10, 13) .. string.sub(p34, 15, 18)
	local v38 = tonumber(v37, 16)
	local v39 = string.sub(p34, 20, 23) .. string.sub(p34, 25, 28)
	local v40 = tonumber(v39, 16)
	local v41 = string.sub(p34, 29, 36)
	return v36, v38, v40, tonumber(v41, 16)
end
return table.freeze({
	["Mix"] = v_u_33,
	["DoubleFromInt64"] = function(p43, p44)
		-- upvalues: (copy) v_u_33
		local v45, v46
		if p43 < 0 then
			local v47 = -1 - p43
			local v48 = v47 // 4294967296
			v45 = bit32.bnot(v48)
			v46 = bit32.bnot(v47)
		else
			local v49 = p43 // 4294967296
			v45 = bit32.bor(v49, 0)
			v46 = bit32.bor(p43, 0)
		end
		return v_u_33(v46, v45, p44) / 4294967296
	end,
	["DoubleFromUUID"] = function(p50, p51)
		-- upvalues: (copy) v_u_42, (copy) v_u_33
		local v52, v53, v54, v55 = v_u_42(p50)
		return v_u_33(v_u_33(v52, v53, 2197175160), v_u_33(v54, v55, 2821953579), p51) / 4294967296
	end,
	["IntegerFromUUID"] = function(p56, p57, p58, p59)
		-- upvalues: (copy) v_u_42, (copy) v_u_33
		local v60 = p59 - p58 + 1
		local v61, v62, v63, v64 = v_u_42(p56)
		local v65 = p58 + v60 * (v_u_33(v_u_33(v61, v62, 2197175160), v_u_33(v63, v64, 2821953579), p57) / 4294967296)
		return math.floor(v65)
	end
})