local v_u_1 = game:GetService("ReplicatedStorage")
local v_u_2 = game:GetService("RunService")
local v_u_3 = game:GetService("Players")
local v_u_4 = game:GetService("CollectionService")
game:GetService("TweenService")
local v_u_5 = require(v_u_1.Data.BeeEvent.BeeRegistry)
local v6 = require(v_u_1.Data.BeeEvent.BeeEventConfig)
local v_u_7 = require(script.Util.UnpackCFrames)
local v_u_8 = require(script.Util.BeeModelLoader)
local v_u_9 = require(script.BeeColonyAbilityEffectsController)
local v_u_10 = require(v_u_1.Modules.Settings.SettingsService)
local v11 = require(v_u_1.Modules.Signal)
local v_u_12 = require(v_u_1.Modules.Notification)
local v_u_13 = require(v_u_1.Modules.Utility.ParticleHelper)
require(v_u_1.Modules.LerpColor)
local v_u_14 = require(v_u_1.Modules.BeeEventV2Controllers.DamageIndicator)
local v_u_15 = v_u_3.LocalPlayer
local _ = v6.Simulation.SimulationHertz
local v_u_16 = v6.Simulation.UnreliableHertz
local v17 = v_u_1.GameEvents.BeeColonyStateService
local v_u_18 = v17.Reliable
local v_u_19 = v17.Unreliable
local v_u_20 = script:WaitForChild("VFX")
local v_u_21 = script:WaitForChild("Sounds")
local v_u_22 = script.VFX.RoyalJelly
local v_u_23 = script.VFX.HoneyCoin
local v_u_24 = {}
local v_u_25 = {}
local v26 = {
	["BeeStates"] = {},
	["IdentifierMap"] = {},
	["BulkMoveTo"] = {
		["Parts"] = {},
		["CFrames"] = {}
	},
	["SpatialGrid"] = {}
}
v_u_25.State = v26
v_u_25.OnBeeCreated = v11.new()
v_u_25.OnBeeDestroyed = v11.new()
v_u_25.OnBeeStateUpdate = v11.new()
local v_u_27 = v_u_25.State
local v_u_28 = v_u_27.IdentifierMap
local v_u_29 = false
local v30 = v_u_27.BulkMoveTo
local v_u_31 = v30.Parts
local v_u_32 = v30.CFrames
local v_u_33 = nil
local v_u_34 = {}
local v_u_35 = v6.LOD.Near
local v_u_36 = v6.LOD.Mid
local v_u_37 = v6.LOD.Far
local v_u_38 = 0
local function v_u_44(p39, p40, p41) -- name: StartLoopedSound
	-- upvalues: (copy) v_u_21
	if p40 and p40.Parent then
		if not p40.IsPlaying then
			p40:Play()
		end
		return p40
	end
	local v42 = v_u_21:FindFirstChild(p41)
	if not (v42 and v42:IsA("Sound")) then
		return nil
	end
	local v43 = v42:Clone()
	v43.Name = ("%*Sound"):format(p41)
	v43.Looped = true
	v43.Parent = p39
	v43:Play()
	return v43
end
local function v_u_59() -- name: UpdateSoundAllowances
	-- upvalues: (copy) v_u_27, (copy) v_u_5
	local v45 = {}
	for _, v46 in v_u_27.BeeStates do
		for _, v47 in v46 do
			v47.Client.AllowFollowPlayerSound = false
			v47.Client.AllowPollinateSound = false
			local v48 = v47.Server.State
			if v48 == "Pollinate" or (v48 == "FollowPlayer" or v48 == "Guarding") then
				table.insert(v45, v47)
			end
		end
	end
	table.sort(v45, function(p49, p50)
		local v51 = p49.Server.State == "Pollinate" and 1 or 2
		local v52 = p50.Server.State == "Pollinate" and 1 or 2
		if v51 == v52 then
			return p49.Server.Identifier < p50.Server.Identifier
		else
			return v51 < v52
		end
	end)
	local v53 = 0
	local v54 = 0
	local v55 = 0
	for _, v56 in v45 do
		local v57 = v56.Server.State
		if v53 < 1 then
			v56.Client.AllowFollowPlayerSound = true
			v53 = v53 + 1
		end
		local v58 = v_u_5[v56.Server.BeeName].IsWasp
		if v58 and v54 < 1 then
			if not v56.Client.IdleSound.IsPlaying then
				v56.Client.IdleSound:Play()
			end
			v54 = v54 + 1
		elseif v58 then
			v56.Client.IdleSound:Stop()
		end
		if v57 == "Pollinate" and v55 < 5 then
			v56.Client.AllowPollinateSound = true
			v55 = v55 + 1
		end
	end
end
function v_u_25.SetPollinateSoundEnabled(_, p60, p61) -- name: SetPollinateSoundEnabled
	-- upvalues: (copy) v_u_44
	local v62 = p60.Client
	if p61 and not v62.AllowPollinateSound then
		p61 = false
	end
	if p61 then
		local v63 = v62.Hitbox
		if v63 then
			v62.PollinateSound = v_u_44(v63, v62.PollinateSound, "Pollinate")
		end
	else
		local v64 = v62.PollinateSound
		if v64 then
			v64:Stop()
			v64:Destroy()
		end
		v62.PollinateSound = nil
		return
	end
end
local function v_u_68(p65, p66) -- name: ShouldShowEntry
	-- upvalues: (copy) v_u_15, (copy) v_u_10
	if p66.Server.BeeName == "Wasp" then
		return true
	end
	if string.match(p65, "^Player_%d+$") == nil then
		return true
	end
	if p65 == ("Player_%*"):format(v_u_15.UserId) then
		return true
	end
	local v67 = v_u_15:GetAttribute("OtherPlayerBeeColonyVisibility")
	if v67 == nil then
		v67 = v_u_10:GetSetting("OtherPlayerBeeColonyVisibility")
	end
	return v67 ~= false
end
local function v_u_72(p69, p70) -- name: SetModelLocalVisibility
	if p69 then
		for _, v71 in p69:GetDescendants() do
			if v71:IsA("BasePart") then
				v71.LocalTransparencyModifier = p70 and 0 or 1
			end
		end
	end
end
local function v_u_76(p73, p74) -- name: LoadEntryModel
	-- upvalues: (copy) v_u_8, (copy) v_u_72, (copy) v_u_5
	v_u_8(p73, p74)
	v_u_72(p73.Client.Model, p73.Client.IsVisible ~= false)
	if v_u_5[p73.Server.BeeName].IdleSound then
		local v75 = Instance.new("Sound")
		v75.SoundId = v_u_5[p73.Server.BeeName].IdleSound
		v75.Looped = true
		v75.Volume = 0.18
		v75.Parent = p73.Client.Hitbox
		p73.Client.IdleSound = v75
	end
