return {
	["HueShiftRandom"] = function(p1, p2, p3, p4)
		local v5, v6, v7 = p2:ToHSV()
		local v8 = p3 or -0.05
		local v9 = v5 + p1:NextNumber(v8, p4 or -v8)
		local v10 = math.clamp(v9, 0.01, 0.99)
		return Color3.fromHSV(v10, v6, v7), v10, v6, v7
	end,
	["ValShiftRandom"] = function(p11, p12, p13, p14)
		local v15, v16, v17 = p12:ToHSV()
		local v18 = p13 or -0.05
		local v19 = v17 + p11:NextNumber(v18, p14 or -v18)
		local v20 = math.clamp(v19, 0.01, 0.99)
		return Color3.fromHSV(v15, v16, v20), v15, v16, v20
	end,
	["SatShiftRandom"] = function(p21, p22, p23, p24)
		local v25, v26, v27 = p22:ToHSV()
		local v28 = p23 or -0.05
		local v29 = v26 + p21:NextNumber(v28, p24 or -v28)
		local v30 = math.clamp(v29, 0.01, 0.99)
		return Color3.fromHSV(v25, v30, v27), v25, v30, v27
	end,
	["RandomiseValueByPercent"] = function(p31, p32, p33)
		local v34 = p33 / 100
		return p32 + p32 * (p31:NextNumber() * v34 * 2 - v34)
	end,
	["CreateRandomAngleRad"] = function(p35, p36)
		local v37 = p35:NextNumber() * p36 - p36 / 2
		return math.rad(v37)
	end
}