local v1 = game:GetService("ReplicatedStorage")
require(v1.Data.BeeEvent.BeeRegistry)
function BeeEggEntry(p2) -- name: BeeEggEntry
	return p2
end
local v_u_3 = {}
local v4 = {
	["Common"] = Color3.fromRGB(199, 199, 199),
	["Rare"] = Color3.fromRGB(4, 119, 253),
	["Mythical"] = Color3.fromRGB(169, 84, 255),
	["Transcendent"] = Color3.fromRGB(85, 0, 127)
}
local v5 = {
	["Common Bee Egg"] = BeeEggEntry({
		["Icon"] = "rbxassetid://95209902180915",
		["HatchTime"] = 300,
		["BeeWeights"] = nil,
		["Color"] = nil,
		["NameColor"] = nil,
		["Rarity"] = "Common",
		["StockChance"] = 1,
		["Price"] = 10,
		["BeeWeights"] = {
			{
				["BeeName"] = "Bee",
				["Weight"] = 30
			},
			{
				["BeeName"] = "Swift Bee",
				["Weight"] = 15
			},
			{
				["BeeName"] = "Pollen Bee",
				["Weight"] = 15
			},
			{
				["BeeName"] = "Clockwork Bee",
				["Weight"] = 5
			},
			{
				["BeeName"] = "Baby Bee",
				["Weight"] = 3
			}
		},
		["Color"] = Color3.fromRGB(199, 199, 199),
		["NameColor"] = v4.Common
	}),
	["Rare Bee Egg"] = BeeEggEntry({
		["Icon"] = "rbxassetid://105215475946278",
		["HatchTime"] = 1800,
		["BeeWeights"] = nil,
		["Color"] = nil,
		["NameColor"] = nil,
		["Rarity"] = "Rare",
		["StockChance"] = 3,
		["Price"] = 100,
		["BeeWeights"] = {
			{
				["BeeName"] = "Busy Bee",
				["Weight"] = 30
			},
			{
				["BeeName"] = "Rumble Bee",
				["Weight"] = 30
			},
			{
				["BeeName"] = "Merchant Bee",
				["Weight"] = 10
			},
			{
				["BeeName"] = "Jester Bee",
				["Weight"] = 3
			},
			{
				["BeeName"] = "Panic Bee",
				["Weight"] = 1
			}
		},
		["Color"] = Color3.fromRGB(4, 119, 253),
		["NameColor"] = v4.Rare
	}),
	["Mythical Bee Egg"] = BeeEggEntry({
		["Icon"] = "rbxassetid://72198514955680",
		["HatchTime"] = 3600,
		["BeeWeights"] = nil,
		["Color"] = nil,
		["NameColor"] = nil,
		["Rarity"] = "Mythical",
		["StockChance"] = 10,
		["Price"] = 500,
		["BeeWeights"] = {
			{
				["BeeName"] = "Royal Bee",
				["Weight"] = 30
			},
			{
				["BeeName"] = "Turbo Bee",
				["Weight"] = 30
			},
			{
				["BeeName"] = "Treasure Bee",
				["Weight"] = 10
			},
			{
				["BeeName"] = "Princess Bee",
				["Weight"] = 3
			},
			{
				["BeeName"] = "Illusion Bee",
				["Weight"] = 1
			}
		},
		["Color"] = Color3.fromRGB(169, 84, 255),
		["NameColor"] = v4.Mythical
	}),
	["Transcendent Bee Egg"] = BeeEggEntry({
		["Icon"] = "rbxassetid://75891322555145",
		["HatchTime"] = 7200,
		["BeeWeights"] = nil,
		["Color"] = nil,
		["NameColor"] = nil,
		["Rarity"] = "Transcendent",
		["StockChance"] = 20,
		["Price"] = 5000,
		["BeeWeights"] = {
			{
				["BeeName"] = "Necromancer Bee",
				["Weight"] = 35
			},
			{
				["BeeName"] = "Chaos Bee",
				["Weight"] = 20
			},
			{
				["BeeName"] = "Chrono Bee",
				["Weight"] = 20
			},
			{
				["BeeName"] = "Overlord Bee",
				["Weight"] = 3
			},
			{
				["BeeName"] = "Genesis Bee",
				["Weight"] = 1
			}
		},
		["Color"] = Color3.fromRGB(85, 0, 127),
		["NameColor"] = v4.Transcendent
	})
}
v_u_3.Entries = v5
v_u_3.RarityNameColors = v4
v_u_3.BeeNames = {}
for v6, _ in v_u_3.Entries do
	v_u_3.BeeNames[v6] = v6
end
function v_u_3.GetBeeChance(p7) -- name: GetBeeChance
	-- upvalues: (copy) v_u_3
	local v8 = 0
	local v9 = 0
	for _, v10 in v_u_3.Entries do
		for _, v11 in v10.BeeWeights do
			v8 = v8 + v11.Weight
			if v11.BeeName == p7 then
				v9 = v9 + v11.Weight
			end
		end
	end
	return v8 <= 0 and 0 or v9 / v8 * 100
end
return v_u_3