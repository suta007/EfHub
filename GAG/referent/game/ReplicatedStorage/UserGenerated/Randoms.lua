require(game.ReplicatedStorage.UserGenerated.Randoms.Base)
local v_u_1 = require(game.ReplicatedStorage.UserGenerated.Randoms.Xorshift128)
local v4 = {
	["DefaultXorshift128"] = v_u_1.R,
	["Xorshift128"] = function(p2)
		-- upvalues: (copy) v_u_1
		return v_u_1.new(p2)
	end,
	["UniqueXorshift128"] = function(p3)
		-- upvalues: (copy) v_u_1
		return v_u_1.Unique(p3)
	end
}
return table.freeze(v4)