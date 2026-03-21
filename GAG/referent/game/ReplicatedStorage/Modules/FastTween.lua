local v_u_1 = game:GetService("TweenService")
return function(p2, p3, p4, p5)
	-- upvalues: (copy) v_u_1
	local v6 = p5 ~= false
	local v_u_7 = v_u_1:Create(p2, p3, p4)
	v_u_7.Completed:Once(function()
		-- upvalues: (copy) v_u_7
		v_u_7:Destroy()
	end)
	if v6 then
		v_u_7:Play()
	end
	return v_u_7
end