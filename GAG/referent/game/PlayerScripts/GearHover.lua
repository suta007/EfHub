local v1 = game:GetService("Players")
local v_u_2 = game:GetService("UserInputService")
local v_u_3 = game:GetService("RunService")
local v4 = game:GetService("ReplicatedStorage")
local v_u_5 = v1.LocalPlayer
local v6 = v_u_5:WaitForChild("PlayerGui")
local v_u_7 = v6:WaitForChild("GearHover_UI")
local v_u_8 = v_u_7:WaitForChild("Frame")
local v_u_9 = v_u_8:WaitForChild("GearName")
local v_u_10 = v_u_8:WaitForChild("GearInfo")
local v11 = require(v4.Modules.NumberUtil)
local v_u_12 = require(v4.Modules.TimeHelper)
local v_u_13 = v6:WaitForChild("PlantHover_UI"):WaitForChild("Frame")
local v14 = require(v4.Data.SprinklerData)
local v_u_15 = require(v4.Modules.StringUtils)
local v_u_16 = script.Range
v_u_7.Frame.Visible = false
local v_u_17 = {
	["LightningRod"] = "Redirect",
	["NightStaff"] = "Channel",
	["TranquilStaff"] = "Charge",
	["CorruptStaff"] = "Charge",
	["NectarStaff"] = "Attraction",
	["StarCaller"] = "Call",
	["TanningMirror"] = "Reflect",
	["FairyTargeter"] = "Enchant"
}
local v_u_18 = {}
local v_u_19 = {}
local v_u_21 = {
	["AutoColon"] = v11.autoColon,
	["LargestTime"] = function(p20)
		-- upvalues: (copy) v_u_12
		return v_u_12:GetLargestTime(p20, "round")
	end,
	["MHS"] = v11.toHMS
}
local v_u_22 = { "Sprinkler", "Bonfire" }
local v_u_23 = {
	["Lightning Rod"] = Vector3.new(70, 0.1, 70),
	["Nectar Staff"] = Vector3.new(40, 0.1, 40),
	["Star Caller"] = Vector3.new(70, 0.1, 70),
	["Night Staff"] = Vector3.new(0, 0, 0),
	["Tranquil Staff"] = Vector3.new(0, 0, 0),
	["Corrupt Staff"] = Vector3.new(0, 0, 0),
	["Tanning Mirror"] = Vector3.new(40, 0.1, 40),
	["Fairy Targeter"] = Vector3.new(40, 0.1, 40),
	["Bonfire"] = Vector3.new(0, 0, 0)
}
local v_u_24 = {
	"Sprinkler",
	"LightningRod",
	"NightStaff",
	"TranquilStaff",
	"CorruptStaff",
	"NectarStaff",
	"StarCaller",
	"TanningMirror",
	"FairyTargeter",
	"Bonfire"
}
local v_u_25 = nil
local v_u_26 = nil
local v_u_27 = nil
local v_u_28 = false
local v_u_29 = 0
local function v_u_42(p30)
	-- upvalues: (copy) v_u_22, (copy) v_u_5, (copy) v_u_18, (copy) v_u_19, (copy) v_u_21, (copy) v_u_17, (copy) v_u_15
	for _, v31 in v_u_22 do
		if p30:HasTag(v31) then
			v41 = true
			::l4::
			if v41 then
				local v32 = p30:GetAttribute("Lifetime") or 0
				if p30:HasTag("ChristmasStocking") and not v_u_5:GetAttribute("FarmFullyLoaded") then
					return "Loading..."
				end
				local v33 = v_u_18[p30.Name] or nil
				local v34 = v_u_21[v_u_19[p30.Name] or "AutoColon"]
				return ("%*%*"):format(v33 and v33 .. " " or "", (v34(v32)))
			end
			if typeof(p30:GetAttribute("Uses")) ~= "number" then
				return ""
			end
			local v35 = "Use"
			for _, v36 in p30:GetTags() do
				local v37 = v_u_17[v36]
				if v37 then
					v35 = v37
					break
				end
			end
			local v38 = p30:GetAttribute("Uses")
			local v39 = string.format
			local v40 = "%d %s Left"
			if v38 ~= 1 then
				v35 = v_u_15:Pluralize(v35)
			end
			return v39(v40, v38, v35)
		end
	end
	local v41 = false
	goto l4
end
for v43, v44 in v14.SprinklerBoxSizes do
	local v45 = v44.X
	local v46 = v44.Z
	v_u_23[v43] = Vector3.new(v45, 0.1, v46)
end
local function v_u_47()
	-- upvalues: (copy) v_u_24
	-- failed to decompile
