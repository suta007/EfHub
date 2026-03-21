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
local v_u_119 = {
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
	["Trading Ticket"] = function(p113, _, p114)
		-- upvalues: (copy) v_u_10
		local v115 = p114 or 1
		local v116 = v_u_10:Find(p113, "Trading Ticket")
		local _, v117 = next(v116)
		if v117 then
			local v118 = v117.ItemData
			v118.Uses = v118.Uses + v115
		else
			v_u_10:CreateItem(p113, "Trading Ticket", {
				["Uses"] = v115
			})
		end
	end
}
local v_u_120 = 1
v_u_119["Fairy Summoner"] = function(p121, p122, p123)
	-- upvalues: (copy) v_u_120, (copy) v_u_10
	local v124 = p123 or (v_u_120 or 1)
	local v125 = v_u_10:Find(p121, p122)
	local _, v126 = next(v125)
	if v126 then
		local v127 = v126.ItemData
		v127.Uses = v127.Uses + v124
	else
		v_u_10:CreateItem(p121, p122, {
			["Uses"] = v124
		})
	end
end
local v_u_128 = 1
v_u_119["Fairy Power Extender"] = function(p129, p130, p131)
	-- upvalues: (copy) v_u_128, (copy) v_u_10
	local v132 = p131 or (v_u_128 or 1)
	local v133 = v_u_10:Find(p129, p130)
	local _, v134 = next(v133)
	if v134 then
		local v135 = v134.ItemData
		v135.Uses = v135.Uses + v132
	else
		v_u_10:CreateItem(p129, p130, {
			["Uses"] = v132
		})
	end
end
local v_u_136 = 1
v_u_119["Fairy Caller"] = function(p137, p138, p139)
	-- upvalues: (copy) v_u_136, (copy) v_u_10
	local v140 = p139 or (v_u_136 or 1)
	local v141 = v_u_10:Find(p137, p138)
	local _, v142 = next(v141)
	if v142 then
		local v143 = v142.ItemData
		v143.Uses = v143.Uses + v140
	else
		v_u_10:CreateItem(p137, p138, {
			["Uses"] = v140
		})
	end
end
local v_u_144 = 1
v_u_119["Luminous Wand"] = function(p145, p146, p147)
	-- upvalues: (copy) v_u_144, (copy) v_u_10
	local v148 = p147 or (v_u_144 or 1)
	local v149 = v_u_10:Find(p145, p146)
	local _, v150 = next(v149)
	if v150 then
		local v151 = v150.ItemData
		v151.Uses = v151.Uses + v148
	else
		v_u_10:CreateItem(p145, p146, {
			["Uses"] = v148
		})
	end
end
local v_u_152 = 1
v_u_119["Fairy Net"] = function(p153, p154, p155)
	-- upvalues: (copy) v_u_152, (copy) v_u_10
	local v156 = p155 or (v_u_152 or 1)
	local v157 = v_u_10:Find(p153, p154)
	local _, v158 = next(v157)
	if v158 then
		local v159 = v158.ItemData
		v159.Uses = v159.Uses + v156
	else
		v_u_10:CreateItem(p153, p154, {
			["Uses"] = v156
		})
	end
end
local v_u_160 = 1
v_u_119["Fairy Jar"] = function(p161, p162, p163)
	-- upvalues: (copy) v_u_160, (copy) v_u_10
	local v164 = p163 or (v_u_160 or 1)
	local v165 = v_u_10:Find(p161, p162)
	local _, v166 = next(v165)
	if v166 then
		local v167 = v166.ItemData
		v167.Uses = v167.Uses + v164
	else
		v_u_10:CreateItem(p161, p162, {
			["Uses"] = v164
		})
	end
end
local v_u_168 = 1
v_u_119["Pet Name Reroller"] = function(p169, p170, p171)
	-- upvalues: (copy) v_u_168, (copy) v_u_10
	local v172 = p171 or (v_u_168 or 1)
	local v173 = v_u_10:Find(p169, p170)
	local _, v174 = next(v173)
	if v174 then
		local v175 = v174.ItemData
		v175.Uses = v175.Uses + v172
	else
		v_u_10:CreateItem(p169, p170, {
			["Uses"] = v172
		})
	end
