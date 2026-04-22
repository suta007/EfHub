local v_u_1 = game:GetService("Players")
local v_u_2 = v_u_1.LocalPlayer
local v_u_3 = v_u_2.Character or v_u_2.CharacterAdded:Wait()
local function v_u_6()
	-- upvalues: (ref) v_u_3
	local v4 = v_u_3:WaitForChild("HumanoidRootPart")
	if v4 then
		for _, v5 in v4:GetChildren() do
			if v5:IsA("ProximityPrompt") then
				v5.Enabled = false
			end
		end
	end
end
v_u_2.CharacterAdded:Connect(function(p7)
	-- upvalues: (ref) v_u_3, (copy) v_u_6
	v_u_3 = p7
	v_u_6()
end)
v_u_6()
local v_u_8 = false
local function v10()
	-- upvalues: (ref) v_u_3, (ref) v_u_8
	local v9 = v_u_3:FindFirstChildWhichIsA("Tool")
	if v9 then
		v9 = v9:FindFirstChild("Weight")
	end
	v_u_8 = v9 ~= nil
end
v_u_3.ChildAdded:Connect(v10)
v_u_3.ChildRemoved:Connect(v10)
task.spawn(function()
	-- upvalues: (copy) v_u_1, (copy) v_u_2, (ref) v_u_8
	while true do
		task.wait(0.1)
		for _, v11 in v_u_1:GetPlayers() do
			if v11 ~= v_u_2 then
				local v12 = v11.Character
				if v12 then
					local v13 = v12:FindFirstChild("HumanoidRootPart")
					if v13 then
						for _, v14 in v13:GetChildren() do
							if v14:IsA("ProximityPrompt") then
								v14.Enabled = v_u_8
							end
						end
					end
				end
			end
		end
	end
end)