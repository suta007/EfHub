local v_u_1 = require(script.Parent.observePlayer)
return function(p_u_2)
	-- upvalues: (copy) v_u_1
	return v_u_1(function(p_u_3)
		-- upvalues: (copy) p_u_2
		local v_u_4 = nil
		local v_u_5 = nil
		local function v_u_11(p_u_6)
			-- upvalues: (ref) p_u_2, (copy) p_u_3, (ref) v_u_5, (ref) v_u_4
			local v_u_7 = nil
			task.defer(function()
				-- upvalues: (ref) p_u_2, (ref) p_u_3, (copy) p_u_6, (ref) v_u_5, (ref) v_u_7, (ref) v_u_4
				local v8 = p_u_2(p_u_3, p_u_6)
				if typeof(v8) == "function" then
					if v_u_5.Connected and p_u_6.Parent then
						v_u_7 = v8
						v_u_4 = v8
						return
					end
					task.spawn(v8)
				end
			end)
			local v_u_9 = nil
			v_u_9 = p_u_6.AncestryChanged:Connect(function(_, p10)
				-- upvalues: (ref) v_u_9, (ref) v_u_7, (ref) v_u_4
				if p10 == nil and v_u_9.Connected then
					v_u_9:Disconnect()
					if v_u_7 ~= nil then
						task.spawn(v_u_7)
						if v_u_4 == v_u_7 then
							v_u_4 = nil
						end
						v_u_7 = nil
					end
				end
			end)
		end
		v_u_5 = p_u_3.CharacterAdded:Connect(v_u_11)
		task.defer(function()
			-- upvalues: (copy) p_u_3, (ref) v_u_5, (copy) v_u_11
			if p_u_3.Character and v_u_5.Connected then
				task.spawn(v_u_11, p_u_3.Character)
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
	end)
end