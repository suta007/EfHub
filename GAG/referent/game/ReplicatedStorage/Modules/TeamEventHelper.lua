local v_u_1 = game:GetService("ReplicatedStorage")
local v2 = game:GetService("RunService")
local v3 = require(v_u_1.Modules.GiveServiceCommon.RewardDataTypes)
local v_u_4 = require(v_u_1.Modules.PlantTraitsData)
local v_u_5 = require(v_u_1.Data.EnumRegistry.InventoryServiceEnums)
local v_u_6 = {
	["DefaultPlayerEventData"] = function(_)
		return {
			["Points"] = 0,
			["ClaimedTiers"] = {},
			["LastClaimedTime"] = 0
		}
	end
}
function EventEntry(p7)
	return p7
end
local v8 = workspace:GetServerTimeNow() + 900
if v2:IsServer() then
	workspace:SetAttribute("TEAMEVENT_TEST_TIME", v8)
else
	while not workspace:GetAttribute("TEAMEVENT_TEST_TIME") do
		task.wait()
	end
	workspace:GetAttribute("TEAMEVENT_TEST_TIME")
end
local v9 = {}
local v10 = EventEntry
local v11 = {
	["DisplayName"] = "Candy Packaging",
	["MaxMembers"] = 4,
	["StartTime"] = 0,
	["EndTime"] = 1777147200,
	["ClaimCooldown"] = 1800
}
local v12 = {}
local v13 = {
	["RequiredPoints"] = 10,
	["Template"] = "Mid",
	["Rewards"] = { v3.SeedReward({
			["Type"] = "Seed",
			["Quantity"] = 1,
			["Value"] = "Bunny Berry"
		}) }
}
v12.Tier1 = v13
local v14 = {
	["RequiredPoints"] = 30,
	["Rewards"] = { v3.CurrencyReward({
			["Type"] = "Currency",
			["Quantity"] = 500,
			["Value"] = "ChocCoins"
		}) }
}
v12.Tier2 = v14
local v15 = {
	["RequiredPoints"] = 55,
	["Rewards"] = { v3.CrateReward({
			["Type"] = "Crate",
			["Quantity"] = 1,
			["Value"] = "Easter Crate"
		}) }
}
v12.Tier3 = v15
local v16 = {
	["RequiredPoints"] = 105,
	["Template"] = "Mid",
	["Rewards"] = { v3.SeedPackReward({
			["Type"] = "Seed Pack",
			["Quantity"] = 1,
			["Value"] = "Easter Seed Pack"
		}) }
}
v12.Tier4 = v16
local v17 = {
	["RequiredPoints"] = 155,
	["Rewards"] = { v3.CurrencyReward({
			["Type"] = "Currency",
			["Quantity"] = 750,
			["Value"] = "ChocCoins"
		}) }
}
v12.Tier5 = v17
local v18 = {
	["RequiredPoints"] = 230,
	["Rewards"] = { v3.GearReward({
			["Type"] = "Gear",
			["Quantity"] = 1,
			["Value"] = "Chocolate Sprinkler"
		}) }
}
v12.Tier6 = v18
local v19 = {
	["RequiredPoints"] = 330,
	["Rewards"] = { v3.CosmeticReward({
			["Type"] = "Cosmetic",
			["Quantity"] = 1,
			["Value"] = "Bunny Stump"
		}) }
}
v12.Tier7 = v19
local v20 = {
	["RequiredPoints"] = 580,
	["Template"] = "Best",
	["Rewards"] = { v3.EggReward({
			["Type"] = "Egg",
			["Quantity"] = 1,
			["Value"] = "Golden Egg"
		}) }
}
v12.Tier8 = v20
local v21 = {
	["RequiredPoints"] = 830,
	["Rewards"] = { v3.CurrencyReward({
			["Type"] = "Currency",
			["Quantity"] = 1000,
			["Value"] = "ChocCoins"
		}) }
}
v12.Tier9 = v21
local v22 = {
	["RequiredPoints"] = 1080,
	["Template"] = "Mid",
	["Rewards"] = { v3.SeedPackReward({
			["Type"] = "Seed Pack",
			["Quantity"] = 1,
			["Value"] = "Easter Seed Pack"
		}) }
}
v12.Tier10 = v22
local v23 = {
	["RequiredPoints"] = 1330,
	["Rewards"] = { v3.GearReward({
			["Type"] = "Gear",
			["Quantity"] = 2,
			["Value"] = "Chocolate Sprinkler"
		}) }
}
v12.Tier11 = v23
local v24 = {
	["RequiredPoints"] = 1730,
	["Template"] = "Mid",
	["Rewards"] = { v3.EggReward({
			["Type"] = "Egg",
			["Quantity"] = 1,
			["Value"] = "Springtide Egg"
		}) }
}
v12.Tier12 = v24
local v25 = {
	["RequiredPoints"] = 2130,
	["Rewards"] = { v3.CurrencyReward({
			["Type"] = "Currency",
			["Quantity"] = 2500,
			["Value"] = "ChocCoins"
		}) }
}
v12.Tier13 = v25
local v26 = {
	["RequiredPoints"] = 2630,
	["Rewards"] = { v3.GearReward({
			["Type"] = "Gear",
			["Quantity"] = 2,
			["Value"] = "Chocolate Sprinkler"
		}) }
}
v12.Tier14 = v26
local v27 = {
	["RequiredPoints"] = 3130,
	["Template"] = "Best",
	["Rewards"] = { v3.EggReward({
			["Type"] = "Egg",
			["Quantity"] = 2,
			["Value"] = "Golden Egg"
		}) }
}
v12.Tier15 = v27
local v28 = {
	["RequiredPoints"] = 3630,
	["Template"] = "Mid",
	["Rewards"] = { v3.SeedReward({
			["Type"] = "Seed",
			["Quantity"] = 1,
			["Value"] = "Bunny Berry"
		}) }
}
v12.Tier16 = v28
local v29 = {
	["RequiredPoints"] = 4630,
	["Rewards"] = { v3.CurrencyReward({
			["Type"] = "Currency",
			["Quantity"] = 5000,
			["Value"] = "ChocCoins"
		}) }
}
v12.Tier17 = v29
local v30 = {
	["RequiredPoints"] = 5630,
	["Template"] = "Mid",
	["Rewards"] = { v3.SeedPackReward({
			["Type"] = "Seed Pack",
			["Quantity"] = 2,
			["Value"] = "Easter Seed Pack"
		}) }
}
v12.Tier18 = v30
local v31 = {
	["RequiredPoints"] = 6630,
	["Rewards"] = { v3.GearReward({
			["Type"] = "Gear",
			["Quantity"] = 3,
			["Value"] = "Chocolate Sprinkler"
		}) }
}
v12.Tier19 = v31
local v32 = {
	["RequiredPoints"] = 7880,
	["Template"] = "Mid",
	["Rewards"] = { v3.EggReward({
			["Type"] = "Egg",
			["Quantity"] = 1,
			["Value"] = "Springtide Egg"
		}) }
}
v12.Tier20 = v32
local v33 = {
	["RequiredPoints"] = 9280,
	["Rewards"] = { v3.CrateReward({
			["Type"] = "Crate",
			["Quantity"] = 2,
			["Value"] = "Easter Crate"
		}) }
}
v12.Tier21 = v33
local v34 = {
	["RequiredPoints"] = 10780,
	["Template"] = "Best",
	["Rewards"] = { v3.EggReward({
			["Type"] = "Egg",
			["Quantity"] = 2,
			["Value"] = "Golden Egg"
		}) }
}
v12.Tier22 = v34
local v35 = {
	["RequiredPoints"] = 12380,
	["Template"] = "Mid",
	["Rewards"] = { v3.SeedReward({
			["Type"] = "Seed",
			["Quantity"] = 1,
			["Value"] = "Bonnet Bloom"
		}) }
}
v12.Tier23 = v35
local v36 = {
	["RequiredPoints"] = 14180,
	["Template"] = "Mid",
	["Rewards"] = { v3.EggReward({
			["Type"] = "Egg",
			["Quantity"] = 2,
			["Value"] = "Springtide Egg"
		}) }
}
v12.Tier24 = v36
local v37 = {
	["RequiredPoints"] = 16180,
	["Template"] = "Mid",
	["Rewards"] = { v3.SeedPackReward({
			["Type"] = "Seed Pack",
			["Quantity"] = 2,
			["Value"] = "Easter Seed Pack"
		}) }
}
v12.Tier25 = v37
local v38 = {
	["RequiredPoints"] = 18430,
	["Rewards"] = { v3.CurrencyReward({
			["Type"] = "Currency",
			["Quantity"] = 10000,
			["Value"] = "ChocCoins"
		}) }
}
v12.Tier26 = v38
local v39 = {
	["RequiredPoints"] = 20930,
	["Template"] = "Best",
	["Rewards"] = { v3.EggReward({
			["Type"] = "Egg",
			["Quantity"] = 3,
			["Value"] = "Golden Egg"
		}) }
}
v12.Tier27 = v39
local v40 = {
	["RequiredPoints"] = 25930,
	["Template"] = "Best",
	["Rewards"] = { v3.SeedReward({
			["Type"] = "Seed",
			["Quantity"] = 1,
			["Value"] = "Eggfruit"
		}) }
}
v12.Tier28 = v40
v11.PersonalRewards = v12
local v41 = {}
local v42 = {
	["RequiredPoints"] = 25000,
	["Rewards"] = { v3.CosmeticReward({
			["Type"] = "Cosmetic",
			["Quantity"] = 1,
			["Value"] = "Easter Nest"
		}) }
}
v41.Tier1 = v42
local v43 = {
	["RequiredPoints"] = 28000,
	["Template"] = "Mid",
	["Rewards"] = { v3.SeedPackReward({
			["Type"] = "Seed Pack",
			["Quantity"] = 3,
			["Value"] = "Easter Seed Pack"
		}) }
}
v41.Tier2 = v43
local v44 = {
	["RequiredPoints"] = 30000,
	["Rewards"] = { v3.CosmeticReward({
			["Type"] = "Cosmetic",
			["Quantity"] = 1,
			["Value"] = "Easter Sign"
		}) }
}
v41.Tier3 = v44
local v45 = {
	["RequiredPoints"] = 35000,
	["Template"] = "Mid",
	["Rewards"] = { v3.SeedReward({
			["Type"] = "Seed",
			["Quantity"] = 2,
			["Value"] = "Egg Shroom"
		}) }
}
v41.Tier4 = v45
local v46 = {
	["RequiredPoints"] = 40000,
	["Rewards"] = { v3.GearReward({
			["Type"] = "Gear",
			["Quantity"] = 5,
			["Value"] = "Chocolate Sprinkler"
		}) }
}
v41.Tier5 = v46
local v47 = {
	["RequiredPoints"] = 45000,
	["Template"] = "Best",
	["Rewards"] = { v3.EggReward({
			["Type"] = "Egg",
			["Quantity"] = 4,
			["Value"] = "Golden Egg"
		}) }
}
v41.Tier6 = v47
local v48 = {
	["RequiredPoints"] = 50000,
	["Template"] = "Mid",
	["Rewards"] = { v3.PetReward({
			["Type"] = "Pet",
			["Value"] = "Candy Squirrel"
		}) }
}
v41.Tier7 = v48
local v49 = {
	["RequiredPoints"] = 60000,
	["Template"] = "Mid",
	["Rewards"] = { v3.EggReward({
			["Type"] = "Egg",
			["Quantity"] = 6,
			["Value"] = "Springtide Egg"
		}) }
}
v41.Tier8 = v49
local v50 = {
	["RequiredPoints"] = 70000,
	["Template"] = "Best",
	["Rewards"] = { v3.SeedReward({
			["Type"] = "Seed",
			["Quantity"] = 1,
			["Value"] = "Waddling Willow"
		}) }
}
v41.Tier9 = v50
local v51 = {
	["RequiredPoints"] = 80000,
	["Template"] = "Mid",
	["Rewards"] = { v3.SeedPackReward({
			["Type"] = "Seed Pack",
			["Quantity"] = 6,
			["Value"] = "Easter Seed Pack"
		}) }
}
v41.Tier10 = v51
local v52 = {
	["RequiredPoints"] = 90000,
	["Template"] = "Best",
	["Rewards"] = { v3.EggReward({
			["Type"] = "Egg",
			["Quantity"] = 10,
			["Value"] = "Golden Egg"
		}) }
}
v41.Tier11 = v52
local v53 = {
	["RequiredPoints"] = 100000,
	["Template"] = "Best",
	["Rewards"] = { v3.SeedReward({
			["Type"] = "Seed",
			["Quantity"] = 1,
			["Value"] = "Waddling Willow",
			["Variant"] = "Gold",
			["CustomImage"] = "rbxassetid://106519223145832"
		}) }
}
v41.Tier12 = v53
v11.TeamRewards = v41
v9.CandyPackaging = v10(v11)
v_u_6.Events = table.freeze(v9)
local v54 = {}
for v55, _ in v_u_6.Events do
	v54[v55] = v55
