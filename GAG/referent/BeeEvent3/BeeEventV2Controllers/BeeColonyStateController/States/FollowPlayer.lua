local v_u_1 = game:GetService("Players")
local v2 = game:GetService("ReplicatedStorage")
local v_u_3 = game:GetService("CollectionService")
local v_u_4 = v_u_1.LocalPlayer
local v5 = require(v2.Data.BeeEvent.BeeEventConfig)
local v_u_6 = require(v2.Modules.Settings.SettingsService)
local v_u_7 = script.Parent.Parent:WaitForChild("Sounds")
local v_u_8 = v5.Swarm.SpreadBase
local v_u_9 = v5.Swarm.SpreadPerBee
local v_u_10 = v5.Swarm.HeightMin
local v_u_11 = v5.Swarm.HeightMax
local v_u_12 = v5.Swarm.BobAmplitude
local v_u_13 = v5.Swarm.BobFrequency
local v_u_14 = Random.new()
local v_u_15 = {
	"RandomBuzz1",
	"RandomBuzz2",
	"RandomBuzz3",
	"RandomBuzz4",
	"RandomBuzz5",
	"RandomBuzz6"
}
local function v_u_23(p16) -- name: IsInBeeEventZone
	-- upvalues: (copy) v_u_3
	for _, v17 in v_u_3:GetTagged("BeeEventBounds") do
		if v17:IsA("BasePart") and v17:IsDescendantOf(workspace) then
			local v18 = v17.CFrame:PointToObjectSpace(p16)
			local v19 = v17.Size * 0.5
			local v20 = v18.X
			local v21
			if math.abs(v20) <= v19.X then
				local v22 = v18.Z
				v21 = math.abs(v22) <= v19.Z
			else
				v21 = false
			end
			if v21 then
				return true
			end
		end
	end
	return false
