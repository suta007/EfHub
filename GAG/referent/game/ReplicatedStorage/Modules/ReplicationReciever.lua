local v1 = game:GetService("ReplicatedStorage"):WaitForChild("GameEvents"):WaitForChild("DataStream2")
local _ = script.Parent
require(script:WaitForChild("Signal"))
local v_u_2 = require(script:WaitForChild("PathSignalClass"))
local v_u_3 = require(script:WaitForChild("DeepClone"))
local v_u_4 = {}
local v_u_5 = {}
v_u_5.__index = v_u_5
function v_u_5.new(p6)
	-- upvalues: (copy) v_u_5
	local v7 = v_u_5
	local v8 = setmetatable({}, v7)
	v8.Name = p6
	return v8
end
function v_u_5.GetChannelData(p9)
	-- upvalues: (copy) v_u_4
	return v_u_4[p9.Name]
end
function v_u_5.GetChannelDataAsync(p10, p11)
	local v12 = p10:GetChannelData()
	if v12 then
		::l2::
		return v12
	else
		local v13 = 0
		local v14 = p11 or (1 / 0)
		while true do
			v13 = v13 + task.wait()
			v12 = p10:GetChannelData()
			if v14 <= v13 then
				return v12
			end
			if v12 then
				goto l2
			end
		end
	end
end
function v_u_5.GetData(p15)
	-- upvalues: (copy) v_u_4
	local v16 = v_u_4[p15.Name]
	if v16 then
		return v16.Table
	end
end
function v_u_5.Destroy(p17)
	-- upvalues: (copy) v_u_4
	v_u_4[p17.Name] = nil
end
function v_u_5.GetDataAsync(p18, p19)
	return p18:GetChannelDataAsync(p19).Table
end
function v_u_5.GetPathSignal(p20, p21)
	local v22 = p20:GetChannelDataAsync()
	if v22 then
		return v22:GetPathSignal(p21)
	end
end
local v_u_46 = {
	["InitData"] = function(p23, p24)
		-- upvalues: (copy) v_u_4, (copy) v_u_2
		if p23 and p24 then
			v_u_4[p23] = v_u_2.new(p24)
		end
	end,
	["UpdateData"] = function(p25, p26)
		-- upvalues: (copy) v_u_4, (copy) v_u_3
		local v_u_27 = v_u_4[p25]
		if v_u_27 then
			for _, v_u_28 in p26 do
				task.spawn(function()
					-- upvalues: (copy) v_u_27, (copy) v_u_28, (ref) v_u_3
					local v29 = v_u_27:GetTable()
					local v30 = v_u_28[1]
					local v31 = v_u_28[2]
					local v32 = v30:split("/")
					if #v32 < 1 then
						return
					end
					table.remove(v32, 1)
					local v33 = table.concat(v32, "/", 1, #v32)
					local v34 = table.concat(v32, "/", 1, #v32 == 1 and 1 or #v32 - 1)
					local v35 = v29[v32[#v32]]
					local v36 = nil
					for v37, v38 in v32 do
						local v39 = tonumber(v38) or v38
						if v36 then
							v36 = ("%*/%*"):format(v36, v39)
						else
							v36 = v39
						end
						local v40 = v_u_27:FindPathSignal((("%*/@"):format(v36)))
						if v40 then
							v40:Fire(v39, v31, v33, v35)
						end
						if v37 == #v32 then
							if type(v31) == "table" then
								local v41 = v29[v39]
								if type(v41) == "table" then
									v29[v39] = v_u_3(v31)
									goto l18
								end
							end
							v29[v39] = v31
							::l18::
							local v42 = v_u_27:FindPathSignal((("%*"):format(v34)))
							if v42 then
								v42:Fire(v39, v31, v35, v34)
							end
							local v43 = v_u_27:FindPathSignal((("%*/*"):format(v34)))
							if v43 then
								v43:Fire(v39, v31, v35, v33)
							end
							local v44 = v_u_27:FindPathSignal((("%*/%*"):format(v34, v39)))
							if v44 then
								v44:Fire()
								return
							end
							break
						end
						local v45 = v29[v39] or {}
						v29[v39] = v45
						if v39 == #v32 - 1 then
							v29 = v45
						else
							v29 = v45
						end
					end
				end)
			end
		end
	end
}
v1.OnClientEvent:Connect(function(...)
	-- upvalues: (copy) v_u_46
	local v47 = { ... }
	local v48 = v47[1]
	table.remove(v47, 1)
	local v49 = v_u_46[v48]
	if v49 then
		v49(unpack(v47))
	end
end)
return v_u_5