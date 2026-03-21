local v_u_1 = game:GetService("RunService")
return function(p2, p3, p4)
	-- upvalues: (copy) v_u_1
	local v5 = p2:FindFirstChild(p3, true)
	if v5 then
		return v5
	end
	local v6 = p4 or (1 / 0)
	local v7 = 0
	local v8 = false
	while true do
		local v9 = p2:FindFirstChild(p3, true)
		if v6 <= v7 then
			break
		end
		if v7 >= 5 and not v8 then
			warn((("Infinite yield possible on \'game.%*:WaitForDescendant(\"%*\")\' %*"):format(p2:GetFullName(), p3, (debug.traceback()))))
			v8 = true
		end
		v7 = v7 + v_u_1.PreSimulation:Wait()
		if v9 then
			return v9
		end
	end
	return v9
end