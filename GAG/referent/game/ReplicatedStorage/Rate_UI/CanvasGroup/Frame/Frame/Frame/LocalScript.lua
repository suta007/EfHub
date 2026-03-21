local v_u_1 = {}
for _, v2 in pairs(script.Parent:GetChildren()) do
	if v2:IsA("ImageButton") then
		table.insert(v_u_1, v2)
	end
end
for _, v_u_3 in pairs(v_u_1) do
	local v_u_4 = game.SoundService.Click
	local v_u_5 = game.SoundService.Hover
	v_u_3.MouseButton1Down:Connect(function()
		-- upvalues: (copy) v_u_4
		v_u_4.PlaybackSpeed = 1 + math.random(-15, 15) / 100
		v_u_4.TimePosition = 0
		v_u_4.Playing = true
	end)
	local v_u_6 = game:GetService("UserInputService")
	v_u_3.MouseEnter:Connect(function()
		-- upvalues: (copy) v_u_6, (copy) v_u_5
		if v_u_6.TouchEnabled == false then
			v_u_5.PlaybackSpeed = 1 + math.random(-15, 15) / 100
			v_u_5.TimePosition = 0
			v_u_5.Playing = true
		end
	end)
	v_u_3.MouseButton1Click:Connect(function()
		-- upvalues: (copy) v_u_1, (copy) v_u_3
		for _, v7 in pairs(v_u_1) do
			if v7.LayoutOrder <= v_u_3.LayoutOrder then
				v7.ImageColor3 = Color3.new(1, 1, 1)
				script.Parent.Parent.Parent.Parent.Parent.Rating_Val.Value = v_u_3.LayoutOrder
			else
				v7.ImageColor3 = Color3.new(0, 0, 0)
			end
		end
	end)
end