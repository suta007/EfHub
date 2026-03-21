local v1 = {}
local v_u_2 = require(game.ReplicatedStorage.Field_Of_View_Module)
local v_u_3 = require(game.ReplicatedStorage.Blur_Module)
local v_u_4 = {}
function v1.Show(p5)
	-- upvalues: (copy) v_u_4, (copy) v_u_2, (copy) v_u_3
	if table.find(v_u_4, p5) == nil then
		local v6 = v_u_4
		table.insert(v6, p5)
	end
	v_u_2.Change_FOV(60, 0.3)
	v_u_3.Blur(15, 0.1)
end
function v1.Hide(p7)
	-- upvalues: (copy) v_u_4, (copy) v_u_2, (copy) v_u_3
	local v8 = table.find(v_u_4, p7)
	if v8 then
		table.remove(v_u_4, v8)
	end
	if #v_u_4 == 0 then
		v_u_2.Change_FOV_CORE(70, 0.3)
		v_u_2.Change_FOV(70, 0.3)
		v_u_3.Blur(0, 0.3)
	end
end
function v1.Can()
	-- upvalues: (copy) v_u_4
	return #v_u_4 == 0
end
return v1