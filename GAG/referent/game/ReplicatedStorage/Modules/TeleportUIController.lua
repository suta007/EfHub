local v1 = game:GetService("Players")
local v2 = game:GetService("ReplicatedStorage")
local v_u_3 = require(v2.Modules.GetFarm)
local v_u_4 = require(v2.Modules.DataService)
local v_u_5 = require(v2.Modules.Notification)
local v_u_6 = require(v2.Modules.SaveSlotControllers.SaveSlotUIController)
local v_u_7 = require(v2.Modules.TeleportPlayer)
require(script.ABTestTeleportButtons)
local v8 = v2:WaitForChild("GameEvents")
v8:WaitForChild("RecallWrenchTeleport")
v8:WaitForChild("PlayerTeleportTriggered")
local v_u_9 = v1.LocalPlayer
assert(v_u_9, "LocalPlayer is nil")
local v_u_10 = v_u_9.PlayerGui.Teleport_UI
local v_u_13 = {
	["Move"] = function(_, p11, p12)
		-- upvalues: (copy) v_u_7, (copy) v_u_9
		v_u_7(v_u_9, p11, p12)
	end
}
v_u_9:GetAttribute("OtherButtons")
v_u_9:GetAttributeChangedSignal("OtherButtons"):Connect(function()
	-- upvalues: (copy) v_u_9
	v_u_9:GetAttribute("OtherButtons")
end)
task.spawn(function()
	-- upvalues: (copy) v_u_10, (copy) v_u_6, (copy) v_u_3, (copy) v_u_9, (copy) v_u_13, (copy) v_u_5
	v_u_10.Frame.Garden.Activated:Connect(function()
		-- upvalues: (ref) v_u_6, (ref) v_u_3, (ref) v_u_9, (ref) v_u_13, (ref) v_u_5
		if v_u_6.State then
			return
		else
			local v14 = v_u_3(v_u_9)
			if v14 == nil then
				v_u_5:CreateNotification("You haven\'t been a assigned to a farm yet! Please be patient.")
			else
				v_u_13:Move(v14.Spawn_Point.CFrame, "Farm")
			end
		end
	end)
	v_u_10.Frame.Seeds.Activated:Connect(function()
		-- upvalues: (ref) v_u_6, (ref) v_u_13
		if not v_u_6.State then
			v_u_13:Move(workspace.Tutorial_Points.Tutorial_Point_1.CFrame, "Seed Shop")
		end
	end)
	v_u_10.Frame.Sell.Activated:Connect(function()
		-- upvalues: (ref) v_u_6, (ref) v_u_13
		if not v_u_6.State then
			v_u_13:Move(workspace.Tutorial_Points.Tutorial_Point_2.CFrame, "Sell Shop")
		end
	end)
	v_u_10.Frame.Gear.Activated:Connect(function()
		-- upvalues: (ref) v_u_6, (ref) v_u_13
		if not v_u_6.State then
			v_u_13:Move(workspace.Tutorial_Points.Tutorial_Point_3.CFrame, "Sell Shop")
		end
	end)
	v_u_10.Frame.Pets.Activated:Connect(function()
		-- upvalues: (ref) v_u_6, (ref) v_u_13
		if not v_u_6.State then
			v_u_13:Move(workspace.Tutorial_Points.Tutorial_Point_4.CFrame, "Sell Shop")
		end
	end)
end)
task.spawn(function()
	-- upvalues: (copy) v_u_4, (copy) v_u_9
	local v15 = v_u_4:GetData()
	if v15 then
		local v16 = v15.InventoryData
		if v16 then
			for _, v17 in v16 do
				if v17.ItemType == "Recall Wrench" then
					return
				end
			end
		else
			warn((("No player inventory data for %*"):format(v_u_9.Name)))
		end
	else
		warn((("No player data for %*"):format(v_u_9.Name)))
		return
	end
end)
return v_u_13