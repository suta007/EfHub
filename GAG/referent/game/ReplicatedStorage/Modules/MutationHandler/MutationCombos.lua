local v1 = game:GetService("ReplicatedStorage")
local v_u_2 = require(v1.Modules.TableUtils)
require(script.Parent)
local v3 = { "Drenched", "Wet" }
local v_u_4 = {
	["BestWet"] = {
		["Order"] = v3
	},
	["BestAmber"] = {
		["Order"] = { "AncientAmber", "OldAmber", "Amber" }
	},
	["BestCooked"] = {
		["Order"] = { "Cooked", "Burnt" }
	},
	["BestWeeping"] = {
		["Order"] = { "Desolate", "Withered", "Wilted" }
	},
	["Frozen"] = {
		["Requires"] = {
			v3,
			{ "Chilled" }
		},
		["LargerArrayName"] = "Water Mutations",
		["Results"] = { "Frozen" },
		["ResultsOverwrite"] = v_u_2:MakeTable(v3, "Chilled")
	},
	["Paradisal"] = {
		["Requires"] = {
			{ "Verdant" },
			{ "Sundried" }
		},
		["Results"] = { "Paradisal" },
		["ResultsOverwrite"] = v_u_2:MakeTable("Verdant", "Sundried")
	},
	["Clay"] = {
		["Requires"] = {
			v3,
			{ "Sandy" }
		},
		["LargerArrayName"] = "Water Mutations",
		["Results"] = { "Clay" },
		["ResultsOverwrite"] = v_u_2:MakeTable(v3, "Sandy")
	},
	["Ceramic"] = {
		["Requires"] = {
			{ "Clay" },
			{
				"Burnt",
				"Fried",
				"Cooked",
				"Molten",
				"Sundried"
			}
		},
		["LargerArrayName"] = "Heat Mutations",
		["Results"] = { "Ceramic" },
		["ResultsOverwrite"] = v_u_2:MakeTable("Burnt", "Fried", "Cooked", "Clay")
	},
	["Tempestuous"] = {
		["Requires"] = {
			{ "Windstruck" },
			{ "Twisted" }
		},
		["Results"] = { "Tempestuous" },
		["ResultsOverwrite"] = v_u_2:MakeTable("Windstruck", "Twisted")
	},
	["HarmonisedChakra"] = {
		["Requires"] = {
			{ "Chakra" },
			{ "CorruptChakra" }
		},
		["Results"] = { "HarmonisedChakra" },
		["ResultsOverwrite"] = v_u_2:MakeTable("Chakra", "CorruptChakra")
	},
	["HarmonisedFoxfireChakra"] = {
		["Requires"] = {
			{ "FoxfireChakra" },
			{ "CorruptFoxfireChakra" }
		},
		["Results"] = { "HarmonisedFoxfireChakra" },
		["ResultsOverwrite"] = v_u_2:MakeTable("FoxfireChakra", "CorruptFoxfireChakra")
	},
	["AscendedChakra"] = {
		["Requires"] = {
			{ "HarmonisedChakra" },
			{ "HarmonisedFoxfireChakra" }
		},
		["Results"] = { "AscendedChakra" },
		["ResultsOverwrite"] = v_u_2:MakeTable("HarmonisedChakra", "HarmonisedFoxfireChakra")
	},
	["Spaghetti"] = {
		["Requires"] = {
			{ "Pasta" },
			{ "Sauce" },
			{ "Meatball" }
		},
		["Results"] = { "Spaghetti" },
		["ResultsOverwrite"] = v_u_2:MakeTable("Pasta", "Sauce", "Meatball")
	},
	["Maelstrom"] = {
		["Requires"] = {
			{ "Tempestuous" },
			{ "Cyclonic" }
		},
		["Results"] = { "Maelstrom" },
		["ResultsOverwrite"] = v_u_2:MakeTable("Tempestuous", "Cyclonic")
	},
	["Gloom"] = {
		["Requires"] = {
			{ "Bloom" },
			{ "Rot" }
		},
		["Results"] = { "Gloom" },
		["ResultsOverwrite"] = v_u_2:MakeTable("Bloom", "Rot")
	},
	["Umbral"] = {
		["Requires"] = {
			{ "Blight" },
			{ "Pestilent" }
		},
		["Results"] = { "Umbral" },
		["ResultsOverwrite"] = v_u_2:MakeTable("Blight", "Pestilent")
	},
	["Shadowbound"] = {
		["Requires"] = {
			{ "Gloom" },
			{ "Umbral" }
		},
		["Results"] = { "Shadowbound" },
		["ResultsOverwrite"] = v_u_2:MakeTable("Bloom", "Rot", "Blight", "Pestilent")
	},
	["Corrosive"] = {
		["Requires"] = {
			{ "Toxic" },
			{ "Acidic" }
		},
		["Results"] = { "Corrosive" },
		["ResultsOverwrite"] = v_u_2:MakeTable("Toxic", "Acidic")
	},
	["Stormcharged"] = {
		["Requires"] = {
			{ "Shocked" },
			{ "Static" },
			{ "Tempestuous" }
		},
		["Results"] = { "Stormcharged" },
		["ResultsOverwrite"] = v_u_2:MakeTable("Shocked", "Static", "Tempestuous")
	},
	["Cosmic"] = {
		["Requires"] = {
			{ "Celestial" },
			{ "Aurora" }
		},
		["Results"] = { "Cosmic" },
		["ResultsOverwrite"] = v_u_2:MakeTable("Celestial", "Aurora")
	},
	["Abyssal"] = {
		["Requires"] = {
			{ "Eclipsed" },
			{ "Voidtouched" }
		},
		["Results"] = { "Abyssal" },
		["ResultsOverwrite"] = v_u_2:MakeTable("Eclipsed", "Voidtouched")
	},
	["Blazing"] = {
		["Requires"] = {
			{ "Molten" },
			{ "Flaming" }
		},
		["Results"] = { "Blazing" },
		["ResultsOverwrite"] = v_u_2:MakeTable("Molten", "Flaming")
	},
	["Infernal"] = {
		["Requires"] = {
			{ "Meteoric" },
			{ "Blazing" }
		},
		["Results"] = { "Infernal" },
		["ResultsOverwrite"] = v_u_2:MakeTable("Meteoric", "Blazing")
	},
	["Plagued"] = {
		["Requires"] = {
			{ "Zombified" },
			{ "Infected" }
		},
		["Results"] = { "Plagued" },
		["ResultsOverwrite"] = v_u_2:MakeTable("Zombified", "Infected")
	},
	["Astral"] = {
		["Requires"] = {
			{ "Cosmic" },
			{ "Galactic" }
		},
		["Results"] = { "Astral" },
		["ResultsOverwrite"] = v_u_2:MakeTable("Cosmic", "Galactic")
	},
	["Sizzled"] = {
		["Requires"] = {
			{ "Cooked" },
			{ "Fried" }
		},
		["Results"] = { "Sizzled" },
		["ResultsOverwrite"] = v_u_2:MakeTable("Cooked", "Fried")
	},
	["OilBoil"] = {
		["Requires"] = {
			{ "Oil" },
			{ "Boil" }
		},
		["Results"] = { "OilBoil" },
		["ResultsOverwrite"] = v_u_2:MakeTable("Oil", "Boil")
	},
	["Biohazard"] = {
		["Requires"] = {
			{ "Radioactive" },
			{ "Plagued" }
		},
		["Results"] = { "Biohazard" },
		["ResultsOverwrite"] = v_u_2:MakeTable("Radioactive", "Plagued")
	},
	["Contagion"] = {
		["Requires"] = {
			{ "Corrosive" },
			{ "Biohazard" }
		},
		["Results"] = { "Contagion" },
		["ResultsOverwrite"] = v_u_2:MakeTable("Toxic", "Acidic", "Zombified", "Infected", "Radioactive", "Plagued", "Corrosive", "Biohazard")
	},
	["Slashbound"] = {
		["Requires"] = {
			{ "Sliced" },
			{ "Severed" }
		},
		["Results"] = { "Slashbound" },
		["ResultsOverwrite"] = v_u_2:MakeTable("Sliced", "Severed")
	},
	["Gourmet"] = {
		["Requires"] = {
			{ "Aromatic" },
			{ "Spaghetti" },
			{ "Sizzled" }
		},
		["Results"] = { "Gourmet" },
		["ResultsOverwrite"] = v_u_2:MakeTable("Aromatic", "Spaghetti", "Sizzled")
	},
	["Grim"] = {
		["Requires"] = {
			{ "Shadowbound" },
			{ "Blackout" }
		},
		["Results"] = { "Grim" },
		["ResultsOverwrite"] = v_u_2:MakeTable("Bloom", "Rot", "Blight", "Pestilent", "Blackout", "Shadowbound", "Blackout")
	},
	["SunScorched"] = {
		["Requires"] = {
			{ "Arid" },
			{ "Mirage" }
		},
		["Results"] = { "SunScorched" },
		["ResultsOverwrite"] = v_u_2:MakeTable("Arid", "Mirage")
	},
	["Supernatural"] = {
		["Requires"] = {
			{ "Vamp" },
			{ "Spooky" },
			{ "Ghostly" }
		},
		["Results"] = { "Supernatural" },
		["ResultsOverwrite"] = v_u_2:MakeTable("Vamp", "Spooky", "Ghostly")
	},
	["Riptide"] = {
		["Requires"] = {
			{ "Typhoon" },
			{ "Monsoon" }
		},
		["Results"] = { "Riptide" },
		["ResultsOverwrite"] = v_u_2:MakeTable("Typhoon", "Monsoon")
	},
	["Stormbound"] = {
		["Requires"] = {
			{ "Riptide" },
			{ "Stormcharged" }
		},
		["Results"] = { "Stormbound" },
		["ResultsOverwrite"] = v_u_2:MakeTable("Typhoon", "Monsoon", "Shocked", "Static", "Tempestuous", "Riptide", "Stormcharged")
	},
	["Extraterrestrial"] = {
		["Requires"] = {
			{ "Alienlike" },
			{ "Alienated" }
		},
		["Results"] = { "Extraterrestrial" },
		["ResultsOverwrite"] = v_u_2:MakeTable("Alienlike", "Alienated")
	},
	["Mineral"] = {
		["Requires"] = {
			{ "Tempered" },
			{ "Geode" },
			{ "Charcoal" }
		},
		["Results"] = { "Mineral" },
		["ResultsOverwrite"] = v_u_2:MakeTable("Tempered", "Geode", "Charcoal")
	},
	["MindBender"] = {
		["Requires"] = {
			{ "Brainrot" },
			{ "Warped" }
		},
		["Results"] = { "MindBender" },
		["ResultsOverwrite"] = v_u_2:MakeTable("Brainrot", "Warped")
	},
	["Affluent"] = {
		["Requires"] = {
			{ "Fortune" },
			{ "Jackpot" },
			{ "Coin" }
		},
		["Results"] = { "Affluent" },
		["ResultsOverwrite"] = v_u_2:MakeTable("Fortune", "Jackpot", "Coin")
	},
	["Fractured"] = {
		["Requires"] = {
			{ "Glitched" },
			{ "Plasma" }
		},
		["Results"] = { "Fractured" },
		["ResultsOverwrite"] = v_u_2:MakeTable("Glitched", "Plasma")
	},
	["Fierywork"] = {
		["Requires"] = {
			{ "Fiery" },
			{ "Firework" }
		},
		["Results"] = { "Fierywork" },
		["ResultsOverwrite"] = v_u_2:MakeTable("Fiery", "Firework")
	},
	["Confection"] = {
		["Requires"] = {
			{ "Choc" },
			{ "Gummy" },
			{ "Candy" }
		},
		["Results"] = { "Confection" },
		["ResultsOverwrite"] = v_u_2:MakeTable("Choc", "Gummy", "Candy")
	}
}
local v_u_5 = {}
local v_u_6 = {}
local v_u_7 = {}
local v_u_8 = {}
local v9 = {}
local function v_u_14(p10, p11)
	local v12 = false
	for _, v13 in p10.Order do
		if v12 then
			p11:SetAttribute(v13, nil)
		elseif p11:GetAttribute(v13) then
			v12 = true
		end
	end
