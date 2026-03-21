local v_u_1 = {}
v_u_1.__index = v_u_1
function v_u_1.new(p2)
	-- upvalues: (copy) v_u_1
	local v3 = v_u_1
	local v4 = setmetatable({}, v3)
	v4.Scale = p2.Scale
	v4.Mode = p2.Mode or "Vector3"
	v4.Nodes = {}
	return v4
end
function v_u_1.NormalizePosition(p5, p6)
	local v7 = p5.Mode
	if typeof(p6) ~= v7 then
		return error(("HashMap expected %*, but got %*"):format(v7, p6), 2)
	end
	local v8 = p5.Scale
	if v7 == "Vector2" then
		local v9 = Vector2.new
		local v10 = p6.X / v8 + 0.5
		local v11 = math.floor(v10) * v8
		local v12 = p6.Y / v8 + 0.5
		v19 = v9(v11, math.floor(v12) * v8)
		if v19 then
			::l5::
			return v19
		end
	end
	local v13 = p6.X / v8 + 0.5
	local v14 = math.floor(v13) * v8
	local v15 = p6.Y / v8 + 0.5
	local v16 = math.floor(v15) * v8
	local v17 = p6.Z / v8 + 0.5
	local v18 = math.floor(v17) * v8
	local v19 = Vector3.new(v14, v16, v18)
	goto l5
end
function v_u_1.ClearNeighbors(p20, p21)
	local v22 = p20.Mode
	local v23 = p20.Scale
	local v24 = p20.Nodes
	local v25 = p21.Range / v23 + 0.5
	local v26 = math.floor(v25) * v23 * v23
	local v27 = p20:NormalizePosition(p21.Position)
	local v28 = v27.X
	local v29 = v27.Y
	local v30
	if v22 == "Vector3" then
		v30 = v27.Z
	else
		v30 = false
	end
	local v31 = v28 - v26
	local v32 = v29 - v26
	local v33
	if v22 == "Vector3" then
		v33 = v30 - v26
	else
		v33 = false
	end
	local v34 = v28 + v26
	local v35 = v29 + v26
	local v36
	if v22 == "Vector3" then
		v36 = v30 + v26
	else
		v36 = false
	end
	if v22 == "Vector2" then
		for v37 = v31, v34, v23 do
			local v38 = v24[v37]
			if v38 then
				for v39 = v32, v35, v23 do
					local v40 = v38[v39]
					if v40 then
						table.clear(v40)
					end
				end
			end
		end
	else
		for v41 = v31, v34, v23 do
			local v42 = v24[v41]
			if v42 then
				for v43 = v32, v35, v23 do
					local v44 = v42[v43]
					if v44 then
						for v45 = v33, v36, v23 do
							local v46 = v44[v45]
							if v46 then
								table.clear(v46)
							end
						end
					end
				end
			end
		end
	end
end
function v_u_1.GetTableFor(p47, p48)
	local v49 = p47:NormalizePosition(p48)
	local v50 = p47.Nodes
	local v51 = p47.Mode
	local v52 = v49.X
	local v53 = v49.Y
	local v54
	if v51 == "Vector3" then
		v54 = v49.Z
	else
		v54 = false
	end
	if v51 == "Vector2" then
		if not v50[v52] then
			v50[v52] = {}
		end
		if not v50[v52][v53] then
			v50[v52][v53] = {}
		end
		return v50[v52][v53]
	end
	if v51 == "Vector3" then
		if not v50[v52] then
			v50[v52] = {}
		end
		if not v50[v52][v53] then
			v50[v52][v53] = {}
		end
		if not v50[v52][v53][v54] then
			v50[v52][v53][v54] = {}
		end
		return v50[v52][v53][v54]
	end
end
function v_u_1.Insert(p55, p56)
	local v57 = p55:GetTableFor(p56.Position)
	local v58 = p56.Hashed
	table.insert(v57, v58)
end
function v_u_1.Remove(p59, p60)
	local v61 = p59:GetTableFor(p60.Position)
	local v62 = table.find(v61, p60.Hashed)
	if v62 then
		table.remove(v61, v62)
	end
end
function v_u_1.GetNeighbors(p63, p64)
	local v65 = {}
	local v66 = p63.Mode
	local v67 = p63.Scale
	local v68 = p63.Nodes
	local v69 = p64.Range / v67 + 0.5
	local v70 = math.floor(v69) * v67 * v67
	local v71 = p63:NormalizePosition(p64.Position)
	local v72 = v71.X
	local v73 = v71.Y
	local v74
	if v66 == "Vector3" then
		v74 = v71.Z
	else
		v74 = false
	end
	local v75 = v72 - v70
	local v76 = v73 - v70
	local v77
	if v66 == "Vector3" then
		v77 = v74 - v70
	else
		v77 = false
	end
	local v78 = v72 + v70
	local v79 = v73 + v70
	local v80
	if v66 == "Vector3" then
		v80 = v74 + v70
	else
		v80 = false
	end
	if v66 == "Vector2" then
		for v81 = v75, v78, v67 do
			local v82 = v68[v81]
			if v82 then
				for v83 = v76, v79, v67 do
					local v84 = v82[v83]
					if v84 then
						for _, v85 in v84 do
							table.insert(v65, v85)
						end
					end
				end
			end
		end
		return v65
	else
		for v86 = v75, v78, v67 do
			local v87 = v68[v86]
			if v87 then
				for v88 = v76, v79, v67 do
					local v89 = v87[v88]
					if v89 then
						for v90 = v77, v80, v67 do
							local v91 = v89[v90]
							if v91 then
								for _, v92 in v91 do
									table.insert(v65, v92)
								end
							end
						end
					end
				end
			end
		end
		return v65
	end
end
function v_u_1.GetOne(p93, p94)
	local v95 = p93.Mode
	local v96 = p93.Scale
	local v97 = p93.Nodes
	local v98 = p94.Range / v96 + 0.5
	local v99 = math.floor(v98) * v96 * v96
	local v100 = p93:NormalizePosition(p94.Position)
	local v101 = v100.X
	local v102 = v100.Y
	local v103
	if v95 == "Vector3" then
		v103 = v100.Z
	else
		v103 = false
	end
	local v104 = v101 - v99
	local v105 = v102 - v99
	local v106
	if v95 == "Vector3" then
		v106 = v103 - v99
	else
		v106 = false
	end
	local v107 = v101 + v99
	local v108 = v102 + v99
	local v109
	if v95 == "Vector3" then
		v109 = v103 + v99
	else
		v109 = false
	end
	if v95 == "Vector2" then
		for v110 = v104, v107, v96 do
			local v111 = v97[v110]
			if v111 then
				for v112 = v105, v108, v96 do
					local v113 = v111[v112]
					if v113 then
						local _, v114 = next(v113)
						return v114
					end
				end
			end
		end
	else
		for v115 = v104, v107, v96 do
			local v116 = v97[v115]
			if v116 then
				for v117 = v105, v108, v96 do
					local v118 = v116[v117]
					if v118 then
						for v119 = v106, v109, v96 do
							local v120 = v118[v119]
							if v120 then
								local _, v121 = next(v120)
								return v121
							end
						end
					end
				end
			end
		end
	end
end
return v_u_1