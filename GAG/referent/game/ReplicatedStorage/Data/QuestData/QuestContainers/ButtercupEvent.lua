local v1 = game:GetService("ReplicatedStorage")
require(v1.Data.QuestData.Types)
local v2 = require(v1.Data.QuestData.Quests)
local v3 = require(v1.Data.QuestData.QuestRewards)
local v4 = {
	["EasyQuest"] = {
		["Reward"] = 10,
		["AmountNeeded"] = 10
	},
	["MediumQuest"] = {
		["Reward"] = 30,
		["AmountNeeded"] = 100
	},
	["HardQuest"] = {
		["Reward"] = 100,
		["AmountNeeded"] = 500
	},
	["DifficultQuest"] = {
		["Reward"] = 200,
		["AmountNeeded"] = 1
	}
}
local v_u_5 = {
	["Blue"] = "rbxassetid://70614580063601",
	["Yellow"] = "rbxassetid://140145827611170",
	["Red"] = "rbxassetid://104646552588332",
	["Green"] = "rbxassetid://72696569776868",
	["Purple"] = "rbxassetid://86645379012923",
	["White"] = "rbxassetid://127731449292254",
	["Black"] = "rbxassetid://115430433208619"
}
local v_u_6 = {}
local v7 = v2.HarvestButtercup
local v8 = {
	["Target"] = v4.EasyQuest.AmountNeeded,
	["Arguments"] = { "Blue" },
	["Rewards"] = { v3.Currency:Use({
			["Type"] = "ButtercupCoins",
			["Amount"] = v4.EasyQuest.Reward
		}) }
}
local v9 = v7:Use(v8)
local v10 = v2.HarvestButtercup
local v11 = {
	["Target"] = v4.EasyQuest.AmountNeeded,
	["Arguments"] = { "Red" },
	["Rewards"] = { v3.Currency:Use({
			["Type"] = "ButtercupCoins",
			["Amount"] = v4.EasyQuest.Reward
		}) }
}
local v12 = v10:Use(v11)
local v13 = v2.HarvestButtercup
local v14 = {
	["Target"] = v4.EasyQuest.AmountNeeded,
	["Arguments"] = { "Yellow" },
	["Rewards"] = { v3.Currency:Use({
			["Type"] = "ButtercupCoins",
			["Amount"] = v4.EasyQuest.Reward
		}) }
}
local v15 = v13:Use(v14)
local v16 = v2.HarvestButtercup
local v17 = {
	["Target"] = v4.EasyQuest.AmountNeeded,
	["Arguments"] = { "Purple" },
	["Rewards"] = { v3.Currency:Use({
			["Type"] = "ButtercupCoins",
			["Amount"] = v4.EasyQuest.Reward
		}) }
}
local v18 = v16:Use(v17)
local v19 = v2.HarvestButtercup
local v20 = {
	["Target"] = v4.EasyQuest.AmountNeeded,
	["Arguments"] = { "Green" },
	["Rewards"] = { v3.Currency:Use({
			["Type"] = "ButtercupCoins",
			["Amount"] = v4.EasyQuest.Reward
		}) }
}
__set_list(v_u_6, 1, {v9, v12, v15, v18, v19:Use(v20)})
local v_u_21 = {}
local v22 = v2.HarvestButtercup
local v23 = {
	["Target"] = v4.MediumQuest.AmountNeeded,
	["Arguments"] = { "Blue" },
	["Rewards"] = { v3.Currency:Use({
			["Type"] = "ButtercupCoins",
			["Amount"] = v4.MediumQuest.Reward
		}) }
}
local v24 = v22:Use(v23)
local v25 = v2.HarvestButtercup
local v26 = {
	["Target"] = v4.MediumQuest.AmountNeeded,
	["Arguments"] = { "Red" },
	["Rewards"] = { v3.Currency:Use({
			["Type"] = "ButtercupCoins",
			["Amount"] = v4.MediumQuest.Reward
		}) }
}
local v27 = v25:Use(v26)
local v28 = v2.HarvestButtercup
local v29 = {
	["Target"] = v4.MediumQuest.AmountNeeded,
	["Arguments"] = { "Yellow" },
	["Rewards"] = { v3.Currency:Use({
			["Type"] = "ButtercupCoins",
			["Amount"] = v4.MediumQuest.Reward
		}) }
}
local v30 = v28:Use(v29)
local v31 = v2.HarvestButtercup
local v32 = {
	["Target"] = v4.MediumQuest.AmountNeeded,
	["Arguments"] = { "Purple" },
	["Rewards"] = { v3.Currency:Use({
			["Type"] = "ButtercupCoins",
			["Amount"] = v4.MediumQuest.Reward
		}) }
}
local v33 = v31:Use(v32)
local v34 = v2.HarvestButtercup
local v35 = {
	["Target"] = v4.MediumQuest.AmountNeeded,
	["Arguments"] = { "Green" },
	["Rewards"] = { v3.Currency:Use({
			["Type"] = "ButtercupCoins",
			["Amount"] = v4.MediumQuest.Reward
		}) }
}
__set_list(v_u_21, 1, {v24, v27, v30, v33, v34:Use(v35)})
local v_u_36 = {}
local v37 = v2.HarvestButtercup
local v38 = {
	["Target"] = v4.HardQuest.AmountNeeded,
	["Arguments"] = { "Blue" },
	["Rewards"] = { v3.Currency:Use({
			["Type"] = "ButtercupCoins",
			["Amount"] = v4.HardQuest.Reward
		}) }
}
local v39 = v37:Use(v38)
local v40 = v2.HarvestButtercup
local v41 = {
	["Target"] = v4.HardQuest.AmountNeeded,
	["Arguments"] = { "Red" },
	["Rewards"] = { v3.Currency:Use({
			["Type"] = "ButtercupCoins",
			["Amount"] = v4.HardQuest.Reward
		}) }
}
local v42 = v40:Use(v41)
local v43 = v2.HarvestButtercup
local v44 = {
	["Target"] = v4.HardQuest.AmountNeeded,
	["Arguments"] = { "Yellow" },
	["Rewards"] = { v3.Currency:Use({
			["Type"] = "ButtercupCoins",
			["Amount"] = v4.HardQuest.Reward
		}) }
}
local v45 = v43:Use(v44)
local v46 = v2.HarvestButtercup
local v47 = {
	["Target"] = v4.HardQuest.AmountNeeded,
	["Arguments"] = { "Purple" },
	["Rewards"] = { v3.Currency:Use({
			["Type"] = "ButtercupCoins",
			["Amount"] = v4.HardQuest.Reward
		}) }
}
local v48 = v46:Use(v47)
local v49 = v2.HarvestButtercup
local v50 = {
	["Target"] = v4.HardQuest.AmountNeeded,
	["Arguments"] = { "Green" },
	["Rewards"] = { v3.Currency:Use({
			["Type"] = "ButtercupCoins",
			["Amount"] = v4.HardQuest.Reward
		}) }
}
__set_list(v_u_36, 1, {v39, v42, v45, v48, v49:Use(v50)})
local v_u_51 = {}
local v52 = v2.HarvestButtercup
local v53 = {
	["Target"] = v4.DifficultQuest.AmountNeeded,
	["Arguments"] = { "Black" },
	["Rewards"] = { v3.Currency:Use({
			["Type"] = "ButtercupCoins",
			["Amount"] = v4.DifficultQuest.Reward
		}) }
}
local v54 = v52:Use(v53)
local v55 = v2.HarvestButtercup
local v56 = {
	["Target"] = v4.DifficultQuest.AmountNeeded,
	["Arguments"] = { "White" },
	["Rewards"] = { v3.Currency:Use({
			["Type"] = "ButtercupCoins",
			["Amount"] = v4.DifficultQuest.Reward
		}) }
}
__set_list(v_u_51, 1, {v54, v55:Use(v56)})
return {
	["Type"] = "ButtercupEvent",
	["CustomData"] = {},
	["IsIndividual"] = true,
	["Display"] = function(_)
		return "Buttercup Quest"
	end,
	["Generate"] = function(_, p57)
		-- upvalues: (copy) v_u_6, (copy) v_u_21, (copy) v_u_36, (copy) v_u_51, (copy) v_u_5
		local v_u_58 = {}
		local v_u_59 = Random.new()
		local v60 = {
			v_u_6,
			v_u_21,
			v_u_36,
			v_u_51
		}
		local function v68(p61)
			-- upvalues: (copy) v_u_58, (copy) v_u_59
			local v62 = {}
			for _, v63 in p61 do
				local v64 = v63.Arguments
				if v64 then
					v64 = v63.Arguments[1]
				end
				if not v_u_58[v64] then
					table.insert(v62, v63)
				end
			end
			if #v62 == 0 then
				return nil
			end
			local v65 = v62[v_u_59:NextInteger(1, #v62)]
			local v66 = v_u_58
			local v67 = v65.Arguments
			if v67 then
				v67 = v65.Arguments[1]
			end
			v66[v67] = true
			return v65
		end
		local v69 = {}
		for _, v70 in v60 do
			for _, v71 in v70 do
				local v72 = v71.Arguments
				if v72 then
					v72 = v71.Arguments[1]
				end
				if v72 and v_u_5[v72] then
					v71.ImageId = v_u_5[v72]
				end
			end
		end
		for _, v73 in v60 do
			local v74 = v68(v73)
			if v74 then
				table.insert(v69, v74)
			end
		end
		return {
			["Quests"] = v69,
			["Rewards"] = type(p57) ~= "function" and {} or p57({
				["type"] = "rewards"
			})
		}
	end
}