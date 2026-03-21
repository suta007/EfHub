local v_u_1 = require(script:WaitForChild("Shake"))
local v_u_2 = workspace.CurrentCamera
local v3 = require(script:WaitForChild("Settings"))
local v_u_4 = v3.DD
local v_u_5 = v3.Min_Distance
local v_u_6 = require(script:WaitForChild("Check_Can_Shake"))
local v_u_7 = {
	["punch_shake"] = {
		["FadeInTime"] = 0,
		["Frequency"] = 0.05,
		["Amplitude"] = 0.35,
		["SustainTime"] = 0.145,
		["FadeOutTime"] = 0.15,
		["RotationInfluence"] = Vector3.new(0.1, 0.1, 0.1),
		["PositionInfluence"] = Vector3.new(0.4, 0.4, 0.4)
	},
	["tiny_shake"] = {
		["FadeInTime"] = 0,
		["Frequency"] = 0.07,
		["Amplitude"] = 0.25,
		["SustainTime"] = 0.05,
		["FadeOutTime"] = 0.2,
		["RotationInfluence"] = Vector3.new(0.1, 0.1, 0.1),
		["PositionInfluence"] = Vector3.new(0.5, 0.5, 0.5)
	},
	["tiny_shake_less_aggresive"] = {
		["FadeInTime"] = 0,
		["Frequency"] = 0.15,
		["Amplitude"] = 0.25,
		["SustainTime"] = 0.1,
		["FadeOutTime"] = 0.3,
		["RotationInfluence"] = Vector3.new(0.1, 0.1, 0.1),
		["PositionInfluence"] = Vector3.new(0.5, 0.5, 0.5)
	},
	["medium_shake"] = {
		["FadeInTime"] = 0,
		["Frequency"] = 0.055,
		["Amplitude"] = 0.98,
		["SustainTime"] = 0.14,
		["FadeOutTime"] = 0.5,
		["RotationInfluence"] = Vector3.new(0.25, 0.25, 0.25),
		["PositionInfluence"] = Vector3.new(3.5, 3.5, 3.5)
	},
	["medium_shake_longer"] = {
		["FadeInTime"] = 0,
		["Frequency"] = 0.1,
		["Amplitude"] = 0.4,
		["SustainTime"] = 0.9,
		["FadeOutTime"] = 0.75,
		["RotationInfluence"] = Vector3.new(0.25, 0.25, 0.25),
		["PositionInfluence"] = Vector3.new(3.5, 3.5, 3.5)
	},
	["medium_tiny_shake"] = {
		["FadeInTime"] = 0,
		["Frequency"] = 0.1,
		["Amplitude"] = 0.5,
		["SustainTime"] = 0.14,
		["FadeOutTime"] = 0.5,
		["RotationInfluence"] = Vector3.new(0.25, 0.25, 0.25),
		["PositionInfluence"] = Vector3.new(3.5, 3.5, 3.5)
	},
	["medium_tiny_shake2"] = {
		["FadeInTime"] = 0,
		["Frequency"] = 0.15,
		["Amplitude"] = 0.4,
		["SustainTime"] = 0.14,
		["FadeOutTime"] = 0.5,
		["RotationInfluence"] = Vector3.new(0.15, 0.15, 0.15),
		["PositionInfluence"] = Vector3.new(1, 1, 1)
	},
	["activate_shake_less_aggresive"] = {
		["FadeInTime"] = 0,
		["Frequency"] = 0.22,
		["Amplitude"] = 0.1,
		["SustainTime"] = 0.2,
		["FadeOutTime"] = 0.4,
		["RotationInfluence"] = Vector3.new(0.25, 0.25, 0.25),
		["PositionInfluence"] = Vector3.new(0.5, 0.5, 0.5)
	},
	["activate_shake"] = {
		["FadeInTime"] = 0,
		["Frequency"] = 0.15,
		["Amplitude"] = 0.25,
		["SustainTime"] = 0.1,
		["FadeOutTime"] = 0.5,
		["RotationInfluence"] = Vector3.new(0.25, 0.25, 0.25),
		["PositionInfluence"] = Vector3.new(1, 1, 1)
	}
}
local v_u_8 = typeof
return function(p9, p10)
	-- upvalues: (copy) v_u_6, (copy) v_u_8, (copy) v_u_7, (copy) v_u_1, (copy) v_u_2, (copy) v_u_5, (copy) v_u_4
	if v_u_6() == true then
		local v_u_11
		if p9 == nil or p10 ~= nil then
			v_u_11 = p9
			p9 = p10
		else
			v_u_11 = nil
		end
		if v_u_8(p9) ~= "table" and v_u_7[p9] then
			p9 = v_u_7[p9]
		end
		if p9 ~= nil then
			if v_u_8(p9) == "table" then
				local v12 = Enum.RenderPriority.Camera.Value
				local v_u_13 = v_u_1.new()
				if p9 then
					for v14, v15 in pairs(p9) do
						v_u_13[v14] = v15
					end
				end
				v_u_13:Start()
				v_u_13:BindToRenderStep(v_u_1.NextRenderName(), v12, function(p16, p17, p18)
					-- upvalues: (copy) v_u_13, (ref) v_u_11, (ref) v_u_2, (ref) v_u_5, (ref) v_u_4
					local v19 = v_u_13.center_pos or v_u_11
					local v20 = v_u_11
					if typeof(v20) ~= "BasePart" then
						local v21 = v_u_11
						if typeof(v21) ~= "Part" then
							::l5::
							if v19 ~= nil then
								local v22 = (v_u_2.CFrame.Position - v19).Magnitude
								local v23 = v_u_5
								local v24 = math.clamp(v22, v23, 999999)
								p16 = v_u_13.InverseSquare(p16, v24) * v_u_4
								p17 = v_u_13.InverseSquare(p17, v24) * v_u_4
							end
							local v25 = v_u_2
							v25.CFrame = v25.CFrame * (CFrame.new(p16) * CFrame.Angles(p17.X, p17.Y, p17.Z))
							if p18 == true then
								v_u_13:Stop()
								v_u_13:Destroy()
							end
							return
						end
					end
					v19 = v_u_11.Position
					goto l5
				end)
				return v_u_13
			end
		end
	else
		return
	end
end