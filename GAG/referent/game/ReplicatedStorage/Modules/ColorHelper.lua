return {
	["BlendColorsHSV"] = function(_, p1, p2, p3)
		local v4 = p1.R
		local v5 = p1.G
		local v6 = p1.B
		local v7 = Color3.new(math.clamp(v4, 0, 1), math.clamp(v5, 0, 1), (math.clamp(v6, 0, 1)))
		local v8 = p2.R
		local v9 = p2.G
		local v10 = p2.B
		local v11 = Color3.new(math.clamp(v8, 0, 1), math.clamp(v9, 0, 1), (math.clamp(v10, 0, 1)))
		local v12, v13, v14 = v7:ToHSV()
		local v15, v16, v17 = v11:ToHSV()
		local v18 = v12 - v15
		if math.abs(v18) > 0.5 then
			if v15 < v12 then
				v15 = v15 + 1
			else
				v12 = v12 + 1
			end
		end
		local v19 = v12 + (v15 - v12) * p3
		local v20 = v13 + (v16 - v13) * p3
		local v21 = v14 + (v17 - v14) * p3
		local v22 = v19 % 1
		return Color3.fromHSV(v22, v20, v21)
	end
}