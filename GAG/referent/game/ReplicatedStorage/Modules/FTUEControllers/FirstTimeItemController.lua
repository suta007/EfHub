local v_u_1 = {}
local v2 = game:GetService("Players")
local v3 = game:GetService("ReplicatedStorage")
local v_u_4 = v3.GameEvents.FirstTimeItemService.Complete
local v_u_5 = v2.LocalPlayer
local v_u_6 = v_u_5:WaitForChild("PlayerGui")
local v_u_7 = require(v3.Modules.DataService)
function v_u_1.Start(_)
	-- upvalues: (copy) v_u_7, (copy) v_u_6, (copy) v_u_5, (copy) v_u_4
	local v_u_8 = v_u_7:GetData()
	if v_u_8.ArbitraryFTUEData.AcknowledgedBackpack then
		return
	else
		local v_u_9 = v_u_6:WaitForChild("BackpackGui"):WaitForChild("Backpack"):WaitForChild("Inventory")
		local v_u_10 = v_u_6:WaitForChild("TopbarStandard"):WaitForChild("Holders"):WaitForChild("Left"):WaitForChild("InventoryIcon")
		if v_u_10:FindFirstChild("ClickRegion", true) then
			local v_u_11 = script:WaitForChild("NotificationTemplate")
			local v12 = v_u_8.ArbitraryFTUEData.AcknowledgedBackpack
			local v13 = v_u_10:FindFirstChild("NotificationTemplate")
			if v12 and v13 then
				v13:Destroy()
			end
			v_u_7:GetPathSignal("ArbitraryFTUEData/@"):Connect(function()
				-- upvalues: (copy) v_u_8, (copy) v_u_10
				local v14 = v_u_8.ArbitraryFTUEData.AcknowledgedBackpack
				local v15 = v_u_10:FindFirstChild("NotificationTemplate")
				if v14 and v15 then
					v15:Destroy()
				end
			end)
			task.delay(1, function()
				-- upvalues: (ref) v_u_5, (copy) v_u_8, (copy) v_u_10, (copy) v_u_11
				v_u_5:WaitForChild("Backpack").ChildAdded:Connect(function()
					-- upvalues: (ref) v_u_8, (ref) v_u_10, (ref) v_u_11
					print("test")
					if v_u_8.ArbitraryFTUEData.AcknowledgedBackpack then
						return
					elseif not v_u_10:FindFirstChild("NotificationTemplate") then
						v_u_11:Clone().Parent = v_u_10
					end
				end)
			end)
			v_u_9:GetPropertyChangedSignal("Visible"):Connect(function()
				-- upvalues: (copy) v_u_9, (ref) v_u_4
				if v_u_9.Visible then
					v_u_4:FireServer()
				end
			end)
		end
	end
end
task.spawn(function()
	-- upvalues: (copy) v_u_1
	v_u_1:Start()
end)
return v_u_1