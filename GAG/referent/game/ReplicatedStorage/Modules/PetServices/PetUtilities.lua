local v_u_1 = game:GetService("ReplicatedStorage")
local v_u_2 = game:GetService("Debris")
local v_u_3 = game:GetService("RunService")
local v_u_4 = game:GetService("ServerScriptService")
local v_u_5 = game:GetService("Players")
local v_u_6 = game:GetService("CollectionService")
local v7 = v_u_1.Assets.VFX
local v8 = require(v_u_1.Data.PetRegistry)
local v_u_9 = require(v_u_1.Modules.CalculatePlantValue)
local v_u_10 = require(v_u_1.Data.EnumRegistry.InventoryServiceEnums)
local v_u_11 = require(v_u_1.Modules.TimeHelper)
local v_u_12 = require(v_u_1.Modules.FoodService)
require(v_u_1.Modules.PetTraitsData)
require(v_u_1.Modules.ReplicationClass.DeepClone)
local v_u_13 = v7.SpottedEffect
local v14 = v8.PetConfig
local v_u_15 = v8.PetList
local v16 = v8.PetEggs
local v_u_17 = v8.PassiveRegistry
local v18 = v14.XP_CONFIG
local _ = v18.XP_EXPONENTIAL
local v_u_19 = v14.PET_FEEDING_CONFIG.HUNGER_PER_WEIGHT
local v_u_20 = v14.WEIGHT_CONFIG.SCALE_PERCENTAGE_OF_BASE_WEIGHT_PER_LEVEL
local v21 = require(v_u_1.Modules.ExponentialScaler)
local v_u_22 = require(v_u_1.Data.DecimalNumberFormat)
local v_u_23 = require(v_u_1.Modules.ReplicationClass.DeepClone)
local v_u_24 = v21.new({
	["BaseCost"] = v18.XP_BASE_COST,
	["ScalingFactor"] = v18.XP_EXPONENTIAL
})
local v_u_25 = 0
for v26 = 1, v18.MAX_LEVEL do
	v_u_25 = v_u_25 + v_u_24:GetCost(v26)
end
local v_u_28 = {
	["GetCurrentLevelXPCost"] = function(_, p27)
		-- upvalues: (copy) v_u_24
		return v_u_24:GetCost(p27)
	end
}
local v_u_29 = {
	["Tiny Bird"] = true,
	["Muddy Excavator"] = true,
	["Fall Express"] = true,
	["Mighty Bear"] = true,
	["Wise Shopper"] = true,
	["Prince of Fall"] = true,
	["Swan Song"] = true,
	["Bird of Grace"] = true,
	["Squirrel Support"] = true,
	["Harvest Stash"] = true,
	["Whack-A-Marmot"] = true,
	["Sugar Gliding"] = true,
	["A Space Odd-Nut-sy"] = true,
	["Salmon School"] = true,
	["Woodpecking"] = true,
	["Southbound"] = true,
	["Adorable Haggler"] = true,
	["Grounded"] = true
}
local v_u_30 = {
	["Snow-munition"] = true,
	["Icy Fortifications"] = true,
	["Arctic Scoundrel"] = true,
	["Glacial Dragon"] = true,
	["Frost Diety"] = true,
	["GIANT Snow-munition"] = true,
	["GIANT Icy Fortifications"] = true,
	["Rainbow Arctic Scoundrel"] = true,
	["Rainbow Glacial Dragon"] = true,
	["Rainbow Frost Diety"] = true,
	["Gift Wrat"] = true,
	["Belly Slide"] = true,
	["Christmas Carrot"] = true,
	["Christmas Hen"] = true,
	["Cold Belly"] = true,
	["Jolly Croak"] = true,
	["Coal Sack"] = true
}
function v_u_28.GetCurrentLevelState(_, p31, p32, p33, p34)
	-- upvalues: (copy) v_u_17, (copy) v_u_3, (copy) v_u_1, (copy) v_u_5, (copy) v_u_4, (copy) v_u_29, (copy) v_u_30
	local v35 = v_u_17[p32]
	if not v35 then
		warn("Could not find passive", p32)
		return {}
	end
	local v36, v37, v38
	if v_u_3:IsClient() then
		v36 = require(v_u_1.Modules.PetServices.ActivePetsService)
		v37 = require(v_u_1.Modules.Gears.BonfireClientService)
		v38 = require(v_u_1.Modules.Gears.YuleLogClientService)
		if p33 == nil then
			p33 = v_u_5.LocalPlayer or p33
		end
	else
		v36 = require(v_u_4.Modules.PetsServices.ActivePetsService)
		v37 = require(v_u_4.Modules.Gears.BonfireService)
		v38 = require(v_u_4.Modules.Gears.GenericGearService.Placeables.YuleLogHandler)
	end
	local v39 = 0
	if p33 then
		local v40 = p33:GetAttribute("PetPassiveBonus")
		if typeof(v40) == "number" then
			v39 = math.min(v40, 30)
		end
		local v41 = p33:GetAttribute("SprinklerPetBoost")
		if typeof(v41) == "number" then
			v39 = v39 + v41
		end
		if v_u_29[p32] then
			local v42 = v37:GetBoost(p33)
			if v42 then
				v39 = v39 + v42.Pet
			end
		end
		if v_u_30[p32] then
			local v43 = v38:GetBoost(p33)
			if v43 then
				v39 = v39 + v43.Pet
			end
		end
	end
	local v44 = {}
	for v45, v46 in v35.States do
		local v47 = v46.Base
		local v48 = v36:CalculateBoost(p33, p34, "PASSIVE_BOOST")
		if v45 == "Cooldown" then
			if v48 >= 0.06 then
				local v49 = v48 - 1
				v47 = v47 - v46.Base * v49
			end
		else
			local v50 = v48 - 1
			if p32 == "The Reins of Ruin" or (p32 == "The Ghostly Reins of Ruin" or (p32 == "Jumbo Blessing" or p32 == "Rainbow Jumbo Blessing")) then
				if v46.Scale <= 0 then
					v47 = v47 - v46.Base * v50
				else
					v47 = v47 + v46.Base * v50
				end
			else
				v47 = v47 + v46.Base * v50
			end
		end
		local v51 = p31 + v39
		if v51 > 100 then
			v51 = (v51 - 100) * 0.25 + 100
		end
		local v52 = v47 + v46.Scale * v51
		if v46.Min and v46.Max then
			local v53 = v46.Min
			local v54 = v46.Max
			v52 = math.clamp(v52, v53, v54)
		elseif v46.Min then
			local v55 = v46.Min
			v52 = math.max(v52, v55)
		elseif v46.Max then
			local v56 = v46.Max
			v52 = math.min(v52, v56)
		end
		v44[v45] = v52
	end
	return v44
