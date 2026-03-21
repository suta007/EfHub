local v_u_1 = game:GetService("TweenService")
return function(p2)
	-- upvalues: (copy) v_u_1
	local v3 = p2:FindFirstChild("InletTexture", true)
	if not p2:GetAttribute("DefaultColor") then
		p2:SetAttribute("DefaultColor", v3.ImageColor3)
	end
	local v4 = p2:GetAttribute("DefaultColor")
	local v5, v6, v7 = v4:ToHSV()
	local v8 = v7 + 0.1
	local v9 = math.clamp(v8, 0, 1)
	local v10 = Color3.fromHSV(v5, v6, v9)
	local v11 = p2:FindFirstChild("SENSOR", true)
	p2:FindFirstChild("UIScale", true)
	local v_u_12 = v_u_1:Create(v3, TweenInfo.new(0.25), {
		["ImageColor3"] = v10
	})
	local v_u_13 = v_u_1:Create(v3, TweenInfo.new(0.25), {
		["ImageColor3"] = v4
	})
	v11.MouseEnter:Connect(function()
		-- upvalues: (copy) v_u_12
		v_u_12:Play()
	end)
	v11.MouseLeave:Connect(function()
		-- upvalues: (copy) v_u_13
		v_u_13:Play()
	end)
	return v11
end