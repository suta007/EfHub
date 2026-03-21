local v_u_1 = {
	["Instances"] = {}
}
v_u_1.__index = v_u_1
function v_u_1.new()
	-- upvalues: (copy) v_u_1
	local v2 = Instance.new("BindableEvent")
	v2.Parent = script
	local v3 = {
		["OnUpdate"] = v2.Event,
		["Event"] = v2
	}
	local v4 = v_u_1
	setmetatable(v3, v4)
	return v3
end
function v_u_1.Add(p5, p6, p7)
	local v8 = game:GetService("HttpService"):GenerateGUID()
	p5.Instances[p6] = p7 or 1
	return v8
end
function v_u_1.SetWeight(p9, p10, p11)
	if p9.Instances[p10] then
		p9.Instances[p10] = p11
	end
	p9.Event:Fire()
end
function v_u_1.GetHighestObject(p12)
	local v13 = nil
	local v14 = nil
	for v15, v16 in p12.Instances do
		if v13 == nil or v13 <= v16 then
			v14 = v15
			v13 = v16
		end
	end
	return v14, v13
end
return v_u_1