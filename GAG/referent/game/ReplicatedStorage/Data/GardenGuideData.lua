local v1 = game:GetService("ReplicatedStorage")
local v_u_2 = require(v1.Item_Module)
local v_u_3 = require(v1.Data.GrowableData)
local v_u_4 = require(v1.Data.SeedData)
local v_u_5 = require(v1.Data.SeedShopData)
local v_u_6 = require(script.GardenGuideTypes)
local v_u_7 = {
	["Apple"] = {
		["Source"] = "Seed Shop",
		["Obtainable"] = true
	}
}
(function()
	-- upvalues: (copy) v_u_2, (copy) v_u_3, (copy) v_u_4, (copy) v_u_7, (copy) v_u_6, (copy) v_u_5
	local v8 = v_u_2.Return_All_Data()
	local v9 = v_u_3:GetAllPlantData()
	local v10 = v_u_4
	for _, v11 in v8 do
		local v12 = v11[1]
		if v12 and v12 ~= "" then
			local v13 = v11[2] or 0
			local v14 = v11[3] or 0
			local _ = v11[4] or 0
			local v15 = v_u_7[v12] or v_u_6.DefaultEntry()
			v15.Name = v12
			v15.BaseWeight = v13
			v15.BaseValue = v14
			v_u_7[v12] = v15
		else
			print((("Invalid name for %* in Item_Module"):format(v11)))
		end
	end
	for v16, v17 in v9 do
		local v18 = (v17.PlantData.GrowTickTime.Min + v17.PlantData.GrowTickTime.Max) / 2
		local v19 = v17.PlantData.GrowRate
		if v17.FruitData then
			v18 = (v17.FruitData.GrowTickTime.Min + v17.FruitData.GrowTickTime.Max) / 2
			v19 = v17.FruitData.GrowRate
		end
		local v20 = v18 * v19
		local v21
		if v17.PlantData.GrowFruitTime then
			v21 = (v17.PlantData.GrowFruitTime.Min + v17.PlantData.GrowFruitTime.Max) / 2 or nil
		else
			v21 = nil
		end
		local v22 = v_u_7[v16] or v_u_6.DefaultEntry()
		v22.TimePerAge = v20
		if v21 then
			v22.ParentInfo = v22.ParentInfo or v_u_6.DefaultEntryParent()
			v22.ParentInfo.FruitTime = v21
			if not v17.FruitData then
				warn((("No fruit data for %*, despite having FruitTime!"):format(v16)))
			end
		end
		v_u_7[v16] = v22
	end
	for v23, v24 in v10 do
		local v25 = v_u_5[v23]
		local v26, v27, v28
		if v25 then
			v26 = v25.Price or 0
			v27 = v25.DisplayInShop and "Seed Shop" or "Event Exclusive"
			v28 = v25.DisplayInShop or false
		else
			v26 = 0
			v27 = "Event Exclusive"
			v28 = false
		end
		local v29 = v24.SeedRarity or "Unknown"
		local v30 = v_u_7[v23] or v_u_6.DefaultEntry()
		v30.Name = v23
		v30.SeedPrice = v26
		v30.Rarity = v29
		v30.Source = v27
		v30.Obtainable = v28
		v_u_7[v23] = v30
	end
end)()
return {
	["UseTool"] = false,
	["Entries"] = v_u_7
}