local v1 = game:GetService("ReplicatedStorage")
local v_u_2 = game:GetService("RunService")
local v3 = game:GetService("Players")
local v_u_4 = v1.GameEvents.BizzyBeeEvent.BeeColonyAbilityEffectsService
local v_u_5 = require(v1.Modules.SoundPlayer)
local v_u_6 = {}
local v_u_7 = {}
local v_u_8 = {}
local v_u_9 = v3.LocalPlayer
local function v_u_17(p10, p11, p12) -- name: CreateBeam
	local v13 = Instance.new("Attachment")
	v13.Parent = p10
	local v14 = Instance.new("Attachment")
	v14.Parent = p11
	local v15 = Instance.new("Beam")
	v15.Attachment0 = v13
	v15.Attachment1 = v14
	local v16 = p12 or Color3.fromRGB(255, 230, 80)
	v15.Color = ColorSequence.new(v16, v16:Lerp(Color3.new(1, 1, 1), 0.35))
	v15.Transparency = NumberSequence.new({ NumberSequenceKeypoint.new(0, 0.15), NumberSequenceKeypoint.new(0.5, 0.35), NumberSequenceKeypoint.new(1, 0.15) })
	v15.LightEmission = 1
	v15.Width0 = 0.35
	v15.Width1 = 0.2
	v15.TextureLength = 1
	v15.TextureSpeed = 2
	v15.CurveSize0 = 1.5
	v15.CurveSize1 = -1.5
	v15.FaceCamera = true
	v15.Parent = v13
	return {
		["CasterAttachment"] = v13,
		["TargetAttachment"] = v14,
		["Beam"] = v15
	}
end
local function v_u_19(p18) -- name: CleanupEffect
	-- upvalues: (copy) v_u_6
	if not p18.Cleaned then
		p18.Cleaned = true
		if p18.CasterDestroyConn then
			p18.CasterDestroyConn:Disconnect()
			p18.CasterDestroyConn = nil
		end
		if p18.TargetDestroyConn then
			p18.TargetDestroyConn:Disconnect()
			p18.TargetDestroyConn = nil
		end
		if p18.CasterAttachment then
			p18.CasterAttachment:Destroy()
		end
		if p18.TargetAttachment then
			p18.TargetAttachment:Destroy()
		end
		v_u_6[p18] = nil
	end
end
local function v_u_24(p20, p21) -- name: CreateCooldownGui
	local v22 = Instance.new("BillboardGui")
	v22.Name = "BeeAbilityCooldown"
	v22.Size = UDim2.fromOffset(90, 28)
	v22.StudsOffset = Vector3.new(0, 2.2, 0)
	v22.AlwaysOnTop = true
	v22.Adornee = p20
	v22.Parent = p20
	local v23 = Instance.new("TextLabel")
	v23.Name = "CooldownText"
	v23.Size = UDim2.fromScale(0.8, 0.8)
	v23.BackgroundTransparency = 1
	v23.TextColor3 = p21 or Color3.fromRGB(255, 255, 255)
	v23.TextStrokeTransparency = 0
	v23.TextStrokeColor3 = Color3.fromRGB(0, 0, 0)
	v23.TextScaled = true
	v23.FontFace = Font.new("rbxasset://fonts/families/ComicNeueAngular.json", Enum.FontWeight.Bold)
	v23.Parent = v22
	return v22, v23
end
local function v_u_36(p25, p26, p27, p28, p29, p30) -- name: StartCooldown
	-- upvalues: (copy) v_u_9, (copy) v_u_7, (copy) v_u_24
	if p29 and p29 > 0 then
		local v31 = ("%*_%*_%*"):format(p25, p26, p27)
		local v32 = ("%*_%*_%*"):format(("Player_%*"):format(v_u_9.UserId), p26, p27)
		local v33 = v_u_7[v31]
		if v33 then
			if v33.Gui then
				v33.Gui:Destroy()
			end
			v_u_7[v31] = nil
		end
		local v34, v35 = v_u_24(p28, p30)
		v34.Enabled = v32 == v31
		v_u_7[v31] = {
			["Gui"] = v34,
			["Label"] = v35,
			["EndsAt"] = p29
		}
	end
end
local function v_u_42(p37, p38) -- name: TryStartCooldown
	-- upvalues: (copy) v_u_36
	local v39 = p37:GetHitbox(p38.PlayerKey, p38.CasterUUID)
	local v40 = p37:GetEntry(p38.PlayerKey, p38.CasterUUID)
	if not v40 or v40.Client.IsVisible ~= false then
		if not v39 then
			return false
		end
		v_u_36(p38.PlayerKey, p38.CasterUUID, p38.AbilityName, v39, p38.CooldownEndsAt, p38.EffectColor)
		local v41 = p37:GetEntry(p38.PlayerKey, p38.CasterUUID)
		return v41 and v41.Client.IsVisible == false and true or true
	end