end
local function v_u_86(_, p77, p78, p79) -- name: SetEntryVisible
	-- upvalues: (copy) v_u_76, (copy) v_u_72, (copy) v_u_4
	local v80 = p78.Client
	local v81 = v80.Hitbox
	v80.IsVisible = p79
	if v81 then
		v81.CanQuery = p79
		if v80.Model then
			v_u_72(v80.Model, p79)
		else
			task.spawn(v_u_76, p78, p77)
		end
		if p79 then
			if not v_u_4:HasTag(v81, "BeeHover") then
				v_u_4:AddTag(v81, "BeeHover")
				return
			end
		else
			local v82 = v80.FollowPlayerSound
			if v82 then
				v82:Stop()
				v82:Destroy()
			end
			v80.FollowPlayerSound = nil
			local v83 = v80.PollinateSound
			if v83 then
				v83:Stop()
				v83:Destroy()
			end
			v80.PollinateSound = nil
			local v84 = v80.IdleSound
			if v84 then
				v84:Stop()
				v84:Destroy()
			end
			v80.IdleSound = nil
			local v85 = v80.BossSound
			if v85 then
				v85:Stop()
				v85:Destroy()
			end
			v80.BossSound = nil
			if v_u_4:HasTag(v81, "BeeHover") then
				v_u_4:RemoveTag(v81, "BeeHover")
			end
		end
	end
end
local function v_u_91() -- name: RefreshBeeVisibility
	-- upvalues: (copy) v_u_27, (copy) v_u_86, (copy) v_u_68
	for v87, v88 in v_u_27.BeeStates do
		for v89, v90 in v88 do
			v_u_86(v87, v89, v90, (v_u_68(v87, v90)))
		end
	end
end
local function v_u_96(p92) -- name: ApplyBeeAttributes
	-- upvalues: (copy) v_u_5
	local v93 = p92.Client.Hitbox
	if v93 then
		local v94 = p92.Server.BeeName
		local v95
		if v94 then
			v95 = v_u_5[v94]
		else
			v95 = v94
		end
		if v95 then
			v95 = v95.Stats
		end
		v93:SetAttribute("BeeName", v94)
		v93:SetAttribute("BeeIdentifier", p92.Server.Identifier)
		v93:SetAttribute("Speed", p92.Server.Speed)
		v93:SetAttribute("IsIllusion", p92.Server.IsIllusion == true)
		v93:SetAttribute("IllusionCopiedUUID", p92.Server.IllusionCopiedUUID)
		v93:SetAttribute("Health", p92.Server.Health)
		v93:SetAttribute("State", p92.Server.State)
		v93:SetAttribute("BeeState", p92.Server.State)
		v93:SetAttribute("Slot", p92.Server.Slot)
		v93:SetAttribute("BeeSlot", p92.Server.Slot)
		v93:SetAttribute("IsNesting", p92.Server.State == "Nesting")
		if v95 then
			v93:SetAttribute("PollinationQuality", p92.Server.PollinationQuality or v95.PollinationQuality)
			v93:SetAttribute("PollinationRate", p92.Server.PollinationRate or v95.PollinationRate)
		end
	end
end
local v_u_97 = {}
local function v_u_114(p98) -- name: ProcessSynchronize
	-- upvalues: (copy) v_u_27, (copy) v_u_28, (copy) v_u_97, (ref) v_u_29, (copy) v_u_4, (copy) v_u_96, (copy) v_u_86, (copy) v_u_68, (copy) v_u_25
	for _, v99 in v_u_27.BeeStates do
		for _, v100 in v99 do
			local v101 = v100.Client
			local v102 = v101.FollowPlayerSound
			if v102 then
				v102:Stop()
				v102:Destroy()
			end
			v101.FollowPlayerSound = nil
			local v103 = v101.PollinateSound
			if v103 then
				v103:Stop()
				v103:Destroy()
			end
			v101.PollinateSound = nil
			local v104 = v101.IdleSound
			if v104 then
				v104:Stop()
				v104:Destroy()
			end
			v101.IdleSound = nil
			local v105 = v101.BossSound
			if v105 then
				v105:Stop()
				v105:Destroy()
			end
			v101.BossSound = nil
			if v100.Client.Hitbox then
				v100.Client.Hitbox:Destroy()
			end
			if v100.Client.HealthBar then
				v100.Client.HealthBar:Destroy()
			end
		end
	end
	table.clear(v_u_27.BeeStates)
	table.clear(v_u_28)
	table.clear(v_u_97)
	v_u_29 = true
	for v106, v107 in p98 do
		local v108 = {}
		for v109, v110 in v107.ActiveBees do
			local v111 = {
				["CFrame"] = v110.CFrame or CFrame.identity,
				["BeeName"] = v110.BeeName,
				["Speed"] = v110.Speed,
				["PollinationQuality"] = v110.PollinationQuality,
				["PollinationRate"] = v110.PollinationRate,
				["State"] = v110.State,
				["Health"] = v110.Health,
				["LastAttack"] = v110.LastAttack,
				["LastHealTime"] = v110.LastHealTime,
				["TargetPlayer"] = v110.TargetPlayer,
				["TargetBee"] = v110.TargetBee,
				["GuardObject"] = v110.GuardObject,
				["Player"] = v106,
				["Identifier"] = v110.Identifier,
				["PollinatingPlant"] = v110.PollinatingPlant,
				["IsIllusion"] = v110.IsIllusion,
				["IllusionOwnerUUID"] = v110.IllusionOwnerUUID,
				["IllusionCopiedUUID"] = v110.IllusionCopiedUUID,
				["Custom"] = v110.Custom,
				["Slot"] = v110.Slot,
				["WaspStunExpiresAt"] = v110.WaspStunExpiresAt,
				["WaspPoisonTick"] = v110.WaspPoisonTick,
				["DidDie"] = v110.DidDie
			}
			local v112 = Instance.new("Part")
			v112.Size = Vector3.new(1, 1, 1)
			v112.Shape = Enum.PartType.Ball
			v112.Anchored = true
			v112.CanCollide = false
			v112.CanQuery = true
			v112.Color = Color3.fromRGB(255, 200, 0)
			v112.Material = Enum.Material.Neon
			v112.CFrame = v111.CFrame
			v_u_4:AddTag(v112, "BeeHover")
			v112.Parent = workspace
			v108[v109] = {
				["Server"] = v111,
				["Client"] = {
					["Hitbox"] = nil,
					["FromCFrame"] = nil,
					["ToCFrame"] = nil,
					["LerpAlpha"] = 1,
					["Hitbox"] = v112,
					["FromCFrame"] = v111.CFrame,
					["ToCFrame"] = v111.CFrame
				}
			}
			v_u_96(v108[v109])
			local v113 = v108[v109].Client
			v_u_28[v111.Identifier] = v111
			v_u_97[v111.Identifier] = v113
			v_u_86(v106, v109, v108[v109], (v_u_68(v106, v108[v109])))
			v_u_25.OnBeeCreated:Fire(v109, v108[v109])
		end
		v_u_27.BeeStates[v106] = v108
	end
