local v1 = game:GetService("ReplicatedStorage")
local v_u_2 = game:GetService("CollectionService")
require(script.NPCLevelTypes)
require(game.ReplicatedStorage.Modules.GiveServiceCommon)
local v_u_3 = require(v1.Modules.GameTimeUtils)
local v_u_4 = {}
local v_u_5 = {}
local v6 = {
	["Alias"] = "Gear",
	["FeedCooldown"] = 86400,
	["LevelBrackets"] = {
		0,
		10,
		20,
		30,
		40,
		50
	},
	["BirthdayDay"] = 4,
	["BirthdayMonth"] = 3,
	["OnlyFeedBirthday"] = true,
	["BirthdayRewards"] = {
		{
			["Type"] = "Gear",
			["Value"] = "Grandmaster Sprinkler",
			["Quantity"] = 1
		},
		{
			["Type"] = "Gear",
			["Value"] = "Levelup Lollipop",
			["Quantity"] = 3
		}
	}
}
v_u_5.Eloise = v6
local v7 = {
	["Alias"] = "Seed",
	["FeedCooldown"] = 86400,
	["LevelBrackets"] = {
		0,
		15,
		40,
		70,
		100
	},
	["TabUnlocks"] = {
		{ "Tier 2" }
	},
	["BirthdayDay"] = 2,
	["BirthdayMonth"] = 7,
	["BirthdayRewards"] = {
		{
			["Type"] = "SEEDROLL",
			["Value"] = "Divine",
			["Quantity"] = NumberRange.new(2, 3)
		},
		{
			["Type"] = "SEEDROLL",
			["Value"] = "Prismatic",
			["Quantity"] = NumberRange.new(2, 3)
		}
	}
}
v_u_5.Sam = v7
local v8 = {
	["Alias"] = "Pet",
	["FeedCooldown"] = 86400,
	["LevelBrackets"] = {
		0,
		15,
		30,
		40,
		70,
		100
	},
	["TabUnlocks"] = {
		[30] = { "Tier 2" }
	}
}
local v9 = {
	[15] = {
		["Type"] = "Cosmetic",
		["Value"] = "Pet Incubator",
		["Quantity"] = 1
	}
}
v8.Rewards = v9
v8.BirthdayDay = 30
v8.BirthdayMonth = 10
v8.BirthdayRewards = {
	{
		["Type"] = "Egg",
		["Value"] = "Bug Egg",
		["Quantity"] = 1
	},
	{
		["Type"] = "Egg",
		["Value"] = "Legendary Egg",
		["Quantity"] = 1
	},
	{
		["Type"] = "Egg",
		["Value"] = "Mythical Egg",
		["Quantity"] = 1
	}
}
v_u_5.Raphael = v8
local v10 = {
	["Alias"] = "Cosmetic",
	["FeedCooldown"] = 86400,
	["LevelBrackets"] = {
		0,
		10,
		20,
		30,
		40,
		50
	},
	["TabUnlocks"] = {
		{ "Friendship" }
	},
	["BirthdayDay"] = 1,
	["BirthdayMonth"] = 12,
	["OnlyFeedBirthday"] = true,
	["BirthdayRewards"] = {
		{
			["Type"] = "Crate",
			["Value"] = "Sign Crate",
			["Quantity"] = 1
		},
		{
			["Type"] = "Crate",
			["Value"] = "Farmers Gnome Crate",
			["Quantity"] = 1
		},
		{
			["Type"] = "Crate",
			["Value"] = "Classic Gnome Crate",
			["Quantity"] = 1
		},
		{
			["Type"] = "Crate",
			["Value"] = "Statue Crate",
			["Quantity"] = 1
		},
		{
			["Type"] = "Crate",
			["Value"] = "Beach Crate",
			["Quantity"] = 1
		}
	}
}
v_u_5.Isaac = v10
v_u_4.NPCEntires = v_u_5
v_u_4.AliasMap = {}
local v_u_11 = {}
for v12, v13 in v_u_5 do
	v_u_4.AliasMap[v13.Alias] = v12
end
function v_u_4.GetLevelFromPoints(_, p14, p15)
	-- upvalues: (copy) v_u_5
	local v16 = v_u_5[p14]
	if not v16 then
		warn((("Invalid NPC name: %*"):format(p14)))
		return 1
	end
	local v17 = 1
	for v18, v19 in v16.LevelBrackets do
		if v19 > p15 then
			break
		end
		v17 = v18
	end
	return v17
