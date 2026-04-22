local function v_u_3(p1)
	if not p1 then
		return warn("vfx part not found")
	end
	for _, v2 in p1:GetDescendants() do
		if v2:IsA("ParticleEmitter") then
			v2:Emit(v2:GetAttribute("EmitCount") or 1)
		end
	end
end
local function v_u_7(p4, p5)
	if p4 then
		if p4:IsA("ParticleEmitter") then
			p4.Enabled = p5
		else
			for _, v6 in p4:GetDescendants() do
				if v6:IsA("ParticleEmitter") then
					v6.Enabled = p5
				end
			end
		end
	else
		return
	end
end
local function v_u_11(p8, p9)
	if p8 then
		for _, v10 in p8:GetDescendants() do
			if v10:IsA("ParticleEmitter") then
				v10.TimeScale = p9
			end
		end
	end
end
return function(p12)
	-- upvalues: (copy) v_u_3, (copy) v_u_7, (copy) v_u_11
	local v13 = p12:FindFirstChild("Rigs")
	local v_u_14 = p12:FindFirstChild("VFX")
	if v13 and v_u_14 then
		local v_u_15 = v13:FindFirstChild("Bunny")
		local v_u_16 = v13:FindFirstChild("EasterEgg")
		local v_u_17 = v13:FindFirstChild("EasterCarrot")
		local v_u_18 = v13:FindFirstChild("FlyTrap")
		local v_u_19 = v13:FindFirstChild("Jandel")
		local function v22()
			-- upvalues: (ref) v_u_3, (copy) v_u_15
			local v20 = v_u_3
			local v21 = v_u_15
			if v21 then
				v21 = v_u_15:FindFirstChild("EmitFirst")
			end
			v20(v21)
		end
		task.delay(3.3333333333333335, v22)
		local function v23()
			-- upvalues: (ref) v_u_3, (copy) v_u_14
			v_u_3(v_u_14:FindFirstChild("Wind1"))
		end
		task.delay(7.683333333333334, v23)
		local function v24()
			-- upvalues: (ref) v_u_3, (copy) v_u_14
			v_u_3(v_u_14:FindFirstChild("Wind2"))
		end
		task.delay(9.166666666666666, v24)
		local function v26()
			-- upvalues: (copy) v_u_16, (ref) v_u_7
			local v25 = v_u_16 and v_u_16:FindFirstChild("Part_8")
			if v25 then
				v25 = v_u_16.Part_8:FindFirstChild("Trail")
			end
			if v25 then
				v25 = v25:FindFirstChild("Enable")
			end
			v_u_7(v25, true)
		end
		task.delay(11.833333333333334, v26)
		local function v28()
			-- upvalues: (copy) v_u_16, (ref) v_u_7
			local v27 = v_u_16 and v_u_16:FindFirstChild("Part_8")
			if v27 then
				v27 = v_u_16.Part_8:FindFirstChild("Trail")
			end
			if v27 then
				v27 = v27:FindFirstChild("Enable")
			end
			v_u_7(v27, false)
		end
		task.delay(18.133333333333333, v28)
		local function v31()
			-- upvalues: (ref) v_u_3, (copy) v_u_15
			local v29 = v_u_3
			local v30 = v_u_15
			if v30 then
				v30 = v_u_15:FindFirstChild("Question")
			end
			v29(v30)
		end
		task.delay(18.65, v31)
		local function v34()
			-- upvalues: (copy) v_u_17, (ref) v_u_3
			local v32 = v_u_17
			if v32 then
				v32 = v_u_17:FindFirstChild("Part_3")
			end
			local v33 = v_u_3
			if v32 then
				v32 = v32:FindFirstChild("Glow")
			end
			v33(v32)
		end
		task.delay(18.866666666666667, v34)
		local function v37()
			-- upvalues: (copy) v_u_16, (ref) v_u_7
			local v35 = v_u_16
			if v35 then
				v35 = v_u_16:FindFirstChild("Part_8")
			end
			local v36 = v_u_7
			if v35 then
				v35 = v35:FindFirstChild("RollingDust")
			end
			v36(v35, true)
		end
		task.delay(20.666666666666668, v37)
		local function v42()
			-- upvalues: (copy) v_u_16, (ref) v_u_7, (ref) v_u_3
			local v38 = v_u_16
			if v38 then
				v38 = v_u_16:FindFirstChild("Part_8")
			end
			local v39 = v_u_7
			local v40
			if v38 then
				v40 = v38:FindFirstChild("RollingDust")
			else
				v40 = v38
			end
			v39(v40, false)
			local v41 = v_u_3
			if v38 then
				v38 = v38:FindFirstChild("FinishDust")
			end
			v41(v38)
		end
		task.delay(27.416666666666668, v42)
		local function v44()
			-- upvalues: (copy) v_u_18, (ref) v_u_3
			local v43 = v_u_18
			if v43 then
				v43 = v_u_18:FindFirstChild("Base")
			end
			if v43 then
				v_u_3(v43:FindFirstChild("Breath1"))
				v_u_3(v43:FindFirstChild("Question1"))
				v_u_3(v43:FindFirstChild("Question2"))
				v_u_3(v43:FindFirstChild("Question3"))
				v_u_3(v43:FindFirstChild("Question4"))
			end
		end
		task.delay(29.433333333333334, v44)
		local function v45()
			-- upvalues: (ref) v_u_7, (copy) v_u_18
			v_u_7(v_u_18, true)
		end
		task.delay(30.166666666666668, v45)
		local function v48()
			-- upvalues: (copy) v_u_17, (ref) v_u_7
			local v46 = v_u_17
			if v46 then
				v46 = v_u_17:FindFirstChild("Part_2")
			end
			local v47 = v_u_7
			if v46 then
				v46 = v46:FindFirstChild("EatingCarrot")
			end
			v47(v46, true)
		end
		task.delay(39.016666666666666, v48)
		local function v49()
			-- upvalues: (ref) v_u_3, (copy) v_u_14
			v_u_3(v_u_14:FindFirstChild("Exclamation"))
			v_u_3(v_u_14:FindFirstChild("Exclamation1"))
			v_u_3(v_u_14:FindFirstChild("Exclamation2"))
			v_u_3(v_u_14:FindFirstChild("Exclamation3"))
		end
		task.delay(42.05, v49)
		local function v52()
			-- upvalues: (copy) v_u_17, (ref) v_u_7, (copy) v_u_14
			local v50 = v_u_17
			if v50 then
				v50 = v_u_17:FindFirstChild("Part_2")
			end
			local v51 = v_u_7
			if v50 then
				v50 = v50:FindFirstChild("EatingCarrot")
			end
			v51(v50, false)
			v_u_7(v_u_14:FindFirstChild("ScreenFx"), true)
		end
		task.delay(42.13333333333333, v52)
		local function v53()
			-- upvalues: (ref) v_u_7, (copy) v_u_14
			v_u_7(v_u_14:FindFirstChild("ScreenFx"), false)
		end
		task.delay(43.8, v53)
		local function v54()
			-- upvalues: (ref) v_u_3, (copy) v_u_14
			v_u_3(v_u_14:FindFirstChild("Dash"))
		end
		task.delay(45.05, v54)
		local function v56()
			-- upvalues: (copy) v_u_16, (ref) v_u_7, (ref) v_u_11, (copy) v_u_18
			local v55 = v_u_16 and v_u_16:FindFirstChild("Part_8")
			if v55 then
				v55 = v_u_16.Part_8:FindFirstChild("Trail")
			end
			if v55 then
				v55 = v55:FindFirstChild("VFX")
			end
			v_u_7(v55, false)
			v_u_11(v_u_18, 0.2)
			v_u_11(v55, 0.2)
		end
		task.delay(45.166666666666664, v56)
		local function v58()
			-- upvalues: (copy) v_u_16, (ref) v_u_7
			local v57 = v_u_16 and v_u_16:FindFirstChild("Part_8")
			if v57 then
				v57 = v_u_16.Part_8:FindFirstChild("Trail")
			end
			if v57 then
				v57 = v57:FindFirstChild("VFX")
			end
			v_u_7(v57, true)
		end
		task.delay(45.86666666666667, v58)
		local function v60()
			-- upvalues: (copy) v_u_16, (ref) v_u_11, (copy) v_u_18
			local v59 = v_u_16 and v_u_16:FindFirstChild("Part_8")
			if v59 then
				v59 = v_u_16.Part_8:FindFirstChild("Trail")
			end
			if v59 then
				v59 = v59:FindFirstChild("VFX")
			end
			v_u_11(v_u_18, 1)
			v_u_11(v59, 1)
		end
		task.delay(50.833333333333336, v60)
		local function v61()
			-- upvalues: (ref) v_u_7, (copy) v_u_18
			v_u_7(v_u_18, false)
		end
		task.delay(51.31666666666667, v61)
		local function v64()
			-- upvalues: (copy) v_u_18, (ref) v_u_3
			local v62 = v_u_18
			if v62 then
				v62 = v_u_18:FindFirstChild("Base")
			end
			local v63 = v_u_3
			if v62 then
				v62 = v62:FindFirstChild("Bite")
			end
			v63(v62)
		end
		task.delay(51.483333333333334, v64)
		local function v67()
			-- upvalues: (copy) v_u_19, (ref) v_u_3
			local v65 = v_u_19
			if v65 then
				v65 = v_u_19:FindFirstChild("Torso")
			end
			local v66 = v_u_3
			if v65 then
				v65 = v65:FindFirstChild("Aura")
			end
			v66(v65)
		end
		task.delay(53.55, v67)
		local function v68()
			-- upvalues: (ref) v_u_3, (copy) v_u_14
			v_u_3(v_u_14:FindFirstChild("LinesLast"))
		end
		task.delay(55.916666666666664, v68)
		local function v71()
			-- upvalues: (copy) v_u_19, (ref) v_u_3
			local v69 = v_u_19
			if v69 then
				v69 = v_u_19:FindFirstChild("Torso")
			end
			local v70 = v_u_3
			if v69 then
				v69 = v69:FindFirstChild("Emit")
			end
			v70(v69)
		end
		task.delay(58.43333333333333, v71)
		local function v74()
			-- upvalues: (copy) v_u_19, (ref) v_u_3
			local v72 = v_u_19
			if v72 then
				v72 = v_u_19:FindFirstChild("Torso")
			end
			local v73 = v_u_3
			if v72 then
				v72 = v72:FindFirstChild("Aura1")
			end
			v73(v72)
		end
		task.delay(61.266666666666666, v74)
	end
end