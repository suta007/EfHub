local v1 = game:GetService("ReplicatedStorage")
v1:WaitForChild("Modules")
local v_u_2 = v1:WaitForChild("GameEvents"):WaitForChild("DataStream")
local v3 = require(script:WaitForChild("class"))
local v_u_4 = require(script:WaitForChild("Signal"))
local v_u_5 = require(script:WaitForChild("TableListener"))
local v_u_6 = require(script:WaitForChild("DeepClone"))
local v_u_7 = {}
local v_u_8 = {}
v_u_2.OnClientEvent:Connect(function(...)
	-- upvalues: (copy) v_u_7, (copy) v_u_5, (copy) v_u_6, (copy) v_u_8
	local v9 = { ... }
	local v10 = v9[1]
	if v10 == "InitData" then
		local v11 = v9[2]
		local v12 = v9[3]
		if v11 and v12 then
			v_u_7[v11] = v_u_5.new(v12)
		end
	else
		if v10 == "UpdateData" then
			local v_u_13 = v9[2]
			local v_u_14 = v_u_7[v_u_13]
			if not v_u_14 then
				return
			end
			for _, v_u_15 in v9[3] do
				task.spawn(function()
					-- upvalues: (copy) v_u_14, (copy) v_u_15, (ref) v_u_6, (ref) v_u_8, (copy) v_u_13
					local v16 = v_u_14:GetTable()
					local v17 = v_u_15[1]
					local v18 = v_u_15[2]
					local v19 = v17:split("/")
					if #v19 < 1 then
						return
					end
					table.remove(v19, 1)
					local v20 = table.concat(v19, "/", 1, #v19)
					local v21 = table.concat(v19, "/", 1, #v19 == 1 and 1 or #v19 - 1)
					local v22 = nil
					for v23, v24 in v19 do
						local v25 = tonumber(v24) or v24
						if v22 then
							v22 = ("%*/%*"):format(v22, v25)
						else
							v22 = v25
						end
						local v26 = v_u_14:FindPathSignal((("%*/@"):format(v22)))
						if v26 then
							v26:Fire(v25, v18, v20)
						end
						if v23 == #v19 then
							local v27 = v16[v25]
							if type(v18) == "table" then
								local v28 = v16[v25]
								if type(v28) == "table" then
									v16[v25] = v_u_6(v18)
									goto l18
								end
							end
							v16[v25] = v18
							::l18::
							local v29 = v_u_14:FindPathSignal((("%*"):format(v21)))
							if v29 then
								v29:Fire(v25, v18, v27, v21)
							end
							local v30 = v_u_14:FindPathSignal((("%*/*"):format(v21)))
							if v30 then
								v30:Fire(v25, v18, v27, v20)
							end
							local v31 = v_u_8[v_u_13]
							if v31 then
								v31.GlobalChanged:Fire(v25, v18, v27, v20)
							end
							local v32 = v_u_14:FindPathSignal((("%*/%*"):format(v21, v25)))
							if v32 then
								v32:Fire()
								return
							end
							break
						end
						local v33 = v16[v25] or {}
						v16[v25] = v33
						if v25 == #v19 - 1 then
							v16 = v33
						else
							v16 = v33
						end
					end
				end)
			end
		end
		return
	end
end)
local v36 = v3({
	["Constructor"] = function(p34, p35)
		-- upvalues: (copy) v_u_4, (copy) v_u_2, (copy) v_u_8
		p34.Name = p35
		p34.GlobalChanged = v_u_4.new()
		v_u_2:FireServer("InitData")
		v_u_8[p35] = p34
	end,
	["Data"] = nil
})
function v36.GetData(p37)
	-- upvalues: (copy) v_u_7
	return v_u_7[p37.Name]
end
function v36.YieldUntilData(p38, p39)
	local v40 = os.clock()
	local v41 = p39 or (1 / 0)
	while true do
		local v42 = p38:GetData()
		if v42 or v41 <= os.clock() - v40 then
			break
		end
		task.wait()
	end
	return v42
end
function v36.GetPathSignal(p43, p44)
	local v45 = p43:YieldUntilData()
	if v45 then
		return v45:GetPathSignal(p44)
	end
end
return v36