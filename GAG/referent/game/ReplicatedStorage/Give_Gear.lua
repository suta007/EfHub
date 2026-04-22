local v1 = game:GetService("ServerStorage")
local v2 = game:GetService("ReplicatedStorage")
local v_u_3 = game:GetService("ServerScriptService")
local v_u_4 = game:GetService("Players")
game:GetService("HttpService")
v1:WaitForChild("SaveableTools")
v1:WaitForChild("Gears")
local v5 = v2:WaitForChild("ObjectModels")
local v6 = v2.Assets.Models.FriendshipPots
local v7 = v2.Assets.Models.SprayBottles
local v8 = v2.Assets.Models.PetBoosts
local v9 = v2.Assets.Models.PetShards
require(v2.Data.SaveableToolsData)
require(v2.Modules.StringUtils)
local v_u_10 = require(v_u_3.Modules.InventoryService)
local v_u_11 = require(v_u_3.Modules.FriendshipPot.FriendshipPotToolService)
local v_u_12 = require(v_u_3.Modules.SprayService)
local v13 = require(v2.Modules.MutationHandler)
local v14 = require(v2.Data.PetRegistry.PetBoostRegistry)
local v15 = require(v_u_3.Modules.PetsServices.PetMutationHandler)
local v_u_16 = require(v_u_3.Modules.PetShardService)
local v17 = require(v2.Item_Module)
local v_u_18 = require(v_u_3.Modules.FertilizerService)
local v19
if game:GetService("RunService"):IsServer() then
	v19 = v1:WaitForChild("Assets"):WaitForChild("FoodModels")
else
	v19 = require(v2.Modules.SelectiveAssetReplication):GetAssetAsync("Assets", "FoodModels")
