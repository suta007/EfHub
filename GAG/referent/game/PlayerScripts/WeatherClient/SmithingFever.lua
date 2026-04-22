local v1 = {}
game:GetService("CollectionService")
local v2 = game:GetService("ReplicatedStorage")
local v_u_3 = game:GetService("TweenService")
local v_u_4 = game:GetService("RunService")
local v_u_5 = game:GetService("Lighting")
local v_u_6 = game:GetService("Debris")
local v_u_7 = require(v2.Code:WaitForChild("Windlines"))
local v_u_8 = require("@self/Bezier")
local v_u_9 = require("@self/Cleaner")
local v_u_10 = script:FindFirstChild("WindBeams")
local v_u_11 = script:FindFirstChild("SkyPart")
local v_u_12 = script:FindFirstChild("Sky")
local v_u_13 = script:FindFirstChild("HitParticles")
local v_u_14 = script:FindFirstChild("Hammer")
local v_u_15 = workspace.Terrain.Clouds
local v_u_16 = v2.GameEvents.SmithingFeverSpawnHammer
require(v2.Modules.SoundPlayer)
require(v2.Data.SoundData)
local v_u_17 = {
	["Atmosphere"] = {
		["Density"] = 0.3,
		["Offset"] = 0,
		["Color"] = Color3.fromRGB(0, 0, 0),
		["Decay"] = Color3.fromRGB(0, 0, 0),
		["Glare"] = 0,
		["Haze"] = 0
	},
	["Properties"] = {
		["Brightness"] = 1,
		["Ambient"] = Color3.fromRGB(0, 0, 0),
		["ColorShift_Top"] = Color3.fromRGB(0, 0, 0),
		["ColorShift_Bottom"] = Color3.fromRGB(0, 0, 0),
		["OutdoorAmbient"] = Color3.fromRGB(190, 63, 0)
	},
	["DefaultProperties"] = {
		["Brightness"] = 2,
		["Ambient"] = Color3.fromRGB(128, 128, 128),
		["ColorShift_Top"] = Color3.fromRGB(0, 0, 0),
		["ColorShift_Bottom"] = Color3.fromRGB(0, 0, 0),
		["OutdoorAmbient"] = Color3.fromRGB(128, 128, 128)
	}
}
local v_u_18 = v_u_9.new()
local v_u_19 = false
local function v_u_105()
	-- upvalues: (ref) v_u_19, (copy) v_u_18, (copy) v_u_5, (copy) v_u_10, (copy) v_u_11, (copy) v_u_12, (copy) v_u_3, (copy) v_u_17, (copy) v_u_7, (copy) v_u_15, (copy) v_u_14, (copy) v_u_13, (copy) v_u_6, (copy) v_u_8, (copy) v_u_9, (copy) v_u_4, (copy) v_u_16
	if v_u_19 then
		return nil
	end
	v_u_19 = true
	v_u_18:Cleanup()
	local _ = workspace.CurrentCamera
	local v_u_20 = v_u_5:FindFirstChild("Cartoon")
	local v_u_21 = {}
	local v_u_22 = Random.new()
	local v_u_23 = {
		["Amount"] = 30,
		["Min_Radius"] = 15,
		["Max_Radius"] = 50,
		["Max_Y_Offset"] = 30,
		["Min_Y_Offset"] = -5,
		["Rotation_Speed"] = 0.8,
		["Fly_Rotation_Speed"] = 3.5,
		["Rotation_Offset"] = CFrame.Angles(0, 0, 1.5707963267948966)
	}
	local function v24()
		-- upvalues: (ref) v_u_3, (ref) v_u_5, (ref) v_u_17, (ref) v_u_7
		v_u_3:Create(v_u_5, TweenInfo.new(3), v_u_17.Properties):Play()
		v_u_3:Create(v_u_5.Atmosphere, TweenInfo.new(3), v_u_17.Atmosphere):Play()
		v_u_3:Create(game.Workspace.BasePlate.TopBaseplate, TweenInfo.new(3), {
			["Color"] = Color3.fromRGB(188, 155, 93)
		}):Play()
		v_u_7:Init({
			["Direction"] = Vector3.new(0, 0, 1),
			["Speed"] = 100,
			["Lifetime"] = 5,
			["SpawnRate"] = 15,
			["Color"] = Color3.fromRGB(255, 255, 255)
		})
		return nil
	end
	local function v25()
		-- upvalues: (copy) v_u_20, (ref) v_u_5, (ref) v_u_3, (ref) v_u_17, (ref) v_u_15, (ref) v_u_7
		if v_u_20 then
			v_u_20.Parent = v_u_5
		end
		v_u_3:Create(v_u_5, TweenInfo.new(3), v_u_17.DefaultProperties):Play()
		v_u_3:Create(v_u_5.Atmosphere, TweenInfo.new(3), {
			["Density"] = 0,
			["Offset"] = 0,
			["Color"] = Color3.fromRGB(215, 244, 255),
			["Decay"] = Color3.fromRGB(190, 238, 255),
			["Glare"] = 0,
			["Haze"] = 0
		}):Play()
		v_u_3:Create(v_u_15, TweenInfo.new(3), {
			["Cover"] = 0,
			["Density"] = 0.097,
			["Color"] = Color3.fromRGB(22, 40, 70)
		}):Play()
		v_u_3:Create(game.Workspace.BasePlate.TopBaseplate, TweenInfo.new(3), {
			["Color"] = Color3.fromRGB(91, 154, 76)
		}):Play()
		v_u_7:Cleanup()
		return nil
	end
	local function v_u_33(p26)
		-- upvalues: (ref) v_u_18, (ref) v_u_14, (copy) v_u_22, (copy) v_u_23, (copy) v_u_21
		local v27 = v_u_18:Add(v_u_14:Clone())
		v27.Name = ("Hammer_%*"):format(p26)
		v27.Parent = workspace
		local v28 = v_u_22:NextNumber(v_u_23.Min_Radius, v_u_23.Max_Radius)
		local v29 = v_u_22:NextNumber(v_u_23.Min_Y_Offset, v_u_23.Max_Y_Offset)
		local v30 = 6.283185307179586 / v_u_23.Amount * p26 + v_u_22:NextNumber(-0.3, 0.3)
		local v31 = v_u_21
		local v32 = {
			["Trail"] = v27:FindFirstChild("Head"):FindFirstChild("2"):FindFirstChild("Trail"),
			["Radius"] = v28,
			["Index"] = p26,
			["AngleOffset"] = v30,
			["HeightOffset"] = v29,
			["Sounds"] = {
				["Loop"] = v27:FindFirstChild("Head"):FindFirstChild("Loop"),
				["Start"] = v27:FindFirstChild("Head"):FindFirstChild("Start"),
				["Explode"] = v27:FindFirstChild("Head"):FindFirstChild("Explode")
			}
		}
		v31[v27] = v32
		return v27, v_u_21[v27]
	end
	local function v_u_39()
		-- upvalues: (copy) v_u_21, (copy) v_u_22, (copy) v_u_33, (copy) v_u_23
		local v34 = 0
		local v35 = {}
		for v36, _ in next, v_u_21 do
			v34 = v34 + 1
			v35[v34] = v36
		end
		local v37 = v35[v_u_22:NextInteger(1, v34)]
		local v38
		if v37 then
			v38 = v_u_21[v37]
		else
			v38 = v37
		end
		if not v37 then
			v37, v38 = v_u_33(v_u_22:NextInteger(1, v_u_23.Amount))
		end
		v_u_21[v37] = nil
		return v37, v38
	end
	local function v87(p_u_40, p41, p42)
		-- upvalues: (copy) v_u_39, (copy) v_u_22, (ref) v_u_3, (ref) v_u_18, (ref) v_u_13, (copy) v_u_33, (ref) v_u_6, (ref) v_u_8, (copy) v_u_23, (ref) v_u_9
		local v_u_43, v_u_44 = v_u_39()
		local v_u_45, v_u_46 = v_u_43:GetBoundingBox()
		local v_u_47 = Instance.new("CFrameValue", v_u_43)
		local v_u_48 = Instance.new("NumberValue", v_u_43)
		local v49 = v_u_45.Position - p_u_40
		local v_u_50 = v49.Magnitude > 0 and v49.Unit or Vector3.new(0, 1, 0)
		local function v65()
			-- upvalues: (copy) p_u_40, (copy) v_u_50, (copy) v_u_46, (copy) v_u_45, (ref) v_u_22
			local v51 = RaycastParams.new()
			v51.RespectCanCollide = false
			local v52 = workspace
			local v53 = p_u_40
			local v54 = v_u_50
			local v55 = v_u_46.X
			local v56 = v_u_46.Y
			local v57 = v_u_46.Z
			local v58 = v52:Spherecast(v53, 3, v54 * math.max(v55, v56, v57), v51)
			local v59 = p_u_40
			if v58 then
				v59 = v58.Position
			end
			local v60 = {}
			local v61 = v_u_45.Position
			local v62 = v_u_45.Position:Lerp(v59, 0.5)
			local v63 = v_u_22:NextNumber(-10, 10)
			local v64 = v_u_22
			__set_list(v60, 1, {v61, v62 + Vector3.new(v63, 0, v64:NextNumber(-10, 10)), v59})
			return v60
		end
		local function v69(p66, p67)
			-- upvalues: (copy) v_u_47, (ref) v_u_3
			local v68 = v_u_47.Value
			v_u_3:Create(v_u_47, TweenInfo.new(p67, Enum.EasingStyle.Linear), {
				["Value"] = CFrame.new(p66) * (v68.Position == p66 and v68.Rotation or CFrame.lookAt(v68.Position, p66).Rotation)
			}):Play()
			return nil
		end
		local function v74(p70)
			-- upvalues: (ref) v_u_18, (copy) v_u_43, (ref) v_u_13, (copy) v_u_47, (copy) v_u_44, (ref) v_u_33, (ref) v_u_6
			if not (v_u_18:Get(v_u_43) or p70) then
				return nil
			end
			v_u_18:Remove(v_u_43)
			local v71 = v_u_13:Clone()
			v71.CFrame = v_u_47.Value
			v71.Parent = workspace
			v_u_44.Sounds.Loop:Stop()
			v_u_44.Sounds.Start:Stop()
			v_u_44.Sounds.Explode:Play()
			for _, v72 in v71:GetDescendants() do
				if v72:IsA("ParticleEmitter") then
					v72:Emit(v72:GetAttribute("EmitCount"))
				end
			end
			for _, v73 in v_u_43:GetDescendants() do
				if v73:IsA("BasePart") then
					v73.Transparency = 1
				end
			end
			v_u_33(v_u_44.Index)
			v_u_6:AddItem(v71, 5)
			v_u_6:AddItem(v_u_43, 5)
			return nil
		end
		local v75 = p41 - (workspace:GetServerTimeNow() - p42)
		local v76 = v_u_8.new
		local v77 = v65()
		local v78 = v76(table.unpack(v77))
		local v79 = v78:GetPath(0.1)
		if v78:GetLength() >= 5000 or v75 <= 0 then
			v74(true)
			return nil
		end
		v_u_47.Value = v_u_45
		v_u_44.Trail.Enabled = true
		v_u_44.Sounds.Loop.Looped = true
		v_u_44.Sounds.Start:Play()
		v_u_44.Sounds.Loop:Play()
		v_u_3:Create(v_u_48, TweenInfo.new(v75, Enum.EasingStyle.Linear), {
			["Value"] = 360 * (v_u_23.Fly_Rotation_Speed * v75)
		}):Play()
		v_u_18:Add(v_u_47.Changed:Connect(function()
			-- upvalues: (copy) v_u_43, (copy) v_u_47, (ref) v_u_23, (copy) v_u_48
			local v80 = v_u_43
			local v81 = v_u_47.Value * v_u_23.Rotation_Offset
			local v82 = CFrame.Angles
			local v83 = v_u_48.Value
			v80:PivotTo(v81 * v82(0, math.rad(v83), 0))
			return nil
		end), "Disconnect", v_u_43)
		local v84 = v75 / #v79
		for v85, v86 in v79 do
			if not v_u_9.Is(v_u_18) then
				return nil
			end
			if v85 / #v79 >= 0.1 then
				v69(v86, v84)
				task.wait(v84)
			end
		end
		v74(false)
		return nil
	end
	local function v100()
		-- upvalues: (copy) v_u_23, (copy) v_u_33, (ref) v_u_18, (ref) v_u_4, (copy) v_u_21
		local v_u_88 = 0
		for v89 = 1, v_u_23.Amount do
			v_u_33(v89)
		end
		v_u_18:Add(v_u_4.Heartbeat:Connect(function(p90)
			-- upvalues: (ref) v_u_88, (ref) v_u_21, (ref) v_u_23
			v_u_88 = v_u_88 + p90
			for v91, v92 in next, v_u_21 do
				local v93 = v92.Radius
				local v94 = v92.AngleOffset + v_u_88 * v_u_23.Rotation_Speed
				local v95 = -104.5 + v93 * math.cos(v94)
				local v96 = -13.5 + v93 * math.sin(v94)
				local v97 = 30 + v92.HeightOffset
				local v98 = Vector3.new(v95, v97, v96)
				local v99 = Vector3.new(-104.5, v97, -13.5)
				v91:PivotTo(CFrame.new(v98, v99) * v_u_23.Rotation_Offset)
			end
		end))
		return nil
	end
	(function()
		-- upvalues: (ref) v_u_18, (ref) v_u_10, (ref) v_u_11, (ref) v_u_12, (ref) v_u_5, (copy) v_u_20, (ref) v_u_3
		local v101 = v_u_18:Add(v_u_10:Clone())
		local v102 = v_u_18:Add(v_u_11:Clone())
		local v103 = v_u_18:Add(v_u_12:Clone())
		local v104 = v102.CFrame
		v103.Parent = v_u_5
		v102.Parent = workspace
		v101.Parent = workspace
		if v_u_20 then
			v_u_20.Parent = script
		end
		v_u_3:Create(v102, TweenInfo.new(3, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut, -1, true), {
			["Transparency"] = 0.5
		}):Play()
		v_u_3:Create(v102, TweenInfo.new(5, Enum.EasingStyle.Linear, Enum.EasingDirection.InOut, -1, false), {
			["CFrame"] = v104 * CFrame.Angles(0, 6.157521601035994, 0)
		}):Play()
		return nil
	end)()
	v24()
	v_u_18:Add(v_u_16.OnClientEvent:Connect(v87))
	v_u_18:Add(v25)
	v_u_18:Add(task.delay(2, v100))
	return nil
end
local v_u_106 = script.Name
workspace:GetAttributeChangedSignal(v_u_106):Connect(function()
	-- upvalues: (copy) v_u_106, (copy) v_u_105, (copy) v_u_18
	if workspace:GetAttribute(v_u_106) then
		v_u_105()
		return nil
	else
		v_u_18:Cleanup()
		return nil
	end
end)
if workspace:GetAttribute(v_u_106) then
	v_u_105()
else
	v_u_18:Cleanup()
end
return v1