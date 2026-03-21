game:GetService("CollectionService")
local v1 = game:GetService("TweenService")
game:GetService("RunService")
local v2 = game:GetService("ReplicatedStorage")
v2:WaitForChild("Modules")
require(v2.Modules.CreateTagHandler)
local v3 = require(v2.Modules.CreateTagHandlerWithAncestry)
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
v1:Create(script.ColorValue, TweenInfo.new(3, Enum.EasingStyle.Linear, Enum.EasingDirection.InOut, -1, true), {
	["Value"] = Color3.fromRGB(150, 92, 186)
}):Play()
local v_u_10 = 0
v3({
	["Tag"] = "LuminousVisual",
	["Ancestor"] = workspace,
	["OnInstanceAdded"] = function(p11)
		-- upvalues: (copy) v_u_4, (ref) v_u_10
		if p11:IsA("Part") then
			v_u_4[p11] = {
				["Material"] = p11.Material,
				["Color"] = p11.Color
			}
			v_u_10 = v_u_10 + 1
		end
	end,
	["OnInstanceRemoved"] = function(p12)
		-- upvalues: (copy) v_u_4, (ref) v_u_10
		if p12:IsA("Part") then
			if v_u_4[p12] then
				p12.Material = v_u_4[p12].Material
				p12.Color = v_u_4[p12].Color
				v_u_4[p12] = nil
				v_u_10 = v_u_10 - 1
			end
		end
	end
})
task.spawn(function()
	-- upvalues: (ref) v_u_8, (ref) v_u_10, (copy) v_u_7, (copy) v_u_4
	while v_u_8 do
		if v_u_10 <= 0 then
			task.wait(v_u_7)
		else
			local v13 = 0
			for v14 in v_u_4 do
				v13 = v13 + 1
				v14.Color = script.ColorValue.Value
				if v13 % 20 == 0 then
					task.wait()
				end
			end
			task.wait(v_u_7)
		end
	end
end)