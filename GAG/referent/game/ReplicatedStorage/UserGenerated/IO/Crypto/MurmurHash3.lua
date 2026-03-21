local v_u_1 = bit32.band
local v_u_2 = bit32.lshift
local v_u_3 = bit32.rshift
local v_u_4 = bit32.lrotate
local v_u_5 = bit32.bxor
local v_u_6 = bit32.bor
local v_u_7 = buffer.len
local v_u_8 = buffer.readu32
local v_u_9 = buffer.readu8
local v_u_10 = buffer.readu16
local v_u_11 = buffer.fromstring
function mul32(p12, p13)
	-- upvalues: (copy) v_u_1, (copy) v_u_3, (copy) v_u_2
	return v_u_1(p12, 65535) * p13 + v_u_2(v_u_1(v_u_3(p12, 16) * p13, 65535), 16)
end
function DigestBufferUnsafe(p14, p15, p16, p17)
	-- upvalues: (copy) v_u_6, (copy) v_u_8, (copy) v_u_4, (copy) v_u_5, (copy) v_u_2, (copy) v_u_1, (copy) v_u_9, (copy) v_u_10, (copy) v_u_3
	if p17 == nil then
		p17 = 0
	else
		local v18 = v_u_6(p17, 0) == p17
		assert(v18)
	end
	local v19 = p15 + p16 - 3
	while p15 < v19 do
		local v20 = v_u_8(p14, p15)
		local v21 = v_u_4(mul32(v20, 3432918353), 15)
		p17 = v_u_2(v_u_4(v_u_5(p17, (mul32(v21, 461845907))), 13) * 5, 0) + 3864292196
		p15 = p15 + 4
	end
	local v22 = v_u_1(p16, 3)
	if v22 > 0 then
		local v23
		if v22 == 3 then
			v23 = v_u_9(p14, p15) + v_u_2(v_u_10(p14, p15 + 1), 8)
		elseif v22 == 2 then
			v23 = v_u_10(p14, p15)
		else
			v23 = v_u_9(p14, p15)
		end
		local v24 = v_u_4(mul32(v23, 3432918353), 15)
		p17 = v_u_5(p17, (mul32(v24, 461845907)))
	end
	local v25 = v_u_5(p17, p16)
	local v26 = v_u_5(v25, (v_u_3(v25, 16)))
	local v27 = mul32(v26, 2246822507)
	local v28 = v_u_5(v27, (v_u_3(v27, 13)))
	local v29 = mul32(v28, 3266489909)
	return v_u_5(v29, (v_u_3(v29, 16)))
end
function DigestBufferCustom(p30, p31, p32, p33)
	-- upvalues: (copy) v_u_7
	local v34 = type(p30) == "buffer"
	assert(v34)
	local v35
	if type(p31) == "number" and p31 >= 0 then
		v35 = p31 <= v_u_7(p30)
	else
		v35 = false
	end
	assert(v35)
	local v36
	if type(p32) == "number" and p32 >= 0 then
		v36 = p32 <= v_u_7(p30) - p31
	else
		v36 = false
	end
	assert(v36)
	return DigestBufferUnsafe(p30, p31, p32, p33)
end
function DigestBuffer(p37, p38)
	-- upvalues: (copy) v_u_7
	return DigestBufferUnsafe(p37, 0, v_u_7(p37), p38)
end
function Digest(p39, p40)
	-- upvalues: (copy) v_u_11, (copy) v_u_7
	local v41 = v_u_11(p39)
	return DigestBufferUnsafe(v41, 0, v_u_7(v41), p40)
end
local v42 = {
	["DigestBufferCustom"] = DigestBufferCustom,
	["DigestBuffer"] = DigestBuffer,
	["Digest"] = Digest
}
table.freeze(v42)
return v42