end
local function v_u_126(p115) -- name: ProcessCreate
	-- upvalues: (copy) v_u_27, (copy) v_u_4, (copy) v_u_96, (copy) v_u_28, (copy) v_u_97, (copy) v_u_86, (copy) v_u_68, (copy) v_u_5, (copy) v_u_25
	for v116, v117 in p115 do
		if not v_u_27.BeeStates[v116] then
			v_u_27.BeeStates[v116] = {}
		end
		local v118 = v_u_27.BeeStates[v116]
		for v119, v120 in v117 do
			local v121 = {
				["CFrame"] = v120.CFrame or CFrame.identity,
				["BeeName"] = v120.BeeName,
				["Speed"] = v120.Speed,
				["PollinationQuality"] = v120.PollinationQuality,
				["PollinationRate"] = v120.PollinationRate,
				["State"] = v120.State,
				["Health"] = v120.Health,
				["LastAttack"] = v120.LastAttack,
				["LastHealTime"] = v120.LastHealTime,
				["TargetPlayer"] = v120.TargetPlayer,
				["TargetBee"] = v120.TargetBee,
				["GuardObject"] = v120.GuardObject,
				["Player"] = v116,
				["Identifier"] = v120.Identifier,
				["IsIllusion"] = v120.IsIllusion,
				["IllusionOwnerUUID"] = v120.IllusionOwnerUUID,
				["IllusionCopiedUUID"] = v120.IllusionCopiedUUID,
				["Slot"] = v120.Slot,
				["WaspStunExpiresAt"] = v120.WaspStunExpiresAt,
				["WaspPoisonTick"] = v120.WaspPoisonTick,
				["DidDie"] = v120.DidDie
			}
			local v122 = Instance.new("Part")
			v122.Size = Vector3.new(1, 1, 1)
			v122.Shape = Enum.PartType.Ball
			v122.Anchored = true
			v122.CanCollide = false
			v122.CanQuery = false
			v122.Color = Color3.fromRGB(255, 200, 0)
			v122.Material = Enum.Material.Neon
			v122.CFrame = v121.CFrame
			v_u_4:AddTag(v122, "BeeHover")
			v122.Parent = workspace
			v118[v119] = {
				["Server"] = v121,
				["Client"] = {
					["Hitbox"] = nil,
					["FromCFrame"] = nil,
					["ToCFrame"] = nil,
					["LerpAlpha"] = 1,
					["PreviousDistance"] = 0,
					["UseSpring"] = false,
					["Hitbox"] = v122,
					["FromCFrame"] = v121.CFrame,
					["ToCFrame"] = v121.CFrame
				}
			}
			v_u_96(v118[v119])
			local v123 = v118[v119]
			v_u_28[v120.Identifier] = v121
			v_u_97[v120.Identifier] = v123.Client
			v_u_86(v116, v119, v123, (v_u_68(v116, v123)))
			local v124 = v_u_5[v123.Server.BeeName].SpawnSound
			if v124 and v_u_68(v116, v123) then
				local v_u_125 = Instance.new("Sound")
				v_u_125.SoundId = v124
				v_u_125.Looped = false
				v_u_125.Parent = v122
				v_u_125:Play()
				v_u_125.Ended:Once(function()
					-- upvalues: (copy) v_u_125
					v_u_125:Destroy()
				end)
			end
			v_u_25.OnBeeCreated:Fire(v119, v123)
		end
	end
