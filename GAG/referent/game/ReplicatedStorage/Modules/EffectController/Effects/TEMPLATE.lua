local v1 = game:GetService("ReplicatedStorage")
require(v1.Modules.EffectController.Types)
return {
	["PlayTestEffect"] = function(_) end,
	["Cancel"] = function(p2)
		p2.Container:Clean()
		p2.Cache = {}
	end
}