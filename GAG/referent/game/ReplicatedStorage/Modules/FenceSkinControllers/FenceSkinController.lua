local v_u_1 = game:GetService("ReplicatedStorage")
game:GetService("ServerStorage")
local v_u_2 = require(v_u_1.Modules.SaveSlotControllers.SaveSlotController)
local v_u_3 = require(v_u_1.Modules.DataService)
return {
	["GetFenceSkin"] = function(_)
		-- upvalues: (copy) v_u_2
		return v_u_2:GetCurrentSaveSlot().SelectedFenceSkin or "DEFAULT"
	end,
	["GetOwnedFences"] = function(_)
		-- upvalues: (copy) v_u_3
		local v4 = v_u_3:GetData()
		if v4 then
			local v5 = v4.FenceSkinData.OwnedFences
			if not v5.DEFAULT then
				v5.DEFAULT = true
			end
			return v5
		end
	end,
	["Equip"] = function(_, p6)
		-- upvalues: (copy) v_u_1
		if p6 and type(p6) == "string" then
			v_u_1.GameEvents.FenceSkinService.Equip:FireServer(p6)
		end
	end
}