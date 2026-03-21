local v_u_1 = game:GetService("ReplicatedStorage")
local v2 = game:GetService("Players")
local v_u_3 = require(v_u_1.Data.EnumRegistry.ReversedItemTypeEnums)
local v_u_4 = require(v_u_1.Data.EnumRegistry.InventoryServiceEnums)
local v_u_5 = require(v_u_1.Modules.ReplicationReciever)
local v_u_6 = require(v_u_1.Modules.Notification)
local v_u_7 = require(v_u_1.Data.TradeData)
local v8 = require(v_u_1.Modules.Signal)
local v_u_9 = nil
local v_u_10 = v2.LocalPlayer
local v_u_11 = v_u_1.GameEvents.TradeEvents
local v_u_19 = {
	["CurrentTradeId"] = nil,
	["CurrentTradeReplicator"] = nil,
	["OnTradeCreated"] = v8.new(),
	["OnTradeDestroyed"] = v8.new(),
	["AddItem"] = function(_, p12, p13)
		-- upvalues: (copy) v_u_11
		v_u_11.AddItem:FireServer(p12, p13)
	end,
	["RemoveItem"] = function(_, p14, p15)
		-- upvalues: (copy) v_u_11
		v_u_11.RemoveItem:FireServer(p14, p15)
	end,
	["Accept"] = function(_)
		-- upvalues: (copy) v_u_11
		v_u_11.Accept:FireServer()
	end,
	["Confirm"] = function(_)
		-- upvalues: (copy) v_u_11
		v_u_11.Confirm:FireServer()
	end,
	["Decline"] = function(_)
		-- upvalues: (copy) v_u_11
		v_u_11.Decline:FireServer()
	end,
	["SetSheckles"] = function(_, p16)
		-- upvalues: (copy) v_u_11
		v_u_11.SetSheckles:FireServer(p16)
	end,
	["SetTokens"] = function(_, p17)
		-- upvalues: (copy) v_u_11
		v_u_11.SetTokens:FireServer(p17)
	end,
	["FetchBoothHistory"] = function(_)
		-- upvalues: (copy) v_u_11
		return v_u_11.Booths.FetchHistory:InvokeServer()
	end,
	["FetchTradeHistory"] = function(_)
		-- upvalues: (copy) v_u_11
		return v_u_11.FetchHistory:InvokeServer()
	end,
	["IsItemTypeValid"] = function(_, p18)
		-- upvalues: (copy) v_u_7
		return table.find(v_u_7.ItemTypes, p18) ~= nil
	end
}
local v_u_20 = false
function v_u_19.RequestAddItem(_)
	-- upvalues: (copy) v_u_19, (ref) v_u_20, (ref) v_u_9, (copy) v_u_10
	if v_u_19.CurrentTradeReplicator then
		if not (v_u_20 and v_u_9.IsOpened()) then
			local v21 = v_u_10.Character
			if v21 then
				v21 = v21:FindFirstChildOfClass("Humanoid")
			end
			if v21 then
				v21:UnequipTools()
			end
			v_u_20 = true
			v_u_9.SetTrading(true)
			v_u_9.OpenClose()
		end
	else
		return
	end
end
local v_u_22 = {}
function v_u_19.IsItemInTrade(_, p23, p24)
	-- upvalues: (ref) v_u_22
	local v25 = v_u_22[p23]
	if v25 then
		v25 = v_u_22[p23][p24] ~= nil
	end
	return v25
end
function v_u_19.IsItemInTradeFromTool(_, p26)
	-- upvalues: (copy) v_u_19, (copy) v_u_4, (copy) v_u_3, (ref) v_u_22
	if not v_u_19.CurrentTradeReplicator then
		return false
	end
	local v27 = p26:GetAttribute(v_u_4.ITEM_TYPE)
	if not v27 then
		return false
	end
	local v28 = v_u_3[v27]
	local v29 = p26:GetAttribute(v28 == "Pet" and "PET_UUID" or v_u_4.ITEM_UUID)
	if not (v28 and v29) then
		return false
	end
	local v30 = v_u_22[v28]
	if v30 then
		v30 = v_u_22[v28][v29] ~= nil
	end
	return v30
