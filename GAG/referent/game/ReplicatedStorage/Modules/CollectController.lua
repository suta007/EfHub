local v_u_1 = game:GetService("ProximityPromptService")
game:GetService("CollectionService")
local v_u_2 = game:GetService("ReplicatedStorage")
local v_u_3 = game:GetService("UserInputService")
local v4 = game:GetService("RunService")
game:GetService("GuiService")
local v5 = game:GetService("Players")
local v6 = require(v_u_2.Modules.Trove)
require(v_u_2.Modules.Notification)
local v_u_7 = require(v_u_2.Modules.GetFarm)
local v_u_8 = require(v_u_2.Modules.InventoryService)
local v_u_9 = v4:IsStudio() and false
local v_u_10 = v5.LocalPlayer
local v_u_11 = v_u_10.PlayerGui
local v_u_12 = v_u_11:WaitForChild("HoldToCollect")
local _ = v_u_10.Backpack
local v_u_13 = {}
local v_u_14 = v6.new()
local v_u_21 = {
	["_lastCollected"] = 0,
	["_holding"] = false,
	["_updateButtonState"] = function(_)
		-- upvalues: (copy) v_u_12, (copy) v_u_13
		v_u_12.Collect.Visible = next(v_u_13) ~= nil
	end,
	["Collect"] = function(p15)
		-- upvalues: (copy) v_u_14, (copy) v_u_13, (copy) v_u_2
		local v16 = os.clock()
		v_u_14:Clean()
		local _ = v16 - p15._lastCollected
		p15._lastCollected = v16
		local v17 = {}
		for v_u_18, _ in v_u_13 do
			v_u_18:SetAttribute("Collected", true)
			task.delay(1, function()
				-- upvalues: (copy) v_u_18
				v_u_18:SetAttribute("Collected", nil)
			end)
			local v19 = v_u_18.Parent
			if v19 then
				v19 = v_u_18.Parent.Parent
			end
			if v19 then
				table.insert(v17, v19)
			end
		end
		if #v17 > 0 then
			p15._lastCollected = v16
			v_u_2.GameEvents.Crops.Collect:FireServer(v17)
			local v20
			if v17[1].Variant.Value == "Normal" then
				v20 = game.SoundService.Collect.Name
			else
				v20 = v17[1].Variant.Value
			end
			game.ReplicatedStorage.GameEvents.PickupEvent:Fire(v20)
		end
	end,
}
local v_u_22 = require(game.ReplicatedStorage.Code.Queue)
local v_u_23 = workspace.Terrain:WaitForChild("PickupParticle")
function v_u_21.Start(p_u_24)
	-- upvalues: (copy) v_u_3, (copy) v_u_9, (copy) v_u_12, (copy) v_u_1, (copy) v_u_13, (copy) v_u_11, (copy) v_u_10, (copy) v_u_7, (copy) v_u_22, (copy) v_u_8, (copy) v_u_23
	local function v26()
		-- upvalues: (ref) v_u_3, (ref) v_u_9, (ref) v_u_12
		local v25 = v_u_3.TouchEnabled
		if v25 then
			v25 = v_u_3:GetLastInputType() == Enum.UserInputType.Touch
		end
		v_u_12.Enabled = v25 or v_u_9
	end
	v_u_3.LastInputTypeChanged:Connect(v26)
	local v27 = v_u_3.TouchEnabled
	if v27 then
		v27 = v_u_3:GetLastInputType() == Enum.UserInputType.Touch
	end
	v_u_12.Enabled = v27 or v_u_9
	task.delay(3, function()
		-- upvalues: (ref) v_u_3, (ref) v_u_9, (ref) v_u_12
		local v28 = v_u_3.TouchEnabled
		if v28 then
			v28 = v_u_3:GetLastInputType() == Enum.UserInputType.Touch
		end
		v_u_12.Enabled = v28 or v_u_9
	end)
	local v_u_29 = nil
	local v_u_30 = 0
	local v_u_31 = nil
	v_u_1.PromptShown:Connect(function(p32)
		-- upvalues: (ref) v_u_13, (copy) p_u_24, (ref) v_u_31
		if p32:HasTag("CollectPrompt") then
			v_u_13[p32] = true
			p_u_24:_updateButtonState()
		end
		v_u_31 = p32
	end)
	v_u_1.PromptHidden:Connect(function(p33)
		-- upvalues: (ref) v_u_13, (copy) p_u_24, (ref) v_u_31
		if p33:HasTag("CollectPrompt") then
			v_u_13[p33] = nil
			p_u_24:_updateButtonState()
		end
		if v_u_31 == p33 then
			v_u_31 = nil
		end
	end)
	local function v_u_39(_)
		-- upvalues: (copy) p_u_24, (ref) v_u_30, (ref) v_u_11, (ref) v_u_10, (ref) v_u_7, (ref) v_u_22, (ref) v_u_31, (ref) v_u_1, (ref) v_u_13, (ref) v_u_8, (ref) v_u_23
		if p_u_24._holding then
			return
		end
		p_u_24._holding = true
		v_u_30 = 0
		v_u_11.PickupTally.TextLabel.val:SetAttribute("LastUpdate", os.time() - 5)
		v_u_11.PickupTally.TextLabel.val:SetAttribute("ActualValue", 0)
		v_u_10.PlayerScripts.CollectionQOL.Enabled = false
		local v34 = v_u_7(v_u_10)
		local v_u_35 = v_u_22.new()
		if v_u_31 then
			v_u_35:enqueue(v_u_31)
		end
		v_u_1.PromptShown:Connect(function(p36)
			-- upvalues: (copy) v_u_35
			if not table.find(v_u_35._queue, p36) then
				v_u_35:enqueue(p36)
			end
		end)
		while true do
			while true do
				if not p_u_24._holding then
					v_u_10.PlayerScripts.CollectionQOL.Enabled = true
					return
				end
				if v_u_35:isEmpty() then
					break
				end
				local v_u_37 = v_u_35:dequeue()
				os.time()
				if v_u_37 then
					if v_u_37:IsDescendantOf(v34) and (v_u_37:HasTag("CollectPrompt") and (v_u_37:GetAttribute("Collected") ~= true and (v_u_37:IsDescendantOf(v34) and (v_u_37:IsDescendantOf(workspace) and v_u_37.Enabled)))) then
						v_u_37.Enabled = false
						task.delay(1, function()
							-- upvalues: (copy) v_u_37
							if v_u_37 and v_u_37:IsDescendantOf(workspace) then
								v_u_37.Enabled = true
							end
						end)
						v_u_13[v_u_37] = true
						p_u_24:_updateButtonState()
						p_u_24:Collect()
						local v38 = v_u_37.Parent
						if v38 then
							v38 = v_u_37.Parent.Parent
						end
						if v38:FindFirstChild("Variant") then
							if v_u_8.IsMaxInventory(v_u_10) == false then
								v_u_23.WorldPosition = v_u_37.Parent.Position
								v_u_23.ParticleEmitter:Emit(Random.new():NextInteger(1, 3))
								v_u_23.Gradient:Emit(1)
							end
							goto l11
						end
					end
				else
					::l11::
					task.wait(0.125)
				end
			end
			task.wait(0.125)
		end
	end
	v_u_1.PromptTriggered:Connect(function(p40)
		-- upvalues: (ref) v_u_3, (copy) v_u_39
		if p40:HasTag("CollectPrompt") then
			if v_u_3:IsKeyDown(Enum.KeyCode.E) or v_u_3:IsGamepadButtonDown(Enum.UserInputType.Gamepad1, Enum.KeyCode.ButtonX) then
				local v_u_41 = false
				local v_u_42 = nil
				v_u_42 = v_u_3.InputEnded:Connect(function(p43)
					-- upvalues: (ref) v_u_42, (ref) v_u_41
					if p43.KeyCode == Enum.KeyCode.E or p43.KeyCode == Enum.KeyCode.ButtonX then
						v_u_42:Disconnect()
						v_u_41 = true
					end
				end)
				task.wait(1)
				if not v_u_41 then
					v_u_42:Disconnect()
					v_u_39(false)
				end
			end
		else
			return
		end
	end)
	v_u_3.InputBegan:Connect(function(p44, p45)
		-- upvalues: (ref) v_u_29, (ref) v_u_3, (copy) v_u_39
		if not p45 and (p44.KeyCode == Enum.KeyCode.E or p44.KeyCode == Enum.KeyCode.ButtonX) then
			v_u_29 = p44
			local v_u_46 = false
			local v_u_47 = nil
			v_u_47 = v_u_3.InputEnded:Connect(function(p48)
				-- upvalues: (ref) v_u_47, (ref) v_u_46
				if p48.KeyCode == Enum.KeyCode.E or p48.KeyCode == Enum.KeyCode.ButtonX then
					v_u_47:Disconnect()
					v_u_46 = true
				end
			end)
			task.wait(1)
			if not v_u_46 and (game:GetService("UserInputService"):IsGamepadButtonDown(Enum.UserInputType.Gamepad1, Enum.KeyCode.ButtonX) or game:GetService("UserInputService"):IsKeyDown(Enum.KeyCode.E)) then
				v_u_47:Disconnect()
				v_u_39(false)
			end
		end
	end)
	p_u_24:_updateButtonState()
	v_u_12.Collect.MouseButton1Down:Connect(function()
		-- upvalues: (copy) p_u_24, (ref) v_u_12, (copy) v_u_39
		p_u_24:Collect()
		local v_u_49 = false
		local v_u_50 = nil
		v_u_50 = v_u_12.Collect.MouseButton1Up:Connect(function()
			-- upvalues: (ref) v_u_49, (ref) v_u_50
			v_u_49 = true
			if v_u_50 then
				v_u_50:Disconnect()
			end
		end)
		task.delay(0.1, function()
			-- upvalues: (ref) v_u_50, (ref) v_u_49, (ref) v_u_39
			if v_u_50 then
				v_u_50:Disconnect()
			end
			if not v_u_49 then
				v_u_39(true)
			end
		end)
	end)
	v_u_3.InputEnded:Connect(function(p51, _)
		-- upvalues: (copy) p_u_24
		if p51.KeyCode == Enum.KeyCode.E or p51.KeyCode == Enum.KeyCode.ButtonX then
			p_u_24._holding = false
		end
		if p51.UserInputType == Enum.UserInputType.Touch or p51.UserInputType == Enum.UserInputType.MouseButton1 then
			p_u_24._holding = false
		end
	end)
	v_u_3.WindowFocusReleased:Connect(function()
		-- upvalues: (copy) p_u_24
		p_u_24._holding = false
	end)
	v_u_11:WaitForChild("PickupTally").Enabled = true
end
task.spawn(function()
	-- upvalues: (copy) v_u_21
	while true do
		task.wait(2)
		v_u_21:_updateButtonState()
	end
end)
task.spawn(v_u_21.Start, v_u_21)
return v_u_21
