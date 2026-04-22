local v_u_1 = game:GetService("TweenService")
local v2 = game:GetService("ReplicatedStorage")
local v_u_3 = game:GetService("UserInputService")
local v_u_4 = game:GetService("Players")
local v_u_5 = require(v2.Modules.PlayerLuck)
local v_u_6 = require(v2.Modules.UpdateService)
local v_u_7 = require(v2.Data.NPCLevels.NPCLevelData)
local v_u_8 = require(script.EventInfo)
local v9 = v2:WaitForChild("GameEvents")
local v10 = v9:WaitForChild("DayChanged_RE")
local v11 = v9:WaitForChild("SendClientWeatherEvents")
local v12 = v9:WaitForChild("WeatherEventStarted")
local v13 = v9:WaitForChild("SendClientSpecialEvent")
local v14 = v9:WaitForChild("SpecialEventStarted")
local v15 = v9:WaitForChild("EndWeatherevent")
local v_u_16 = script.Parent:WaitForChild("BottomFrame")
local v_u_17 = v_u_16:WaitForChild("Holder")
local v_u_18 = v_u_16:WaitForChild("Info")
local v_u_19 = false
local v_u_20 = {}
local v_u_21 = {
	"BeeSwarm",
	"Blood Moon",
	"Cooking",
	"CorruptZenAura",
	"FullMoon",
	"KitchenStorm",
	"MegaHarvest",
	"Night",
	"NuttyFever",
	"SummerHarvest",
	"WorkingBeeSwarm",
	"ZenAura"
}
local v_u_22 = {
	["Night"] = "NightEvent",
	["Blood Moon"] = "BloodMoonEvent"
}
local v_u_23 = {
	["NightEvent"] = "Night",
	["BloodMoonEvent"] = "Blood Moon"
}
local function v_u_42()
	-- upvalues: (copy) v_u_20, (copy) v_u_8, (ref) v_u_19, (copy) v_u_17, (copy) v_u_1, (copy) v_u_18
	for _, v24 in v_u_20 do
		if v_u_8[v24] then
			v41 = true
			::l4::
			if v41 then
				if not v_u_19 then
					v_u_19 = true
					v_u_17.Position = UDim2.fromScale(0.5, -0.25)
					v_u_17.Visible = true
					for _, v25 in v_u_17.List:GetChildren() do
						if v25:IsA("Frame") then
							v25.Visible = false
						end
					end
					local v26 = v_u_17
					local v27 = {
						["Position"] = UDim2.fromScale(1, 1)
					}
					local v28 = Enum.EasingStyle.Back
					local v29 = Enum.EasingDirection.Out
					v_u_1:Create(v26, TweenInfo.new(0.5, v28 or Enum.EasingStyle.Linear, v29 or Enum.EasingDirection.InOut, 0, false, 0), v27):Play()
					task.wait(0.4)
				end
				for _, v_u_30 in v_u_17.List:GetChildren() do
					if v_u_30:IsA("Frame") then
						if table.find(v_u_20, v_u_30.Name) ~= nil then
							v_u_30.UIScale.Scale = 0
							v_u_30.Visible = true
							local v31 = v_u_30.UIScale
							local v32 = Enum.EasingStyle.Back
							local v33 = Enum.EasingDirection.Out
							v_u_1:Create(v31, TweenInfo.new(0.25, v32 or Enum.EasingStyle.Linear, v33 or Enum.EasingDirection.InOut, 0, false, 0), {
								["Scale"] = 1
							}):Play()
						else
							local v34 = v_u_30.UIScale
							local v35 = Enum.EasingStyle.Back
							local v36 = Enum.EasingDirection.In
							v_u_1:Create(v34, TweenInfo.new(0.25, v35 or Enum.EasingStyle.Linear, v36 or Enum.EasingDirection.InOut, 0, false, 0), {
								["Scale"] = 0
							}):Play()
							task.delay(0.25, function()
								-- upvalues: (copy) v_u_30
								v_u_30.Visible = false
							end)
						end
					end
				end
			elseif v_u_19 then
				v_u_19 = false
				local v37 = v_u_17
				local v38 = {
					["Position"] = UDim2.fromScale(1, 1.2)
				}
				local v39 = Enum.EasingStyle.Quint
				local v40 = Enum.EasingDirection.In
				v_u_1:Create(v37, TweenInfo.new(0.25, v39 or Enum.EasingStyle.Linear, v40 or Enum.EasingDirection.InOut, 0, false, 0), v38):Play()
				v_u_18.Visible = false
				task.delay(0.25, function()
					-- upvalues: (ref) v_u_17
					v_u_17.Visible = false
				end)
			end
		end
	end
	local v41 = false
	goto l4
