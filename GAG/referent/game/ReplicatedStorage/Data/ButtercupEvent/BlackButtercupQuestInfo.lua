local v1 = game:GetService("ReplicatedStorage")
local v2 = require(v1.Modules.GiveServiceCommon)
require(v1.Data.NewYearsEvent.AdventCalendarConfigData)
local v3 = v2.Types
local v_u_4 = {
	["MaxQuestIndex"] = 4
}
local v_u_5 = {
	["Black"] = Color3.fromRGB(30, 30, 30),
	["White"] = Color3.fromRGB(245, 245, 245),
	["Red"] = Color3.fromRGB(255, 60, 60),
	["Yellow"] = Color3.fromRGB(255, 230, 80),
	["Green"] = Color3.fromRGB(60, 200, 100),
	["Blue"] = Color3.fromRGB(80, 120, 255),
	["Purple"] = Color3.fromRGB(180, 100, 255)
}
local v6 = {
	{
		["Required"] = 3,
		["Dialogue"] = "I need %d black buttercups! (%d/%d)",
		["CompletedDialogue"] = "Perfect! Come back when you\'re ready for more.",
		["Reward"] = v3.Seed:Use("Big Shadow Buttercup", 1)
	},
	{
		["Required"] = 2,
		["Dialogue"] = "Excellent! Now bring me %d more! (%d/%d)",
		["CompletedDialogue"] = "Wonderful! I have more requests for you.",
		["Reward"] = v3.Seed:Use("Bigger Shadow Buttercup", 1)
	},
	{
		["Required"] = 4,
		["Dialogue"] = "Great work! I need %d black buttercups this time! (%d/%d)",
		["CompletedDialogue"] = "Amazing! One final task awaits.",
		["Reward"] = v3.Seed:Use("Biggest Shadow Buttercup", 1)
	},
	{
		["Required"] = 7,
		["Dialogue"] = "One final task.. I need %d black buttercups! (%d/%d)",
		["CompletedDialogue"] = "You\'ve done it! Thank you for all your help!",
		["Reward"] = v3.Seed:Use("Beast Shadow Buttercup", 1)
	}
}
v_u_4.Quests = v6
v_u_4.AllCompleteDialogue = "Thank you for all your help! You\'ve completed all my requests."
v_u_4.NoPlantsDialogue = "I don\'t see any black buttercups.."
v_u_4.NotEnoughDialogue = "You only have %d, but I need %d more!"
v_u_4.EmptyInventoryDialogue = "You don\'t have any black buttercups!"
function v_u_4.GetQuestData(p7)
	-- upvalues: (copy) v_u_4
	return v_u_4.Quests[p7]
end
function v_u_4.GetRequired(p8)
	-- upvalues: (copy) v_u_4
	local v9 = v_u_4.Quests[p8]
	return v9 and v9.Required or 0
end
function v_u_4.IsAllComplete(p10)
	-- upvalues: (copy) v_u_4
	return v_u_4.MaxQuestIndex < p10
end
function v_u_4.GetClosestQuestColor(p11)
	-- upvalues: (copy) v_u_5
	local v12 = (1 / 0)
	local v13 = nil
	for v14, v15 in pairs(v_u_5) do
		local v16 = p11.R - v15.R
		local v17 = p11.G - v15.G
		local v18 = p11.B - v15.B
		local v19 = v16 * v16 + v17 * v17 + v18 * v18
		if v19 < v12 then
			v13 = v14
			v12 = v19
		end
	end
	return v13
end
return v_u_4