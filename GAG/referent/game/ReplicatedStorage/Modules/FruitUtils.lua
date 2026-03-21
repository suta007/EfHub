local v_u_7 = {
	["GetFruitAge"] = function(_, p1)
		if p1:HasTag("Harvestable") then
			local v2 = p1:FindFirstChild("Grow")
			if v2 then
				local v3 = v2:FindFirstChild("Age")
				if v3 then
					return v3.Value
				else
					return nil
				end
			else
				return nil
			end
		else
			return nil
		end
	end,
	["IsFruitGrown"] = function(_, p4)
		-- upvalues: (copy) v_u_7
		if p4:HasTag("Harvestable") then
			local v5 = v_u_7:GetFruitAge(p4)
			if v5 then
				local v6 = p4:GetAttribute("MaxAge")
				if v6 then
					return v6 <= v5
				else
					return nil
				end
			else
				return nil
			end
		else
			return nil
		end
	end
}
return v_u_7