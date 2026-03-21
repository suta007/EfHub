local v_u_1 = {}
for v4 = 0, 255 do
	local v3 = v4
	for _ = 1, 8 do
		local v4
		if bit32.band(v4, 1) == 0 then
			v4 = bit32.rshift(v4, 1)
		else
			local v5 = bit32.rshift(v4, 1)
			v4 = bit32.bxor(v5, 3988292384)
		end
	end
	v_u_1[v3 + 1] = v4
end
local v_u_39 = {
	["Init"] = function()
		return 4294967295
	end,
	["Update"] = function(p6, p7, p8, p9)
		-- upvalues: (copy) v_u_1
		local v10 = p8 or 1
		for v11 = v10, v10 + (p9 or string.len(p7)) - 1 do
			local v12 = string.byte(p7, v11)
			local v13 = bit32.rshift(p6, 8)
			local v14 = v_u_1
			local v15 = bit32.bxor(p6, v12)
			local v16 = v14[bit32.band(v15, 255) + 1]
			p6 = bit32.bxor(v13, v16)
		end
		return p6
	end,
	["UpdateBuffer"] = function(p17, p18, p19, p20)
		-- upvalues: (copy) v_u_1
		local v21 = p19 or 0
		for v22 = v21, v21 + (p20 or buffer.len(p18)) - 1 do
			local v23 = buffer.readu8(p18, v22)
			local v24 = bit32.rshift(p17, 8)
			local v25 = v_u_1
			local v26 = bit32.bxor(p17, v23)
			local v27 = v25[bit32.band(v26, 255) + 1]
			p17 = bit32.bxor(v24, v27)
		end
		return p17
	end,
	["Finish"] = function(p28)
		return bit32.bnot(p28)
	end,
	["Digest"] = function(p29, p30, p31)
		-- upvalues: (copy) v_u_39
		local v32 = v_u_39.Init()
		local v33 = v_u_39.Update(v32, p29, p30, p31)
		return v_u_39.Finish(v33)
	end,
	["DigestBuffer"] = function(p34, p35, p36)
		-- upvalues: (copy) v_u_39
		local v37 = v_u_39.Init()
		local v38 = v_u_39.UpdateBuffer(v37, p34, p35, p36)
		return v_u_39.Finish(v38)
	end
}
return table.freeze(v_u_39)