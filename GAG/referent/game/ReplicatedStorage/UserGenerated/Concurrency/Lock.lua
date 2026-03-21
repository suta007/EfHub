local v_u_1 = require(game.ReplicatedStorage.UserGenerated.Lang.Finally)
local v2 = {}
local v_u_12 = table.freeze({
	["__index"] = table.freeze({
		["Call"] = function(p_u_3, p4, ...)
			-- upvalues: (copy) v_u_1
			local v5 = type(p4) == "function"
			assert(v5)
			while p_u_3.Count > 0 do
				task.wait()
			end
			p_u_3.Count = p_u_3.Count + 1
			return v_u_1(p4, function()
				-- upvalues: (copy) p_u_3
				local v6 = p_u_3
				v6.Count = v6.Count - 1
			end, ...)
		end,
		["Try"] = function(p_u_7, p8, ...)
			-- upvalues: (copy) v_u_1
			local v9 = type(p8) == "function"
			assert(v9)
			if p_u_7.Count > 0 then
				return false
			end
			p_u_7.Count = p_u_7.Count + 1
			return true, v_u_1(p8, function()
				-- upvalues: (copy) p_u_7
				local v10 = p_u_7
				v10.Count = v10.Count - 1
			end, ...)
		end,
		["IsLocked"] = function(p11)
			return p11.Count > 0
		end
	})
})
function v2.new()
	-- upvalues: (copy) v_u_12
	local v13 = v_u_12
	return setmetatable({
		["Count"] = 0
	}, v13)
end
return table.freeze(v2)