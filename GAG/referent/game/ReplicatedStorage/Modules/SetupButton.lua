local v_u_1 = require(game:GetService("ReplicatedStorage").Modules.Spring)
return function(p_u_2)
	-- upvalues: (copy) v_u_1
	if not p_u_2 then
		return nil
	end
	local v_u_3 = p_u_2.instance
	if not v_u_3:IsA("GuiButton") then
		return nil
	end
	if p_u_2.scale then
		local v4 = p_u_2.scale
		if typeof(v4) ~= "Instance" or not p_u_2.scale:IsA("UIScale") then
			local v5 = warn
			local v6 = p_u_2.scale
			v5((("SetupButton: Provided scale is invalid. Received type %*"):format((typeof(v6)))))
			return
		end
	end
	local v_u_7 = p_u_2.scale or (v_u_3:FindFirstChildOfClass("UIScale") or v_u_3.Parent:FindFirstChildOfClass("UIScale")) or Instance.new("UIScale", v_u_3)
	local v_u_8 = v_u_7.Scale
	local v_u_9 = p_u_2.speed or 10
	local v_u_10 = p_u_2.damping or 1
	local v_u_11 = p_u_2.offset or 0.065
	v_u_3.MouseEnter:Connect(function()
		-- upvalues: (copy) p_u_2
		if p_u_2.onhover then
			p_u_2.onhover()
		end
	end)
	v_u_3.MouseLeave:Connect(function()
		-- upvalues: (copy) p_u_2
		if p_u_2.onleave then
			p_u_2.onleave()
		end
	end)
	if p_u_2.legacy then
		v_u_3.MouseButton1Down:Connect(function()
			-- upvalues: (ref) v_u_1, (ref) v_u_7, (copy) v_u_10, (copy) v_u_9, (copy) v_u_8, (copy) v_u_3, (copy) v_u_11
			v_u_1.target(v_u_7, v_u_10, v_u_9, {
				["Scale"] = v_u_8 - (v_u_3.Active and v_u_11 or 0)
			})
		end)
		v_u_3.MouseButton1Up:Connect(function()
			-- upvalues: (ref) v_u_1, (ref) v_u_7, (copy) v_u_10, (copy) v_u_9, (copy) v_u_8, (copy) v_u_3, (copy) v_u_11
			v_u_1.target(v_u_7, v_u_10, v_u_9, {
				["Scale"] = v_u_8 + (v_u_3.Active and v_u_11 or 0)
			})
		end)
	end
	v_u_3.Activated:Connect(function()
		-- upvalues: (copy) p_u_2, (copy) v_u_3
		if p_u_2.onclick then
			p_u_2.onclick(v_u_3)
		end
	end)
	return v_u_3
end