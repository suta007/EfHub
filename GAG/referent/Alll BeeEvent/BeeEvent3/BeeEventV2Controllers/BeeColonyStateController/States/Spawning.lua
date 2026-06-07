local v1 = game:GetService("ReplicatedStorage")
local v_u_2 = game:GetService("Players")
local v3 = require(v1.Data.BeeEvent.BeeEventConfig)
local v_u_4 = require(v1.Modules.GetFarm)
local v_u_5 = require(v1.Modules.BeeEventV2Controllers.BeeColonyStateController.Util.BeeVFXPlayer)
local v_u_6 = v3.Spawning.SpawnDuration
local function v_u_13(p7) -- name: GetBodyOffsetCFrame
	local v8 = p7.Client.NestingBodyOffset
	if v8 then
		return v8
	end
	local v9 = p7.Client.Model
	local v10 = p7.Client.Hitbox
	if not (v9 and (v10 and v9.PrimaryPart)) then
		return CFrame.identity
	end
	local v11 = v9:GetBoundingBox().Position - v10.Position
	local v12 = v10.CFrame:VectorToObjectSpace(v11)
	p7.Client.NestingBodyOffset = CFrame.new(-v12)
	return p7.Client.NestingBodyOffset
end
return function(_)
	-- upvalues: (copy) v_u_2, (copy) v_u_4, (copy) v_u_13, (copy) v_u_6, (copy) v_u_5
	return function(p14, p15, p16)
		-- upvalues: (ref) v_u_2, (ref) v_u_4, (ref) v_u_13, (ref) v_u_6, (ref) v_u_5
		local v17 = string.split(p14, "_")
		local v18
		if v17[1] == "Player" and v17[2] then
			local v19 = v_u_2
			local v20 = v17[2]
			local v21 = v19:GetPlayerByUserId((tonumber(v20)))
			if not v21 then
				return
			end
			local v22 = v_u_4(v21)
			if v22 then
				v18 = v22:FindFirstChild("CurrentExpansion")
				if v18 then
					v18 = v18:FindFirstChild("Custom")
				end
				if v18 then
					v18 = v18:FindFirstChild("Hive")
				end
			else
				v18 = nil
			end
		else
			v18 = nil
		end
		for _, v23 in p16 do
			local v24 = v23.Client.Model
			if v24 and v24.Parent then
				local v25 = v23.Server.Slot
				local v26 = nil
				local v27
				if v18 and v25 then
					v27 = v18:FindFirstChild((tostring(v25)))
					if v27 then
						if not v27:IsA("BasePart") then
							v27 = v26
						end
					else
						v27 = v26
					end
				else
					v27 = v26
				end
				if v24:GetAttribute("OriginalScale") == nil then
					v24:SetAttribute("OriginalScale", v24:GetScale())
				end
				if v27 then
					local v28 = v27.CFrame * CFrame.Angles(0, 3.141592653589793, 0) * v_u_13(v23)
					v23.Client.LockFacing = true
					v23.Client.FacingDirection = nil
					v23.Client.RenderOffset = nil
					v23.Client.SmoothedCFrame = v28
					v23.Client.FromCFrame = v28
					v23.Client.ToCFrame = v28
					v23.Client.PredictedCFrame = v28
					v23.Client.LerpAlpha = 1
				else
					v23.Client.PredictedCFrame = nil
				end
				if v23.Client.SpawnElapsed == nil then
					v23.Client.SpawnElapsed = 0
					v23.Client.IsSpawning = true
					v24:ScaleTo(0.0001)
				end
				local v29 = v23.Client
				local v30 = v23.Client.SpawnElapsed + p15
				local v31 = v_u_6
				v29.SpawnElapsed = math.min(v30, v31)
				if typeof(p14) == "Instance" then
					local v32 = v23.Client.SpawnElapsed / v_u_6
					v24:ScaleTo(0.0001 + (v24:GetAttribute("OriginalScale") - 0.0001) * v32)
				end
				if v_u_6 <= v23.Client.SpawnElapsed then
					v24:ScaleTo(v24:GetAttribute("OriginalScale"))
					v23.Client.IsSpawning = nil
					v_u_5:PlayBeeVFX(v23.Client.Model)
				end
			end
		end
	end
end