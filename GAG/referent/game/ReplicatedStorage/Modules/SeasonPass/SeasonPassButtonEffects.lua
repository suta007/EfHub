local v1 = game:GetService("SoundService")
local v_u_2 = v1.Click
local v_u_3 = v1.Hover
return {
	["Click"] = function()
		-- upvalues: (copy) v_u_2
		v_u_2.PlaybackSpeed = 1 + math.random(-15, 15) / 100
		v_u_2:Play()
	end,
	["Hover"] = function()
		-- upvalues: (copy) v_u_3
		v_u_3.PlaybackSpeed = 1 + math.random(-15, 15) / 100
		v_u_3:Play()
	end
}