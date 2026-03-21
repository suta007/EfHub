local v1 = game:GetService("ReplicatedStorage")
local v_u_2 = require(v1.Modules.DataService)
local v_u_3 = require(v1.Modules.CountDictionary)
local v_u_4 = require(v1.Data.EnumRegistry.InventoryServiceEnums)
local v_u_5 = game.Players.LocalPlayer
local v_u_16 = {
	["GetToolData"] = function(_, p6)
		-- upvalues: (copy) v_u_4, (copy) v_u_2
		if not p6 then
			return warn("InventoryService:GetToolData | Player is Nil!", debug.traceback())
		end
		if not p6:IsA("Tool") then
			return warn(("InventoryService:GetToolData | %* is not of \'Tool\' type!"):format(p6), debug.traceback())
		end
		local v7 = p6:GetAttribute(v_u_4.ITEM_UUID)
		if not v7 then
			return warn(p6, "has no attached ITEM_UUID attribute")
		end
		local v8 = v_u_2:GetData().InventoryData[v7]
		if v8 then
			return v8
		end
	end,
	["Find"] = function(_, p9, p10)
		-- upvalues: (copy) v_u_2
		local v11 = p10 or function()
			return true
		end
		local v12 = {}
		local v13 = v_u_2:GetData()
		if not v13 then
			return v12
		end
		for v14, v15 in v13.InventoryData do
			if v15.ItemType == p9 and v11(v15.ItemData) then
				v12[v14] = v15
			end
		end
		return v12
	end,
	["IsMaxInventory"] = function(_)
		-- upvalues: (copy) v_u_16, (copy) v_u_3, (copy) v_u_5
		return v_u_3((v_u_16:Find("Holdable"))) >= 200 + (v_u_5:GetAttribute("BonusBackpackSize") or 0)
	end
}
return v_u_16