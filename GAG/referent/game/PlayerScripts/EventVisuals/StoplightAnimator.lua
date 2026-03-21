game:GetService("CollectionService")
game:GetService("RunService")
local v1 = game:GetService("ReplicatedStorage")
local v2 = require(v1.Modules.CreateTagHandler)
local v_u_3 = {}
local v_u_4 = {}
local v_u_5 = require(v1.Modules.Settings.SettingsService)
local v6 = require(v1.Modules.DataService)
local v_u_7 = not v_u_5:GetSetting("PerformanceMode")
local v_u_8 = nil
v_u_8 = v6:GetPathSignal("Settings/@"):Connect(function()
	-- upvalues: (ref) v_u_7, (copy) v_u_5, (ref) v_u_8
	v_u_7 = not v_u_5:GetSetting("PerformanceMode")
	if not v_u_7 then
		if v_u_8 then
			v_u_8:Disconnect()
			v_u_8 = nil
		end
	end
end)
v2({
	["Tag"] = "Lightcycle_Mutation",
	["OnInstanceAdded"] = function(p9)
		-- upvalues: (copy) v_u_3
		v_u_3[p9] = true
	end,
	["OnInstanceRemoved"] = function(p10)
		-- upvalues: (copy) v_u_3
		v_u_3[p10] = nil
	end
})
v2({
	["Tag"] = "Stoplight_Cosmetic",
	["OnInstanceAdded"] = function(p11)
		-- upvalues: (copy) v_u_4
		v_u_4[p11] = true
	end,
	["OnInstanceRemoved"] = function(p12)
		-- upvalues: (copy) v_u_4
		v_u_4[p12] = nil
	end
})
local v_u_13 = { Color3.fromRGB(0, 255, 0), Color3.fromRGB(255, 255, 0), Color3.fromRGB(255, 0, 0) }
local function v_u_17(p14, p15)
	for _, v16 in ipairs(p14:GetDescendants()) do
		if v16:IsA("BasePart") then
			v16.Color = p15
		end
	end
end
task.spawn(function()
	-- upvalues: (ref) v_u_7, (copy) v_u_13, (copy) v_u_3, (copy) v_u_17
	local v18 = 1
	while v_u_7 do
		local v19 = v_u_13[v18]
		local v20 = 0
		for v21 in v_u_3 do
			v_u_17(v21, v19)
			v20 = v20 + 1
			if v20 % 10 == 0 then
				task.wait()
			end
		end
		v18 = v18 % #v_u_13 + 1
		task.wait(1.2)
	end
end)
local v_u_22 = {
	["Red"] = Color3.fromRGB(190, 104, 98),
	["Yellow"] = Color3.fromRGB(248, 217, 109),
	["Green"] = Color3.fromRGB(148, 190, 129)
}
local v_u_23 = Color3.fromRGB(27, 42, 53)
task.spawn(function()
	-- upvalues: (ref) v_u_7, (copy) v_u_4, (copy) v_u_22, (copy) v_u_23
	local v24 = { "Green", "Yellow", "Red" }
	local v25 = 1
	while v_u_7 do
		local v26 = v24[v25]
		for v27, _ in v_u_4 do
			local v28 = v27:FindFirstChild("Red")
			local v29 = v27:FindFirstChild("Yellow")
			local v30 = v27:FindFirstChild("Green")
			if v28 then
				v28.Color = v26 == "Red" and v_u_22.Red or v_u_23
			end
			if v29 then
				v29.Color = v26 == "Yellow" and v_u_22.Yellow or v_u_23
			end
			if v30 then
				v30.Color = v26 == "Green" and v_u_22.Green or v_u_23
			end
		end
		v25 = v25 % #v24 + 1
		task.wait(1.2)
	end
end)