end
local v20 = v13.MutationNames
local v21 = v15.MutationNames
local v_u_125 = {
	["Watering Can"] = function(p22, _, p23)
		-- upvalues: (copy) v_u_10
		local v24 = p23 or 1
		local v25 = v_u_10:Find(p22, "Watering Can")
		local _, v26 = next(v25)
		if v26 then
			local v27 = v26.ItemData
			v27.Uses = v27.Uses + v24
		else
			v_u_10:CreateItem(p22, "Watering Can", {
				["Uses"] = v24
			})
		end
	end,
	["Trowel"] = function(p28, _, p29)
		-- upvalues: (copy) v_u_10
		local v30 = p29 or 1
		local v31 = v_u_10:Find(p28, "Trowel")
		local _, v32 = next(v31)
		if v32 then
			local v33 = v32.ItemData
			v33.Uses = v33.Uses + v30
		else
			v_u_10:CreateItem(p28, "Trowel", {
				["Uses"] = v30
			})
		end
	end,
	["Recall Wrench"] = function(p34, _, p35)
		-- upvalues: (copy) v_u_10
		local v36 = p35 or 1
		local v37 = v_u_10:Find(p34, "Recall Wrench")
		local _, v38 = next(v37)
		if v38 then
			local v39 = v38.ItemData
			v39.Uses = v39.Uses + v36
		else
			v_u_10:CreateItem(p34, "Recall Wrench", {
				["Uses"] = v36
			})
		end
	end,
	["Event Lantern"] = function(p40, _, p41)
		-- upvalues: (copy) v_u_10
		local v42 = p41 or 1
		local v43 = v_u_10:Find(p40, "Event Lantern")
		local _, v44 = next(v43)
		if v44 then
			local v45 = v44.ItemData
			v45.Uses = v45.Uses + v42
		else
			v_u_10:CreateItem(p40, "Event Lantern", {
				["Uses"] = v42
			})
		end
	end,
	["Favorite Tool"] = function(p46, _, p47)
		-- upvalues: (copy) v_u_10
		local v48 = p47 or 1
		local v49 = v_u_10:Find(p46, "Favorite Tool")
		local _, v50 = next(v49)
		if v50 then
			local v51 = v50.ItemData
			v51.Uses = v51.Uses + v48
		else
			v_u_10:CreateItem(p46, "Favorite Tool", {
				["Uses"] = v48
			})
		end
	end,
	["Harvest Tool"] = function(p52, _, p53)
		-- upvalues: (copy) v_u_10
		local v54 = p53 or 1
		local v55 = v_u_10:Find(p52, "Harvest Tool")
		local _, v56 = next(v55)
		if v56 then
			local v57 = v56.ItemData
			v57.Uses = v57.Uses + v54
		else
			v_u_10:CreateItem(p52, "Harvest Tool", {
				["Uses"] = v54
			})
		end
	end,
	["Pet Pouch"] = function(p58, _, p59)
		-- upvalues: (copy) v_u_10
		local v60 = p59 or 1
		local v61 = v_u_10:Find(p58, "Pet Pouch")
		local _, v62 = next(v61)
		if v62 then
			local v63 = v62.ItemData
			v63.Uses = v63.Uses + v60
		else
			v_u_10:CreateItem(p58, "Pet Pouch", {
				["Uses"] = v60
			})
		end
	end,
	["Pollen Radar"] = function(p64, _, p65)
		-- upvalues: (copy) v_u_10
		local v66 = p65 or 1
		local v67 = v_u_10:Find(p64, "Pollen Radar")
		local _, v68 = next(v67)
		if v68 then
			local v69 = v68.ItemData
			v69.Uses = v69.Uses + v66
		else
			v_u_10:CreateItem(p64, "Pollen Radar", {
				["Uses"] = v66
			})
		end
	end,
	["Tranquil Radar"] = function(p70, _, p71)
		-- upvalues: (copy) v_u_10
		local v72 = p71 or 1
		local v73 = v_u_10:Find(p70, "Tranquil Radar")
		local _, v74 = next(v73)
		if v74 then
			local v75 = v74.ItemData
			v75.Uses = v75.Uses + v72
		else
			v_u_10:CreateItem(p70, "Tranquil Radar", {
				["Uses"] = v72
			})
		end
	end,
	["Corrupt Radar"] = function(p76, _, p77)
		-- upvalues: (copy) v_u_10
		local v78 = p77 or 1
		local v79 = v_u_10:Find(p76, "Corrupt Radar")
		local _, v80 = next(v79)
		if v80 then
			local v81 = v80.ItemData
			v81.Uses = v81.Uses + v78
		else
			v_u_10:CreateItem(p76, "Corrupt Radar", {
				["Uses"] = v78
			})
		end
	end,
	["Glimmering Radar"] = function(p82, _, p83)
		-- upvalues: (copy) v_u_10
		local v84 = p83 or 1
		local v85 = v_u_10:Find(p82, "Glimmering Radar")
		local _, v86 = next(v85)
		if v86 then
			local v87 = v86.ItemData
			v87.Uses = v87.Uses + v84
		else
			v_u_10:CreateItem(p82, "Glimmering Radar", {
				["Uses"] = v84
			})
		end
	end,
	["Reclaimer"] = function(p88, _, p89)
		-- upvalues: (copy) v_u_10
		local v90 = p89 or 1
		local v91 = v_u_10:Find(p88, "Reclaimer")
		local _, v92 = next(v91)
		if v92 then
			local v93 = v92.ItemData
			v93.Uses = v93.Uses + v90
		else
			v_u_10:CreateItem(p88, "Reclaimer", {
				["Uses"] = v90
			})
		end
	end,
	["Tanning Mirror"] = function(p94, _, p95)
		-- upvalues: (copy) v_u_10
		local v96 = p95 or 1
		local v97 = v_u_10:Find(p94, "Tanning Mirror")
		local _, v98 = next(v97)
		if v98 then
			local v99 = v98.ItemData
			v99.Uses = v99.Uses + v96
		else
			v_u_10:CreateItem(p94, "Tanning Mirror", {
				["Uses"] = v96
			})
		end
	end,
	["Magnifying Glass"] = function(p100, _, p101)
		-- upvalues: (copy) v_u_10
		local v102 = p101 or 1
		local v103 = v_u_10:Find(p100, "Magnifying Glass")
		local _, v104 = next(v103)
		if v104 then
			local v105 = v104.ItemData
			v105.Uses = v105.Uses + v102
		else
			v_u_10:CreateItem(p100, "Magnifying Glass", {
				["Uses"] = v102
			})
		end
	end,
	["Firework"] = function(p106, _, p107)
		-- upvalues: (copy) v_u_10
		local v108 = p107 or 1
		local v109 = v_u_10:Find(p106, "Firework")
		local _, v110 = next(v109)
		if v110 then
			local v111 = v110.ItemData
			v111.Uses = v111.Uses + v108
		else
			v_u_10:CreateItem(p106, "Firework", {
				["Uses"] = v108
			})
		end
	end,
	["Plant Booster"] = function(p112, _, _)
		-- upvalues: (copy) v_u_10
		v_u_10:CreateItem(p112, "Plant Booster", {
			["PlantBoostAmount"] = 10
		})
	end,
	["Egg Booster"] = function(p113, _, p114)
		-- upvalues: (copy) v_u_10
		local v115 = p114 or 1
		local v116 = v_u_10:Find(p113, "Egg Booster")
		local _, v117 = next(v116)
		if v117 then
			local v118 = v117.ItemData
			v118.Uses = v118.Uses + v115
		else
			v_u_10:CreateItem(p113, "Egg Booster", {
				["Uses"] = v115,
				["EggBoostAmount"] = 10
			})
		end
	end,
	["Elder Candy Blossom Upgrader"] = function(p119, _, p120)
		-- upvalues: (copy) v_u_10
		local v121 = p120 or 1
		local v122 = v_u_10:Find(p119, "Elder Candy Blossom Upgrader")
		local _, v123 = next(v122)
		if v123 then
			local v124 = v123.ItemData
			v124.Uses = v124.Uses + v121
		else
			v_u_10:CreateItem(p119, "Elder Candy Blossom Upgrader", {
				["Uses"] = v121
			})
		end
	end
}
local v_u_126 = 1
v_u_125["Candy Blossom Shard"] = function(p127, p128, p129)
	-- upvalues: (copy) v_u_126, (copy) v_u_10
	local v130 = p129 or (v_u_126 or 1)
	local v131 = v_u_10:Find(p127, p128)
	local _, v132 = next(v131)
	if v132 then
		local v133 = v132.ItemData
		v133.Uses = v133.Uses + v130
	else
		v_u_10:CreateItem(p127, p128, {
			["Uses"] = v130
		})
	end
