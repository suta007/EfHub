game:GetService("RunService")
local v1 = game:GetService("ReplicatedStorage")
require(v1.Modules.CreateTagHandler)
local v2 = require(v1.Modules.CreateTagHandlerWithAncestry)
local v_u_3 = require(v1.Modules.Settings.SettingsService)
local v4 = require(v1.Modules.DataService)
local v_u_5 = require(game.ReplicatedStorage.Modules.OptimisationControllers.IsMobile)
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
local v_u_10 = v_u_5() and 0.1 or 0.016666666666666666
v_u_7 = 200
local v_u_11 = {}
local v_u_13 = v2({
	["Tag"] = "UFOVisual",
	["Ancestor"] = workspace,
	["OnInstanceAdded"] = function(_) end,
	["OnInstanceRemoved"] = function(p12)
		-- upvalues: (copy) v_u_11
		v_u_11[p12] = nil
	end
})
task.spawn(function()
	-- upvalues: (ref) v_u_6, (copy) v_u_13, (ref) v_u_10, (copy) v_u_11, (ref) v_u_7
	local v14 = os.clock()
	local v15 = nil
	while true do
		while true do
			if not v_u_6 then
				return
			end
			if v_u_13.GetCount() > 0 then
				break
			end
			task.wait(v_u_10)
		end
		local v16 = os.clock()
		local v17 = v16 - v14
		local v18 = math.max(v17, 0.004166666666666667)
		local v19 = v_u_13.GetTrackedInstances()
		v14 = v16
		local v20 = (1 / 0)
		local v21 = (-1 / 0)
		for v22 in pairs(v19) do
			local v23 = v22.Position.Y
			if v23 < v20 then
				v20 = v23
			end
			if v21 < v23 then
				v21 = v23
			end
		end
		local v24 = v21 - v20
		math.max(v24, 1e-6)
		local v25 = v16 % 240 / 240 * 3.141592653589793 * 2
		local v26 = (math.sin(v25) + 1) * 0.5
		local v27 = v26 * v26 * (3 - v26 * 2)
		local v28 = v27 * v27 * (3 - v27 * 2) * 0.048600000000000004 + 0.0074
		if v15 ~= nil then
			local v29 = -0.3141592653589793 * v18
			v28 = v15 + (1 - math.exp(v29)) * (v28 - v15)
		end
		v15 = v28
		local v30 = 0
		for v31 in pairs(v19) do
			local v32 = v31:GetAttribute("COLOR_INDEX") or 1
			local v33 = v16 - (10 + tonumber(v32) * v28 * 10)
			local v34
			if v33 < 0 then
				v34 = 0
			else
				local v35 = v33 % 4
				if v35 < 1 then
					v34 = 0
				elseif v35 < 1.3 then
					v34 = (v35 - 1) / 0.3 * 1 + 0
				elseif v35 < 2.3 then
					v34 = 1
				else
					local v36 = (v35 - 2.3) / 1
					v34 = math.clamp(v36, 0, 1) * -1 + 1
				end
			end
			local v37 = v34 < 0.35 and 0.35 or v34
			local v38 = v_u_11[v31]
			if not v38 then
				::l29::
				v_u_11[v31] = v37
				local v39 = v37 * 3
				local v40 = v39 * v39 * 0.1
				v31.Color = Color3.fromHSV(0.33, 1, v40)
				goto l30
			end
			local v41 = v37 - v38
			if math.abs(v41) > 0.00392156862745098 then
				goto l29
			end
			::l30::
			v30 = v30 + 1
			if v30 % v_u_7 == 0 then
				task.wait()
			end
		end
		task.wait(v_u_10)
	end
end)