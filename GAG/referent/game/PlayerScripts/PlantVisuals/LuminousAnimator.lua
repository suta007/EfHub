game:GetService("CollectionService")
game:GetService("TweenService")
local v_u_1 = game:GetService("RunService")
local v2 = game:GetService("ReplicatedStorage")
require(v2:WaitForChild("Modules"):WaitForChild("CreateTagHandler"))
local v3 = require(v2.Modules.CreateTagHandlerWithAncestry)
local v_u_4 = require(v2.Modules.Settings.SettingsService)
local v5 = require(v2.Modules.DataService)
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
local v_u_9 = {
	Color3.fromRGB(255, 160, 255),
	Color3.fromRGB(255, 128, 255),
	Color3.fromRGB(135, 206, 255),
	Color3.fromRGB(100, 180, 255)
}
local v_u_10 = v_u_9[1]
local v_u_11 = 0
local v_u_12 = v_u_10
local v_u_13 = v_u_9[2]
local v_u_14 = {}
local v_u_15 = 0
v3({
	["Tag"] = "LuminousVisual",
	["Ancestor"] = workspace,
	["OnInstanceAdded"] = function(p16)
		-- upvalues: (copy) v_u_14, (ref) v_u_15
		if p16:IsA("Part") then
			v_u_14[p16] = {
				["Material"] = p16.Material,
				["Color"] = p16.Color
			}
			v_u_15 = v_u_15 + 1
		end
	end,
	["OnInstanceRemoved"] = function(p17)
		-- upvalues: (copy) v_u_14, (ref) v_u_15
		if p17:IsA("Part") then
			if v_u_14[p17] then
				p17.Material = v_u_14[p17].Material
				p17.Color = v_u_14[p17].Color
				v_u_14[p17] = nil
				v_u_15 = v_u_15 - 1
			end
		end
	end
})
task.spawn(function()
	-- upvalues: (ref) v_u_7, (ref) v_u_15, (copy) v_u_6, (ref) v_u_11, (ref) v_u_12, (ref) v_u_10, (ref) v_u_13, (copy) v_u_9, (copy) v_u_1
	while v_u_7 do
		if v_u_15 <= 0 then
			task.wait(v_u_6)
		else
			v_u_11 = 0
			v_u_12 = v_u_10
			v_u_13 = v_u_9[math.random(1, #v_u_9)]
			while v_u_11 < 3 do
				v_u_10 = v_u_12:Lerp(v_u_13, v_u_11 / 3)
				v_u_11 = v_u_11 + v_u_1.Heartbeat:Wait()
			end
			v_u_10 = v_u_13
		end
	end
end)
task.spawn(function()
	-- upvalues: (ref) v_u_7, (ref) v_u_15, (copy) v_u_6, (copy) v_u_14, (ref) v_u_10
	while v_u_7 do
		if v_u_15 <= 0 then
			task.wait(v_u_6)
		else
			local v18 = 0
			for v19 in v_u_14 do
				v19.Color = v_u_10
				v18 = v18 + 1
				if v18 % 20 == 0 then
					task.wait()
				end
			end
			task.wait(v_u_6)
		end
	end
end)