local v1 = game:GetService("Players")
local v2 = game:GetService("ReplicatedStorage")
local v_u_3 = require(v2.Modules.GetFarm)
local v_u_4 = require(v2.Modules.DataService)
local v_u_5 = require(v2.Modules.Notification)
local v_u_6 = require(v2.Modules.SaveSlotControllers.SaveSlotUIController)
local v_u_7 = require(v2.Modules.SaveSlotControllers.SaveSlotController)
local v_u_8 = require(v2.Modules.TeleportPlayer)
require(script.ABTestTeleportButtons)
local v_u_9 = require(v2.Modules.UpdateService)
local v10 = v2:WaitForChild("GameEvents")
v10:WaitForChild("RecallWrenchTeleport")
v10:WaitForChild("PlayerTeleportTriggered")
local v_u_11 = v1.LocalPlayer
assert(v_u_11, "LocalPlayer is nil")
local v_u_12 = v_u_11.PlayerGui.Teleport_UI.Frame
local v_u_13 = {}
local v_u_14 = nil
local function v19()
	-- upvalues: (copy) v_u_7, (copy) v_u_9, (ref) v_u_14, (copy) v_u_12
	while true do
		local v15 = v_u_7:GetCurrentSaveSlot()
		local v16
		if v15 then
			if v_u_9:IsUpdateDone() then
				if v15.IsEasterSlot == true then
					v16 = true
				else
					v16 = false
				end
			else
				v16 = false
			end
		else
			v16 = false
		end
		if v_u_14 ~= v16 then
			v_u_14 = v16
			local v17 = v_u_7:GetCurrentSaveSlot()
			local v18
			if v17 then
				if v_u_9:IsUpdateDone() then
					if v17.IsEasterSlot == true then
						v18 = true
					else
						v18 = false
					end
				else
					v18 = false
				end
			else
				v18 = false
			end
			v_u_12.Garden.Visible = not v18
			v_u_12.Seeds.Visible = not v18
			v_u_12.Sell.Visible = not v18
			v_u_12.Easter_Garden.Visible = v18
			v_u_12.Easter_Seeds.Visible = v18
			v_u_12.Easter_Sell.Visible = v18
		end
		task.wait(0.2)
	end
end
function v_u_13.Move(_, p20, p21)
	-- upvalues: (copy) v_u_8, (copy) v_u_11
	v_u_8(v_u_11, p20, p21)
