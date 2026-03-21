game:GetService("Selection")
local v_u_1 = game:GetService("Players")
local v2 = game:GetService("ReplicatedStorage")
local v_u_3 = game:GetService("TweenService")
game:GetService("CollectionService")
local v_u_4 = game:GetService("RunService")
game:GetService("UserInputService")
game:GetService("GuiService")
local v_u_5 = workspace.CurrentCamera
workspace:GetPropertyChangedSignal("CurrentCamera"):Connect(function()
	-- upvalues: (ref) v_u_5
	v_u_5 = workspace.CurrentCamera
end)
local v_u_6 = require(v2.Modules.PetServices.ActivePetsService)
local v7 = require(v2.Modules.WaitForDescendant)
local v_u_8 = require(v2.Data.PetRegistry)
local v_u_9 = require(v2.Modules.PetServices.PetUtilities)
local v_u_10 = require(v2.Modules.PlayClickSound)
local v_u_11 = require(v2.Modules.Chalk)
local v_u_12 = require(v2.Modules.PlayHoverSound)
local v_u_13 = require(v2.Data.PetRegistry.PetMutationRegistry)
require(v2.Data.PetRegistry.PassiveRegistry)
local v_u_14 = v_u_8.PetList
local v_u_15 = v_u_8.PetConfig.XP_CONFIG.MAX_LEVEL
local v_u_16 = v_u_1.LocalPlayer
local v_u_17 = v_u_16:WaitForChild("PlayerGui"):WaitForChild("PetUI"):WaitForChild("PetCard")
local v_u_18 = v_u_17:WaitForChild("DropShadowHolder")
local v_u_19 = v_u_17:WaitForChild("Main")
local v_u_20 = v7(v_u_17, "PET_TEXT")
local v_u_21 = v7(v_u_17, "PET_NAME_CONFIG")
local v_u_22 = v7(v_u_17, "PET_LEVEL")
local v_u_23 = v7(v_u_17, "PET_WEIGHT")
local v_u_24 = v7(v_u_17, "XP_TEXT")
local v_u_25 = v7(v_u_17, "HUNGER_TEXT")
local v_u_26 = v7(v_u_17, "EXP_BAR")
local v_u_27 = v7(v_u_17, "HUNGER_BAR")
v7(v_u_17, "PASSIVE_INSERTION_POINT")
local v_u_28 = v7(v_u_17, "PET_DESCRIPTION")
v7(v_u_17, "PASSIVE_TEMPLATE")
local v_u_29 = v7(v_u_17, "PET_IMAGE")
local v_u_30 = v7(v_u_17, "EXIT_BUTTON")
local v31 = require(v2.Modules.SetupBrightnessAnimationFrame)(v_u_30)
local v_u_32 = UDim2.fromScale(0.875, 0.5)
local v_u_33 = v_u_32 + UDim2.fromScale(2, 0)
local v_u_34 = {
	["Active"] = false,
	["Target"] = nil
}
local v_u_35 = {}
local v_u_36 = {}
function v_u_34.SetTarget(_, p37)
	-- upvalues: (copy) v_u_34, (copy) v_u_6, (copy) v_u_14, (copy) v_u_8, (copy) v_u_11, (copy) v_u_13, (copy) v_u_28, (copy) v_u_20, (copy) v_u_36, (copy) v_u_4, (copy) v_u_29, (copy) v_u_35
	v_u_34.Target = p37
	if p37 then
		local v38 = v_u_6:GetPetDataFromPetObject(p37)
		if v38 then
			local v39 = v38.PetType
			local v40 = v38.PetData
			local v41 = v_u_14[v39]
			local v_u_42 = v41.Rarity or "Common"
			local v43 = v_u_8.PetRarities[v_u_42].Color
			local v44, v45, v46 = v43:ToHSV()
			local v47 = v46 + -0.4
			local v48 = math.clamp(v47, 0, 1)
			local v49 = Color3.fromHSV(v44, v45, v48)
			local v50 = v_u_11.color(v43).stroke({
				["Color"] = v49,
				["Joins"] = "Round",
				["Thickness"] = 2
			})
			local v51 = v_u_11.color(Color3.fromRGB(255, 255, 255)).stroke({
				["Color"] = Color3.fromRGB(35, 35, 35),
				["Joins"] = "Round",
				["Thickness"] = 2
			})
			v50((("[%*]"):format(v_u_42)))
			local v52 = v_u_13.EnumToPetMutation[v40.MutationType]
			local v_u_53
			if v52 and v52 ~= "Normal" then
				v_u_53 = ("%* %*"):format(v52, v39) or v39
			else
				v_u_53 = v39
			end
			v51(v_u_53)
			v_u_28.Text = v41.Description
			local v54 = v_u_20
			if v_u_36[v54] then
				v_u_36[v54]:Disconnect()
				v_u_36[v54] = nil
			end
			if v_u_42 == "Prismatic" then
				local v_u_55 = v_u_20
				if v_u_36[v_u_55] then
					v_u_36[v_u_55]:Disconnect()
				end
				local v_u_56 = 0
				v_u_36[v_u_55] = v_u_4.RenderStepped:Connect(function(p57)
					-- upvalues: (ref) v_u_56, (copy) v_u_42, (copy) v_u_55, (copy) v_u_53
					v_u_56 = (v_u_56 + p57 * 0.2) % 1
					local v58 = Color3.fromHSV(v_u_56, 1, 1)
					local v59 = string.format("%02X%02X%02X", v58.R * 255, v58.G * 255, v58.B * 255)
					local v60 = string.format("<font color=\"#%s\">[%s]</font>", v59, v_u_42)
					v_u_55.Text = string.format("%s %s", v_u_53, v60)
				end)
			else
				local v61 = v_u_11.color(v43).stroke({
					["Color"] = v49,
					["Joins"] = "Round",
					["Thickness"] = 2
				})
				local v62 = v_u_11.color(Color3.fromRGB(255, 255, 255)).stroke({
					["Color"] = Color3.fromRGB(35, 35, 35),
					["Joins"] = "Round",
					["Thickness"] = 2
				})
				local v63 = v61((("[%*]"):format(v_u_42)))
				v_u_20.Text = ("%* %*"):format(v62(v_u_53), v63)
			end
			v_u_29.Image = v41.Icon
			local v64 = v_u_14[v39]
			for _, v65 in v_u_35 do
				v65:Destroy()
			end
			local v66 = v64.Passives
			local _ = v40.Level
			for _, _ in v66 do

			end
			v_u_34:Update()
		end
	else
		return
	end