end
v_u_125["Trading Ticket"] = function(p134, _, p135)
	-- upvalues: (copy) v_u_10
	local v136 = p135 or 1
	local v137 = v_u_10:Find(p134, "Trading Ticket")
	local _, v138 = next(v137)
	if v138 then
		local v139 = v138.ItemData
		v139.Uses = v139.Uses + v136
	else
		v_u_10:CreateItem(p134, "Trading Ticket", {
			["Uses"] = v136
		})
	end
end
local v_u_140 = 1
v_u_125["Fairy Summoner"] = function(p141, p142, p143)
	-- upvalues: (copy) v_u_140, (copy) v_u_10
	local v144 = p143 or (v_u_140 or 1)
	local v145 = v_u_10:Find(p141, p142)
	local _, v146 = next(v145)
	if v146 then
		local v147 = v146.ItemData
		v147.Uses = v147.Uses + v144
	else
		v_u_10:CreateItem(p141, p142, {
			["Uses"] = v144
		})
	end
end
local v_u_148 = 1
v_u_125["Fairy Power Extender"] = function(p149, p150, p151)
	-- upvalues: (copy) v_u_148, (copy) v_u_10
	local v152 = p151 or (v_u_148 or 1)
	local v153 = v_u_10:Find(p149, p150)
	local _, v154 = next(v153)
	if v154 then
		local v155 = v154.ItemData
		v155.Uses = v155.Uses + v152
	else
		v_u_10:CreateItem(p149, p150, {
			["Uses"] = v152
		})
	end
end
local v_u_156 = 1
v_u_125["Fairy Caller"] = function(p157, p158, p159)
	-- upvalues: (copy) v_u_156, (copy) v_u_10
	local v160 = p159 or (v_u_156 or 1)
	local v161 = v_u_10:Find(p157, p158)
	local _, v162 = next(v161)
	if v162 then
		local v163 = v162.ItemData
		v163.Uses = v163.Uses + v160
	else
		v_u_10:CreateItem(p157, p158, {
			["Uses"] = v160
		})
	end
end
local v_u_164 = 1
v_u_125["Luminous Wand"] = function(p165, p166, p167)
	-- upvalues: (copy) v_u_164, (copy) v_u_10
	local v168 = p167 or (v_u_164 or 1)
	local v169 = v_u_10:Find(p165, p166)
	local _, v170 = next(v169)
	if v170 then
		local v171 = v170.ItemData
		v171.Uses = v171.Uses + v168
	else
		v_u_10:CreateItem(p165, p166, {
			["Uses"] = v168
		})
	end
end
local v_u_172 = 1
v_u_125["Fairy Net"] = function(p173, p174, p175)
	-- upvalues: (copy) v_u_172, (copy) v_u_10
	local v176 = p175 or (v_u_172 or 1)
	local v177 = v_u_10:Find(p173, p174)
	local _, v178 = next(v177)
	if v178 then
		local v179 = v178.ItemData
		v179.Uses = v179.Uses + v176
	else
		v_u_10:CreateItem(p173, p174, {
			["Uses"] = v176
		})
	end
