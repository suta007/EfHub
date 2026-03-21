local v1 = game:GetService("Players")
local v2 = game:GetService("ReplicatedStorage")
local v3 = game:GetService("RunService")
game:GetService("UserInputService")
local v4 = v1.LocalPlayer:WaitForChild("PlayerGui")
local v5 = v2:WaitForChild("GameEvents"):WaitForChild("RCSafariJeep")
local v6 = v5:WaitForChild("ShowUI")
local v_u_7 = v5:WaitForChild("Input")
local v_u_8 = v4:WaitForChild("SafariJeepControllerUI"):WaitForChild("RCJoystick")
local v_u_9 = v_u_8:WaitForChild("Base")
local v_u_10 = v_u_9:WaitForChild("Thumb")
v_u_9:WaitForChild("InnerRing")
v_u_8.Visible = false
local v_u_11 = false
local v_u_12 = Vector2.new()
local v13 = v_u_9.AbsoluteSize.X
local v14 = v_u_9.AbsoluteSize.Y
local v_u_15 = math.min(v13, v14) * 0.45
local v16 = v_u_10.AbsoluteSize.X
local v17 = v_u_10.AbsoluteSize.Y
local v_u_18 = math.min(v16, v17) * 0.5
local v_u_19 = Vector2.new()
local v_u_20 = 0
local function v_u_23(p21)
	-- upvalues: (ref) v_u_12, (copy) v_u_15, (copy) v_u_10, (copy) v_u_18, (copy) v_u_9, (ref) v_u_19
	local v22 = p21 - v_u_12
	if v_u_15 < v22.Magnitude then
		v22 = v22.Unit * v_u_15
	end
	v_u_10.Position = UDim2.fromOffset(v22.X - v_u_18 + v_u_9.AbsoluteSize.X * 0.5, v22.Y - v_u_18 + v_u_9.AbsoluteSize.Y * 0.5)
	v_u_19 = v22.Magnitude > 0 and v22 / v_u_15 or Vector2.zero
end
v_u_9.InputBegan:Connect(function(p24)
	-- upvalues: (ref) v_u_11, (ref) v_u_12, (copy) v_u_9, (copy) v_u_23
	if p24.UserInputType == Enum.UserInputType.MouseButton1 or p24.UserInputType == Enum.UserInputType.Touch then
		v_u_11 = true
		v_u_12 = Vector2.new(v_u_9.AbsoluteSize.X * 0.5, v_u_9.AbsoluteSize.Y * 0.5)
		v_u_23(Vector2.new(p24.Position.X, p24.Position.Y) - v_u_9.AbsolutePosition)
	end
end)
v_u_9.InputChanged:Connect(function(p25)
	-- upvalues: (ref) v_u_11, (copy) v_u_23, (copy) v_u_9
	if v_u_11 then
		if p25.UserInputType == Enum.UserInputType.MouseMovement or p25.UserInputType == Enum.UserInputType.Touch then
			v_u_23(Vector2.new(p25.Position.X, p25.Position.Y) - v_u_9.AbsolutePosition)
		end
	end
end)
v_u_9.InputEnded:Connect(function(p26)
	-- upvalues: (ref) v_u_11, (ref) v_u_19, (copy) v_u_10
	if p26.UserInputType == Enum.UserInputType.MouseButton1 or p26.UserInputType == Enum.UserInputType.Touch then
		v_u_11 = false
		v_u_19 = Vector2.zero
		v_u_10.Position = UDim2.fromScale(0.5, 0.5)
	end
end)
v3.RenderStepped:Connect(function()
	-- upvalues: (ref) v_u_20, (copy) v_u_7, (ref) v_u_19
	if time() - v_u_20 >= 0.05 then
		v_u_20 = time()
		v_u_7:FireServer(v_u_19)
	end
end)
v6.OnClientEvent:Connect(function(p27, p28)
	-- upvalues: (copy) v_u_8, (ref) v_u_19, (copy) v_u_10
	v_u_8.Visible = p27
	if p27 then
		v_u_19 = Vector2.zero
		v_u_10.Position = UDim2.fromScale(0.5, 0.5)
		if p28 and p28 > 0 then
			task.delay(p28 + 0.1, function()
				-- upvalues: (ref) v_u_8, (ref) v_u_19, (ref) v_u_10
				v_u_8.Visible = false
				v_u_19 = Vector2.zero
				v_u_10.Position = UDim2.fromScale(0.5, 0.5)
			end)
			return
		end
	else
		v_u_19 = Vector2.zero
		v_u_10.Position = UDim2.fromScale(0.5, 0.5)
	end
end)