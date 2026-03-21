local v_u_1 = game:GetService("RunService")
local v_u_2 = workspace:FindFirstChildOfClass("Terrain")
local v_u_3 = {}
local v_u_40 = {
	["UpdateQueue"] = table.create(10),
	["Init"] = function(_, p4)
		-- upvalues: (copy) v_u_40, (copy) v_u_1
		v_u_40.Lifetime = p4.Lifetime or 3
		v_u_40.Direction = p4.Direction or Vector3.new(1, 0, 0)
		v_u_40.Speed = p4.Speed or 6
		v_u_40.Color = p4.Color or Color3.fromRGB(255, 255, 255)
		if v_u_40.UpdateConnection then
			v_u_40.UpdateConnection:Disconnect()
			v_u_40.UpdateConnection = nil
		end
		for _, v5 in ipairs(v_u_40.UpdateQueue) do
			v5.Attachment0:Destroy()
			v5.Attachment1:Destroy()
			v5.Trail:Destroy()
		end
		table.clear(v_u_40.UpdateQueue)
		v_u_40.LastSpawned = os.clock()
		local v_u_6 = 1 / (p4.SpawnRate or 25)
		local v_u_7 = os.clock()
		v_u_40.UpdateConnection = v_u_1.Heartbeat:Connect(function()
			-- upvalues: (ref) v_u_40, (copy) v_u_6, (ref) v_u_7
			local v8 = os.clock()
			if v_u_6 < v8 - v_u_40.LastSpawned then
				v_u_40:Create()
				v_u_40.LastSpawned = v8
			end
			if v8 - v_u_7 >= 0.04 then
				v_u_7 = v8
				for v9, v10 in ipairs(v_u_40.UpdateQueue) do
					local v11 = v8 - v10.StartClock
					if v10.Lifetime <= v11 then
						v10.Attachment0:Destroy()
						v10.Attachment1:Destroy()
						v10.Trail:Destroy()
						local v12 = #v_u_40.UpdateQueue
						v_u_40.UpdateQueue[v9] = v_u_40.UpdateQueue[v12]
						v_u_40.UpdateQueue[v12] = nil
					else
						v10.Trail.MaxLength = 80 - 100 * (v11 / v10.Lifetime)
						local v13 = (v8 + v10.Seed) * (v10.Speed * 0.05)
						local v14 = v10.Position
						local v15 = v10.Attachment0
						local v16 = (CFrame.new(v14, v14 + v10.Direction) * CFrame.new(0, 0, v10.Speed * -v11)).Position
						local v17 = math.sin(v13) * 0.5
						local v18 = math.sin(v13) * 0.8
						local v19 = math.sin(v13) * 0.5
						v15.WorldPosition = v16 + Vector3.new(v17, v18, v19)
						v10.Attachment1.WorldPosition = v10.Attachment0.WorldPosition + Vector3.new(0, 0.65, 0)
					end
				end
			end
		end)
	end,
	["Cleanup"] = function(_)
		-- upvalues: (copy) v_u_40
		if v_u_40.UpdateConnection then
			v_u_40.UpdateConnection:Disconnect()
			v_u_40.UpdateConnection = nil
		end
		for _, v20 in ipairs(v_u_40.UpdateQueue) do
			v20.Attachment0:Destroy()
			v20.Attachment1:Destroy()
			v20.Trail:Destroy()
		end
		table.clear(v_u_40.UpdateQueue)
	end,
	["Create"] = function(_, p21)
		-- upvalues: (copy) v_u_3, (copy) v_u_40, (copy) v_u_2
		local v22 = p21 or v_u_3
		local v23 = v22.Lifetime or v_u_40.Lifetime
		local v24 = v22.Position
		if not v24 then
			local v25 = workspace.CurrentCamera.CFrame
			local v26 = CFrame.Angles
			local v27 = math.random(-30, 70)
			local v28 = math.rad(v27)
			local v29 = math.random(-80, 80)
			v24 = v25 * v26(v28, math.rad(v29), 0) * CFrame.new(0, 0, math.random(200, 600) * -0.3).Position
		end
		local v30 = v22.Direction or v_u_40.Direction
		local v31 = v22.Speed or v_u_40.Speed
		local v32 = v22.Color or v_u_40.Color
		if v31 > 0 then
			local v33 = Instance.new("Attachment")
			local v34 = Instance.new("Attachment")
			local v35 = Instance.new("Trail")
			v35.Attachment0 = v33
			v35.Attachment1 = v34
			v35.WidthScale = NumberSequence.new({
				NumberSequenceKeypoint.new(0, 0),
				NumberSequenceKeypoint.new(0.1, 1),
				NumberSequenceKeypoint.new(0.4, 1),
				NumberSequenceKeypoint.new(1, 0)
			})
			v35.Transparency = NumberSequence.new({
				NumberSequenceKeypoint.new(0, 1),
				NumberSequenceKeypoint.new(0.15, 0.75),
				NumberSequenceKeypoint.new(0.85, 0.75),
				NumberSequenceKeypoint.new(1, 1)
			})
			v33.WorldPosition = v24
			v34.WorldPosition = v24 + Vector3.new(0, 0.65, 0)
			v33.Parent = v_u_2
			v34.Parent = v_u_2
			v35.LightInfluence = 1
			v35.LightEmission = 1
			v35.Color = ColorSequence.new({ ColorSequenceKeypoint.new(0, v32), ColorSequenceKeypoint.new(1, v32) })
			v35.FaceCamera = true
			v35.Texture = "rbxassetid://137241715738629"
			v35.Parent = v33
			local v36 = {
				["Attachment0"] = v33,
				["Attachment1"] = v34,
				["Trail"] = v35,
				["Lifetime"] = v23 + math.random(-10, 10) * 0.1,
				["Position"] = v24,
				["Direction"] = v30,
				["Speed"] = v31 + math.random(-10, 10) * 0.1,
				["StartClock"] = os.clock(),
				["Seed"] = math.random(1, 1000) * 0.1
			}
			local v37 = (v36.StartClock + v36.Seed) * (v36.Speed * 0.2)
			local v38 = v33.WorldPosition
			local v39 = math.sin(v37) * 0.8
			v33.WorldPosition = v38 + Vector3.new(0, v39, 0)
			v_u_40.UpdateQueue[#v_u_40.UpdateQueue + 1] = v36
		end
	end
}
return v_u_40