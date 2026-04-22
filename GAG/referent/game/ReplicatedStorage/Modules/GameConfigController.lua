game:GetService("HttpService")
local v1 = game:GetService("ReplicatedStorage")
local v_u_2 = game:GetService("HttpService")
local v_u_3 = require(v1.Data.ConfigRegistry)
return {
	["GetConfig"] = function(_, p4)
		-- upvalues: (copy) v_u_3, (copy) v_u_2
		local v_u_5 = workspace:GetAttribute(p4)
		if not v_u_5 then
			return v_u_3[p4]
		end
		if typeof(v_u_5) == "string" then
			local v6, v7 = pcall(function()
				-- upvalues: (ref) v_u_2, (copy) v_u_5
				return v_u_2:JSONDecode(v_u_5)
			end)
			if v6 then
				return v7
			end
		end
		return v_u_5
	end
}