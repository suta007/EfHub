local v_u_19 = {
	["ToggleBeams"] = function(_, p1, p2)
		if p1 then
			if typeof(p1) == "Instance" then
				p1 = p1:GetDescendants()
			end
			for _, v3 in p1 do
				if v3:IsA("Beam") then
					v3.Enabled = p2
				end
			end
		else
			warn("ParticleHelper:ToggleBeams | no beams provided")
		end
	end,
	["ToggleTrails"] = function(_, p4, p5)
		if p4 then
			if typeof(p4) == "Instance" then
				p4 = p4:GetDescendants()
			end
			for _, v6 in p4 do
				if v6:IsA("Trail") then
					v6.Enabled = p5
				end
			end
		else
			warn("ParticleHelper:ToggleTrails | no trails provided")
		end
	end,
	["ToggleParticles"] = function(_, p7, p8)
		if p7 then
			if typeof(p7) == "Instance" then
				p7 = p7:GetDescendants()
			end
			for _, v9 in p7 do
				if v9:IsA("ParticleEmitter") then
					v9.Enabled = p8
				end
			end
		else
			warn("ParticleHelper:ToggleParticles | no particles provided")
		end
	end,
	["EmitParticles"] = function(_, p10, p_u_11)
		if p10 then
			if typeof(p10) == "Instance" then
				p10 = p10:GetDescendants()
			end
			for _, v_u_12 in p10 do
				if v_u_12:IsA("ParticleEmitter") then
					task.delay(v_u_12:GetAttribute("EmitDelay") or 0, function()
						-- upvalues: (copy) v_u_12, (copy) p_u_11
						v_u_12:Emit(p_u_11 or (v_u_12:GetAttribute("EmitCount") or 0))
					end)
				end
			end
		else
			warn("ParticleHelper:EmitParticles | no particles provided")
		end
	end,
	["EmitTempParticles"] = function(_, p13, p14)
		-- upvalues: (copy) v_u_19
		if not p13 then
			warn("ParticleHelper:EmitTempParticles | no particle parent provided")
			return nil
		end
		local v_u_15 = p13:Clone()
		v_u_15.Parent = workspace:FindFirstChild("Visuals") or workspace
		v_u_15.CFrame = p13.WorldCFrame
		v_u_19:EmitParticles(v_u_15, p14)
		local v16 = 0
		for _, v17 in v_u_15:GetDescendants() do
			if v17:IsA("ParticleEmitter") then
				local v18 = v17:GetAttribute("Lifetime") or v17.Lifetime.Max
				if v16 < v18 then
					v16 = v18
				end
			end
		end
		task.delay(v16, function()
			-- upvalues: (copy) v_u_15
			v_u_15:Destroy()
		end)
		return v_u_15
	end
}
return v_u_19