end
local function v_u_60(p_u_48)
	-- upvalues: (ref) v_u_26, (ref) v_u_25, (ref) v_u_27, (copy) v_u_24, (copy) v_u_16, (copy) v_u_23, (copy) v_u_9, (copy) v_u_10, (copy) v_u_42, (copy) v_u_3
	if v_u_26 == p_u_48 then
		return
	end
	if v_u_25 then
		v_u_25:Disconnect()
		v_u_25 = nil
	end
	v_u_26 = nil
	if v_u_27 then
		v_u_27:Destroy()
		v_u_27 = nil
	end
	v_u_26 = p_u_48
	local v49 = p_u_48.Name
	if v49 == "ServerLightningRod" then
		return
	end
	for _, v50 in v_u_24 do
		if p_u_48:HasTag(v50) then
			v59 = true
			::l12::
			if v59 then
				if v_u_27 then
					v_u_27:Destroy()
				end
				v_u_27 = v_u_16:Clone()
				v_u_27.Parent = workspace.Visuals or workspace
				v_u_27.Size = v_u_23[p_u_48.Name]
				if p_u_48.PrimaryPart then
					local v51 = p_u_48.PrimaryPart
					local v52 = v51.Position.Y - v51.Size.Y / 2
					local v53 = v_u_27
					local v54 = CFrame.new
					local v55 = v51.Position.X
					local v56 = v52 + 0.05
					local v57 = v51.Position.Z
					v53.CFrame = v54((Vector3.new(v55, v56, v57)))
					v_u_27.CanQuery = false
				end
				v_u_9.Text = v49
				local function v58()
					-- upvalues: (ref) v_u_10, (ref) v_u_42, (copy) p_u_48
					v_u_10.Text = v_u_42(p_u_48)
				end
				v_u_10.Text = v_u_42(p_u_48)
				v_u_25 = v_u_3.Heartbeat:Connect(v58)
			end
		end
	end
	local v59 = false
	goto l12
end
local v_u_61 = v_u_5:GetMouse()
local function v_u_65()
	-- upvalues: (copy) v_u_13, (copy) v_u_8, (ref) v_u_25, (ref) v_u_26, (ref) v_u_27, (copy) v_u_61, (copy) v_u_47, (copy) v_u_60, (copy) v_u_2, (copy) v_u_7
	if v_u_13.Visible then
		v_u_8.Visible = false
		if v_u_25 then
			v_u_25:Disconnect()
			v_u_25 = nil
		end
		v_u_26 = nil
		if v_u_27 then
			v_u_27:Destroy()
			v_u_27 = nil
		end
		return
	else
		local v62 = v_u_61.Target
		if v62 then
			local v63 = v_u_47(v62)
			if v63 then
				v_u_60(v63)
				v_u_8.Visible = true
				local v64 = v_u_2:GetMouseLocation()
				v_u_7.Frame.Position = UDim2.new(0, v64.X + 20, 0, v64.Y + 10)
			else
				if v_u_25 then
					v_u_25:Disconnect()
					v_u_25 = nil
				end
				v_u_26 = nil
				if v_u_27 then
					v_u_27:Destroy()
					v_u_27 = nil
				end
				v_u_8.Visible = false
			end
		else
			if v_u_25 then
				v_u_25:Disconnect()
				v_u_25 = nil
			end
			v_u_26 = nil
			if v_u_27 then
				v_u_27:Destroy()
				v_u_27 = nil
			end
			v_u_8.Visible = false
			return
		end
	end
end
v_u_2.TouchStarted:Connect(function(_, p66)
	-- upvalues: (ref) v_u_28, (ref) v_u_29
	if not p66 then
		v_u_28 = true
		v_u_29 = tick()
	end
end)
v_u_2.TouchEnded:Connect(function()
	-- upvalues: (ref) v_u_28, (ref) v_u_25, (ref) v_u_26, (ref) v_u_27, (copy) v_u_8
	v_u_28 = false
	if v_u_25 then
		v_u_25:Disconnect()
		v_u_25 = nil
	end
	v_u_26 = nil
	if v_u_27 then
		v_u_27:Destroy()
		v_u_27 = nil
	end
	v_u_8.Visible = false
end)
v_u_2.InputChanged:Connect(function(p67)
	-- upvalues: (copy) v_u_65
	if p67.UserInputType == Enum.UserInputType.MouseMovement then
		v_u_65()
	end
end)
v_u_3.Heartbeat:Connect(function()
	-- upvalues: (copy) v_u_8, (copy) v_u_2, (copy) v_u_7, (ref) v_u_28, (ref) v_u_29, (copy) v_u_65
	if v_u_8.Visible then
		local v68 = v_u_2:GetMouseLocation()
		v_u_7.Frame.Position = UDim2.new(0, v68.X + 20, 0, v68.Y + 10)
	end
	if v_u_28 and tick() - v_u_29 >= 0.5 then
		v_u_65()
	end
	if v_u_2.GamepadEnabled then
		v_u_65()
	end
end)
v_u_5.CharacterRemoving:Connect(function()
	-- upvalues: (ref) v_u_25, (ref) v_u_26, (ref) v_u_27
	if v_u_25 then
		v_u_25:Disconnect()
		v_u_25 = nil
	end
	v_u_26 = nil
	if v_u_27 then
		v_u_27:Destroy()
		v_u_27 = nil
	end
end)
v4.GameEvents.SendClientGenericGearData.OnClientEvent:Connect(function(p69)
	-- upvalues: (copy) v_u_23, (copy) v_u_17, (copy) v_u_18, (copy) v_u_19, (copy) v_u_22, (copy) v_u_24
	for v70, v71 in p69 do
		local v72 = v71.PlaceableData
		if v72 then
			local v73 = string.gsub(v70, " ", "")
			if v72.GearRange then
				v_u_23[v70] = v72.GearRange
			else
				v_u_23[v70] = Vector3.new(0, 0, 0)
			end
			if v72.UsesText then
				v_u_17[v70] = v72.UsesText
			end
			if v72.LifetimeText then
				v_u_18[v70] = v72.LifetimeText
			end
			if v72.LifetimeFormat then
				v_u_19[v70] = v72.LifetimeFormat
			end
			if v72.Lifetime and not table.find(v_u_22, v73) then
				local v74 = v_u_22
				table.insert(v74, v73)
			end
			if not table.find(v_u_24, v73) then
				local v75 = v_u_24
				table.insert(v75, v73)
			end
		end
	end
end)