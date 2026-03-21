local v_u_1 = game:GetService("CollectionService")
local v_u_2 = require(game.ReplicatedStorage.Modules.Settings.SettingsService)
local v3 = require(game.ReplicatedStorage.Modules.DataService)
local v_u_4 = not v_u_2:GetSetting("PerformanceMode")
local v_u_5 = {
	Color3.fromRGB(233, 59, 59),
	Color3.fromRGB(21, 223, 68),
	Color3.fromRGB(45, 202, 233),
	Color3.fromRGB(255, 238, 5),
	Color3.fromRGB(192, 43, 233),
	Color3.fromRGB(5, 0, 194)
}
task.spawn(function()
	-- upvalues: (ref) v_u_4, (copy) v_u_1, (copy) v_u_5
	while v_u_4 do
		for _, v6 in v_u_1:GetTagged("SpiritSparkleAnimation") do
			v6.Color = v_u_5[math.random(1, #v_u_5)]
			task.wait()
		end
		task.wait(1)
	end
end)
local v_u_7 = nil
v_u_7 = v3:GetPathSignal("Settings/@"):Connect(function()
	-- upvalues: (ref) v_u_4, (copy) v_u_2, (ref) v_u_7
	v_u_4 = not v_u_2:GetSetting("PerformanceMode")
	if not v_u_4 then
		if v_u_7 then
			v_u_7:Disconnect()
			v_u_7 = nil
		end
	end
end)
return {}