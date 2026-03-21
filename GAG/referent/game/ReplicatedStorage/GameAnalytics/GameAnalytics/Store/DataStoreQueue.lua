local v_u_1 = {
	["QR"] = true,
	["Queue"] = {},
	["Process"] = 0
}
local v_u_2 = {}
task.spawn(function()
	-- upvalues: (copy) v_u_1, (copy) v_u_2
	while v_u_1.QR do
		task.wait()
		if #v_u_1.Queue > 0 then
			local v_u_3 = v_u_1.Queue[1]
			table.remove(v_u_1.Queue, 1)
			if not v_u_2[v_u_3.Key] then
				v_u_2[v_u_3.Key] = 0
			end
			local v4 = v_u_1
			v4.Process = v4.Process + 1
			local v5 = v_u_3.Delay + v_u_2[v_u_3.Key] - DateTime.now().UnixTimestamp
			local v6 = v5 <= 0 and 0 or v5
			task.delay(v6, function()
				-- upvalues: (ref) v_u_2, (copy) v_u_3, (ref) v_u_1
				while true do
					v_u_2[v_u_3.Key] = DateTime.now().UnixTimestamp
					local v7, v8, v9 = pcall(v_u_3.Func)
					if not v7 then
						warn(v8)
					end
					if v7 and v8 or not v_u_3.Delay then
						break
					end
					task.wait(v_u_3.Delay)
					if v7 and v8 then
						break
					end
				end
				v_u_3.Event:Fire(v7, v8, v9)
				local v10 = v_u_1
				v10.Process = v10.Process - 1
				v_u_2[v_u_3.Key] = DateTime.now().UnixTimestamp
			end)
		end
	end
end)
function v_u_1.AddRequest(p11, p12, p13)
	-- upvalues: (copy) v_u_1
	local v14 = Instance.new("BindableEvent")
	local v15 = v_u_1.Queue
	table.insert(v15, {
		["Key"] = p11,
		["Delay"] = p13,
		["Func"] = p12,
		["Event"] = v14
	})
	local v16, v17, v18 = v14.Event:Wait()
	return v16, v17, v18
end
function v_u_1.RemoveKey(p19)
	-- upvalues: (copy) v_u_2
	v_u_2[p19] = nil
end
return v_u_1