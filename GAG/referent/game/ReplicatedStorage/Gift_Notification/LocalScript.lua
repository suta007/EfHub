local v1 = script.Parent.Holder
local v2 = game:GetService("TweenService")
local v_u_3 = TweenInfo.new(0.7, Enum.EasingStyle.Quad, Enum.EasingDirection.Out, 0, false, 0)
local _ = v1.Position
v1.Position = UDim2.new(1.25, 0, 0.5, 0)
local v4 = v2:Create(v1, v_u_3, {
	["Position"] = UDim2.new(0.5, 0, 0.5, 0)
})
v4:Play()
game.Debris:AddItem(v4, v_u_3.Time)
local v5 = { script.Parent }
for _, v6 in pairs(script.Parent:GetDescendants()) do
	if v6:IsA("Frame") or (v6:IsA("TextLabel") or (v6:IsA("UIStroke") or (v6:IsA("ImageLabel") or v6:IsA("TextButton")))) then
		table.insert(v5, v6)
	end
end
local v_u_7 = {}
for _, v8 in pairs(v5) do
	if v8:IsA("TextLabel") then
		local v9 = v8.TextTransparency
		local v10 = v8.TextStrokeTransparency
		v8.TextTransparency = 1
		v8.TextStrokeTransparency = 1
		local v11 = v2:Create(v8, v_u_3, {
			["TextTransparency"] = v9,
			["TextStrokeTransparency"] = v10
		})
		v11:Play()
		game.Debris:AddItem(v11, v_u_3.Time)
		local v12 = v2:Create(v8, v_u_3, {
			["TextTransparency"] = 1,
			["TextStrokeTransparency"] = 1
		})
		table.insert(v_u_7, v12)
	elseif v8:IsA("Frame") then
		local v13 = v8.BackgroundTransparency
		v8.BackgroundTransparency = 1
		local v14 = v2:Create(v8, v_u_3, {
			["BackgroundTransparency"] = v13
		})
		v14:Play()
		game.Debris:AddItem(v14, v_u_3.Time)
		local v15 = v2:Create(v8, v_u_3, {
			["BackgroundTransparency"] = 1
		})
		table.insert(v_u_7, v15)
	elseif v8:IsA("UIStroke") then
		local v16 = v8.Transparency
		v8.Transparency = 1
		local v17 = v2:Create(v8, v_u_3, {
			["Transparency"] = v16
		})
		v17:Play()
		game.Debris:AddItem(v17, v_u_3.Time)
		local v18 = v2:Create(v8, v_u_3, {
			["Transparency"] = 1
		})
		table.insert(v_u_7, v18)
	elseif v8:IsA("ImageLabel") then
		local v19 = v8.ImageTransparency
		local v20 = v8.BackgroundTransparency
		v8.ImageTransparency = 1
		v8.BackgroundTransparency = 1
		local v21 = v2:Create(v8, v_u_3, {
			["ImageTransparency"] = v19,
			["BackgroundTransparency"] = v20
		})
		v21:Play()
		game.Debris:AddItem(v21, v_u_3.Time)
		local v22 = v2:Create(v8, v_u_3, {
			["ImageTransparency"] = 1,
			["BackgroundTransparency"] = 1
		})
		table.insert(v_u_7, v22)
	elseif v8:IsA("TextButton") then
		local v23 = v8.TextTransparency
		local v24 = v8.BackgroundTransparency
		v8.TextTransparency = 1
		v8.BackgroundTransparency = 1
		local v25 = v2:Create(v8, v_u_3, {
			["TextTransparency"] = v23,
			["BackgroundTransparency"] = v24
		})
		v25:Play()
		game.Debris:AddItem(v25, v_u_3.Time)
		local v26 = v2:Create(v8, v_u_3, {
			["TextTransparency"] = 1,
			["BackgroundTransparency"] = 1
		})
		table.insert(v_u_7, v26)
	end
end
task.spawn(function()
	-- upvalues: (copy) v_u_7, (copy) v_u_3
	task.wait(30)
	if script.Parent then
		for _, v27 in pairs(v_u_7) do
			v27:Play()
		end
		game.Debris:AddItem(script.Parent, v_u_3.Time)
	end
end)