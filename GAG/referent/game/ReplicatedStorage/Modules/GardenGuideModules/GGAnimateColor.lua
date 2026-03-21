local v_u_1 = game:GetService("RunService")
return {
	["AnimateTranscendentColor"] = function(p_u_2)
		-- upvalues: (copy) v_u_1
		local v_u_3 = 0.75
		local v_u_4 = nil
		v_u_4 = v_u_1.Heartbeat:Connect(function(p5)
			-- upvalues: (copy) p_u_2, (ref) v_u_4, (ref) v_u_3
			if p_u_2:GetAttribute("Rarity") == "Transcendent" then
				v_u_3 = (v_u_3 + p5 * 0.05) % 1
				local v6 = tick() * 1.5
				local v7 = math.sin(v6) * 0.03 + 0.72
				local v8 = Color3.fromHSV(v7, 1, 1)
				if p_u_2:IsA("Frame") then
					p_u_2.BackgroundColor3 = v8
				end
				if p_u_2:IsA("TextLabel") then
					p_u_2.TextColor3 = v8
				end
				if p_u_2:IsA("ImageLabel") then
					p_u_2.ImageColor3 = v8
				end
			else
				v_u_4:Disconnect()
			end
		end)
		p_u_2.Destroying:Once(function()
			-- upvalues: (ref) v_u_4
			v_u_4:Disconnect()
		end)
	end,
	["AnimatePrismaticColor"] = function(p_u_9)
		-- upvalues: (copy) v_u_1
		local v_u_10 = nil
		v_u_10 = v_u_1.Heartbeat:Connect(function(_)
			-- upvalues: (copy) p_u_9, (ref) v_u_10
			if p_u_9:GetAttribute("Rarity") == "Prismatic" then
				local v11 = os.clock() * 0.1 % 1
				local v12 = Color3.fromHSV(v11, 1, 1)
				if p_u_9:IsA("Frame") then
					p_u_9.BackgroundColor3 = v12
				end
				if p_u_9:IsA("TextLabel") then
					p_u_9.TextColor3 = v12
				end
				if p_u_9:IsA("ImageLabel") then
					p_u_9.ImageColor3 = v12
				end
			else
				v_u_10:Disconnect()
			end
		end)
		p_u_9.Destroying:Once(function()
			-- upvalues: (ref) v_u_10
			v_u_10:Disconnect()
		end)
	end
}