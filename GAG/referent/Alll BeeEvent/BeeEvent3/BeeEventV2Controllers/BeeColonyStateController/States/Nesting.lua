local v_u_1 = game:GetService("CollectionService")
local v2 = game:GetService("ReplicatedStorage")
local v_u_3 = game:GetService("Players")
local v_u_4 = require(v2.Modules.GetFarmAsync)
local function v_u_12(p5, p6, p7) -- name: FindClosestUnclaimedBeeSlot
	-- upvalues: (copy) v_u_1
	local v8 = 6
	local v9 = nil
	for _, v10 in v_u_1:GetTagged("BeeSlot") do
		if v10:IsA("BasePart") and not p6[v10] then
			local v11 = (v10.Position - p5).Magnitude
			if v11 < v8 and (p7 and v10:IsDescendantOf(p7)) then
				v9 = v10
				v8 = v11
			end
		end
	end
	return v9
end
return function(_)
	-- upvalues: (copy) v_u_3, (copy) v_u_4, (copy) v_u_12
	return function(p13, p14, p15)
		-- upvalues: (ref) v_u_3, (ref) v_u_4, (ref) v_u_12
		local v16 = string.split(p13, "_")
		if v16[1] == "Player" and v16[2] then
			local v17 = v_u_3
			local v18 = v16[2]
			local v19 = v17:GetPlayerByUserId((tonumber(v18)))
			if v19 then
				local v20 = v_u_4(v19)
				local v21
				if v20 then
					v21 = v20:FindFirstChild("CurrentExpansion")
					if v21 then
						v21 = v21:FindFirstChild("Custom")
					end
					if v21 then
						v21 = v21:FindFirstChild("Hive")
					end
				else
					v21 = nil
				end
				local v22 = {}
				for _, v23 in p15 do
					v23.Client.RenderOffset = nil
					local v24 = v23.Client.PredictedCFrame or (v23.Client.SmoothedCFrame or v23.Server.CFrame)
					if not v24 or v24.Position.Magnitude < 0.01 then
						v24 = v23.Server.CFrame
					end
					local v25 = v23.Server.Slot
					if v23.Client.CachedSlotIndex ~= v25 then
						v23.Client.ResolvedSlot = nil
						v23.Client.CachedSlotIndex = v25
					end
					if not v23.Client.ResolvedSlot then
						if v21 then
							if v25 then
								v25 = v21:FindFirstChild((tostring(v25)))
							end
						else
							v25 = v21
						end
						if v25 and v25:IsA("BasePart") then
							v23.Client.ResolvedSlot = v25
						else
							v23.Client.ResolvedSlot = v_u_12(v24.Position, v22)
						end
					end
					local v26 = v23.Client.ResolvedSlot
					if v26 and v22[v26] then
						v26 = nil
					end
					if v26 then
						v22[v26] = true
						local v27 = v26.CFrame * CFrame.Angles(0, 3.141592653589793, 0) * CFrame.new(0, -0.5, 0)
						if v23.Server.DidDie then
							v23.Client.PredictedCFrame = v27
							v23.Client.SmoothedCFrame = v27
							v23.Client.LockFacing = true
						else
							local v28 = (v27.Position - v24.Position).Magnitude
							local v29 = v23.Server.Speed * p14
							if v28 <= v29 or v28 <= 0.08 then
								v23.Client.LockFacing = true
								v23.Client.PredictedCFrame = v27
								v23.Client.TargetFacingDirection = nil
								local v30 = v27.LookVector
								local v31 = v30.X
								local v32 = v30.Z
								local v33 = Vector3.new(v31, 0, v32)
								if v33.Magnitude > 0.001 then
									v23.Client.FacingDirection = v33.Unit
								else
									v23.Client.FacingDirection = nil
								end
							else
								v23.Client.LockFacing = false
								v23.Client.FacingDirection = nil
								local v34 = (v27.Position - v24.Position).Unit
								local v35 = v24.Position + v34 * v29
								local v36 = v34.X
								local v37 = v34.Z
								local v38 = Vector3.new(v36, 0, v37)
								if v38.Magnitude > 0.001 then
									local v39 = v38.Unit
									v23.Client.TargetFacingDirection = v39
									v23.Client.PredictedCFrame = CFrame.lookAt(v35, v35 + v39)
								else
									v23.Client.TargetFacingDirection = nil
									v23.Client.PredictedCFrame = CFrame.lookAt(v35, v27.Position)
								end
							end
						end
					else
						v23.Client.LockFacing = false
						v23.Client.FacingDirection = nil
						v23.Client.TargetFacingDirection = nil
						v23.Client.PredictedCFrame = nil
					end
				end
			else
				warn("Owner of bee in Nesting state has left the game")
			end
		else
			return
		end
	end
end