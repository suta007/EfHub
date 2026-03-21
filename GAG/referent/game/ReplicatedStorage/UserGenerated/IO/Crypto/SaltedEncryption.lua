local v_u_1 = require(game.ReplicatedStorage.UserGenerated.IO.Crypto.AES)
local v_u_2 = require(game.ReplicatedStorage.UserGenerated.IO.Base64)
local v_u_3 = require(game.ReplicatedStorage.UserGenerated.IO.Crypto.HMAC)
local v4 = require(game.ReplicatedStorage.UserGenerated.Randoms.ISAAC)
local v_u_5 = require(game.ReplicatedStorage.UserGenerated.IO.Crypto.SHA256)
require(game.ReplicatedStorage.UserGenerated.IO.Crypto.Hash)
local v_u_6 = v4.Unique()
local function v_u_11(p7)
	-- upvalues: (copy) v_u_6
	local v8 = buffer.create(p7)
	for v9 = 0, p7 - 1 do
		local v10 = v_u_6:NextInteger(0, 255)
		buffer.writeu8(v8, v9, v10)
	end
	return v8
end
local function v_u_35(p12, p13, p14, p15, p16)
	-- upvalues: (copy) v_u_3
	local v17 = v_u_3.Derive(p16, p12)
	local v18 = p16.OutputSize
	local v19 = p14 / v18
	local v20 = math.ceil(v19)
	local v21 = buffer.create(p14)
	local v22 = 0
	for v23 = 1, v20 do
		local v24 = buffer.create(buffer.len(p13) + 4)
		buffer.copy(v24, 0, p13)
		local v25 = buffer.len(p13)
		local v26 = bit32.byteswap(v23)
		buffer.writeu32(v24, v25, v26)
		local v27 = v17.DigestBuffer(v24)
		local v28 = buffer.create(buffer.len(v27))
		buffer.copy(v28, 0, v27)
		for _ = 2, p15 do
			v27 = v17.DigestBuffer(v27)
			for v29 = 0, buffer.len(v27) - 1 do
				local v30 = buffer.readu8(v28, v29)
				local v31 = buffer.readu8(v27, v29)
				local v32 = bit32.bxor(v30, v31)
				buffer.writeu8(v28, v29, v32)
			end
		end
		local v33 = p14 - v22
		local v34 = math.min(v18, v33)
		buffer.copy(v21, v22, v28, 0, v34)
		v22 = v22 + v34
	end
	return v21
end
local function v_u_42(p36)
	local v37 = buffer.len(p36)
	local v38 = 16 - v37 % 16
	local v39 = v37 + v38
	local v40 = buffer.create(v39)
	buffer.copy(v40, 0, p36)
	for v41 = v37, v39 - 1 do
		buffer.writeu8(v40, v41, v38)
	end
	return v40
end
local function v_u_50(p43)
	local v44 = buffer.len(p43)
	if v44 == 0 then
		error("Invalid padding: empty input")
	end
	local v45 = v44 - 1
	local v46 = buffer.readu8(p43, v45)
	if v46 < 1 or v46 > 16 then
		error("Invalid padding length: " .. v46)
	end
	for v47 = v44 - v46, v44 - 1 do
		if buffer.readu8(p43, v47) ~= v46 then
			error("Invalid padding")
		end
	end
	local v48 = v44 - v46
	local v49 = buffer.create(v48)
	buffer.copy(v49, 0, p43, 0, v48)
	return v49
end
local function v_u_64(p51, p52, p53)
	-- upvalues: (copy) v_u_5, (copy) v_u_11, (copy) v_u_35, (copy) v_u_42, (copy) v_u_1, (copy) v_u_2
	local v54 = p53 or v_u_5
	local v55 = buffer.fromstring(p51)
	local v56 = v_u_11(8)
	local v57 = v_u_35(p52, v56, 48, 10000, v54)
	local v58 = buffer.create(32)
	buffer.copy(v58, 0, v57, 0, 32)
	local v59 = buffer.create(16)
	buffer.copy(v59, 0, v57, 32, 16)
	local v60 = v_u_42(v55)
	local v61 = v_u_1.new(buffer.tostring(v58), v_u_1.modes.CBC, v_u_1.pads.None):Encrypt(v60, nil, v59)
	local v62 = 16 + buffer.len(v61)
	local v63 = buffer.create(v62)
	buffer.writestring(v63, 0, "Salted__")
	buffer.copy(v63, 8, v56)
	buffer.copy(v63, 16, v61)
	return buffer.tostring(v_u_2.EncodeBuffer(v63))
end
local function v_u_78(p65, p66, p67)
	-- upvalues: (copy) v_u_5, (copy) v_u_2, (copy) v_u_35, (copy) v_u_1, (copy) v_u_50
	local v68 = p67 or v_u_5
	local v69 = v_u_2.DecodeBuffer(buffer.fromstring(p65))
	if buffer.len(v69) < 16 then
		error("Invalid data: too short")
	end
	local v70 = buffer.create(8)
	buffer.copy(v70, 0, v69, 0, 8)
	if buffer.tostring(v70) ~= "Salted__" then
		error("Invalid data: Missing \'Salted__\' header")
	end
	local v71 = buffer.create(8)
	buffer.copy(v71, 0, v69, 8, 8)
	local v72 = buffer.len(v69) - 16
	local v73 = buffer.create(v72)
	buffer.copy(v73, 0, v69, 16, v72)
	local v74 = v_u_35(p66, v71, 48, 10000, v68)
	local v75 = buffer.create(32)
	buffer.copy(v75, 0, v74, 0, 32)
	local v76 = buffer.create(16)
	buffer.copy(v76, 0, v74, 32, 16)
	local v77 = v_u_50((v_u_1.new(buffer.tostring(v75), v_u_1.modes.CBC, v_u_1.pads.None):Decrypt(v73, nil, v76)))
	return buffer.tostring(v77)
end
local v85 = {
	["Encrypt"] = v_u_64,
	["Decrypt"] = v_u_78,
	["EncryptString"] = function(p79, p80, p81)
		-- upvalues: (copy) v_u_64
		return v_u_64(p79, buffer.fromstring(p80), p81)
	end,
	["DecryptString"] = function(p82, p83, p84)
		-- upvalues: (copy) v_u_78
		return v_u_78(p82, buffer.fromstring(p83), p84)
	end,
	["PBKDF2"] = v_u_35,
	["GetRandomBytes"] = v_u_11
}
table.freeze(v85)
return v85