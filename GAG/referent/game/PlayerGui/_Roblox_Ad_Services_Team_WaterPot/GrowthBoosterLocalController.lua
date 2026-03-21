local v1 = game:GetService("Players")
local v2 = game:GetService("ReplicatedStorage")
local v_u_3 = game:GetService("Workspace")
local _ = v1.LocalPlayer
local v_u_4 = v2:WaitForChild("GameEvents"):WaitForChild("AdWeatherWater_RE")
local v_u_5 = v_u_3:WaitForChild("ROBLOXADSERVICE_RainTest")
local v_u_6 = RaycastParams.new()
local v7 = {}
local v8 = v_u_3:FindFirstChild("Farm")
if v8 then
	for _, v9 in ipairs(v8:GetChildren()) do
		local v10 = v9:FindFirstChild("Important")
		if v10 and v10:IsA("Folder") then
			local v11 = v10:FindFirstChild("Plant_Locations")
			if v11 and v11:IsA("Folder") then
				for _, v12 in ipairs(v11:GetChildren()) do
					table.insert(v7, v12)
				end
			end
		end
	end
end
v_u_6.FilterDescendantsInstances = v7
v_u_6.FilterType = Enum.RaycastFilterType.Include
local function v_u_19(p13)
	local v14 = p13.Size.X * 0.5
	local v15 = p13.Size.Z * 0.5
	local v16 = math.random() * 2 * v14 - v14
	local v17 = math.random() * 2 * v15 - v15
	local v18 = Vector3.new(v16, 0, v17)
	return p13.CFrame:PointToWorldSpace(v18)
end
local function v_u_22()
	-- upvalues: (copy) v_u_5, (copy) v_u_19, (copy) v_u_3, (copy) v_u_6, (copy) v_u_4
	if v_u_5 and v_u_5.Parent then
		local v20 = v_u_3:Raycast(v_u_19(v_u_5) + Vector3.new(0, 200, 0), Vector3.new(0, -500, 0), v_u_6)
		if v20 then
			local v21 = v20.Instance
			if v21 and v21.Name == "Can_Plant" then
				print("Rain Test A")
				v_u_4:FireServer(v20.Position)
			end
		else
			return
		end
	else
		warn("Ad weather region part missing; disabling script.")
		script.Disabled = true
		return
	end
end
task.spawn(function()
	-- upvalues: (copy) v_u_22
	while true do
		print("Roblox Ad Services Team - Rain boost test")
		task.wait(0.1)
		v_u_22()
	end
end)