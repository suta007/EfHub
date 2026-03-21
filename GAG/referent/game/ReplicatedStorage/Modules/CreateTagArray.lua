local v1 = game:GetService("ReplicatedStorage")
local v_u_2 = require(v1.Modules.CreateTagHandler)
return function(p3)
	-- upvalues: (copy) v_u_2
	local v_u_4 = {}
	v_u_2({
		["Tag"] = p3,
		["OnInstanceAdded"] = function(p5)
			-- upvalues: (copy) v_u_4
			if not table.find(v_u_4, p5) then
				local v6 = v_u_4
				table.insert(v6, p5)
			end
		end,
		["OnInstanceRemoved"] = function(p7)
			-- upvalues: (copy) v_u_4
			local v8 = table.find(v_u_4, p7)
			if v8 then
				table.remove(v_u_4, v8)
			end
		end
	})
	return v_u_4
end