local v_u_1 = game:GetService("Lighting")
local v_u_2 = script.Parent:WaitForChild("WeatherClient")
local v_u_3 = require(game.ReplicatedStorage.Modules.Settings.SettingsService)
local v_u_4 = {
	["AlienInvasionEvent"] = "AlienInvasion",
	["ArmageddonEvent"] = "Armageddon",
	["DroughtEvent"] = "Drought",
	["FrostEvent"] = "Frost",
	["HeatwaveEvent"] = "Heatwave",
	["RainEvent"] = "Rain",
	["SolarFlareEvent"] = "SolarFlare",
	["SpaceTravelEvent"] = "SpaceTravel",
	["TornadoEvent"] = "Tornado"
}
local function v_u_9(p5, p6)
	local v7 = {}
	for _, v8 in ipairs(p5:GetChildren()) do
		if v8.Name == p6 then
			table.insert(v7, v8)
		end
	end
	return v7
end
local function v15(p_u_10)
	-- upvalues: (copy) v_u_3, (copy) v_u_4, (copy) v_u_2, (copy) v_u_9, (copy) v_u_1
	if v_u_3:GetSetting("PerformanceMode") then
		return
	else
		local v11
		if v_u_4[p_u_10] then
			v11 = v_u_4[p_u_10]
		else
			v11 = p_u_10
		end
		if v_u_2:FindFirstChild(v11) then
			local v_u_12 = v_u_9(v_u_1, v11)
			if #v_u_12 ~= 0 then
				pcall(function()
					-- upvalues: (copy) p_u_10, (copy) v_u_12
					if workspace:GetAttribute(p_u_10) then
						for _, v13 in v_u_12 do
							v13.Enabled = true
						end
					else
						for _, v14 in v_u_12 do
							v14.Enabled = true
						end
					end
				end)
			end
		else
			return
		end
	end
end
if not v_u_3:GetSetting("PerformanceMode") then
	workspace.AttributeChanged:Connect(v15)
end
local v_u_16 = {}
for _, v17 in v_u_2:GetChildren() do
	local v18 = v17.Name
	table.insert(v_u_16, v18)
end
task.wait(5)
task.defer(function()
	-- upvalues: (copy) v_u_1, (copy) v_u_16, (copy) v_u_9
	for _, v_u_19 in v_u_1:GetChildren() do
		if table.find(v_u_16, v_u_19.Name) then
			pcall(function()
				-- upvalues: (ref) v_u_9, (ref) v_u_1, (copy) v_u_19
				for _, v20 in v_u_9(v_u_1, v_u_19.Name) do
					v20.Enabled = false
				end
			end)
		end
	end
	table.clear(v_u_16)
end)
for v21, v22 in workspace:GetAttributes() do
	if v22 == true then
		v15(v21)
	end
end