end
function v_u_34.SetTargetFromUUID(p67, p68)
	-- upvalues: (copy) v_u_16, (copy) v_u_6, (copy) v_u_14, (copy) v_u_8, (copy) v_u_11, (copy) v_u_13, (copy) v_u_20, (copy) v_u_36, (copy) v_u_4, (copy) v_u_29, (copy) v_u_28, (copy) v_u_35
	p67.Target = nil
	p67.TargetUUID = p68
	p67.TargetPlayer = v_u_16.Name
	local v69 = v_u_6:GetPetData(v_u_16.Name, p68)
	if v69 then
		local v_u_70 = v69.PetType
		local v71 = v_u_14[v_u_70]
		if v71 then
			local v_u_72 = v71.Rarity or "Common"
			local v73 = v_u_8.PetRarities[v_u_72].Color
			local v74, v75, v76 = v73:ToHSV()
			local v77 = v76 + -0.4
			local v78 = math.clamp(v77, 0, 1)
			local v79 = Color3.fromHSV(v74, v75, v78)
			local v80 = v_u_11.color(v73).stroke({
				["Color"] = v79,
				["Joins"] = "Round",
				["Thickness"] = 2
			})
			local v81 = v_u_11.color(Color3.fromRGB(255, 255, 255)).stroke({
				["Color"] = Color3.fromRGB(35, 35, 35),
				["Joins"] = "Round",
				["Thickness"] = 2
			})
			v80((("[%*]"):format(v_u_72)))
			local v82 = v_u_13.EnumToPetMutation[v69.PetData.MutationType]
			if v82 and v82 ~= "Normal" then
				v_u_70 = ("%* %*"):format(v82, v_u_70) or v_u_70
			end
			v81(v_u_70)
			local v83 = v_u_20
			if v_u_36[v83] then
				v_u_36[v83]:Disconnect()
				v_u_36[v83] = nil
			end
			if v_u_72 == "Prismatic" then
				local v_u_84 = v_u_20
				if v_u_36[v_u_84] then
					v_u_36[v_u_84]:Disconnect()
				end
				local v_u_85 = 0
				v_u_36[v_u_84] = v_u_4.RenderStepped:Connect(function(p86)
					-- upvalues: (ref) v_u_85, (copy) v_u_72, (copy) v_u_84, (copy) v_u_70
					v_u_85 = (v_u_85 + p86 * 0.2) % 1
					local v87 = Color3.fromHSV(v_u_85, 1, 1)
					local v88 = string.format("%02X%02X%02X", v87.R * 255, v87.G * 255, v87.B * 255)
					local v89 = string.format("<font color=\"#%s\">[%s]</font>", v88, v_u_72)
					v_u_84.Text = string.format("%s %s", v_u_70, v89)
				end)
			else
				local v90 = v_u_11.color(v73).stroke({
					["Color"] = v79,
					["Joins"] = "Round",
					["Thickness"] = 2
				})
				local v91 = v_u_11.color(Color3.fromRGB(255, 255, 255)).stroke({
					["Color"] = Color3.fromRGB(35, 35, 35),
					["Joins"] = "Round",
					["Thickness"] = 2
				})
				local v92 = v90((("[%*]"):format(v_u_72)))
				v_u_20.Text = ("%* %*"):format(v91(v_u_70), v92)
			end
			v_u_29.Image = v71.Icon
			v_u_28.Text = ""
			for _, v93 in v_u_35 do
				v93:Destroy()
			end
		end
	else
		warn((("Pet data not found for UUID: %*"):format(p68)))
		return
	end
