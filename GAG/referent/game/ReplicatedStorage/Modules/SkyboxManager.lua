local v1 = {}
local v_u_2 = require(game.ReplicatedStorage.Modules.WeightedTable).new()
function v1.AddSkybox(p3, p4)
	-- upvalues: (copy) v_u_2
	v_u_2:Add(p3, p4 or 0)
end
function v1.UpdateSkybox(p5, p6)
	-- upvalues: (copy) v_u_2
	v_u_2:SetWeight(p5, p6)
end
local v_u_7 = nil
local function v9()
	-- upvalues: (copy) v_u_2, (ref) v_u_7
	local v8, _ = v_u_2:GetHighestObject()
	if v_u_7 then
		v_u_7.Parent = script
	end
	v_u_7 = v8
	v_u_7.Parent = game.Lighting
end
v1.AddSkybox(game.Lighting.Cartoon, 1)
v_u_2.OnUpdate:Connect(v9)
local v10, _ = v_u_2:GetHighestObject()
if v_u_7 then
	v_u_7.Parent = script
end
v_u_7 = v10
v_u_7.Parent = game.Lighting
return v1