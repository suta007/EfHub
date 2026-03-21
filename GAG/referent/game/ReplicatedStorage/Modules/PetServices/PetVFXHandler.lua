local v_u_1 = {}
v_u_1.__index = v_u_1
local v_u_2 = game:GetService("ReplicatedStorage")
workspace:WaitForChild("PetsPhysical")
local v_u_3 = {}
local v4 = {
	["Dig"] = {
		["effect"] = "DigEffect",
		["duration"] = 1.5
	}
}
v_u_3.Dog = v4
v_u_3.Hydra = {}
v_u_3.Armadillo = {}
v_u_3["Mantis Shrimp"] = {}
local v5 = {
	["Dig"] = {
		["effect"] = "DigEffect",
		["duration"] = 1.5
	}
}
v_u_3["Golden Lab"] = v5
local v6 = {
	["Nap"] = {
		["effect"] = "ZzzEffect",
		["duration"] = 10
	}
}
v_u_3.Cat = v6
local v7 = {
	["Nap"] = {
		["effect"] = "ZzzEffect",
		["duration"] = 10
	}
}
v_u_3["Orange Tabby"] = v7
local v8 = {
	["Nap"] = {
		["effect"] = "ZzzEffect",
		["duration"] = 10
	}
}
v_u_3["Moon Cat"] = v8
local v9 = {
	["Chomp"] = {
		["effect"] = "CarrotParticles",
		["duration"] = 1.5
	}
}
v_u_3.Bunny = v9
local v10 = {
	["Chomp"] = {
		["effect"] = "CarrotParticles",
		["duration"] = 1.5
	}
}
v_u_3["Black Bunny"] = v10
local v11 = {
	["Chomp"] = {
		["effect"] = "BambooParticles",
		["duration"] = 1.5
	}
}
v_u_3.Panda = v11
local v12 = {
	["Frenzy"] = {
		["effect"] = "MudSplashEffect",
		["duration"] = 15
	}
}
v_u_3.Pig = v12
local v13 = {
	["Roar"] = {
		["effect"] = "FrostBreath",
		["duration"] = 3
	}
}
v_u_3["Polar Bear"] = v13
local v14 = {
	["Pray"] = {
		["effect"] = "ShinyEffect",
		["duration"] = 10
	}
}
v_u_3["Praying Mantis"] = v14
local v15 = {
	["Nurse"] = {
		["effect"] = "MusicNotes",
		["duration"] = 3
	}
}
v_u_3.Kiwi = v15
local v16 = {
	["DigDown"] = {
		["effect"] = "DigAroundEffect",
		["duration"] = 2
	},
	["DigUp"] = {
		["effect"] = "DigAroundEffect",
		["duration"] = 2
	}
}
v_u_3.Mole = v16
local v17 = {
	["Croak"] = {
		["effect"] = "Shockwave",
		["duration"] = 2
	}
}
v_u_3.Frog = v17
local v18 = {
	["Croak"] = {
		["effect"] = "ShockwaveCool",
		["duration"] = 2
	}
}
v_u_3["Echo Frog"] = v18
local v19 = {
	["Zombify"] = {
		["effect"] = "ZombieBeam",
		["duration"] = 2
	}
}
v_u_3["Chicken Zombie"] = v19
local v20 = {
	["Nurse"] = {
		["effect"] = "RedMusicNotes",
		["duration"] = 3
	}
}
v_u_3["Blood Kiwi"] = v20
local v21 = {
	["Pollinate"] = {
		["effect"] = "PollenDrops",
		["duration"] = 5
	}
}
v_u_3.Bee = v21
local v22 = {
	["Pollinate"] = {
		["effect"] = "PollenDrops",
		["duration"] = 5
	}
}
v_u_3["Petal Bee"] = v22
local v23 = {
	["Pollinate"] = {
		["effect"] = "PollenDrops",
		["duration"] = 5
	}
}
v_u_3["Golden Bee"] = v23
local v24 = {
	["Sit"] = {
		["effect"] = "PollenMessy",
		["duration"] = 5
	}
}
v_u_3["Bear Bee"] = v24
local v25 = {
	["Spin"] = {
		["effect"] = "MagicPollenTornado",
		["duration"] = 5
	}
}
v_u_3["Queen Bee"] = v25
local v26 = {
	["Pollinate"] = {
		["effect"] = "PollenDrops",
		["duration"] = 5
	}
}
v_u_3.Wasp = v26
local v27 = {
	["Pollinate"] = {
		["effect"] = "PollenDrops",
		["duration"] = 5
	}
}
v_u_3["Tarantula Hawk"] = v27
local v28 = {
	["Sing"] = {
		["effect"] = "MusicNotes",
		["duration"] = 5
	}
}
v_u_3.Moth = v28
local v29 = {
	["Flutter"] = {
		["effect"] = "RainbowPollenTornado",
		["duration"] = 5
	}
}
v_u_3.Butterfly = v29
local v30 = {
	["Pollinate"] = {
		["effect"] = "RainbowMusicNotes",
		["duration"] = 10
	}
}
v_u_3["Disco Bee"] = v30
local v31 = {
	["Cook"] = {
		["effect"] = "CookBreath",
		["duration"] = 3
	}
}
v_u_3["Cooked Owl"] = v31
local v32 = {
	["Stand"] = {
		["effect"] = "ZzzEffect",
		["duration"] = 10
	}
}
v_u_3.Flamingo = v32
local v33 = {
	["Flip"] = {
		["effect"] = "SandScatter",
		["duration"] = 2
	},
	["Splash"] = {
		["effect"] = "WaterSplash",
		["duration"] = 2
	}
}
v_u_3["Sea Turtle"] = v33
local v34 = {
	["Fan"] = {
		["effect"] = "Shimmer",
		["duration"] = 2
	}
}
v_u_3.Peacock = v34
local v35 = {
	["Spin"] = {
		["effect"] = "MacawLights",
		["duration"] = 3
	}
}
v_u_3["Scarlet Macaw"] = v35
local v36 = {
	["Mimicry"] = {
		["effect"] = "Transform",
		["duration"] = 3
	}
}
v_u_3["Mimic Octopus"] = v36
local v37 = {
	["Spin"] = {
		["effect"] = "MacawLights",
		["duration"] = 3
	}
}
v_u_3["Hyacinth Macaw"] = v37
local v38 = {
	["Frill"] = {
		["effect"] = "FrillPoison",
		["duration"] = 2
	}
}
v_u_3["Dilophosaurus "] = v38
local v39 = {
	["Chomp"] = {
		["effect"] = "CarrotParticles",
		["duration"] = 1.5
	}
}
v_u_3["Bagel Bunny"] = v39
local v40 = {
	["DigDown"] = {
		["effect"] = "DigAroundEffect",
		["duration"] = 2
	},
	["DigUp"] = {
		["effect"] = "DigAroundEffect",
		["duration"] = 2
	}
}
v_u_3["Pancake Mole"] = v40
local v41 = {
	["Roar"] = {
		["effect"] = "FrostBreath",
		["duration"] = 3
	}
}
v_u_3["Sushi Bear"] = v41
local v42 = {
	["Frenzy"] = {
		["effect"] = "MudSplashEffect",
		["duration"] = 15
	}
}
v_u_3["Bacon Pig"] = v42
local v43 = {
	["Pee"] = {
		["effect"] = "MustardSplashEffect",
		["duration"] = 5
	}
}
v_u_3["Hotdog Daschund"] = v43
local v44 = {
	["Boil"] = {
		["effect"] = "Bubbles",
		["duration"] = 5
	}
}
v_u_3["Lobster Thermidor"] = v44
local v45 = {
	["Oil"] = {
		["effect"] = "OilSplashEffect",
		["duration"] = 3
	}
}
v_u_3.Junkbot = v45
local v46 = {
	["Frenzy"] = {
		["effect"] = "MudSplashEffect",
		["duration"] = 15
	}
}
v_u_3["Rainbow Bacon Pig"] = v46
local v47 = {
	["Pee"] = {
		["effect"] = "MustardSplashEffect",
		["duration"] = 5
	}
}
v_u_3["Rainbow Hotdog Daschund"] = v47
local v48 = {
	["Boil"] = {
		["effect"] = "Bubbles",
		["duration"] = 5
	}
}
v_u_3["Rainbow Lobster Thermidor"] = v48
local v49 = {
	["Thump"] = {
		["effect"] = "SandScatter",
		["duration"] = 3
	}
}
v_u_3.Jackalope = v49
local v50 = {
	["Bless"] = {
		["effect"] = "GreenPollenTornado",
		["duration"] = 5
	}
}
v_u_3.Seedling = v50
local v51 = {
	["Tinker"] = {
		["effect"] = "MachineParticles",
		["duration"] = 3
	}
}
v_u_3.Golem = v51
local v52 = {
	["Flaunt"] = {
		["effect"] = "CycloneScatter",
		["duration"] = 7
	}
}
v_u_3.Griffin = v52
local v53 = {
	["Flaunt"] = {
		["effect"] = "CycloneScatter",
		["duration"] = 7
	}
}
v_u_3["Rainbow Griffin"] = v53
local v54 = {
	["Gnoming"] = {
		["effect"] = "Gnomes",
		["duration"] = 7
	}
}
v_u_3.Gnome = v54
local v55 = {
	["Dust"] = {
		["effect"] = "PixieDust",
		["duration"] = 15
	}
}
v_u_3.Pixie = v55
local v56 = {
	["Dive"] = {
		["effect"] = "",
		["duration"] = 15
	},
	["Rebirth"] = {
		["effect"] = "",
		["duration"] = 15
	}
}
v_u_3.Phoenix = v56
local v57 = {
	["Fire"] = {
		["effect"] = "",
		["duration"] = 15
	}
}
v_u_3.Drake = v57
local v58 = {
	["Dive"] = {
		["effect"] = "",
		["duration"] = 15
	},
	["Rebirth"] = {
		["effect"] = "",
		["duration"] = 15
	}
}
v_u_3["Rainbow Phoenix"] = v58
local v59 = {
	["Croak"] = {
		["effect"] = "Shockwave",
		["duration"] = 2
	}
}
v_u_3["Tree Frog"] = v59
local v60 = {
	["Roar"] = {
		["effect"] = "",
		["duration"] = 0
	}
}
v_u_3.Tiger = v60
local v61 = {
	["Perform"] = {
		["effect"] = "MusicNotes",
		["duration"] = 15
	}
}
v_u_3["Idol Chipmunk"] = v61
local v62 = {
	["Dust"] = {
		["effect"] = "Dust",
		["duration"] = 5
	}
}
v_u_3.Chinchilla = v62
local v63 = {
	["Perform"] = {
		["effect"] = "MusicNotes",
		["duration"] = 15
	}
}
v_u_3["Rainbow Idol Chipmunk"] = v63
local v64 = {
	["Dust"] = {
		["effect"] = "Dust",
		["duration"] = 5
	}
}
v_u_3["Rainbow Chinchilla"] = v64
local v65 = {
	["Fortune"] = {
		["effect"] = "CashFlow",
		["duration"] = 3
	}
}
v_u_3["Fortune Squirrel"] = v65
local v66 = {
	["Dig"] = {
		["effect"] = "DigEffect",
		["duration"] = 2
	}
}
v_u_3["Bone Dog"] = v66
local v67 = {
	["Dig"] = {
		["effect"] = "DigEffect",
		["duration"] = 2
	}
}
v_u_3["Ghostly Bone Dog"] = v67
local v68 = {
	["Nap"] = {
		["effect"] = "ZzzEffect",
		["duration"] = 10
	}
}
v_u_3["Black Cat"] = v68
local v69 = {
	["Nap"] = {
		["effect"] = "ZzzEffect",
		["duration"] = 10
	}
}
v_u_3["Ghostly Black Cat"] = v69
local v70 = {
	["Roar"] = {
		["effect"] = "GhostBreath",
		["duration"] = 3
	}
}
v_u_3["Ghost Bear"] = v70
local v71 = {
	["Hex"] = {
		["effect"] = "HexParticle",
		["duration"] = 10
	}
}
v_u_3["Hex Serpent"] = v71
local v72 = {
	["Dig"] = {
		["effect"] = "DigEffect",
		["duration"] = 1.5
	}
}
v_u_3["Glass Dog"] = v72
local v73 = {
	["Nap"] = {
		["effect"] = "ZzzEffect",
		["duration"] = 10
	}
}
v_u_3["Glass Cat"] = v73
local v74 = {
	["Eat"] = {
		["effect"] = "Woodchips",
		["duration"] = 3
	}
}
v_u_3.Termite = v74
function v_u_1.new(p75, p76, p77)
	-- upvalues: (copy) v_u_1
	local v78 = v_u_1
	local v79 = setmetatable({}, v78)
	v79.PetType = p75
	v79.PetModel = p76
	v79.UUID = p77
	v79.ActiveEmitters = {}
	v79.CurrentAnimation = nil
	return v79
