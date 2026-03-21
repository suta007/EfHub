local v_u_1 = game:GetService("ProximityPromptService")
local v2 = {}
local v_u_3 = {}
local v_u_4 = {}
local function v_u_7()
	-- upvalues: (copy) v_u_3, (copy) v_u_4, (copy) v_u_1
	local v5 = false
	for _, v6 in ipairs(v_u_3) do
		if not v_u_4[v6] or #v_u_4[v6] == 0 then
			v5 = true
			break
		end
	end
	v_u_1.Enabled = not v5
end
function v2.AddDisabler(_, p8)
	-- upvalues: (copy) v_u_3, (copy) v_u_7
	if not table.find(v_u_3, p8) then
		local v9 = v_u_3
		table.insert(v9, p8)
		v_u_7()
	end
end
function v2.RemoveDisabler(_, p10)
	-- upvalues: (copy) v_u_3, (copy) v_u_7
	local v11 = table.find(v_u_3, p10)
	if v11 then
		table.remove(v_u_3, v11)
		v_u_7()
	end
end
function v2.AddTargetedOverride(_, p12, p13)
	-- upvalues: (copy) v_u_4, (copy) v_u_7
	if not v_u_4[p12] then
		v_u_4[p12] = {}
	end
	if not table.find(v_u_4[p12], p13) then
		local v14 = v_u_4[p12]
		table.insert(v14, p13)
		v_u_7()
	end
end
function v2.RemoveTargetedOverride(_, p15, p16)
	-- upvalues: (copy) v_u_4, (copy) v_u_7
	if v_u_4[p15] then
		local v17 = table.find(v_u_4[p15], p16)
		if v17 then
			table.remove(v_u_4[p15], v17)
			v_u_7()
		end
	end
end
return v2