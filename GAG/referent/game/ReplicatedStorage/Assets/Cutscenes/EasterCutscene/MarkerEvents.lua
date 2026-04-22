local v_u_1 = require(script.Parent.VFXTimings)
local v_u_2 = nil
local v_u_3 = nil
local v_u_4 = false
local v_u_5 = 0.4
local v_u_6 = false
return {
	["_OnStart"] = function(_, p7)
		-- upvalues: (ref) v_u_2, (copy) v_u_1, (ref) v_u_3
		v_u_2 = Instance.new("ColorCorrectionEffect")
		v_u_2.Parent = game.Lighting
		v_u_2.Brightness = -2
		game.Debris:AddItem(v_u_2, 90)
		game.TweenService:Create(v_u_2, TweenInfo.new(1), {
			["Brightness"] = 0
		}):Play()
		v_u_1(p7)
		local v8 = p7:WaitForChild("SFX"):FindFirstChild("Sound")
		if v8 and v8:IsA("Sound") then
			if v_u_3 then
				v_u_3:Destroy()
			end
			v_u_3 = v8:Clone()
			v_u_3.Parent = workspace
			v_u_3:Play()
			game.Debris:AddItem(v_u_3, 90)
		else
			warn("Sound not found in CutsceneFolder.SFX.Sound")
		end
	end,
	["StartBeeping"] = function(_, p_u_9)
		-- upvalues: (ref) v_u_4, (ref) v_u_5
		v_u_4 = true
		v_u_5 = 0.4
		task.spawn(function()
			-- upvalues: (ref) v_u_4, (copy) p_u_9, (ref) v_u_5
			while v_u_4 do
				if p_u_9:FindFirstChild("Rigs") and p_u_9.Rigs:FindFirstChild("Detector1") then
					p_u_9.Rigs.Detector1.Handle.Beep.Glow:Emit(1)
					p_u_9.Rigs.Detector1.Part11.Color = Color3.fromRGB(225, 0, 0)
					task.delay(v_u_5 / 4, function()
						-- upvalues: (ref) p_u_9
						p_u_9.Rigs.Detector1.Part11.Color = Color3.fromRGB(202, 203, 209)
					end)
				end
				task.wait(v_u_5)
			end
		end)
	end,
	["BeepFaster"] = function()
		-- upvalues: (ref) v_u_5
		v_u_5 = 0.2
	end,
	["StartDigging"] = function(_, p10)
		-- upvalues: (ref) v_u_4
		v_u_4 = false
		if p10:FindFirstChild("VFX") and p10.VFX:FindFirstChild("DigStart") then
			for _, v11 in p10.VFX.DigStart:GetChildren() do
				v11:Emit(v11:GetAttribute("EmitCount"))
			end
		end
	end,
	["Rummage"] = function(_, p12)
		if p12:FindFirstChild("VFX") and p12.VFX:FindFirstChild("Rummage") then
			for _, v13 in p12.VFX.Rummage:GetChildren() do
				v13.Enabled = true
			end
		end
	end,
	["Floor1"] = function(_, p14)
		if p14:FindFirstChild("VFX") and p14.VFX:FindFirstChild("Floor1") then
			for _, v15 in p14.VFX.Floor1:GetChildren() do
				v15:Emit(v15:GetAttribute("EmitCount"))
			end
		end
	end,
	["Floor2"] = function(_, p16)
		if p16:FindFirstChild("VFX") and p16.VFX:FindFirstChild("Floor2") then
			for _, v17 in p16.VFX.Floor2:GetChildren() do
				v17:Emit(v17:GetAttribute("EmitCount"))
			end
		end
	end,
	["StopRummage"] = function(_, p18)
		if p18:FindFirstChild("VFX") and p18.VFX:FindFirstChild("Rummage") then
			for _, v19 in p18.VFX.Rummage:GetChildren() do
				v19.Enabled = false
			end
		end
	end,
	["ShowRedDetect"] = function(_, p20)
		if p20:FindFirstChild("Rigs") and p20.Rigs:FindFirstChild("Detector2") then
			for _, v21 in p20.Rigs.Detector2:GetChildren() do
				if v21:IsA("BasePart") and v21.Name ~= "RootPart" then
					v21.Transparency = 0
				end
			end
		end
	end,
	["BeepOwl"] = function(_, p_u_22)
		-- upvalues: (ref) v_u_5, (ref) v_u_6
		v_u_5 = 0.4
		v_u_6 = true
		if p_u_22:FindFirstChild("Rigs") and p_u_22.Rigs:FindFirstChild("Detector2") then
			p_u_22.Rigs.Detector2.Handle.Detect.Ground.Enabled = true
			task.spawn(function()
				-- upvalues: (ref) v_u_6, (copy) p_u_22, (ref) v_u_5
				while v_u_6 do
					p_u_22.Rigs.Detector2.Handle.Beep.Glow:Emit(1)
					p_u_22.Rigs.Detector2.Part11.Color = Color3.fromRGB(225, 0, 0)
					task.delay(v_u_5 / 4, function()
						-- upvalues: (ref) p_u_22
						p_u_22.Rigs.Detector2.Part11.Color = Color3.fromRGB(202, 203, 209)
					end)
					task.wait(v_u_5)
				end
			end)
		end
	end,
	["BeepOwlFast"] = function()
		-- upvalues: (ref) v_u_5
		v_u_5 = 0.2
	end,
	["StopBeepOwl"] = function()
		-- upvalues: (ref) v_u_6
		v_u_6 = false
	end,
	["OwlHit"] = function(_, p23)
		if p23:FindFirstChild("VFX") and p23.VFX:FindFirstChild("HitHead") then
			for _, v24 in p23.VFX.HitHead:GetDescendants() do
				if v24:IsA("ParticleEmitter") then
					v24:Emit(v24:GetAttribute("EmitCount"))
				end
			end
		end
	end,
	["DinoAppear"] = function(_, p25)
		if p25:FindFirstChild("VFX") and p25.VFX:FindFirstChild("HitHead") then
			for _, v_u_26 in p25.VFX.HitHead:GetChildren() do
				if v_u_26:IsA("ParticleEmitter") then
					v_u_26.Enabled = true
					task.delay(0.4, function()
						-- upvalues: (copy) v_u_26
						v_u_26.Enabled = false
					end)
				end
			end
		end
		if p25:FindFirstChild("Rigs") then
			local v27 = p25.Rigs:FindFirstChild("Triceratops")
			if v27 and v27:FindFirstChild("Part26") then
				v27.Part26.Tears.Enabled = true
			end
		end
	end,
	["FadeQuick"] = function(_, p_u_28)
		-- upvalues: (ref) v_u_2
		game.TweenService:Create(v_u_2, TweenInfo.new(1), {
			["Brightness"] = -2
		}):Play()
		task.delay(1.5, function()
			-- upvalues: (copy) p_u_28, (ref) v_u_2
			if p_u_28:FindFirstChild("Rigs") then
				local v29 = p_u_28.Rigs:FindFirstChild("Triceratops")
				if v29 and v29:FindFirstChild("Part26") then
					v29.Part26.Tears.Enabled = false
				end
			end
			game.TweenService:Create(v_u_2, TweenInfo.new(1), {
				["Brightness"] = 0
			}):Play()
		end)
	end,
	["FadeToBlack"] = function()
		-- upvalues: (ref) v_u_2
		game.TweenService:Create(v_u_2, TweenInfo.new(1), {
			["Brightness"] = -2
		}):Play()
		task.delay(2, function()
			-- upvalues: (ref) v_u_2
			game.TweenService:Create(v_u_2, TweenInfo.new(1), {
				["Brightness"] = 0
			}):Play()
			if v_u_2 then
				v_u_2:Destroy()
			end
		end)
	end,
	["_OnEnd"] = function()
		-- upvalues: (ref) v_u_3
		if v_u_3 then
			game.TweenService:Create(v_u_3, TweenInfo.new(2), {
				["Volume"] = 0
			}):Play()
			task.delay(2, function()
				-- upvalues: (ref) v_u_3
				if v_u_3 then
					v_u_3:Destroy()
				end
			end)
		end
	end
}