end
local v_u_180 = 1
v_u_125["Fairy Jar"] = function(p181, p182, p183)
	-- upvalues: (copy) v_u_180, (copy) v_u_10
	local v184 = p183 or (v_u_180 or 1)
	local v185 = v_u_10:Find(p181, p182)
	local _, v186 = next(v185)
	if v186 then
		local v187 = v186.ItemData
		v187.Uses = v187.Uses + v184
	else
		v_u_10:CreateItem(p181, p182, {
			["Uses"] = v184
		})
	end
end
local v_u_188 = 1
v_u_125["Pet Name Reroller"] = function(p189, p190, p191)
	-- upvalues: (copy) v_u_188, (copy) v_u_10
	local v192 = p191 or (v_u_188 or 1)
	local v193 = v_u_10:Find(p189, p190)
	local _, v194 = next(v193)
	if v194 then
		local v195 = v194.ItemData
		v195.Uses = v195.Uses + v192
	else
		v_u_10:CreateItem(p189, p190, {
			["Uses"] = v192
		})
	end
end
local v_u_196 = 1
v_u_125["Grow All"] = function(p197, p198, p199)
	-- upvalues: (copy) v_u_196, (copy) v_u_10
	local v200 = p199 or (v_u_196 or 1)
	local v201 = v_u_10:Find(p197, p198)
	local _, v202 = next(v201)
	if v202 then
		local v203 = v202.ItemData
		v203.Uses = v203.Uses + v200
	else
		v_u_10:CreateItem(p197, p198, {
			["Uses"] = v200
		})
	end
end
local v_u_204 = 1
function v_u_125.Steal(p205, p206, p207)
	-- upvalues: (copy) v_u_204, (copy) v_u_10
	local v208 = p207 or (v_u_204 or 1)
	local v209 = v_u_10:Find(p205, p206)
	local _, v210 = next(v209)
	if v210 then
		local v211 = v210.ItemData
		v211.Uses = v211.Uses + v208
	else
		v_u_10:CreateItem(p205, p206, {
			["Uses"] = v208
		})
	end
end
local v_u_212 = 1
v_u_125["Firefly Jar"] = function(p213, p214, p215)
	-- upvalues: (copy) v_u_212, (copy) v_u_10
	local v216 = p215 or (v_u_212 or 1)
	local v217 = v_u_10:Find(p213, p214)
	local _, v218 = next(v217)
	if v218 then
		local v219 = v218.ItemData
		v219.Uses = v219.Uses + v216
	else
		v_u_10:CreateItem(p213, p214, {
			["Uses"] = v216
		})
	end
end
local v_u_220 = 1
v_u_125["Sky Lantern"] = function(p221, p222, p223)
	-- upvalues: (copy) v_u_220, (copy) v_u_10
	local v224 = p223 or (v_u_220 or 1)
	local v225 = v_u_10:Find(p221, p222)
	local _, v226 = next(v225)
	if v226 then
		local v227 = v226.ItemData
		v227.Uses = v227.Uses + v224
	else
		v_u_10:CreateItem(p221, p222, {
			["Uses"] = v224
		})
	end
end
local v_u_228 = 1
v_u_125["Maple Leaf Kite"] = function(p229, p230, p231)
	-- upvalues: (copy) v_u_228, (copy) v_u_10
	local v232 = p231 or (v_u_228 or 1)
	local v233 = v_u_10:Find(p229, p230)
	local _, v234 = next(v233)
	if v234 then
		local v235 = v234.ItemData
		v235.Uses = v235.Uses + v232
	else
		v_u_10:CreateItem(p229, p230, {
			["Uses"] = v232
		})
	end
end
local v_u_236 = 1
v_u_125["Maple Syrup"] = function(p237, p238, p239)
	-- upvalues: (copy) v_u_236, (copy) v_u_10
	local v240 = p239 or (v_u_236 or 1)
	local v241 = v_u_10:Find(p237, p238)
	local _, v242 = next(v241)
	if v242 then
		local v243 = v242.ItemData
		v243.Uses = v243.Uses + v240
	else
		v_u_10:CreateItem(p237, p238, {
			["Uses"] = v240
		})
	end
end
local v_u_244 = 1
v_u_125["Maple Leaf Charm"] = function(p245, p246, p247)
	-- upvalues: (copy) v_u_244, (copy) v_u_10
	local v248 = p247 or (v_u_244 or 1)
	local v249 = v_u_10:Find(p245, p246)
	local _, v250 = next(v249)
	if v250 then
		local v251 = v250.ItemData
		v251.Uses = v251.Uses + v248
	else
		v_u_10:CreateItem(p245, p246, {
			["Uses"] = v248
		})
	end
