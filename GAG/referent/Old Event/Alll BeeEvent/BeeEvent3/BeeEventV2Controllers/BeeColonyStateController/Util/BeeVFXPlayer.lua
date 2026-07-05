local v1 = game:GetService("ReplicatedStorage")
local v_u_2 = require(v1.Modules.Utility.ParticleHelper)
return {
	["PlayBeeVFX"] = function(_, p3) -- name: PlayBeeVFX
		-- upvalues: (copy) v_u_2
		v_u_2:EmitParticles(p3)
	end
}