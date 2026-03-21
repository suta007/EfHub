local v1 = game:GetService("ReplicatedStorage")
local v_u_2 = require(v1.GameAnalytics.GameAnalytics.HttpApi.HashLib)
return {
	["SeedCombine32"] = function(_, p3)
		-- upvalues: (copy) v_u_2
		local v4 = table.create(#p3)
		for v5, v6 in p3 do
			local v7 = bit32.band(v6, 255)
			local v8 = bit32.rshift(v6, 8)
			local v9 = bit32.band(v8, 255)
			local v10 = bit32.rshift(v6, 16)
			local v11 = bit32.band(v10, 255)
			local v12 = bit32.rshift(v6, 24)
			local v13 = bit32.band(v12, 255)
			v4[v5] = string.char(v7, v9, v11, v13)
		end
		local v14 = v_u_2.sha256(table.concat(v4)):sub(1, 8)
		return tonumber(v14, 16)
	end
}