end
local v_u_252 = 1
v_u_125["Maple Sprinkler"] = function(p253, p254, p255)
	-- upvalues: (copy) v_u_252, (copy) v_u_10
	local v256 = p255 or (v_u_252 or 1)
	local v257 = v_u_10:Find(p253, p254)
	local _, v258 = next(v257)
	if v258 then
		local v259 = v258.ItemData
		v259.Uses = v259.Uses + v256
	else
		v_u_10:CreateItem(p253, p254, {
			["Uses"] = v256
		})
	end
end
local v_u_260 = 1
function v_u_125.Bonfire(p261, p262, p263)
	-- upvalues: (copy) v_u_260, (copy) v_u_10
	local v264 = p263 or (v_u_260 or 1)
	local v265 = v_u_10:Find(p261, p262)
	local _, v266 = next(v265)
	if v266 then
		local v267 = v266.ItemData
		v267.Uses = v267.Uses + v264
	else
		v_u_10:CreateItem(p261, p262, {
			["Uses"] = v264
		})
	end
end
local v_u_268 = 1
v_u_125["Harvest Basket"] = function(p269, p270, p271)
	-- upvalues: (copy) v_u_268, (copy) v_u_10
	local v272 = p271 or (v_u_268 or 1)
	local v273 = v_u_10:Find(p269, p270)
	local _, v274 = next(v273)
	if v274 then
		local v275 = v274.ItemData
		v275.Uses = v275.Uses + v272
	else
		v_u_10:CreateItem(p269, p270, {
			["Uses"] = v272
		})
	end
end
local v_u_276 = 1
v_u_125["Golden Acorn"] = function(p277, p278, p279)
	-- upvalues: (copy) v_u_276, (copy) v_u_10
	local v280 = p279 or (v_u_276 or 1)
	local v281 = v_u_10:Find(p277, p278)
	local _, v282 = next(v281)
	if v282 then
		local v283 = v282.ItemData
		v283.Uses = v283.Uses + v280
	else
		v_u_10:CreateItem(p277, p278, {
			["Uses"] = v280
		})
	end
end
local v_u_284 = 1
function v_u_125.Rake(p285, p286, p287)
	-- upvalues: (copy) v_u_284, (copy) v_u_10
	local v288 = p287 or (v_u_284 or 1)
	local v289 = v_u_10:Find(p285, p286)
	local _, v290 = next(v289)
	if v290 then
		local v291 = v290.ItemData
		v291.Uses = v291.Uses + v288
	else
		v_u_10:CreateItem(p285, p286, {
			["Uses"] = v288
		})
	end
end
local v_u_292 = 1
v_u_125["Acorn Bell"] = function(p293, p294, p295)
	-- upvalues: (copy) v_u_292, (copy) v_u_10
	local v296 = p295 or (v_u_292 or 1)
	local v297 = v_u_10:Find(p293, p294)
	local _, v298 = next(v297)
	if v298 then
		local v299 = v298.ItemData
		v299.Uses = v299.Uses + v296
	else
		v_u_10:CreateItem(p293, p294, {
			["Uses"] = v296
		})
	end
end
local v_u_300 = 1
v_u_125["Super Watering Can"] = function(p301, p302, p303)
	-- upvalues: (copy) v_u_300, (copy) v_u_10
	local v304 = p303 or (v_u_300 or 1)
	local v305 = v_u_10:Find(p301, p302)
	local _, v306 = next(v305)
	if v306 then
		local v307 = v306.ItemData
		v307.Uses = v307.Uses + v304
	else
		v_u_10:CreateItem(p301, p302, {
			["Uses"] = v304
		})
	end
end
local v_u_308 = 1
function v_u_125.Frightwork(p309, p310, p311)
	-- upvalues: (copy) v_u_308, (copy) v_u_10
	local v312 = p311 or (v_u_308 or 1)
	local v313 = v_u_10:Find(p309, p310)
	local _, v314 = next(v313)
	if v314 then
		local v315 = v314.ItemData
		v315.Uses = v315.Uses + v312
	else
		v_u_10:CreateItem(p309, p310, {
			["Uses"] = v312
		})
	end
end
local v_u_316 = 1
v_u_125["Christmas Firework"] = function(p317, p318, p319)
	-- upvalues: (copy) v_u_316, (copy) v_u_10
	local v320 = p319 or (v_u_316 or 1)
	local v321 = v_u_10:Find(p317, p318)
	local _, v322 = next(v321)
	if v322 then
		local v323 = v322.ItemData
		v323.Uses = v323.Uses + v320
	else
		v_u_10:CreateItem(p317, p318, {
			["Uses"] = v320
		})
	end
