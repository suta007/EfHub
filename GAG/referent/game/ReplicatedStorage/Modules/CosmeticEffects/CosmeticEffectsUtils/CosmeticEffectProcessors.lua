return {
	["LightEffectPart"] = function(p1)
		return {
			["Part"] = p1,
			["OnColor"] = p1.Color,
			["OnMaterial"] = p1.Material,
			["OnTransparency"] = p1.Transparency,
			["OnReflectance"] = p1.Reflectance,
			["OffColor"] = Color3.fromRGB(12, 11, 7),
			["OffMaterial"] = Enum.Material.SmoothPlastic,
			["OffTransparency"] = 0.25,
			["OffReflectance"] = 0.25
		}
	end,
	["LightEffectParticles"] = function(p2)
		return {
			["Emitter"] = p2,
			["OnLightEmission"] = p2.LightEmission,
			["OffLightEmission"] = 0
		}
	end,
	["LightEffectSource"] = function(p3)
		return {
			["Light"] = p3,
			["OnColor"] = p3.Color,
			["OffColor"] = p3.Color
		}
	end,
	["ParticleEffectAttachment"] = function(p4)
		return p4
	end,
	["SwingEffectModel"] = function(p5)
		return p5
	end,
	["CustomEffectImagePart"] = function(p6)
		return {
			["ImgPart"] = p6,
			["Decal"] = p6.Decal,
			["SurfaceGui"] = p6.SurfaceGui,
			["SurfaceLight"] = p6.SurfaceLight
		}
	end
}