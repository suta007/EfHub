local v1 = {}
local v_u_2 = false
local v_u_3 = game:GetService("TweenService")
local v_u_4 = { "Blueberry" }
local v_u_5 = require(game.ReplicatedStorage.Modules.Notification)
local v_u_6 = require(game.ReplicatedStorage.Modules.ScreenShakeCore)
local v7 = game:GetService("ReplicatedStorage")
local v_u_8 = require(v7.Modules.SoundPlayer)
local v_u_9 = require(v7.Data.SoundData)
local function v_u_17(p10, p11, p12, p13, p14, p15)
	-- upvalues: (copy) v_u_8
	p11.PlaybackSpeed = p11.PlaybackSpeed + math.random(p12 * 1000, p13 * 1000) / 1000
	local v_u_16 = v_u_8:PlaySound(p10, p11, nil, p14)
	if not p15 then
		task.delay(8, function()
			-- upvalues: (copy) v_u_16
			if v_u_16 then
				v_u_16:Destroy()
			end
		end)
	end
end
local function v_u_31(_)
	-- upvalues: (ref) v_u_2, (copy) v_u_5, (copy) v_u_4, (copy) v_u_17, (copy) v_u_9
	if v_u_2 ~= true then
		v_u_2 = true
		v_u_5:CreateNotification("A pillar has appeared in front of your Garden!")
		for _, v_u_18 in workspace.Farm:GetChildren() do
			local v_u_19 = game.ReplicatedStorage.Assets.OfferingPillar:Clone()
			v_u_19.Name = "OFFERINGPILLAR"
			v_u_19:PivotTo(v_u_18.Center_Point.CFrame * CFrame.new(0, -4, 50))
			local v_u_20 = v_u_4[math.random(1, #v_u_4)]
			v_u_19:SetAttribute("Req", v_u_20)
			local v21 = script.ParticlePart:Clone()
			v21.Name = "OFFERINGPARTICLES"
			v21.CFrame = v_u_18.Center_Point.CFrame
			local v22 = Instance.new("ObjectValue")
			v22.Value = v_u_18
			v22.Name = "FARM"
			v22.Parent = v_u_19
			local v23 = Instance.new("ObjectValue")
			v23.Value = v21
			v23.Name = "SLICEPART"
			v23.Parent = v_u_19
			v_u_19.Parent = workspace.WeatherVisuals
			v21.Parent = workspace.WeatherVisuals
			v_u_19.Attachment.Smoke:Emit(3)
			local v24 = {
				["RollOffMaxDistance"] = 50000,
				["RollOffMinDistance"] = 10,
				["RollOffMode"] = Enum.RollOffMode.Inverse,
				["Volume"] = 5,
				["PlaybackSpeed"] = 0.65
			}
			v_u_17(v_u_9.Weather.Offering.Poof, v24, -0.2, 0.2, v_u_19.Attachment)
			if v_u_18.Important.Data.Owner.Value == game.Players.LocalPlayer.Name then
				v_u_19.Attachment.Offering.Enabled = true
				local v_u_25 = false
				v_u_19.Attachment.Offering.ActionText = "Place " .. v_u_19:GetAttribute("Req")
				local v_u_30 = v_u_19.Attachment.Offering.Triggered:Connect(function(p26)
					-- upvalues: (ref) v_u_25, (copy) v_u_19, (ref) v_u_5, (copy) v_u_20, (copy) v_u_18
					if p26.Character ~= nil and v_u_25 == false then
						local v27 = p26.Character:FindFirstChildOfClass("Tool")
						if v27 ~= nil then
							local v28 = v27:GetAttribute("f")
							if v28 ~= nil and v28 == v_u_19:GetAttribute("Req") then
								v_u_25 = true
								v_u_19.Attachment.Offering.Enabled = false
								v_u_5:CreateNotification("Offering success!")
								local v29 = { v_u_20, v27, v_u_18 }
								game.ReplicatedStorage.GameEvents.OfferingWeather:FireServer(v29)
								return
							end
							v_u_5:CreateNotification("Wrong offering!")
						end
					end
				end)
				v21.Destroying:Once(function()
					-- upvalues: (copy) v_u_19, (ref) v_u_30
					if v_u_19 then
						v_u_19:Destroy()
					end
					if v_u_30 then
						v_u_30:Disconnect()
					end
				end)
			end
		end
	end
end
local function v_u_37(_)
	-- upvalues: (ref) v_u_2, (copy) v_u_3, (copy) v_u_17, (copy) v_u_9
	if v_u_2 ~= false then
		v_u_2 = false
		for _, v32 in workspace.WeatherVisuals:GetChildren() do
			if v32.Name == "OFFERINGPARTICLES" then
				v32.Name = "OFFERINGPARTICLESDESTROY"
				v32.Flashes.Enabled = false
				v32.Slashes.Enabled = false
				v32.Sparks.Enabled = false
			elseif v32.Name == "OFFERINGPILLAR" then
				v32.Name = "OFFERINGPILLARDESTROY"
				local v33 = TweenInfo.new(1, Enum.EasingStyle.Cubic, Enum.EasingDirection.InOut, 0, false, 0)
				v_u_3:Create(v32.UpperEffect, v33, {
					["Position"] = Vector3.new(0, 1, 0)
				}):Play()
			end
		end
		task.wait(1)
		for _, v34 in workspace.WeatherVisuals:GetChildren() do
			if v34.Name == "OFFERINGPILLARDESTROY" then
				local v35 = {
					["RollOffMaxDistance"] = 50000,
					["RollOffMinDistance"] = 10,
					["RollOffMode"] = Enum.RollOffMode.Inverse,
					["Volume"] = 5,
					["PlaybackSpeed"] = 0.65
				}
				v_u_17(v_u_9.Weather.Offering.Poof, v35, -0.2, 0.2, v34)
				v34.Attachment.Smoke:Emit(3)
				v34:PivotTo(CFrame.new(0, -500, 0))
			end
		end
		task.wait(2)
		for _, v36 in workspace.WeatherVisuals:GetChildren() do
			if v36.Name == "OFFERINGPARTICLESDESTROY" or v36.Name == "OFFERINGPILLARDESTROY" then
				v36:Destroy()
			end
		end
	end
end
game.ReplicatedStorage.GameEvents:WaitForChild("OfferingWeather").OnClientEvent:Connect(function(p38)
	-- upvalues: (copy) v_u_6, (copy) v_u_17, (copy) v_u_9, (copy) v_u_3, (ref) v_u_2
	local v39 = nil
	for _, v40 in workspace.WeatherVisuals:GetChildren() do
		if v40.Name == "OFFERINGPILLAR" and v40.FARM.Value == p38 then
			v39 = v40
			break
		end
	end
	v_u_6:ScreenShake("Normal", { "Vector" }, 3, 0.5, 0.3)
	v_u_6:ScreenShake("Normal", { "Tilt", 8 }, 8, 0.7, 0.6)
	local v41 = {
		["RollOffMaxDistance"] = 50000,
		["RollOffMinDistance"] = 10,
		["RollOffMode"] = Enum.RollOffMode.Inverse,
		["Volume"] = 1,
		["PlaybackSpeed"] = 1
	}
	local v42 = {
		["PlaybackSpeed"] = 1 + math.random(-200, 200) / 1000,
		["Volume"] = 1
	}
	v_u_17(v_u_9.Weather.Offering.Start, v41, -0.2, 0.2, v39.Attachment)
	v_u_17(v_u_9.Weather.GiantSwordPull.Budge, v42, -0.2, 0.2, v39.Attachment)
	v39.UpperEffect.Position = Vector3.new(0, 1, 0)
	v39.Beam1.Beam.Enabled = true
	local v43 = TweenInfo.new(0.7, Enum.EasingStyle.Linear, Enum.EasingDirection.InOut, 0, false, 0)
	v_u_3:Create(v39.UpperEffect, v43, {
		["Position"] = Vector3.new(0, 100, 0)
	}):Play()
	v39.Attachment.Burst:Emit(8)
	v39.Attachment.Shockwave:Emit(1)
	task.wait(0.7)
	if v39 then
		v_u_6:ScreenShake("Normal", { "Vector" }, 3, 0.5, 0.6)
		v_u_6:ScreenShake("Normal", { "Tilt", 8 }, 8, 0.7, 0.8)
		local v44 = {
			["PlaybackSpeed"] = 0.5 + math.random(-40, 40) / 1000
		}
		local v45 = {
			["PlaybackSpeed"] = 1 + math.random(-250, 250) / 1000,
			["Volume"] = 1
		}
		v_u_17(v_u_9.Weather.GiantSwordPull.Start, v44, -0.2, 0.2, v39.UpperEffect)
		v_u_17(v_u_9.Weather.GiantSwordPull.Explosion, v45, -0.2, 0.2, v39.UpperEffect)
		v39.UpperEffect.Activate1:Emit(7)
		v39.UpperEffect.Activate2:Emit(7)
		v39.UpperEffect.Cracks:Emit(1)
		v39.UpperEffect.Wave:Emit(1)
		v39.UpperEffect.Shockwave:Emit(1)
		local v_u_46 = v39.SLICEPART.Value
		if v_u_46 ~= nil then
			v_u_46.Flashes.Enabled = true
			v_u_46.Slashes.Enabled = true
			v_u_46.Sparks.Enabled = true
			task.spawn(function()
				-- upvalues: (ref) v_u_2, (copy) v_u_46, (ref) v_u_17, (ref) v_u_9
				while v_u_2 and v_u_46 ~= nil do
					local v47 = {
						["RollOffMaxDistance"] = 120,
						["RollOffMinDistance"] = 1,
						["RollOffMode"] = Enum.RollOffMode.Linear,
						["PlaybackSpeed"] = 1.5,
						["Volume"] = 0.5
					}
					v_u_17(v_u_9.Weather.Offering.Slicing, v47, -0.5, 0.5, v_u_46)
					task.wait(0.07)
				end
			end)
		end
	end
end)
workspace:GetAttributeChangedSignal("Offering"):Connect(function()
	-- upvalues: (copy) v_u_31, (copy) v_u_37
	if workspace:GetAttribute("Offering") then
		v_u_31()
	else
		v_u_37()
	end
end)
if workspace:GetAttribute("Offering") then
	task.defer(function()
		-- upvalues: (copy) v_u_31
		v_u_31(true)
	end)
else
	v_u_37(true)
end
return v1