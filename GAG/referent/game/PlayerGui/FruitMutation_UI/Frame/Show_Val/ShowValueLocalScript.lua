local v1 = game:GetService("TweenService")
local v2 = TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.In, 0, false, 0)
local v3 = TweenInfo.new(0.05, Enum.EasingStyle.Quad, Enum.EasingDirection.Out, 0, false, 0)
local v4 = script.Parent.Parent
local v5 = { v4.FruitMutation, v4.FruitName, v4.FruitValue }
local v_u_6 = {}
local v_u_7 = {}
for _, v8 in pairs(v5) do
	local v9 = v1:Create(v8, v2, {
		["TextTransparency"] = 0
	})
	local v10 = v1:Create(v8.UIStroke, v2, {
		["Transparency"] = 0
	})
	table.insert(v_u_6, v9)
	table.insert(v_u_6, v10)
	local v11 = v1:Create(v8, v3, {
		["TextTransparency"] = 1
	})
	local v12 = v1:Create(v8.UIStroke, v3, {
		["Transparency"] = 1
	})
	table.insert(v_u_7, v11)
	table.insert(v_u_7, v12)
end
script.Parent:GetPropertyChangedSignal("Value"):Connect(function()
	-- upvalues: (copy) v_u_6, (copy) v_u_7
	if script.Parent.Value == true then
		for _, v13 in pairs(v_u_6) do
			v13:Play()
		end
	else
		for _, v14 in pairs(v_u_7) do
			v14:Play()
		end
	end
end)