end
local v_u_324 = 1
v_u_125["New Year\'s Firework"] = function(p325, p326, p327)
	-- upvalues: (copy) v_u_324, (copy) v_u_10
	local v328 = p327 or (v_u_324 or 1)
	local v329 = v_u_10:Find(p325, p326)
	local _, v330 = next(v329)
	if v330 then
		local v331 = v330.ItemData
		v331.Uses = v331.Uses + v328
	else
		v_u_10:CreateItem(p325, p326, {
			["Uses"] = v328
		})
	end
end
v_u_125["Leaf Blower"] = function(p332, _, p333)
	-- upvalues: (copy) v_u_10
	local v334 = p333 or 1
	local v335 = v_u_10:Find(p332, "Leaf Blower")
	local _, v336 = next(v335)
	if v336 then
		local v337 = v336.ItemData
		v337.Uses = v337.Uses + v334
	else
		v_u_10:CreateItem(p332, "Leaf Blower", {
			["Uses"] = v334,
			["PowerRemaining"] = 100
		})
	end
end
v_u_125["Super Leaf Blower"] = function(p338, _, p339)
	-- upvalues: (copy) v_u_10
	local v340 = p339 or 1
	local v341 = v_u_10:Find(p338, "Super Leaf Blower")
	local _, v342 = next(v341)
	if v342 then
		local v343 = v342.ItemData
		v343.Uses = v343.Uses + v340
	else
		v_u_10:CreateItem(p338, "Super Leaf Blower", {
			["Uses"] = v340,
			["PowerRemaining"] = 125
		})
	end
end
v_u_125["Sheckles Gun"] = function(p344, _, p345)
	-- upvalues: (copy) v_u_10
	local v346 = p345 or 1
	local v347 = v_u_10:Find(p344, "Sheckles Gun")
	local _, v348 = next(v347)
	if v348 then
		local v349 = v348.ItemData
		v349.Uses = v349.Uses + v346
	else
		v_u_10:CreateItem(p344, "Sheckles Gun", {
			["Uses"] = v346,
			["PowerRemaining"] = 100
		})
	end
end
v_u_125["Garden Guide"] = function(p350, _, _)
	-- upvalues: (copy) v_u_10
	local v351 = v_u_10:Find(p350, "Firework")
	local _, _ = next(v351)
	v_u_10:CreateItem(p350, "Garden Guide", {})
end
v_u_125["Bean Speaker"] = function(p352, _, p353)
	-- upvalues: (copy) v_u_10
	local v354 = p353 or 5
	local v355 = v_u_10:Find(p352, "Bean Speaker")
	local _, v356 = next(v355)
	if v356 then
		local v357 = v356.ItemData
		v357.Uses = v357.Uses + v354
	else
		v_u_10:CreateItem(p352, "Bean Speaker", {
			["Uses"] = v354
		})
	end
end
function v_u_125.Beanworks(p358, _, p359)
	-- upvalues: (copy) v_u_10
	local v360 = p359 or 1
	local v361 = v_u_10:Find(p358, "Beanworks")
	local _, v362 = next(v361)
	if v362 then
		local v363 = v362.ItemData
		v363.Uses = v363.Uses + v360
	else
		v_u_10:CreateItem(p358, "Beanworks", {
			["Uses"] = v360
		})
	end
end
v_u_125["Can Of Beans"] = function(p364, _, p365)
	-- upvalues: (copy) v_u_10
	local v366 = p365 or 1
	local v367 = v_u_10:Find(p364, "Can Of Beans")
	local _, v368 = next(v367)
	if v368 then
		local v369 = v368.ItemData
		v369.Uses = v369.Uses + v366
	else
		v_u_10:CreateItem(p364, "Can Of Beans", {
			["Uses"] = v366
		})
	end
end
v_u_125["Pet Lead"] = function(p370, _, p371)
	-- upvalues: (copy) v_u_10
	local v372 = p371 or 1
	local v373 = v_u_10:Find(p370, "Pet Lead")
	local _, v374 = next(v373)
	if v374 then
		local v375 = v374.ItemData
		v375.Uses = v375.Uses + v372
	else
		v_u_10:CreateItem(p370, "Pet Lead", {
			["Uses"] = v372
		})
	end
end
v_u_125["Rainbow Coil"] = function(p376, _, _)
	-- upvalues: (copy) v_u_10
	local v377 = v_u_10:Find(p376, "Rainbow Coil")
	if not next(v377) then
		v_u_10:CreateItem(p376, "Rainbow Coil", {})
	end
