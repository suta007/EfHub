local v1 = game:GetService("ReplicatedStorage")
game:GetService("Players")
local v2 = require(v1.Data.BeeEvent.BeeEventConfig)
require(v1.Data.BeeEvent.BeeRegistry)
require(v1.Modules.Utility.ParticleHelper)
local _ = v2.Enemies.AttackRadius
local v_u_3 = v2.Enemies.AttackCooldownRadius
local v_u_4 = v2.Swarm.HeightMin
local v_u_5 = v2.Swarm.HeightMax
local v_u_6 = v2.Enemies.AttackSpinMaxMagnitude
script.Parent.Parent:WaitForChild("VFX")
return function(p_u_7)
	-- upvalues: (copy) v_u_3, (copy) v_u_5, (copy) v_u_4, (copy) v_u_6
	return function(_, p8, p9)
		-- upvalues: (copy) p_u_7, (ref) v_u_3, (ref) v_u_5, (ref) v_u_4, (ref) v_u_6
		local v10 = {}
		for _, v11 in p9 do
			if v11.Server.TargetPlayer and v11.Server.TargetBee then
				local v12 = p_u_7:GetEntry(v11.Server.TargetPlayer, v11.Server.TargetBee)
				if v12 and v12.Server.Health > 0 then
					if not v10[v12] then
						v10[v12] = {}
					end
					local v13 = v10[v12]
					table.insert(v13, v11)
				end
			end
		end
		for v14, v15 in v10 do
			local v16 = v14.Client.PredictedCFrame or (v14.Client.SmoothedCFrame or v14.Server.CFrame)
			for _, v17 in v15 do
				local v18 = v17.Client.PredictedCFrame or (v17.Client.SmoothedCFrame or v17.Server.CFrame)
				local v19 = (v18.Position - v16.Position) * Vector3.new(1, 0, 1)
				local v20 = v19.Unit * v_u_3
				math.randomseed(v17.Server.Identifier)
				local v21 = math.random() * (v_u_5 - v_u_4) + v_u_4
				local v22 = (v16.Position + v20) * Vector3.new(1, 0, 1) + Vector3.new(0, v21, 0) + v19:Cross(Vector3.new(0, 1, 0)).Unit * math.random() * v_u_6
				local v23 = (v22 - v18.Position).Magnitude
				local v24 = v17.Server.Speed * p8
				if v23 <= v24 then
					v17.Client.PredictedCFrame = CFrame.new(v22)
				else
					v17.Client.PredictedCFrame = v18:Lerp(CFrame.new(v22), v24 / v23)
				end
			end
		end
		for _, v25 in p9 do
			if v25.Client.PredictedCFrame then
				v25.Client.PredictedCFrame = v25.Client.PredictedCFrame:Lerp(v25.Server.CFrame, p8)
			end
			v25.Client.TargetFacingDirection = nil
			v25.Client.LockFacing = false
			if v25.Server.TargetPlayer and v25.Server.TargetBee then
				local v26 = p_u_7:GetEntry(v25.Server.TargetPlayer, v25.Server.TargetBee)
				if v26 and v26.Server.Health > 0 then
					local v27 = v26.Client.PredictedCFrame or (v26.Client.SmoothedCFrame or v26.Server.CFrame)
					local v28 = v25.Client.PredictedCFrame or (v25.Client.SmoothedCFrame or v25.Server.CFrame)
					local v29 = (v27.Position - v28.Position) * Vector3.new(1, 0, 1)
					v25.Client.TargetFacingDirection = v29
					v25.Client.LockFacing = true
				end
			end
		end
	end
end