end
v_u_6.EventNames = table.freeze(v54)
for v_u_56, v57 in v_u_6.Events do
	local v58 = {}
	for v59, _ in v57.PersonalRewards do
		table.insert(v58, v59)
	end
	table.sort(v58, function(p60, p61)
		-- upvalues: (copy) v_u_6, (copy) v_u_56
		return v_u_6.Events[v_u_56].PersonalRewards[p60].RequiredPoints < v_u_6.Events[v_u_56].PersonalRewards[p61].RequiredPoints
	end)
	v57.SortedPersonalKeys = v58
end
for v_u_62, v63 in v_u_6.Events do
	local v64 = {}
	for v65, _ in v63.TeamRewards do
		table.insert(v64, v65)
	end
	table.sort(v64, function(p66, p67)
		-- upvalues: (copy) v_u_6, (copy) v_u_62
		return v_u_6.Events[v_u_62].TeamRewards[p66].RequiredPoints < v_u_6.Events[v_u_62].TeamRewards[p67].RequiredPoints
	end)
	v63.SortedTeamKeys = v64
end
function v_u_6.GetNextPersonalTier(_, p68, p69)
	-- upvalues: (copy) v_u_6
	local v70 = v_u_6.Events[p68]
	if not v70 then
		return nil
	end
	for _, v71 in v70.SortedPersonalKeys do
		local v72 = v70.PersonalRewards[v71]
		if p69 < v72.RequiredPoints then
			return v72
		end
	end
	return nil
