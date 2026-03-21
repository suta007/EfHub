local v_u_1 = game:GetService("ReplicatedStorage")
local v_u_2 = game:GetService("RunService")
local v3 = game:GetService("CollectionService")
local v4 = game:GetService("Players")
local v_u_5 = require(v_u_1.Data.TradeWorldData)
local v_u_6 = v_u_1.GameEvents.TradeWorld.TravelToTradeWorld
local v_u_7 = v_u_1.GameEvents.TradeWorld.TravelToMainWorld
local v_u_8 = v3:GetTagged("TradeWorldPrompt")
local v_u_9 = v3:GetTagged("MainWorldPrompt")[1]
local v_u_10 = v4.LocalPlayer
local v_u_18 = {
	["IsInWorld"] = function(_)
		-- upvalues: (copy) v_u_5
		return game.PlaceId == v_u_5.PlaceId and true or v_u_5.ForceInWorld
	end,
	["IsPlayerANoob"] = function(_)
		-- upvalues: (copy) v_u_2, (copy) v_u_1
		local v11 = nil
		if v_u_2:IsServer() then
			return false
		else
			if v_u_2:IsClient() then
				v11 = require(v_u_1.Modules.DataService):GetData()
			end
			if v11 then
				local v12 = v11.TotalCropsValueSold
				local v13 = v11.Sheckles
				if v12 >= 100000 or v13 >= 100000 then
					return false
				else
					return v12 + v13 < 100000
				end
			else
				warn("TradeWorldController | No player data found.")
				return true
			end
		end
	end,
	["TeleportToTradeWorld"] = function(_)
		-- upvalues: (copy) v_u_18, (copy) v_u_1, (copy) v_u_6
		if v_u_18:IsPlayerANoob() then
			require(v_u_1.Modules.Notification):CreateNotification("You\'re not ready yet. You need to have earned at least 100,000\194\162!")
		else
			v_u_6:FireServer()
		end
	end,
	["TeleportToMainWorld"] = function(_)
		-- upvalues: (copy) v_u_7
		v_u_7:FireServer()
	end,
	["TradeWorldInitializer"] = function(_)
		-- upvalues: (copy) v_u_18, (copy) v_u_10, (copy) v_u_8
		if v_u_18:IsInWorld() then
			task.spawn(function()
				-- upvalues: (ref) v_u_10, (ref) v_u_8
				if v_u_10 then
					local v14 = v_u_10.PlayerGui
					task.wait(3)
					for _, v15 in v_u_8 do
						v15.Enabled = false
					end
					local v16 = v14.Hud_UI
					v16.SideBtns.GardenGuide.Visible = false
					v16.SideBtns.Pass.Visible = false
					v14.ActivePetUI.Frame.Opener.Visible = false
					local v_u_17 = v14.FriendBoost
					v_u_17.Enabled = false
					v_u_17:GetPropertyChangedSignal("Enabled"):Once(function()
						-- upvalues: (copy) v_u_17
						v_u_17.Enabled = false
					end)
				end
			end)
		end
	end
}
v_u_18:TradeWorldInitializer()
for _, v19 in v_u_8 do
	if v19:IsA("ProximityPrompt") then
		v19.Triggered:Connect(function()
			-- upvalues: (copy) v_u_2, (copy) v_u_18
			if not v_u_2:IsServer() then
				v_u_18:TeleportToTradeWorld()
			end
		end)
	end
end
local v_u_20
if v_u_9 then
	v_u_20 = v_u_9.Triggered:Connect(function()
		-- upvalues: (copy) v_u_2, (copy) v_u_18
		if not v_u_2:IsServer() then
			v_u_18:TeleportToMainWorld()
		end
	end)
else
	v_u_20 = nil
end
v3:GetInstanceAddedSignal("MainWorldPrompt"):Connect(function(p21)
	-- upvalues: (ref) v_u_20, (copy) v_u_9, (copy) v_u_2, (copy) v_u_7
	if p21:IsA("ProximityPrompt") then
		if v_u_20 then
			v_u_20:Disconnect()
			v_u_20 = nil
		end
		v_u_20 = v_u_9.Triggered:Connect(function()
			-- upvalues: (ref) v_u_2, (ref) v_u_7
			if not v_u_2:IsServer() then
				v_u_7:FireServer()
			end
		end)
	end
end)
v3:GetInstanceRemovedSignal("MainWorldPrompt"):Connect(function(p22)
	-- upvalues: (ref) v_u_20
	if p22:IsA("ProximityPrompt") and v_u_20 then
		v_u_20:Disconnect()
		v_u_20 = nil
	end
end)
return v_u_18