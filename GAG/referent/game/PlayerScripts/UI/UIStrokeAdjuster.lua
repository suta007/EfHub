local v_u_1 = Vector2.new(1616, 880)
local v_u_2 = game:GetService("RunService")
local v_u_3 = game:GetService("CollectionService")
local v4 = game:GetService("Players").LocalPlayer:WaitForChild("PlayerGui", 100)
local v_u_5 = workspace.CurrentCamera
local function v_u_11(p6, p_u_7, p_u_8)
	-- upvalues: (copy) v_u_3, (copy) v_u_11
	if p6:IsA(p_u_7) and not p6:GetAttribute("DontResize") then
		v_u_3:AddTag(p6, p_u_8)
	end
	for _, v9 in p6:GetChildren() do
		v_u_11(v9, p_u_7, p_u_8)
	end
	p6.ChildAdded:Connect(function(p10)
		-- upvalues: (ref) v_u_11, (copy) p_u_7, (copy) p_u_8
		v_u_11(p10, p_u_7, p_u_8)
	end)
end
local v_u_12 = {}
v_u_3:GetInstanceAddedSignal("ScreenGui"):Connect(function(p13)
	-- upvalues: (copy) v_u_11
	v_u_11(p13, "UIStroke", "ScreenStroke")
end)
v_u_3:GetInstanceAddedSignal("ScreenStroke"):Connect(function(p14)
	-- upvalues: (copy) v_u_12, (copy) v_u_5, (copy) v_u_1
	if p14.StrokeSizingMode == Enum.StrokeSizingMode.FixedSize then
		v_u_12[p14] = p14.Thickness
		local v15 = p14.Thickness
		local v16 = v_u_5.ViewportSize
		local v17 = v16.X
		local v18 = v16.Y
		local v19 = math.min(v17, v18)
		local v20 = v_u_1
		local v21 = v20.X
		local v22 = v20.Y
		p14.Thickness = v15 * (v19 / math.min(v21, v22))
	end
end)
v_u_5:GetPropertyChangedSignal("ViewportSize"):Connect(function()
	-- upvalues: (copy) v_u_12, (copy) v_u_5, (copy) v_u_1
	for v23, v24 in v_u_12 do
		if v23.Parent and v23.StrokeSizingMode == Enum.StrokeSizingMode.FixedSize then
			local v25 = v_u_5.ViewportSize
			local v26 = v25.X
			local v27 = v25.Y
			local v28 = math.min(v26, v27)
			local v29 = v_u_1
			local v30 = v29.X
			local v31 = v29.Y
			v23.Thickness = v24 * (v28 / math.min(v30, v31))
		else
			v_u_12[v23] = nil
		end
	end
end)
v_u_3:GetInstanceAddedSignal("Billboard"):Connect(function(p_u_32)
	-- upvalues: (copy) v_u_2, (copy) v_u_5, (copy) v_u_1
	local v_u_33 = {}
	local function v_u_36(p34)
		-- upvalues: (copy) v_u_33, (copy) v_u_36
		if p34:IsA("UIStroke") and p34.StrokeSizingMode == Enum.StrokeSizingMode.FixedSize then
			v_u_33[p34] = p34.Thickness
		end
		for _, v35 in p34:GetChildren() do
			v_u_36(v35)
		end
		p34.ChildAdded:Connect(v_u_36)
	end
	v_u_36(p_u_32)
	local v_u_37 = tick()
	local v_u_38 = nil
	v_u_38 = v_u_2.Heartbeat:Connect(function()
		-- upvalues: (ref) v_u_37, (copy) p_u_32, (ref) v_u_38, (ref) v_u_5, (copy) v_u_33, (ref) v_u_1
		if tick() - v_u_37 < 1 then
			return
		end
		v_u_37 = tick()
		if not p_u_32.Parent then
			v_u_38:Disconnect()
			return
		end
		local v39 = p_u_32.Adornee
		local v40
		if v39 then
			if v39:IsA("Part") then
				v40 = v39.Position
			elseif v39:IsA("Model") then
				local v41, _ = v39:GetBoundingBox()
				v40 = v41.Position
			else
				v40 = Vector3.new(0, 0, 0)
			end
			if v40 then
				::l12::
				local v42 = (v_u_5.CFrame.Position - v40).Magnitude
				local v43 = math.max(v42, 0.01)
				local v44 = (p_u_32:GetAttribute("Distance") or 10) / v43
				for v45, v46 in v_u_33 do
					if v45.Parent and v45.StrokeSizingMode == Enum.StrokeSizingMode.FixedSize then
						local v47 = v46 * v44
						local v48 = v_u_5.ViewportSize
						local v49 = v48.X
						local v50 = v48.Y
						local v51 = math.min(v49, v50)
						local v52 = v_u_1
						local v53 = v52.X
						local v54 = v52.Y
						v45.Thickness = v47 * (v51 / math.min(v53, v54))
					else
						v_u_33[v45] = nil
					end
				end
				return
			end
		end
		local v55 = p_u_32.Parent
		if v55:IsA("Part") then
			v40 = v55.Position
		elseif v55:IsA("Model") then
			local v56, _ = v55:GetBoundingBox()
			v40 = v56.Position
		else
			v40 = Vector3.new(0, 0, 0)
		end
		goto l12
	end)
end)
v_u_11(v4, "ScreenGui", "ScreenGui")
v_u_11(v4, "BillboardGui", "Billboard")
return {
	["TagScreenGui"] = function(_, p57)
		-- upvalues: (copy) v_u_3
		if p57:IsA("ScreenGui") then
			v_u_3:AddTag(p57, "ScreenGui")
		end
	end,
	["TagBillboardGui"] = function(_, p58)
		-- upvalues: (copy) v_u_3
		if p58:IsA("BillboardGui") then
			v_u_3:AddTag(p58, "Billboard")
		end
	end
}