local v_u_1 = game:GetService("Players")
local v_u_2 = require(script.Parent.Parent.Internal.Network)
local v_u_3 = require(script.Parent.Parent.Parent.Signal)
local v_u_4 = require(script.Parent.Parent.Internal.Utils)
local v_u_5 = require(script.Parent.Parent.Internal.Signals)
require(script.Parent.Parent.Internal.Types)
local v_u_6 = require(script.Parent.Parent.Parent.Freeze)
local v_u_7 = 0
local v_u_8 = {}
local v_u_9 = {}
v_u_9.__index = v_u_9
function v_u_9.new(p10)
	-- upvalues: (ref) v_u_7, (copy) v_u_8, (copy) v_u_3, (copy) v_u_5, (copy) v_u_9, (copy) v_u_2
	local v11 = p10.Channel
	local v12 = type(v11) == "string"
	local v13 = p10.Channel
	local v14 = ("\"Channel\" expected string, got %*"):format((type(v13)))
	assert(v12, v14)
	local v15 = p10.ReplicateTo
	assert(v15, "ReplicateTo is required!")
	local v16 = p10.ReplicateTo
	local v17
	if v_u_7 + 1 > 65535 or #v_u_8 >= 16 then
		v17 = table.remove(v_u_8, 1)
	else
		v_u_7 = v_u_7 + 1
		v17 = v_u_7
	end
	assert(v17, "No available ID!")
	local v18 = v17 <= 65535
	local v19 = ("ID limit reached! You already have %* ServerReplions!"):format(65535)
	assert(v18, v19)
	local v20 = {
		["Data"] = p10.Data,
		["Channel"] = p10.Channel,
		["Tags"] = not p10.Tags and {} or p10.Tags,
		["ReplicateTo"] = v16,
		["DisableAutoDestroy"] = p10.DisableAutoDestroy,
		["_id"] = v17,
		["_packedId"] = utf8.char(v17),
		["_beforeDestroy"] = v_u_3.new(),
		["_signals"] = v_u_5.new(),
		["_replicateToChanged"] = v_u_3.new()
	}
	local v21 = v_u_9
	local v22 = setmetatable(v20, v21)
	v_u_2.sendTo(v16, "Added", v22:_serialize())
	return v22
end
function v_u_9.__tostring(p23)
	local v24 = p23.Channel
	local v25 = p23.ReplicateTo
	if type(v25) == "table" then
		local v26 = {}
		for v27, v28 in v25 do
			v26[v27] = v28.Name
		end
		v25 = table.concat(v26, ", ")
	elseif typeof(v25) == "Instance" then
		v25 = v25.Name
	end
	return ("Replion<%*:%*>"):format(v24, v25)
end
function v_u_9._serialize(p29)
	return {
		p29._packedId,
		p29.Channel,
		p29.Data,
		p29.ReplicateTo,
		p29.Tags
	}
end
function v_u_9.BeforeDestroy(p30, p31)
	return p30._beforeDestroy:Connect(p31)
end
function v_u_9.OnDataChange(p32, p33)
	return p32._signals:Connect("onDataChange", "__root", p33)
end
function v_u_9.OnChange(p34, p35, p36)
	return p34._signals:Connect("onChange", p35, p36)
end
function v_u_9.OnArrayInsert(p37, p38, p39)
	return p37._signals:Connect("onArrayInsert", p38, p39)
end
function v_u_9.OnArrayRemove(p40, p41, p42)
	return p40._signals:Connect("onArrayRemove", p41, p42)
end
function v_u_9.OnDescendantChange(p43, p44, p45)
	return p43._signals:Connect("onDescendantChange", p44, p45)