end
local function v_u_58(p_u_43, p44)
	-- upvalues: (copy) v_u_20, (copy) v_u_42, (copy) v_u_21, (copy) v_u_22, (copy) v_u_8
	local v45 = v_u_20
	table.insert(v45, p_u_43)
	v_u_42()
	local v_u_46 = false
	local function v49()
		-- upvalues: (ref) v_u_46, (copy) p_u_43, (ref) v_u_20, (ref) v_u_42
		if not v_u_46 then
			v_u_46 = true
			local v47 = p_u_43
			local v48 = table.find(v_u_20, v47)
			if v48 then
				table.remove(v_u_20, v48)
				v_u_42()
			end
		end
	end
	task.delay(p44, v49)
	if table.find(v_u_21, p_u_43) then
		local v_u_50 = v_u_22[p_u_43] or p_u_43
		local v_u_51 = nil
		v_u_51 = workspace:GetAttributeChangedSignal(v_u_50):Connect(function()
			-- upvalues: (copy) v_u_50, (ref) v_u_51, (ref) v_u_46, (copy) p_u_43, (ref) v_u_20, (ref) v_u_42
			if not workspace:GetAttribute(v_u_50) then
				v_u_51:Disconnect()
				if v_u_46 then
					return
				end
				v_u_46 = true
				local v52 = p_u_43
				local v53 = table.find(v_u_20, v52)
				if v53 then
					table.remove(v_u_20, v53)
					v_u_42()
				end
			end
		end)
		if v_u_50 == "KitchenStorm" then
			local v_u_56 = workspace:GetAttributeChangedSignal("KitchenStormLevel"):Connect(function()
				-- upvalues: (ref) v_u_8
				local v54 = workspace:GetAttribute("KitchenStormLevel") or 0
				local v55 = (v54 * 0.5 + 1.5) * 1
				v_u_8.KitchenStorm.Title = ("Kitchen Storm - Level %*"):format(v54)
				v_u_8.KitchenStorm.Description = ("%*x Cooking Speed! Higher Mutation Carry Over and %* Fruit Chance!"):format(v55, "<font color=\"#a29139\">AROMATIC</font>")
			end)
			local v_u_57 = nil
			v_u_57 = workspace:GetAttributeChangedSignal("KitchenStorm"):Connect(function()
				-- upvalues: (ref) v_u_57, (ref) v_u_56
				if not workspace:GetAttribute("KitchenStorm") then
					v_u_57:Disconnect()
					v_u_56:Disconnect()
				end
			end)
		end
	end
end
local function v64()
	-- upvalues: (copy) v_u_6, (copy) v_u_7, (copy) v_u_20, (copy) v_u_42
	if v_u_6:IsHiddenFromUpdate("NPCBirthday") then
		return
	else
		local v59 = workspace:GetServerTimeNow()
		local v60 = {}
		for v61 in v_u_7.NPCEntires do
			if v_u_7:IsNPCBirthday(v61, v59) then
				print((("JEX: Framework - %* has a birthday!"):format(v61)))
				table.insert(v60, v61)
			end
		end
		local v62 = table.find(v_u_20, "NPCBirthday")
		if #v60 > 0 and not v62 then
			local v63 = v_u_20
			table.insert(v63, "NPCBirthday")
			v_u_42()
		elseif #v60 == 0 and v62 then
			table.remove(v_u_20, v62)
			v_u_42()
		end
	end
