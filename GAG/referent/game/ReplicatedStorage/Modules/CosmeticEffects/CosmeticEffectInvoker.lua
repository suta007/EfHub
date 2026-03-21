local v1 = game:GetService("ReplicatedStorage")
local v_u_2 = game:GetService("SoundService")
local v_u_3 = v1.GameEvents.CosmeticEffectEvents.PlayCosmeticFX
return {
	["PlayEffect"] = function(_, p4, p5)
		-- upvalues: (copy) v_u_3, (copy) v_u_2
		if v_u_3:InvokeServer(p4, p5) then
			if p5 == "LightSwitch" then
				local v6 = v_u_2.Click
				v6.Volume = 0.1
				v6.Playing = true
				v6.TimePosition = 0
			end
		end
	end
}