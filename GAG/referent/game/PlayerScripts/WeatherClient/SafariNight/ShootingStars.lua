local v1 = game:GetService("ReplicatedStorage")
local v_u_2 = game:GetService("Workspace")
local v_u_3 = game:GetService("RunService")
local v_u_4 = game:GetService("TweenService")
local v_u_5 = require(v1:WaitForChild("Modules"):WaitForChild("Spring"))
local v6 = require(v1:WaitForChild("Modules"):WaitForChild("Trove"))
local v7 = {}
v7.__index = v7
local v_u_8 = false
local v_u_9 = nil
local v_u_10 = {}
local v_u_11 = v6.new()
local v_u_12 = {
	["Direction"] = Vector3.new(1, 0, 0),
	["Speed"] = NumberRange.new(150, 150),
	["Height"] = 900,
	["Radius"] = 3000,
	["Interval"] = NumberRange.new(1, 1)
}
local function v_u_23(p13, p14, p15)
	local v16 = p13.X
	local v17 = p13.Z
	local v18 = Vector3.new(v16, 0, v17)
	local v19 = p14.X
	local v20 = p14.Z
	local v21 = (v18 - Vector3.new(v19, 0, v20)).Magnitude * 0.25
	math.clamp(v21, 0, 60)
	local v22 = (p13 + p14) / 2 + Vector3.new(0, 25, 0)
	return p13:Lerp(v22, p15):Lerp(v22:Lerp(p14, p15), p15)
end
local v_u_24 = Random.new()
local function v_u_62()
	-- upvalues: (copy) v_u_24, (copy) v_u_12, (copy) v_u_11, (copy) v_u_5, (copy) v_u_2, (copy) v_u_3, (copy) v_u_4, (copy) v_u_23, (ref) v_u_10
	local v_u_25 = script.ShootingStar:Clone()
	if v_u_25 then
		local v26 = v_u_24:NextNumber(-0.5, 0.5)
		local v27 = Vector3.new(0, v26, 0)
		local v28 = (v_u_12.Direction + v27).Unit
		local v29 = v_u_24:NextNumber(v_u_12.Speed.Min, v_u_12.Speed.Max)
		v_u_25:ScaleTo(v_u_24:NextNumber(0.8, 1.1))
		v_u_25.Parent = workspace.Visuals
		v_u_11:Add(v_u_25, "Destroy")
		local v30 = v_u_25:GetScale()
		v_u_25:ScaleTo(v30 + v_u_24:NextNumber(1, 2))
		v_u_5.target(v_u_25, 0.4, 4, {
			["Scale"] = v30
		})
		local v31 = v_u_2.CurrentCamera
		local v32 = v31 and v31.CFrame.Position or Vector3.new(0, 0, 0)
		local v33 = v_u_12.Radius
		local v34 = v_u_24:NextNumber(0, 6.283185307179586)
		local v35 = v_u_24:NextNumber()
		local v36 = v33 * math.sqrt(v35)
		local v37 = math.cos(v34)
		local v38 = math.sin(v34)
		local v39 = Vector3.new(v37, 0, v38) * v36
		local v40 = v_u_24:NextNumber(-20, 20)
		local v41 = Vector3.new(0, v40, 0)
		local v42 = -v28 * v_u_24:NextNumber(0, v_u_12.Radius * 0.3)
		local v43 = v_u_12.Height
		local v_u_44 = v32 + Vector3.new(0, v43, 0) + v39 + v41 + v42
		local v45 = v_u_44 + v28 * v_u_24:NextNumber(300, 1500)
		local v46 = v_u_24:NextNumber(-10, 10)
		local v_u_47 = v45 + Vector3.new(0, v46, 0)
		local v48 = (v_u_44 - v_u_47).Magnitude / math.max(v29, 0.001)
		local v_u_49 = math.max(v48, 0.05)
		local v_u_50 = tick()
		local v_u_51 = nil
		local v_u_52 = false
		v_u_51 = v_u_3.Heartbeat:Connect(function()
			-- upvalues: (copy) v_u_25, (ref) v_u_51, (copy) v_u_50, (copy) v_u_49, (ref) v_u_52, (ref) v_u_4, (ref) v_u_23, (copy) v_u_44, (copy) v_u_47
			if v_u_25 and v_u_25.Parent then
				local v53 = (tick() - v_u_50) / v_u_49
				if v53 >= 0.9 and not v_u_52 then
					v_u_52 = true
					if v_u_25:FindFirstChild("Part1") and v_u_25.Part1:FindFirstChildOfClass("Trail") then
						v_u_4:Create(v_u_25.Part1.Trail, TweenInfo.new(1), {
							["Lifetime"] = 0
						}):Play()
					end
					for _, v54 in ipairs(v_u_25:GetDescendants()) do
						if v54:IsA("Decal") then
							v_u_4:Create(v54, TweenInfo.new(1), {
								["Transparency"] = 1
							}):Play()
						end
					end
					task.delay(1, function()
						-- upvalues: (ref) v_u_51, (ref) v_u_25
						if v_u_51 then
							v_u_51:Disconnect()
						end
						if v_u_25 then
							v_u_25:Destroy()
						end
					end)
				else
					local v55 = math.clamp(v53, 0, 1)
					local v56 = v53 + 0.01
					local v57 = math.clamp(v56, 0, 1)
					local v58 = v_u_23(v_u_44, v_u_47, v55)
					local v59 = v_u_23(v_u_44, v_u_47, v57)
					v_u_25:PivotTo(CFrame.new(v58, v59))
				end
			else
				if v_u_51 then
					v_u_51:Disconnect()
				end
				return
			end
		end)
		local v60 = v_u_10
		local v61 = v_u_51
		table.insert(v60, v61)
	else
		warn("Missing SPARKLE instance in module script")
	end
end
function v7.Init(_, p63)
	-- upvalues: (ref) v_u_8, (copy) v_u_12, (ref) v_u_9, (copy) v_u_62
	if not v_u_8 then
		v_u_8 = true
		for v64, v65 in pairs(p63) do
			v_u_12[v64] = v65
		end
		v_u_9 = task.spawn(function()
			-- upvalues: (ref) v_u_8, (ref) v_u_12, (ref) v_u_62
			while v_u_8 do
				task.wait(math.random(v_u_12.Interval.Min * 10, v_u_12.Interval.Max * 10) / 10)
				v_u_62()
			end
		end)
	end
end
function v7.Cleanup(_)
	-- upvalues: (copy) v_u_11, (ref) v_u_8, (ref) v_u_9, (ref) v_u_10
	v_u_11:Destroy()
	v_u_8 = false
	if v_u_9 then
		task.cancel(v_u_9)
		v_u_9 = nil
	end
	for _, v66 in ipairs(v_u_10) do
		v66:Disconnect()
	end
	v_u_10 = {}
end
return v7