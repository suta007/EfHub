local v1 = game:GetService("ReplicatedStorage")
local v_u_2 = game:GetService("RunService")
local v_u_3 = require(v1.Modules.Trove)
local v_u_4 = Random.new()
local v_u_5 = 0
local v_u_44 = {
	["new"] = function()
		-- upvalues: (copy) v_u_44, (copy) v_u_2, (copy) v_u_4, (copy) v_u_3
		local v6 = {
			["__index"] = v_u_44
		}
		local v_u_7 = setmetatable({}, v6)
		v_u_7.Amplitude = 1
		v_u_7.Frequency = 1
		v_u_7.FadeInTime = 1
		v_u_7.FadeOutTime = 1
		v_u_7.SustainTime = 0
		v_u_7.Sustain = false
		v_u_7.PositionInfluence = Vector3.new(1, 1, 1)
		v_u_7.RotationInfluence = Vector3.new(1, 1, 1)
		local v8
		if v_u_2:IsRunning() then
			v8 = time
		else
			v8 = os.clock
		end
		v_u_7.TimeFunction = v8
		v_u_7._timeOffset = v_u_4:NextNumber(-1000000000, 1000000000)
		v_u_7._startTime = 0
		v_u_7._trove = v_u_3.new()
		v_u_7._trove:Add(function()
			-- upvalues: (copy) v_u_7
			if v_u_7 then
				local v9 = v_u_7
				if getmetatable(v9) ~= nil then
					local v10 = v_u_7
					getmetatable(v10).__mode = "kv"
				end
			end
		end)
		v_u_7._running = false
		return v_u_7
	end,
	["InverseSquare"] = function(p11, p12)
		local v13 = p12 < 1 and 1 or p12
		return p11 * (1 / (v13 * v13))
	end,
	["NextRenderName"] = function()
		-- upvalues: (ref) v_u_5
		v_u_5 = v_u_5 + 1
		return ("__shake_%.4i__"):format(v_u_5)
	end,
	["Start"] = function(p_u_14)
		p_u_14._startTime = p_u_14.TimeFunction()
		p_u_14._running = true
		p_u_14._trove:Add(function()
			-- upvalues: (copy) p_u_14
			p_u_14._running = false
		end)
	end,
	["Stop"] = function(p15)
		if p15._trove then
			p15._trove:Clean()
		end
	end,
	["IsShaking"] = function(p16)
		return p16._running
	end,
	["StopSustain"] = function(p17)
		local v18 = p17.TimeFunction()
		p17.Sustain = false
		p17.SustainTime = v18 - p17._startTime - p17.FadeInTime
	end,
	["Update"] = function(p19, p20)
		local v21 = false
		local v22 = p19.TimeFunction()
		local v23 = v22 - p19._startTime
		local v24 = (v22 + p19._timeOffset) / p19.Frequency % 1000000
		local v25 = 1
		local v26 = v23 >= p19.FadeInTime and 1 or v23 / p19.FadeInTime
		if not p19.Sustain and p19.FadeInTime + p19.SustainTime < v23 then
			if p19.FadeOutTime == 0 then
				v21 = true
			else
				v25 = 1 - (v23 - p19.FadeInTime - p19.SustainTime) / p19.FadeOutTime
				if not p19.Sustain and p19.FadeInTime + p19.SustainTime + p19.FadeOutTime <= v23 then
					v21 = true
				end
			end
		end
		local v27 = p20 * 80 * 1.25
		local v28 = math.noise(v24, 0) / 2
		local v29 = math.noise(0, v24) / 2
		local v30 = math.noise(v24, v24) / 2
		local v31 = Vector3.new(v28, v29, v30) * (p19.Amplitude * v27) * math.min(v26, v25)
		if v21 then
			p19:Stop()
		end
		return p19.PositionInfluence * v31, p19.RotationInfluence * v31, v21
	end,
	["OnSignal"] = function(p_u_32, p33, p_u_34)
		return p_u_32._trove:Connect(p33, function()
			-- upvalues: (copy) p_u_34, (copy) p_u_32
			p_u_34(p_u_32:Update())
		end)
	end,
	["BindToRenderStep"] = function(p_u_35, p36, p37, p_u_38)
		p_u_35._trove:BindToRenderStep(p36, p37, function(p39)
			-- upvalues: (copy) p_u_38, (copy) p_u_35
			p_u_38(p_u_35:Update(p39))
		end)
	end,
	["Clone"] = function(p40)
		-- upvalues: (copy) v_u_44
		local v41 = v_u_44.new()
		for _, v42 in {
			"Amplitude",
			"Frequency",
			"FadeInTime",
			"FadeOutTime",
			"SustainTime",
			"Sustain",
			"PositionInfluence",
			"RotationInfluence",
			"TimeFunction"
		} do
			v41[v42] = p40[v42]
		end
		return v41
	end,
	["Destroy"] = function(p43)
		p43:Stop()
	end
}
return v_u_44