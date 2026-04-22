return {
	["CalculateSurfaceInfo"] = function(p1, p2)
		local v3 = -Vector3.FromNormalId(Enum.NormalId.Top)
		local v4 = v3.y
		local v5
		if math.abs(v4) == 1 then
			local v6 = v3.y
			v5 = Vector3.new(v6, 0, 0) or Vector3.new(0, 1, 0)
		else
			v5 = Vector3.new(0, 1, 0)
		end
		local v7 = CFrame.fromAxisAngle(v5, 1.5707963267948966) * v3
		local v8 = v3:Cross(v7).Unit
		return p1 * CFrame.fromMatrix(-v3 * p2 / 2, v7, v8, v3), Vector2.new((p2 * v7).Magnitude, (p2 * v8).Magnitude)
	end,
	["CalculateCameraProperties"] = function(p9, p10, p11, _)
		local v12 = p10:PointToObjectSpace(p9.p)
		local v13 = v12.x / p11.x
		local v14 = v12.y / p11.y
		local v15 = math.abs(v13) * 2 + 1
		local v16 = math.abs(v14) * 2 + 1
		local v17 = v15 * v15 + v16 * v16
		local v18 = math.sqrt(v17)
		local v19 = (p9.p - p10.p):Dot(p10.LookVector)
		local v20 = p11.y / 2
		local v21 = math.atan2(v20, v19) * 2
		local v22 = math.deg(v21)
		local v23 = math.clamp(v22, 1, 120)
		local v24 = p11.y / 2
		local v25 = math.rad(v23) / 2
		local v26 = v19 / (v24 / math.tan(v25))
		local v27 = (v21 > 2.0943951023931953 and v26 and v26 or 1) / v18
		return v13, v14, v18, CFrame.new(0, 0, 0, v27, 0, 0, 0, v27, 0, 0, 0, 1), v23
	end
}