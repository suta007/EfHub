local v1 = game:GetService("ReplicatedStorage")
local v_u_2 = require(v1.Modules.DataService)
local v_u_3 = require(v1.Data.ShopTabData)
return {
	["IsTabUnlocked"] = function(_, p4, _)
		-- upvalues: (copy) v_u_2
		local v5 = v_u_2:GetData()
		if not v5 then
			return false
		end
		local v6 = v5.ShopTabData[p4]
		if not v6 then
			return false
		end
		for _, v7 in v6 do
			if table.find(v6, v7) then
				return true
			end
		end
		return false
	end,
	["IsItemLockedByTab"] = function(_, p8, p9)
		-- upvalues: (copy) v_u_3
		local v10 = v_u_3[p8]
		if v10 then
			local v11 = {}
			for v12, v13 in v10 do
				for _, v14 in v13.TabItems do
					if v14 == p9 then
						table.insert(v11, v12)
					end
				end
			end
			if #v11 > 0 then
				return v11
			else
				return nil
			end
		else
			return nil
		end
	end
}