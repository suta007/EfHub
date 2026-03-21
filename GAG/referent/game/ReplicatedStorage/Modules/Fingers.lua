local v1 = game:GetService("UserInputService")
local v_u_2 = {}
v1.InputBegan:Connect(function(p3)
	-- upvalues: (copy) v_u_2
	if p3.UserInputType == Enum.UserInputType.Touch then
		v_u_2[p3] = true
	end
end)
v1.InputEnded:Connect(function(p4)
	-- upvalues: (copy) v_u_2
	if p4.UserInputType == Enum.UserInputType.Touch then
		v_u_2[p4] = nil
	end
end)
return {
	["Get"] = function(_)
		-- upvalues: (copy) v_u_2
		return v_u_2
	end,
	["GetOne"] = function(_)
		-- upvalues: (copy) v_u_2
		return next(v_u_2)
	end
}