local v_u_1 = game:GetService("MemoryStoreService")
local v2 = game:GetService("ReplicatedStorage")
local v_u_3 = game:GetService("DataStoreService")
local v_u_4 = game:GetService("RunService")
local v_u_5 = require(v2.FFlags.Packages.Replion)
local v6 = require(v2.Modules.Signal)
require(script.Parent.Types)
local v_u_7 = require(script.Parent.Environments)
local v_u_8 = require(script.Parent.Overrides)
local v_u_9 = game.GameId == 7436755782 and not v_u_4:IsStudio() and 15 or 2
local v_u_10 = game.GameId == 7436755782 and not v_u_4:IsStudio() and 8 or 2
local v_u_11 = Random.new()
local v_u_12 = nil
local v_u_13 = nil
local v14 = {
	["_loaded"] = false,
	["_loadedSignal"] = v6.new(),
	["_updatedSignal"] = v6.new()
}
local function v_u_20(p15, p16)
	-- upvalues: (copy) v_u_3
	local v17 = os.clock()
	local v18 = v17
	local v19 = p16 or 10
	while v_u_3:GetRequestBudgetForRequestType(p15) < 1 and v17 - v18 < v19 do
		task.wait()
		v17 = os.clock()
	end
	return v17 - v18 < v19
end
function v14.IsLoaded(p21)
	return p21._loaded
end
function v14.OnLoad(p22, p23)
	return p22._loadedSignal:Connect(p23)
end
function v14.OnUpdate(p24, p25)
	return p24._updatedSignal:Connect(p25)
end
function v14.OnChange(_, p26, p27)
	-- upvalues: (ref) v_u_13
	return v_u_13:OnChange({ "Values", p26 }, p27)
end
function v14.Get(p28, p29, p30)
	-- upvalues: (ref) v_u_13
	if not p28:IsLoaded() then
		p28._loadedSignal:Wait()
	end
	local v31 = v_u_13:Get({ "Values", p29 })
	if v31 == nil then
		return p30
	else
		return v31
	end
end
function v14.GetInstant(_, p32, p33)
	-- upvalues: (ref) v_u_13
	local v34 = v_u_13:Get({ "Values", p32 })
	if v34 == nil then
		return p33
	else
		return v34
	end