end
function v_u_1.cleanupVFX(p80, p81)
	if p80.ActiveEmitters[p81] then
		for _, v82 in pairs(p80.ActiveEmitters[p81]) do
			v82:Destroy()
		end
		p80.ActiveEmitters[p81] = nil
	end
end
function v_u_1.playVFX(p_u_83, p_u_84)
	-- upvalues: (copy) v_u_3, (copy) v_u_2
	if p_u_83.CurrentAnimation == p_u_84 then
		return
	else
		if p_u_83.CurrentAnimation then
			p_u_83:cleanupVFX(p_u_83.CurrentAnimation)
		end
		p_u_83.CurrentAnimation = p_u_84
		local v85 = v_u_3[p_u_83.PetType]
		if v85 then
			local v86 = v85[p_u_84]
			if v86 then
				local v87 = v86.effect
				if v87 then
					local v88 = v_u_2:FindFirstChild("Assets"):FindFirstChild("PetVFX"):FindFirstChild(v87)
					if v88 then
						local v_u_89 = v88:Clone()
						v_u_89.Parent = p_u_83.PetModel.PrimaryPart or p_u_83.PetModel
						v_u_89.Name = v87
						if not p_u_83.ActiveEmitters[p_u_84] then
							p_u_83.ActiveEmitters[p_u_84] = {}
						end
						local v90 = p_u_83.ActiveEmitters[p_u_84]
						table.insert(v90, v_u_89)
						if v86.duration then
							task.delay(v86.duration, function()
								-- upvalues: (copy) v_u_89, (copy) p_u_83, (copy) p_u_84
								if v_u_89 and v_u_89.Parent then
									v_u_89.Enabled = false
									local v91 = 0
									for _, v92 in ipairs(v_u_89:GetChildren()) do
										if v92:IsA("ParticleEmitter") then
											for _, v93 in ipairs(v92.Lifetime:GetKeypoints()) do
												local v94 = v93.Value
												v91 = math.max(v91, v94)
											end
										end
									end
									task.delay(v91, function()
										-- upvalues: (ref) v_u_89, (ref) p_u_83, (ref) p_u_84
										if v_u_89 and v_u_89.Parent then
											v_u_89:Destroy()
											for v95, v96 in pairs(p_u_83.ActiveEmitters[p_u_84] or {}) do
												if v96 == v_u_89 then
													table.remove(p_u_83.ActiveEmitters[p_u_84], v95)
													return
												end
											end
										end
									end)
								end
							end)
						end
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
	end
end
function v_u_1.destroy(p97)
	for _, v98 in pairs(p97.ActiveEmitters) do
		for _, v99 in pairs(v98) do
			v99:Destroy()
		end
	end
	p97.ActiveEmitters = {}
end
return v_u_1