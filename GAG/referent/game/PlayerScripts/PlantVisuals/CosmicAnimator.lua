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
local function v_u_13(p10)
	-- upvalues: (ref) v_u_8, (copy) v_u_1
	if v_u_8 then
		local v11 = Color3.fromRGB(150, 92, 186)
		p10.Value = Color3.fromRGB(255, 255, 100)
		local v12 = v_u_1:Create(p10, TweenInfo.new(3 + math.random(), Enum.EasingStyle.Linear, Enum.EasingDirection.InOut, -1, true), {
			["Value"] = v11
		})
		v12:Play()
		return v12
	end
end
v3({
	["Tag"] = "CosmicVisual",
	["OnInstanceAdded"] = function(p14)
		-- upvalues: (copy) v_u_13, (copy) v_u_4
		local v15 = Instance.new("Color3Value")
		v15.Value = p14.Color
		v15.Name = "CosmicColorValue"
		v15.Parent = p14
		local v16 = v_u_13(v15)
		v_u_4[p14] = {
			["Material"] = p14.Material,
			["Color"] = p14.Color,
			["ColorValue"] = v15,
			["Tween"] = v16
		}
	end,
	["OnInstanceRemoved"] = function(p17)
		-- upvalues: (copy) v_u_4
		local v18 = v_u_4[p17]
		if v18 then
			p17.Material = v18.Material
			p17.Color = v18.Color
			if v18.Tween then
				v18.Tween:Cancel()
				v18.Tween:Destroy()
				v18.Tween = nil
			end
			if v18.ColorValue then
				v18.ColorValue:Destroy()
			end
			v_u_4[p17] = nil
		end
	end
})
task.spawn(function()
	-- upvalues: (ref) v_u_8, (copy) v_u_4, (copy) v_u_7
	while v_u_8 do
		local v19 = 0
		for v20, v21 in v_u_4 do
			if v20 and v20:IsDescendantOf(workspace) then
				v20.Color = v21.ColorValue.Value
			end
			v19 = v19 + 1
			if v19 % 15 == 0 then
				task.wait()
			end
		end
		task.wait(v_u_7)
	end
end)