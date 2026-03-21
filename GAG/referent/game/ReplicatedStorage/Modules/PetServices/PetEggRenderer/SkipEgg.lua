local function v_u_3(p1)
	local v_u_2 = Instance.new("Sound")
	v_u_2.SoundId = p1
	v_u_2.Parent = workspace
	v_u_2:Play()
	v_u_2.Ended:Once(function()
		-- upvalues: (copy) v_u_2
		v_u_2:Destroy()
	end)
end
return function(p4)
	-- upvalues: (copy) v_u_3
	local v5 = p4:GetPivot()
	v_u_3("rbxassetid://80226669144059")
	local v6 = script.Part.Attachment:Clone()
	v6.Parent = workspace.Terrain
	local v7 = 0
	for _, v8 in v6:GetDescendants() do
		v8.Enabled = true
	end
	v6.WorldCFrame = v5 * CFrame.Angles(0, 0, 3.141592653589793)
	while v7 < 1.2 do
		v7 = v7 + game:GetService("RunService").Heartbeat:Wait()
		local v9 = game:GetService("TweenService"):GetValue(v7 / 1.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)
		local v10 = CFrame.Angles
		local v11 = v9 * 1080
		local v12 = v5 * v10(0, math.rad(v11), 0)
		local v13 = CFrame.Angles
		local v14 = 1080 * v9
		local v15 = math.sin(v14) * 35 * (1 - v9)
		p4:PivotTo(v12 * v13(0, 0, (math.rad(v15))))
	end
	for _, v16 in v6:GetDescendants() do
		v16.Enabled = false
	end
	game.Debris:AddItem(v6, 5)
end