end
function v_u_9.SetReplicateTo(p46, p47)
	-- upvalues: (copy) v_u_1, (copy) v_u_2
	local v48
	if p47 == "All" or type(p47) == "table" then
		v48 = true
	elseif typeof(p47) == "Instance" then
		v48 = p47:IsA("Player")
	else
		v48 = false
	end
	assert(v48, "ReplicateTo must be a Player, a table of Players or \"All\"")
	local v49 = p46.ReplicateTo
	if v49 ~= p47 then
		local v50
		if v49 == "All" then
			v50 = v_u_1:GetPlayers()
		else
			v50 = type(v49) ~= "table" and { v49 } or v49
		end
		local v51
		if p47 == "All" then
			v51 = v_u_1:GetPlayers()
		else
			v51 = type(p47) ~= "table" and { p47 } or p47
		end
		for _, v52 in v50 do
			if not table.find(v51, v52) then
				v_u_2.sendTo(v52, "Removed", p46._packedId)
			end
		end
		for _, v53 in v51 do
			if not table.find(v50, v53) then
				v_u_2.sendTo(v53, "Added", p46:_serialize())
			end
		end
		p46.ReplicateTo = p47
		p46._replicateToChanged:Fire(p47, v49)
		v_u_2.sendTo(p47, "UpdateReplicateTo", p46._packedId, p47)
	end
end
function v_u_9.Set(p54, p55, p56)
	-- upvalues: (copy) v_u_4, (copy) v_u_6, (copy) v_u_2
	local v57 = v_u_4.getPathTable(p55)
	local v_u_58 = v_u_6.Dictionary.getIn(p54.Data, v57)
	if v_u_58 and v_u_6.Dictionary.equals(v_u_58, p56) then
		if _G.__DEV__ and (type(v_u_58) == "table" and v_u_58 == p56) then
			local v59, v60 = debug.info(2, "sl")
			local v61 = v_u_4.getPathString(p55)
			warn(("Warning: Skipping Replion:Set(\'%*\') due to identical table references.\n"):format(v61) .. ("Consider using Replion:Update(\'%*\') at %*:%* instead."):format(v61, v59, v60))
		end
		return v_u_58
	end
	if _G.__DEV__ and (type(v_u_58) == "table" and type(p56) == "table") then
		local v62 = v_u_6.Dictionary.keys(v_u_58)
		local v63 = v_u_6.Dictionary.keys(p56)
		if v_u_6.List.equals(v62, v63) then
			local v64, v65 = debug.info(2, "sl")
			local v66 = v_u_4.getPathString(p55)
			local v69 = v_u_6.Dictionary.filter(p56, function(p67, p68)
				-- upvalues: (ref) v_u_6, (copy) v_u_58
				return not v_u_6.Dictionary.equals(v_u_58[p68], p67)
			end)
			if v_u_6.Dictionary.count(v69) ~= v_u_6.Dictionary.count(p56) then
				local v70 = ""
				for v71, v72 in v69 do
					v70 = v70 .. ("\n\t%* = %*,"):format(v71, v72)
				end
				warn("Warning: Sending a table with identical keys but different values to the client.\n" .. ("Consider using Replion:Update(\'%*\', {%*\n}) at %*:%* for optimized updates."):format(v66, v70, v64, v65))
			end
		end
	end
	local v73 = v_u_6.Dictionary.setIn(p54.Data, v57, p56)
	local v74 = p54.Data
	p54.Data = v73
	p54._signals:FireEvent("onDataChange", "__root", v73, v57)
	p54._signals:FireChange(p55, v73, v74)
	v_u_2.sendTo(p54.ReplicateTo, "Set", p54._packedId, p55, p56)
	return p56
