local v1 = game:GetService("ReplicatedStorage")
local v_u_2 = game:GetService("CollectionService")
local v_u_3 = require(v1.Modules.PlantTraitsData)
local v_u_4 = require(v1.Modules.PetServices.PetUtilities)
local v5 = {}
local function v_u_11(p6)
	for v7 = #p6, 2, -1 do
		local v8 = math.random(1, v7)
		local v9 = p6[v8]
		local v10 = p6[v7]
		p6[v7] = v9
		p6[v8] = v10
	end
end
local function v_u_16(p12, p13)
	local v14 = {}
	for v15 in string.gmatch(p12, (("[^$%*]+"):format(p13))) do
		v14[#v14 + 1] = string.lower(v15)
	end
	return v14
end
function v5.CountPlants(p17, p_u_18, p19, p_u_20)
	-- upvalues: (copy) v_u_3
	if not p17 then
		return 0
	end
	local v21 = p17:FindFirstChild("Plants_Physical", true)
	if not v21 then
		return 0
	end
	local v_u_22 = p19 and string.lower(p19) or nil
	local v23 = 0
	for _, v_u_24 in v21:GetChildren() do
		if v_u_24:IsA("Model") then
			local function v26(p25)
				-- upvalues: (copy) p_u_20, (copy) p_u_18, (ref) v_u_3, (copy) v_u_24, (copy) v_u_22
				if p_u_20 and p25:GetAttribute("Favorited") then
					return false
				elseif p_u_18 and not v_u_3.HasTrait(v_u_24.Name, p_u_18) then
					return false
				else
					return (not v_u_22 or string.find(string.lower(p25.Name), v_u_22)) and true or false
				end
			end
			if v26(v_u_24) then
				v23 = v23 + 1
			end
			local v27 = v_u_24:FindFirstChild("Fruits")
			if v27 then
				for _, v28 in v27:GetChildren() do
					if v28:IsA("Model") and v26(v28) then
						v23 = v23 + 1
					end
				end
			end
		end
	end
	return v23
end
function v5.GetAllPlants(p29, p30, p31, p32, p33)
	-- upvalues: (copy) v_u_3
	local v34 = {}
	if not p29 then
		return v34
	end
	local v35 = p29:FindFirstChild("Plants_Physical", true)
	if not v35 then
		return v34
	end
	local v36 = p31 and string.lower(p31) or nil
	for _, v37 in v35:GetChildren() do
		if v37:IsA("Model") and not (p32 and v37:GetAttribute("Favorited")) and ((not p30 or v_u_3.HasTrait(v37.Name, p30)) and (not v36 or string.find(string.lower(v37.Name), v36))) then
			if p33 then
				local v38 = v37:FindFirstChild("Fruits")
				if not v38 then
					goto l18
				end
				local v39 = false
				for _, v40 in v38:GetChildren() do
					if v40:IsA("Model") and v40:GetAttribute("Favorited") then
						v39 = true
						break
					end
				end
				if not v39 then
					goto l18
				end
			else
				::l18::
				v34[#v34 + 1] = v37
			end
		end
	end
	return v34
end
function v5.GetHarvestableFruits(p41, p_u_42, p43, p_u_44)
	-- upvalues: (copy) v_u_2, (copy) v_u_3
	local v_u_45 = {}
	if not p41 then
		return v_u_45
	end
	local v46 = p41:FindFirstChild("Plants_Physical", true)
	if not v46 then
		return v_u_45
	end
	local v_u_47 = p43 and string.lower(p43) or nil
	for _, v_u_48 in v46:GetChildren() do
		if v_u_48:IsA("Model") then
			local function v50(p49)
				-- upvalues: (ref) v_u_2, (copy) p_u_44, (copy) p_u_42, (ref) v_u_3, (copy) v_u_48, (copy) v_u_47, (copy) v_u_45
				if p49:IsA("Model") then
					if v_u_2:HasTag(p49, "Harvestable") then
						if p_u_44 and p49:GetAttribute("Favorited") then
							return
						elseif p_u_42 and not v_u_3.HasTrait(v_u_48.Name, p_u_42) then
							return
						elseif not v_u_47 or string.find(string.lower(p49.Name), v_u_47) then
							v_u_45[#v_u_45 + 1] = p49
						end
					else
						return
					end
				else
					return
				end
			end
			v50(v_u_48)
			local v51 = v_u_48:FindFirstChild("Fruits")
			if v51 then
				for _, v52 in v51:GetChildren() do
					v50(v52)
				end
			end
		end
	end
	return v_u_45
end
function v5.GetPlantsInRadius(p53, p54, p55, p56, p57)
	-- upvalues: (copy) v_u_3
	if not p53 then
		return {}
	end
	local v58 = p53:FindFirstChild("Plants_Physical", true)
	if not v58 then
		return {}
	end
	local v59 = OverlapParams.new()
	v59.FilterType = Enum.RaycastFilterType.Include
	v59.FilterDescendantsInstances = { v58 }
	local v60 = {}
	local v61 = {}
	for _, v62 in workspace:GetPartBoundsInRadius(p54, p55, v59) do
		local v63 = v62:FindFirstAncestorOfClass("Model")
		if v63 and not v60[v63] then
			v60[v63] = true
			if not (p57 and v63:GetAttribute("Favorited")) and ((not p56 or v_u_3.HasTrait(v63.Name, p56)) and v63:FindFirstChild("Grow")) then
				v61[#v61 + 1] = v63
			end
		end
	end
	return v61
end
function v5.CountPetsByNameContains(p64, p65)
	-- upvalues: (copy) v_u_4, (copy) v_u_16
	local v66 = v_u_4:GetPetsSortedByAge(p64, 0, false, true) or {}
	local v67 = v_u_16(p65, ";")
	local v68 = 0
	for _, v69 in v66 do
		local v70 = string.lower(v69.PetType)
		for _, v71 in v67 do
			if string.find(v70, v71) then
				v68 = v68 + 1
				break
			end
		end
	end
	return v68
end
function v5.CountObjectsByName(p72, p73)
	if not p72 then
		return 0
	end
	local v74 = p72:FindFirstChild("Important", true)
	if not v74 then
		return 0
	end
	local v75 = v74:FindFirstChild("Objects_Physical")
	if not v75 then
		return 0
	end
	local v76 = string.lower(p73)
	local v77 = 0
	for _, v78 in v75:GetChildren() do
		if string.find(string.lower(v78.Name), v76) then
			v77 = v77 + 1
		end
	end
	return v77
end
function v5.FindCosmeticsInFarm(p79, p80)
	local v81 = {}
	if not p79 then
		return v81
	end
	local v82 = p79:FindFirstChild("Important", true)
	if not v82 then
		return v81
	end
	local v83 = v82:FindFirstChild("Cosmetic_Physical")
	if not v83 then
		return v81
	end
	for _, v84 in v83:GetChildren() do
		if v84:IsA("Model") then
			for _, v85 in p80 do
				local v86 = v84:FindFirstChild(v85)
				if v86 and v86:IsA("Model") then
					v81[#v81 + 1] = v86:GetPivot()
				elseif v86 and v86:IsA("BasePart") then
					v81[#v81 + 1] = v86.CFrame
				end
			end
		end
	end
	return v81
end
function v5.GetRandomFromArray(p87)
	if #p87 == 0 then
		return nil
	else
		return p87[math.random(1, #p87)]
	end
end
function v5.Shuffle(p88)
	-- upvalues: (copy) v_u_11
	v_u_11(p88)
end
return v5