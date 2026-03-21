local v_u_1 = game:GetService("Players")
local v2 = game:GetService("ReplicatedStorage")
local v_u_3 = require(v2.Modules.GetFarm)
local v_u_4 = require(v2.Modules.TradeControllers.TradeWorldController)
return function(p5)
	-- upvalues: (copy) v_u_4, (copy) v_u_3, (copy) v_u_1
	if v_u_4:IsInWorld() then
		return nil
	end
	local v6 = v_u_3(p5)
	if v6 then
		return v6
	end
	repeat
		task.wait()
		local v7 = v_u_3(p5)
	until not p5:IsDescendantOf(v_u_1) or v7
	return v7
end