end
function v_u_9.Update(p75, p76, p77)
	-- upvalues: (copy) v_u_4, (copy) v_u_6, (copy) v_u_2
	local v78
	if p77 then
		v78 = v_u_4.getPathTable(p76)
	else
		v78 = nil
	end
	local v_u_79
	if v78 then
		v_u_79 = v_u_6.Dictionary.getIn(p75.Data, v78)
	else
		v_u_79 = p75.Data
	end
	local v82 = v_u_6.Dictionary.filter(p77 or p76, function(p80, p81)
		-- upvalues: (copy) v_u_79, (ref) v_u_6
		return not v_u_79 and true or not v_u_6.Dictionary.equals(v_u_79[p81], p80)
	end)
	if v_u_6.isEmpty(v82) then
		return
	end
	local v83 = p75.Data
	if v78 then
		local v84 = v_u_6.Dictionary.mergeIn(p75.Data, v78, v82)
		p75.Data = v84
		p75._signals:FireEvent("onDataChange", "__root", v84, v78)
		for v85, v86 in v82 do
			local v87 = v_u_6.List.push(v78, v85)
			local v88 = v_u_6.Dictionary.getIn(v83, v87)
			p75._signals:FireEvent("onChange", v87, v_u_4.getValue(v86), v88)
		end
		p75._signals:FireChange(p76, v84, v83)
	else
		local v89 = v_u_6.Dictionary.merge(p75.Data, v82)
		p75.Data = v89
		p75._signals:FireEvent("onDataChange", "__root", v89, {})
		for v90, v91 in v82 do
			p75._signals:FireEvent("onChange", v90, v_u_4.getValue(v91), v83[v90])
		end
	end
	local v92 = table.maxn(v82)
	local v_u_93 = nil
	if v92 > 0 then
		local v94 = 0
		for v95 in v82 do
			v94 = v94 + 1
			if v95 ~= v94 then
				v_u_93 = true
				break
			end
		end
		v_u_93 = v_u_93 or v94 ~= v92
		if _G.__DEV__ and v_u_93 then
			local v96, v97 = debug.info(2, "sl")
			warn("Warning: You\'re trying to send an unordered array to the client, RemotesEvents can\'t send unordered arrays.\n" .. "The array will be transformed into a dictionary to be sent to the client.\n" .. ("at %*:%*"):format(v96, v97))
		end
	end
	local v100 = v_u_6.Dictionary.map(v82, function(p98, p99)
		-- upvalues: (ref) v_u_6, (ref) v_u_4, (ref) v_u_93
		if p98 == v_u_6.None then
			p98 = v_u_4.SerializedNone
		end
		if v_u_93 then
			return p98, tostring(p99)
		else
			return p98, p99
		end
	end)
	if v78 then
		v_u_2.sendTo(p75.ReplicateTo, "Update", p75._packedId, p76, v100, v_u_93)
	else
		v_u_2.sendTo(p75.ReplicateTo, "Update", p75._packedId, v100, nil, v_u_93)
	end
end
function v_u_9.Increase(p101, p102, p103)
	-- upvalues: (copy) v_u_4
	local v104 = type(p103) == "number"
	local v105 = ("\"amount\" expected number, got %*"):format((type(p103)))
	assert(v104, v105)
	local v106 = p101:GetExpect(p102, (("\"%*\" is not a valid path!"):format((v_u_4.getPathString(p102)))))
	if p103 == 0 then
		return v106
	end
	if not _G.__DEV__ or type(v106) == "number" then
		return p101:Set(p102, v106 + p103)
	end
	local v107, v108 = debug.info(2, "sl")
	warn(("Warning: Attempt to increase non-numeric value at \"%*\"\n"):format((v_u_4.getPathString(p102))) .. ("Check if the path is correct at %*:%*."):format(v107, v108))
	return v106
end
function v_u_9.Decrease(p109, p110, p111)
	return p109:Increase(p110, -p111)
end
function v_u_9.Insert(p112, p113, p114, p115)
	-- upvalues: (copy) v_u_4, (copy) v_u_6, (copy) v_u_2
	local v116 = v_u_4.getPathTable(p113)
	local v117 = p112:GetExpect(p113, (("\"%*\" is not a valid path!"):format((v_u_4.getPathString(p113)))))
	local v118 = p115 or #v117 + 1
	local v119 = v_u_6.List.insert(v117, v118, p114)
	local v120 = p112.Data
	local v121 = v_u_6.Dictionary.setIn(p112.Data, v116, v119)
	p112.Data = v121
	p112._signals:FireEvent("onDataChange", "__root", v121, v116)
	p112._signals:FireEvent("onArrayInsert", v116, v118, p114)
	p112._signals:FireChange(v116, v121, v120)
	v_u_2.sendTo(p112.ReplicateTo, "ArrayUpdate", p112._packedId, "i", p113, p114, p115)
