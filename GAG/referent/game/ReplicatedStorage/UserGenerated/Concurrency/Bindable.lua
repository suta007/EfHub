local function v_u_2(p1)
	warn((("%*\nStack Begin\n%*Stack End"):format(tostring(p1), (debug.traceback(nil, 3)))))
end
local function v_u_4(p3, ...)
	-- upvalues: (copy) v_u_2
	return xpcall(p3, v_u_2, ...)
end
local function v_u_12(p5, p6)
	local v7 = #p5
	local v8 = 1
	local v9 = false
	while v8 <= v7 do
		local v10 = v8 + (v7 - v8) // 2
		local v11 = p5[v10].Pr - p6.Pr
		if v11 > 0 then
			v7 = v10 - 1
		elseif v11 < 0 then
			v8 = v10 + 1
		else
			v8 = v10 + 1
			v9 = true
		end
	end
	return v9 and v8 and v8 or -v8
end
local function v_u_20(p13, p14)
	local v15 = #p13
	local v16 = 1
	local v17 = false
	while v16 <= v15 do
		local v18 = v16 + (v15 - v16) // 2
		local v19 = p13[v18].Pr - p14.Pr
		if v19 > 0 then
			v15 = v18 - 1
		elseif v19 < 0 then
			v16 = v18 + 1
		else
			v15 = v18 - 1
			v17 = true
		end
	end
	return v17 and v16 and v16 or -v16
end
local function v_u_25(p21, p22)
	-- upvalues: (copy) v_u_20
	local v23 = v_u_20(p21, p22)
	if v23 > 0 then
		for v24 = v23, #p21 do
			if p21[v24] == p22 then
				table.remove(p21, v24)
				return true
			end
		end
	end
	return false
end
local function v_u_29(p26)
	-- upvalues: (copy) v_u_25
	local v27 = p26.Ow
	if v27 ~= nil then
		p26.Ow = nil
		if not v_u_25(v27.Cs, p26) then
			warn("BindableConnectionDisconnect")
		end
		for _, v28 in ipairs(p26.Wt) do
			task.spawn(v28)
		end
		table.clear(p26.Wt)
	end