end
local v_u_94 = require(v2.Data.DecimalNumberFormat)
function v_u_34.Update(p95)
	-- upvalues: (copy) v_u_6, (copy) v_u_1, (copy) v_u_16, (copy) v_u_14, (copy) v_u_9, (copy) v_u_23, (copy) v_u_94, (copy) v_u_21, (copy) v_u_15, (copy) v_u_3, (copy) v_u_26, (copy) v_u_27, (copy) v_u_25, (copy) v_u_22, (copy) v_u_24, (copy) v_u_13, (copy) v_u_28
	local v96 = nil
	local v97 = nil
	if p95.Target then
		v96 = v_u_6:GetPetDataFromPetObject(p95.Target)
		v97 = v_u_1:FindFirstChild((p95.Target:GetAttribute("OWNER")))
		p95.TargetUUID = p95.Target:GetAttribute("UUID")
		p95.TargetPlayer = v97
	elseif p95.TargetUUID then
		v96 = v_u_6:GetPetData(v_u_16.Name, p95.TargetUUID)
		p95.TargetPlayer = v_u_16
	end
	if v96 then
		local v98 = v96.PetType
		local v99 = v96.PetData
		local v100 = v_u_14[v98]
		if v100 then
			local v101 = v100.DefaultHunger
			local v102 = v_u_9:CalculateWeight(v99.BaseWeight, v99.Level, v96.PetType)
			v_u_23.Text = ("Weight: %* KG"):format((v_u_94(v102)))
			local v103 = v99.Name
			v_u_21.Text = (v103 == "" or not v103) and "Unnamed" or v103
			local v104 = v99.Level
			local v105 = v_u_9:GetCurrentLevelXPCost(v104)
			local v106 = v_u_15 <= v104
			local v107 = v99.LevelProgress or 0
			local v108 = v106 and 1 or v107 / v105
			v_u_3:Create(v_u_26.ACTUAL_BAR, TweenInfo.new(0.2), {
				["Size"] = UDim2.fromScale(v108, 1)
			}):Play()
			local v109 = v99.Hunger / v101
			v_u_3:Create(v_u_27.ACTUAL_BAR, TweenInfo.new(0.2), {
				["Size"] = UDim2.fromScale(v109, 1)
			}):Play()
			v_u_25.Text = ("%* / %* HGR"):format(v_u_94(v99.Hunger), v101)
			v_u_26.ACTUAL_BAR.BAR_END.Visible = not v106
			v_u_22.Text = ("Age: %*"):format(v104)
			v_u_24.Text = v106 and "MAXED" or ("%* / %* EXP"):format(v_u_94(v107), (math.round(v105)))
			local v110 = p95.TargetUUID
			local v111 = ""
			for _, v112 in v100.Passives do
				local v113 = v_u_9:GetPassiveString(v102, v112, v97, v110)
				if v113 ~= "" then
					v111 = v111 .. ("%*\n"):format(v113)
				end
			end
			local v114 = v_u_13.EnumToPetMutation[v96.PetData.MutationType]
			for _, v115 in (v_u_13.PetMutationRegistry[v114] or {
				["Passives"] = {}
			}).Passives do
				local v116 = v_u_9:GetPassiveString(v102, v115, v97, v110)
				if v116 ~= "" then
					v111 = v111 .. ("%*\n"):format(v116)
				end
			end
			v_u_28.Text = v111
		end
	else
		return
	end