end
function v_u_9.Remove(p122, p123, p124)
	-- upvalues: (copy) v_u_4, (copy) v_u_6, (copy) v_u_2
	local v125 = v_u_4.getPathTable(p123)
	local v126 = p122:GetExpect(p123, (("\"%*\" is not a valid path!"):format((v_u_4.getPathString(p123)))))
	local v127 = p124 or #v126
	local v128 = v126[v127]
	local v129 = v_u_6.List.remove(v126, v127)
	local v130 = p122.Data
	local v131 = v_u_6.Dictionary.setIn(p122.Data, v125, v129)
	p122.Data = v131
	p122._signals:FireEvent("onDataChange", "__root", v131, v125)
	p122._signals:FireEvent("onArrayRemove", p123, v127, v128)
	p122._signals:FireChange(p123, v131, v130)
	v_u_2.sendTo(p122.ReplicateTo, "ArrayUpdate", p122._packedId, "r", p123, p124)
	return v128
end
function v_u_9.Clear(p132, p133)
	-- upvalues: (copy) v_u_4, (copy) v_u_6, (copy) v_u_2
	local v134 = p132:GetExpect(p133, (("\"%*\" is not a valid path!"):format((v_u_4.getPathString(p133)))))
	if not v_u_6.isEmpty(v134) then
		local v135 = v_u_4.getPathTable(p133)
		local v136 = p132.Data
		local v137 = v_u_6.Dictionary.setIn(p132.Data, v135, {})
		p132.Data = v137
		p132._signals:FireEvent("onDataChange", "__root", v137, v135)
		p132._signals:FireChange(p133, v137, v136)
		v_u_2.sendTo(p132.ReplicateTo, "ArrayUpdate", p132._packedId, "c", p133)
	end
end
function v_u_9.Find(p138, p139, p140)
	local v141 = p138:Get(p139)
	if v141 then
		local v142 = table.find(v141, p140)
		if v142 then
			return v142, p140
		end
	end
end
function v_u_9.Get(p143, p144)
	-- upvalues: (copy) v_u_6, (copy) v_u_4
	assert(p144, "Path is required!")
	local v145 = v_u_6.Dictionary.getIn(p143.Data, v_u_4.getPathTable(p144))
	if _G.__DEV__ and v145 == nil then
		local v146 = v_u_4.getPathTable(p144)
		for v147, v148 in v146 do
			if type(v148) == "string" then
				local v149 = v_u_4.trimString(v148)
				if v149 ~= v148 then
					local v150 = v_u_6.List.set(v146, v147, v149)
					if v_u_6.Dictionary.getIn(p143.Data, v150) then
						local v151, v152 = debug.info(2, "sl")
						warn(("Warning: the path \"%*\" has a key with leading or trailing whitespaces.\n"):format((v_u_4.getPathString(p144))) .. ("This is likely a mistake, consider using \"%*\" at %*:%* instead."):format(v_u_4.getPathString(v150), v151, v152))
					end
				end
			end
		end
	end
	return v145
end
function v_u_9.GetExpect(p153, p154, p155)
	-- upvalues: (copy) v_u_4
	assert(p154, "Path is required!")
	local v156 = p155 or ("\"%*\" is not a valid path!"):format((v_u_4.getPathString(p154)))
	local v157 = p153:Get(p154)
	if v157 == nil then
		error(v156)
	end
	return v157
end
function v_u_9.Destroy(p158)
	-- upvalues: (copy) v_u_2, (copy) v_u_8
	if not p158.Destroyed then
		p158._beforeDestroy:Fire()
		p158._beforeDestroy:DisconnectAll()
		p158._replicateToChanged:Destroy()
		p158._signals:Destroy()
		p158.Destroyed = true
		v_u_2.sendTo(p158.ReplicateTo, "Removed", p158._packedId)
		local v159 = v_u_8
		local v160 = p158._id
		table.insert(v159, v160)
	end
end
return v_u_9