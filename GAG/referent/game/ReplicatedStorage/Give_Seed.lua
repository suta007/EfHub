local v1 = game:GetService("ReplicatedStorage")
local v2 = game:GetService("RunService")
local v_u_3 = require(v1.Item_Module)
local v_u_4 = v2:IsServer()
return {
	["Give_Seed"] = function(p5, p_u_6, p7, p8)
		-- upvalues: (copy) v_u_4, (copy) v_u_3
		local v9 = v_u_4
		assert(v9)
		local v10 = game:GetService("ServerScriptService")
		local v11 = game:GetService("ServerStorage")
		local v12 = require(v10.Modules.InventoryService)
		local v_u_13 = p8 == nil and "Normal" or p8
		if not table.find(v_u_3.VariantNames, v_u_13) then
			warn((("Invalid variation given in Give_Seed, got \"%*\"\n%*"):format(v_u_13, (debug.traceback()))))
			v_u_13 = "Normal"
		end
		if p7 ~= nil and (type(p7) ~= "number" or (p7 <= 0 or p7 ~= p7)) then
			return nil
		end
		if not v11.Seed_Models:FindFirstChild(p_u_6) then
			warn((("Seed \"%*\" does not exists\n%*"):format(p_u_6, (debug.traceback()))))
			return nil
		end
		local v14 = p7 or 1
		local v17 = v12:Find(p5, "Seed", function(p15)
			-- upvalues: (copy) p_u_6, (ref) v_u_13
			local v16
			if p15.ItemName == p_u_6 then
				v16 = p15.Variant == v_u_13
			else
				v16 = false
			end
			return v16
		end)
		local v18, v19 = next(v17)
		if not v19 then
			return v12:CreateItem(p5, "Seed", {
				["ItemName"] = p_u_6,
				["Quantity"] = v14,
				["Variant"] = v_u_13
			})
		end
		local v20 = v19.ItemData
		v20.Quantity = v20.Quantity + v14
		return v18
	end
}