end
local v_u_176 = 1
v_u_119["Grow All"] = function(p177, p178, p179)
	-- upvalues: (copy) v_u_176, (copy) v_u_10
	local v180 = p179 or (v_u_176 or 1)
	local v181 = v_u_10:Find(p177, p178)
	local _, v182 = next(v181)
	if v182 then
		local v183 = v182.ItemData
		v183.Uses = v183.Uses + v180
	else
		v_u_10:CreateItem(p177, p178, {
			["Uses"] = v180
		})
	end
end
local v_u_184 = 1
function v_u_119.Steal(p185, p186, p187)
	-- upvalues: (copy) v_u_184, (copy) v_u_10
	local v188 = p187 or (v_u_184 or 1)
	local v189 = v_u_10:Find(p185, p186)
	local _, v190 = next(v189)
	if v190 then
		local v191 = v190.ItemData
		v191.Uses = v191.Uses + v188
	else
		v_u_10:CreateItem(p185, p186, {
			["Uses"] = v188
		})
	end
end
local v_u_192 = 1
v_u_119["Firefly Jar"] = function(p193, p194, p195)
	-- upvalues: (copy) v_u_192, (copy) v_u_10
	local v196 = p195 or (v_u_192 or 1)
	local v197 = v_u_10:Find(p193, p194)
	local _, v198 = next(v197)
	if v198 then
		local v199 = v198.ItemData
		v199.Uses = v199.Uses + v196
	else
		v_u_10:CreateItem(p193, p194, {
			["Uses"] = v196
		})
	end
end
local v_u_200 = 1
v_u_119["Sky Lantern"] = function(p201, p202, p203)
	-- upvalues: (copy) v_u_200, (copy) v_u_10
	local v204 = p203 or (v_u_200 or 1)
	local v205 = v_u_10:Find(p201, p202)
	local _, v206 = next(v205)
	if v206 then
		local v207 = v206.ItemData
		v207.Uses = v207.Uses + v204
	else
		v_u_10:CreateItem(p201, p202, {
			["Uses"] = v204
		})
	end
end
local v_u_208 = 1
v_u_119["Maple Leaf Kite"] = function(p209, p210, p211)
	-- upvalues: (copy) v_u_208, (copy) v_u_10
	local v212 = p211 or (v_u_208 or 1)
	local v213 = v_u_10:Find(p209, p210)
	local _, v214 = next(v213)
	if v214 then
		local v215 = v214.ItemData
		v215.Uses = v215.Uses + v212
	else
		v_u_10:CreateItem(p209, p210, {
			["Uses"] = v212
		})
	end
end
local v_u_216 = 1
v_u_119["Maple Syrup"] = function(p217, p218, p219)
	-- upvalues: (copy) v_u_216, (copy) v_u_10
	local v220 = p219 or (v_u_216 or 1)
	local v221 = v_u_10:Find(p217, p218)
	local _, v222 = next(v221)
	if v222 then
		local v223 = v222.ItemData
		v223.Uses = v223.Uses + v220
	else
		v_u_10:CreateItem(p217, p218, {
			["Uses"] = v220
		})
	end
end
local v_u_224 = 1
v_u_119["Maple Leaf Charm"] = function(p225, p226, p227)
	-- upvalues: (copy) v_u_224, (copy) v_u_10
	local v228 = p227 or (v_u_224 or 1)
	local v229 = v_u_10:Find(p225, p226)
	local _, v230 = next(v229)
	if v230 then
		local v231 = v230.ItemData
		v231.Uses = v231.Uses + v228
	else
		v_u_10:CreateItem(p225, p226, {
			["Uses"] = v228
		})
	end
end
local v_u_232 = 1
v_u_119["Maple Sprinkler"] = function(p233, p234, p235)
	-- upvalues: (copy) v_u_232, (copy) v_u_10
	local v236 = p235 or (v_u_232 or 1)
	local v237 = v_u_10:Find(p233, p234)
	local _, v238 = next(v237)
	if v238 then
		local v239 = v238.ItemData
		v239.Uses = v239.Uses + v236
	else
		v_u_10:CreateItem(p233, p234, {
			["Uses"] = v236
		})
	end
end
local v_u_240 = 1
function v_u_119.Bonfire(p241, p242, p243)
	-- upvalues: (copy) v_u_240, (copy) v_u_10
	local v244 = p243 or (v_u_240 or 1)
	local v245 = v_u_10:Find(p241, p242)
	local _, v246 = next(v245)
	if v246 then
		local v247 = v246.ItemData
		v247.Uses = v247.Uses + v244
	else
		v_u_10:CreateItem(p241, p242, {
			["Uses"] = v244
		})
	end
