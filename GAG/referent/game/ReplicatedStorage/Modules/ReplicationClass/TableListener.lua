game:GetService("ReplicatedStorage")
game:GetService("HttpService")
local _ = script.Parent
local v_u_1 = require(script:WaitForChild("Signal"))
local v_u_2 = {}
v_u_2.__index = v_u_2
function v_u_2.new(p3)
	-- upvalues: (copy) v_u_2
	local v4 = v_u_2
	return setmetatable({
		["Table"] = p3,
		["PathRegistry"] = {}
	}, v4)
end
function v_u_2.Destroy(p5)
	for _, v6 in p5.PathRegistry do
		v6:Destroy()
	end
end
function v_u_2.GetTable(p7)
	return p7.Table
end
function v_u_2.FindPathSignal(p8, p9)
	local v10 = p8.PathRegistry
	if v10[p9] then
		return v10[p9]
	end
end
function v_u_2.FreePathSignal(p11, p12)
	p11.PathRegistry[p12] = nil
end
function v_u_2.GetPathSignal(p13, p14)
	-- upvalues: (copy) v_u_1
	local v15 = p13:FindPathSignal(p14)
	if v15 then
		return v15
	end
	local v16 = p13.PathRegistry
	local v17 = v_u_1.new()
	v16[("%*"):format(p14)] = v17
	return v17
end
return v_u_2