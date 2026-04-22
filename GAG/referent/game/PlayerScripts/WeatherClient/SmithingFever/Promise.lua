local v_u_1 = {
	["__mode"] = "k"
}
local function v7(p_u_2, p3)
	local v4 = {}
	for _, v5 in ipairs(p3) do
		v4[v5] = v5
	end
	return setmetatable(v4, {
		["__index"] = function(_, p6)
			-- upvalues: (copy) p_u_2
			error(string.format("%s is not in %s!", p6, p_u_2), 2)
		end,
		["__newindex"] = function()
			-- upvalues: (copy) p_u_2
			error(string.format("Creating new members in %s is not allowed!", p_u_2), 2)
		end
	})
end
local v_u_8 = {
	["Kind"] = v7("Promise.Error.Kind", {
		"ExecutionError",
		"AlreadyCancelled",
		"NotResolvedInTime",
		"TimedOut"
	})
}
v_u_8.__index = v_u_8
function v_u_8.new(p9, p10)
	-- upvalues: (ref) v_u_8
	local v11 = p9 or {}
	local v12 = {}
	local v13 = v11.error
	v12.error = tostring(v13) or "[This error has no error text.]"
	v12.trace = v11.trace
	v12.context = v11.context
	v12.kind = v11.kind
	v12.parent = p10
	v12.createdTick = os.clock()
	v12.createdTrace = debug.traceback()
	local v14 = v_u_8
	return setmetatable(v12, v14)
end
function v_u_8.is(p15)
	if type(p15) == "table" then
		local v16 = getmetatable(p15)
		if type(v16) == "table" then
			local v17
			if rawget(p15, "error") == nil then
				v17 = false
			else
				local v18 = rawget(v16, "extend")
				v17 = type(v18) == "function"
			end
			return v17
		end
	end
	return false
end
function v_u_8.isKind(p19, p20)
	-- upvalues: (ref) v_u_8
	local v21 = p20 ~= nil
	assert(v21, "Argument #2 to Promise.Error.isKind must not be nil")
	local v22 = v_u_8.is(p19)
	if v22 then
		v22 = p19.kind == p20
	end
	return v22
end
function v_u_8.extend(p23, p24)
	-- upvalues: (ref) v_u_8
	local v25 = p24 or {}
	v25.kind = v25.kind or p23.kind
	return v_u_8.new(v25, p23)
