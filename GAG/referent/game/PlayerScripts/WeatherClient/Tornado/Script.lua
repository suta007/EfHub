local v_u_1 = script.Parent.PrimaryPart
Random.new()
local v_u_2 = {}
local function v_u_6()
	-- upvalues: (copy) v_u_2
	local v3 = script.Parent.Template:Clone()
	local v4 = v_u_2
	local v5 = {
		["CreationTime"] = tick(),
		["Template"] = v3,
		["Direction"] = Random.new():NextInteger(1, 2) == 2 and -1 or 1
	}
	table.insert(v4, v5)
	v3.Name = tick()
	v3.Parent = script.Parent
	game.TweenService:Create(v3, TweenInfo.new(1.2), {
		["Size"] = Vector3.new(20, 0.5, 20)
	}):Play()
end
local v_u_7 = tick()
task.spawn(function()
	-- upvalues: (copy) v_u_2, (copy) v_u_1, (ref) v_u_7, (copy) v_u_6
	while true do
		game:GetService("RunService").Heartbeat:Wait()
		for v8, v9 in v_u_2 do
			local v10 = (tick() - v9.CreationTime) / 1.2
			local v11 = math.clamp(v10, 0, 1)
			local v12 = v9.Template
			local v13 = v_u_1.CFrame * CFrame.new(0, v11 * 35, 0)
			local v14 = CFrame.Angles
			local v15 = v11 * 720
			v12.CFrame = v13 * v14(0, math.rad(v15) * v9.Direction, 0) * CFrame.new(0, 0, v11 * 2)
			for _, v16 in v9.Template:GetChildren() do
				v16:GetAttribute("Direction")
				local v17 = v9.Template.Size.X
				local v18 = v9.Template.Size.Z
				v16.Position = Vector3.new(v17, 0, v18) / 2
				v16.Position = v16.Position * v16:GetAttribute("Direction")
			end
			if v11 == 1 then
				v9.Template:Destroy()
				table.remove(v_u_2, v8)
			end
		end
		if tick() - v_u_7 > 0.25 then
			v_u_6()
			v_u_7 = tick()
		end
	end
end)