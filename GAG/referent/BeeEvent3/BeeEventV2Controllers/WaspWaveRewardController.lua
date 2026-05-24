local v1 = game:GetService("ReplicatedStorage")
game:GetService("CollectionService")
game:GetService("Players")
game:GetService("RunService")
game:GetService("TweenService")
local v_u_2 = v1.Assets.HoneyJar
require(v1.Modules.SoundPlayer)
local v38 = {
	["SpawnRewards"] = function(_, p_u_3, p_u_4) -- name: SpawnRewards
		-- upvalues: (copy) v_u_2
		local v_u_5 = v_u_2:Clone()
		v_u_5:PivotTo(CFrame.new(p_u_3))
		v_u_5.Parent = workspace
		local v6 = RaycastParams.new()
		v6.FilterType = Enum.RaycastFilterType.Include
		v6.FilterDescendantsInstances = { workspace.BasePlate.TopBaseplate }
		local v7 = workspace:Raycast(p_u_3 + Vector3.new(0, 1, 0), Vector3.new(0, -50, 0))
		local v8 = v7 and v7.Position.Y or p_u_3.Y - 2
		local v9 = p_u_3.X
		local v10 = v8 + 1.5
		local v11 = p_u_3.Z
		local v_u_12 = Vector3.new(v9, v10, v11)
		local v_u_13 = Instance.new("PointLight")
		v_u_13.Brightness = 2
		v_u_13.Range = 16
		v_u_13.Color = Color3.fromRGB(255, 180, 40)
		v_u_13.Parent = v_u_5.PrimaryPart
		local v_u_14 = game:GetService("RunService")
		local v_u_15 = 0
		local v_u_16 = nil
		v_u_16 = v_u_14.Heartbeat:Connect(function(p17)
			-- upvalues: (ref) v_u_15, (copy) p_u_3, (copy) v_u_12, (copy) v_u_5, (copy) v_u_13, (copy) v_u_14, (ref) v_u_16, (copy) p_u_4
			v_u_15 = v_u_15 + p17
			local v18 = v_u_15 / 0.45
			local v19 = math.clamp(v18, 0, 1)
			local v20 = p_u_3.Y
			local v21 = v_u_12.Y
			local v22 = v19 * v19 * v19 * v19
			local v23 = math.lerp(v20, v21, v22)
			v_u_5:PivotTo(CFrame.new(p_u_3.X, v23, p_u_3.Z))
			local v24 = v_u_13
			local v25 = 1 - v19
			local v26 = 1 - v25 * v25 * v25 * v25
			v24.Brightness = math.lerp(2, 1.5, v26)
			if v19 >= 1 then
				v_u_13.Brightness = 8
				v_u_13.Range = 25.6
				local v_u_27 = 0
				local v_u_28 = nil
				v_u_28 = v_u_14.Heartbeat:Connect(function(p29)
					-- upvalues: (ref) v_u_27, (ref) v_u_13, (ref) v_u_28
					v_u_27 = v_u_27 + p29
					local v30 = v_u_27 / 0.4
					local v31 = math.clamp(v30, 0, 1)
					local v32 = v_u_13
					local v33 = 1 - v31
					local v34 = 1 - v33 * v33 * v33 * v33
					v32.Brightness = math.lerp(8, 1.5, v34)
					local v35 = v_u_13
					local v36 = 1 - v31
					local v37 = 1 - v36 * v36 * v36 * v36
					v35.Range = math.lerp(25.6, 16, v37)
					if v31 >= 1 then
						v_u_28:Disconnect()
					end
				end)
				v_u_16:Disconnect()
				v_u_5:AddTag("HoneyJarReward")
				v_u_5:SetAttribute("Ticket", p_u_4)
			end
		end)
	end,
	["Start"] = function(_) -- name: Start end
}
task.spawn(v38.Start, v38)
return v38