end
v11.OnClientEvent:Connect(function(p65, p66, p67)
	-- upvalues: (copy) v_u_58
	if p66 and (p67 and p67[p66]) then
		local v68 = workspace:GetServerTimeNow()
		local v69 = p67[p66].StartTime + p65[p66].eventLength - v68
		if v69 > 0 then
			v_u_58(p66, v69)
		end
	end
end)
v12.OnClientEvent:Connect(function(p70, p71)
	-- upvalues: (copy) v_u_58
	v_u_58(p70, p71)
end)
v13.OnClientEvent:Connect(function(p72, p73, p74)
	-- upvalues: (copy) v_u_58
	local v75 = workspace:GetServerTimeNow()
	local v76 = p72 + p73 - v75
	if v76 > 0 then
		v_u_58(p74, v76)
	end
end)
v14.OnClientEvent:Connect(function(p77, p78)
	-- upvalues: (copy) v_u_58
	v_u_58(p77, p78)
end)
v15.OnClientEvent:Connect(function(p79)
	-- upvalues: (copy) v_u_20, (copy) v_u_42
	local v80 = false
	for v81 = #v_u_20, 1, -1 do
		if v_u_20[v81] == p79 then
			table.remove(v_u_20, v81)
			v80 = true
		end
	end
	if v80 then
		v_u_42()
	end
end)
v10.OnClientEvent:Connect(v64);
(function()
	-- upvalues: (copy) v_u_3, (copy) v_u_16, (copy) v_u_18, (copy) v_u_17, (copy) v_u_20, (copy) v_u_8
	local v82 = v_u_3.TouchEnabled
	if v82 then
		v_u_16.Position = UDim2.new(1, 0, 0.225, 0)
		v_u_18.Position = UDim2.new(0.95, 0, 1.8, 0)
	end
	for _, v_u_83 in v_u_17.List:GetChildren() do
		if v_u_83:IsA("Frame") then
			local function v91()
				-- upvalues: (ref) v_u_20, (copy) v_u_83, (ref) v_u_18, (ref) v_u_8
				for _, v84 in v_u_20 do
					if v_u_83.Name == v84 then
						local v85 = v_u_18.Title
						local v86 = v_u_8[v84]
						local v87
						if v86 then
							v87 = v86.Title
							if type(v87) == "function" then
								v87 = v87() or v87
							end
						else
							v87 = "Event Not Found"
						end
						v85.Text = v87
						local v88 = v_u_18.Description
						local v89 = v_u_8[v84]
						local v90
						if v89 then
							v90 = v89.Description
							if type(v90) == "function" then
								v90 = v90() or v90
							end
						else
							v90 = "Event Not Found"
						end
						v88.Text = v90
						v_u_18.Visible = true
						return
					end
				end
			end
			local function v92()
				-- upvalues: (ref) v_u_18
				v_u_18.Visible = false
			end
			if v82 then
				v_u_83.InputBegan:Connect(v91)
				v_u_83.InputEnded:Connect(v92)
			else
				v_u_83.MouseEnter:Connect(v91)
				v_u_83.MouseLeave:Connect(v92)
			end
		end
	end
end)();
(function()
	-- upvalues: (copy) v_u_23, (copy) v_u_20, (copy) v_u_42
	for _, v_u_93 in {
		"BeeSwarm",
		"BloodMoonEvent",
		"CorruptZenAura",
		"FullMoon",
		"KitchenStorm",
		"MegaHarvest",
		"NightEvent",
		"SummerHarvest",
		"WorkingBeeSwarm",
		"ZenAura"
	} do
		workspace:GetAttributeChangedSignal(v_u_93):Connect(function()
			-- upvalues: (copy) v_u_93, (ref) v_u_23, (ref) v_u_20, (ref) v_u_42
			if not workspace:GetAttribute(v_u_93) then
				local v94 = v_u_93
				local v95 = v_u_23[v94] or v94
				local v96 = table.find(v_u_20, v95)
				if v96 then
					table.remove(v_u_20, v96)
					v_u_42()
				end
			end
		end)
	end
end)()
v_u_5.Listen(v_u_4.LocalPlayer, function()
	-- upvalues: (copy) v_u_5, (copy) v_u_4, (copy) v_u_20, (copy) v_u_42
	local v97 = v_u_5.GetModifiers(v_u_4.LocalPlayer, nil, "BottomDisplay")
	local v98 = table.find(v_u_20, "Luck") ~= nil
	local v99 = #v97 > 1
	if v99 and not v98 then
		local v100 = v_u_20
		table.insert(v100, "Luck")
		v_u_42()
	else
		local v101 = not v99 and (v98 and table.find(v_u_20, "Luck"))
		if v101 then
			table.remove(v_u_20, v101)
			v_u_42()
		end
	end
end)
task.spawn(v64)