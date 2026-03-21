local v1 = game:GetService("ReplicatedStorage")
local v_u_2 = require(v1.Modules.GetFarm)
return {
	["GetBoost"] = function(_, p3)
		-- upvalues: (copy) v_u_2
		local v4 = v_u_2(p3)
		if v4 then
			local v5 = v4:FindFirstChild("Important")
			if v5 then
				v5 = v5:FindFirstChild("Objects_Physical")
			end
			if v5 then
				local v6 = 0
				local v7 = 0
				for _, v8 in v5:GetChildren() do
					if v8:HasTag("YuleLogObject") then
						local v9 = v8:GetAttribute("Lifetime")
						if v9 and v9 > 0 then
							local v10 = v9 / 720
							local v11 = math.clamp(v10, 0, 1)
							v6 = v6 + v11 * 0.2
							v7 = v7 + v11 * 6
						end
					end
				end
				return (v7 ~= 0 or v6 ~= 0) and {
					["Pet"] = v7,
					["Cooking"] = v6
				} or nil
			end
		end
	end
}