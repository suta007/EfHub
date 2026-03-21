local v_u_1 = game:GetService("CollectionService")
return function(p2)
	-- upvalues: (copy) v_u_1
	local v3 = p2.Tag
	local v4 = p2.OnInstanceAdded or function() end
	local v5 = p2.OnInstanceRemoved or function() end
	for _, v6 in v_u_1:GetTagged(v3) do
		task.spawn(v4, v6)
	end
	v_u_1:GetInstanceAddedSignal(v3):Connect(v4)
	v_u_1:GetInstanceRemovedSignal(v3):Connect(v5)
end