end
function v_u_8.getErrorChain(p26)
	local v27 = { p26 }
	while v27[#v27].parent do
		local v28 = v27[#v27].parent
		table.insert(v27, v28)
	end
	return v27
end
function v_u_8.__tostring(p29)
	local v30 = { string.format("-- Promise.Error(%s) --", p29.kind or "?") }
	for _, v31 in ipairs(p29:getErrorChain()) do
		local v32 = table.concat
		local v33 = { v31.trace or v31.error, v31.context }
		table.insert(v30, v32(v33, "\n"))
	end
	return table.concat(v30, "\n")
end
local function v_u_34(...)
	return select("#", ...), { ... }
end
local function v_u_36(p35, ...)
	return p35, select("#", ...), { ... }
end
local function v_u_43(p_u_37, p38, ...)
	-- upvalues: (copy) v_u_36, (ref) v_u_8
	local v39 = v_u_36
	local v40 = xpcall
	local v41 = p_u_37 ~= nil
	assert(v41, "traceback is nil")
	return v39(v40(p38, function(p42)
		-- upvalues: (ref) v_u_8, (copy) p_u_37
		if type(p42) == "table" then
			return p42
		else
			return v_u_8.new({
				["error"] = p42,
				["kind"] = v_u_8.Kind.ExecutionError,
				["trace"] = debug.traceback(tostring(p42), 2),
				["context"] = "Promise created at:\n\n" .. p_u_37
			})
		end
	end, ...))
end
local v_u_49 = {
	["Error"] = v_u_8,
	["Status"] = v7("Promise.Status", {
		"Started",
		"Resolved",
		"Rejected",
		"Cancelled"
	}),
	["CreateErrorTracedXpcall"] = function(p_u_44, p45, ...)
		-- upvalues: (ref) v_u_8
		local v46 = xpcall
		local v47 = p_u_44 ~= nil
		assert(v47, "traceback is nil")
		return v46(p45, function(p48)
			-- upvalues: (ref) v_u_8, (copy) p_u_44
			if type(p48) == "table" then
				return p48
			else
				return v_u_8.new({
					["error"] = p48,
					["kind"] = v_u_8.Kind.ExecutionError,
					["trace"] = debug.traceback(tostring(p48), 2),
					["context"] = "Custom Error call traced to:\n\n" .. p_u_44
				})
			end
		end, ...)
	end,
	["_getTime"] = os.clock,
	["_timeEvent"] = game:GetService("RunService").Heartbeat,
	["_unhandledRejectionCallbacks"] = {},
	["prototype"] = {}
}
v_u_49.__index = v_u_49.prototype
function v_u_49._new(p50, p_u_51, p52)
	-- upvalues: (copy) v_u_49, (copy) v_u_1, (copy) v_u_43
	if p52 ~= nil and not v_u_49.is(p52) then
		error("Argument #2 to Promise.new must be a promise or nil", 2)
	end
	local v_u_53 = {
		["_thread"] = nil,
		["_source"] = p50,
		["_status"] = v_u_49.Status.Started,
		["_values"] = nil,
		["_valuesLength"] = -1,
		["_unhandledRejection"] = true,
		["_queuedResolve"] = {},
		["_queuedReject"] = {},
		["_queuedFinally"] = {},
		["_cancellationHook"] = nil,
		["_parent"] = p52
	}
	local v54 = v_u_1
	v_u_53._consumers = setmetatable({}, v54)
	if p52 and p52._status == v_u_49.Status.Started then
		p52._consumers[v_u_53] = true
	end
	local v55 = v_u_49
	setmetatable(v_u_53, v55)
	local function v_u_56(...)
		-- upvalues: (copy) v_u_53
		v_u_53:_resolve(...)
	end
	local function v_u_57(...)
		-- upvalues: (copy) v_u_53
		v_u_53:_reject(...)
	end
	local function v_u_59(p58)
		-- upvalues: (copy) v_u_53, (ref) v_u_49
		if p58 then
			if v_u_53._status == v_u_49.Status.Cancelled then
				p58()
			else
				v_u_53._cancellationHook = p58
			end
		end
		return v_u_53._status == v_u_49.Status.Cancelled
	end
	v_u_53._thread = coroutine.create(function()
		-- upvalues: (ref) v_u_43, (copy) v_u_53, (copy) p_u_51, (copy) v_u_56, (copy) v_u_57, (copy) v_u_59
		local v60, _, v61 = v_u_43(v_u_53._source, p_u_51, v_u_56, v_u_57, v_u_59)
		if not v60 then
			v_u_57(v61[1])
		end
	end)
	task.spawn(v_u_53._thread)
	return v_u_53
end
function v_u_49.new(p62)
	-- upvalues: (copy) v_u_49
	return v_u_49._new(debug.traceback(nil, 2), p62)
end
function v_u_49.__tostring(p63)
	return string.format("Promise(%s)", p63._status)
end
function v_u_49.defer(p_u_64)
	-- upvalues: (copy) v_u_49, (copy) v_u_43
	local v_u_65 = debug.traceback(nil, 2)
	return v_u_49._new(v_u_65, function(p_u_66, p_u_67, p_u_68)
		-- upvalues: (ref) v_u_49, (ref) v_u_43, (copy) v_u_65, (copy) p_u_64
		local v_u_69 = nil
		v_u_69 = v_u_49._timeEvent:Connect(function()
			-- upvalues: (ref) v_u_69, (ref) v_u_43, (ref) v_u_65, (ref) p_u_64, (copy) p_u_66, (copy) p_u_67, (copy) p_u_68
			v_u_69:Disconnect()
			local v70, _, v71 = v_u_43(v_u_65, p_u_64, p_u_66, p_u_67, p_u_68)
			if not v70 then
				p_u_67(v71[1])
			end
		end)
	end)
end
v_u_49.async = v_u_49.defer
function v_u_49.resolve(...)
	-- upvalues: (copy) v_u_34, (copy) v_u_49
	local v_u_72, v_u_73 = v_u_34(...)
	return v_u_49._new(debug.traceback(nil, 2), function(p74)
		-- upvalues: (copy) v_u_73, (copy) v_u_72
		local v75 = v_u_73
		local v76 = v_u_72
		p74(unpack(v75, 1, v76))
	end)
end
function v_u_49.reject(...)
	-- upvalues: (copy) v_u_34, (copy) v_u_49
	local v_u_77, v_u_78 = v_u_34(...)
	return v_u_49._new(debug.traceback(nil, 2), function(_, p79)
		-- upvalues: (copy) v_u_78, (copy) v_u_77
		local v80 = v_u_78
		local v81 = v_u_77
		p79(unpack(v80, 1, v81))
	end)
end
function v_u_49._try(p82, p_u_83, ...)
	-- upvalues: (copy) v_u_34, (copy) v_u_49
	local v_u_84, v_u_85 = v_u_34(...)
	return v_u_49._new(p82, function(p86)
		-- upvalues: (copy) p_u_83, (copy) v_u_85, (copy) v_u_84
		local v87 = v_u_85
		local v88 = v_u_84
		p86(p_u_83(unpack(v87, 1, v88)))
	end)
end
function v_u_49.try(p89, ...)
	-- upvalues: (copy) v_u_49
	return v_u_49._try(debug.traceback(nil, 2), p89, ...)
end
function v_u_49._all(p90, p_u_91, p_u_92)
	-- upvalues: (copy) v_u_49
	if type(p_u_91) ~= "table" then
		error(string.format("Please pass a list of promises to %s", "Promise.all"), 3)
	end
	for v93, v94 in pairs(p_u_91) do
		if not v_u_49.is(v94) then
			error(string.format("Non-promise value passed into %s at index %s", "Promise.all", (tostring(v93))), 3)
		end
	end
	if #p_u_91 == 0 or p_u_92 == 0 then
		return v_u_49.resolve({})
	else
		return v_u_49._new(p90, function(p_u_95, p_u_96, p97)
			-- upvalues: (copy) p_u_92, (copy) p_u_91
			local v_u_98 = {}
			local v_u_99 = {}
			local v_u_100 = 0
			local v_u_101 = 0
			local v_u_102 = false
			local function v_u_105(p103, ...)
				-- upvalues: (ref) v_u_102, (ref) v_u_100, (ref) p_u_92, (copy) v_u_98, (ref) p_u_91, (copy) p_u_95, (copy) v_u_99
				if not v_u_102 then
					v_u_100 = v_u_100 + 1
					if p_u_92 == nil then
						v_u_98[p103] = ...
					else
						v_u_98[v_u_100] = ...
					end
					if v_u_100 >= (p_u_92 or #p_u_91) then
						v_u_102 = true
						p_u_95(v_u_98)
						for _, v104 in ipairs(v_u_99) do
							v104:cancel()
						end
					end
				end
			end
			p97(function()
				-- upvalues: (copy) v_u_99
				for _, v106 in ipairs(v_u_99) do
					v106:cancel()
				end
			end)
			local v_u_107 = v_u_102
			for v_u_108, v109 in ipairs(p_u_91) do
				v_u_99[v_u_108] = v109:andThen(function(...)
					-- upvalues: (copy) v_u_105, (copy) v_u_108
					v_u_105(v_u_108, ...)
				end, function(...)
					-- upvalues: (ref) v_u_101, (ref) p_u_92, (ref) p_u_91, (copy) v_u_99, (ref) v_u_107, (copy) p_u_96
					v_u_101 = v_u_101 + 1
					if p_u_92 == nil or #p_u_91 - v_u_101 < p_u_92 then
						for _, v110 in ipairs(v_u_99) do
							v110:cancel()
						end
						v_u_107 = true
						p_u_96(...)
					end
				end)
			end
			if v_u_107 then
				for _, v111 in ipairs(v_u_99) do
					v111:cancel()
				end
			end
		end)
	end
end
function v_u_49.all(p112)
	-- upvalues: (copy) v_u_49
	return v_u_49._all(debug.traceback(nil, 2), p112)
end
function v_u_49.fold(p113, p_u_114, p115)
	-- upvalues: (copy) v_u_49
	local v116 = type(p113) == "table"
	assert(v116, "Bad argument #1 to Promise.fold: must be a table")
	local v117
	if type(p_u_114) == "function" then
		v117 = true
	elseif type(p_u_114) == "table" then
		local v118 = getmetatable(p_u_114)
		if v118 then
			local v119 = rawget(v118, "__call")
			v117 = type(v119) == "function"
		else
			v117 = false
		end
	else
		v117 = false
	end
	assert(v117, "Bad argument #2 to Promise.fold: must be a function")
	local v_u_120 = v_u_49.resolve(p115)
	return v_u_49.each(p113, function(p_u_121, p_u_122)
		-- upvalues: (ref) v_u_120, (copy) p_u_114
		v_u_120 = v_u_120:andThen(function(p123)
			-- upvalues: (ref) p_u_114, (copy) p_u_121, (copy) p_u_122
			return p_u_114(p123, p_u_121, p_u_122)
		end)
	end):andThen(function()
		-- upvalues: (ref) v_u_120
		return v_u_120
	end)
end
function v_u_49.some(p124, p125)
	-- upvalues: (copy) v_u_49
	local v126 = type(p125) == "number"
	assert(v126, "Bad argument #2 to Promise.some: must be a number")
	return v_u_49._all(debug.traceback(nil, 2), p124, p125)
end
function v_u_49.any(p127)
	-- upvalues: (copy) v_u_49
	return v_u_49._all(debug.traceback(nil, 2), p127, 1):andThen(function(p128)
		return p128[1]
	end)
end
function v_u_49.allSettled(p_u_129)
	-- upvalues: (copy) v_u_49
	if type(p_u_129) ~= "table" then
		error(string.format("Please pass a list of promises to %s", "Promise.allSettled"), 2)
	end
	for v130, v131 in pairs(p_u_129) do
		if not v_u_49.is(v131) then
			error(string.format("Non-promise value passed into %s at index %s", "Promise.allSettled", (tostring(v130))), 2)
		end
	end
	if #p_u_129 == 0 then
		return v_u_49.resolve({})
	else
		return v_u_49._new(debug.traceback(nil, 2), function(p_u_132, _, p133)
			-- upvalues: (copy) p_u_129
			local v_u_134 = {}
			local v_u_135 = {}
			local v_u_136 = 0
			local function v_u_138(p137, ...)
				-- upvalues: (ref) v_u_136, (copy) v_u_134, (ref) p_u_129, (copy) p_u_132
				v_u_136 = v_u_136 + 1
				v_u_134[p137] = ...
				if v_u_136 >= #p_u_129 then
					p_u_132(v_u_134)
				end
			end
			p133(function()
				-- upvalues: (copy) v_u_135
				for _, v139 in ipairs(v_u_135) do
					v139:cancel()
				end
			end)
			for v_u_140, v141 in ipairs(p_u_129) do
				v_u_135[v_u_140] = v141:finally(function(...)
					-- upvalues: (copy) v_u_138, (copy) v_u_140
					v_u_138(v_u_140, ...)
				end)
			end
		end)
	end
end
function v_u_49.race(p_u_142)
	-- upvalues: (copy) v_u_49
	local v143 = type(p_u_142) == "table"
	local v144 = string.format
	assert(v143, v144("Please pass a list of promises to %s", "Promise.race"))
	for v145, v146 in pairs(p_u_142) do
		local v147 = v_u_49.is(v146)
		local v148 = string.format
		local v149 = tostring(v145)
		assert(v147, v148("Non-promise value passed into %s at index %s", "Promise.race", v149))
	end
	return v_u_49._new(debug.traceback(nil, 2), function(p_u_150, p_u_151, p152)
		-- upvalues: (copy) p_u_142
		local v_u_153 = {}
		local v_u_154 = false
		if not p152(function(...)
			-- upvalues: (copy) v_u_153, (ref) v_u_154, (copy) p_u_151
			for _, v155 in ipairs(v_u_153) do
				v155:cancel()
			end
			v_u_154 = true
			return p_u_151(...)
		end) then
			local v_u_156 = v_u_154
			for v157, v158 in ipairs(p_u_142) do
				v_u_153[v157] = v158:andThen(function(...)
					-- upvalues: (copy) v_u_153, (ref) v_u_156, (copy) p_u_150
					for _, v159 in ipairs(v_u_153) do
						v159:cancel()
					end
					v_u_156 = true
					return p_u_150(...)
				end, function(...)
					-- upvalues: (copy) v_u_153, (ref) v_u_156, (copy) p_u_151
					for _, v160 in ipairs(v_u_153) do
						v160:cancel()
					end
					v_u_156 = true
					return p_u_151(...)
				end)
			end
			if v_u_156 then
				for _, v161 in ipairs(v_u_153) do
					v161:cancel()
				end
			end
		end
	end)
end
function v_u_49.each(p_u_162, p_u_163)
	-- upvalues: (copy) v_u_49, (ref) v_u_8
	local v164 = type(p_u_162) == "table"
	local v165 = string.format
	assert(v164, v165("Please pass a list of promises to %s", "Promise.each"))
	local v166
	if type(p_u_163) == "function" then
		v166 = true
	elseif type(p_u_163) == "table" then
		local v167 = getmetatable(p_u_163)
		if v167 then
			local v168 = rawget(v167, "__call")
			v166 = type(v168) == "function"
		else
			v166 = false
		end
	else
		v166 = false
	end
	local v169 = string.format
	assert(v166, v169("Please pass a handler function to %s!", "Promise.each"))
	return v_u_49._new(debug.traceback(nil, 2), function(p170, p171, p172)
		-- upvalues: (copy) p_u_162, (ref) v_u_49, (ref) v_u_8, (copy) p_u_163
		local v173 = {}
		local v_u_174 = {}
		local v_u_175 = false
		p172(function()
			-- upvalues: (ref) v_u_175, (copy) v_u_174
			v_u_175 = true
			for _, v176 in ipairs(v_u_174) do
				v176:cancel()
			end
		end)
		local v177 = v_u_175
		local v178 = {}
		for v179, v180 in ipairs(p_u_162) do
			if v_u_49.is(v180) then
				if v180:getStatus() == v_u_49.Status.Cancelled then
					for _, v181 in ipairs(v_u_174) do
						v181:cancel()
					end
					return p171(v_u_8.new({
						["error"] = "Promise is cancelled",
						["kind"] = v_u_8.Kind.AlreadyCancelled,
						["context"] = string.format("The Promise that was part of the array at index %d passed into Promise.each was already cancelled when Promise.each began.\n\nThat Promise was created at:\n\n%s", v179, v180._source)
					}))
				end
				if v180:getStatus() == v_u_49.Status.Rejected then
					for _, v182 in ipairs(v_u_174) do
						v182:cancel()
					end
					return p171(select(2, v180:await()))
				end
				local v183 = v180:andThen(function(...)
					return ...
				end)
				table.insert(v_u_174, v183)
				v178[v179] = v183
			else
				v178[v179] = v180
			end
		end
		for v184, v187 in ipairs(v178) do
			if v_u_49.is(v187) then
				local v186, v187 = v187:await()
				if not v186 then
					for _, v188 in ipairs(v_u_174) do
						v188:cancel()
					end
					return p171(v187)
				end
			end
			if v177 then
				return
			end
			local v189 = v_u_49.resolve(p_u_163(v187, v184))
			table.insert(v_u_174, v189)
			local v190, v191 = v189:await()
			if not v190 then
				for _, v192 in ipairs(v_u_174) do
					v192:cancel()
				end
				return p171(v191)
			end
			v173[v184] = v191
		end
		p170(v173)
	end)
end
function v_u_49.is(p193)
	-- upvalues: (copy) v_u_49
	if type(p193) ~= "table" then
		return false
	end
	local v194 = getmetatable(p193)
	if v194 == v_u_49 then
		return true
	end
	if v194 ~= nil then
		if type(v194) == "table" then
			local v195 = rawget(v194, "__index")
			if type(v195) == "table" then
				local v196 = rawget(v194, "__index")
				local v197 = rawget(v196, "andThen")
				local v198
				if type(v197) == "function" then
					v198 = true
				else
					local v199 = type(v197) == "table" and getmetatable(v197)
					if v199 then
						local v200 = rawget(v199, "__call")
						v198 = type(v200) == "function"
					else
						v198 = false
					end
				end
				if v198 then
					return true
				end
			end
		end
		return false
	end
	local v201 = p193.andThen
	if type(v201) == "function" then
		return true
	end
	local v202 = type(v201) == "table" and getmetatable(v201)
	if v202 then
		local v203 = rawget(v202, "__call")
		if type(v203) == "function" then
			return true
		end
	end
	return false
end
function v_u_49.promisify(p_u_204)
	-- upvalues: (copy) v_u_49
	return function(...)
		-- upvalues: (ref) v_u_49, (copy) p_u_204
		return v_u_49._try(debug.traceback(nil, 2), p_u_204, ...)
	end
end
local v_u_205 = nil
local v_u_206 = nil
function v_u_49.delay(p207)
	-- upvalues: (copy) v_u_49, (ref) v_u_206, (ref) v_u_205
	local v208 = type(p207) == "number"
	assert(v208, "Bad argument #1 to Promise.delay, must be a number.")
	local v_u_209 = (p207 < 0.016666666666666666 or p207 == (1 / 0)) and 0.016666666666666666 or p207
	return v_u_49._new(debug.traceback(nil, 2), function(p210, _, p211)
		-- upvalues: (ref) v_u_49, (ref) v_u_209, (ref) v_u_206, (ref) v_u_205
		local v212 = v_u_49._getTime()
		local v213 = v212 + v_u_209
		local v_u_214 = {
			["resolve"] = p210,
			["startTime"] = v212,
			["endTime"] = v213
		}
		if v_u_206 == nil then
			v_u_205 = v_u_214
			v_u_206 = v_u_49._timeEvent:Connect(function()
				-- upvalues: (ref) v_u_49, (ref) v_u_205, (ref) v_u_206
				local v215 = v_u_49._getTime()
				while v_u_205 ~= nil and v_u_205.endTime < v215 do
					local v216 = v_u_205
					v_u_205 = v216.next
					if v_u_205 == nil then
						v_u_206:Disconnect()
						v_u_206 = nil
					else
						v_u_205.previous = nil
					end
					v216.resolve(v_u_49._getTime() - v216.startTime)
				end
			end)
		elseif v_u_205.endTime < v213 then
			local v217 = v_u_205
			local v218 = v217.next
			while v218 ~= nil and v218.endTime < v213 do
				local v219 = v218.next
				v217 = v218
				v218 = v219
			end
			v217.next = v_u_214
			v_u_214.previous = v217
			if v218 ~= nil then
				v_u_214.next = v218
				v218.previous = v_u_214
			end
		else
			v_u_214.next = v_u_205
			v_u_205.previous = v_u_214
			v_u_205 = v_u_214
		end
		p211(function()
			-- upvalues: (copy) v_u_214, (ref) v_u_205, (ref) v_u_206
			local v220 = v_u_214.next
			if v_u_205 == v_u_214 then
				if v220 == nil then
					v_u_206:Disconnect()
					v_u_206 = nil
				else
					v220.previous = nil
				end
				v_u_205 = v220
			else
				local v221 = v_u_214.previous
				v221.next = v220
				if v220 ~= nil then
					v220.previous = v221
				end
			end
		end)
	end)
end
local function v226(p222, p_u_223, p_u_224)
	-- upvalues: (copy) v_u_49, (ref) v_u_8
	local v_u_225 = debug.traceback(nil, 2)
	return v_u_49.race({ v_u_49.delay(p_u_223):andThen(function()
			-- upvalues: (ref) v_u_49, (copy) p_u_224, (ref) v_u_8, (copy) p_u_223, (copy) v_u_225
			return v_u_49.reject(p_u_224 == nil and v_u_8.new({
				["kind"] = v_u_8.Kind.TimedOut,
				["error"] = "Timed out",
				["context"] = string.format("Timeout of %d seconds exceeded.\n:timeout() called at:\n\n%s", p_u_223, v_u_225)
			}) or p_u_224)
		end), p222 })
end
v_u_49.prototype.timeout = v226
function v_u_49.prototype.getStatus(p227)
	return p227._status
end
function v_u_49.prototype._andThen(p_u_228, p_u_229, p_u_230, p_u_231)
	-- upvalues: (copy) v_u_49, (copy) v_u_43
	p_u_228._unhandledRejection = false
	if p_u_228._status ~= v_u_49.Status.Cancelled then
		return v_u_49._new(p_u_229, function(p_u_232, p_u_233, p234)
			-- upvalues: (copy) p_u_230, (copy) p_u_229, (ref) v_u_43, (copy) p_u_231, (copy) p_u_228, (ref) v_u_49
			local v_u_235
			if p_u_230 then
				local v_u_236 = p_u_229
				local v_u_237 = p_u_230
				v_u_235 = function(...)
					-- upvalues: (ref) v_u_43, (copy) v_u_236, (copy) v_u_237, (copy) p_u_232, (copy) p_u_233
					local v238, v239, v240 = v_u_43(v_u_236, v_u_237, ...)
					if v238 then
						p_u_232(unpack(v240, 1, v239))
					else
						p_u_233(v240[1])
					end
				end
			else
				v_u_235 = p_u_232
			end
			if p_u_231 then
				local v_u_241 = p_u_229
				local v_u_242 = p_u_231
				p_u_233 = function(...)
					-- upvalues: (ref) v_u_43, (copy) v_u_241, (copy) v_u_242, (copy) p_u_232, (copy) p_u_233
					local v243, v244, v245 = v_u_43(v_u_241, v_u_242, ...)
					if v243 then
						p_u_232(unpack(v245, 1, v244))
					else
						p_u_233(v245[1])
					end
				end
			end
			if p_u_228._status == v_u_49.Status.Started then
				local v246 = p_u_228._queuedResolve
				table.insert(v246, v_u_235)
				local v247 = p_u_228._queuedReject
				table.insert(v247, p_u_233)
				p234(function()
					-- upvalues: (ref) p_u_228, (ref) v_u_49, (ref) v_u_235, (ref) p_u_233
					if p_u_228._status == v_u_49.Status.Started then
						table.remove(p_u_228._queuedResolve, table.find(p_u_228._queuedResolve, v_u_235))
						table.remove(p_u_228._queuedReject, table.find(p_u_228._queuedReject, p_u_233))
					end
				end)
			elseif p_u_228._status == v_u_49.Status.Resolved then
				local v248 = p_u_228._values
				local v249 = p_u_228._valuesLength
				v_u_235(unpack(v248, 1, v249))
			elseif p_u_228._status == v_u_49.Status.Rejected then
				local v250 = p_u_228._values
				local v251 = p_u_228._valuesLength
				p_u_233(unpack(v250, 1, v251))
			end
		end, p_u_228)
	end
	local v252 = v_u_49.new(function() end)
	v252:cancel()
	return v252
end
function v_u_49.prototype.andThen(p253, p254, p255)
	local v256
	if p254 == nil or type(p254) == "function" then
		v256 = true
	elseif type(p254) == "table" then
		local v257 = getmetatable(p254)
		if v257 then
			local v258 = rawget(v257, "__call")
			v256 = type(v258) == "function"
		else
			v256 = false
		end
	else
		v256 = false
	end
	local v259 = string.format
	assert(v256, v259("Please pass a handler function to %s!", "Promise:andThen"))
	local v260
	if p255 == nil or type(p255) == "function" then
		v260 = true
	elseif type(p255) == "table" then
		local v261 = getmetatable(p255)
		if v261 then
			local v262 = rawget(v261, "__call")
			v260 = type(v262) == "function"
		else
			v260 = false
		end
	else
		v260 = false
	end
	local v263 = string.format
	assert(v260, v263("Please pass a handler function to %s!", "Promise:andThen"))
	return p253:_andThen(debug.traceback(nil, 2), p254, p255)
end
function v_u_49.prototype.catch(p264, p265)
	local v266
	if p265 == nil or type(p265) == "function" then
		v266 = true
	elseif type(p265) == "table" then
		local v267 = getmetatable(p265)
		if v267 then
			local v268 = rawget(v267, "__call")
			v266 = type(v268) == "function"
		else
			v266 = false
		end
	else
		v266 = false
	end
	local v269 = string.format
	assert(v266, v269("Please pass a handler function to %s!", "Promise:catch"))
	return p264:_andThen(debug.traceback(nil, 2), nil, p265)
end
function v_u_49.prototype.tap(p270, p_u_271)
	-- upvalues: (copy) v_u_49, (copy) v_u_34
	local v272
	if type(p_u_271) == "function" then
		v272 = true
	elseif type(p_u_271) == "table" then
		local v273 = getmetatable(p_u_271)
		if v273 then
			local v274 = rawget(v273, "__call")
			v272 = type(v274) == "function"
		else
			v272 = false
		end
	else
		v272 = false
	end
	local v275 = string.format
	assert(v272, v275("Please pass a handler function to %s!", "Promise:tap"))
	return p270:_andThen(debug.traceback(nil, 2), function(...)
		-- upvalues: (copy) p_u_271, (ref) v_u_49, (ref) v_u_34
		local v276 = p_u_271(...)
		if not v_u_49.is(v276) then
			return ...
		end
		local v_u_277, v_u_278 = v_u_34(...)
		return v276:andThen(function()
			-- upvalues: (copy) v_u_278, (copy) v_u_277
			local v279 = v_u_278
			local v280 = v_u_277
			return unpack(v279, 1, v280)
		end)
	end)
end
function v_u_49.prototype.andThenCall(p281, p_u_282, ...)
	-- upvalues: (copy) v_u_34
	local v283
	if type(p_u_282) == "function" then
		v283 = true
	elseif type(p_u_282) == "table" then
		local v284 = getmetatable(p_u_282)
		if v284 then
			local v285 = rawget(v284, "__call")
			v283 = type(v285) == "function"
		else
			v283 = false
		end
	else
		v283 = false
	end
	local v286 = string.format
	assert(v283, v286("Please pass a handler function to %s!", "Promise:andThenCall"))
	local v_u_287, v_u_288 = v_u_34(...)
	return p281:_andThen(debug.traceback(nil, 2), function()
		-- upvalues: (copy) p_u_282, (copy) v_u_288, (copy) v_u_287
		local v289 = v_u_288
		local v290 = v_u_287
		return p_u_282(unpack(v289, 1, v290))
	end)
end
function v_u_49.prototype.andThenReturn(p291, ...)
	-- upvalues: (copy) v_u_34
	local v_u_292, v_u_293 = v_u_34(...)
	return p291:_andThen(debug.traceback(nil, 2), function()
		-- upvalues: (copy) v_u_293, (copy) v_u_292
		local v294 = v_u_293
		local v295 = v_u_292
		return unpack(v294, 1, v295)
	end)
end
function v_u_49.prototype.cancel(p296)
	-- upvalues: (copy) v_u_49
	if p296._status == v_u_49.Status.Started then
		p296._status = v_u_49.Status.Cancelled
		if p296._cancellationHook then
			p296._cancellationHook()
		end
		coroutine.close(p296._thread)
		if p296._parent then
			p296._parent:_consumerCancelled(p296)
		end
		for v297 in pairs(p296._consumers) do
			v297:cancel()
		end
		p296:_finalize()
	end
end
function v_u_49.prototype._consumerCancelled(p298, p299)
	-- upvalues: (copy) v_u_49
	if p298._status == v_u_49.Status.Started then
		p298._consumers[p299] = nil
		if next(p298._consumers) == nil then
			p298:cancel()
		end
	end
end
function v_u_49.prototype._finally(p_u_300, p301, p_u_302)
	-- upvalues: (copy) v_u_49
	p_u_300._unhandledRejection = false
	return v_u_49._new(p301, function(p_u_303, p_u_304, p305)
		-- upvalues: (copy) p_u_300, (copy) p_u_302, (ref) v_u_49
		local v_u_306 = nil
		p305(function()
			-- upvalues: (ref) p_u_300, (ref) v_u_306
			p_u_300:_consumerCancelled(p_u_300)
			if v_u_306 then
				v_u_306:cancel()
			end
		end)
		local v309 = p_u_302 and function(...)
			-- upvalues: (ref) p_u_302, (ref) v_u_49, (ref) v_u_306, (copy) p_u_303, (ref) p_u_300, (copy) p_u_304
			local v307 = p_u_302(...)
			if v_u_49.is(v307) then
				v_u_306 = v307
				v307:finally(function(p308)
					-- upvalues: (ref) v_u_49, (ref) p_u_303, (ref) p_u_300
					if p308 ~= v_u_49.Status.Rejected then
						p_u_303(p_u_300)
					end
				end):catch(function(...)
					-- upvalues: (ref) p_u_304
					p_u_304(...)
				end)
			else
				p_u_303(p_u_300)
			end
		end or p_u_303
		if p_u_300._status == v_u_49.Status.Started then
			local v310 = p_u_300._queuedFinally
			table.insert(v310, v309)
		else
			v309(p_u_300._status)
		end
	end)
end
function v_u_49.prototype.finally(p311, p312)
	local v313
	if p312 == nil or type(p312) == "function" then
		v313 = true
	elseif type(p312) == "table" then
		local v314 = getmetatable(p312)
		if v314 then
			local v315 = rawget(v314, "__call")
			v313 = type(v315) == "function"
		else
			v313 = false
		end
	else
		v313 = false
	end
	local v316 = string.format
	assert(v313, v316("Please pass a handler function to %s!", "Promise:finally"))
	return p311:_finally(debug.traceback(nil, 2), p312)
end
function v_u_49.prototype.finallyCall(p317, p_u_318, ...)
	-- upvalues: (copy) v_u_34
	local v319
	if type(p_u_318) == "function" then
		v319 = true
	elseif type(p_u_318) == "table" then
		local v320 = getmetatable(p_u_318)
		if v320 then
			local v321 = rawget(v320, "__call")
			v319 = type(v321) == "function"
		else
			v319 = false
		end
	else
		v319 = false
	end
	local v322 = string.format
	assert(v319, v322("Please pass a handler function to %s!", "Promise:finallyCall"))
	local v_u_323, v_u_324 = v_u_34(...)
	return p317:_finally(debug.traceback(nil, 2), function()
		-- upvalues: (copy) p_u_318, (copy) v_u_324, (copy) v_u_323
		local v325 = v_u_324
		local v326 = v_u_323
		return p_u_318(unpack(v325, 1, v326))
	end)
end
function v_u_49.prototype.finallyReturn(p327, ...)
	-- upvalues: (copy) v_u_34
	local v_u_328, v_u_329 = v_u_34(...)
	return p327:_finally(debug.traceback(nil, 2), function()
		-- upvalues: (copy) v_u_329, (copy) v_u_328
		local v330 = v_u_329
		local v331 = v_u_328
		return unpack(v330, 1, v331)
	end)
end
function v_u_49.prototype.awaitStatus(p332)
	-- upvalues: (copy) v_u_49
	p332._unhandledRejection = false
	if p332._status == v_u_49.Status.Started then
		local v_u_333 = coroutine.running()
		p332:finally(function()
			-- upvalues: (copy) v_u_333
			task.spawn(v_u_333)
		end):catch(function() end)
		coroutine.yield()
	end
	if p332._status == v_u_49.Status.Resolved then
		local v334 = p332._status
		local v335 = p332._values
		local v336 = p332._valuesLength
		return v334, unpack(v335, 1, v336)
	end
	if p332._status ~= v_u_49.Status.Rejected then
		return p332._status
	end
	local v337 = p332._status
	local v338 = p332._values
	local v339 = p332._valuesLength
	return v337, unpack(v338, 1, v339)
end
local function v_u_341(p340, ...)
	-- upvalues: (copy) v_u_49
	return p340 == v_u_49.Status.Resolved, ...
end
function v_u_49.prototype.await(p342)
	-- upvalues: (copy) v_u_341
	return v_u_341(p342:awaitStatus())
end
local function v_u_344(p343, ...)
	-- upvalues: (copy) v_u_49
	if p343 ~= v_u_49.Status.Resolved then
		error(... == nil and "Expected Promise rejected with no value." or ..., 3)
	end
	return ...
end
function v_u_49.prototype.expect(p345)
	-- upvalues: (copy) v_u_344
	return v_u_344(p345:awaitStatus())
end
v_u_49.prototype.awaitValue = v_u_49.prototype.expect
function v_u_49.prototype._unwrap(p346)
	-- upvalues: (copy) v_u_49
	if p346._status == v_u_49.Status.Started then
		error("Promise has not resolved or rejected.", 2)
	end
	local v347 = p346._status == v_u_49.Status.Resolved
	local v348 = p346._values
	local v349 = p346._valuesLength
	return v347, unpack(v348, 1, v349)
end
local function v358(p_u_350, ...)
	-- upvalues: (copy) v_u_49, (ref) v_u_8, (copy) v_u_34
	if p_u_350._status == v_u_49.Status.Started then
		if v_u_49.is((...)) then
			if select("#", ...) > 1 then
				local v351 = string.format("When returning a Promise from andThen, extra arguments are discarded! See:\n\n%s", p_u_350._source)
				warn(v351)
			end
			local v_u_352 = ...
			local v354 = v_u_352:andThen(function(...)
				-- upvalues: (copy) p_u_350
				p_u_350:_resolve(...)
			end, function(...)
				-- upvalues: (copy) v_u_352, (ref) v_u_8, (copy) p_u_350
				local v353 = v_u_352._values[1]
				if v_u_352._error then
					v353 = v_u_8.new({
						["error"] = v_u_352._error,
						["kind"] = v_u_8.Kind.ExecutionError,
						["context"] = "[No stack trace available as this Promise originated from an older version of the Promise library (< v2)]"
					})
				end
				if v_u_8.isKind(v353, v_u_8.Kind.ExecutionError) then
					return p_u_350:_reject(v353:extend({
						["error"] = "This Promise was chained to a Promise that errored.",
						["trace"] = "",
						["context"] = string.format("The Promise at:\n\n%s\n...Rejected because it was chained to the following Promise, which encountered an error:\n", p_u_350._source)
					}))
				end
				p_u_350:_reject(...)
			end)
			if v354._status == v_u_49.Status.Cancelled then
				p_u_350:cancel()
			elseif v354._status == v_u_49.Status.Started then
				p_u_350._parent = v354
				v354._consumers[p_u_350] = true
			end
		else
			p_u_350._status = v_u_49.Status.Resolved
			local v355, v356 = v_u_34(...)
			p_u_350._valuesLength = v355
			p_u_350._values = v356
			for _, v357 in ipairs(p_u_350._queuedResolve) do
				coroutine.wrap(v357)(...)
			end
			p_u_350:_finalize()
			return
		end
	else
		if v_u_49.is((...)) then
			(...):_consumerCancelled(p_u_350)
		end
		return
	end
end
v_u_49.prototype._resolve = v358
function v_u_49.prototype._reject(p_u_359, ...)
	-- upvalues: (copy) v_u_49, (copy) v_u_34
	if p_u_359._status == v_u_49.Status.Started then
		p_u_359._status = v_u_49.Status.Rejected
		local v360, v361 = v_u_34(...)
		p_u_359._valuesLength = v360
		p_u_359._values = v361
		local v362 = p_u_359._queuedReject
		if next(v362) == nil then
			local v_u_363 = tostring((...))
			coroutine.wrap(function()
				-- upvalues: (ref) v_u_49, (copy) p_u_359, (copy) v_u_363
				v_u_49._timeEvent:Wait()
				if p_u_359._unhandledRejection then
					local v364 = string.format("Unhandled Promise rejection:\n\n%s\n\n%s", v_u_363, p_u_359._source)
					for _, v365 in ipairs(v_u_49._unhandledRejectionCallbacks) do
						local v366 = task.spawn
						local v367 = p_u_359
						local v368 = p_u_359._values
						local v369 = p_u_359._valuesLength
						v366(v365, v367, unpack(v368, 1, v369))
					end
					if not v_u_49.TEST then
						warn(v364)
					end
				else
					return
				end
			end)()
		else
			for _, v370 in ipairs(p_u_359._queuedReject) do
				coroutine.wrap(v370)(...)
			end
		end
		p_u_359:_finalize()
	end
end
function v_u_49.prototype._finalize(p371)
	-- upvalues: (copy) v_u_49
	for _, v372 in ipairs(p371._queuedFinally) do
		coroutine.wrap(v372)(p371._status)
	end
	p371._queuedFinally = nil
	p371._queuedReject = nil
	p371._queuedResolve = nil
	if not v_u_49.TEST then
		p371._parent = nil
		p371._consumers = nil
	end
	task.defer(coroutine.close, p371._thread)
end
local function v377(p373, p374)
	-- upvalues: (copy) v_u_49, (ref) v_u_8
	local v375 = debug.traceback(nil, 2)
	if p373._status == v_u_49.Status.Resolved then
		return p373:_andThen(v375, function(...)
			return ...
		end)
	end
	local v376 = v_u_49.reject
	if p374 == nil then
		p374 = v_u_8.new({
			["kind"] = v_u_8.Kind.NotResolvedInTime,
			["error"] = "This Promise was not resolved in time for :now()",
			["context"] = ":now() was called at:\n\n" .. v375
		}) or p374
	end
	return v376(p374)
end
v_u_49.prototype.now = v377
function v_u_49.retry(p_u_378, p_u_379, ...)
	-- upvalues: (copy) v_u_49
	local v380
	if type(p_u_378) == "function" then
		v380 = true
	elseif type(p_u_378) == "table" then
		local v381 = getmetatable(p_u_378)
		if v381 then
			local v382 = rawget(v381, "__call")
			v380 = type(v382) == "function"
		else
			v380 = false
		end
	else
		v380 = false
	end
	assert(v380, "Parameter #1 to Promise.retry must be a function")
	local v383 = type(p_u_379) == "number"
	assert(v383, "Parameter #2 to Promise.retry must be a number")
	local v_u_384 = { ... }
	local v_u_385 = select("#", ...)
	return v_u_49.resolve(p_u_378(...)):catch(function(...)
		-- upvalues: (copy) p_u_379, (ref) v_u_49, (copy) p_u_378, (copy) v_u_384, (copy) v_u_385
		if p_u_379 <= 0 then
			return v_u_49.reject(...)
		end
		local v386 = v_u_384
		local v387 = v_u_385
		return v_u_49.retry(p_u_378, p_u_379 - 1, unpack(v386, 1, v387))
	end)
end
function v_u_49.retryWithDelay(p_u_388, p_u_389, p_u_390, ...)
	-- upvalues: (copy) v_u_49
	local v391
	if type(p_u_388) == "function" then
		v391 = true
	elseif type(p_u_388) == "table" then
		local v392 = getmetatable(p_u_388)
		if v392 then
			local v393 = rawget(v392, "__call")
			v391 = type(v393) == "function"
		else
			v391 = false
		end
	else
		v391 = false
	end
	assert(v391, "Parameter #1 to Promise.retry must be a function")
	local v394 = type(p_u_389) == "number"
	assert(v394, "Parameter #2 (times) to Promise.retry must be a number")
	local v395 = type(p_u_390) == "number"
	assert(v395, "Parameter #3 (seconds) to Promise.retry must be a number")
	local v_u_396 = { ... }
	local v_u_397 = select("#", ...)
	return v_u_49.resolve(p_u_388(...)):catch(function(...)
		-- upvalues: (copy) p_u_389, (ref) v_u_49, (copy) p_u_390, (copy) p_u_388, (copy) v_u_396, (copy) v_u_397
		if p_u_389 <= 0 then
			return v_u_49.reject(...)
		end
		v_u_49.delay(p_u_390):await()
		local v398 = v_u_396
		local v399 = v_u_397
		return v_u_49.retryWithDelay(p_u_388, p_u_389 - 1, p_u_390, unpack(v398, 1, v399))
	end)
end
function v_u_49.fromEvent(p_u_400, p401)
	-- upvalues: (copy) v_u_49
	local v_u_402 = p401 or function()
		return true
	end
	return v_u_49._new(debug.traceback(nil, 2), function(p_u_403, _, p404)
		-- upvalues: (copy) p_u_400, (ref) v_u_402
		local v_u_405 = nil
		local v_u_406 = false
		local function v407()
			-- upvalues: (ref) v_u_405
			v_u_405:Disconnect()
			v_u_405 = nil
		end
		v_u_405 = p_u_400:Connect(function(...)
			-- upvalues: (ref) v_u_402, (copy) p_u_403, (ref) v_u_405, (ref) v_u_406
			local v408 = v_u_402(...)
			if v408 == true then
				p_u_403(...)
				if v_u_405 then
					v_u_405:Disconnect()
					v_u_405 = nil
				else
					v_u_406 = true
				end
			else
				if type(v408) ~= "boolean" then
					error("Promise.fromEvent predicate should always return a boolean")
				end
				return
			end
		end)
		if v_u_406 and v_u_405 then
			return v407()
		end
		p404(v407)
	end)
end
function v_u_49.onUnhandledRejection(p_u_409)
	-- upvalues: (copy) v_u_49
	local v410 = v_u_49._unhandledRejectionCallbacks
	table.insert(v410, p_u_409)
	return function()
		-- upvalues: (ref) v_u_49, (copy) p_u_409
		local v411 = table.find(v_u_49._unhandledRejectionCallbacks, p_u_409)
		if v411 then
			table.remove(v_u_49._unhandledRejectionCallbacks, v411)
		end
	end
end
return v_u_49