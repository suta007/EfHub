local v_u_1 = {}
local v_u_2 = game:GetService("ReplicatedStorage")
local v3 = game:GetService("UserInputService")
local v_u_4 = game:GetService("TweenService")
local v_u_5 = game:GetService("CollectionService")
local v_u_6 = game:GetService("Players")
local v_u_7 = require(v_u_2.Modules.SoundPlayer)
local _ = workspace.CurrentCamera
local v8 = v_u_2.GameEvents.ChristmasEvent.FireTreeNPCSubmitVisuals
local v9 = v_u_2.GameEvents.ChristmasEvent.FireChristmasTreeSeedClaimVisuals
local v10 = v_u_2.GameEvents.ChristmasEvent.FireChristmasTreeGrowKitVisuals
local v_u_11 = require(v_u_2.Code.Bezier)
require(v_u_2.Modules.TweenModel)
local v_u_12 = require(v_u_2.Modules.Notification)
local v13 = v3.TouchEnabled and "Mobile" or "PC"
local v_u_14 = require(v_u_2.Code.Bezier_2)
local _ = v13 == "Mobile"
local v_u_15 = require(v_u_2.Modules.Task)
local v_u_16 = v_u_5:GetTagged("WonderWaterNPC")[1]
local v_u_17 = game.SoundService.Gold.SoundId
local v_u_18 = game.SoundService.Rainbow.SoundId
v8.OnClientEvent:Connect(function(p19)
	-- upvalues: (copy) v_u_15, (copy) v_u_1, (copy) v_u_6, (copy) v_u_16
	local v_u_20 = Random.new()
	local v21 = {}
	for v_u_22 = 1, math.min(10, p19) do
		local v_u_23
		if v_u_22 % 2 == 0 then
			v_u_23 = Color3.new(1, 0, 0)
		else
			v_u_23 = Color3.new(0, 1, 0)
		end
		local v24 = v_u_15.run
		local function v25()
			-- upvalues: (copy) v_u_22, (copy) v_u_20, (ref) v_u_1, (ref) v_u_6, (ref) v_u_16, (copy) v_u_23
			task.wait(v_u_22 * v_u_20:NextNumber(0.05, 0.15))
			v_u_1:FireWisp(v_u_6.LocalPlayer.Character:GetPivot().Position, v_u_16:GetPivot().Position, v_u_23):Await()
		end
		table.insert(v21, v24(v25))
	end
	v_u_15.WhenAll(v21):Await()
end)
v9.OnClientEvent:Connect(function()
	-- upvalues: (copy) v_u_5, (copy) v_u_2, (copy) v_u_12
	local v26 = v_u_5:GetTagged("ClaimableChristmasSeed")[1]
	if v26 then
		local v27 = v26:FindFirstChild("Seed Model"):GetPivot()
		v_u_2.GameEvents.FireDropBindable:Fire({}, v27)
	end
	task.wait(0.5)
	v_u_12:CreateNotification("Christmas Tree Seed Claimed!")
end)
v10.OnClientEvent:Connect(function()
	-- upvalues: (copy) v_u_16, (copy) v_u_6, (copy) v_u_11, (copy) v_u_7
	local v28 = script["Watering Can"]:Clone()
	local v29 = v_u_16:GetPivot()
	v28:PivotTo(v29)
	local v30 = {
		["PlaybackSpeed"] = math.random(95, 105) / 100
	}
	v28.Parent = workspace.Visuals
	local v31 = 0
	while v31 < 0.5 do
		v31 = v31 + game:GetService("RunService").Heartbeat:Wait()
		local v32 = v29.Position
		local v33 = v_u_6.LocalPlayer.Character:GetPivot().Position
		local v34 = (v32 + v33) / 2
		local v35 = v32.Y + 7
		local v36 = v34 + Vector3.new(0, v35, 0)
		local v37 = v_u_11.new(v32, v36, v33)
		local v38 = game.TweenService:GetValue(v31 / 0.5, Enum.EasingStyle.Sine, Enum.EasingDirection.Out)
		local v39 = v37:Get(v38)
		local v40 = 3.141592653589793 * v38
		v28:ScaleTo((math.sin(v40)))
		v28:PivotTo(CFrame.new(v39))
	end
	v_u_7:PlaySound("rbxassetid://131982914016274", v30)
	v_u_7:PlaySound("rbxassetid://98997625344529", v30)
	if v28 then
		v28:Destroy()
	end
end)
function v_u_1.FireWisp(_, p_u_41, p_u_42, p_u_43)
	-- upvalues: (copy) v_u_15, (copy) v_u_7, (copy) v_u_17, (copy) v_u_14, (copy) v_u_18, (copy) v_u_4
	return v_u_15.run(function()
		-- upvalues: (copy) p_u_41, (ref) v_u_7, (ref) v_u_17, (copy) p_u_43, (copy) p_u_42, (ref) v_u_14, (ref) v_u_18, (ref) v_u_4
		local v_u_44 = script.Wisp:Clone()
		v_u_44.Position = p_u_41
		v_u_44.Parent = workspace
		task.spawn(function()
			-- upvalues: (ref) v_u_7, (ref) v_u_17, (copy) v_u_44
			v_u_7:PlaySound(v_u_17, {}, nil, v_u_44)
		end)
		if p_u_43 then
			v_u_44.Color = p_u_43
			for _, v45 in v_u_44:GetDescendants() do
				if v45:IsA("ParticleEmitter") or v45:IsA("Trail") then
					v45.Color = ColorSequence.new(p_u_43)
				end
			end
		end
		local v46 = p_u_41:Lerp(p_u_42, 0.33) + Vector3.new(0, 1, 0) * math.random(15, 20)
		local v47 = math.random(-45, 45)
		local v48 = math.random
		local v49 = v46 + Vector3.new(v47, 0, v48(-45, 45))
		local v50 = p_u_41:Lerp(p_u_42, 0.66) + Vector3.new(0, 1, 0) * math.random(5, 10)
		local v51 = math.random(-45, 45)
		local v52 = math.random
		local v53 = v50 + Vector3.new(v51, 0, v52(-45, 45))
		local v54 = v_u_14.new(p_u_41, v49, v53, p_u_42):CreateCFrameTween(v_u_44, { "CFrame" }, (TweenInfo.new(1, Enum.EasingStyle.Sine, Enum.EasingDirection.In)))
		game:GetService("Debris"):AddItem(v_u_44, 4)
		v54:Play()
		v54.Completed:Wait()
		task.spawn(function()
			-- upvalues: (ref) v_u_7, (ref) v_u_18, (copy) v_u_44
			v_u_7:PlaySound(v_u_18, {}, nil, v_u_44)
		end)
		v_u_4:Create(v_u_44, TweenInfo.new(0.5), {
			["Size"] = v_u_44.Size * 1.5,
			["Transparency"] = 1
		}):Play()
		for _, v55 in v_u_44:GetDescendants() do
			if v55:IsA("ParticleEmitter") then
				if v55.Enabled then
					v55.Enabled = false
				else
					v55:Emit(v55:GetAttribute("EmitCount") or 1)
				end
			end
		end
	end)
end
return v_u_1