end
local v_u_62 = {
	["ColonTime"] = function(p57)
		-- upvalues: (copy) v_u_11
		return v_u_11:GenerateColonFormatFromTime(p57)
	end,
	["Percentage"] = function(p58)
		return string.format("%.2f", p58 * 100)
	end,
	["NoPrecision"] = function(p59)
		local v60 = p59 * 1000
		local v61 = math.floor(v60) / 1000
		return string.format("%.3f", v61)
	end
}
function v_u_28.GetPassiveString(_, p63, p64, p65, p66)
	-- upvalues: (copy) v_u_28, (copy) v_u_17, (copy) v_u_62, (copy) v_u_22
	local v67 = v_u_28:GetCurrentLevelState(p63, p64, p65, p66)
	local v68 = v_u_17[p64]
	local v69 = v68.Description
	local v70 = v68.States
	for v71, v72 in v67 do
		local v73 = v_u_62[v70[v71].Formatter]
		local v74 = v73 and v73(v72)
		if not v74 then
			local v75 = v_u_22
			v74 = tostring(v75(v72))
		end
		v69 = v69:gsub(("<%*>"):format(v71), v74)
	end
	return v69
end
function v_u_28.FindLocalPetModel(_, p76)
	-- upvalues: (copy) v_u_6
	for _, v77 in v_u_6:GetTagged("PetModel") do
		if v77.Name == p76 then
			return v77
		end
	end
	return nil
end
function v_u_28.GetFoodWorthForAnimal(_, p78, p79, p80)
	-- upvalues: (copy) v_u_15, (copy) v_u_10, (copy) v_u_12, (copy) v_u_19
	local v81 = v_u_15[p78].HungerFruitMultipliers
	p79:GetAttribute(v_u_10.ItemName)
	local v82 = v81[p79] or 1
	return v_u_12:CalculateFoodValue(p79:GetAttribute(v_u_10.ITEM_UUID), p80) * v_u_19 * v82
end
function v_u_28.GetFruitWorthForAnimal(_, p83, p84)
	-- upvalues: (copy) v_u_15, (copy) v_u_10, (copy) v_u_9, (copy) v_u_19
	local v85 = v_u_15[p83].HungerFruitMultipliers[p84:GetAttribute(v_u_10.ItemName)] or 1
	return v_u_9(p84) * v_u_19 * v85
end
function v_u_28.GetFruitWorthPercentageForAnimal(_, p86, p87)
	-- upvalues: (copy) v_u_28, (copy) v_u_15
	return v_u_28:GetFruitWorthForAnimal(p86, p87) / v_u_15[p86].DefaultHunger
