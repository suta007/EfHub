local v_u_1 = require(script.Parent.Parent.Parent.Freeze)
local v_u_2 = require(script.Parent.Parent.Internal.Utils)
local v_u_3 = require(script.Parent.Parent.Parent.Signal)
require(script.Parent.Parent.Internal.Types)
local v_u_4 = require(script.Parent.Parent.Internal.Signals)
local v_u_5 = {}
v_u_5.__index = v_u_5
function v_u_5.new(p6)
	-- upvalues: (copy) v_u_3, (copy) v_u_4, (copy) v_u_5
	local v7 = {
		["Data"] = p6[3],
		["Tags"] = p6[5],
		["ReplicateTo"] = p6[4],
		["_channel"] = p6[2],
		["_beforeDestroy"] = v_u_3.new(),
		["_signals"] = v_u_4.new()
	}
	local v8 = v_u_5
	return setmetatable(v7, v8)
end
function v_u_5.__tostring(p9)
	return ("Replion<%*>"):format(p9._channel)
end
function v_u_5.BeforeDestroy(p10, p11)
	return p10._beforeDestroy:Connect(p11)
end
function v_u_5.OnDataChange(p12, p13)
	return p12._signals:Connect("onDataChange", "__root", p13)
end
function v_u_5.OnChange(p14, p15, p16)
	return p14._signals:Connect("onChange", p15, p16)
end
function v_u_5.OnDescendantChange(p17, p18, p19)
	return p17._signals:Connect("onDescendantChange", p18, p19)
end
function v_u_5.OnArrayInsert(p20, p21, p22)
	return p20._signals:Connect("onArrayInsert", p21, p22)
end
function v_u_5.OnArrayRemove(p23, p24, p25)
	return p23._signals:Connect("onArrayRemove", p24, p25)
end
function v_u_5._set(p26, p27, p28)
	-- upvalues: (copy) v_u_2, (copy) v_u_1
	local v29 = v_u_2.getPathTable(p27)
	if v_u_1.Dictionary.getIn(p26.Data, v29) == p28 then
		return p28
	end
	local v30 = v_u_1.Dictionary.setIn(p26.Data, v29, p28)
	local v31 = p26.Data
	p26.Data = v30
	p26._signals:FireEvent("onDataChange", "__root", v30, v29)
	p26._signals:FireChange(p27, v30, v31)
	return p28
end
function v_u_5._update(p32, p33, p34, p_u_35)
	-- upvalues: (copy) v_u_1, (copy) v_u_2
	local v38 = v_u_1.Dictionary.map(p34 or p33, function(p36, p37)
		-- upvalues: (ref) v_u_2, (ref) v_u_1, (copy) p_u_35
		if p36 == v_u_2.SerializedNone then
			p36 = v_u_1.None
		end
		if p_u_35 then
			return p36, tonumber(p37)
		else
			return p36, p37
		end
	end)
	local v39 = p32.Data
	if p34 == nil then
		local v40 = v_u_1.Dictionary.merge(p32.Data, v38)
		p32.Data = v40
		p32._signals:FireEvent("onDataChange", "__root", v40, {})
		for v41, v42 in v38 do
			p32._signals:FireEvent("onChange", v41, v_u_2.getValue(v42), v39[v41])
		end
	else
		local v43 = v_u_2.getPathTable(p33)
		local v44 = v_u_1.Dictionary.mergeIn(p32.Data, v43, v38)
		p32.Data = v44
		p32._signals:FireEvent("onDataChange", "__root", v44, v43)
		for v45, v46 in v38 do
			local v47 = v_u_1.List.push(v43, v45)
			local v48 = v_u_1.Dictionary.getIn(v39, v47)
			p32._signals:FireEvent("onChange", v47, v_u_2.getValue(v46), v48)
		end
		p32._signals:FireChange(p33, v44, v39)
	end
end
function v_u_5._increase(p49, p50, p51)
	return p49:_set(p50, p49:GetExpect(p50) + p51)
end
function v_u_5._decrease(p52, p53, p54)
	return p52:_increase(p53, -p54)
end
function v_u_5._insert(p55, p56, p57, p58)
	-- upvalues: (copy) v_u_2, (copy) v_u_1
	local v59 = v_u_2.getPathTable(p56)
	local v60 = v_u_1.Dictionary.getIn(p55.Data, v59)
	local v61 = ("\"%*\" is not a valid path!"):format((v_u_2.getPathString(p56)))
	local v62 = assert(v60, v61)
	local v63 = p58 or #v62 + 1
	local v64 = v_u_1.List.insert(v62, v63, p57)
	local v65 = p55.Data
	local v66 = v_u_1.Dictionary.setIn(p55.Data, v59, v64)
	p55.Data = v66
	p55._signals:FireEvent("onDataChange", "__root", v66, v59)
	p55._signals:FireEvent("onArrayInsert", v59, v63, p57)
	p55._signals:FireChange(v59, v66, v65)
end
function v_u_5._remove(p67, p68, p69)
	-- upvalues: (copy) v_u_2, (copy) v_u_1
	local v70 = v_u_2.getPathTable(p68)
	local v71 = v_u_1.Dictionary.getIn(p67.Data, v70)
	local v72 = ("\"%*\" is not a valid path!"):format((v_u_2.getPathString(p68)))
	local v73 = assert(v71, v72)
	local v74 = p69 or #v73
	local v75 = v73[v74]
	local v76 = v_u_1.List.remove(v73, v74)
	local v77 = p67.Data
	local v78 = v_u_1.Dictionary.setIn(p67.Data, v70, v76)
	p67.Data = v78
	p67._signals:FireEvent("onDataChange", "__root", v78, v70)
	p67._signals:FireEvent("onArrayRemove", p68, v74, v75)
	p67._signals:FireChange(p68, v78, v77)
	return v75
end
function v_u_5._clear(p79, p80)
	-- upvalues: (copy) v_u_2, (copy) v_u_1
	local v81 = v_u_2.getPathTable(p80)
	local v82 = p79.Data
	local v83 = v_u_1.Dictionary.setIn(p79.Data, v81, {})
	p79.Data = v83
	p79._signals:FireEvent("onDataChange", "__root", v83, v81)
	p79._signals:FireChange(p80, v83, v82)
end
function v_u_5.Find(p84, p85, p86)
	local v87 = p84:Get(p85)
	if v87 then
		local v88 = table.find(v87, p86)
		if v88 then
			return v88, p86
		end
	end
end
function v_u_5.Get(p89, p90)
	-- upvalues: (copy) v_u_1, (copy) v_u_2
	return v_u_1.Dictionary.getIn(p89.Data, v_u_2.getPathTable(p90))
end
function v_u_5.GetExpect(p91, p92, p93)
	-- upvalues: (copy) v_u_2
	assert(p92, "Path is required!")
	local v94 = p93 or ("\"%*\" is not a valid path!"):format((v_u_2.getPathString(p92)))
	local v95 = p91:Get(p92)
	if v95 == nil then
		error(v94)
	end
	return v95
end
function v_u_5.Destroy(p96)
	if not p96.Destroyed then
		p96._beforeDestroy:Fire()
		p96._beforeDestroy:DisconnectAll()
		p96._signals:Destroy()
		p96.Destroyed = true
	end
end
return v_u_5