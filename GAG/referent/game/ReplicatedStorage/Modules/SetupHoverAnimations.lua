local v_u_1 = game:GetService("TweenService")
return function(p2, p3)
	-- upvalues: (copy) v_u_1
	local v4 = p2:FindFirstChild("SENSOR", true)
	local v5 = p2:FindFirstChild("UIScale", true)
	local v6 = p3 or 0.05
	local v7 = v5.Scale
	local v8 = v7 * (1 + v6)
	local v9 = v7 * (1 - v6)
	local v_u_10 = v_u_1:Create(v5, TweenInfo.new(0.25), {
		["Scale"] = v8
	})
	local v_u_11 = v_u_1:Create(v5, TweenInfo.new(0.25), {
		["Scale"] = v9
	})
	local v_u_12 = v_u_1:Create(v5, TweenInfo.new(0.25), {
		["Scale"] = v7
	})
	v4.MouseButton1Down:Connect(function()
		-- upvalues: (copy) v_u_11
		v_u_11:Play()
	end)
	v4.MouseButton1Up:Connect(function()
		-- upvalues: (copy) v_u_10
		v_u_10:Play()
	end)
	v4.MouseEnter:Connect(function()
		-- upvalues: (copy) v_u_10
		v_u_10:Play()
	end)
	v4.MouseLeave:Connect(function()
		-- upvalues: (copy) v_u_12
		v_u_12:Play()
	end)
	return v4
end