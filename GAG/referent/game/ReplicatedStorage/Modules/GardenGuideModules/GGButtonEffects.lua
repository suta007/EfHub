local v1 = game:GetService("SoundService")
local v_u_2 = v1.Click
local v_u_3 = v1.Hover
return {
	["Click"] = function()
		-- upvalues: (copy) v_u_2
		v_u_2.PlaybackSpeed = 1 + math.random(-15, 15) / 100
		v_u_2:Play()
	end,
	["AddHoverEffect"] = function(p_u_4)
		-- upvalues: (copy) v_u_3
		p_u_4.MouseEnter:Connect(function()
			-- upvalues: (ref) v_u_3, (copy) p_u_4
			v_u_3.PlaybackSpeed = 1 + math.random(-15, 15) / 100
			v_u_3:Play()
			p_u_4.BackgroundTransparency = 0.8
		end)
		p_u_4.MouseLeave:Connect(function()
			-- upvalues: (copy) p_u_4
			p_u_4.BackgroundTransparency = 1
		end)
	end
}