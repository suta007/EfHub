local v1 = game.Players.LocalPlayer
local v_u_2 = v1.Character or v1.CharacterAdded:Wait()
local v_u_3 = v_u_2:WaitForChild("HumanoidRootPart")
local v4 = game:GetService("RunService")
local v_u_5 = game:GetService("UserInputService")
local v_u_6 = nil
local v_u_7 = nil
local v8 = game.Workspace:FindFirstChild("Player_Orientation_References") or Instance.new("Folder", game.Workspace)
v8.Name = "Player_Orientation_References"
local v_u_9 = game.ReplicatedStorage.REF:Clone()
v_u_9.Parent = v8
v_u_9.Anchored = true
v_u_9.CanCollide = false
v_u_9.Name = v1.Name
v_u_9.Transparency = 1
local v10 = Instance.new("Attachment", v_u_9)
local v11 = Instance.new("Attachment", v_u_3)
local v_u_12 = Instance.new("AlignOrientation", v_u_9)
v_u_12.Attachment0 = v11
v_u_12.Attachment1 = v10
v_u_12.MaxAngularVelocity = 3000000000
v_u_12.MaxTorque = 3000000000
v_u_12.Enabled = false
if not v_u_5.TouchEnabled then
	v4.RenderStepped:Connect(function()
		-- upvalues: (ref) v_u_6, (copy) v_u_5, (copy) v_u_3, (copy) v_u_12, (copy) v_u_9
		if v_u_6 == true then
			local v13 = workspace.CurrentCamera
			local v14 = v_u_5:GetMouseLocation()
			local v15 = v13:ViewportPointToRay(v14.X, v14.Y)
			local v16 = v15.Origin
			local v17 = v15.Direction
			local v18 = v16 + v17 * ((v_u_3.Position.Y - v16.Y) / v17.Y)
			local v19 = v_u_3.Position
			local v20 = (v18 - v19).Unit
			v_u_12.Enabled = true
			v_u_9.Position = v19
			v_u_9.CFrame = CFrame.new(v19, v19 + v20)
		end
	end)
	v_u_2.ChildAdded:Connect(function(p21)
		if p21:IsA("Tool") then
			string.find(p21.Name, "Watering")
		end
	end)
	v_u_2.ChildRemoved:Connect(function(_)
		-- upvalues: (copy) v_u_2, (ref) v_u_6, (copy) v_u_12
		if v_u_2:FindFirstChildWhichIsA("Tool") == nil then
			v_u_6 = false
			v_u_12.Enabled = false
		end
	end)
	v_u_5.InputBegan:Connect(function(p22)
		-- upvalues: (ref) v_u_7
		if p22.UserInputType == Enum.UserInputType.MouseButton1 then
			v_u_7 = true
		end
	end)
	v_u_5.InputEnded:Connect(function(p23)
		-- upvalues: (ref) v_u_7, (copy) v_u_12
		if p23.UserInputType == Enum.UserInputType.MouseButton1 then
			v_u_7 = false
			v_u_12.Enabled = false
		end
	end)
end