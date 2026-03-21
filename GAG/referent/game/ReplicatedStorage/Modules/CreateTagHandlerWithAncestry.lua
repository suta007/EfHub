local v_u_1 = game:GetService("CollectionService")
game:GetService("ReplicatedStorage")
return function(p2)
	-- upvalues: (copy) v_u_1
	local v3 = p2.Tag
	local v_u_4 = p2.OnInstanceAdded or function() end
	local v_u_5 = p2.OnInstanceRemoved or function() end
	local v_u_6 = p2.Ancestor or workspace
	local v_u_7 = {}
	local v_u_8 = {}
	local v_u_9 = 0
	local function v11(p_u_10)
		-- upvalues: (copy) v_u_7, (copy) v_u_6, (copy) v_u_8, (ref) v_u_9, (copy) v_u_4, (copy) v_u_5
		v_u_7[p_u_10] = p_u_10.AncestryChanged:Connect(function()
			-- upvalues: (copy) p_u_10, (ref) v_u_6, (ref) v_u_8, (ref) v_u_9, (ref) v_u_4, (ref) v_u_5
			if p_u_10:IsDescendantOf(v_u_6) then
				if not v_u_8[p_u_10] then
					v_u_8[p_u_10] = true
					v_u_9 = v_u_9 + 1
					v_u_4(p_u_10)
					return
				end
			elseif v_u_8[p_u_10] then
				v_u_8[p_u_10] = nil
				v_u_9 = v_u_9 - 1
				v_u_5(p_u_10)
			end
		end)
		if p_u_10:IsDescendantOf(v_u_6) and not v_u_8[p_u_10] then
			v_u_8[p_u_10] = true
			v_u_9 = v_u_9 + 1
			v_u_4(p_u_10)
		end
	end
	local function v13(p12)
		-- upvalues: (copy) v_u_8, (ref) v_u_9, (copy) v_u_5, (copy) v_u_7
		if v_u_8[p12] then
			v_u_9 = v_u_9 - 1
			v_u_8[p12] = nil
			v_u_5(p12)
		end
		if v_u_7[p12] then
			v_u_7[p12]:Disconnect()
			v_u_7[p12] = nil
		end
	end
	local v_u_14 = v_u_9
	for _, v15 in v_u_1:GetTagged(v3) do
		task.spawn(v11, v15)
	end
	v_u_1:GetInstanceAddedSignal(v3):Connect(v11)
	v_u_1:GetInstanceRemovedSignal(v3):Connect(v13)
	return {
		["GetCount"] = function()
			-- upvalues: (ref) v_u_14
			return v_u_14
		end,
		["GetTrackedInstances"] = function()
			-- upvalues: (copy) v_u_8
			return v_u_8
		end
	}
end