end
local v_u_248 = 1
v_u_119["Harvest Basket"] = function(p249, p250, p251)
	-- upvalues: (copy) v_u_248, (copy) v_u_10
	local v252 = p251 or (v_u_248 or 1)
	local v253 = v_u_10:Find(p249, p250)
	local _, v254 = next(v253)
	if v254 then
		local v255 = v254.ItemData
		v255.Uses = v255.Uses + v252
	else
		v_u_10:CreateItem(p249, p250, {
			["Uses"] = v252
		})
	end
end
local v_u_256 = 1
v_u_119["Golden Acorn"] = function(p257, p258, p259)
	-- upvalues: (copy) v_u_256, (copy) v_u_10
	local v260 = p259 or (v_u_256 or 1)
	local v261 = v_u_10:Find(p257, p258)
	local _, v262 = next(v261)
	if v262 then
		local v263 = v262.ItemData
		v263.Uses = v263.Uses + v260
	else
		v_u_10:CreateItem(p257, p258, {
			["Uses"] = v260
		})
	end
end
local v_u_264 = 1
function v_u_119.Rake(p265, p266, p267)
	-- upvalues: (copy) v_u_264, (copy) v_u_10
	local v268 = p267 or (v_u_264 or 1)
	local v269 = v_u_10:Find(p265, p266)
	local _, v270 = next(v269)
	if v270 then
		local v271 = v270.ItemData
		v271.Uses = v271.Uses + v268
	else
		v_u_10:CreateItem(p265, p266, {
			["Uses"] = v268
		})
	end
end
local v_u_272 = 1
v_u_119["Acorn Bell"] = function(p273, p274, p275)
	-- upvalues: (copy) v_u_272, (copy) v_u_10
	local v276 = p275 or (v_u_272 or 1)
	local v277 = v_u_10:Find(p273, p274)
	local _, v278 = next(v277)
	if v278 then
		local v279 = v278.ItemData
		v279.Uses = v279.Uses + v276
	else
		v_u_10:CreateItem(p273, p274, {
			["Uses"] = v276
		})
	end
end
local v_u_280 = 1
v_u_119["Super Watering Can"] = function(p281, p282, p283)
	-- upvalues: (copy) v_u_280, (copy) v_u_10
	local v284 = p283 or (v_u_280 or 1)
	local v285 = v_u_10:Find(p281, p282)
	local _, v286 = next(v285)
	if v286 then
		local v287 = v286.ItemData
		v287.Uses = v287.Uses + v284
	else
		v_u_10:CreateItem(p281, p282, {
			["Uses"] = v284
		})
	end
end
local v_u_288 = 1
function v_u_119.Frightwork(p289, p290, p291)
	-- upvalues: (copy) v_u_288, (copy) v_u_10
	local v292 = p291 or (v_u_288 or 1)
	local v293 = v_u_10:Find(p289, p290)
	local _, v294 = next(v293)
	if v294 then
		local v295 = v294.ItemData
		v295.Uses = v295.Uses + v292
	else
		v_u_10:CreateItem(p289, p290, {
			["Uses"] = v292
		})
	end
end
local v_u_296 = 1
v_u_119["Christmas Firework"] = function(p297, p298, p299)
	-- upvalues: (copy) v_u_296, (copy) v_u_10
	local v300 = p299 or (v_u_296 or 1)
	local v301 = v_u_10:Find(p297, p298)
	local _, v302 = next(v301)
	if v302 then
		local v303 = v302.ItemData
		v303.Uses = v303.Uses + v300
	else
		v_u_10:CreateItem(p297, p298, {
			["Uses"] = v300
		})
	end
end
local v_u_304 = 1
v_u_119["New Year\'s Firework"] = function(p305, p306, p307)
	-- upvalues: (copy) v_u_304, (copy) v_u_10
	local v308 = p307 or (v_u_304 or 1)
	local v309 = v_u_10:Find(p305, p306)
	local _, v310 = next(v309)
	if v310 then
		local v311 = v310.ItemData
		v311.Uses = v311.Uses + v308
	else
		v_u_10:CreateItem(p305, p306, {
			["Uses"] = v308
		})
	end
