game:GetService("RunService")
local v1 = game:GetService("ReplicatedStorage")
require(v1.Modules.CreateTagHandler)
local v2 = require(v1.Modules.CreateTagHandlerWithAncestry)
local v_u_3 = require(v1.Modules.Settings.SettingsService)
local v4 = require(v1.Modules.DataService)
local v_u_5 = require(v1.Modules.OptimisationControllers.IsMobile)
local v_u_6 = not v_u_3:GetSetting("PerformanceMode")
v_u_3:GetSetting("LowerPlantFXQuality")
local _ = v_u_5() and 0.1 or 0.016666666666666666
local v_u_7 = v_u_5() and 100 or 200
local v_u_8 = v_u_3:GetSetting("LowerPlantFXQuality")
if v_u_8 then
	v_u_10 = v_u_5() and 0.2 or 0.05
	v_u_7 = v_u_5() and 50 or 100
else
	v_u_10 = v_u_5() and 0.1 or 0.016666666666666666
	v_u_7 = v_u_5() and 100 or 200
end
local v_u_9 = nil
v_u_9 = v4:GetPathSignal("Settings/@"):Connect(function()
	-- upvalues: (ref) v_u_8, (copy) v_u_3, (ref) v_u_10, (copy) v_u_5, (ref) v_u_7, (ref) v_u_6, (ref) v_u_9
	v_u_8 = v_u_3:GetSetting("LowerPlantFXQuality")
	v_u_8 = v_u_3:GetSetting("LowerPlantFXQuality")
	if v_u_8 then
		v_u_10 = v_u_5() and 0.2 or 0.05
		v_u_7 = v_u_5() and 50 or 100
	else
		v_u_10 = v_u_5() and 0.1 or 0.016666666666666666
		v_u_7 = v_u_5() and 100 or 200
	end
	v_u_6 = not v_u_3:GetSetting("PerformanceMode")
	if not v_u_6 then
		if v_u_9 then
			v_u_9:Disconnect()
			v_u_9 = nil
		end
	end
end)
local v_u_10 = 0.05
v_u_7 = 200
local v_u_11 = {}
local v_u_13 = v2({
	["Tag"] = "Redglow",
	["Ancestor"] = workspace,
	["OnInstanceRemoved"] = function(p12)
		-- upvalues: (copy) v_u_11
		v_u_11[p12] = nil
	end
})
task.spawn(function()
	-- upvalues: (ref) v_u_6, (copy) v_u_13, (ref) v_u_10, (copy) v_u_11, (ref) v_u_7
	while true do
		while true do
			if not v_u_6 then
				return
			end
			local v14 = os.clock()
			if v_u_13.GetCount() > 0 then
				break
			end
			task.wait(v_u_10)
		end
		local v15 = v_u_13.GetTrackedInstances()
		local v16 = (1 / 0)
		local v17 = (-1 / 0)
		for v18 in pairs(v15) do
			local v19 = v18.Position.Y
			if v19 < v16 then
				v16 = v19
			end
			if v17 < v19 then
				v17 = v19
			end
		end
		local v20 = v17 - v16
		local v21 = math.max(v20, 1e-6)
		local v22 = 0
		for v23 in pairs(v15) do
			local v24 = v14 - (10 + (v23.Position.Y - v16) / v21 * 10)
			local v25
			if v24 < 0 then
				v25 = 0.45
			else
				local v26 = v24 % 11
				if v26 < 4 then
					v25 = 0.45
				elseif v26 < 4.3 then
					v25 = (v26 - 4) / 0.3 * 0.55 + 0.45
				elseif v26 < 5.3 then
					v25 = 1
				else
					local v27 = (v26 - 5.3) / 3
					v25 = math.clamp(v27, 0, 1) * -0.55 + 1
				end
			end
			local v28 = v25 < 0.35 and 0.35 or v25
			local v29 = v_u_11[v23]
			if not v29 then
				::l26::
				v_u_11[v23] = v28
				v23.Color = Color3.fromHSV(0, 1, v28)
				goto l27
			end
			local v30 = v28 - v29
			if math.abs(v30) > 0.00392156862745098 then
				goto l26
			end
			::l27::
			v22 = v22 + 1
			if v22 % v_u_7 == 0 then
				task.wait()
			end
		end
		task.wait(v_u_10)
	end
end)