end
local v32 = {
	["__index"] = table.freeze({
		["IsConnected"] = function(p30)
			return p30.Ow ~= nil
		end,
		["Disconnect"] = v_u_29,
		["GetPriority"] = function(p31)
			return p31.Pr
		end
	})
}
local v_u_33 = table.freeze(v32)
local v93 = {
	["__index"] = table.freeze({
		["Fire"] = function(p34, ...)
			local v35 = p34.Cs
			local v36 = 1
			while v36 <= #v35 do
				local v37 = v35[v36]
				task.spawn(v37.Cb, ...)
				if v35[v36] == v37 then
					v36 = v36 + 1
				end
			end
		end,
		["FireAndWait"] = function(p38, ...)
			-- upvalues: (copy) v_u_4
			local v39 = p38.Cs
			if #v39 ~= 0 then
				local v_u_40 = 1
				local v_u_41 = coroutine.running()
				local function v43(p42, ...)
					-- upvalues: (ref) v_u_4, (ref) v_u_40, (copy) v_u_41
					v_u_4(p42, ...)
					v_u_40 = v_u_40 - 1
					if v_u_40 == 0 then
						task.spawn(v_u_41)
					end
				end
				local v44 = v_u_40
				local v45 = 1
				while v45 <= #v39 do
					local v46 = v39[v45]
					v_u_40 = v44 + 1
					task.spawn(v43, v46.Cb, ...)
					if v39[v45] == v46 then
						v45 = v45 + 1
					end
					v44 = v_u_40
				end
				v_u_40 = v44 - 1
				if v_u_40 > 0 then
					coroutine.yield()
				end
			end
		end,
		["FireSync"] = function(p47, ...)
			-- upvalues: (copy) v_u_4
			local v48 = p47.Cs
			local v49 = 1
			while v49 <= #v48 do
				local v50 = v48[v49]
				v_u_4(v50.Cb, ...)
				if v48[v49] == v50 then
					v49 = v49 + 1
				end
			end
		end,
		["Invoke"] = function(p51, ...)
			local v52 = p51.Cs
			if #v52 >= 1 then
				return v52[1].Cb(...)
			end
			error("Invoke")
		end,
		["Connect"] = function(p53, p54, p55)
			-- upvalues: (copy) v_u_33, (copy) v_u_12
			local v56
			if p55 == nil then
				v56 = true
			elseif type(p55) == "number" then
				v56 = p55 == p55
			else
				v56 = false
			end
			assert(v56)
			local v57 = p55 or (1 / 0)
			local v58 = v_u_33
			local v59 = setmetatable({
				["Ow"] = p53,
				["Cb"] = p54,
				["Pr"] = v57,
				["Wt"] = {}
			}, v58)
			if v57 == (1 / 0) then
				local v60 = p53.Cs
				table.insert(v60, v59)
				return v59
			end
			local v61 = p53.Cs
			local v62 = v_u_12(v61, v59)
			local v63 = math.abs(v62)
			table.insert(v61, v63, v59)
			return v59
		end,
		["Wait"] = function(p64)
			-- upvalues: (copy) v_u_29, (copy) v_u_33
			local v_u_65 = coroutine.running()
			local v_u_66 = true
			local v_u_67 = nil
			local function v69(...)
				-- upvalues: (ref) v_u_67, (copy) v_u_65, (ref) v_u_66, (ref) v_u_29
				local v68 = table.find(v_u_67.Wt, v_u_65)
				if v68 then
					table.remove(v_u_67.Wt, v68)
				end
				v_u_66 = false
				v_u_29(v_u_67)
				task.spawn(v_u_65, ...)
			end
			assert(true)
			local v70 = v_u_33
			local v71 = setmetatable({
				["Ow"] = p64,
				["Cb"] = v69,
				["Pr"] = (1 / 0),
				["Wt"] = {}
			}, v70)
			local v72 = p64.Cs
			table.insert(v72, v71)
			v_u_67 = v71
			local v73 = v_u_67.Wt
			table.insert(v73, v_u_65)
			local v74 = table.pack(coroutine.yield())
			if v_u_66 then
				error("Disconnected")
			end
			return table.unpack(v74)
		end,
		["Once"] = function(p75, p_u_76, p77)
			-- upvalues: (copy) v_u_29, (copy) v_u_33, (copy) v_u_12
			local v_u_78 = nil
			local function v79(...)
				-- upvalues: (ref) v_u_29, (ref) v_u_78, (copy) p_u_76
				v_u_29(v_u_78)
				return p_u_76(...)
			end
			local v80
			if p77 == nil then
				v80 = true
			elseif type(p77) == "number" then
				v80 = p77 == p77
			else
				v80 = false
			end
			assert(v80)
			local v81 = p77 or (1 / 0)
			local v82 = v_u_33
			local v83 = setmetatable({
				["Ow"] = p75,
				["Cb"] = v79,
				["Pr"] = v81,
				["Wt"] = {}
			}, v82)
			if v81 == (1 / 0) then
				local v84 = p75.Cs
				table.insert(v84, v83)
			else
				local v85 = p75.Cs
				local v86 = v_u_12(v85, v83)
				local v87 = math.abs(v86)
				table.insert(v85, v87, v83)
			end
			v_u_78 = v83
			return v_u_78
		end,
		["DisconnectAll"] = function(p88)
			-- upvalues: (copy) v_u_29
			local v89 = p88.Cs
			for v90 = #v89, 1, -1 do
				v_u_29(v89[v90])
			end
		end,
		["GetSize"] = function(p91)
			return #p91.Cs
		end,
		["IsEmpty"] = function(p92)
			return #p92.Cs == 0
		end
	})
}
local v_u_94 = table.freeze(v93)
return table.freeze({
	["new"] = function(_)
		-- upvalues: (copy) v_u_94
		local v95 = v_u_94
		return table.freeze((setmetatable({
			["Cs"] = {}
		}, v95)))
	end,
	["IsA"] = function(p96)
		-- upvalues: (copy) v_u_94
		local v97
		if type(p96) == "table" then
			v97 = getmetatable(p96) == v_u_94
		else
			v97 = false
		end
		return v97
	end,
	["Assert"] = function(p98)
		-- upvalues: (copy) v_u_94
		local v99
		if type(p98) == "table" then
			v99 = getmetatable(p98) == v_u_94
		else
			v99 = false
		end
		if not v99 then
			error("Bindable", 2)
		end
		return p98
	end,
	["IsAConnection"] = function(p100)
		-- upvalues: (copy) v_u_33
		local v101
		if type(p100) == "table" then
			v101 = getmetatable(p100) == v_u_33
		else
			v101 = false
		end
		return v101
	end,
	["AssertConnection"] = function(p102)
		-- upvalues: (copy) v_u_33
		local v103
		if type(p102) == "table" then
			v103 = getmetatable(p102) == v_u_33
		else
			v103 = false
		end
		if not v103 then
			error("Connection", 2)
		end
		return p102
	end
})