end
function v_u_28.NormalizeOdds(_, p88)
	local v89 = p88.Items
	local v90 = 0
	for _, v91 in v89 do
		v90 = v90 + v91.ItemOdd
	end
	for v92, v93 in v89 do
		v93.NormalizedOdd = v93.ItemOdd / v90 * 100
		v93.Name = v92
	end
	p88.TotalOdds = v90
	return p88
end
function v_u_28.CalculateWeight(_, p94, p95, p96)
	-- upvalues: (copy) v_u_20
	if p96 == "Chubby Chipmunk" then
		return p94
	else
		return p94 + p94 * v_u_20 * p95
	end
end
function v_u_28.GetLevelProgress(_, p97)
	-- upvalues: (copy) v_u_24, (ref) v_u_25
	if not p97 then
		warn("PetUtilities:GetLevelProgress | No Level!")
		return 0
	end
	local v98 = 0
	for v99 = 1, p97 do
		v98 = v98 + v_u_24:GetCost(v99)
	end
	return v98 / v_u_25
end
for _, v100 in v16 do
	v100.Color = v100.Color or Color3.fromRGB(255, 252, 252)
	v100.HatchTime = v100.HatchTime or 6
	v100.RarityData = v100.RarityData or {
		["Items"] = {}
	}
	v_u_28:NormalizeOdds(v100.RarityData)
end
function v_u_28.CalcBoostTotal(_, p101, p102)
	local v103 = math.clamp(p101, 0, 100)
	local v104 = math.clamp(p102, 0, 100)
	local v105 = v103 + (100 - v103) / 100 * v104
	return math.clamp(v105, 0, 100)
end
function v_u_28.GetBoostedRarityData(_, p106, p107)
	-- upvalues: (copy) v_u_23
	local v108 = v_u_23(p106)
	if p107 <= 0 then
		return v108
	end
	local v109 = 0
	for _ in v108.Items do
		v109 = v109 + 1
	end
	local v110 = 1 / v109 * 100
	local v111 = p107 / 100
	local v112 = math.clamp(v111, 0, 1)
	for _, v113 in v108.Items do
		local v114 = v113.NormalizedOdd
		local v115 = math.lerp(v114, v110, v112)
		local v116 = math.clamp(v115, 0, 100)
		v113.NormalizedOdd = v116
		v113.ItemOdd = v116
	end
	return v108
end
function v_u_28.GetRandomPet(_, p_u_117, p118, p119)
	-- upvalues: (copy) v_u_28
	if not p118 then
		warn("PetUtilities:GetRandomPet | RandomObject was not passed, replacing with random Random object!")
	end
	local v120 = p118 or Random.new()
	if not (p_u_117 and (p_u_117.TotalOdds and p_u_117.Items)) then
		return warn("GetRandomPet | RarityData is nil or invalid!")
	end
	local v121 = v_u_28:GetBoostedRarityData(p_u_117, p119 or 0)
	local v122 = v121.TotalOdds
	local v123 = v121.Items
	local v124 = v120:NextNumber() * v122
	local v125 = {}
	for v126, _ in v123 do
		table.insert(v125, v126)
	end
	table.sort(v125, function(p127, p128)
		-- upvalues: (copy) p_u_117
		local v129 = p_u_117.Items[p127]
		local v130 = p_u_117.Items[p128]
		if v129.ItemOdd == v130.ItemOdd then
			return p128 < p127
		else
			return v129.ItemOdd > v130.ItemOdd
		end
	end)
	local v131 = 0
	for _, v132 in v125 do
		local v133 = v123[v132]
		if v133 then
			v131 = v131 + v133.ItemOdd
			if v131 >= v124 then
				return v133
			end
		else
			warn((("No item data found for key: %*"):format(v132)))
		end
	end
end
function v_u_28.GetLookAt(_, p134, p135)
	local v136 = CFrame.new
	local v137 = p135.X
	local v138 = p134.Y
	local v139 = p135.Z
	return v136(p134, (Vector3.new(v137, v138, v139)))