end
function v_u_34.UpdateFromStatic(_)
	-- upvalues: (copy) v_u_34, (copy) v_u_14, (copy) v_u_9, (copy) v_u_23, (copy) v_u_94, (copy) v_u_21, (copy) v_u_15, (copy) v_u_3, (copy) v_u_26, (copy) v_u_27, (copy) v_u_25, (copy) v_u_22, (copy) v_u_24, (copy) v_u_13, (copy) v_u_28
	local v117 = v_u_34.LastStaticData
	if v117 then
		local v118 = v117.PetType
		local v119 = v117.PetData
		local v120 = v_u_14[v118]
		if v120 then
			local v121 = v120.DefaultHunger
			local v122 = v_u_9:CalculateWeight(v119.BaseWeight, v119.Level, Data.PetType)
			v_u_23.Text = ("Weight: %* KG"):format((v_u_94(v122)))
			v_u_21.Text = v119.Name == "" and "Unnamed" or (v119.Name or "Unnamed")
			local v123 = v119.Level
			local v124 = v_u_9:GetCurrentLevelXPCost(v123)
			local v125 = v_u_15 <= v123
			local v126 = v119.LevelProgress or 0
			v_u_3:Create(v_u_26.ACTUAL_BAR, TweenInfo.new(0.2), {
				["Size"] = UDim2.fromScale(v125 and 1 or v126 / v124, 1)
			}):Play()
			v_u_3:Create(v_u_27.ACTUAL_BAR, TweenInfo.new(0.2), {
				["Size"] = UDim2.fromScale(v119.Hunger / v121, 1)
			}):Play()
			v_u_25.Text = ("%* / %* HGR"):format(v_u_94(v119.Hunger), v121)
			v_u_26.ACTUAL_BAR.BAR_END.Visible = not v125
			v_u_22.Text = ("Age: %*"):format(v123)
			v_u_24.Text = v125 and "MAXED" or ("%* / %* EXP"):format(v_u_94(v126), (math.round(v124)))
			local v127 = ""
			for _, v128 in v120.Passives do
				local v129 = v_u_9:GetPassiveString(v122, v128)
				if v129 ~= "" then
					v127 = v127 .. ("%*\n"):format(v129)
				end
			end
			local v130 = v_u_13.EnumToPetMutation[v117.PetData.MutationType]
			for _, v131 in (v_u_13.PetMutationRegistry[v130] or {
				["Passives"] = {}
			}).Passives do
				local v132 = v_u_9:GetPassiveString(v122, v131)
				if v132 ~= "" then
					v127 = v127 .. ("%*\n"):format(v132)
				end
			end
			v_u_28.Text = v127
		end
	else
		return
	end
end
function v_u_34.Toggle(_, p_u_133, p134)
	-- upvalues: (copy) v_u_17, (copy) v_u_34, (copy) v_u_3, (copy) v_u_18, (copy) v_u_32, (copy) v_u_33, (copy) v_u_19, (copy) v_u_30
	if p_u_133 then
		v_u_17.Visible = true
	end
	v_u_34.Active = p_u_133
	if p_u_133 then
		v_u_34.BreadcrumbFunction = p134
	elseif v_u_34.BreadcrumbFunction then
		task.spawn(v_u_34.BreadcrumbFunction)
		v_u_34.BreadcrumbFunction = nil
	end
	local v135 = {
		["Position"] = p_u_133 and v_u_32 or v_u_33
	}
	v_u_3:Create(v_u_18, TweenInfo.new(0.5), v135):Play()
	local v136 = {
		["Position"] = p_u_133 and v_u_32 or v_u_33
	}
	local v137 = v_u_3:Create(v_u_19, TweenInfo.new(0.5), v136)
	v137:Play()
	v137.Completed:Connect(function()
		-- upvalues: (copy) p_u_133, (ref) v_u_17
		if not p_u_133 then
			v_u_17.Visible = false
		end
	end)
	if p_u_133 then
		game:GetService("GamepadService"):EnableGamepadCursor(v_u_30)
	else
		game:GetService("GamepadService"):DisableGamepadCursor()
	end
end
v31.MouseEnter:Connect(function()
	-- upvalues: (copy) v_u_12
	v_u_12()
end)
v31.MouseButton1Click:Connect(function()
	-- upvalues: (copy) v_u_10, (copy) v_u_34
	v_u_10()
	v_u_34:Toggle(false)
end)
task.spawn(function()
	-- upvalues: (copy) v_u_34
	while true do
		task.wait(1)
		v_u_34:Update()
	end
end)
return v_u_34