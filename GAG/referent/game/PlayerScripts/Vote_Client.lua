local v1 = game:GetService("ReplicatedStorage")
local v_u_2 = game:GetService("HttpService")
local v_u_3 = require(v1.Modules.SoundPlayer)
local v_u_4 = require(v1.Data.SoundData)
local v_u_5 = require(v1.Modules.Trove)
local v_u_6 = require(v1.Modules.Spring)
local v_u_7 = {
	["Default"] = {
		Color3.fromRGB(196, 40, 28),
		Color3.fromRGB(33, 84, 185),
		Color3.fromRGB(52, 142, 64),
		Color3.fromRGB(255, 255, 0),
		Color3.fromRGB(98, 37, 209),
		Color3.fromRGB(255, 99, 37)
	},
	["Zen"] = {
		Color3.fromRGB(175, 38, 40),
		Color3.fromRGB(0, 255, 0),
		Color3.fromRGB(27, 135, 175),
		Color3.fromRGB(255, 176, 0),
		Color3.fromRGB(255, 102, 204)
	}
}
workspace:GetServerTimeNow()
local v_u_8 = nil
local function v_u_83(p9)
	-- upvalues: (ref) v_u_8, (copy) v_u_5, (copy) v_u_2, (copy) v_u_6, (copy) v_u_7, (copy) v_u_3, (copy) v_u_4
	if v_u_8 then
		v_u_8:Destroy()
		v_u_8 = nil
	end
	local v_u_10 = v_u_5.new()
	v_u_8 = v_u_10
	local v11 = v_u_2:JSONDecode(p9)
	local v12 = v11[1]
	local v13 = v11[2]
	local v_u_14 = tonumber(v13)
	local v15 = v11[3]
	local v_u_16 = v11[4]
	local v17 = v11[5]
	local v18 = v11[6]
	local v_u_19 = script.Theme[v15].Header:Clone()
	v_u_19.PrimaryPart.Countdown.Title.Text = v12
	v_u_10:Add(task.delay(0.2, function()
		-- upvalues: (copy) v_u_19, (ref) v_u_6
		local v20 = v_u_19:GetPivot()
		v_u_19:PivotTo(v_u_19:GetPivot() + Vector3.new(0, 50, 0))
		v_u_19.Parent = workspace
		v_u_6.target(v_u_19, 0.6, 1, {
			["Pivot"] = v20
		})
	end))
	local v_u_21 = {}
	local v_u_22 = false
	for v23, v24 in v17 do
		local v25 = script.Theme[v15].Pad:Clone()
		v25.Parent = workspace
		if not v25.PrimaryPart then
			v25.PrimaryPart = v25:FindFirstChildWhichIsA("BasePart")
		end
		local v26 = (v23 - (#v17 + 1) / 2) * (7 + v25.PrimaryPart.Size.X)
		v25:PivotTo(CFrame.new(Vector3.new(-17.5, 0.5, -13.5), Vector3.new(-17.5, 0.5, -13.5) + v25:GetPivot().LookVector) * CFrame.new(v26, 0, 0))
		v25.Parent = workspace
		v25.GlobalVotes.SurfaceGui.Enabled = v18 and true or false
		v25.LocalVotes.Title.TextLabel.Text = v24
		local v27 = v_u_7[v15][v23 % #v_u_7[v15] + 1]
		if v15 == "Zen" then
			v25.color.Color = v27
			v25.LocalVotes.Color = v27
			v25.GlobalVotes.Color = v27
		end
		for _, v_u_28 in v25:GetChildren() do
			if v_u_28:IsA("BasePart") then
				if v15 ~= "Zen" and v_u_28.Name ~= "ignore" then
					if v_u_28.Name == "desaturate" then
						local v29 = math.clamp(0.7, 0, 1)
						v_u_28.Color = Color3.new(v27.R * v29, v27.G * v29, v27.B * v29)
					else
						v_u_28.Color = v27
					end
				end
				local v30 = v_u_28.CFrame
				v_u_28.Position = v_u_28.Position + Vector3.new(0, 50, 0)
				local v31 = v_u_28.CFrame
				local v32 = CFrame.Angles
				local v33 = math.random(-30, 30)
				local v34 = math.rad(v33)
				local v35 = math.random(-30, 30)
				local v36 = math.rad(v35)
				local v37 = math.random(-30, 30)
				v_u_28.CFrame = v31 * v32(v34, v36, (math.rad(v37)))
				v_u_6.target(v_u_28, 0.9, math.random(100) / 25 + 0.5, {
					["CFrame"] = v30
				})
				v_u_28.CanCollide = false
				task.delay(1, function()
					-- upvalues: (copy) v_u_28
					v_u_28.CanCollide = true
				end)
			end
		end
		v_u_21[v24] = v25
	end
	local function v44()
		-- upvalues: (ref) v_u_2, (ref) v_u_21, (copy) v_u_19
		local v38 = nil
		local v39 = 0
		local v40 = workspace:GetAttribute("VoteOptions")
		if v40 then
			local v41 = v_u_2:JSONDecode(v40)
			if v41 then
				for v42, v43 in v41 do
					v_u_21[v42].LocalVotes.VoteCount.TextLabel.Text = ("Voters: %*"):format((tostring(v43)))
					if v39 < v43 then
						v38 = v42
						v39 = v43
					end
				end
			end
		end
		v_u_19.PrimaryPart.SurfaceGui.TextLabel.Text = not v38 and "TIED" or ("Winning: %*"):format(v38)
	end
	v_u_10:Add(workspace:GetAttributeChangedSignal("VoteOptions"):Connect(v44), "Disconnect")
	v44()
	v_u_10:Add(workspace:GetAttributeChangedSignal("VoteWinner"):Once(function()
		-- upvalues: (copy) v_u_10
		if workspace:GetAttribute("VoteWinner") then
			v_u_10:Destroy()
		end
	end))
	v_u_10:Add(workspace:GetAttributeChangedSignal("VoteDestroy"):Once(function()
		-- upvalues: (copy) v_u_10
		if workspace:GetAttribute("VoteDestroy") then
			v_u_10:Destroy()
		end
	end))
	local v_u_45 = v_u_16 - tick()
	v_u_10:Add(task.spawn(function()
		-- upvalues: (ref) v_u_22, (copy) v_u_45, (copy) v_u_16, (copy) v_u_14, (copy) v_u_19, (copy) v_u_10
		while not v_u_22 do
			task.wait(1)
			local v46 = tick() + v_u_45
			local v47 = v_u_16 + v_u_14 - v46
			local v48 = math.max(0, v47)
			local v49 = v48 / 60
			local v50 = math.floor(v49)
			local v51 = v48 % 60
			local v52 = math.floor(v51)
			v_u_19.PrimaryPart.Countdown.Timer.Text = string.format("%02d:%02d", v50, v52)
			if v48 <= 0 then
				v_u_10:Destroy()
			end
		end
	end))
	v_u_10:Add(function()
		-- upvalues: (ref) v_u_22, (ref) v_u_21, (ref) v_u_3, (ref) v_u_4, (copy) v_u_19, (ref) v_u_6
		v_u_22 = true
		local v_u_53 = workspace:GetAttribute("VoteWinner")
		task.spawn(function()
			-- upvalues: (copy) v_u_53, (ref) v_u_21, (ref) v_u_3, (ref) v_u_4, (ref) v_u_19, (ref) v_u_6
			if v_u_53 then
				for _, v54 in v_u_21[v_u_53]:GetDescendants() do
					if v54:IsA("ParticleEmitter") then
						v54:Emit(5)
					end
				end
				local v55 = {
					["RollOffMaxDistance"] = 60,
					["RollOffMinDistance"] = 5,
					["RollOffMode"] = Enum.RollOffMode.Linear,
					["Volume"] = 0.7,
					["PlaybackSpeed"] = 1
				}
				local v56 = v_u_3:PlaySound(v_u_4.Vote_Client.Sound, v55, nil, v_u_21[v_u_53])
				game:GetService("Debris"):AddItem(v56, 2)
				task.wait(2)
				v_u_19.PrimaryPart.Countdown.Enabled = false
				for _, v57 in v_u_19:GetDescendants() do
					if v57:IsA("BasePart") then
						local v58 = CFrame.Angles
						local v59 = math.random(-30, 30)
						local v60 = math.rad(v59)
						local v61 = math.random(-30, 30)
						local v62 = math.rad(v61)
						local v63 = math.random(-30, 30)
						local v64 = v58(v60, v62, (math.rad(v63)))
						local v65 = v_u_6.target
						local v66 = math.random() / 4
						v65(v57, 0.9, math.clamp(v66, 0.1, 1), {
							["CFrame"] = v57:GetPivot() * v64 + Vector3.new(0, 60, 0)
						})
						local v67 = v_u_6.target
						local v68 = math.random()
						v67(v57, 0.9, math.clamp(v68, 0.5, 1), {
							["Size"] = Vector3.new(0, 0, 0)
						})
					end
				end
				for _, v69 in v_u_21 do
					for _, v70 in v69:GetChildren() do
						if v70:IsA("BasePart") then
							v70.CanCollide = false
							local v71 = CFrame.Angles
							local v72 = math.random(-30, 30)
							local v73 = math.rad(v72)
							local v74 = math.random(-30, 30)
							local v75 = math.rad(v74)
							local v76 = math.random(-30, 30)
							local v77 = v71(v73, v75, (math.rad(v76)))
							local v78 = v_u_6.target
							local v79 = math.random() / 4
							v78(v70, 0.9, math.clamp(v79, 0.1, 1), {
								["CFrame"] = v70:GetPivot() * v77 + Vector3.new(0, 60, 0)
							})
							local v80 = v_u_6.target
							local v81 = math.random()
							v80(v70, 0.9, math.clamp(v81, 0.5, 1), {
								["Size"] = Vector3.new(0, 0, 0)
							})
						end
					end
				end
				task.wait(3)
			end
			v_u_19:Destroy()
			for _, v82 in v_u_21 do
				v82:Destroy()
			end
			v_u_21 = nil
		end)
	end)
end
workspace:GetAttributeChangedSignal("VoteObject"):Connect(function()
	-- upvalues: (copy) v_u_83
	local v84 = workspace:GetAttribute("VoteObject")
	if v84 then
		v_u_83(v84)
	end
end)
local v_u_85 = workspace:GetAttribute("VoteObject")
if v_u_85 then
	task.spawn(function()
		-- upvalues: (copy) v_u_83, (copy) v_u_85
		v_u_83(v_u_85)
	end)
end