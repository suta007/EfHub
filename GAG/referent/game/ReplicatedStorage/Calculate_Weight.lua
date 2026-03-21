local v1 = {}
local v_u_2 = require(game.ReplicatedStorage.Item_Module)
function v1.Calculate_Weight(p3, p4)
	-- upvalues: (copy) v_u_2
	local v5 = Random.new(p3)
	local v6 = v_u_2.Return_Data(p4)
	if v6 then
		local v7 = v5:NextInteger(700, 1400) * 0.001
		if v6[4] ~= 0 and v5:NextInteger(1, v6[4]) == 1 then
			v7 = v7 * v5:NextInteger(3, 4)
		end
		return v6[2] * v7, v7
	end
end
return v1