end
v_u_119["Leaf Blower"] = function(p312, _, p313)
	-- upvalues: (copy) v_u_10
	local v314 = p313 or 1
	local v315 = v_u_10:Find(p312, "Leaf Blower")
	local _, v316 = next(v315)
	if v316 then
		local v317 = v316.ItemData
		v317.Uses = v317.Uses + v314
	else
		v_u_10:CreateItem(p312, "Leaf Blower", {
			["Uses"] = v314,
			["PowerRemaining"] = 100
		})
	end
end
v_u_119["Super Leaf Blower"] = function(p318, _, p319)
	-- upvalues: (copy) v_u_10
	local v320 = p319 or 1
	local v321 = v_u_10:Find(p318, "Super Leaf Blower")
	local _, v322 = next(v321)
	if v322 then
		local v323 = v322.ItemData
		v323.Uses = v323.Uses + v320
	else
		v_u_10:CreateItem(p318, "Super Leaf Blower", {
			["Uses"] = v320,
			["PowerRemaining"] = 125
		})
	end
end
v_u_119["Sheckles Gun"] = function(p324, _, p325)
	-- upvalues: (copy) v_u_10
	local v326 = p325 or 1
	local v327 = v_u_10:Find(p324, "Sheckles Gun")
	local _, v328 = next(v327)
	if v328 then
		local v329 = v328.ItemData
		v329.Uses = v329.Uses + v326
	else
		v_u_10:CreateItem(p324, "Sheckles Gun", {
			["Uses"] = v326,
			["PowerRemaining"] = 100
		})
	end
end
v_u_119["Garden Guide"] = function(p330, _, _)
	-- upvalues: (copy) v_u_10
	local v331 = v_u_10:Find(p330, "Firework")
	local _, _ = next(v331)
	v_u_10:CreateItem(p330, "Garden Guide", {})
end
v_u_119["Bean Speaker"] = function(p332, _, p333)
	-- upvalues: (copy) v_u_10
	local v334 = p333 or 5
	local v335 = v_u_10:Find(p332, "Bean Speaker")
	local _, v336 = next(v335)
	if v336 then
		local v337 = v336.ItemData
		v337.Uses = v337.Uses + v334
	else
		v_u_10:CreateItem(p332, "Bean Speaker", {
			["Uses"] = v334
		})
	end
end
function v_u_119.Beanworks(p338, _, p339)
	-- upvalues: (copy) v_u_10
	local v340 = p339 or 1
	local v341 = v_u_10:Find(p338, "Beanworks")
	local _, v342 = next(v341)
	if v342 then
		local v343 = v342.ItemData
		v343.Uses = v343.Uses + v340
	else
		v_u_10:CreateItem(p338, "Beanworks", {
			["Uses"] = v340
		})
	end
end
v_u_119["Can Of Beans"] = function(p344, _, p345)
	-- upvalues: (copy) v_u_10
	local v346 = p345 or 1
	local v347 = v_u_10:Find(p344, "Can Of Beans")
	local _, v348 = next(v347)
	if v348 then
		local v349 = v348.ItemData
		v349.Uses = v349.Uses + v346
	else
		v_u_10:CreateItem(p344, "Can Of Beans", {
			["Uses"] = v346
		})
	end
end
v_u_119["Pet Lead"] = function(p350, _, p351)
	-- upvalues: (copy) v_u_10
	local v352 = p351 or 1
	local v353 = v_u_10:Find(p350, "Pet Lead")
	local _, v354 = next(v353)
	if v354 then
		local v355 = v354.ItemData
		v355.Uses = v355.Uses + v352
	else
		v_u_10:CreateItem(p350, "Pet Lead", {
			["Uses"] = v352
		})
	end
