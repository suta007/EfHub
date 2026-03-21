local v1 = game:GetService("Players")
local v2 = game:GetService("ReplicatedStorage")
local v_u_3 = game:GetService("SoundService")
local v_u_4 = game:GetService("TweenService")
local v_u_5 = v1.LocalPlayer
local v6 = v2.GameEvents.CollectAllAnimation
local v_u_7 = require(v2.Code.Bezier_2)
local v_u_8 = script.Wisp
local v_u_9 = require(v2.Modules.SoundPlayer)
local v_u_10 = require(v2.Data.SoundData)
v6.OnClientEvent:Connect(function(p11)
	-- upvalues: (copy) v_u_5, (copy) v_u_8, (copy) v_u_7, (copy) v_u_4, (copy) v_u_9, (copy) v_u_10, (copy) v_u_3
	if p11 then
		local v12 = v_u_5.Character
		if v12 then
			local v13 = v12:FindFirstChild("HumanoidRootPart")
			if v13 then
				local v14 = v13.Position
				local v_u_15 = v_u_8:Clone()
				v_u_15.Position = p11
				v_u_15.Parent = workspace
				local v16 = Color3.fromHSV(math.random(), 1, 1)
				v_u_15.Color = v16
				for _, v17 in v_u_15:GetDescendants() do
					if v17:IsA("ParticleEmitter") or v17:IsA("Trail") then
						v17.Color = ColorSequence.new(v16)
					end
				end
				local v18 = p11:Lerp(v14, 0.33) + Vector3.new(0, 1, 0) * math.random(15, 20)
				local v19 = math.random(-45, 45)
				local v20 = math.random
				local v21 = v18 + Vector3.new(v19, 0, v20(-45, 45))
				local v22 = p11:Lerp(v14, 0.66) + Vector3.new(0, 1, 0) * math.random(5, 10)
				local v23 = math.random(-45, 45)
				local v24 = math.random
				local v25 = v22 + Vector3.new(v23, 0, v24(-45, 45))
				local v26 = v_u_7.new(p11, v21, v25, v14):CreateCFrameTween(v_u_15, { "CFrame" }, (TweenInfo.new(1.25, Enum.EasingStyle.Sine, Enum.EasingDirection.In)))
				game:GetService("Debris"):AddItem(v_u_15, 4.25)
				v26:Play()
				v26.Completed:Once(function()
					-- upvalues: (ref) v_u_4, (copy) v_u_15, (ref) v_u_9, (ref) v_u_10, (ref) v_u_3
					v_u_4:Create(v_u_15, TweenInfo.new(0.5), {
						["Size"] = v_u_15.Size * 1.5,
						["Transparency"] = 1
					}):Play()
					for _, v27 in v_u_15:GetDescendants() do
						if v27:IsA("ParticleEmitter") then
							if v27.Enabled then
								v27.Enabled = false
							else
								v27:Emit(v27:GetAttribute("EmitCount") or 1)
							end
						end
					end
					local v28 = {
						["RollOffMaxDistance"] = 10000,
						["RollOffMinDistance"] = 10,
						["RollOffMode"] = Enum.RollOffMode.Inverse,
						["Volume"] = 0.33,
						["PlaybackSpeed"] = math.random() * 0.4 + 0.8
					}
					local v29 = v_u_9:PlaySound(v_u_10.Tools.Generic.Poof, v28, nil, v_u_3)
					v29.Ended:Wait()
					v29:Destroy()
				end)
			end
		else
			return
		end
	else
		return
	end
end)