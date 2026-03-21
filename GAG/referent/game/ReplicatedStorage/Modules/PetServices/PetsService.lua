local v1 = {}
game:GetService("ReplicatedStorage")
local v2 = game:GetService("ReplicatedStorage")
local v_u_3 = v2:WaitForChild("GameEvents"):WaitForChild("PetsService")
local v_u_4 = require(v2.Modules.DataService)
require(v2.Types.PetTypes)
local v_u_5 = require(v2.Data.PetRegistry.PetMutationRegistry)
function v1.EquipPet(_, p6, p7)
	-- upvalues: (copy) v_u_3
	v_u_3:FireServer("EquipPet", p6, p7)
end
function v1.UnequipPet(_, p8)
	-- upvalues: (copy) v_u_3
	v_u_3:FireServer("UnequipPet", p8)
end
local function v_u_13(p9)
	-- upvalues: (copy) v_u_4
	local v10 = v_u_4:GetData()
	if v10 then
		local v11 = v10.PetsData
		if v11 then
			local v12 = v11.PetInventory.Data[p9]
			if v12 then
				return v12
			end
		end
	else
		return
	end
end
function v1.GetPlayerPetData(_, p14)
	-- upvalues: (copy) v_u_13
	return v_u_13(p14)
end
function v1.CalculateBoost(_, p15, p16)
	-- upvalues: (copy) v_u_4, (copy) v_u_5
	local v17 = v_u_4:GetData()
	local v18
	if v17 then
		local v19 = v17.PetsData
		if v19 then
			v18 = v19.PetInventory.Data[p15] or nil
		else
			v18 = nil
		end
	else
		v18 = nil
	end
	if not v18 then
		return 1
	end
	local v20 = v18.PetData.Boosts
	if not v20 then
		return 1
	end
	local v21 = 1
	for _, v22 in v20 do
		if v22.BoostType == p16 then
			v21 = v21 + v22.BoostAmount
		end
	end
	local v23 = v18.PetData.MutationType
	if v23 then
		local v24 = v_u_5.EnumToPetMutation[v23]
		local v25 = v_u_5.PetMutationRegistry[v24]
		for _, v26 in v25.Boosts do
			if v26.BoostType == p16 then
				v21 = v21 + v26.BoostAmount
			end
		end
		print(v23, v25.Boosts)
	end
	return v21
end
function v1.GetBoostsOfType(_, _, p27, p28)
	-- upvalues: (copy) v_u_4, (copy) v_u_5
	local v29 = v_u_4:GetData()
	local v30
	if v29 then
		local v31 = v29.PetsData
		if v31 then
			v30 = v31.PetInventory.Data[p27] or nil
		else
			v30 = nil
		end
	else
		v30 = nil
	end
	if v30 then
		local v32 = v30.PetData.Boosts
		if v32 then
			local v33 = {}
			for _, v34 in v32 do
				if v34.BoostType == p28 then
					table.insert(v33, v34)
				end
			end
			local v35 = v30.PetData.MutationType
			if v35 then
				local v36 = v_u_5.EnumToPetMutation[v35]
				for _, v37 in v_u_5.PetMutationRegistry[v36].Boosts do
					if v37.BoostType == p28 then
						table.insert(v33, v37)
					end
				end
			end
			return v33
		end
	end
end
return v1