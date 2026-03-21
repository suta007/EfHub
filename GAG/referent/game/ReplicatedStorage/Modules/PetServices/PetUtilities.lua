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
function v_u_28.GetRandomPet(_, p101, p102)
	if not p102 then
		warn("PetUtilities:GetRandomPet | RandomObject was not passed, replacing with random Random object!")
	end
	local v103 = p102 or Random.new()
	if not (p101 and (p101.TotalOdds and p101.Items)) then
		return warn((("GetRandomPet | %* is nil or invalid!"):format(p101)))
	end
	local v104 = p101.TotalOdds
	local v105 = p101.Items
	local v106 = v103:NextNumber() * v104
	local v107 = 0
	for _, v108 in v105 do
		v107 = v107 + v108.ItemOdd
		if v107 >= v106 then
			return v108
		end
	end
end
function v_u_28.GetLookAt(_, p109, p110)
	local v111 = CFrame.new
	local v112 = p110.X
	local v113 = p109.Y
	local v114 = p110.Z
	return v111(p109, (Vector3.new(v112, v113, v114)))
end
function v_u_28.GetGeneratedEclipsePositions(_, p115)
	local v116 = p115.TargetCFrame
	if not v116 then
		return warn("GetGeneratedEclipsePositions: There is no TargetCFrame in Config:", p115, debug.traceback())
	end
	local v117 = p115.TotalPositions
	if not v117 then
		return warn("GetGeneratedEclipsePositions: There is no TotalPositions in Config:", p115, debug.traceback())
	end
	local v118 = p115.StartingRowAmount or 5
	local v119 = p115.RadiusIncrementX or 3
	local v120 = p115.RadiusIncrementZ or 3
	local v121 = p115.Angle or 0.39269908169872414
	local v122 = {}
	local v123 = 1
	while #v122 < v117 do
		local v124 = v117 - #v122
		local v125 = math.min(v118, v124)
		local v126 = v125 == 1 and 0 or v121 * (v125 - 1) / 2
		for v127 = 1, v125 do
			local v128 = v121 * (v127 - 1) - v126
			local v129 = math.sin(v128) * v123 * v119
			local v130 = math.cos(v128) * v123 * v120
			local v131 = (v116 * CFrame.new(v129, 0, v130)).Position
			table.insert(v122, v131)
		end
		v123 = v123 + 1
		v118 = v118 + 1
	end
	return v122
end
function v_u_28.GetPetsSortedByAge(_, p132, p133, p134, p135)
	-- upvalues: (copy) v_u_3, (copy) v_u_4, (copy) v_u_23, (copy) v_u_1
	local v136 = p134 or false
	local v137 = p135 or false
	local v138 = p133 or 0
	if not v_u_3:IsServer() then
		if not v_u_3:IsClient() then
			return
		end
		local v139 = require(v_u_1.Modules.PetServices.ActivePetsService):GetPlayerDatastorePetData(p132.Name)
		local v140 = v139.PetInventory.Data
		local v141 = v139.EquippedPets
		local v142 = {}
		for v143, v144 in v140 do
			if v144.PetData.Level >= v138 then
				if v137 then
					if table.find(v141, v143) then
						::l22::
						local v145 = v_u_23(v144)
						v145.UUID = v143
						table.insert(v142, v145)
					end
				elseif not (v136 and table.find(v141, v143)) then
					goto l22
				end
			end
		end
		table.sort(v142, function(p146, p147)
			return p146.PetData.Level > p147.PetData.Level
		end)
		return v142
	end
	local v148 = require(v_u_4.Modules.DataService):GetPlayerDataAsync(p132)
	if not v148 then
		return
	end
	local v149 = v148.PetsData.PetInventory.Data
	local v150 = v148.PetsData.EquippedPets
	local v151 = {}
	for v152, v153 in v149 do
		if v153.PetData.Level >= v138 then
			if v137 then
				if table.find(v150, v152) then
					::l11::
					local v154 = v_u_23(v153)
					v154.UUID = v152
					table.insert(v151, v154)
				end
			elseif not (v136 and table.find(v150, v152)) then
				goto l11
			end
		end
	end
	table.sort(v151, function(p155, p156)
		return p155.PetData.Level > p156.PetData.Level
	end)
	return v151
end
function v_u_28.HasActivePetOfType(p157, p158, p159)
	if not (p158 and p159) then
		return false
	end
	local v160 = p157:GetPetsSortedByAge(p158, 0, false, true)
	if not v160 then
		return false
	end
	for _, v161 in v160 do
		if v161 and (v161.PetData and v161.PetType == p159) then
			return true
		end
	end
	return false
end
function v_u_28.GetPetByUUID(_, p162, p163)
	-- upvalues: (copy) v_u_3, (copy) v_u_4, (copy) v_u_23, (copy) v_u_1
	if not (p162 and p163) then
		return nil
	end
	if v_u_3:IsServer() then
		local v164 = require(v_u_4.Modules.DataService):GetPlayerDataAsync(p162)
		if not v164 then
			return nil
		end
		local v165 = v164.PetsData.PetInventory.Data[p163]
		if not v165 then
			return nil
		end
		local v166 = v_u_23(v165)
		v166.UUID = p163
		return v166
	end
	if v_u_3:IsClient() then
		local v167 = require(v_u_1.Modules.PetServices.ActivePetsService):GetPlayerDatastorePetData(p162.Name)
		if not v167 then
			return nil
		end
		local v168 = v167.PetInventory.Data[p163]
		if not v168 then
			return nil
		end
		local v169 = v_u_23(v168)
		v169.UUID = p163
		return v169
	end
end
function v_u_28.AbilityFX(_, p170, p171)
	-- upvalues: (copy) v_u_3, (copy) v_u_13, (copy) v_u_2
	local v172
	if v_u_3:IsServer() then
		v172 = require(game.ServerScriptService.Modules.PetsServices.ActivePetsService)
	else
		v172 = require(game.ReplicatedStorage.Modules.PetServices.ActivePetsService)
	end
	local v173 = v_u_13:Clone()
	v173.CFrame = CFrame.new(v172:GetRealPosition(p170, p171)) * CFrame.new(0, 3, 0)
	v173.Parent = workspace
	v173.SpottedFX.SpotParticle:Emit(1)
	v_u_2:AddItem(v173, 3)
end
return v_u_28