end
local v356 = {}
for v357, v358 in require(v_u_3.Modules.Gears.GenericGearService).GearCallbacks do
	if not v_u_119[v357] then
		if v358.GearType == "SingleUse" then
			local v_u_359 = v358.DefaultIncrease or 1
			v_u_119[v357] = function(p360, p361, p362)
				-- upvalues: (copy) v_u_359, (copy) v_u_10
				local v363 = p362 or (v_u_359 or 1)
				local v364 = v_u_10:Find(p360, p361)
				local _, v365 = next(v364)
				if v365 then
					local v366 = v365.ItemData
					v366.Uses = v366.Uses + v363
				else
					v_u_10:CreateItem(p360, p361, {
						["Uses"] = v363
					})
				end
			end
		elseif v358.GearType == "HoldUse" then
			local v_u_367 = v358.DefaultIncrease or 1
			local v_u_368 = v358.StartingPower or 100
			v_u_119[v357] = function(p369, p370, p371)
				-- upvalues: (copy) v_u_367, (ref) v_u_368, (copy) v_u_10
				local v372 = p371 or (v_u_367 or 1)
				v_u_368 = v_u_368 or 100
				local v373 = v_u_10:Find(p369, p370)
				local _, v374 = next(v373)
				if v374 then
					local v375 = v374.ItemData
					v375.Uses = v375.Uses + v372
				else
					v_u_10:CreateItem(p369, p370, {
						["Uses"] = v372,
						["PowerRemaining"] = v_u_368
					})
				end
			end
		elseif v358.GearType == "Placeable" then
			local v_u_376 = v358.DefaultIncrease or 1
			v_u_119[v357] = function(p377, p378, p379)
				-- upvalues: (copy) v_u_376, (copy) v_u_10
				local v380 = p379 or (v_u_376 or 1)
				local v381 = v_u_10:Find(p377, p378)
				local _, v382 = next(v381)
				if v382 then
					local v383 = v382.ItemData
					v383.Uses = v383.Uses + v380
				else
					v_u_10:CreateItem(p377, p378, {
						["ItemName"] = p378,
						["Uses"] = v380
					})
				end
			end
		end
	end
end
for _, v384 in v5:GetChildren() do
	local v_u_385 = v384.Name
	local v386 = v_u_385:find("Sprinkler")
	local v387 = v_u_385:find("Lightning Rod")
	local v388 = v_u_385:find("Night Staff")
	local v389 = v_u_385:find("Tranquil Staff")
	local v390 = v_u_385:find("Corrupt Staff")
	local v391 = v_u_385:find("Star Caller")
	local v392 = v_u_385:find("Nectar Staff")
	local v393 = v_u_385:find("Fairy Targeter")
	local v394 = v_u_385:find("Bonfire")
	if v386 then
		v_u_119[v_u_385] = function(p395, p_u_396, p397)
			-- upvalues: (copy) v_u_10
			local v398 = p397 or 1
			local v400 = v_u_10:Find(p395, "Sprinkler", function(p399)
				-- upvalues: (copy) p_u_396
				return p399.ItemName and p399.ItemName == p_u_396 and true or false
			end)
			local _, v401 = next(v400)
			if v401 then
				if not v401.ItemData.Uses then
					v401.ItemData.Uses = 1
				end
				local v402 = v401.ItemData
				v402.Uses = v402.Uses + v398
			else
				v_u_10:CreateItem(p395, "Sprinkler", {
					["ItemName"] = p_u_396,
					["Uses"] = v398
				})
			end
		end
	elseif v387 then
		v_u_119[v_u_385] = function(p403)
			-- upvalues: (copy) v_u_10, (copy) v_u_385
			v_u_10:CreateItem(p403, "Lightning Rod", {
				["ItemName"] = v_u_385
			})
		end
	elseif v392 then
		v_u_119[v_u_385] = function(p404, p405, p406)
			-- upvalues: (copy) v_u_10
			for _ = 1, p406 do
				v_u_10:CreateItem(p404, "Nectar Staff", {
					["ItemName"] = p405
				})
			end
		end
	elseif v388 then
		v_u_119[v_u_385] = function(p407, p408, p409)
			-- upvalues: (copy) v_u_10
			for _ = 1, p409 do
				v_u_10:CreateItem(p407, "Night Staff", {
					["ItemName"] = p408
				})
			end
		end
	elseif v389 then
		v_u_119[v_u_385] = function(p410, p411, p412)
			-- upvalues: (copy) v_u_10
			for _ = 1, p412 do
				v_u_10:CreateItem(p410, "Tranquil Staff", {
					["ItemName"] = p411
				})
			end
		end
	elseif v390 then
		v_u_119[v_u_385] = function(p413, p414, p415)
			-- upvalues: (copy) v_u_10
			for _ = 1, p415 do
				v_u_10:CreateItem(p413, "Corrupt Staff", {
					["ItemName"] = p414
				})
			end
		end
	elseif v391 then
		v_u_119[v_u_385] = function(p416, p417)
			-- upvalues: (copy) v_u_10
			v_u_10:CreateItem(p416, "Star Caller", {
				["ItemName"] = p417
			})
		end
	elseif v393 then
		v_u_119[v_u_385] = function(p418, p419, p420)
			-- upvalues: (copy) v_u_10
			for _ = 1, p420 do
				v_u_10:CreateItem(p418, "Fairy Targeter", {
					["ItemName"] = p419
				})
			end
		end
	elseif v394 then
		v_u_119[v_u_385] = function(p421, p422, p423)
			-- upvalues: (copy) v_u_10
			for _ = 1, p423 do
				v_u_10:CreateItem(p421, "Bonfire", {
					["ItemName"] = p422
				})
			end
		end
	end
