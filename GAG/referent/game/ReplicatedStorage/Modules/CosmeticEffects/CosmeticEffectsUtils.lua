local v_u_1 = game:GetService("CollectionService")
local v2 = game:GetService("ReplicatedStorage")
local v_u_3 = require(script.CosmeticEffectProcessors)
local v_u_4 = require(v2.Modules.GetFarmAsync)
return {
	["CollectAllTagged"] = function(p5, p6, p7)
		-- upvalues: (copy) v_u_1, (copy) v_u_3
		local v8 = {}
		local v9 = v_u_1:GetTagged(p5)
		local v10 = v_u_3[p5]
		if v10 then
			for _, v11 in v9 do
				if v11:IsA(p6) and v11:IsDescendantOf(p7) then
					local v12 = v10(v11)
					if v12 then
						table.insert(v8, v12)
					end
				end
			end
			return v8
		else
			warn((("No processor defined for %*"):format(p5)))
			return v8
		end
	end,
	["IsPlayerOnFarm"] = function(p13)
		-- upvalues: (copy) v_u_4
		local v14 = p13.Character
		if not (v14 and v14:FindFirstChild("HumanoidRootPart")) then
			return false
		end
		local v15 = v_u_4(p13)
		if not v15 then
			return false
		end
		local v16 = v15:FindFirstChild("PetArea", true)
		if not v16 then
			return false
		end
		local v17 = v14:FindFirstChild("HumanoidRootPart")
		local v18 = v16.CFrame:PointToObjectSpace(v17.Position)
		local v19 = v16.Size / 2
		local v20 = v18.X
		local v21
		if math.abs(v20) <= v19.X then
			local v22 = v18.Z
			v21 = math.abs(v22) <= v19.Z
		else
			v21 = false
		end
		return v21
	end
}