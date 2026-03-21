local v_u_1 = game:GetService("ReplicatedStorage")
game:GetService("Players")
game:GetService("ServerScriptService")
game:GetService("TextService")
local v2 = {}
require(v_u_1.Modules.GenerateRandomString)
local v_u_3 = require(v_u_1.Modules.DataService)
require(v_u_1.Modules.CountDictionary)
require(v_u_1.Types.SlotServiceTypes)
function v2.GetSaveSlot(_, p4)
	-- upvalues: (copy) v_u_3
	local v5 = v_u_3:GetData()
	if v5 then
		return v5.SaveSlots.AllSlots[p4]
	end
end
function v2.GetCurrentSaveSlot(_)
	-- upvalues: (copy) v_u_3
	local v6 = v_u_3:GetData()
	if v6 then
		local v7 = v6.SaveSlots
		return v7.AllSlots[v7.SelectedSlot]
	end
end
function v2.RememberUnlockage(_)
	-- upvalues: (copy) v_u_1
	v_u_1.GameEvents.SaveSlotService.RememberUnlockage:FireServer()
end
function v2.PurchaseSlot(_)
	-- upvalues: (copy) v_u_1
	v_u_1.GameEvents.SaveSlotService.PurchaseSlot:FireServer()
end
function v2.ChangeSlots(_, p8)
	-- upvalues: (copy) v_u_1
	v_u_1.GameEvents.SaveSlotService.RequestChangeSlots:FireServer(p8)
end
function v2.HasPurchasedSlotFromAscension(_)
	-- upvalues: (copy) v_u_3
	local v9 = v_u_3:GetData()
	if not v9 then
		return false
	end
	local v10 = v9.GardenCoinShopStats.LifetimePurchases["Save Slot"]
	return v10 and v10 >= 1 and true or false
end
function v2.GetAllSlots(_)
	-- upvalues: (copy) v_u_3
	local v11 = v_u_3:GetData()
	if v11 then
		return v11.SaveSlots.AllSlots
	end
end
return v2