end
local function v_u_26(p15, p16)
	if p15.ResultsOverwrite then
		local v17 = true
		for _, v18 in p15.Results do
			if not p16:GetAttribute(v18) then
				v17 = false
				break
			end
		end
		if v17 then
			for _, v19 in p15.ResultsOverwrite do
				p16:SetAttribute(v19, nil)
			end
			return
		end
	end
	local v20 = true
	for _, v21 in p15.Requires do
		local v22 = false
		for _, v23 in v21 do
			if p16:GetAttribute(v23) then
				v22 = true
				break
			end
		end
		if not v22 then
			v20 = false
		end
	end
	if v20 then
		if p15.ResultsOverwrite then
			for _, v24 in p15.ResultsOverwrite do
				p16:SetAttribute(v24, nil)
			end
		end
		for _, v25 in p15.Results do
			p16:SetAttribute(v25, true)
		end
	end
end
for v27, v28 in v_u_4 do
	local v29
	if type(v28) == "table" then
		local v30 = v28.Order
		v29 = type(v30) == "table"
	else
		v29 = false
	end
	if v29 then
		v_u_6[v27] = v28
		for _, v31 in v28.Order do
			v_u_7[v31] = v27
		end
	else
		local v32
		if type(v28) == "table" then
			local v33 = v28.Requires
			v32 = type(v33) == "table"
		else
			v32 = false
		end
		if v32 then
			v_u_8[v27] = v28
			for _, v34 in v28.Requires do
				for _, v35 in v34 do
					if not v_u_5[v35] then
						v_u_5[v35] = { v27 }
					end
					local v36 = v_u_5[v35]
					table.insert(v36, v27)
				end
			end
		end
	end
