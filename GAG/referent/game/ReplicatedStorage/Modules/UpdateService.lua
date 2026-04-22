local v_u_1 = game:GetService("ReplicatedFirst")
local v_u_2 = game:GetService("ReplicatedStorage")
local v_u_3 = game:GetService("RunService")
local v4 = game:GetService("Players")
require(v_u_2.Modules.CentralTimeController)
local v5 = require(v_u_2.Modules.Signal)
local v6 = require(v_u_2.Modules.IsDev)
local v_u_7 = v4.LocalPlayer
require(v_u_2.Data.TradeWorldData)
local v_u_8 = {}
if v6() and v_u_3:IsServer() then
	if v_u_3:IsStudio() or game.PlaceId == 108890465381067 then
		v_u_1.GlobalUpdateTime.Value = workspace:GetServerTimeNow() + 20
	else
		v_u_1.GlobalUpdateTime.Value = workspace:GetServerTimeNow() + 180
	end
end
local v_u_9 = v5.new()
v_u_8.OnUpdated = v_u_9
local v_u_10 = {
	"Egg Shroom",
	"Waddling Willow",
	"Bunny Berry",
	"Bonnet Bloom",
	"Marshmallow Root",
	"Egg Melon",
	"Candy Squirrel",
	"Spring Bee",
	"Jerboa",
	"Nyala",
	"Peryton",
	"Gilded Choc Spring Bee",
	"Gilded Choc Jerboa",
	"Gilded Choc Nyala",
	"Gilded Choc Peryton",
	"Springtide Egg",
	"EASTER_2026",
	"Egg War",
	"Premium Springtide Egg"
}
local v_u_11 = { "Egg Hunt", "EASTER_2026" }
local v_u_12 = {}
local v_u_13 = workspace.Interaction.UpdateItems:GetChildren()
local v_u_14 = false
function v_u_8.IsActive(_, p15)
	-- upvalues: (copy) v_u_8
	local v16 = not v_u_8:IsHiddenFromUpdate(p15)
	if v16 then
		v16 = not v_u_8:IsHiddenAfterUpdate(p15)
	end
	return v16
end
function v_u_8.IsHiddenAfterUpdate(_, p17)
	-- upvalues: (copy) v_u_11, (copy) v_u_1
	for _, v18 in v_u_11 do
		if v18 == p17 and workspace:GetServerTimeNow() > v_u_1.GlobalUpdateTime.Value then
			return true
		end
	end
	return false
end
function v_u_8.IsHiddenFromUpdate(_, p19)
	-- upvalues: (copy) v_u_10, (copy) v_u_1
	for _, v20 in v_u_10 do
		if v20 == p19 and workspace:GetServerTimeNow() <= v_u_1.GlobalUpdateTime.Value then
			return true
		end
	end
	return false
end
function v_u_8.GetUpdateTime(_)
	-- upvalues: (copy) v_u_1
	return v_u_1.GlobalUpdateTime.Value
end
function v_u_8.GetRemainingTimeUntilUpdate(_)
	-- upvalues: (copy) v_u_1
	return v_u_1.GlobalUpdateTime.Value - workspace:GetServerTimeNow()
end
function v_u_8.IsUpdateDone(_)
	-- upvalues: (ref) v_u_14
	return v_u_14
end
task.spawn(function()
	-- upvalues: (copy) v_u_1, (copy) v_u_12, (ref) v_u_14, (copy) v_u_9, (copy) v_u_13, (copy) v_u_7
	if workspace:GetServerTimeNow() >= v_u_1.GlobalUpdateTime.Value then
		for _, v21 in v_u_12 do
			v21.Parent = script
		end
		v_u_14 = true
		v_u_9:Fire()
	else
		for _, v22 in v_u_13 do
			v22.Parent = script
		end
		while task.wait(1) and workspace:GetServerTimeNow() < v_u_1.GlobalUpdateTime.Value do

		end
		local v23
		if v_u_7 then
			v23 = v_u_7:GetAttribute("FirstTimePlayer")
		else
			v23 = nil
		end
		for _, v24 in v_u_13 do
			if not v23 then
				v24.Parent = workspace.Interaction.UpdateItems
			end
		end
		for _, v25 in v_u_12 do
			v25.Parent = script
		end
		v_u_14 = true
		v_u_9:Fire()
	end
end)
function v_u_8.ForceCompleteUpdate(_)
	-- upvalues: (copy) v_u_1, (copy) v_u_3, (copy) v_u_2
	v_u_1.GlobalUpdateTime.Value = workspace:GetServerTimeNow()
	if v_u_3:IsServer() then
		v_u_2.GameEvents.UpdateServiceForceUpdated:FireAllClients()
	end
end
if v_u_3:IsClient() then
	v_u_2.GameEvents.UpdateServiceForceUpdated.OnClientEvent:Connect(v_u_8.ForceCompleteUpdate, v_u_8)
end
return v_u_8