local v_u_1 = game:GetService("CollectionService")
local v_u_2 = game:GetService("UserInputService")
local v3 = game:GetService("ReplicatedStorage")
local v_u_4 = game:GetService("RunService")
local v5 = game:GetService("Players")
local v_u_6 = require(v3.Modules.OptimisationControllers.IsBadDeviceHeuristic)
local v_u_7 = require(v3.Modules.OptimisationControllers.IsMobile)
local _ = v5.LocalPlayer
local v_u_8 = workspace.CurrentCamera
local v32 = {
	["Start"] = function(_)
		-- upvalues: (copy) v_u_2, (copy) v_u_6, (copy) v_u_7, (copy) v_u_4, (copy) v_u_8, (copy) v_u_1
		v_u_2.InputBegan:Wait()
		task.wait(3)
		local v_u_9 = v_u_6()
		local v_u_10 = v_u_7()
		local v_u_11 = table.create(6)
		local v_u_12 = {}
		local v_u_13 = v_u_10 and 40 or 80
		for _, v14 in workspace.Farm:GetChildren() do
			local v_u_15 = v14.Important.Data.Farm_Number.Value
			local v16 = v14:WaitForChild("Center_Point", 5)
			if v16 then
				v_u_11[v_u_15] = v16:GetPivot()
				local function v19(p17)
					-- upvalues: (copy) v_u_9, (copy) v_u_10, (copy) v_u_15, (copy) v_u_12
					if p17:IsA("ParticleEmitter") or (p17:IsA("Trail") or p17:IsA("Beam")) then
						if v_u_9 or v_u_10 and math.random() <= 0.5 then
							task.delay(0, p17.Destroy, p17)
							return
						end
						p17:AddTag((("%*_Particle"):format(v_u_15)))
						local v18 = v_u_12[v_u_15] == true
						p17.Enabled = v18
						if not v18 and p17.ClassName ~= "Beam" then
							p17:Clear()
						end
					end
				end
				local v20 = v14.Important.Plants_Physical
				v20.DescendantAdded:Connect(v19)
				for _, v21 in v20:GetDescendants() do
					task.spawn(v19, v21)
				end
			else
				print("Center point part not found for farm", v14)
			end
		end
		if not v_u_9 then
			local v_u_22 = 0
			local v_u_23 = nil
			v_u_4.PostSimulation:Connect(function(p24)
				-- upvalues: (ref) v_u_22, (ref) v_u_8, (ref) v_u_23, (copy) v_u_11, (copy) v_u_13, (copy) v_u_12, (ref) v_u_1
				v_u_22 = v_u_22 + p24
				if v_u_22 > 0.1 then
					v_u_22 = 0
					local v25 = v_u_8.CFrame.Position
					local v26 = v25 // 5
					if v_u_23 == nil or v_u_23 ~= v26 then
						v_u_23 = v26
						for v27, v28 in v_u_11 do
							local v29 = v25 - v28.Position
							local v30 = vector.magnitude(v29) <= v_u_13
							if v_u_12[v27] ~= v30 then
								v_u_12[v27] = v30
								for _, v31 in v_u_1:GetTagged((("%*_Particle"):format(v27))) do
									v31.Enabled = v30
									if not v30 and v31.ClassName ~= "Beam" then
										v31:Clear()
									end
								end
							end
						end
					end
				end
			end)
		end
	end
}
task.spawn(v32.Start, v32)
return v32