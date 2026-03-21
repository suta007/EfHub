local v1 = game:GetService("ReplicatedStorage")
local v2 = game:GetService("Players")
local v3 = {}
local v_u_4 = v1.GameEvents.ABTestingEvents.ReSetupShopFrames
local v_u_5 = v2.LocalPlayer
if not v_u_5 then
	return v3
end
local v_u_6 = require(v1.UserGenerated.Client.ClientABTests)
local v_u_7 = {
	["SunflowerInShop"] = false,
	["ButtercupInFTUShop"] = nil,
	["FTUPlantPool"] = nil,
	["InTutorial"] = v_u_5:GetAttribute("InTutorial")
}
local function v_u_12()
	-- upvalues: (copy) v_u_7, (copy) v_u_4
	local v8 = {
		["Orange Tulip"] = true
	}
	for v9, v10 in require(script.Parent) do
		if not v8[v9] then
			local v11 = not (v_u_7.FTUPlantPool and v_u_7.InTutorial) and true or ({
				["Carrot"] = true,
				["Strawberry"] = true,
				["Blueberry"] = true,
				["Buttercup"] = true,
				["Tomato"] = true,
				["Corn"] = true,
				["Daffodil"] = true,
				["Watermelon"] = true,
				["Pumpkin"] = true,
				["Apple"] = true,
				["Bamboo"] = true,
				["Coconut"] = true,
				["Cactus"] = true,
				["Dragon Fruit"] = true
			})[v9] == true
			if not v_u_7.ButtercupInFTUShop and (v_u_7.InTutorial and v9 == "Buttercup") then
				v11 = false
			end
			v10.DisplayInShop = v11
		end
	end
	v_u_4:Fire()
end
for _, v_u_13 in { "AB_SunflowerInShop", "AB_ButtercupInFTUShop", "AB_FTUPlantPool" } do
	task.spawn(function()
		-- upvalues: (copy) v_u_6, (copy) v_u_5, (copy) v_u_7, (copy) v_u_13, (copy) v_u_12
		local v14 = v_u_6.GetAssignmentsAsync(v_u_5, true) and v_u_6.GetAttributes(v_u_5)
		if v14 then
			v_u_7[v_u_13:gsub("AB_", "")] = v14[v_u_13]
			v_u_12()
		end
	end)
end
v_u_5:GetAttributeChangedSignal("InTutorial"):Connect(function()
	-- upvalues: (copy) v_u_7, (copy) v_u_5, (copy) v_u_12
	v_u_7.InTutorial = v_u_5:GetAttribute("InTutorial")
	v_u_12()
end)
return v3