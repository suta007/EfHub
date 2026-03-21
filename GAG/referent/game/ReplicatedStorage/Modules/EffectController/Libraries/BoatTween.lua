local v_u_1 = game:GetService("RunService")
local v2 = require(script.TweenFunctions)
local v_u_3 = require(script.Lerps)
local v4 = {}
local v_u_5 = {
	["Heartbeat"] = true,
	["Stepped"] = true,
	["RenderStepped"] = true
}
if not v_u_1:IsClient() then
	v_u_5.RenderStepped = nil
end
local v_u_6 = {
	["FabricAccelerate"] = {
		["In"] = v2.InFabricAccelerate,
		["Out"] = v2.OutFabricAccelerate,
		["InOut"] = v2.InOutFabricAccelerate,
		["OutIn"] = v2.OutInFabricAccelerate
	},
	["UWPAccelerate"] = {
		["In"] = v2.InUWPAccelerate,
		["Out"] = v2.OutUWPAccelerate,
		["InOut"] = v2.InOutUWPAccelerate,
		["OutIn"] = v2.OutInUWPAccelerate
	},
	["Circ"] = {
		["In"] = v2.InCirc,
		["Out"] = v2.OutCirc,
		["InOut"] = v2.InOutCirc,
		["OutIn"] = v2.OutInCirc
	},
	["RevBack"] = {
		["In"] = v2.InRevBack,
		["Out"] = v2.OutRevBack,
		["InOut"] = v2.InOutRevBack,
		["OutIn"] = v2.OutInRevBack
	},
	["Spring"] = {
		["In"] = v2.InSpring,
		["Out"] = v2.OutSpring,
		["InOut"] = v2.InOutSpring,
		["OutIn"] = v2.OutInSpring
	},
	["Standard"] = {
		["In"] = v2.InStandard,
		["Out"] = v2.OutStandard,
		["InOut"] = v2.InOutStandard,
		["OutIn"] = v2.OutInStandard
	},
	["StandardExpressive"] = {
		["In"] = v2.InStandardExpressive,
		["Out"] = v2.OutStandardExpressive,
		["InOut"] = v2.InOutStandardExpressive,
		["OutIn"] = v2.OutInStandardExpressive
	},
	["Linear"] = {
		["In"] = v2.InLinear,
		["Out"] = v2.OutLinear,
		["InOut"] = v2.InOutLinear,
		["OutIn"] = v2.OutInLinear
	},
	["ExitProductive"] = {
		["In"] = v2.InExitProductive,
		["Out"] = v2.OutExitProductive,
		["InOut"] = v2.InOutExitProductive,
		["OutIn"] = v2.OutInExitProductive
	},
	["Deceleration"] = {
		["In"] = v2.InDeceleration,
		["Out"] = v2.OutDeceleration,
		["InOut"] = v2.InOutDeceleration,
		["OutIn"] = v2.OutInDeceleration
	},
	["Smoother"] = {
		["In"] = v2.InSmoother,
		["Out"] = v2.OutSmoother,
		["InOut"] = v2.InOutSmoother,
		["OutIn"] = v2.OutInSmoother
	},
	["FabricStandard"] = {
		["In"] = v2.InFabricStandard,
		["Out"] = v2.OutFabricStandard,
		["InOut"] = v2.InOutFabricStandard,
		["OutIn"] = v2.OutInFabricStandard
	},
	["RidiculousWiggle"] = {
		["In"] = v2.InRidiculousWiggle,
		["Out"] = v2.OutRidiculousWiggle,
		["InOut"] = v2.InOutRidiculousWiggle,
		["OutIn"] = v2.OutInRidiculousWiggle
	},
	["MozillaCurve"] = {
		["In"] = v2.InMozillaCurve,
		["Out"] = v2.OutMozillaCurve,
		["InOut"] = v2.InOutMozillaCurve,
		["OutIn"] = v2.OutInMozillaCurve
	},
	["Expo"] = {
		["In"] = v2.InExpo,
		["Out"] = v2.OutExpo,
		["InOut"] = v2.InOutExpo,
		["OutIn"] = v2.OutInExpo
	},
	["Sine"] = {
		["In"] = v2.InSine,
		["Out"] = v2.OutSine,
		["InOut"] = v2.InOutSine,
		["OutIn"] = v2.OutInSine
	},
	["Cubic"] = {
		["In"] = v2.InCubic,
		["Out"] = v2.OutCubic,
		["InOut"] = v2.InOutCubic,
		["OutIn"] = v2.OutInCubic
	},
	["EntranceExpressive"] = {
		["In"] = v2.InEntranceExpressive,
		["Out"] = v2.OutEntranceExpressive,
		["InOut"] = v2.InOutEntranceExpressive,
		["OutIn"] = v2.OutInEntranceExpressive
	},
	["Elastic"] = {
		["In"] = v2.InElastic,
		["Out"] = v2.OutElastic,
		["InOut"] = v2.InOutElastic,
		["OutIn"] = v2.OutInElastic
	},
	["Quint"] = {
		["In"] = v2.InQuint,
		["Out"] = v2.OutQuint,
		["InOut"] = v2.InOutQuint,
		["OutIn"] = v2.OutInQuint
	},
	["EntranceProductive"] = {
		["In"] = v2.InEntranceProductive,
		["Out"] = v2.OutEntranceProductive,
		["InOut"] = v2.InOutEntranceProductive,
		["OutIn"] = v2.OutInEntranceProductive
	},
	["Bounce"] = {
		["In"] = v2.InBounce,
		["Out"] = v2.OutBounce,
		["InOut"] = v2.InOutBounce,
		["OutIn"] = v2.OutInBounce
	},
	["Smooth"] = {
		["In"] = v2.InSmooth,
		["Out"] = v2.OutSmooth,
		["InOut"] = v2.InOutSmooth,
		["OutIn"] = v2.OutInSmooth
	},
	["Back"] = {
		["In"] = v2.InBack,
		["Out"] = v2.OutBack,
		["InOut"] = v2.InOutBack,
		["OutIn"] = v2.OutInBack
	},
	["Quart"] = {
		["In"] = v2.InQuart,
		["Out"] = v2.OutQuart,
		["InOut"] = v2.InOutQuart,
		["OutIn"] = v2.OutInQuart
	},
	["StandardProductive"] = {
		["In"] = v2.InStandardProductive,
		["Out"] = v2.OutStandardProductive,
		["InOut"] = v2.InOutStandardProductive,
		["OutIn"] = v2.OutInStandardProductive
	},
	["Quad"] = {
		["In"] = v2.InQuad,
		["Out"] = v2.OutQuad,
		["InOut"] = v2.InOutQuad,
		["OutIn"] = v2.OutInQuad
	},
	["FabricDecelerate"] = {
		["In"] = v2.InFabricDecelerate,
		["Out"] = v2.OutFabricDecelerate,
		["InOut"] = v2.InOutFabricDecelerate,
		["OutIn"] = v2.OutInFabricDecelerate
	},
	["Acceleration"] = {
		["In"] = v2.InAcceleration,
		["Out"] = v2.OutAcceleration,
		["InOut"] = v2.InOutAcceleration,
		["OutIn"] = v2.OutInAcceleration
	},
	["SoftSpring"] = {
		["In"] = v2.InSoftSpring,
		["Out"] = v2.OutSoftSpring,
		["InOut"] = v2.InOutSoftSpring,
		["OutIn"] = v2.OutInSoftSpring
	},
	["ExitExpressive"] = {
		["In"] = v2.InExitExpressive,
		["Out"] = v2.OutExitExpressive,
		["InOut"] = v2.InOutExitExpressive,
		["OutIn"] = v2.OutInExitExpressive
	},
	["Sharp"] = {
		["In"] = v2.InSharp,
		["Out"] = v2.OutSharp,
		["InOut"] = v2.InOutSharp,
		["OutIn"] = v2.OutInSharp
	}
}
function v4.Create(_, p_u_7, p8)
	-- upvalues: (copy) v_u_5, (copy) v_u_1, (copy) v_u_6, (copy) v_u_3
	if not p_u_7 or typeof(p_u_7) ~= "Instance" then
		return warn("Invalid object to tween:", p_u_7)
	end
	local v_u_9 = type(p8) == "table" and (p8 or {}) or {}
	local v_u_10 = v_u_5[v_u_9.StepType] and v_u_1[v_u_9.StepType] or v_u_1.Stepped
	local v_u_11 = v_u_6[v_u_9.EasingStyle or "Quad"][v_u_9.EasingDirection or "In"]
	local v12 = v_u_9.Time
	local v13 = type(v12) == "number" and (v_u_9.Time or 1) or 1
	local v_u_14 = math.max(v13, 0.001)
	local v15 = v_u_9.Goal
	local v16 = type(v15) == "table" and (v_u_9.Goal or {}) or {}
	local v17 = v_u_9.DelayTime
	local v_u_18
	if type(v17) == "number" and v_u_9.DelayTime > 0.027 then
		v_u_18 = v_u_9.DelayTime
	else
		v_u_18 = false
	end
	local v19 = v_u_9.RepeatCount
	local v20
	if type(v19) == "number" then
		local v21 = v_u_9.RepeatCount
		v20 = math.max(v21, -1) or 0
	else
		v20 = 0
	end
	local v_u_22 = v20 + 1
	local v_u_23 = {}
	for v24, v25 in pairs(v16) do
		v_u_23[v24] = v_u_3[typeof(v25)](p_u_7[v24], v25)
	end
	local v_u_26 = Instance.new("BindableEvent")
	local v_u_27 = Instance.new("BindableEvent")
	local v_u_28 = Instance.new("BindableEvent")
	local v_u_29 = nil
	local v_u_30 = os.clock()
	local v_u_31 = 0
	local v_u_32 = {
		["Instance"] = p_u_7,
		["PlaybackState"] = Enum.PlaybackState.Begin,
		["Completed"] = v_u_26.Event,
		["Resumed"] = v_u_28.Event,
		["Stopped"] = v_u_27.Event,
		["Destroy"] = function()
			-- upvalues: (ref) v_u_29, (copy) v_u_26, (copy) v_u_27, (copy) v_u_28, (ref) v_u_32
			if v_u_29 then
				v_u_29:Disconnect()
				v_u_29 = nil
			end
			v_u_26:Destroy()
			v_u_27:Destroy()
			v_u_28:Destroy()
			v_u_32 = {}
		end
	}
	local v_u_33 = false
	local v_u_34 = 0
	local function v_u_46(p35, p_u_36)
		-- upvalues: (ref) v_u_29, (copy) v_u_22, (ref) v_u_32, (copy) v_u_26, (ref) v_u_33, (ref) v_u_34, (copy) v_u_18, (ref) v_u_30, (ref) v_u_31, (copy) v_u_10, (copy) v_u_14, (copy) v_u_23, (copy) p_u_7, (copy) v_u_46, (ref) v_u_9, (copy) v_u_11
		if v_u_29 then
			v_u_29:Disconnect()
			v_u_29 = nil
		end
		local v_u_37 = p35 or 1
		if v_u_22 == 0 or v_u_22 >= v_u_37 then
			v_u_34 = v_u_37
			if p_u_36 then
				v_u_33 = true
			end
			if v_u_18 then
				v_u_32.PlaybackState = Enum.PlaybackState.Delayed
				task.wait(v_u_18)
			end
			v_u_30 = os.clock() - v_u_31
			v_u_29 = v_u_10:Connect(function()
				-- upvalues: (ref) v_u_31, (ref) v_u_30, (ref) v_u_14, (copy) p_u_36, (ref) v_u_23, (ref) p_u_7, (ref) v_u_29, (ref) v_u_46, (ref) v_u_37, (ref) v_u_9, (ref) v_u_11
				v_u_31 = os.clock() - v_u_30
				if v_u_14 <= v_u_31 then
					if p_u_36 then
						for v38, v39 in pairs(v_u_23) do
							p_u_7[v38] = v39(0)
						end
					else
						for v40, v41 in pairs(v_u_23) do
							p_u_7[v40] = v41(1)
						end
					end
					v_u_29:Disconnect()
					v_u_29 = nil
					if p_u_36 then
						v_u_31 = 0
						v_u_46(v_u_37 + 1, false)
						return
					elseif v_u_9.Reverses then
						v_u_31 = 0
						v_u_46(v_u_37, true)
					else
						v_u_31 = 0
						v_u_46(v_u_37 + 1, false)
					end
				else
					local v42 = v_u_11(p_u_36 and 1 - v_u_31 / v_u_14 or v_u_31 / v_u_14)
					local v43 = math.clamp(v42, 0, 1)
					for v44, v45 in pairs(v_u_23) do
						p_u_7[v44] = v45(v43)
					end
					return
				end
			end)
			v_u_32.PlaybackState = Enum.PlaybackState.Playing
		else
			v_u_32.PlaybackState = Enum.PlaybackState.Completed
			v_u_26:Fire()
			v_u_33 = false
			v_u_34 = 1
		end
	end
	function v_u_32.Play()
		-- upvalues: (ref) v_u_31, (copy) v_u_46
		v_u_31 = 0
		v_u_46(1, false)
	end
	function v_u_32.Stop()
		-- upvalues: (ref) v_u_29, (ref) v_u_32, (copy) v_u_27
		if v_u_29 then
			v_u_29:Disconnect()
			v_u_29 = nil
			v_u_32.PlaybackState = Enum.PlaybackState.Cancelled
			v_u_27:Fire()
		end
	end
	function v_u_32.Resume()
		-- upvalues: (copy) v_u_46, (ref) v_u_34, (ref) v_u_33, (copy) v_u_28
		v_u_46(v_u_34, v_u_33)
		v_u_28:Fire()
	end
	return v_u_32
end
return v4