end
function v14.Set(_, p_u_35, p_u_36, p_u_37)
	-- upvalues: (ref) v_u_12, (ref) v_u_13, (copy) v_u_8, (copy) v_u_9, (copy) v_u_1, (copy) v_u_10, (copy) v_u_3, (copy) v_u_20
	if p_u_37 == v_u_12 or (p_u_37 == "all" or p_u_37 == "local") then
		v_u_13:Set({ "Values", p_u_35 }, p_u_36)
		v_u_13:Set("LastChange", workspace:GetServerTimeNow())
	end
	if p_u_37 == "local" then
		if not v_u_8[v_u_12] then
			v_u_8[v_u_12] = {}
		end
		v_u_8[v_u_12][p_u_35] = p_u_36
		return true
	end
	local function v_u_53(p38)
		-- upvalues: (copy) p_u_36, (copy) p_u_35, (copy) p_u_37
		local v39 = DateTime.now().UnixTimestamp
		local v40
		if p38 and typeof(p38) == "table" then
			local v41 = p38.Values
			v40 = typeof(v41) ~= "table" and {
				["Values"] = {},
				["LastUpdate"] = v39
			} or p38
		else
			v40 = {
				["Values"] = {},
				["LastUpdate"] = v39
			}
		end
		if p_u_36 ~= nil then
			local v42 = false
			for _, v43 in v40.Values do
				local v44 = v43[1]
				local v45 = v43[3]
				if p_u_35 == v44 and p_u_37 == v45 then
					v42 = true
					v43[2] = p_u_36
					if p_u_37 == nil then
						table.remove(v43, 3)
					else
						v43[3] = p_u_37
					end
				end
			end
			if not v42 then
				local v46 = { p_u_35, p_u_36 }
				if p_u_37 ~= nil then
					local v47 = p_u_37
					table.insert(v46, v47)
				end
				local v48 = v40.Values
				table.insert(v48, v46)
			end
			v40.LastUpdate = DateTime.now().UnixTimestamp
			return v40
		end
		for v49 = #v40.Values, 1, -1 do
			local v50 = v40.Values[v49]
			local v51 = v50[1]
			local v52 = v50[3]
			if p_u_35 == v51 and p_u_37 == v52 then
				table.remove(v40.Values, v49)
				break
			end
		end
		v40.LastUpdate = v39
		return v40
	end
	for v_u_54 = 1, v_u_9 do
		local v55, v_u_56 = pcall(function()
			-- upvalues: (ref) v_u_1, (copy) v_u_54
			return v_u_1:GetHashMap((("FFlags-%*"):format(v_u_54)))
		end)
		if v55 then
			local v57, v58 = pcall(function()
				-- upvalues: (copy) v_u_56, (copy) v_u_53
				return v_u_56:UpdateAsync("FFlags", v_u_53, 3888000)
			end)
			if not v57 then
				warn((("Failed to update HashMap FFlags-%*/FFlags: %*"):format(v_u_54, v58)))
			end
		else
			warn((("Failed to save HashMap FFlags-%*/FFlags: %*"):format(v_u_54, v_u_56)))
		end
	end
	for v_u_59 = 1, v_u_10 do
		local v60, v_u_61 = pcall(function()
			-- upvalues: (ref) v_u_3, (copy) v_u_59
			return v_u_3:GetDataStore((("FFlags-%*"):format(v_u_59)))
		end)
		if v60 then
			if not v_u_20(Enum.DataStoreRequestType.UpdateAsync, 30) then
				warn("No DataStore:UpdateAsync() request budget available")
				return false
			end
			local v62, v63 = pcall(function()
				-- upvalues: (copy) v_u_61, (copy) v_u_53
				return v_u_61:UpdateAsync("FFlags", v_u_53)
			end)
			if not v62 then
				warn((("Failed to update DataStore FFlags-%*/FFlags: %*"):format(v_u_59, v63)))
			end
		else
			warn((("Failed to save DataStore FFlags-%*/FFlags: %*"):format(v_u_59, v_u_61)))
		end
	end
	return true
end
function v14._loadMemoryStore(_, p64)
	-- upvalues: (copy) v_u_11, (copy) v_u_9, (copy) v_u_1
	local v_u_65 = p64 or v_u_11:NextInteger(1, v_u_9)
	local v66, v_u_67 = pcall(function()
		-- upvalues: (ref) v_u_1, (copy) v_u_65
		return v_u_1:GetHashMap((("FFlags-%*"):format(v_u_65)))
	end)
	if not v66 then
		warn((("MemoryStoreService:GetHashMap() failed on \'FFlags-%*\': %*"):format(v_u_65, v_u_67)))
		return false
	end
	local v68, v69 = pcall(function()
		-- upvalues: (copy) v_u_67
		return v_u_67:GetAsync("FFlags")
	end)
	if not v68 then
		warn((("Failed to load HashMap FFlags-%*/FFlags: %*"):format(v_u_65, v69)))
		return false
	end
	if typeof(v69) == "table" then
		local v70 = v69.Values
		if typeof(v70) == "table" then
			local v71 = DateTime.now().UnixTimestamp
			local v72 = v69.LastUpdate
			local v73
			if typeof(v72) == "number" then
				v73 = v69.LastUpdate
			else
				v73 = v71
			end
			local _ = v71 - v73 >= 2592000
			return true, v69
		end
	end
	warn((("Invalid data format in HashMap FFlags-%*/FFlags: %*"):format(v_u_65, v69)))
	return false
