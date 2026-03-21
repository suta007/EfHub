local v_u_1 = {}
local v2 = {
	["Trowel"] = {
		["Uses"] = 5
	},
	["Watering Can"] = {
		["Uses"] = 10
	},
	["Lightning Rod"] = {},
	["Sprinkler"] = {}
}
v_u_1.DefaultData = v2
function v_u_1.GetDefaultData(_, p3)
	-- upvalues: (copy) v_u_1
	return v_u_1.DefaultData[p3] or nil
end
return v_u_1