end
local function v_u_134(p127) -- name: playHurtEffects
	-- upvalues: (copy) v_u_5
	local v128 = p127.Client
	local v129 = p127.Server
	local v_u_130 = Instance.new("Highlight")
	v_u_130.FillTransparency = 0.5
	v_u_130.OutlineTransparency = 1
	v_u_130.OutlineColor = Color3.fromRGB(255, 0, 0)
	v_u_130.Parent = v128.Model
	task.delay(0.3, function()
		-- upvalues: (copy) v_u_130
		v_u_130:Destroy()
	end)
	if v128.DamagedAnimation then
		v128.DamagedAnimation:Play()
	end
	local v131 = v128.Hitbox
	if v131 then
		local v132 = v_u_5[v129.BeeName].DamagedSound
		if v132 then
			local v_u_133 = Instance.new("Sound")
			if typeof(v132) ~= "string" then
				v132 = v132[math.random(1, #v132)]
			end
			v_u_133.SoundId = v132
			v_u_133.Looped = false
			v_u_133.Parent = v131
			v_u_133:Play()
			v_u_133.Ended:Once(function()
				-- upvalues: (copy) v_u_133
				v_u_133:Destroy()
			end)
		end
	else
		return
	end
end
local function v_u_137(p135) -- name: EmitAttachment
	for _, v136 in p135:GetDescendants() do
		if v136:IsA("ParticleEmitter") then
			v136:Emit(v136:GetAttribute("EmitCount") or v136.Rate)
		end
	end
end
local function v_u_143(p138) -- name: PlayPoisonTickVFX
	-- upvalues: (copy) v_u_20, (copy) v_u_137
	local v139 = p138.Client.Hitbox
	if v139 then
		if p138.Client.IsVisible == false then
			return
		else
			local v140 = v_u_20:FindFirstChild("Poison")
			if v140 then
				local v141 = v140:FindFirstChild("Emit", true)
				if v141 and v141:IsA("Attachment") then
					local v_u_142 = v141:Clone()
					v_u_142.Parent = v139
					v_u_137(v_u_142)
					task.delay(2, function()
						-- upvalues: (copy) v_u_142
						if v_u_142.Parent then
							v_u_142:Destroy()
						end
					end)
				end
			else
				return
			end
		end
	else
		return
	end
end
local function v_u_150(p144, p145) -- name: SetStunnedVFX
	-- upvalues: (copy) v_u_20
	local v146 = p144.Client
	local v147 = v146.Hitbox
	if v147 then
		if p145 then
			if v146.IsVisible == false then
				return
			elseif v146.StunnedVFX then
				return
			else
				local v148 = v_u_20:FindFirstChild("Stunned")
				if v148 then
					local v149 = v148:FindFirstChild("Stunned", true)
					if v149 and v149:IsA("Attachment") then
						v146.StunnedVFX = v149:Clone()
						v146.StunnedVFX.Parent = v147
					end
				else
					return
				end
			end
		else
			if v146.StunnedVFX then
				v146.StunnedVFX:Destroy()
				v146.StunnedVFX = nil
			end
			return
		end
	else
		return
	end
end
local function v_u_154(p151) -- name: playFullHealEffect
	-- upvalues: (copy) v_u_20, (copy) v_u_13
	local v152 = p151.Client
	local _ = p151.Server
	local v_u_153 = v_u_20:FindFirstChild("Live"):Clone()
	v_u_153.Position = v152.Hitbox.Position
	v_u_153.Parent = v152.Hitbox
	v_u_13:EmitParticles(v_u_153)
	task.delay(1, function()
		-- upvalues: (copy) v_u_153
		v_u_153:Destroy()
	end)
end
local function v_u_158(p155) -- name: playHealEffect
	local v156 = p155.Client
	local _ = p155.Server
	local v_u_157 = Instance.new("Highlight")
	v_u_157.FillTransparency = 0.5
	v_u_157.OutlineTransparency = 1
	v_u_157.FillColor = Color3.fromRGB(0, 255, 0)
	v_u_157.Parent = v156.Model
	task.delay(0.3, function()
		-- upvalues: (copy) v_u_157
		v_u_157:Destroy()
	end)
end
local function v_u_161(p159) -- name: playDeathVFX
	-- upvalues: (copy) v_u_20, (copy) v_u_13
	local v_u_160 = v_u_20:FindFirstChild("Die"):Clone()
	v_u_160.Position = p159
	v_u_160.Parent = workspace
	v_u_13:EmitParticles(v_u_160)
	task.delay(1, function()
		-- upvalues: (copy) v_u_160
		v_u_160:Destroy()
	end)
end
local function v_u_166(p162) -- name: playDeathSoundEffect
	-- upvalues: (copy) v_u_5
	local v163 = v_u_5[p162.Server.BeeName].DeathSound
	if v163 then
		local v164 = Instance.new("Sound")
		v164.SoundId = v163
		v164.Looped = false
		local v_u_165 = Instance.new("Part")
		v_u_165.Anchored = true
		v_u_165.CanCollide = false
		v_u_165.CanQuery = false
		v_u_165.CanTouch = false
		v_u_165.Transparency = 1
		v_u_165.Position = p162.Client.Hitbox.Position
		v_u_165.Parent = workspace
		v164.Parent = v_u_165
		v164:Play()
		v164.Ended:Once(function()
			-- upvalues: (copy) v_u_165
			v_u_165:Destroy()
		end)
	end
end
local v_u_167 = Color3.fromRGB(220, 50, 50)
local v_u_168 = Color3.fromRGB(160, 50, 220)
function v_u_25.UpdateHealthBar(_, p169, p170, p171) -- name: UpdateHealthBar
	-- upvalues: (copy) v_u_5, (copy) v_u_3, (copy) v_u_15, (copy) v_u_168, (copy) v_u_167
	local v172 = p169.Client.HealthBar
	if v172 then
		local v173 = p169.Server
		if v_u_5[v173.BeeName] then
			local v174 = v_u_5[p169.Server.BeeName]
			local v175
			if v174 then
				v175 = v174.Stats.MaxHealth
				if p169.Server.Player == ("Player_%*"):format(v_u_3.LocalPlayer.UserId) then
					v175 = v175 + (v_u_15:GetAttribute("BeeHealthBonus") or 0)
				end
			else
				v175 = 1
			end
			local v176 = v173.State == "Nesting"
			v172.StudsOffsetWorldSpace = v176 and Vector3.new(0, 0, 0) or Vector3.new(0, -4, 0)
			v172.MaxDistance = v176 and 75 or 50
			local v177 = p171 or v173.Health
			local v178 = v175 <= 0 and 0 or v177 / v175
			local v179
			if v173.Player == "wasp-colony" then
				v179 = v_u_168
			else
				v179 = v_u_167
			end
			local v180 = p169.Client.HeartBaseRotations
			for v181 = 1, 4 do
				local v182 = v172:FindFirstChild((tostring(v181)))
				if v182 then
					local v183 = v182:FindFirstChild("Heart")
					if v183 then
						local v184 = (v178 - (v181 - 1) * 0.25) / 0.25
						local v185 = math.clamp(v184, 0, 1)
						v182.Visible = v185 > 0
						v183.ImageColor3 = v179
						local v186 = v183:FindFirstChildOfClass("UIGradient")
						if v186 and v180 then
							local v187 = v180[v181] + (1 - v185) * 92
							local v188 = v180[v181]
							local v189 = v180[v181] + 92
							v186.Rotation = math.clamp(v187, v188, v189)
						end
					end
				end
			end
			local v190 = v_u_15:GetAttribute("ShovelOnCooldown") or (v_u_15:GetAttribute("InWaspCombat") or false)
			local v191 = v178 < 1
			local _ = v172.Enabled
			if v191 then
				v191 = v190 or p170 == ("Player_%*"):format(v_u_3.LocalPlayer.UserId)
			end
			v172.Enabled = v191
		end
	else
		return
	end
end
local function v_u_210(p192) -- name: ProcessStateUpdate
	-- upvalues: (copy) v_u_27, (copy) v_u_3, (copy) v_u_34, (copy) v_u_12, (copy) v_u_5, (copy) v_u_15, (copy) v_u_25, (copy) v_u_68, (copy) v_u_134, (copy) v_u_14, (copy) v_u_158, (copy) v_u_154, (copy) v_u_161, (copy) v_u_166, (copy) v_u_143, (copy) v_u_150, (ref) v_u_33, (copy) v_u_1, (copy) v_u_96
	for v193, v194 in p192 do
		local v195 = v_u_27.BeeStates[v193]
		if v195 then
			for v196, v197 in v194 do
				local v_u_198 = v195[v196]
				if v_u_198 then
					for v199, v200 in v197 do
						if v199 == "DidDie" and (v200 == true and (v193 == ("Player_%*"):format(v_u_3.LocalPlayer.UserId) and (v_u_198.Server.BeeName ~= "Skeleton Bee" and not v_u_34[v196]))) then
							v_u_34[v196] = true
							v_u_12:CreateNotification((("Your %* was defeated in combat!"):format(v_u_198.Server.BeeName)))
						end
						if v199 == "Health" then
							local v201 = v_u_5[v_u_198.Server.BeeName]
							local v202
							if v201 then
								v202 = v201.Stats.MaxHealth
								if v_u_198.Server.Player == ("Player_%*"):format(v_u_3.LocalPlayer.UserId) then
									v202 = v202 + (v_u_15:GetAttribute("BeeHealthBonus") or 0)
								end
							else
								v202 = 1
							end
							v_u_25:UpdateHealthBar(v_u_198, v193, v200)
							if v200 < v_u_198.Server[v199] and v_u_68(v193, v_u_198) then
								local v203 = v_u_198.Server[v199] - v200
								v_u_134(v_u_198)
								v_u_14({
									["Position"] = (v_u_198.Client.SmoothedCFrame or (v_u_198.Client.PredictedCFrame or v_u_198.Server.CFrame)).Position,
									["Text"] = ("%*"):format((math.floor(v203))),
									["textColor"] = Color3.fromRGB(255, 80, 80)
								})
							end
							if v_u_198.Server[v199] < v200 and v_u_68(v193, v_u_198) then
								v_u_158(v_u_198)
							end
							if v200 == v202 and (v193 == ("Player_%*"):format(v_u_3.LocalPlayer.UserId) and v_u_68(v193, v_u_198)) then
								v_u_34[v196] = nil
								v_u_154(v_u_198)
								if v_u_198.Server.State == "Nesting" then
									v_u_12:CreateNotification((("Your %* rejoined the battle!"):format(v_u_198.Server.BeeName)))
								end
								local v_u_204 = v_u_198.Client.HealthBar
								if v_u_204 then
									if v_u_198.Client.HealthBarThread then
										task.cancel(v_u_198.Client.HealthBarThread)
									end
									v_u_198.Client.HealthBarThread = task.delay(2, function()
										-- upvalues: (copy) v_u_204, (copy) v_u_198
										v_u_204.Enabled = false
										v_u_198.Client.HealthBarThread = nil
									end)
								end
							end
							if v_u_198.Server.Health > 0 and (v200 <= 0 and v_u_68(v193, v_u_198)) then
								v_u_161((v_u_198.Client.SmoothedCFrame or (v_u_198.Client.PredictedCFrame or v_u_198.Server.CFrame)).Position)
								v_u_166(v_u_198)
							end
						end
						if v199 == "WaspPoisonTick" then
							v_u_143(v_u_198)
						end
						if v199 == "WaspStunExpiresAt" then
							local v205 = v_u_150
							local v206
							if v200 then
								v206 = workspace:GetServerTimeNow() < v200
							else
								v206 = v200
							end
							v205(v_u_198, v206)
						end
						if v199 == "LastAttack" and v193 == ("Player_%*"):format(v_u_3.LocalPlayer.UserId) then
							v_u_15:SetAttribute("InWaspCombat", true)
							if v_u_33 then
								task.cancel(v_u_33)
							end
							v_u_33 = task.delay(10, function()
								-- upvalues: (ref) v_u_15, (ref) v_u_33
								v_u_15:SetAttribute("InWaspCombat", false)
								v_u_33 = nil
							end)
						end
						if v199 == "State" and (v200 == "Nesting" and v_u_198.Server.DidDie) then
							local v207 = v_u_198.Server.Slot
							local v208 = v_u_198.Client.ResolvedSlot
							if not v208 and v207 then
								v208 = require(v_u_1.Modules.GetFarm)(v_u_15)
								if v208 then
									v208 = v208:FindFirstChild("CurrentExpansion")
								end
								if v208 then
									v208 = v208:FindFirstChild("Custom")
								end
								if v208 then
									v208 = v208:FindFirstChild("Hive")
								end
								if v208 then
									v208 = v208:FindFirstChild((tostring(v207)))
								end
							end
							if v208 then
								local v209 = v208.CFrame * CFrame.Angles(0, 3.141592653589793, 0) * CFrame.new(0, -0.5, 0)
								v_u_198.Client.PredictedCFrame = v209
								v_u_198.Client.SmoothedCFrame = v209
								v_u_198.Client.LockFacing = true
							end
						end
						v_u_25.OnBeeStateUpdate:Fire(v196, v_u_198, v199, v200)
						v_u_198.Server[v199] = v200
					end
					v_u_96(v_u_198)
				end
			end
		end
	end
end
local function v_u_223(p211) -- name: ProcessDestroy
	-- upvalues: (copy) v_u_27, (copy) v_u_161, (copy) v_u_25, (copy) v_u_28, (copy) v_u_97, (copy) v_u_34
	for v212, v213 in p211 do
		local v214 = v_u_27.BeeStates[v212]
		if v214 then
			for v215 in v213 do
				local v216 = v214[v215]
				if v216 then
					v_u_161((v216.Client.SmoothedCFrame or (v216.Client.PredictedCFrame or v216.Server.CFrame)).Position)
					v_u_25.OnBeeDestroyed:Fire(v215, v216)
					local v217 = v216.Server.Identifier
					v_u_28[v217] = nil
					v_u_97[v217] = nil
					local v218 = v216.Client
					local v219 = v218.FollowPlayerSound
					if v219 then
						v219:Stop()
						v219:Destroy()
					end
					v218.FollowPlayerSound = nil
					local v220 = v218.PollinateSound
					if v220 then
						v220:Stop()
						v220:Destroy()
					end
					v218.PollinateSound = nil
					local v221 = v218.IdleSound
					if v221 then
						v221:Stop()
						v221:Destroy()
					end
					v218.IdleSound = nil
					local v222 = v218.BossSound
					if v222 then
						v222:Stop()
						v222:Destroy()
					end
					v218.BossSound = nil
					if v216.Client.Hitbox then
						v216.Client.Hitbox:Destroy()
					end
					if v216.Client.HealthBar then
						v216.Client.HealthBar:Destroy()
					end
					v_u_34[v215] = nil
					v214[v215] = nil
				end
			end
		end
	end
end
local function v_u_225(p224) -- name: OnReliable
	-- upvalues: (copy) v_u_114, (copy) v_u_126, (copy) v_u_210, (copy) v_u_223
	if p224.Synchronize then
		v_u_114(p224.Synchronize)
	else
		if p224.Create then
			v_u_126(p224.Create)
		end
		if p224.StateUpdate then
			v_u_210(p224.StateUpdate)
		end
		if p224.Destroy then
			v_u_223(p224.Destroy)
		end
	end
end
local function v_u_234(p226) -- name: OnUnreliable
	-- upvalues: (ref) v_u_29, (copy) v_u_7, (copy) v_u_28, (copy) v_u_97
	if v_u_29 then
		for v227, v228 in v_u_7(p226) do
			local v229 = v_u_28[v227]
			if v229 then
				v229.CFrame = CFrame.new(v228)
			end
			local v230 = v_u_97[v227]
			if v230 then
				local v231 = CFrame.new(v228)
				local v232 = (v228 - v230.ToCFrame.Position).Magnitude
				local v233
				if (v230.PreviousDistance or 0) > 1 then
					v233 = v232 < 0.5
				else
					v233 = false
				end
				v230.UseSpring = v233
				v230.PreviousDistance = v232
				v230.FromCFrame = v230.ToCFrame
				v230.ToCFrame = v231
				v230.LerpAlpha = 0
			end
		end
	end
end
function v_u_25.GetBeesInRadius(_, p235, p236, p237) -- name: GetBeesInRadius
	-- upvalues: (copy) v_u_25
	local v238 = (p235.X - p236) / 4
	local v239 = math.floor(v238)
	local v240 = (p235.X + p236) / 4
	local v241 = {}
	for v242 = v239, math.floor(v240) do
		local v243 = (p235.Y - p236) / 4
		local v244 = math.floor(v243)
		local v245 = (p235.Y + p236) / 4
		for v246 = v244, math.floor(v245) do
			local v247 = (p235.Z - p236) / 4
			local v248 = math.floor(v247)
			local v249 = (p235.Z + p236) / 4
			for v250 = v248, math.floor(v249) do
				local v251 = v242 * 4
				local v252 = v246 * 4
				local v253 = v250 * 4
				local v254 = Vector3.new(v251, v252, v253)
				if v_u_25.State.SpatialGrid[v254] then
					for v255, v256 in v_u_25.State.SpatialGrid[v254] do
						if ((v256.Client.PredictedCFrame or (v256.Client.SmoothedCFrame or v256.Server.CFrame)).Position - p235).Magnitude <= p236 and (not p237 or p237(v255, v256)) then
							v241[v255] = v256
						end
					end
				end
			end
		end
	end
	return v241
end
function v_u_25.GetEntry(_, p257, p258) -- name: GetEntry
	-- upvalues: (copy) v_u_27
	local v259
	if typeof(p257) == "string" then
		v259 = v_u_27.BeeStates[p257]
	else
		v259 = v_u_27.BeeStates[("Player_%*"):format(p257.UserId)]
	end
	if v259 then
		return v259[p258]
	end
	warn("[BeeColonyStateController] Player not found: ", p257)
	return nil
end
function v_u_25.GetHitbox(_, p260, p261) -- name: GetHitbox
	-- upvalues: (copy) v_u_25
	local v262 = v_u_25:GetEntry(p260, p261)
	if v262 then
		return v262.Client.Hitbox
	else
		return nil
	end
end
local function v_u_268(p263, p264) -- name: playAttackVFX
	-- upvalues: (copy) v_u_20, (copy) v_u_13
	local v265 = p264.Client.PredictedCFrame or (p264.Client.SmoothedCFrame or p264.Server.CFrame)
	local v266 = p263.Client.PredictedCFrame or (p263.Client.SmoothedCFrame or p264.Server.CFrame)
	if p263.Client.RenderOffset then
		v266 = v266 * p263.Client.RenderOffset
	end
	if p264.Client.RenderOffset then
		v265 = v265 * p264.Client.RenderOffset
	end
	local v_u_267 = v_u_20.Attack:Clone()
	v_u_267.CFrame = CFrame.lookAt(v266.Position, v265.Position)
	v_u_267.Parent = workspace
	v_u_13:EmitParticles(v_u_267)
	task.delay(1, function()
		-- upvalues: (copy) v_u_267
		v_u_267:Destroy()
	end)
end
function v_u_25.Routine(_, p269) -- name: Routine
	-- upvalues: (copy) v_u_59, (copy) v_u_27, (copy) v_u_3, (copy) v_u_24, (copy) v_u_5, (copy) v_u_25, (copy) v_u_268, (copy) v_u_44
	v_u_59()
	for v270, v271 in v_u_27.BeeStates do
		local v272 = string.split(v270, "_")[2]
		local v273 = tonumber(v272)
		local v274
		if v273 then
			v274 = v_u_3:GetPlayerByUserId(v273)
		else
			v274 = v270
		end
		if v274 ~= nil then
			local v275 = {}
			for v276 in v_u_24 do
				v275[v276] = {}
			end
			for v277, v278 in v271 do
				if v278.Client.IsVisible ~= false then
					if workspace:GetServerTimeNow() - v278.Server.LastAttack < v_u_5[v278.Server.BeeName].Stats.AttackCooldown then
						local v279 = v_u_25:GetEntry(v278.Server.TargetPlayer, v278.Server.TargetBee)
						if v279 and not v278.Client.AttackAnimationPlayed then
							v_u_268(v278, v279)
						end
						if not v278.Client.AttackAnimationPlayed then
							v278.Client.AttackAnimation:Play()
							v278.Client.AttackAnimation:AdjustSpeed(3)
							v278.Client.AttackAnimationPlayed = true
						end
					else
						v278.Client.AttackAnimationPlayed = false
					end
					local v280 = v278.Client.PredictedState or v278.Server.State
					local v281 = v280 == "FollowPlayer" and true or v280 == "Pollinate"
					local v282 = v278.Client
					if v281 and not v282.AllowFollowPlayerSound then
						v281 = false
					end
					if v281 then
						local v283 = v282.Hitbox
						if v283 then
							v282.FollowPlayerSound = v_u_44(v283, v282.FollowPlayerSound, "FollowPlayer")
						end
					else
						local v284 = v282.FollowPlayerSound
						if v284 then
							v284:Stop()
							v284:Destroy()
						end
						v282.FollowPlayerSound = nil
					end
					if v280 ~= "Pollinate" then
						v_u_25:SetPollinateSoundEnabled(v278, false)
					end
					local v285 = v275[v278.Client.IsSpawning and "Spawning" or v280]
					if v285 then
						v285[v277] = v278
					end
				end
			end
			for v286, v287 in v275 do
				local v288 = v_u_24[v286]
				if v288 then
					local v289, v290 = pcall(v288, v270, p269, v287)
					if not v289 then
						warn((("[BeeColony] %* handler error: %*"):format(v286, v290)))
					end
				end
			end
		end
	end
end
local v_u_291 = 0
local v_u_292 = 0
local function v_u_298(p293) -- name: PlayRewardPopSound
	-- upvalues: (ref) v_u_292, (ref) v_u_291
	local v294 = os.clock()
	if v294 - v_u_292 > 0.35 then
		v_u_291 = 0
	end
	v_u_291 = v_u_291 + 1
	v_u_292 = v294
	local v_u_295 = Instance.new("Part")
	v_u_295.Name = "RewardPopSound"
	v_u_295.Anchored = true
	v_u_295.CanCollide = false
	v_u_295.CanQuery = false
	v_u_295.CanTouch = false
	v_u_295.Transparency = 1
	v_u_295.Size = Vector3.new(1, 1, 1)
	v_u_295.Position = p293
	v_u_295.Parent = workspace
	local v296 = Instance.new("Sound")
	v296.SoundId = "rbxassetid://6586979979"
	v296.Volume = 0.45
	local v297 = (v_u_291 - 1) * 0.08 + 1
	v296.PlaybackSpeed = math.clamp(v297, 1, 1.75)
	v296.Parent = v_u_295
	v296:Play()
	v296.Ended:Once(function()
		-- upvalues: (copy) v_u_295
		v_u_295:Destroy()
	end)
	task.delay(2, function()
		-- upvalues: (copy) v_u_295
		if v_u_295.Parent then
			v_u_295:Destroy()
		end
	end)
end
local function v_u_302(p299) -- name: PreparePickupModel
	local v300 = nil
	if not p299:IsA("BasePart") then
		if p299:IsA("Model") then
			v300 = p299.PrimaryPart or p299:FindFirstChildWhichIsA("BasePart", true)
			if v300 then
				p299.PrimaryPart = v300
			end
			for _, v301 in p299:GetDescendants() do
				if v301:IsA("BasePart") then
					v301.Anchored = true
					v301.CanCollide = false
					v301.CanQuery = false
					v301.CanTouch = false
				end
			end
		end
		return v300
	end
	p299.Anchored = true
	p299.CanCollide = false
	p299.CanQuery = false
	p299.CanTouch = false
	return p299
end
local function v_u_344(p303, p304, p305, p306, p_u_307) -- name: PlayRewardPickup
	-- upvalues: (copy) v_u_22, (copy) v_u_23, (copy) v_u_15, (copy) v_u_302, (copy) v_u_2, (copy) v_u_298
	local v308
	if p303 == "RoyalJelly" then
		v308 = v_u_22
	elseif p303 == "HoneyCoins" then
		v308 = v_u_23
	else
		v308 = nil
	end
	if v308 then
		local v309 = v_u_15.Character
		if v309 then
			v309 = v309:FindFirstChild("HumanoidRootPart")
		end
		if v309 and v309:IsA("BasePart") then
			local v310 = v308:Clone()
			v310.Name = ("%*Pickup"):format(p303)
			local v311 = workspace:FindFirstChild("BeeRewardPickups")
			if not v311 then
				v311 = Instance.new("Folder")
				v311.Name = "BeeRewardPickups"
				v311.Parent = workspace
			end
			v310.Parent = v311
			if v_u_302(v310) then
				local v_u_312 = v308:Clone()
				v_u_312.Name = ("%*Pickup"):format(p303)
				local v313 = workspace:FindFirstChild("BeeRewardPickups")
				if not v313 then
					v313 = Instance.new("Folder")
					v313.Name = "BeeRewardPickups"
					v313.Parent = workspace
				end
				v_u_312.Parent = v313
				local v_u_314 = v_u_302(v_u_312)
				if v_u_314 then
					local v315 = 6.283185307179586 * (p305 / math.max(p306, 1))
					local v316 = math.random(25, 45) / 10
					local v317 = math.cos(v315) * v316
					local v318 = math.random(18, 35) / 10
					local v319 = math.sin(v315) * v316
					local v320 = Vector3.new(v317, v318, v319)
					local v_u_321 = p304 + Vector3.new(0, 1.25, 0)
					local v_u_322 = v_u_321 + v320
					local v323 = CFrame.new(v_u_321)
					if v_u_312:IsA("Model") then
						v_u_312:PivotTo(v323)
					elseif v_u_312:IsA("BasePart") then
						v_u_312.CFrame = v323
					end
					local v_u_324 = 0.18 + math.random() * 0.06
					local v_u_325 = 0.45 + math.random() * 0.12
					task.delay((p305 - 1) * 0.025, function()
						-- upvalues: (copy) v_u_312, (copy) v_u_324, (copy) v_u_321, (copy) v_u_322, (ref) v_u_2, (ref) v_u_15, (copy) v_u_325, (copy) v_u_314, (ref) v_u_298, (copy) p_u_307
						if not v_u_312.Parent then
							return
						end
						local v326 = os.clock()
						while v_u_312.Parent do
							local v327 = (os.clock() - v326) / v_u_324
							local v328 = math.clamp(v327, 0, 1)
							local v329 = v_u_321:Lerp(v_u_322, 1 - (1 - v328) * (1 - v328))
							local v330 = v_u_312
							local v331 = CFrame.new(v329) * CFrame.Angles(0, os.clock() * 8, 0)
							if v330:IsA("Model") then
								v330:PivotTo(v331)
							elseif v330:IsA("BasePart") then
								v330.CFrame = v331
							end
							if v328 >= 1 then
								break
							end
							v_u_2.RenderStepped:Wait()
						end
						local v332 = os.clock()
						local v333 = v_u_322
						while v_u_312.Parent do
							local v334 = v_u_15.Character
							if v334 then
								v334 = v334:FindFirstChild("HumanoidRootPart")
							end
							if not (v334 and v334:IsA("BasePart")) then
								break
							end
							local v335 = (os.clock() - v332) / v_u_325
							local v336 = math.clamp(v335, 0, 1)
							local v337 = v336 * v336 * (3 - v336 * 2)
							local v338 = v334.Position + Vector3.new(0, 1.5, 0)
							local v339 = v333:Lerp(v338, 0.5) + Vector3.new(0, 4, 0)
							local v340 = 1 - v337
							local v341 = v340 * v340 * v333 + v340 * 2 * v337 * v339 + v337 * v337 * v338
							local v342 = v_u_312
							local v343 = CFrame.new(v341) * CFrame.Angles(0, os.clock() * 14, 0)
							if v342:IsA("Model") then
								v342:PivotTo(v343)
							elseif v342:IsA("BasePart") then
								v342.CFrame = v343
							end
							if v336 >= 1 then
								break
							end
							v_u_2.RenderStepped:Wait()
						end
						if v_u_312.Parent then
							v_u_298(v_u_314.Position)
							v_u_312:Destroy()
						end
						if p_u_307 then
							p_u_307()
						end
					end)
				else
					v_u_312:Destroy()
				end
			else
				v310:Destroy()
				if p_u_307 then
					p_u_307()
				end
				return
			end
		else
			if p_u_307 then
				p_u_307()
			end
			return
		end
	else
		warn((("Missing pickup model for currency %*"):format(p303)))
		if p_u_307 then
			p_u_307()
		end
		return
	end
end
local function v_u_362(p345) -- name: PlayRewardPickupPacket
	-- upvalues: (copy) v_u_12, (copy) v_u_344
	if typeof(p345) == "table" then
		local v346 = p345.Origin
		local v347 = p345.Rewards
		local v_u_348 = p345.Notifications
		if typeof(v346) == "Vector3" and typeof(v347) == "table" then
			local v_u_349 = 0
			local v_u_350 = 0
			for _, v351 in v347 do
				local v352 = v351.VisualCount or 1
				local v353 = v351.Currency
				if typeof(v353) == "string" and v352 > 0 then
					v_u_349 = v_u_349 + v352
				end
			end
			local function v356() -- name: finishOnePickup
				-- upvalues: (ref) v_u_350, (ref) v_u_349, (copy) v_u_348, (ref) v_u_12
				v_u_350 = v_u_350 + 1
				if v_u_350 >= v_u_349 then
					local v354 = v_u_348
					if typeof(v354) == "table" then
						for _, v355 in v_u_348 do
							if typeof(v355) == "string" then
								v_u_12:CreateNotification(v355)
							end
						end
					end
				end
			end
			if v_u_349 <= 0 then
				if typeof(v_u_348) == "table" then
					for _, v357 in v_u_348 do
						if typeof(v357) == "string" then
							v_u_12:CreateNotification(v357)
						end
					end
				end
			else
				for _, v358 in v347 do
					local v359 = v358.Currency
					local v360 = v358.VisualCount or 1
					if typeof(v359) == "string" then
						for v361 = 1, v360 do
							v_u_344(v359, v346, v361, v360, v356)
						end
					end
				end
			end
		else
			return
		end
	else
		return
	end
end
function v_u_25.Start(_) -- name: Start
	-- upvalues: (copy) v_u_25, (copy) v_u_24, (copy) v_u_9, (copy) v_u_15, (copy) v_u_91, (copy) v_u_18, (copy) v_u_225, (copy) v_u_19, (copy) v_u_234, (copy) v_u_1, (copy) v_u_362, (copy) v_u_2, (ref) v_u_38, (copy) v_u_31, (copy) v_u_32, (copy) v_u_16, (copy) v_u_27, (copy) v_u_35, (copy) v_u_36, (copy) v_u_37, (copy) v_u_150
	for _, v_u_363 in script.States:GetChildren() do
		local v364, v365 = pcall(function()
			-- upvalues: (copy) v_u_363, (ref) v_u_25
			return require(v_u_363)(v_u_25)
		end)
		if v364 then
			v_u_24[v_u_363.Name] = v365
		else
			warn((("Failed to load client state %*: %*"):format(v_u_363.Name, v365)))
		end
	end
	v_u_9(v_u_25)
	v_u_15:GetAttributeChangedSignal("OtherPlayerBeeColonyVisibility"):Connect(v_u_91)
	v_u_91()
	v_u_18.OnClientEvent:Connect(v_u_225)
	v_u_19.OnClientEvent:Connect(v_u_234)
	v_u_18:FireServer("RequestSync")
	v_u_1.GameEvents.BizzyBeeEvent.BeeRewardPickup.OnClientEvent:Connect(v_u_362)
	task.spawn(function()
		-- upvalues: (ref) v_u_25
		while true do
			v_u_25:Routine((task.wait(0.03333333333333333)))
		end
	end)
	v_u_2.RenderStepped:Connect(function(p366)
		-- upvalues: (ref) v_u_38, (ref) v_u_31, (ref) v_u_32, (ref) v_u_15, (ref) v_u_16, (ref) v_u_27, (ref) v_u_25, (ref) v_u_35, (ref) v_u_36, (ref) v_u_37, (ref) v_u_150
		v_u_38 = v_u_38 + 1
		table.clear(v_u_31)
		table.clear(v_u_32)
		local v367 = v_u_15.Character
		if v367 then
			v367 = v367:FindFirstChild("HumanoidRootPart")
		end
		if v367 then
			local v368 = v367.Position
			local v369 = p366 * v_u_16
			local v370 = 0
			for _, v371 in v_u_27.BeeStates do
				for v372, v373 in v371 do
					local v374 = v373.Client
					if v374.Hitbox then
						local v375 = v374.LerpAlpha + v369
						v374.LerpAlpha = math.min(v375, 2)
						local v376
						if v374.PredictedCFrame then
							v376 = v374.PredictedCFrame
						else
							local v377 = v374.LerpAlpha
							if v377 <= 1 then
								v376 = v374.FromCFrame:Lerp(v374.ToCFrame, v377)
							else
								local v378 = v374.ToCFrame.Position - v374.FromCFrame.Position
								v376 = v374.ToCFrame + v378 * (v377 - 1)
							end
						end
						if v376 and v376.Position.Magnitude >= 0.01 then
							local v379 = (v374.SmoothedCFrame or v376).Position
							local v380 = v379.X / 4
							local v381 = math.floor(v380) * 4
							local v382 = v379.Y / 4
							local v383 = math.floor(v382) * 4
							local v384 = v379.Z / 4
							local v385 = math.floor(v384) * 4
							local v386 = Vector3.new(v381, v383, v385)
							local v387 = v374.SmoothedCFrame
							if v387 then
								v387 = v374.SmoothedCFrame.Position
							end
							if not v374.SmoothedCFrame or v374.SmoothedCFrame.Position.Magnitude < 0.01 then
								v374.SmoothedCFrame = v376
							end
							local v388 = v374.SmoothedCFrame
							local v389 = p366 * 10
							v374.SmoothedCFrame = v388:Lerp(v376, (math.min(v389, 1)))
							local v390 = v374.SmoothedCFrame
							local v391 = v390.Position
							local v392 = v391.X / 4
							local v393 = math.floor(v392) * 4
							local v394 = v391.Y / 4
							local v395 = math.floor(v394) * 4
							local v396 = v391.Z / 4
							local v397 = math.floor(v396) * 4
							local v398 = Vector3.new(v393, v395, v397)
							local v399 = v_u_25.State
							if v398 ~= v386 then
								if v399.SpatialGrid[v386] then
									v399.SpatialGrid[v386][v372] = nil
									if not next(v399.SpatialGrid[v386]) then
										v399.SpatialGrid[v386] = nil
									end
								end
								if not v399.SpatialGrid[v398] then
									v399.SpatialGrid[v398] = {}
								end
								v399.SpatialGrid[v398][v372] = v373
							end
							if v374.TargetFacingDirection and v374.FacingDirection then
								v374.FacingDirection = v374.FacingDirection:Lerp(v374.TargetFacingDirection, (math.min(p366, 1)))
							end
							if v387 then
								local v400 = v390.Position - v387
								local v401 = v400.X
								local v402 = v400.Z
								local v403 = Vector3.new(v401, 0, v402)
								if not v374.LockFacing and v403.Magnitude > 0.02 then
									local v404 = v403.Unit
									local v405 = v374.FacingDirection or v404
									local v406 = p366 * 8
									v374.FacingDirection = v405:Lerp(v404, (math.min(v406, 1)))
								end
								if v374.FacingDirection then
									v390 = CFrame.new(v390.Position, v390.Position + v374.FacingDirection)
								end
							end
							v374.SmoothedCFrame = v390
							if v374.RenderOffset then
								v390 = v390 * v374.RenderOffset
							end
							local v407 = (v390.Position - v368).Magnitude
							local v408 = v407 <= v_u_35 and 1 or (v407 <= v_u_36 and 2 or (v407 <= v_u_37 and 4 or 8))
							local v409 = workspace:GetServerTimeNow()
							local v410 = v373.Server.WaspStunExpiresAt
							if v410 then
								v410 = v409 < v373.Server.WaspStunExpiresAt
							end
							v_u_150(v373, v410 == true)
							if (v373.Server.Identifier + v_u_38) % v408 == 0 then
								v370 = v370 + 1
								v_u_31[v370] = v374.Hitbox
								v_u_32[v370] = v390
							end
						end
					end
				end
			end
			if v370 > 0 then
				workspace:BulkMoveTo(v_u_31, v_u_32, Enum.BulkMoveMode.FireCFrameChanged)
			end
		end
	end)
end
v_u_25:Start()
return v_u_25