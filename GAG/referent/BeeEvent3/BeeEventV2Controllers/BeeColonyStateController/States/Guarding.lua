local v1 = game:GetService("Players")
local v2 = game:GetService("ReplicatedStorage")
game:GetService("CollectionService")
local _ = v1.LocalPlayer
local v3 = require(v2.Data.BeeEvent.BeeEventConfig)
local _ = v3.Enemies.GuardRadius
local v_u_4 = v3.Swarm.BobAmplitude
local v_u_5 = v3.Swarm.BobFrequency
local _ = v3.Enemies.AlertRadius
return function(_)
	-- upvalues: (copy) v_u_5, (copy) v_u_4
	return function(_, _, p6)
		-- upvalues: (ref) v_u_5, (ref) v_u_4
		for _, v7 in p6 do
			if v7.Server.GuardObject and v7.Server.GuardObject:IsA("PVInstance") then
				local v8 = workspace:GetServerTimeNow()
				local v9 = v7.Server.Identifier * 2.39996 % 6.283185307179586
				local v10 = v8 * v_u_5 + v9
				local v11 = math.sin(v10) * v_u_4
				v7.Client.RenderOffset = CFrame.new(0, v11, 0)
				v7.Client.LockFacing = false
				v7.Client.TargetFacingDirection = nil
				v7.Client.PredictedCFrame = nil
			else
				warn("\"Guarding\" state must have a PVInstance set in the Custom field")
			end
		end
	end
end