end
return function(p_u_43)
	-- upvalues: (copy) v_u_4, (copy) v_u_8, (copy) v_u_5, (copy) v_u_2, (copy) v_u_36, (copy) v_u_17, (copy) v_u_6, (copy) v_u_19, (copy) v_u_42, (copy) v_u_7
	v_u_4.OnClientEvent:Connect(function(p44)
		-- upvalues: (copy) p_u_43, (ref) v_u_8, (ref) v_u_5, (ref) v_u_2, (ref) v_u_36, (ref) v_u_17, (ref) v_u_6, (ref) v_u_19
		local v45 = p_u_43:GetHitbox(p44.PlayerKey, p44.CasterUUID)
		if v45 then
			if p44.Type == "BeerserkerInstinct" then
				local v46 = p_u_43:GetEntry(p44.PlayerKey, p44.CasterUUID)
				if v46 then
					local v47 = v46.Client.Hitbox
					if v47 then
						local v48 = script.Parent.VFX:FindFirstChild("BeerserkerInstinct")
						if v48 then
							local v_u_49 = v48:Clone()
							v_u_49.Parent = v47
							for _, v50 in v_u_49:GetDescendants() do
								if v50:IsA("ParticleEmitter") then
									v50.Enabled = true
								end
							end
							task.delay(p44.Duration, function()
								-- upvalues: (copy) v_u_49
								v_u_49:Destroy()
							end)
						end
					else
						return
					end
				else
					return
				end
			elseif p44.Type == "LastStand" then
				local v51 = p_u_43:GetEntry(p44.PlayerKey, p44.CasterUUID)
				if v51 then
					local v52 = v51.Client.Hitbox
					if v52 then
						local v53 = script.Parent.VFX:FindFirstChild("LastStand")
						if v53 then
							local v_u_54 = v53:Clone()
							v_u_54.Parent = v52
							for _, v55 in v_u_54:GetDescendants() do
								if v55:IsA("ParticleEmitter") then
									v55:Emit(v55:GetAttribute("EmitCount") or v55.Rate)
								end
							end
							task.delay(3, function()
								-- upvalues: (copy) v_u_54
								v_u_54:Destroy()
							end)
						end
					else
						return
					end
				else
					return
				end
			elseif p44.Type == "WaspKingShockwave" then
				local v56 = p_u_43:GetEntry(p44.PlayerKey, p44.CasterUUID)
				if v56 then
					local v57 = v56.Client.Hitbox
					if v57 then
						local v58 = script.Parent.VFX:FindFirstChild("StunShockwaveVFX")
						if v58 then
							local v_u_59 = v58:Clone()
							v_u_59.Parent = v57
							for _, v60 in v_u_59:GetDescendants() do
								if v60:IsA("ParticleEmitter") then
									v60:Emit(v60:GetAttribute("EmitCount") or v60.Rate)
								end
							end
							v_u_5:PlaySound("rbxassetid://115778188450463", {
								["Volume"] = 0.85,
								["PlaybackSpeed"] = nil,
								["PlaybackSpeed"] = Random.new():NextNumber(0.95, 1.05)
							})
							task.delay(5, function()
								-- upvalues: (copy) v_u_59
								v_u_59:Destroy()
							end)
						end
					else
						return
					end
				else
					return
				end
			elseif p44.Type == "WaspKingPoisonStrike" then
				local v61 = p_u_43:GetEntry(p44.PlayerKey, p44.CasterUUID)
				if v61 then
					local v62 = p_u_43:GetEntry(p44.TargetPlayerKey, p44.TargetUUID)
					if v62 then
						local v63 = v61.Client.Hitbox
						local v_u_64 = v62.Client.Hitbox
						if v63 and v_u_64 then
							local v65 = script.Parent.VFX:FindFirstChild("PoisonStrikesProjectileVFX")
							if v65 then
								local v_u_66 = v65:Clone()
								v_u_66.Anchored = true
								v_u_66.CanCollide = false
								v_u_66.CanQuery = false
								v_u_66.CanTouch = false
								v_u_66.CFrame = CFrame.new(v63.Position)
								v_u_66.Parent = workspace
								v_u_5:PlaySound("rbxassetid://135896788058098", {
									["Volume"] = 0.65,
									["PlaybackSpeed"] = nil,
									["PlaybackSpeed"] = Random.new():NextNumber(0.95, 1.05)
								})
								local v_u_67 = v63.Position
								local v68 = math.random(-15, 15)
								local v69 = math.random(10, 25)
								local v70 = math.random
								local v_u_71 = Vector3.new(v68, v69, v70(-15, 15))
								local v72 = math.random(-15, 15)
								local v73 = math.random(10, 25)
								local v74 = math.random
								local v_u_75 = Vector3.new(v72, v73, v74(-15, 15))
								local v_u_76 = workspace:GetServerTimeNow()
								local v_u_77 = nil
								v_u_77 = v_u_2.RenderStepped:Connect(function()
									-- upvalues: (copy) v_u_66, (ref) v_u_77, (copy) v_u_76, (copy) v_u_64, (copy) v_u_67, (copy) v_u_71, (copy) v_u_75, (ref) v_u_5
									if v_u_66.Parent then
										local v78 = (workspace:GetServerTimeNow() - v_u_76) / 3
										local v79 = math.clamp(v78, 0, 1)
										local v80
										if v_u_64 and v_u_64.Parent then
											v80 = v_u_64.Position
										else
											v80 = v_u_66.Position
										end
										local v81 = v_u_67
										local v82 = v_u_67 + v_u_71
										local v83 = v80 + v_u_75
										local v84 = v81:Lerp(v82, v79)
										local v85 = v82:Lerp(v83, v79)
										local v86 = v83:Lerp(v80, v79)
										local v87 = v84:Lerp(v85, v79):Lerp(v85:Lerp(v86, v79), v79)
										v_u_66.CFrame = CFrame.new(v87)
										if v79 >= 1 then
											v_u_77:Disconnect()
											local v88
											if v_u_64 and v_u_64.Parent then
												v88 = v_u_64.Position
											else
												v88 = v_u_66.Position
											end
											v_u_5:PlaySound("rbxassetid://78298516531680", {
												["Volume"] = 0.65,
												["PlaybackSpeed"] = nil,
												["PlaybackSpeed"] = Random.new():NextNumber(0.95, 1.05)
											})
											v_u_66:PivotTo(CFrame.new(v88))
											v_u_66:Destroy()
										end
									else
										v_u_77:Disconnect()
									end
								end)
							end
						else
							return
						end
					else
						return
					end
				else
					return
				end
			else
				v_u_36(p44.PlayerKey, p44.CasterUUID, p44.AbilityName, v45, p44.CooldownEndsAt, p44.EffectColor)
				for _, v89 in p44.TargetUUIDs do
					local v90 = p_u_43:GetHitbox(p44.PlayerKey, v89)
					if v90 then
						local v91 = p_u_43:GetEntry(p44.PlayerKey, v89)
						if not v91 or v91.Client.IsVisible ~= false then
							local v_u_92 = v_u_17(v45, v90, p44.EffectColor)
							v_u_6[v_u_92] = true
							v_u_92.CasterDestroyConn = v45.Destroying:Connect(function()
								-- upvalues: (ref) v_u_19, (copy) v_u_92
								v_u_19(v_u_92)
							end)
							v_u_92.TargetDestroyConn = v90.Destroying:Connect(function()
								-- upvalues: (ref) v_u_19, (copy) v_u_92
								v_u_19(v_u_92)
							end)
							task.delay(p44.Duration, function()
								-- upvalues: (ref) v_u_19, (copy) v_u_92
								v_u_19(v_u_92)
							end)
						end
					end
				end
				return
			end
		else
			if p44.CooldownEndsAt and p44.AbilityName then
				local v93 = v_u_8
				table.insert(v93, p44)
			end
			return
		end
	end)
	v_u_2.RenderStepped:Connect(function()
		-- upvalues: (ref) v_u_8, (ref) v_u_42, (copy) p_u_43, (ref) v_u_7
		local v94 = workspace:GetServerTimeNow()
		for v95 = #v_u_8, 1, -1 do
			local v96 = v_u_8[v95]
			local v97
			if v96 then
				v97 = v96.CooldownEndsAt
			else
				v97 = v96
			end
			if v96 and v97 then
				if v96.CooldownEndsAt <= v94 then
					table.remove(v_u_8, v95)
				elseif v_u_42(p_u_43, v96) then
					table.remove(v_u_8, v95)
				end
			else
				table.remove(v_u_8, v95)
			end
		end
		for v98, v99 in v_u_7 do
			local v100 = v99.EndsAt - v94
			local v101 = math.ceil(v100)
			if v101 <= 0 then
				local v102 = v_u_7[v98]
				if v102 then
					if v102.Gui then
						v102.Gui:Destroy()
					end
					v_u_7[v98] = nil
				end
			else
				v99.Label.Text = ("\226\143\177\239\184\143%*s"):format(v101)
			end
		end
	end)
end