end
local v378 = {}
for v379, v380 in require(v_u_3.Modules.Gears.GenericGearService).GearCallbacks do
	if not v_u_125[v379] then
		if v380.GearType == "SingleUse" then
			local v_u_381 = v380.DefaultIncrease or 1
			v_u_125[v379] = function(p382, p383, p384)
				-- upvalues: (copy) v_u_381, (copy) v_u_10
				local v385 = p384 or (v_u_381 or 1)
				local v386 = v_u_10:Find(p382, p383)
				local _, v387 = next(v386)
				if v387 then
					local v388 = v387.ItemData
					v388.Uses = v388.Uses + v385
				else
					v_u_10:CreateItem(p382, p383, {
						["Uses"] = v385
					})
				end
			end
		elseif v380.GearType == "HoldUse" then
			local v_u_389 = v380.DefaultIncrease or 1
			local v_u_390 = v380.StartingPower or 100
			v_u_125[v379] = function(p391, p392, p393)
				-- upvalues: (copy) v_u_389, (ref) v_u_390, (copy) v_u_10
				local v394 = p393 or (v_u_389 or 1)
				v_u_390 = v_u_390 or 100
				local v395 = v_u_10:Find(p391, p392)
				local _, v396 = next(v395)
				if v396 then
					local v397 = v396.ItemData
					v397.Uses = v397.Uses + v394
				else
					v_u_10:CreateItem(p391, p392, {
						["Uses"] = v394,
						["PowerRemaining"] = v_u_390
					})
				end
			end
		elseif v380.GearType == "Placeable" then
			local v_u_398 = v380.DefaultIncrease or 1
			v_u_125[v379] = function(p399, p400, p401)
				-- upvalues: (copy) v_u_398, (copy) v_u_10
				local v402 = p401 or (v_u_398 or 1)
				local v403 = v_u_10:Find(p399, p400)
				local _, v404 = next(v403)
				if v404 then
					local v405 = v404.ItemData
					v405.Uses = v405.Uses + v402
				else
					v_u_10:CreateItem(p399, p400, {
						["ItemName"] = p400,
						["Uses"] = v402
					})
				end
			end
		end
	end
end
for _, v406 in v5:GetChildren() do
	local v_u_407 = v406.Name
	local v408 = v_u_407:find("Sprinkler")
	local v409 = v_u_407:find("Lightning Rod")
	local v410 = v_u_407:find("Night Staff")
	local v411 = v_u_407:find("Tranquil Staff")
	local v412 = v_u_407:find("Corrupt Staff")
	local v413 = v_u_407:find("Star Caller")
	local v414 = v_u_407:find("Nectar Staff")
	local v415 = v_u_407:find("Fairy Targeter")
	local v416 = v_u_407:find("Bonfire")
	if v408 then
		v_u_125[v_u_407] = function(p417, p_u_418, p419)
			-- upvalues: (copy) v_u_10
			local v420 = p419 or 1
			local v422 = v_u_10:Find(p417, "Sprinkler", function(p421)
				-- upvalues: (copy) p_u_418
				return p421.ItemName and p421.ItemName == p_u_418 and true or false
			end)
			local _, v423 = next(v422)
			if v423 then
				if not v423.ItemData.Uses then
					v423.ItemData.Uses = 1
				end
				local v424 = v423.ItemData
				v424.Uses = v424.Uses + v420
			else
				v_u_10:CreateItem(p417, "Sprinkler", {
					["ItemName"] = p_u_418,
					["Uses"] = v420
				})
			end
		end
	elseif v409 then
		v_u_125[v_u_407] = function(p425)
			-- upvalues: (copy) v_u_10, (copy) v_u_407
			v_u_10:CreateItem(p425, "Lightning Rod", {
				["ItemName"] = v_u_407
			})
		end
	elseif v414 then
		v_u_125[v_u_407] = function(p426, p427, p428)
			-- upvalues: (copy) v_u_10
			for _ = 1, p428 do
				v_u_10:CreateItem(p426, "Nectar Staff", {
					["ItemName"] = p427
				})
			end
		end
	elseif v410 then
		v_u_125[v_u_407] = function(p429, p430, p431)
			-- upvalues: (copy) v_u_10
			for _ = 1, p431 do
				v_u_10:CreateItem(p429, "Night Staff", {
					["ItemName"] = p430
				})
			end
		end
	elseif v411 then
		v_u_125[v_u_407] = function(p432, p433, p434)
			-- upvalues: (copy) v_u_10
			for _ = 1, p434 do
				v_u_10:CreateItem(p432, "Tranquil Staff", {
					["ItemName"] = p433
				})
			end
		end
	elseif v412 then
		v_u_125[v_u_407] = function(p435, p436, p437)
			-- upvalues: (copy) v_u_10
			for _ = 1, p437 do
				v_u_10:CreateItem(p435, "Corrupt Staff", {
					["ItemName"] = p436
				})
			end
		end
	elseif v413 then
		v_u_125[v_u_407] = function(p438, p439)
			-- upvalues: (copy) v_u_10
			v_u_10:CreateItem(p438, "Star Caller", {
				["ItemName"] = p439
			})
		end
	elseif v415 then
		v_u_125[v_u_407] = function(p440, p441, p442)
			-- upvalues: (copy) v_u_10
			for _ = 1, p442 do
				v_u_10:CreateItem(p440, "Fairy Targeter", {
					["ItemName"] = p441
				})
			end
		end
	elseif v416 then
		v_u_125[v_u_407] = function(p443, p444, p445)
			-- upvalues: (copy) v_u_10
			for _ = 1, p445 do
				v_u_10:CreateItem(p443, "Bonfire", {
					["ItemName"] = p444
				})
			end
		end
	end
