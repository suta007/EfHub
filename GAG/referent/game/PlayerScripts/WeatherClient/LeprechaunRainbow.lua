local v1 = {}
local v_u_2 = false
local v_u_3 = game:GetService("TweenService")
local v_u_4 = script.Sky
local v_u_5 = require(game.ReplicatedStorage.Modules.SkyboxManager)
require(game.ReplicatedStorage.Code.CameraShaker)
local v_u_6 = require(game.ReplicatedStorage.Code.Spr)
local v7 = game.Lighting.ColorCorrection:Clone()
v7.Name = script.Name
v7.Parent = game.Lighting
local v8 = game.ReplicatedStorage:WaitForChild("GameEvents").RainbowBeam
v_u_5.AddSkybox(v_u_4, 0)
local function v_u_26()
	-- upvalues: (ref) v_u_2, (copy) v_u_5, (copy) v_u_4, (copy) v_u_6
	v_u_2 = true
	v_u_5.UpdateSkybox(v_u_4, 2)
	tick()
	local v_u_9 = game.ReplicatedStorage.Assets.Rainbow:Clone()
	v_u_9.Parent = workspace
	local v_u_10 = script.Pot:Clone()
	v_u_10:PivotTo(CFrame.new(v_u_9.End.CFrame.Position))
	v_u_10:GetScale()
	local v_u_11 = v_u_9:FindFirstChild("Beam", true);
	(function()
		-- upvalues: (copy) v_u_9, (copy) v_u_11, (copy) v_u_10, (ref) v_u_6
		v_u_9.End.PixelSmoke.Enabled = false
		v_u_9.Start.PixelSmoke.Enabled = false
		v_u_9.Start.PixelSmoke.Enabled = true
		local v12 = 0.001
		while v12 < 3 do
			v12 = v12 + game:GetService("RunService").Heartbeat:Wait()
			local v13 = game.TweenService:GetValue(v12 / 3, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut)
			local v14 = 0.052 + math.clamp(v13, 0, 1) * 0.898
			local v15 = math.clamp(v14, 0.052, 0.949)
			local v16 = NumberSequence.new
			local v17 = {}
			local v18 = NumberSequenceKeypoint.new(0, 1)
			local v19 = NumberSequenceKeypoint.new(0.05, 1)
			local v20 = NumberSequenceKeypoint.new(0.051, 0)
			local v21 = NumberSequenceKeypoint.new
			local v22 = v15 - 0.1
			__set_list(v17, 1, {v18, v19, v20, v21(math.clamp(v22, 0.052, 0.95), 0), NumberSequenceKeypoint.new(math.clamp(v15, 0.053, 0.95), 1), NumberSequenceKeypoint.new(0.95, 1), NumberSequenceKeypoint.new(1, 1)})
			v_u_11.Transparency = v16(v17)
		end
		v_u_10:ScaleTo(0.1)
		v_u_10.Parent = workspace
		v_u_6.target(v_u_10, 2, 10, {
			["Scale"] = 30
		})
	end)()
	repeat
		task.wait(0.1)
	until v_u_2 == false
	v_u_5.UpdateSkybox(v_u_4, 0);
	(function()
		-- upvalues: (copy) v_u_9, (copy) v_u_10, (copy) v_u_11
		v_u_9.End.PixelSmoke.Enabled = false
		v_u_9.Start.PixelSmoke.Enabled = false
		local v23
		if v_u_10 then
			v_u_10:Destroy()
			v23 = 0
		else
			v23 = 0
		end
		while v23 < 3 do
			v23 = v23 + game:GetService("RunService").Heartbeat:Wait()
			local v24 = game.TweenService:GetValue(v23 / 3, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut)
			local v25 = math.clamp(v24, 0, 1)
			v_u_11.Transparency = NumberSequence.new({
				NumberSequenceKeypoint.new(0, 1),
				NumberSequenceKeypoint.new(0.05, 1),
				NumberSequenceKeypoint.new(0.051, v25),
				NumberSequenceKeypoint.new(0.949, v25),
				NumberSequenceKeypoint.new(0.95, 1),
				NumberSequenceKeypoint.new(1, 1)
			})
		end
	end)()
	game.Debris:AddItem(v_u_9, 4)
