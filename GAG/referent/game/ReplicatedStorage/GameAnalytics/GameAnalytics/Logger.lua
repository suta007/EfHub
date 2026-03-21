return {
	["_infoLogEnabled"] = false,
	["_infoLogAdvancedEnabled"] = false,
	["_debugEnabled"] = game:GetService("RunService"):IsStudio(),
	["setDebugLog"] = function(p1, p2)
		p1._debugEnabled = p2
	end,
	["setInfoLog"] = function(p3, p4)
		p3._infoLogEnabled = p4
	end,
	["setVerboseLog"] = function(p5, p6)
		p5._infoLogAdvancedEnabled = p6
	end,
	["i"] = function(p7, p8)
		if p7._infoLogEnabled then
			local v9 = "Info/GameAnalytics: " .. p8
			print(v9)
		end
	end,
	["w"] = function(_, p10)
		local v11 = "Warning/GameAnalytics: " .. p10
		warn(v11)
	end,
	["e"] = function(_, p_u_12)
		task.spawn(function()
			-- upvalues: (copy) p_u_12
			local v13 = "Error/GameAnalytics: " .. p_u_12
			error(v13, 0)
		end)
	end,
	["d"] = function(p14, p15)
		if p14._debugEnabled then
			local v16 = "Debug/GameAnalytics: " .. p15
			print(v16)
		end
	end,
	["ii"] = function(p17, p18)
		if p17._infoLogAdvancedEnabled then
			local v19 = "Verbose/GameAnalytics: " .. p18
			print(v19)
		end
	end
}