end
function v_u_28.GetGeneratedEclipsePositions(_, p140)
	local v141 = p140.TargetCFrame
	if not v141 then
		return warn("GetGeneratedEclipsePositions: There is no TargetCFrame in Config:", p140, debug.traceback())
	end
	local v142 = p140.TotalPositions
	if not v142 then
		return warn("GetGeneratedEclipsePositions: There is no TotalPositions in Config:", p140, debug.traceback())
	end
	local v143 = p140.StartingRowAmount or 5
	local v144 = p140.RadiusIncrementX or 3
	local v145 = p140.RadiusIncrementZ or 3
	local v146 = p140.Angle or 0.39269908169872414
	local v147 = {}
	local v148 = 1
	while #v147 < v142 do
		local v149 = v142 - #v147
		local v150 = math.min(v143, v149)
		local v151 = v150 == 1 and 0 or v146 * (v150 - 1) / 2
		for v152 = 1, v150 do
			local v153 = v146 * (v152 - 1) - v151
			local v154 = math.sin(v153) * v148 * v144
			local v155 = math.cos(v153) * v148 * v145
			local v156 = (v141 * CFrame.new(v154, 0, v155)).Position
			table.insert(v147, v156)
		end
		v148 = v148 + 1
		v143 = v143 + 1
	end
	return v147
end
function v_u_28.GetPetsSortedByAge(_, p157, p158, p159, p160)
	-- upvalues: (copy) v_u_3, (copy) v_u_4, (copy) v_u_23, (copy) v_u_1
	local v161 = p159 or false
	local v162 = p160 or false
	local v163 = p158 or 0
	if not v_u_3:IsServer() then
		if not v_u_3:IsClient() then
			return
		end
		local v164 = require(v_u_1.Modules.PetServices.ActivePetsService):GetPlayerDatastorePetData(p157.Name)
		local v165 = v164.PetInventory.Data
		local v166 = v164.EquippedPets
		local v167 = {}
		for v168, v169 in v165 do
			if v169.PetData.Level >= v163 then
				if v162 then
					if table.find(v166, v168) then
						::l22::
						local v170 = v_u_23(v169)
						v170.UUID = v168
						table.insert(v167, v170)
					end
				elseif not (v161 and table.find(v166, v168)) then
					goto l22
				end
			end
		end
		table.sort(v167, function(p171, p172)
			return p171.PetData.Level > p172.PetData.Level
		end)
		return v167
	end
	local v173 = require(v_u_4.Modules.DataService):GetPlayerDataAsync(p157)
	if not v173 then
		return
	end
	local v174 = v173.PetsData.PetInventory.Data
	local v175 = v173.PetsData.EquippedPets
	local v176 = {}
	for v177, v178 in v174 do
		if v178.PetData.Level >= v163 then
			if v162 then
				if table.find(v175, v177) then
					::l11::
					local v179 = v_u_23(v178)
					v179.UUID = v177
					table.insert(v176, v179)
				end
			elseif not (v161 and table.find(v175, v177)) then
				goto l11
			end
		end
	end
	table.sort(v176, function(p180, p181)
		return p180.PetData.Level > p181.PetData.Level
	end)
	return v176
end
function v_u_28.HasActivePetOfType(p182, p183, p184)
	if not (p183 and p184) then
		return false
	end
	local v185 = p182:GetPetsSortedByAge(p183, 0, false, true)
	if not v185 then
		return false
	end
	for _, v186 in v185 do
		if v186 and (v186.PetData and v186.PetType == p184) then
			return true
		end
	end
	return false
end
function v_u_28.GetPetByUUID(_, p187, p188)
	-- upvalues: (copy) v_u_3, (copy) v_u_4, (copy) v_u_23, (copy) v_u_1
	if not (p187 and p188) then
		return nil
	end
	if v_u_3:IsServer() then
		local v189 = require(v_u_4.Modules.DataService):GetPlayerDataAsync(p187)
		if not v189 then
			return nil
		end
		local v190 = v189.PetsData.PetInventory.Data[p188]
		if not v190 then
			return nil
		end
		local v191 = v_u_23(v190)
		v191.UUID = p188
		return v191
	end
	if v_u_3:IsClient() then
		local v192 = require(v_u_1.Modules.PetServices.ActivePetsService):GetPlayerDatastorePetData(p187.Name)
		if not v192 then
			return nil
		end
		local v193 = v192.PetInventory.Data[p188]
		if not v193 then
			return nil
		end
		local v194 = v_u_23(v193)
		v194.UUID = p188
		return v194
	end
end
function v_u_28.AbilityFX(_, p195, p196)
	-- upvalues: (copy) v_u_3, (copy) v_u_13, (copy) v_u_2
	local v197
	if v_u_3:IsServer() then
		v197 = require(game.ServerScriptService.Modules.PetsServices.ActivePetsService)
	else
		v197 = require(game.ReplicatedStorage.Modules.PetServices.ActivePetsService)
	end
	local v198 = v_u_13:Clone()
	v198.CFrame = CFrame.new(v197:GetRealPosition(p195, p196)) * CFrame.new(0, 3, 0)
	v198.Parent = workspace
	v198.SpottedFX.SpotParticle:Emit(1)
	v_u_2:AddItem(v198, 3)
end
return v_u_28