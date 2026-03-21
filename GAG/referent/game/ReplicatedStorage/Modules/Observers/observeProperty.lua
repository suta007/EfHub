return function(p_u_1, p_u_2, p_u_3)
	local v_u_4 = nil
	local v_u_5 = nil
	local v_u_6 = 0
	local function v10()
		-- upvalues: (ref) v_u_4, (ref) v_u_6, (copy) p_u_1, (copy) p_u_2, (copy) p_u_3, (ref) v_u_5
		if v_u_4 ~= nil then
			task.spawn(v_u_4)
			v_u_4 = nil
		end
		v_u_6 = v_u_6 + 1
		local v_u_7 = v_u_6
		local v_u_8 = p_u_1[p_u_2]
		task.spawn(function()
			-- upvalues: (ref) p_u_3, (copy) v_u_8, (copy) v_u_7, (ref) v_u_6, (ref) v_u_5, (ref) v_u_4
			local v9 = p_u_3(v_u_8)
			if v_u_7 == v_u_6 and v_u_5.Connected then
				v_u_4 = v9
			else
				task.spawn(v9)
			end
		end)
	end
	v_u_5 = p_u_1:GetPropertyChangedSignal(p_u_2):Connect(v10)
	task.defer(function()
		-- upvalues: (ref) v_u_5, (ref) v_u_4, (ref) v_u_6, (copy) p_u_1, (copy) p_u_2, (copy) p_u_3
		if v_u_5.Connected then
			if v_u_4 ~= nil then
				task.spawn(v_u_4)
				v_u_4 = nil
			end
			v_u_6 = v_u_6 + 1
			local v_u_11 = v_u_6
			local v_u_12 = p_u_1[p_u_2]
			task.spawn(function()
				-- upvalues: (ref) p_u_3, (copy) v_u_12, (copy) v_u_11, (ref) v_u_6, (ref) v_u_5, (ref) v_u_4
				local v13 = p_u_3(v_u_12)
				if v_u_11 == v_u_6 and v_u_5.Connected then
					v_u_4 = v13
				else
					task.spawn(v13)
				end
			end)
		end
	end)
	return function()
		-- upvalues: (ref) v_u_5, (ref) v_u_4
		v_u_5:Disconnect()
		if v_u_4 ~= nil then
			task.spawn(v_u_4)
			v_u_4 = nil
		end
	end
end