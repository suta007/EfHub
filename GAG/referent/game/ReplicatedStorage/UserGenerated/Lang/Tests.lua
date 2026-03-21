local v_u_1 = require(game.ReplicatedStorage.UserGenerated.Strings.Stringify)
local v_u_2 = require(game.ReplicatedStorage.UserGenerated.Collections.DeepEquals)
return table.freeze({
	["IsEqual"] = function(p3, p4)
		return rawequal(p3, p4) and true or (type(p3) ~= "table" or type(p4) ~= "table") and (p3 ~= p3 and p4 ~= p4)
	end,
	["ErrorUnsafe"] = function(p5, p6, ...)
		local v_u_7 = nil
		local v9 = table.pack(xpcall(p6, function(p8)
			-- upvalues: (ref) v_u_7
			v_u_7 = p8
		end, ...))
		if v9[1] then
			error("ExpectedError", 2)
		end
		if v_u_7 ~= p5 then
			local v10 = v_u_7
			error(("ExpectedError Mismatch: %*"):format((string.format("%q", (tostring(v10))))), 2)
		end
		return table.unpack(v9, 2)
	end,
	["Error"] = function(p11, p12, ...)
		-- upvalues: (copy) v_u_1
		local v_u_13 = nil
		local v15 = table.pack(xpcall(p12, function(p14)
			-- upvalues: (ref) v_u_13
			v_u_13 = p14
		end, ...))
		if v15[1] then
			error(("ExpectedError(%*)"):format((v_u_1.Pretty(p11, {
				["Pretty"] = false,
				["IndentChar"] = "",
				["IndentSize"] = 0
			}))), 2)
		end
		local v16 = v_u_13
		if type(v16) == "string" then
			local v17 = v_u_13
			local v18 = tostring(v17)
			local v19, v20 = string.match(v18, "^(.*:%d+): (.+)$")
			if v19 then
				v18 = v20 or v18
			end
			v_u_13 = v18
		end
		if p11 ~= v_u_13 then
			local v21 = v_u_1.Pretty(p11, {
				["Pretty"] = false,
				["IndentChar"] = "",
				["IndentSize"] = 0
			})
			local v22 = v_u_13
			error(("ExpectedError(%*): %*"):format(v21, (v_u_1.Pretty(v22, {
				["Pretty"] = false,
				["IndentChar"] = "",
				["IndentSize"] = 0
			}))), 2)
		end
		return table.unpack(v15, 2)
	end,
	["Equal"] = function(p23, p24)
		-- upvalues: (copy) v_u_1
		if not rawequal(p23, p24) and (type(p23) == "table" and type(p24) == "table" or (p23 == p23 or p24 == p24)) then
			error(("Equal(%*, %*)"):format(v_u_1.Pretty(p23, {
				["Pretty"] = false,
				["IndentChar"] = "",
				["IndentSize"] = 0
			}), (v_u_1.Pretty(p24, {
				["Pretty"] = false,
				["IndentChar"] = "",
				["IndentSize"] = 0
			}))), 2)
		end
	end,
	["DeepEqual"] = function(p25, p26)
		-- upvalues: (copy) v_u_2, (copy) v_u_1
		if not v_u_2(p25, p26) then
			error(("DeepEqual(%*, %*)"):format(v_u_1.Pretty(p25, {
				["Pretty"] = false,
				["IndentChar"] = "",
				["IndentSize"] = 0
			}), (v_u_1.Pretty(p26, {
				["Pretty"] = false,
				["IndentChar"] = "",
				["IndentSize"] = 0
			}))), 2)
		end
	end,
	["FuzzyEqual"] = function(p27, p28, p29)
		local v30 = p27 - p28
		if (p29 or 0.001) < math.abs(v30) then
			local v31 = error
			local v32 = tostring(p27)
			local v33 = tostring(p28)
			local v34 = p27 - p28
			v31(("FuzzyEqual(%*, %*): %*"):format(v32, v33, (math.abs(v34))), 2)
		end
	end,
	["ColorEqual"] = function(p35, p36, p37)
		-- upvalues: (copy) v_u_1
		local v38 = p35.R
		local v39 = p35.G
		local v40 = p35.B
		local v41 = Vector3.new(v38, v39, v40) * 255
		local v42 = p36.R
		local v43 = p36.G
		local v44 = p36.B
		if (p37 or 0.001) < (Vector3.new(v42, v43, v44) * 255 - v41).Magnitude then
			error(("ColorEqual(%*, %*)"):format(v_u_1.Pretty(p35, {
				["Pretty"] = false,
				["IndentChar"] = "",
				["IndentSize"] = 0
			}), (v_u_1.Pretty(p36, {
				["Pretty"] = false,
				["IndentChar"] = "",
				["IndentSize"] = 0
			}))), 2)
		end
	end
})