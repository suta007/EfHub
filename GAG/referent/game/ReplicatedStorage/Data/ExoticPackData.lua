local v_u_1 = game:GetService("ReplicatedStorage")
local v2 = require(v_u_1.Data.SeedPackData)
require(v_u_1.Data.CosmeticRegistry)
require(v_u_1.Data.CosmeticCrateRegistry)
local v14 = {
	["Products"] = {
		[1] = 3489363343,
		[3] = 3489363338,
		[10] = 3489363342,
		[50] = 3489363344
	},
	["GiftProducts"] = {
		[1] = 3489363340,
		[3] = 3489363337,
		[10] = 3489363341,
		[50] = 3489363345
	},
	["FallbackPrices"] = {
		[1] = 149,
		[3] = 429,
		[10] = 1249,
		[50] = 4999
	},
	["Title"] = "PREMIUM NEW YEAR\'S EGG!",
	["Vector"] = "rbxassetid://101080601124641",
	["VectorPosition"] = UDim2.fromScale(0.111, 0.613),
	["VectorSize"] = UDim2.fromScale(0.31, 0.942),
	["Display"] = "Egg",
	["DisplayPlural"] = "Eggs",
	["BackgroundImage"] = "rbxassetid://138776814412466",
	["Items"] = (function()
		-- upvalues: (copy) v_u_1
		local v3 = require(v_u_1.Data.PetRegistry)
		local v4 = {}
		for v5, v6 in v3.PetEggs["Premium New Year\'s Egg"].RarityData.Items do
			local v7 = v5:match("Egg/(.-)$")
			local v8 = {
				["Chance"] = v6.ItemOdd,
				["Type"] = v7 and "Egg" or "Pet",
				["RewardId"] = v7 or v5
			}
			local v9
			if v7 then
				v9 = v3.PetEggs[v7].Icon or ""
			else
				v9 = v3.PetList[v5] and (v3.PetList[v5].Icon or "") or ""
			end
			v8.Icon = v9
			table.insert(v4, v8)
		end
		table.sort(v4, function(p10, p11)
			if p10.Type == "Egg" then
				return false
			elseif p11.Type == "Egg" then
				return true
			else
				local v12 = p10.Chance
				local v13 = p11.Chance
				if v12 == v13 then
					return p10.RewardId > p11.RewardId
				else
					return v13 < v12
				end
			end
		end)
		return v4
	end)(),
	["BiggerTemplateIndex"] = 6,
	["MidTemplateIndex"] = 4,
	["ReleaseTime"] = DateTime.fromUniversalTime(2025, 12, 27, 18),
	["EndTime"] = DateTime.fromUniversalTime(2026, 1, 10, 18),
	["Pity"] = "Premium New Year\'s Egg"
}
local v26 = {
	["Products"] = {
		[1] = 3497475839,
		[3] = 3497475846,
		[10] = 3497475844,
		[50] = 3497475843
	},
	["GiftProducts"] = {
		[1] = 3497475841,
		[3] = 3497475845,
		[10] = 3497475840,
		[50] = 3497475842
	},
	["FallbackPrices"] = {
		[1] = 149,
		[3] = 429,
		[10] = 1249,
		[50] = 4999
	},
	["Title"] = "PREMIUM CARNIVAL EGG!",
	["Vector"] = "rbxassetid://91270408981945",
	["VectorPosition"] = UDim2.fromScale(0.111, 0.613),
	["VectorSize"] = UDim2.fromScale(0.31, 0.942),
	["Display"] = "Egg",
	["DisplayPlural"] = "Eggs",
	["BackgroundImage"] = "rbxassetid://138776814412466",
	["Items"] = (function()
		-- upvalues: (copy) v_u_1
		local v15 = require(v_u_1.Data.PetRegistry)
		local v16 = {}
		for v17, v18 in v15.PetEggs["Premium Carnival Egg"].RarityData.Items do
			local v19 = v17:match("Egg/(.-)$")
			local v20 = {
				["Chance"] = v18.ItemOdd,
				["Type"] = v19 and "Egg" or "Pet",
				["RewardId"] = v19 or v17
			}
			local v21
			if v19 then
				v21 = v15.PetEggs[v19].Icon or ""
			else
				v21 = v15.PetList[v17] and (v15.PetList[v17].Icon or "") or ""
			end
			v20.Icon = v21
			table.insert(v16, v20)
		end
		table.sort(v16, function(p22, p23)
			if p22.Type == "Egg" then
				return false
			elseif p23.Type == "Egg" then
				return true
			else
				local v24 = p22.Chance
				local v25 = p23.Chance
				if v24 == v25 then
					return p22.RewardId > p23.RewardId
				else
					return v25 < v24
				end
			end
		end)
		return v16
	end)(),
	["BiggerTemplateIndex"] = 5,
	["MidTemplateIndex"] = 3,
	["ReleaseTime"] = DateTime.fromUniversalTime(2026, 1, 3, 18),
	["EndTime"] = DateTime.fromUniversalTime(2026, 1, 17, 18),
	["Pity"] = "Premium Carnival Egg"
}
local v38 = {
	["Products"] = {
		[1] = 3512151971,
		[3] = 3512151973,
		[10] = 3512151976,
		[50] = 3512151977
	},
	["GiftProducts"] = {
		[1] = 3512151974,
		[3] = 3512151972,
		[10] = 3512151975,
		[50] = 3512151981
	},
	["FallbackPrices"] = {
		[1] = 149,
		[3] = 429,
		[10] = 1249,
		[50] = 4999
	},
	["Title"] = "PREMIUM BIRD EGG!",
	["Vector"] = "rbxassetid://82621628013565",
	["VectorPosition"] = UDim2.fromScale(0.111, 0.613),
	["VectorSize"] = UDim2.fromScale(0.31, 0.942),
	["Display"] = "Egg",
	["DisplayPlural"] = "Eggs",
	["BackgroundImage"] = "rbxassetid://138776814412466",
	["Items"] = (function()
		-- upvalues: (copy) v_u_1
		local v27 = require(v_u_1.Data.PetRegistry)
		local v28 = {}
		for v29, v30 in v27.PetEggs["Premium Bird Egg"].RarityData.Items do
			local v31 = v29:match("Egg/(.-)$")
			local v32 = {
				["Chance"] = v30.ItemOdd,
				["Type"] = v31 and "Egg" or "Pet",
				["RewardId"] = v31 or v29
			}
			local v33
			if v31 then
				v33 = v27.PetEggs[v31].Icon or ""
			else
				v33 = v27.PetList[v29] and (v27.PetList[v29].Icon or "") or ""
			end
			v32.Icon = v33
			table.insert(v28, v32)
		end
		table.sort(v28, function(p34, p35)
			if p34.Type == "Egg" then
				return false
			elseif p35.Type == "Egg" then
				return true
			else
				local v36 = p34.Chance
				local v37 = p35.Chance
				if v36 == v37 then
					return p34.RewardId > p35.RewardId
				else
					return v37 < v36
				end
			end
		end)
		return v28
	end)(),
	["BiggerTemplateIndex"] = 5,
	["MidTemplateIndex"] = 3,
	["ReleaseTime"] = DateTime.fromUniversalTime(2026, 1, 17, 18),
	["EndTime"] = DateTime.fromUniversalTime(2026, 1, 24, 18),
	["Pity"] = "Premium Bird Egg"
}
local v39 = {
	["Products"] = {
		[1] = 3520430329,
		[3] = 3520430327,
		[10] = 3520430328,
		[50] = 3520430331
	},
	["GiftProducts"] = {
		[1] = 3520430333,
		[3] = 3520430330,
		[10] = 3520430332,
		[50] = 3520430334
	},
	["FallbackPrices"] = {
		[1] = 149,
		[3] = 429,
		[10] = 1249,
		[50] = 4999
	},
	["Title"] = "EXOTIC BUTTERCUP CHEST!",
	["Vector"] = "rbxassetid://122073426066738",
	["VectorPosition"] = UDim2.fromScale(0.1, 0.45),
	["VectorSize"] = UDim2.fromScale(0.3, 0.6),
	["Display"] = "Chest",
	["DisplayPlural"] = "Chests",
	["BackgroundImage"] = "rbxassetid://138776814412466",
	["Items"] = v2.Packs["Exotic Buttercup Chest"].Items,
	["BiggerTemplateIndex"] = 6,
	["MidTemplateIndex"] = 4,
	["ReleaseTime"] = DateTime.fromUniversalTime(2026, 1, 24, 18),
	["EndTime"] = DateTime.fromUniversalTime(2026, 2, 7, 18),
	["Pity"] = "Exotic Buttercup Chest"
}
return {
	["PREMIUM_NEW_YEARS_EGG"] = v14,
	["PREMIUM_CARNIVAL_EGG"] = v26,
	["PREMIUM_BIRD_EGG"] = v38,
	["EXOTIC_BUTTERCUP_CHEST"] = v39
}