end
function v_u_6.GetPreviousPersonalTier(_, p73, p74)
	-- upvalues: (copy) v_u_6
	local v75 = v_u_6.Events[p73]
	if not v75 then
		return nil
	end
	local v76 = nil
	for _, v77 in v75.SortedPersonalKeys do
		local v78 = v75.PersonalRewards[v77]
		if v78.RequiredPoints > p74 then
			break
		end
		v76 = v78
	end
	return v76
end
function v_u_6.GetCompletedPersonalTierCount(_, p79, p80)
	-- upvalues: (copy) v_u_6
	local v81 = v_u_6.Events[p79]
	if not v81 then
		return 0
	end
	local v82 = 0
	for _, v83 in v81.PersonalRewards do
		if v83.RequiredPoints <= p80 then
			v82 = v82 + 1
		end
	end
	return v82
end
function v_u_6.GetMaxPersonalTierCount(_, p84)
	-- upvalues: (copy) v_u_6
	local v85 = v_u_6.Events[p84]
	if not v85 then
		return 0
	end
	local v86 = 0
	for _ in v85.PersonalRewards do
		v86 = v86 + 1
	end
	return v86
end
function v_u_6.IsMaxPersonalTier(_, p87, p88)
	-- upvalues: (copy) v_u_6
	local v89 = v_u_6:GetCompletedPersonalTierCount(p87, p88)
	local v90 = v_u_6:GetMaxPersonalTierCount(p87)
	local v91
	if v90 <= v89 then
		v91 = v90 > 0
	else
		v91 = false
	end
	return v91
