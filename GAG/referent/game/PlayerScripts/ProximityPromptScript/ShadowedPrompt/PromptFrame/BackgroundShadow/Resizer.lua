local function v6()
	local v1 = script.Parent.Parent.Parent
	local v2 = v1.Size.X.Offset
	local v3 = v1.Size.Y.Offset
	local v4 = script.Parent.Parent.ActionText.Text
	local v5 = script.Parent.Parent.ObjectText.Text
	if #v4 > 0 and #v5 > 0 then
		script.Parent.Size = UDim2.new(0, v2 * 1.56, 0, v3 * 2.53)
		script.Parent.Image = "rbxassetid://80621645904046"
	else
		script.Parent.Size = UDim2.new(0, v2 * 1.67, 0, v3 * 1.67)
		script.Parent.Image = "rbxassetid://130991436152844"
	end
end
v6()
script.Parent.Parent.Parent:GetPropertyChangedSignal("Size"):Connect(v6)