return function(p1)
	local v2 = workspace.CurrentCamera.ViewportSize.X * 0.05
	local v3 = {}
	local v4 = 0.5
	for _, v5 in p1:GetChildren() do
		if v5:IsA("Frame") then
			table.insert(v3, v5)
		end
	end
	table.sort(v3, function(p6, p7)
		return p6.AbsoluteSize.X * p6.AbsoluteSize.Y < p7.AbsoluteSize.X * p7.AbsoluteSize.Y
	end)
	local v8 = #v3
	local v9 = 6.283185307179586 / v8
	local v10 = v4 + (v8 == 3 and 0.1 or 0)
	local v11 = v2 + v8 * 5
	for v12, v13 in v3 do
		local v14 = -1.5707963267948966 + (v12 - 1) * v9
		local v15 = math.cos(v14) * v11
		local v16 = math.sin(v14) * v11
		v13.AnchorPoint = Vector2.new(0.5, 0.5)
		v13.Position = UDim2.new(0.5, v15, v10, v16)
	end
end