end
function v_u_6.GetMaxPersonalPoints(_, p92)
	-- upvalues: (copy) v_u_6
	local v93 = v_u_6.Events[p92]
	if not (v93 and v93.SortedPersonalKeys) then
		return 0
	end
	local v94 = v93.SortedPersonalKeys[#v93.SortedPersonalKeys]
	return not v94 and 0 or v93.PersonalRewards[v94].RequiredPoints
end
function v_u_6.CalculatePackagingPoints(_, p95)
	-- upvalues: (copy) v_u_1, (copy) v_u_5, (copy) v_u_4
	local v96 = require(v_u_1.Modules.CalculatePlantValue)
	if not p95 then
		return nil, "No tool"
	end
	local v97 = p95:GetAttribute(v_u_5.ItemName)
	if not v97 then
		return nil, "Not a valid plant"
	end
	if not (v_u_4.HasTrait(v97, "Easter") or v_u_4.HasTrait(v97, "Candy")) then
		return nil, "Only Easter & Candy Fruit can be submitted"
	end
	local v98 = v96(p95)
	local v99 = 1 + ((type(v98) ~= "number" or (v98 ~= v98 or v98 < 0)) and 0 or v98)
	local v100 = math.log10(v99) * 10 / 13
	local v101 = math.min(v100, 10)
	return (v101 ~= v101 or v101 < 0) and 0 or v101, nil
end
return v_u_6