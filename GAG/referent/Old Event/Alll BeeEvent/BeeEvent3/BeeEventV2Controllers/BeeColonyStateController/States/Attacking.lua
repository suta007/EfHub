local v1 = game:GetService("Players")
local v2 = game:GetService("ReplicatedStorage")
game:GetService("CollectionService")
local _ = v1.LocalPlayer
local v3 = require(v2.Data.BeeEvent.BeeEventConfig)
require(v2.Data.BeeEvent.BeeRegistry)
script.Parent.Parent:WaitForChild("Sounds")
local v_u_4 = v3.Enemies.AttackRadius
local _ = v3.Enemies.AttackCooldownRadius
local v_u_5 = v3.Swarm.HeightMin
local v_u_6 = v3.Swarm.HeightMax
local v_u_7 = v3.Enemies.AttackSpinMaxMagnitude
return function(p_u_8)
	-- upvalues: (copy) v_u_4, (copy) v_u_6, (copy) v_u_5, (copy) v_u_7
	return function(_, p9, p10)
		-- upvalues: (copy) p_u_8, (ref) v_u_4, (ref) v_u_6, (ref) v_u_5, (ref) v_u_7
		local v11 = {}
		for _, v12 in p10 do
			if v12.Server.TargetPlayer and v12.Server.TargetBee then
				local v13 = p_u_8:GetEntry(v12.Server.TargetPlayer, v12.Server.TargetBee)
				if v13 and v13.Server.Health > 0 then
					if not v11[v13] then
						v11[v13] = {}
					end
					local v14 = v11[v13]
					table.insert(v14, v12)
				end
			end
		end
		workspace:GetServerTimeNow()
		for v15, v16 in v11 do
			local v17 = v15.Client.PredictedCFrame or (v15.Client.SmoothedCFrame or v15.Server.CFrame)
			for _, v18 in v16 do
				local v19 = v18.Client.PredictedCFrame or (v18.Client.SmoothedCFrame or v18.Server.CFrame)
				local v20 = (v19.Position - v17.Position) * Vector3.new(1, 0, 1)
				local v21 = v20.Unit * v_u_4
				math.randomseed(v18.Server.Identifier)
				local v22 = math.random() * (v_u_6 - v_u_5) / 2 + v_u_5
				local v23 = (v17.Position + v21) * Vector3.new(1, 0, 1) + Vector3.new(0, v22, 0) + v20:Cross(Vector3.new(0, 1, 0)).Unit * math.random() * v_u_7
				local v24 = (v23 - v19.Position).Magnitude
				local v25 = v18.Server.Speed * p9 * 2
				if v24 <= v25 then
					v18.Client.PredictedCFrame = CFrame.new(v23)
				else
					v18.Client.PredictedCFrame = v19:Lerp(CFrame.new(v23), v25 / v24)
				end
			end
		end
		for _, v26 in p10 do
			if v26.Client.PredictedCFrame then
				v26.Client.PredictedCFrame = v26.Client.PredictedCFrame:Lerp(v26.Server.CFrame, p9)
			end
			v26.Client.TargetFacingDirection = nil
			v26.Client.LockFacing = false
			if v26.Server.TargetBee and v26.Server.TargetPlayer then
				local v27 = p_u_8:GetEntry(v26.Server.TargetPlayer, v26.Server.TargetBee)
				if v27 and v27.Server.Health > 0 then
					local v28 = v27.Client.PredictedCFrame or (v27.Client.SmoothedCFrame or v27.Server.CFrame)
					local v29 = v26.Client.PredictedCFrame or (v26.Client.SmoothedCFrame or v26.Server.CFrame)
					local v30 = (v28.Position - v29.Position) * Vector3.new(1, 0, 1)
					v26.Client.TargetFacingDirection = v30
					v26.Client.LockFacing = true
				end
			end
		end
	end
end