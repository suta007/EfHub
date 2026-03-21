game:GetService("CollectionService")
local v_u_1 = game:GetService("TweenService")
game:GetService("RunService")
local v2 = game:GetService("ReplicatedStorage")
v2:WaitForChild("Modules")
local v3 = require(v2.Modules.CreateTagHandler)
local v_u_4 = {}
local v_u_5 = require(v2.Modules.Settings.SettingsService)
local v6 = require(v2.Modules.DataService)
local v_u_7 = require(game.ReplicatedStorage.Modules.OptimisationControllers.IsMobile)() and 0.25 or 0.1
local v_u_8 = not v_u_5:GetSetting("PerformanceMode")
local v_u_9 = nil
v_u_9 = v6:GetPathSignal("Settings/@"):Connect(function()
	-- upvalues: (ref) v_u_8, (copy) v_u_5, (ref) v_u_9
	v_u_8 = not v_u_5:GetSetting("PerformanceMode")
	if not v_u_8 then
		if v_u_9 then
			v_u_9:Disconnect()
			v_u_9 = nil
		end
	end
end)
local v_u_10 = { Color3.fromRGB(255, 170, 255), Color3.fromRGB(255, 255, 100) }
local function v_u_14(p11)
	-- upvalues: (copy) v_u_10, (copy) v_u_1
	local v12 = v_u_10[math.random(1, #v_u_10)]
	local v13 = v_u_10[math.random(1, #v_u_10)]
	while v13 == v12 do
		v13 = v_u_10[math.random(1, #v_u_10)]
	end
	p11.Value = v12
	return v_u_1:Create(p11, TweenInfo.new(math.random(2, 5) + math.random(), Enum.EasingStyle.Linear, Enum.EasingDirection.InOut, 0, false, math.random()), {
		["Value"] = v13
	})
end
v3({
	["Tag"] = "AstralVisual",
	["OnInstanceAdded"] = function(p15)
		-- upvalues: (copy) v_u_4, (ref) v_u_8, (copy) v_u_10, (copy) v_u_14
		local v_u_16 = Instance.new("Color3Value")
		v_u_16.Value = p15.Color
		v_u_16.Name = "AstralColorValue"
		v_u_16.Parent = p15
		v_u_4[p15] = {
			["Material"] = p15.Material,
			["Color"] = p15.Color,
			["ColorValue"] = v_u_16
		}
		if v_u_8 then
			task.spawn(function()
				-- upvalues: (copy) v_u_16, (ref) v_u_10, (ref) v_u_14
				while v_u_16.Parent do
					if math.random() < 0.2 then
						v_u_16.Value = v_u_10[math.random(1, #v_u_10)]
						task.wait(math.random(1, 3) * 0.2)
					else
						local v17 = v_u_14(v_u_16)
						v17:Play()
						v17.Completed:Wait()
					end
				end
			end)
		end
	end,
	["OnInstanceRemoved"] = function(p18)
		-- upvalues: (copy) v_u_4
		local v19 = v_u_4[p18]
		if v19 then
			p18.Material = v19.Material
			p18.Color = v19.Color
			if v19.ColorValue then
				v19.ColorValue:Destroy()
			end
			v_u_4[p18] = nil
		end
	end
})
task.spawn(function()
	-- upvalues: (ref) v_u_8, (copy) v_u_4, (copy) v_u_7
	while v_u_8 do
		local v20 = 0
		for v21, v22 in v_u_4 do
			if v21 and v21:IsDescendantOf(workspace) then
				v21.Color = v22.ColorValue.Value
			end
			v20 = v20 + 1
			if v20 % 5 == 0 then
				task.wait()
			end
		end
		task.wait(v_u_7)
	end
end)