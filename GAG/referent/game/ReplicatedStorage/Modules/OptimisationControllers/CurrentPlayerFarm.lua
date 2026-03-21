local v1 = game:GetService("ReplicatedStorage")
local v_u_2 = game:GetService("UserInputService")
local v_u_3 = workspace.CurrentCamera
local v4 = require(v1.Modules.Signal)
local _, v_u_5 = xpcall(function()
	return CFrame.identity * nil
end, function()
	return debug.info(2, "f")
end)
local v_u_6 = nil
local v_u_8 = {
	["Changed"] = v4.new(),
	["Observe"] = function(_, p7)
		-- upvalues: (ref) v_u_6, (copy) v_u_8
		p7(v_u_6)
		return v_u_8.Changed:Connect(p7)
	end
}
task.spawn(function()
	-- upvalues: (copy) v_u_2, (copy) v_u_5, (ref) v_u_6, (copy) v_u_8, (copy) v_u_3
	v_u_2.InputBegan:Wait()
	task.wait(5)
	local v9 = {}
	for _, v10 in workspace.Farm:GetChildren() do
		v9[v10] = v10.Center_Point.CFrame:Inverse()
	end
	while true do
		local v11 = v_u_3.Focus.Position
		local v12 = false
		for v13, v14 in v9 do
			local v15 = v_u_5(v14, v11)
			local v16 = vector.abs(v15)
			local v17
			if v16.X <= 75 then
				v17 = v16.Z <= 55
			else
				v17 = false
			end
			if v17 then
				v12 = v13
			end
			task.wait()
		end
		if v_u_6 ~= v12 then
			local v18 = v_u_6
			v_u_6 = v12
			v_u_8.Changed:Fire(v12, v18)
		end
		task.wait(1)
	end
end)
return v_u_8