end
function v14._loadDataStore(_, p74)
	-- upvalues: (copy) v_u_11, (copy) v_u_10, (copy) v_u_3, (copy) v_u_20
	local v_u_75 = p74 or v_u_11:NextInteger(1, v_u_10)
	local v76, v_u_77 = pcall(function()
		-- upvalues: (ref) v_u_3, (copy) v_u_75
		return v_u_3:GetDataStore((("FFlags-%*"):format(v_u_75)))
	end)
	if not v76 then
		warn((("DataStoreService:GetDataStore() failed on \'FFlags-%*\': %*"):format(v_u_75, v_u_77)))
		return false
	end
	local v_u_78 = Instance.new("DataStoreGetOptions")
	v_u_78.UseCache = false
	if not v_u_20(Enum.DataStoreRequestType.GetAsync) then
		warn("No DataStore:GetAsync() request budget available")
		return false
	end
	local v79, v80 = pcall(function()
		-- upvalues: (copy) v_u_77, (copy) v_u_78
		return v_u_77:GetAsync("FFlags", v_u_78)
	end)
	if not v79 then
		warn((("Failed to load DataStore FFlags-%*/FFlags: %*"):format(v_u_75, v80)))
		return false
	end
	if typeof(v80) == "table" then
		local v81 = v80.Values
		if typeof(v81) == "table" then
			::l11::
			return true, v80
		end
	end
	warn((("Invalid data format in DataStore FFlags-%*/FFlags: %*"):format(v_u_75, v80)))
	v80 = {
		["Values"] = {},
		["LastUpdate"] = 0
	}
	goto l11
end
function v14.Load(p82)
	-- upvalues: (copy) v_u_4, (ref) v_u_12, (ref) v_u_13, (copy) v_u_5, (copy) v_u_8
	local v83, v84
	if v_u_4:IsStudio() then
		v83, v84 = p82:_loadDataStore()
	else
		v83, v84 = p82:_loadMemoryStore()
	end
	if not v83 then
		local v85 = 0
		while v85 < 3 and not v83 do
			warn((("Failed to load FFlags %*, retrying..."):format(v_u_4:IsStudio() and "DataStore" or "MemoryStore HashMap")))
			v85 = v85 + 1
			task.wait(v85 * 1)
			v83, v84 = p82:_loadMemoryStore()
		end
		if not v83 then
			warn("All attempts to load FFlags MemoryStore HashMaps failed, loading DataStore instead")
			v83, v84 = p82:_loadDataStore()
		end
	end
	if not (v83 and v84) then
		warn("Failed to load FFlags: both MemoryStore and DataStore requests failed!")
		return false
	end
	local v86 = {}
	for _, v87 in v84.Values do
		local v88 = v87[1]
		local v89 = v87[2]
		local v90 = v87[3] or "all"
		if v88 and (v90 ~= "all" or not v86[v88]) and (v90 == v_u_12 or v90 == "all") then
			v86[v88] = v89
		end
	end
	for v91, _ in v_u_13.Data.Values do
		if v86[v91] == nil then
			v86[v91] = v_u_5.None
		end
	end
	if v_u_8[v_u_12] then
		for v92, v93 in v_u_8[v_u_12] do
			v86[v92] = v93
		end
	end
	local v94 = workspace:GetServerTimeNow()
	v_u_13:Update({
		["Loaded"] = true,
		["LastUpdate"] = v94,
		["LastChange"] = v94,
		["Values"] = v86
	})
	if not p82._loaded then
		p82._loaded = true
		p82._loadedSignal:Fire(v_u_13.Data)
	end
	p82._updatedSignal:Fire(v_u_13.Data)
	return true
end
function v14.Start(p95)
	-- upvalues: (copy) v_u_7, (ref) v_u_12, (copy) v_u_4, (copy) v_u_11
	for v98, v97 in v_u_7 do
		if v97.UniverseIds and table.find(v97.UniverseIds, game.GameId) then
			if v_u_4:IsStudio() and v97.StudioEnvironment then
				local v98 = v97.StudioEnvironment
			end
			v_u_12 = v98
		end
		if not v97.UniverseIds or #v97.UniverseIds == 0 and not v_u_12 then
			v_u_12 = v98
		end
	end
	if not v_u_12 then
		warn((("Failed to find matching Environment for UniverseId %*"):format(game.GameId)))
		return
	end
	local v99 = 0
	while true do
		local v100 = workspace:GetServerTimeNow()
		if v99 < v100 then
			v99 = v100 + 300 * v_u_11:NextNumber(0.7, 1.3)
			p95:Load()
		end
		task.wait(1)
	end
end
v_u_13 = v_u_5.Server.new({
	["Channel"] = "FFlags",
	["ReplicateTo"] = "All",
	["Data"] = {
		["Values"] = {},
		["Loaded"] = false,
		["LastUpdate"] = 0,
		["LastChange"] = 0
	}
})
task.spawn(v14.Start, v14)
return v14