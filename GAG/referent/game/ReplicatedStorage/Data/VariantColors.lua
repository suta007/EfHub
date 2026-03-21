local v_u_1 = {
	["Colors"] = {
		["Normal"] = Color3.fromRGB(255, 255, 255),
		["Silver"] = Color3.fromRGB(222, 222, 222),
		["Gold"] = Color3.fromRGB(255, 215, 0),
		["Rainbow"] = Color3.fromRGB(255, 0, 0),
		["Diamond"] = Color3.fromRGB(0, 255, 247)
	}
}
local function v_u_12(p2)
	if not p2 then
		return nil
	end
	local v3 = p2.R * 255
	local v4 = math.floor(v3)
	local v5 = math.clamp(v4, 0, 255)
	local v6 = p2.G * 255
	local v7 = math.floor(v6)
	local v8 = math.clamp(v7, 0, 255)
	local v9 = p2.B * 255
	local v10 = math.floor(v9)
	local v11 = math.clamp(v10, 0, 255)
	return string.format("#%02X%02X%02X", v5, v8, v11)
end
function v_u_1.GetColor3(_, p13)
	-- upvalues: (copy) v_u_1
	if p13 then
		return v_u_1.Colors[p13] or nil
	else
		return nil
	end
end
function v_u_1.GetHex(_, p14)
	-- upvalues: (copy) v_u_1, (copy) v_u_12
	if p14 then
		local v15 = v_u_1.Colors[p14]
		if v15 then
			return v_u_12(v15) or nil
		else
			return nil
		end
	else
		return nil
	end
end
return v_u_1