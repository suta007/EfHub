local v1 = {}
require(game.ReplicatedStorage.Code.SolveIK)
local v_u_2 = game.Players.LocalPlayer
local v_u_3 = {}
local v_u_4 = false
local function v_u_29(p5)
	-- upvalues: (copy) v_u_2, (ref) v_u_4
	local v6 = p5 or v_u_2.Character
	repeat
		task.wait()
	until v6:IsDescendantOf(workspace)
	if not v6:GetAttribute("Shaking") then
		v6:SetAttribute("Shaking", true)
		local v7 = v6:WaitForChild("Torso")
		local v8 = v7:WaitForChild("Neck")
		local v9 = v7:WaitForChild("Left Shoulder")
		local v10 = v7:WaitForChild("Right Shoulder")
		local v11 = v7:WaitForChild("Left Hip")
		local v12 = v7:WaitForChild("Right Hip")
		local v13 = v9.C0
		local v14 = v10.C0
		local v15 = v11.C0
		local v16 = v12.C0
		local v17 = v8.C0
		local v18 = 0
		while v6:IsDescendantOf(workspace) and v_u_4 do
			task.wait(0)
			v18 = v18 + 1
			local v19 = CFrame.Angles
			local v20 = math.sin(v18) * 1
			v9.C0 = v13 * v19(0, math.rad(v20), 0)
			local v21 = CFrame.Angles
			local v22 = math.sin(v18) * -1
			v10.C0 = v14 * v21(0, math.rad(v22), 0)
			local v23 = CFrame.Angles
			local v24 = math.sin(v18) * -1
			v12.C0 = v16 * v23(0, math.rad(v24), 0)
			local v25 = CFrame.Angles
			local v26 = math.sin(v18) * 1
			v11.C0 = v15 * v25(0, math.rad(v26), 0)
			local v27 = CFrame.Angles
			local v28 = math.sin(v18) * 1
			v8.C0 = v17 * v27(0, 0, (math.rad(v28)))
		end
		v9.C0 = v13
		v10.C0 = v14
		v11.C0 = v15
		v12.C0 = v16
		v8.C0 = v17
		v6:SetAttribute("Shaking", false)
	end
end
function v1.EnableShaking()
	-- upvalues: (copy) v_u_2, (copy) v_u_29, (copy) v_u_3, (ref) v_u_4
	if v_u_2.Character then
		task.spawn(v_u_29)
	end
	local v30 = v_u_3
	local v31 = v_u_2.CharacterAdded
	local v32 = v_u_29
	table.insert(v30, v31:Connect(v32))
	v_u_4 = true
end
function v1.DisableShaking()
	-- upvalues: (copy) v_u_3, (ref) v_u_4
	for _, v33 in v_u_3 do
		v33:Disconnect()
	end
	v_u_4 = false
end
return v1