end
for _, v_u_446 in v6:GetChildren() do
	v_u_125[v_u_446.Name] = function(p447, _, p448)
		-- upvalues: (copy) v_u_11, (copy) v_u_446
		v_u_11:GivePot(p447, v_u_446.Name, p448)
	end
end
for _, v_u_449 in v7:GetChildren() do
	if v_u_449.Name == "Mutation Spray" then
		for v_u_450, _ in v20 do
			v_u_125[("%* %*"):format(v_u_449.Name, v_u_450)] = function(p451, _, p452)
				-- upvalues: (copy) v_u_12, (copy) v_u_449, (copy) v_u_450
				local v453 = {
					["SprayMutationName"] = v_u_450
				}
				v_u_12:GiveSpray(p451, v_u_449.Name, p452, v453)
			end
		end
	else
		v_u_125[v_u_449.Name] = function(p454, _, p455)
			-- upvalues: (copy) v_u_12, (copy) v_u_449
			v_u_12:GiveSpray(p454, v_u_449.Name, p455)
		end
	end
end
for _, v_u_456 in v17.VariantNames do
	if v_u_456 ~= "Normal" and v_u_456 ~= "" then
		v_u_125[("%* Fertilizer"):format(v_u_456)] = function(p457, _, p458)
			-- upvalues: (copy) v_u_18, (copy) v_u_456
			v_u_18:GiveFertilizer(p457, "Variant", p458, {
				["FertilizerVariantName"] = v_u_456
			})
		end
	end
end
for _, v_u_459 in v19:GetChildren() do
	v_u_125[("Food %*"):format(v_u_459.Name)] = function(p460, _, _)
		-- upvalues: (copy) v_u_10, (copy) v_u_459
		v_u_10:CreateItem(p460, "Food", {
			["ItemName"] = v_u_459.Name
		})
	end
end
for _, v461 in v8:GetChildren() do
	local v_u_462 = v461:GetAttribute("PetBoostType")
	local v_u_463 = v461:GetAttribute("PetBoostCapacity")
	if not v_u_462 then
		error("Give_Gear [petboost] | invalid pet boost type")
	end
	if not v_u_463 then
		error("Give_Gear [petboost] | invalid capacity")
	end
	v_u_125[("%* %*"):format(v_u_463, v14.BoostTypeToPetModelName[v_u_462])] = function(p464, _, p465)
		-- upvalues: (copy) v_u_3, (copy) v_u_462, (copy) v_u_463
		require(v_u_3.Modules.PetsServices.PetBoostService):GivePetBoost(p464, v_u_462, v_u_463, p465)
	end
end
for _, v_u_466 in v9:GetChildren() do
	if v_u_466.Name == "Cleansing Pet Shard" then
		v_u_125[v_u_466.Name] = function(p467, _, p468)
			-- upvalues: (copy) v_u_16, (copy) v_u_466
			v_u_16:GiveShard(p467, v_u_466.Name, p468)
		end
	else
		for v_u_469, _ in v21 do
			v_u_125[("%* %*"):format(v_u_466.Name, v_u_469)] = function(p470, _, p471)
				-- upvalues: (copy) v_u_16, (copy) v_u_466, (copy) v_u_469
				local v472 = {
					["ShardMutationName"] = v_u_469
				}
				v_u_16:GiveShard(p470, v_u_466.Name, p471, v472)
			end
		end
	end
end
function v378.Give_Gear(p473, p474, p475)
	-- upvalues: (copy) v_u_4, (copy) v_u_125
	while not (p473.Character and p473.Character.PrimaryPart) do
		if not p473:IsDescendantOf(v_u_4) then
			return
		end
		task.wait()
	end
	local v476 = v_u_125[p474]
	if v476 then
		v476(p473, p474, p475)
	end
end
return v378