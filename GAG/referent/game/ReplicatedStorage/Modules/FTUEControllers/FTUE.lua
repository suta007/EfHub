local v1 = game:GetService("Players")
local v2 = game:GetService("ReplicatedStorage")
local v_u_3 = require(v2.Modules.Observers)
local v_u_4 = v1.LocalPlayer
local v_u_5 = {}
local v_u_6 = workspace.NPCS
local v_u_7 = { "Gear Stands" }
local function v10()
	-- upvalues: (copy) v_u_6, (copy) v_u_7
	local v8 = v_u_6
	for _, v9 in v_u_7 do
		v8 = v8:WaitForChild(v9, 10)
		if not v8 then
			return nil
		end
	end
	return v8
end
local v_u_11 = workspace.MapDecorations
local v_u_12 = { "GearShopSign" }
local function v15()
	-- upvalues: (copy) v_u_11, (copy) v_u_12
	local v13 = v_u_11
	for _, v14 in v_u_12 do
		v13 = v13:WaitForChild(v14, 10)
		if not v13 then
			return nil
		end
	end
	return v13
end
local v_u_16 = workspace.NPCS
local v_u_17 = { "Raphael" }
local function v20()
	-- upvalues: (copy) v_u_16, (copy) v_u_17
	local v18 = v_u_16
	for _, v19 in v_u_17 do
		v18 = v18:WaitForChild(v19, 10)
		if not v18 then
			return nil
		end
	end
	return v18
end
local v_u_21 = workspace.NPCS
local v_u_22 = { "Eloise" }
local function v25()
	-- upvalues: (copy) v_u_21, (copy) v_u_22
	local v23 = v_u_21
	for _, v24 in v_u_22 do
		v23 = v23:WaitForChild(v24, 10)
		if not v23 then
			return nil
		end
	end
	return v23
end
local v_u_26 = workspace.NPCS
local v_u_27 = { "Quest Stand" }
local function v30()
	-- upvalues: (copy) v_u_26, (copy) v_u_27
	local v28 = v_u_26
	for _, v29 in v_u_27 do
		v28 = v28:WaitForChild(v29, 10)
		if not v28 then
			return nil
		end
	end
	return v28
end
local v_u_31 = workspace.NPCS
local v_u_32 = { "Pet Stand" }
local function v35()
	-- upvalues: (copy) v_u_31, (copy) v_u_32
	local v33 = v_u_31
	for _, v34 in v_u_32 do
		v33 = v33:WaitForChild(v34, 10)
		if not v33 then
			return nil
		end
	end
	return v33
end
local v_u_36 = workspace.NPCS
local v_u_37 = { "CosmeticStand" }
local function v40()
	-- upvalues: (copy) v_u_36, (copy) v_u_37
	local v38 = v_u_36
	for _, v39 in v_u_37 do
		v38 = v38:WaitForChild(v39, 10)
		if not v38 then
			return nil
		end
	end
	return v38
end
local v_u_41 = workspace.NPCS
local v_u_42 = { "PetMutationMachine" }
local function v45()
	-- upvalues: (copy) v_u_41, (copy) v_u_42
	local v43 = v_u_41
	for _, v44 in v_u_42 do
		v43 = v43:WaitForChild(v44, 10)
		if not v43 then
			return nil
		end
	end
	return v43
end
local v_u_46 = workspace
local v_u_47 = { "CraftingTables" }
local function v50()
	-- upvalues: (copy) v_u_46, (copy) v_u_47
	local v48 = v_u_46
	for _, v49 in v_u_47 do
		v48 = v48:WaitForChild(v49, 10)
		if not v48 then
			return nil
		end
	end
	return v48
end
local v_u_51 = workspace
local v_u_52 = { "BlacksmithStand" }
local function v55()
	-- upvalues: (copy) v_u_51, (copy) v_u_52
	local v53 = v_u_51
	for _, v54 in v_u_52 do
		v53 = v53:WaitForChild(v54, 10)
		if not v53 then
			return nil
		end
	end
	return v53
end
local v_u_56 = workspace.NPCS
local v_u_57 = { "Isaac" }
__set_list(v_u_5, 1, {v10, v15, v20, v25, v30, v35, v40, v45, v50, v55, function()
	-- upvalues: (copy) v_u_56, (copy) v_u_57
	local v58 = v_u_56
	for _, v59 in v_u_57 do
		v58 = v58:WaitForChild(v59, 10)
		if not v58 then
			return nil
		end
	end
	return v58
end})
local v_u_60 = nil
local function v64()
	-- upvalues: (copy) v_u_4, (ref) v_u_60, (copy) v_u_3, (copy) v_u_5
	if v_u_4:GetAttribute("FirstTimePlayer") then
		if not v_u_60 then
			v_u_60 = true
			v_u_3.observeTag("HideFTUE", function(p61)
				p61.Parent = script
				return nil
			end, { workspace })
		end
		for _, v_u_62 in v_u_5 do
			task.spawn(function()
				-- upvalues: (copy) v_u_62
				local v63 = v_u_62()
				if v63 then
					v63.Parent = nil
				end
			end)
		end
	end
end
task.spawn(v64)
v_u_4:GetAttributeChangedSignal("FirstTimePlayer"):Connect(v64)
return {}