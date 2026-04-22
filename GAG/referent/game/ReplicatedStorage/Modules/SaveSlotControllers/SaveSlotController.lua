local v_u_1 = game:GetService("ReplicatedStorage")
game:GetService("Players")
local v2 = {}
require(v_u_1.Modules.GenerateRandomString)
local v_u_3 = require(v_u_1.Modules.DataService)
require(v_u_1.Modules.CountDictionary)
local v_u_4 = require(v_u_1.Types.SlotServiceTypes)
function v2.GetSaveSlot(_, p5)
	-- upvalues: (copy) v_u_3
	local v6 = v_u_3:GetData()
	if v6 then
		return v6.SaveSlots.AllSlots[p5]
	end
end
function v2.GetCurrentSaveSlot(_)
	-- upvalues: (copy) v_u_3
	local v7 = v_u_3:GetData()
	if v7 then
		local v8 = v7.SaveSlots
		return v8.AllSlots[v8.SelectedSlot]
	end
end
function v2.IsEasterSlotOptedIn(_)
	-- upvalues: (copy) v_u_3, (copy) v_u_4
	local v9 = v_u_3:GetData()
	if v9 then
		return v9.SaveSlots.AllSlots[v_u_4.EASTER_SLOT_KEY] ~= nil
	else
		return false
	end
end
function v2.OptInToEasterSlot(_)
	-- upvalues: (copy) v_u_1
	v_u_1.GameEvents.SaveSlotService.OptInToEasterSlot:FireServer()
end
function v2.RememberUnlockage(_)
	-- upvalues: (copy) v_u_1
	v_u_1.GameEvents.SaveSlotService.RememberUnlockage:FireServer()
end
function v2.PurchaseSlot(_)
	-- upvalues: (copy) v_u_1
	v_u_1.GameEvents.SaveSlotService.PurchaseSlot:FireServer()
end
function v2.ChangeSlots(_, p10)
	-- upvalues: (copy) v_u_1
	v_u_1.GameEvents.SaveSlotService.RequestChangeSlots:FireServer(p10)
end
function v2.HasPurchasedSlotFromAscension(_)
	-- upvalues: (copy) v_u_3
	local v11 = v_u_3:GetData()
	if not v11 then
		return false
	end
	local v12 = v11.GardenCoinShopStats.LifetimePurchases["Save Slot"]
	return v12 and v12 >= 1 and true or false
end
function v2.GetAllSlots(_)
	-- upvalues: (copy) v_u_3
	local v13 = v_u_3:GetData()
	if v13 then
		return v13.SaveSlots.AllSlots
	end
end
return v2