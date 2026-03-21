local v1 = game:GetService("ReplicatedStorage")
local v_u_2 = require(v1.UserGenerated.Collections.DeepEquals)
local v_u_3 = require(v1.UserGenerated.Concurrency.Bindable)
local v8 = {
	["__index"] = table.freeze({
		["Get"] = function(p4)
			return p4.Value
		end,
		["Set"] = function(p5, p6)
			-- upvalues: (copy) v_u_2
			if p5.Assertion then
				p6 = p5.Assertion(p6)
			end
			local v7 = p5.Value
			p5.Value = p6
			if not v_u_2(p6, v7) then
				p5.Changed:Fire(p6, v7)
			end
			return v7
		end
	})
}
local v_u_9 = table.freeze(v8)
return table.freeze({
	["new"] = function(p10, p11)
		-- upvalues: (copy) v_u_3, (copy) v_u_9
		local v12 = type(p10) == "function"
		assert(v12)
		local v13 = p10(p11)
		local v14 = {
			["Changed"] = v_u_3.new(),
			["Assertion"] = p10,
			["Value"] = v13
		}
		v14.Readonly = v14
		local v15 = v_u_9
		return setmetatable(v14, v15)
	end,
	["Unasserted"] = function(p16)
		-- upvalues: (copy) v_u_3, (copy) v_u_9
		local v17 = {
			["Changed"] = v_u_3.new(),
			["Value"] = p16
		}
		v17.Readonly = v17
		local v18 = v_u_9
		return setmetatable(v17, v18)
	end
})