end
function v_u_4.GetMaxPoints(_, p20)
	-- upvalues: (copy) v_u_5
	local v21 = v_u_5[p20]
	if v21 then
		return v21.LevelBrackets[#v21.LevelBrackets]
	end
	warn((("Invalid NPC name: %*"):format(p20)))
	return 0
end
function v_u_4.GetLevelPoints(_, p22, p23)
	-- upvalues: (copy) v_u_5
	local v24 = v_u_5[p22]
	if v24 then
		return v24.LevelBrackets[p23] or 0
	end
	warn((("Invalid NPC name: %*"):format(p22)))
	return 0
end
function v_u_4.GetUnlockableShopTabs(_, p25, p26)
	-- upvalues: (copy) v_u_5
	local v27 = v_u_5[p25]
	if not v27 then
		warn((("Invalid NPC name: %*"):format(p25)))
		return {}
	end
	if not v27.TabUnlocks then
		return {}
	end
	local v28 = {}
	for v29, v30 in v27.TabUnlocks do
		if v29 <= p26 then
			for _, v31 in v30 do
				table.insert(v28, v31)
			end
		end
	end
	return v28
end
function v_u_4.GetNPCRewards(_, p32)
	-- upvalues: (copy) v_u_5
	local v33 = v_u_5[p32]
	if v33 then
		return not v33.Rewards and {} or v33.Rewards
	end
	warn((("Invalid NPC name: %*"):format(p32)))
	return {}
end
function v_u_4.GetLevelNotifFromPoints(_, p34, p35)
	-- upvalues: (copy) v_u_5, (copy) v_u_4
	local v36 = v_u_5[p34]
	if v36 then
		local v37 = v_u_4:GetLevelFromPoints(p34, p35)
		return v36.LevelNotifs and v36.LevelNotifs[v37] or ("Level %*!"):format(v37)
	else
		warn((("Invalid NPC name: %*"):format(p34)))
		return "..."
	end
end
function v_u_4.IsNPCBirthday(_, p38, p39)
	-- upvalues: (copy) v_u_5, (copy) v_u_3
	local v40 = v_u_5[p38]
	if not v40 then
		warn((("Invalid NPC name: %*"):format(p38)))
		return false
	end
	local v41, v42 = v_u_3:GameDateFromTime(p39 or workspace:GetServerTimeNow())
	local v43 = v40.BirthdayDay or -1
	local v44 = v40.BirthdayMonth or -1
	local v45
	if v43 == v41 then
		v45 = v44 == v42
	else
		v45 = false
	end
	return v45
end
function v_u_4.GetDaysTillAllBdays(_, p46)
	-- upvalues: (copy) v_u_3, (copy) v_u_4
	local v47, v48 = v_u_3:GameDateFromTime(p46 or workspace:GetServerTimeNow())
	local v49 = (v48 - 1) * 30 + v47 - 1
	local v50 = {}
	for v51, v52 in v_u_4.NPCEntires do
		if v_u_4:TryGetNPCModel(v51) then
			local v53 = v52.BirthdayDay
			local v54 = v52.BirthdayMonth
			if v53 == -1 or v54 == -1 then
				warn((("Invalid birthday for NPC: %*"):format(v51)))
				v50[v51] = (1 / 0)
			else
				local v55 = (v54 - 1) * 30 + v53 - 1 - v49
				if v55 < 0 then
					v55 = v55 + 360
				end
				v50[v51] = v55
			end
		end
	end
	return v50
end
local function v_u_58(p56)
	-- upvalues: (copy) v_u_4, (copy) v_u_11
	if p56:IsA("Model") then
		if p56:HasTag("Feedable") then
			local v57 = p56.Name
			if v_u_4.NPCEntires[v57] then
				if not v_u_11[p56] then
					v_u_11[p56] = v57
				end
			else
				warn((("Invalid NPC name: %*"):format(v57)))
				return
			end
		else
			return
		end
	else
		return
	end
end
function v_u_4.TryGetNPCModel(_, p59)
	-- upvalues: (copy) v_u_11
	for v60, v61 in v_u_11 do
		if v61 == p59 then
			return v60
		end
	end
	return nil
end
function v_u_4.TryGetNPCName(_, p62)
	-- upvalues: (copy) v_u_11
	return v_u_11[p62]
end
function v_u_4.GetTrackedNPCs(_)
	-- upvalues: (copy) v_u_11
	return v_u_11
end
v_u_2:GetInstanceAddedSignal("Feedable"):Connect(function(p63)
	-- upvalues: (copy) v_u_58
	if p63:IsDescendantOf(workspace) then
		v_u_58(p63)
	end
end)
task.spawn(function()
	-- upvalues: (copy) v_u_2, (copy) v_u_58
	for _, v64 in v_u_2:GetTagged("Feedable") do
		if v64:IsDescendantOf(workspace) then
			v_u_58(v64)
		end
	end
end)
return v_u_4