end
local function v_u_31(p24) -- name: PlayRandomBuzz
	-- upvalues: (copy) v_u_14, (copy) v_u_15, (copy) v_u_7
	local v25 = p24.Client
	local v26 = v25.Hitbox
	if v26 then
		local v27 = os.clock()
		if v25.LastRandomBuzzAt and v27 - v25.LastRandomBuzzAt < 3 then
			return
		elseif v_u_14:NextNumber() > 0.1 then
			return
		else
			v25.LastRandomBuzzAt = v27
			local v28 = v_u_15[v_u_14:NextInteger(1, #v_u_15)]
			local v29 = v_u_7:FindFirstChild(v28)
			if v29 and v29:IsA("Sound") then
				local v_u_30 = v29:Clone()
				v_u_30.Name = v28
				v_u_30.Looped = false
				v_u_30.Parent = v26
				v_u_30:Play()
				v_u_30.Ended:Once(function()
					-- upvalues: (copy) v_u_30
					v_u_30:Destroy()
				end)
				task.delay(2, function()
					-- upvalues: (copy) v_u_30
					if v_u_30.Parent then
						v_u_30:Destroy()
					end
				end)
			end
		end
	else
		return
	end
end
local function v_u_43(p32, p33, p34) -- name: MoveEntryTowardCFrame
	-- upvalues: (copy) v_u_31
	local v35 = p32.Client.PredictedCFrame or (p32.Client.SmoothedCFrame or p32.Server.CFrame)
	if not v35 or v35.Position.Magnitude < 0.01 then
		v35 = p32.Server.CFrame
	end
	if v35 and v35.Position.Magnitude >= 0.01 then
		local v36 = (p33.Position - v35.Position).Magnitude
		local v37 = p32.Client.RandomBuzzWasMoving == true
		local v38
		if v37 then
			v38 = v36 > 0.05
		else
			v38 = v36 > 0.2
		end
		if v38 and not v37 then
			v_u_31(p32)
		end
		p32.Client.RandomBuzzWasMoving = v38
		if v36 < 0.01 then
			p32.Client.PredictedCFrame = p33
			p32.Client.RandomBuzzWasMoving = false
			return
		else
			local v39 = p32.Server.Speed * p34
			if v36 <= v39 then
				p32.Client.PredictedCFrame = p33
			else
				local v40 = v39 / v36
				local v41 = v35.Position:Lerp(p33.Position, v40)
				local v42 = p33.Position
				if (v42 - v41).Magnitude < 0.01 then
					v42 = v41 + p33.LookVector
				end
				p32.Client.PredictedCFrame = CFrame.new(v41, v42)
			end
		end
	else
		p32.Client.PredictedCFrame = p33
		p32.Client.RandomBuzzWasMoving = false
		return
	end
end
local function v_u_57(p44, p45, p46, p47) -- name: GetPlayerFollowTargetCFrame
	-- upvalues: (copy) v_u_10, (copy) v_u_11
	local v48 = p44.Server.Identifier
	local v49 = (v48 * 2.39996 % 1 - 0.5) * p46 * 2
	local v50 = (v48 * 3.14159 % 1 - 0.5) * p46 * 2
	local v51 = v_u_10 + v48 * 1.61803 % 1 * (v_u_11 - v_u_10)
	local v52 = p45 + Vector3.new(v49, v51, v50)
	local v53 = p47.X
	local v54 = v52.Y
	local v55 = p47.Z
	local v56 = Vector3.new(v53, v54, v55)
	return CFrame.new(v52, v56)
end
return function(_)
	-- upvalues: (copy) v_u_1, (copy) v_u_4, (copy) v_u_8, (copy) v_u_9, (copy) v_u_6, (copy) v_u_23, (copy) v_u_13, (copy) v_u_12, (copy) v_u_57, (copy) v_u_43
	return function(p58, p59, p60)
		-- upvalues: (ref) v_u_1, (ref) v_u_4, (ref) v_u_8, (ref) v_u_9, (ref) v_u_6, (ref) v_u_23, (ref) v_u_13, (ref) v_u_12, (ref) v_u_57, (ref) v_u_43
		local v61 = string.split(p58, "_")
		if v61[1] == "Player" and v61[2] then
			local v62 = v_u_1
			local v63 = v61[2]
			local v64 = v62:GetPlayerByUserId((tonumber(v63)))
			if v64 then
				local v65 = workspace:GetServerTimeNow()
				local v66 = v64 == v_u_4
				local v67 = v64.Character
				if v67 then
					v67 = v67:FindFirstChild("HumanoidRootPart")
				end
				local v68 = 0
				for _ in p60 do
					v68 = v68 + 1
				end
				local v69 = v_u_8 + v68 * v_u_9
				local v70 = v_u_4:GetAttribute("BeeColonyFollowPlayer")
				local v71
				if v70 == nil then
					local v_u_72 = "BeeColonyFollowPlayer"
					local v73, v74 = pcall(function()
						-- upvalues: (ref) v_u_6, (copy) v_u_72
						return v_u_6:GetSetting(v_u_72)
					end)
					v71 = (not v73 or v74 == nil) and true or v74 == true
				else
					v71 = v70 == true
				end
				local v75
				if v66 and (v71 and v67) then
					v75 = v67.Position
					if v_u_23(v75) then
						local v76 = v67.CFrame.LookVector
						local v77 = v76.X
						local v78 = v76.Z
						local v79 = Vector3.new(v77, 0, v78)
						if v79.Magnitude > 0.001 then
							v75 = v75 - v79.Unit * 20
						end
					end
				else
					v75 = nil
				end
				for _, v80 in p60 do
					v80.Client.TargetFacingDirection = nil
					v80.Client.FacingDirection = nil
					local v81 = v80.Server.Identifier * 2.39996 % 6.283185307179586
					local v82 = v65 * v_u_13 + v81
					local v83 = math.sin(v82) * v_u_12
					v80.Client.RenderOffset = CFrame.new(0, v83, 0)
					v80.Client.LockFacing = false
					if v66 and v75 then
						v_u_43(v80, v_u_57(v80, v75, v69, v64.Character:GetPivot().Position), p59)
					else
						v80.Client.PredictedCFrame = nil
						v80.Client.RandomBuzzWasMoving = false
					end
				end
			end
		else
			return
		end
	end
end