end
local function v32()
	-- upvalues: (copy) v_u_12, (copy) v_u_6, (copy) v_u_3, (copy) v_u_11, (copy) v_u_13, (copy) v_u_5, (copy) v_u_7, (copy) v_u_9
	v_u_12.Garden.Activated:Connect(function()
		-- upvalues: (ref) v_u_6, (ref) v_u_3, (ref) v_u_11, (ref) v_u_13, (ref) v_u_5
		if v_u_6.State then
			return
		else
			local v22 = v_u_3(v_u_11)
			if v22 == nil then
				v_u_5:CreateNotification("You haven\'t been a assigned to a farm yet! Please be patient.")
			else
				v_u_13:Move(v22.Spawn_Point.CFrame, "Farm")
			end
		end
	end)
	v_u_12.Easter_Garden.Activated:Connect(function()
		-- upvalues: (ref) v_u_6, (ref) v_u_3, (ref) v_u_11, (ref) v_u_13, (ref) v_u_5
		if v_u_6.State then
			return
		else
			local v23 = v_u_3(v_u_11)
			if v23 == nil then
				v_u_5:CreateNotification("You haven\'t been a assigned to a farm yet! Please be patient.")
			else
				v_u_13:Move(v23.Spawn_Point.CFrame, "Farm")
			end
		end
	end)
	v_u_12.Seeds.Activated:Connect(function()
		-- upvalues: (ref) v_u_6, (ref) v_u_7, (ref) v_u_9, (ref) v_u_13
		if v_u_6.State then
			return
		else
			local v24 = v_u_7:GetCurrentSaveSlot()
			local v25
			if v24 and v_u_9:IsUpdateDone() then
				v25 = v24.IsEasterSlot == true
			else
				v25 = false
			end
			if v25 then
				v_u_13:Move(workspace.Easter_Points.Easter_Point_1.CFrame, "Seed Shop")
			else
				v_u_13:Move(workspace.Tutorial_Points.Tutorial_Point_1.CFrame, "Seed Shop")
			end
		end
	end)
	v_u_12.Easter_Seeds.Activated:Connect(function()
		-- upvalues: (ref) v_u_6, (ref) v_u_7, (ref) v_u_9, (ref) v_u_13
		if v_u_6.State then
			return
		else
			local v26 = v_u_7:GetCurrentSaveSlot()
			local v27
			if v26 and v_u_9:IsUpdateDone() then
				v27 = v26.IsEasterSlot == true
			else
				v27 = false
			end
			if v27 then
				v_u_13:Move(workspace.Easter_Points.Easter_Point_1.CFrame, "Seed Shop")
			else
				v_u_13:Move(workspace.Tutorial_Points.Tutorial_Point_1.CFrame, "Seed Shop")
			end
		end
	end)
	v_u_12.Sell.Activated:Connect(function()
		-- upvalues: (ref) v_u_6, (ref) v_u_7, (ref) v_u_9, (ref) v_u_13
		if v_u_6.State then
			return
		else
			local v28 = v_u_7:GetCurrentSaveSlot()
			local v29
			if v28 and v_u_9:IsUpdateDone() then
				v29 = v28.IsEasterSlot == true
			else
				v29 = false
			end
			if v29 then
				v_u_13:Move(workspace.Easter_Points.Easter_Point_2.CFrame, "Sell Shop")
			else
				v_u_13:Move(workspace.Tutorial_Points.Tutorial_Point_2.CFrame, "Sell Shop")
			end
		end
	end)
	v_u_12.Easter_Sell.Activated:Connect(function()
		-- upvalues: (ref) v_u_6, (ref) v_u_7, (ref) v_u_9, (ref) v_u_13
		if v_u_6.State then
			return
		else
			local v30 = v_u_7:GetCurrentSaveSlot()
			local v31
			if v30 and v_u_9:IsUpdateDone() then
				v31 = v30.IsEasterSlot == true
			else
				v31 = false
			end
			if v31 then
				v_u_13:Move(workspace.Easter_Points.Easter_Point_2.CFrame, "Sell Shop")
			else
				v_u_13:Move(workspace.Tutorial_Points.Tutorial_Point_2.CFrame, "Sell Shop")
			end
		end
	end)
	v_u_12.Gear.Activated:Connect(function()
		-- upvalues: (ref) v_u_6, (ref) v_u_13
		if not v_u_6.State then
			v_u_13:Move(workspace.Tutorial_Points.Tutorial_Point_3.CFrame, "Sell Shop")
		end
	end)
	v_u_12.Pets.Activated:Connect(function()
		-- upvalues: (ref) v_u_6, (ref) v_u_13
		if not v_u_6.State then
			v_u_13:Move(workspace.Tutorial_Points.Tutorial_Point_4.CFrame, "Sell Shop")
		end
	end)
end
local function v35()
	-- upvalues: (copy) v_u_11, (copy) v_u_7, (copy) v_u_9, (copy) v_u_12
	v_u_11:GetAttribute("OtherButtons")
	local v33 = v_u_7:GetCurrentSaveSlot()
	local v34
	if v33 and v_u_9:IsUpdateDone() then
		v34 = v33.IsEasterSlot == true
	else
		v34 = false
	end
	v_u_12.Garden.Visible = not v34
	v_u_12.Seeds.Visible = not v34
	v_u_12.Sell.Visible = not v34
	v_u_12.Easter_Garden.Visible = v34
	v_u_12.Easter_Seeds.Visible = v34
	v_u_12.Easter_Sell.Visible = v34
end
v_u_11:GetAttribute("OtherButtons")
local v36 = v_u_7:GetCurrentSaveSlot()
local v37
if v36 and v_u_9:IsUpdateDone() then
	v37 = v36.IsEasterSlot == true
else
	v37 = false
end
v_u_12.Garden.Visible = not v37
v_u_12.Seeds.Visible = not v37
v_u_12.Sell.Visible = not v37
v_u_12.Easter_Garden.Visible = v37
v_u_12.Easter_Seeds.Visible = v37
v_u_12.Easter_Sell.Visible = v37
v_u_11:GetAttributeChangedSignal("OtherButtons"):Connect(v35)
task.spawn(v32)
task.spawn(function()
	-- upvalues: (copy) v_u_4, (copy) v_u_11
	local v38 = v_u_4:GetData()
	if v38 then
		local v39 = v38.InventoryData
		if v39 then
			for _, v40 in v39 do
				if v40.ItemType == "Recall Wrench" then
					return
				end
			end
		else
			warn((("No player inventory data for %*"):format(v_u_11.Name)))
		end
	else
		warn((("No player data for %*"):format(v_u_11.Name)))
		return
	end
end)
task.spawn(v35)
task.spawn(v19)
return v_u_13