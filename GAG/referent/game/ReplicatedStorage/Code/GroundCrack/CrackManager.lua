local v1 = {}
local v_u_2 = {}
function v1.add(_, p3)
	-- upvalues: (ref) v_u_2
	local v4 = v_u_2
	table.insert(v4, p3)
end
function v1.remove(_, p5)
	-- upvalues: (ref) v_u_2
	for v6, v7 in ipairs(v_u_2) do
		if v7 == p5 then
			if v6 ~= #v_u_2 then
				v_u_2[v6] = v_u_2[#v_u_2]
			end
			v_u_2[#v_u_2] = nil
			return
		end
	end
end
function v1.updateAllCameras(_)
	-- upvalues: (ref) v_u_2
	for _, v8 in ipairs(v_u_2) do
		v8:updateCamera()
	end
end
function v1.getActiveCracks(_)
	-- upvalues: (ref) v_u_2
	return v_u_2
end
function v1.clearAll(_)
	-- upvalues: (ref) v_u_2
	for v9 = #v_u_2, 1, -1 do
		v_u_2[v9]:Destroy()
	end
	v_u_2 = {}
end
return v1