end
local v_u_27 = {
	Vector3.new(-100.614, 4.339, -20.84),
	Vector3.new(-101.374, 4.339, -4.13),
	Vector3.new(-109.764, 4.339, -7.48),
	Vector3.new(-108.904, 4.339, -18.48)
}
local function v_u_80(p28, _, _, _)
	-- upvalues: (copy) v_u_27, (copy) v_u_3
	local v29 = game:GetService("RunService")
	local v30 = v_u_27[math.random(1, #v_u_27)]
	local v31 = v30.X
	local v32 = v30.Z
	local v33 = Vector3.new(v31, 0, v32)
	local v34 = p28.X
	local v35 = p28.Z
	local v36 = (v33 - Vector3.new(v34, 0, v35)).Magnitude
	local v37 = (v30 + p28) / 2
	local v38 = v36 * 0.6
	local v39 = v37 + Vector3.new(0, v38, 0)
	local v_u_40 = {
		Color3.fromRGB(255, 0, 0),
		Color3.fromRGB(255, 165, 0),
		Color3.fromRGB(255, 255, 0),
		Color3.fromRGB(0, 200, 0),
		Color3.fromRGB(0, 80, 255),
		Color3.fromRGB(160, 0, 255)
	}
	local v41 = {}
	local v42 = {}
	local function v54(p43)
		-- upvalues: (copy) v_u_40
		local v44 = p43 * (#v_u_40 - 1)
		local v45 = math.floor(v44)
		local v46 = v44 - v45
		local v47 = v_u_40
		local v48 = v45 + 1
		local v49 = #v_u_40
		local v50 = v47[math.clamp(v48, 1, v49)]
		local v51 = v_u_40
		local v52 = v45 + 2
		local v53 = #v_u_40
		return v50:Lerp(v51[math.clamp(v52, 1, v53)], v46)
	end
	for v55 = 0, 40 do
		local v56 = v55 / 40
		local v57 = 1 - v56
		local v58 = v57 * v57 * v30 + v57 * 2 * v56 * v39 + v56 * v56 * p28
		local v59 = Instance.new("Part")
		v59.Anchored = true
		v59.CanCollide = false
		v59.Transparency = 1
		v59.Size = Vector3.new(1, 1, 1)
		v59.Position = v58
		v59.Parent = workspace
		local v60 = Instance.new("Attachment", v59)
		v41[v55] = v59
		v42[v55] = v60
	end
	local v61 = {}
	for v62 = 0, 39 do
		local v63 = v62 / 40
		local v64 = (v62 + 1) / 40
		local v65 = Instance.new("Beam")
		v65.Attachment0 = v42[v62]
		v65.Attachment1 = v42[v62 + 1]
		v65.Color = ColorSequence.new({ ColorSequenceKeypoint.new(0, v54(v63)), ColorSequenceKeypoint.new(1, v54(v64)) })
		v65.Width0 = 1.5
		v65.Width1 = 1.5
		v65.Segments = 1
		v65.CurveSize0 = 0
		v65.CurveSize1 = 0
		v65.LightEmission = 0.8
		v65.LightInfluence = 0.2
		v65.FaceCamera = true
		v65.Transparency = NumberSequence.new(1)
		v65.Parent = workspace
		v61[v62] = v65
	end
	local v66 = 0.001
	while v66 < 2 do
		v66 = v66 + v29.Heartbeat:Wait()
		local v67 = v_u_3
		local v68 = v66 / 2
		local v69 = v67:GetValue(math.clamp(v68, 0, 1), Enum.EasingStyle.Quad, Enum.EasingDirection.InOut)
		for v70 = 0, 39 do
			local v71 = v70 / 40
			if (v70 + 1) / 40 <= v69 then
				v61[v70].Transparency = NumberSequence.new(0)
			elseif v71 < v69 then
				local v72 = (v69 - v71) / 0.025
				v61[v70].Transparency = NumberSequence.new(1 - v72)
			end
		end
	end
	task.wait(0.5)
	local v73 = 0
	while v73 < 2 do
		v73 = v73 + v29.Heartbeat:Wait()
		local v74 = v_u_3
		local v75 = v73 / 2
		local v76 = v74:GetValue(math.clamp(v75, 0, 1), Enum.EasingStyle.Quad, Enum.EasingDirection.InOut)
		for v77 = 0, 39 do
			v61[v77].Transparency = NumberSequence.new(v76)
		end
	end
	for v78 = 0, 40 do
		v41[v78]:Destroy()
	end
	for v79 = 0, 39 do
		v61[v79]:Destroy()
	end
end
v8.OnClientEvent:Connect(function(p81)
	-- upvalues: (copy) v_u_80
	v_u_80(p81)
end)
workspace:GetAttributeChangedSignal("RainbowEvent"):Connect(function()
	-- upvalues: (copy) v_u_26, (ref) v_u_2
	if workspace:GetAttribute("RainbowEvent") then
		v_u_26()
	else
		v_u_2 = false
	end
end)
if workspace:GetAttribute("RainbowEvent") then
	task.defer(v_u_26)
else
	v_u_2 = false
end
return v1