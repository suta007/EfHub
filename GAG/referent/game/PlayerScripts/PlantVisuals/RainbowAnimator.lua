game:GetService("CollectionService")
game:GetService("RunService")
local v1 = game:GetService("ReplicatedStorage")
v1:WaitForChild("Modules")
local v2 = require(v1.Modules.CreateTagHandler)
local v_u_3 = {}
local v_u_4 = require(v1.Modules.Settings.SettingsService)
local v5 = require(v1.Modules.DataService)
local v_u_6 = require(game.ReplicatedStorage.Modules.OptimisationControllers.IsMobile)() and 0.25 or 0.1
local v_u_7 = not v_u_4:GetSetting("PerformanceMode")
local v_u_8 = nil
v_u_8 = v5:GetPathSignal("Settings/@"):Connect(function()
	-- upvalues: (ref) v_u_7, (copy) v_u_4, (ref) v_u_8
	v_u_7 = not v_u_4:GetSetting("PerformanceMode")
	if not v_u_7 then
		if v_u_8 then
			v_u_8:Disconnect()
			v_u_8 = nil
		end
	end
end)
local v_u_9 = {}
local v_u_10 = 0
v2({
	["Tag"] = "RainbowPart",
	["OnInstanceAdded"] = function(p_u_11)
		-- upvalues: (copy) v_u_9, (copy) v_u_3, (ref) v_u_10
		v_u_9[p_u_11] = p_u_11.AncestryChanged:Connect(function(_, _)
			-- upvalues: (copy) p_u_11, (ref) v_u_3, (ref) v_u_10
			if p_u_11:IsDescendantOf(workspace) then
				if not v_u_3[p_u_11] then
					v_u_3[p_u_11] = true
					v_u_10 = v_u_10 + 1
					return
				end
			elseif v_u_3[p_u_11] then
				v_u_3[p_u_11] = nil
				v_u_10 = v_u_10 - 1
			end
		end)
		if p_u_11:IsDescendantOf(workspace) and not v_u_3[p_u_11] then
			v_u_3[p_u_11] = true
			v_u_10 = v_u_10 + 1
		end
	end,
	["OnInstanceRemoved"] = function(p12)
		-- upvalues: (copy) v_u_3, (ref) v_u_10, (copy) v_u_9
		if v_u_3[p12] then
			v_u_10 = v_u_10 - 1
			v_u_3[p12] = nil
		end
		v_u_9[p12]:Disconnect()
		v_u_9[p12] = nil
	end
})
task.spawn(function()
	-- upvalues: (ref) v_u_7, (ref) v_u_10, (copy) v_u_6, (copy) v_u_3
	while v_u_7 do
		if v_u_10 <= 0 then
			task.wait(v_u_6)
		else
			local v13 = Color3.fromHSV(os.clock() % 10 / 10, 1, 1)
			local v14 = 0
			for v15 in v_u_3 do
				v14 = v14 + 1
				v15.Color = v13
				if v14 % 20 == 0 then
					task.wait()
				end
			end
			task.wait(v_u_6)
		end
	end
end)