end
for _, v_u_424 in v6:GetChildren() do
	v_u_119[v_u_424.Name] = function(p425, _, p426)
		-- upvalues: (copy) v_u_11, (copy) v_u_424
		v_u_11:GivePot(p425, v_u_424.Name, p426)
	end
end
for _, v_u_427 in v7:GetChildren() do
	if v_u_427.Name == "Mutation Spray" then
		for v_u_428, _ in v20 do
			v_u_119[("%* %*"):format(v_u_427.Name, v_u_428)] = function(p429, _, p430)
				-- upvalues: (copy) v_u_12, (copy) v_u_427, (copy) v_u_428
				local v431 = {
					["SprayMutationName"] = v_u_428
				}
				v_u_12:GiveSpray(p429, v_u_427.Name, p430, v431)
			end
		end
	else
		v_u_119[v_u_427.Name] = function(p432, _, p433)
			-- upvalues: (copy) v_u_12, (copy) v_u_427
			v_u_12:GiveSpray(p432, v_u_427.Name, p433)
		end
	end
end
for _, v_u_434 in v17.VariantNames do
	if v_u_434 ~= "Normal" and v_u_434 ~= "" then
		v_u_119[("%* Fertilizer"):format(v_u_434)] = function(p435, _, p436)
			-- upvalues: (copy) v_u_18, (copy) v_u_434
			v_u_18:GiveFertilizer(p435, "Variant", p436, {
				["FertilizerVariantName"] = v_u_434
			})
		end
	end
end
for _, v_u_437 in v19:GetChildren() do
	v_u_119[("Food %*"):format(v_u_437.Name)] = function(p438, _, _)
		-- upvalues: (copy) v_u_10, (copy) v_u_437
		v_u_10:CreateItem(p438, "Food", {
			["ItemName"] = v_u_437.Name
		})
	end
end
for _, v439 in v8:GetChildren() do
	local v_u_440 = v439:GetAttribute("PetBoostType")
	local v_u_441 = v439:GetAttribute("PetBoostCapacity")
	if not v_u_440 then
		error("Give_Gear [petboost] | invalid pet boost type")
	end
	if not v_u_441 then
		error("Give_Gear [petboost] | invalid capacity")
	end
	v_u_119[("%* %*"):format(v_u_441, v14.BoostTypeToPetModelName[v_u_440])] = function(p442, _, p443)
		-- upvalues: (copy) v_u_3, (copy) v_u_440, (copy) v_u_441
		require(v_u_3.Modules.PetsServices.PetBoostService):GivePetBoost(p442, v_u_440, v_u_441, p443)
	end
end
for _, v_u_444 in v9:GetChildren() do
	if v_u_444.Name == "Cleansing Pet Shard" then
		v_u_119[v_u_444.Name] = function(p445, _, p446)
			-- upvalues: (copy) v_u_16, (copy) v_u_444
			v_u_16:GiveShard(p445, v_u_444.Name, p446)
		end
	else
		for v_u_447, _ in v21 do
			v_u_119[("%* %*"):format(v_u_444.Name, v_u_447)] = function(p448, _, p449)
				-- upvalues: (copy) v_u_16, (copy) v_u_444, (copy) v_u_447
				local v450 = {
					["ShardMutationName"] = v_u_447
				}
				v_u_16:GiveShard(p448, v_u_444.Name, p449, v450)
			end
		end
	end
end
function v356.Give_Gear(p451, p452, p453)
	-- upvalues: (copy) v_u_4, (copy) v_u_119
	while not (p451.Character and p451.Character.PrimaryPart) do
		if not p451:IsDescendantOf(v_u_4) then
			return
		end
		task.wait()
	end
	local v454 = v_u_119[p452]
	if v454 then
		v454(p451, p452, p453)
	end
end
return v356