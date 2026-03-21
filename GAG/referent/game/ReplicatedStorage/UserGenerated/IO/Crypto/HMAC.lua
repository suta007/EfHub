require(game.ReplicatedStorage.UserGenerated.IO.Crypto.Hash)
local function v_u_18(p_u_1, p2)
	local v_u_3 = p_u_1.BlockSize
	if v_u_3 < buffer.len(p2) then
		p2 = p_u_1.DigestBuffer(p2)
	end
	local v4 = buffer.create(v_u_3)
	buffer.copy(v4, 0, p2)
	local v_u_5 = buffer.create(v_u_3)
	local v_u_6 = buffer.create(v_u_3)
	for v7 = 0, v_u_3 - 1 do
		local v8 = buffer.readu8(v4, v7)
		local v9 = bit32.bxor(v8, 92)
		buffer.writeu8(v_u_5, v7, v9)
		local v10 = bit32.bxor(v8, 54)
		buffer.writeu8(v_u_6, v7, v10)
	end
	local function v_u_15(p11)
		-- upvalues: (copy) v_u_3, (copy) v_u_6, (copy) p_u_1, (copy) v_u_5
		local v12 = buffer.create(v_u_3 + buffer.len(p11))
		buffer.copy(v12, 0, v_u_6)
		buffer.copy(v12, v_u_3, p11)
		local v13 = p_u_1.DigestBuffer(v12)
		local v14 = buffer.create(v_u_3 + buffer.len(v13))
		buffer.copy(v14, 0, v_u_5)
		buffer.copy(v14, v_u_3, v13)
		return p_u_1.DigestBuffer(v14)
	end
	return {
		["Name"] = "HMAC-" .. p_u_1.Name,
		["BlockSize"] = p_u_1.BlockSize,
		["OutputSize"] = p_u_1.OutputSize,
		["Digest"] = function(p16)
			-- upvalues: (copy) v_u_15
			return buffer.tostring(v_u_15(buffer.fromstring(p16)))
		end,
		["DigestBuffer"] = v_u_15,
		["DigestToBuffer"] = function(p17)
			-- upvalues: (copy) v_u_15
			return v_u_15(buffer.fromstring(p17))
		end
	}
end
return {
	["Derive"] = v_u_18,
	["DeriveString"] = function(p19, p20)
		-- upvalues: (copy) v_u_18
		return v_u_18(p19, buffer.fromstring(p20))
	end
}