end
local function v_u_50(p37, p38)
	-- upvalues: (copy) v_u_2, (copy) v_u_7, (copy) v_u_6
	local v39 = p38 == true and p37 and p37 or v_u_2:DeepCopy(p37)
	local v40 = {}
	for _, v41 in v39 do
		local v42 = v_u_7[v41]
		if v42 then
			if v40[v42] then
				local v43 = v40[v42]
				table.insert(v43, v41)
			else
				v40[v42] = { v41 }
			end
		end
	end
	for v44, v45 in v40 do
		local v46 = nil
		for _, v47 in v_u_6[v44].Order do
			if table.find(v45, v47) then
				v46 = v47
				break
			end
		end
		for _, v48 in v45 do
			if v48 ~= v46 then
				local v49 = table.find(v39, v48)
				if v49 then
					table.remove(v39, v49)
				end
			end
		end
	end
	return v39
end
local function v_u_70(p51, p52)
	-- upvalues: (copy) v_u_2, (copy) v_u_5, (copy) v_u_8
	local v53 = p52 == true and p51 and p51 or v_u_2:DeepCopy(p51)
	local v54 = {}
	for _, v55 in v53 do
		local v56 = v_u_5[v55]
		if v56 then
			for _, v57 in v56 do
				if table.find(v53, v57) then
					local v58 = v_u_8[v57]
					if v58 then
						for _, v59 in v58.ResultsOverwrite do
							local v60 = table.find(v53, v59)
							if v60 then
								table.remove(v53, v60)
							end
						end
					end
				elseif v54[v57] then
					local v61 = v54[v57]
					table.insert(v61, v55)
				else
					v54[v57] = { v55 }
				end
			end
		end
	end
	for v62, v63 in v54 do
		local v64 = v_u_8[v62]
		if v64 then
			local v65 = #v64.Requires
			for _, v66 in v64.Requires do
				for _, v67 in v63 do
					if table.find(v66, v67) then
						v65 = v65 - 1
						break
					end
				end
			end
			if v65 == 0 then
				for _, v68 in v64.ResultsOverwrite do
					local v69 = table.find(v53, v68)
					if v69 then
						table.remove(v53, v69)
					end
				end
				table.insert(v53, v62)
			end
		end
	end
	return v53
