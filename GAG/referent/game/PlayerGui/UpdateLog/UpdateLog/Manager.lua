local v1 = require(script.PatchNotes)
for _, v2 in script.Parent.Main.Holder.ScrollingFrame.Content:GetChildren() do
	if v2:IsA("Frame") then
		v2:Destroy()
	end
end
for v3, v4 in v1 do
	local v5 = script.SEGMENT:Clone()
	v5.Display.TITLE.UIGradient.Enabled = v3 == 1
	local v6
	if v4.Banner then
		local v7 = v4.Banner
		v6 = type(v7) == "number" and ("rbxassetid://%*"):format(v4.Banner) or (v4.Banner or nil)
	else
		v6 = nil
	end
	v5.Display.UPDATE_IMAGE.Image = v6 or "rbxasset://textures/ui/GuiImagePlaceholder.png"
	v5.Display.TITLE.Text = v4.Title
	v5.Display.TITLE_SHADOW.Text = v4.Title
	v5.LayoutOrder = v3
	local v8 = ("Version %*"):format(v4.Version)
	v5.Display.VERSION.Text = v8
	v5.Display.VERSION_SHADOW.Text = v8
	for v9, v10 in v4.Changes do
		local v11 = script.ADDITION:Clone()
		v11.Text = ("- %*"):format(v10)
		v11.LayoutOrder = v9
		v11.Parent = v5.Display.UpdateList.ScrollingFrame
		if v9 == 4 then
			v5.Display.UpdateList.ScrollingFrame.Filler.Visible = true
		end
	end
	v5.Parent = script.Parent.Main.Holder.ScrollingFrame.Content
end
local v_u_12 = script.Parent.Main.Holder.Header.Exit
v_u_12.SENSOR.Activated:Connect(function()
	script.Parent.Parent.Enabled = false
end)
local v_u_13 = v_u_12.BackgroundColor3
v_u_12.SENSOR.MouseEnter:Connect(function()
	-- upvalues: (copy) v_u_12, (copy) v_u_13
	v_u_12.BackgroundColor3 = v_u_13:Lerp(Color3.new(0, 0, 0), 0.15)
end)
v_u_12.SENSOR.MouseLeave:Connect(function()
	-- upvalues: (copy) v_u_12, (copy) v_u_13
	v_u_12.BackgroundColor3 = v_u_13
end)
v_u_12.SENSOR.MouseButton1Down:Connect(function()
	-- upvalues: (copy) v_u_12, (copy) v_u_13
	v_u_12.BackgroundColor3 = v_u_13:Lerp(Color3.new(0, 0, 0), 0.25)
end)
v_u_12.SENSOR.MouseButton1Up:Connect(function()
	-- upvalues: (copy) v_u_12, (copy) v_u_13
	v_u_12.BackgroundColor3 = v_u_13:Lerp(Color3.new(0, 0, 0), 0.15)
end)