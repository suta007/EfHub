local v1 = game:GetService("ReplicatedStorage")
local v2 = {}
local v3 = require(v1.Modules.SpatialHashmap)
local v4 = require(v1.Modules.CreateTagHandler)
local v_u_5 = require(v1.Modules.TwoPointCast)
local v6 = require(v1.Data.PetRegistry).PetConfig.HEIGHT_MAP_CONFIG
local v_u_7 = v6.TOP_OFFSET
local v_u_8 = v6.BOTTOM_OFFSET
local v9 = v6.MAP_QUALITY
local v_u_10 = v6.CHANGE_QUEUE_TIME
local v_u_11 = v6.RESET_AMOUNT_PER_QUEUE
local v_u_12 = v3.new({
	["Scale"] = v9,
	["Mode"] = "Vector2"
})
local v13 = workspace:WaitForChild("Farm")
local v_u_14 = RaycastParams.new()
v_u_14.FilterType = Enum.RaycastFilterType.Exclude
v4({
	["Tag"] = "PetTargetable",
	["OnInstanceAdded"] = function(p15)
		-- upvalues: (copy) v_u_14
		v_u_14:AddToFilter(p15)
	end
})
v4({
	["Tag"] = "PlayerCharacters",
	["OnInstanceAdded"] = function(p16)
		-- upvalues: (copy) v_u_14
		v_u_14:AddToFilter(p16)
	end
})
v4({
	["Tag"] = "PetModel",
	["OnInstanceAdded"] = function(p17)
		-- upvalues: (copy) v_u_14
		v_u_14:AddToFilter(p17)
	end
})
v4({
	["Tag"] = "TooBigPlantModel",
	["OnInstanceAdded"] = function(p18)
		-- upvalues: (copy) v_u_14
		v_u_14:AddToFilter(p18)
	end
})
function v2.GetYForPosition(_, p19)
	-- upvalues: (copy) v_u_12, (copy) v_u_7, (copy) v_u_8, (copy) v_u_5, (copy) v_u_14
	local v20 = v_u_12:GetOne({
		["Position"] = p19,
		["Range"] = 1
	})
	local v21 = p19.X
	local v22 = p19.Y
	local v23 = Vector3.new(v21, 0, v22)
	if not v20 then
		local v24 = v_u_5(v23 + v_u_7, v23 + v_u_8, v_u_14)
		if v24 then
			v24 = v24.Position.Y
		end
		if v24 then
			v_u_12:Insert({
				["Hashed"] = v24,
				["Position"] = p19
			})
		end
	end
	return v20
end
local v_u_25 = {}
local function v_u_30(p_u_26)
	-- upvalues: (copy) v_u_25
	if p_u_26:IsA("Model") then
		local v27 = p_u_26:GetExtentsSize()
		local v28 = v27.X
		local v29 = v27.Z
		if math.max(v28, v29) > 20 then
			p_u_26:AddTag("TooBigPlantModel")
		else
			p_u_26:WaitForChild("Grow"):WaitForChild("Age"):GetPropertyChangedSignal("Value"):Connect(function()
				-- upvalues: (ref) v_u_25, (copy) p_u_26
				v_u_25[p_u_26] = true
			end)
		end
	else
		return warn("a non valid model cant be setup", p_u_26)
	end
end
local function v_u_38(p31)
	-- upvalues: (copy) v_u_30, (copy) v_u_25
	local v32 = p31:WaitForChild("Important")
	if v32 then
		local v33 = v32:WaitForChild("Plants_Physical")
		local v34 = v32:WaitForChild("Objects_Physical")
		for _, v_u_35 in v33:GetChildren() do
			task.spawn(function()
				-- upvalues: (ref) v_u_30, (copy) v_u_35
				v_u_30(v_u_35)
			end)
		end
		v33.ChildAdded:Connect(v_u_30)
		v33.ChildRemoved:Connect(function(p36)
			-- upvalues: (ref) v_u_25
			if not p36:HasTag("TooBigPlantModel") then
				v_u_25[p36] = true
			end
		end)
		v34.ChildRemoved:Connect(function(p37)
			-- upvalues: (ref) v_u_25
			if not p37:HasTag("TooBigPlantModel") then
				v_u_25[p37] = true
			end
		end)
	end
end
local function v_u_47(p39)
	-- upvalues: (copy) v_u_12
	if not p39:HasTag("TooBigPlantModel") then
		if not p39:IsA("Model") then
			return warn("a non valid model that just cleaned up", p39)
		end
		local v40 = p39:GetPivot().Position
		Vector2.new(v40.X, v40.Z)
		local v41 = v_u_12
		local v42 = {}
		local v43 = p39:GetPivot().Position
		v42.Position = Vector2.new(v43.X, v43.Z)
		local v44 = p39:GetExtentsSize()
		local v45 = v44.X
		local v46 = v44.Z
		v42.Range = math.max(v45, v46) * 1.5
		v41:ClearNeighbors(v42)
	end
end
for _, v_u_48 in v13:GetChildren() do
	task.spawn(function()
		-- upvalues: (copy) v_u_38, (copy) v_u_48
		v_u_38(v_u_48)
	end)
end
task.spawn(function()
	-- upvalues: (copy) v_u_25, (copy) v_u_47, (copy) v_u_11, (copy) v_u_10
	while true do
		local v49 = 0
		for v50 in v_u_25 do
			v49 = v49 + 1
			v_u_47(v50)
			v_u_25[v50] = nil
			if v_u_11 <= v49 then
				goto l3
			end
		end
		::l3::
		task.wait(v_u_10)
	end
end)
return v2