end
function v9.HandleCombos(_, p71)
	-- upvalues: (copy) v_u_4, (copy) v_u_14, (copy) v_u_26
	if p71 then
		for v72, v73 in v_u_4 do
			if v73 then
				local v74
				if type(v73) == "table" then
					local v75 = v73.Order
					v74 = type(v75) == "table"
				else
					v74 = false
				end
				if v74 then
					v_u_14(v73, p71)
				else
					local v76
					if type(v73) == "table" then
						local v77 = v73.Requires
						v76 = type(v77) == "table"
					else
						v76 = false
					end
					if v76 then
						v_u_26(v73, p71)
					end
				end
			else
				warn((("No comboData for %*"):format(v72)))
			end
		end
	else
		warn("No Plant")
	end
end
function v9.GetRandomAssortmentOfValidMutations(_, p78, p79, _)
	-- upvalues: (copy) v_u_2, (copy) v_u_50, (copy) v_u_70
	local v80 = Random.new()
	local v81 = v_u_2:DeepCopy(p78)
	v80:Shuffle(v81)
	local v82 = {}
	for _ = 1, p79 do
		local v83 = table.remove(v81, 1)
		if not v83 then
			break
		end
		table.insert(v82, v83)
	end
	return v_u_70((v_u_50(v82)))
end
function v9.GetComboData(p84)
	-- upvalues: (copy) v_u_6, (copy) v_u_4
	local v85 = {
		["Type"] = nil,
		["Data"] = nil
	}
	for v88, v87 in v_u_6 do
		if table.find(v87.Order, p84) then
			goto l4
		end
	end
	local v88 = nil
	::l4::
	local v89 = v_u_4[p84]
	if not (v89 or v88) then
		return v85
	end
	if v88 then
		v85.Type = "Chain Combo"
	else
		local v90
		if type(v89) == "table" then
			local v91 = v89.Requires
			v90 = type(v91) == "table"
		else
			v90 = false
		end
		if v90 then
			v85.Type = "Fusion Combo"
		end
	end
	v85.Data = v89 or v_u_4[v88]
	return v85
end
return v9