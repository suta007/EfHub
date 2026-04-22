local v1 = script.Parent.Parent.Frame
local v2 = game:GetService("TweenService")
local v3 = TweenInfo.new(0.7, Enum.EasingStyle.Quad, Enum.EasingDirection.Out, 0, false, 0)
local v_u_4 = { v1 }
for _, v5 in pairs(v1:GetDescendants()) do
	if v5:IsA("TextLabel") or (v5:IsA("UIStroke") or (v5:IsA("ImageLabel") or v5:IsA("Frame"))) then
		table.insert(v_u_4, v5)
	end
end
local v_u_6 = {}
local v_u_7 = script.Parent.Parent.Frame.Frame.Background
local v8 = v2:Create(v_u_7, v3, {
	["Position"] = UDim2.new(0.5, 0, 0.5, 0)
})
table.insert(v_u_6, v8)
local v9 = {}
for _, v10 in pairs(v_u_4) do
	if v10:IsA("TextLabel") then
		local v11 = v2:Create(v10, v3, {
			["TextTransparency"] = 1
		})
		table.insert(v9, v11)
		if v10.TextTransparency == 0 then
			local v12 = v2:Create(v10, v3, {
				["TextTransparency"] = 0
			})
			table.insert(v_u_6, v12)
		end
	elseif v10:IsA("UIStroke") then
		local v13 = v2:Create(v10, v3, {
			["Transparency"] = 1
		})
		table.insert(v9, v13)
		if v10.Transparency == 0 then
			local v14 = v2:Create(v10, v3, {
				["Transparency"] = 0
			})
			table.insert(v_u_6, v14)
		end
	elseif v10:IsA("ImageLabel") then
		local v15 = v2:Create(v10, v3, {
			["ImageTransparency"] = 1
		})
		table.insert(v9, v15)
		if v10.ImageTransparency == 0 then
			local v16 = v2:Create(v10, v3, {
				["ImageTransparency"] = 0
			})
			table.insert(v_u_6, v16)
		end
	end
end
script.Parent:GetPropertyChangedSignal("Value"):Connect(function()
	-- upvalues: (copy) v_u_7, (copy) v_u_4, (copy) v_u_6
	if script.Parent.Value == true then
		v_u_7.Position = UDim2.new(0.75, 0, 0.5, 0)
		for _, v17 in pairs(v_u_4) do
			if v17:IsA("TextLabel") then
				v17.TextTransparency = 1
			elseif v17:IsA("UIStroke") then
				v17.Transparency = 1
			elseif v17:IsA("Frame") then
				v17.BackgroundTransparency = 1
			elseif v17:IsA("ImageLabel") then
				v17.ImageTransparency = 1
			end
		end
		for _, v18 in pairs(v_u_6) do
			v18:Play()
		end
		script.Parent.Parent.Frame.Visible = true
	else
		script.Parent.Parent.Frame.Visible = false
	end
end)