end
function v_u_19.AddFromTool(_, p31)
	-- upvalues: (ref) v_u_20, (copy) v_u_10, (copy) v_u_4, (copy) v_u_6, (copy) v_u_3, (copy) v_u_19, (ref) v_u_9
	if not v_u_20 then
		return false
	end
	if not p31:IsDescendantOf(v_u_10) then
		return false
	end
	local v32 = p31:GetAttribute(v_u_4.ITEM_TYPE)
	if not v32 then
		v_u_6:CreateNotification("This item can\'t be added to the trade!")
		return false
	end
	local v33 = v_u_3[v32]
	local v34 = p31:GetAttribute(v33 == "Pet" and "PET_UUID" or v_u_4.ITEM_UUID)
	if not (v33 and v34) then
		v_u_6:CreateNotification("This item can\'t be added to the trade!")
		return false
	end
	if p31:GetAttribute(v_u_4.Favorite) or p31:GetAttribute("Favorite") then
		v_u_6:CreateNotification("You can\'t add favorited items!")
		return true
	end
	if not v_u_19:IsItemTypeValid(v33) then
		v_u_6:CreateNotification("This item can\'t be added to the trade!")
		return false
	end
	v_u_19:AddItem(v33, v34)
	if v_u_9.IsOpened() then
		v_u_20 = false
		v_u_9.OpenClose()
	end
	return true
end
function v_u_19.Start(_)
	-- upvalues: (ref) v_u_9, (copy) v_u_1, (ref) v_u_20, (copy) v_u_19, (copy) v_u_10, (ref) v_u_22, (copy) v_u_11, (copy) v_u_5
	v_u_9 = require(v_u_1.Modules.Backpack)
	v_u_9.StateChanged.Event:Connect(function(p35)
		-- upvalues: (ref) v_u_20
		if p35 == false then
			v_u_20 = false
		end
	end)
	v_u_19.OnTradeCreated:Connect(function()
		-- upvalues: (ref) v_u_19, (ref) v_u_10, (ref) v_u_22, (ref) v_u_9
		local v36 = v_u_19.CurrentTradeReplicator
		if v36 then
			local v_u_37 = v36:GetDataAsync()
			if v_u_37 then
				local function v45()
					-- upvalues: (copy) v_u_37, (ref) v_u_10, (ref) v_u_22, (ref) v_u_9
					local v38 = {}
					local v39 = false
					for _, v40 in v_u_37.offers[table.find(v_u_37.players, v_u_10)].items do
						if not v38[v40.type] then
							v38[v40.type] = {}
						end
						local v41 = v_u_22[v40.type]
						if v41 then
							v41 = v_u_22[v40.type][v40.id] == true
						end
						v38[v40.type][v40.id] = true
						if not v41 then
							v39 = true
						end
					end
					for v42, v43 in v_u_22 do
						if v38[v42] then
							for v44 in v43 do
								if not v38[v42][v44] then
									v39 = true
								end
							end
						else
							v39 = true
						end
					end
					v_u_22 = v38
					if v39 and v_u_9.UpdateFunction then
						task.spawn(v_u_9.UpdateFunction)
					end
				end
				assert(v36:GetPathSignal("offers/@")):Connect(v45)
				v45()
			end
		else
			return
		end
	end)
	v_u_19.OnTradeDestroyed:Connect(function()
		-- upvalues: (ref) v_u_22, (ref) v_u_9
		v_u_22 = {}
		v_u_9.SetTrading(false)
		if v_u_9.UpdateFunction then
			task.spawn(v_u_9.UpdateFunction)
		end
	end)
	v_u_11.UpdateTradeState.OnClientEvent:Connect(function(p46)
		-- upvalues: (ref) v_u_19, (ref) v_u_5
		local v47 = v_u_19.CurrentTradeId
		if v47 ~= p46 then
			if v47 then
				if v_u_19.CurrentTradeReplicator then
					v_u_19.CurrentTradeReplicator:Destroy()
					v_u_19.CurrentTradeReplicator = nil
				end
				v_u_19.OnTradeDestroyed:Fire(v47)
			end
			v_u_19.CurrentTradeId = p46
			if p46 then
				v_u_19.CurrentTradeReplicator = v_u_5.new(p46)
				v_u_19.OnTradeCreated:Fire(p46, v_u_19.CurrentTradeReplicator)
			end
		end
	end)
end
task.spawn(v_u_19.Start, v_u_19)
return v_u_19