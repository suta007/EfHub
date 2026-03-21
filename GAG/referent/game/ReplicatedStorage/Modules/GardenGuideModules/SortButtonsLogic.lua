local v_u_1 = require(script.Parent.GGUI)
local v2 = {}
local v_u_3 = require(script.Parent.DataModules.GGStaticData).RarityLayoutMap
local v_u_22 = {
	["Alphabet"] = function(p4, p5)
		return p4.Name < p5.Name
	end,
	["RarityAsc"] = function(p6, p7)
		-- upvalues: (copy) v_u_3
		if p6.Rarity == p7.Rarity then
			return p6.Name < p7.Name
		else
			return v_u_3[p6.Rarity] < v_u_3[p7.Rarity]
		end
	end,
	["RarityDesc"] = function(p8, p9)
		-- upvalues: (copy) v_u_3
		if p8.Rarity == p9.Rarity then
			return p8.Name < p9.Name
		else
			return v_u_3[p8.Rarity] > v_u_3[p9.Rarity]
		end
	end,
	["Seen"] = function(p10, p11)
		local v12 = p10.Seen and 1 or 0
		local v13 = p11.Seen and 1 or 0
		if v12 == v13 then
			return p10.Name < p11.Name
		else
			return v13 < v12
		end
	end,
	["New"] = function(p14, p15)
		local v16 = p14.New and 1 or 0
		local v17 = p15.New and 1 or 0
		if v16 == v17 then
			return p14.Name < p15.Name
		else
			return v17 < v16
		end
	end,
	["MasteryAsc"] = function(p18, p19)
		if p18.MasteryProgress == p19.MasteryProgress then
			return p18.Name < p19.Name
		else
			return p18.MasteryProgress < p19.MasteryProgress
		end
	end,
	["MasteryDesc"] = function(p20, p21)
		if p20.MasteryProgress == p21.MasteryProgress then
			return p20.Name < p21.Name
		else
			return p20.MasteryProgress > p21.MasteryProgress
		end
	end
}
local v_u_23 = {}
local v_u_40 = {
	["Rarity"] = function(p24, p25)
		for v26 = #p24, 1, -1 do
			if p24[v26].Rarity ~= p25 then
				table.remove(p24, v26)
			end
		end
	end,
	["Boolean"] = function(p27, p28)
		for v29 = #p27, 1, -1 do
			if not p27[v29][p28] then
				table.remove(p27, v29)
			end
		end
	end,
	["Event"] = function(p30, p31)
		for v32 = #p30, 1, -1 do
			if p31 == "NonExclusive" then
				if string.find(p30[v32].Source, "Exclusive") then
					table.remove(p30, v32)
				end
			elseif not string.find(p30[v32].Source, "Exclusive") then
				table.remove(p30, v32)
			end
		end
	end,
	["Searchbar"] = function(p33, p34)
		local v35 = string.gsub(p34, "[^%w%s]", "")
		for v36 = #p33, 1, -1 do
			if not string.find(string.lower(p33[v36].Name), string.lower(v35)) then
				table.remove(p33, v36)
			end
		end
	end,
	["Trait"] = function(p37, p38)
		for v39 = #p37, 1, -1 do
			if not string.find(string.lower(p37[v39].Traits), string.lower(p38)) then
				table.remove(p37, v39)
			end
		end
	end
}
function v2.SetFilterStep(p41, p42)
	-- upvalues: (copy) v_u_23
	v_u_23[p41] = p42
end
function v2.FilterAndSort(p43)
	-- upvalues: (copy) v_u_23, (copy) v_u_1, (copy) v_u_40, (copy) v_u_22
	for _, v44 in v_u_23 do
		v44(p43)
	end
	if v_u_1.FilterAlgo and v_u_1.FilterType then
		local v45 = v_u_40[v_u_1.FilterAlgo]
		if v45 then
			v45(p43, v_u_1.FilterType)
		elseif v_u_1.FilterType ~= "Reset" then
			warn((("No filter algo w/ name %*"):format(v_u_1.FilterAlgo)))
		end
	end
	local v46 = v_u_22[v_u_1.SortAlgo or "RarityAsc"]
	if v46 then
		table.sort(p43, v46)
	else
		warn((("No sort algo w/ name %*"):format(v_u_1.SortAlgo)))
		table.sort(p43, v_u_22.RarityAsc)
	end
end
return v2