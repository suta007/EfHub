local v_u_1 = game:GetService("Players")
return function(p_u_2)
	-- upvalues: (copy) v_u_1
	local v_u_3 = nil
	local v_u_4 = {}
	local function v_u_7(p_u_5)
		-- upvalues: (ref) v_u_3, (copy) p_u_2, (copy) v_u_4
		if v_u_3.Connected then
			task.spawn(function()
				-- upvalues: (ref) p_u_2, (copy) p_u_5, (ref) v_u_3, (ref) v_u_4
				local v6 = p_u_2(p_u_5)
				if typeof(v6) == "function" then
					if v_u_3.Connected and p_u_5.Parent then
						v_u_4[p_u_5] = v6
						return
					end
					task.spawn(v6)
				end
			end)
		end
	end
	v_u_3 = v_u_1.PlayerAdded:Connect(v_u_7)
	local v_u_10 = v_u_1.PlayerRemoving:Connect(function(p8)
		-- upvalues: (copy) v_u_4
		local v9 = v_u_4[p8]
		v_u_4[p8] = nil
		if typeof(v9) == "function" then
			task.spawn(v9)
		end
	end)
	task.defer(function()
		-- upvalues: (ref) v_u_3, (ref) v_u_1, (copy) v_u_7
		if v_u_3.Connected then
			for _, v11 in v_u_1:GetPlayers() do
				task.spawn(v_u_7, v11)
			end
		end
	end)
	return function()
		-- upvalues: (ref) v_u_3, (ref) v_u_10, (copy) v_u_4
		v_u_3:Disconnect()
		v_u_10:Disconnect()
		local v12 = next(v_u_4)
		while v12 do
			local v13 = v_u_4[v12]
			v_u_4[v12] = nil
			if typeof(v13) == "function" then
				task.spawn(v13)
			end
			v12 = next(v_u_4)
		end
	end
end