local v1 = {
	["DreadhornCrush"] = {
		["Name"] = "DreadhornCrush",
		["Trigger"] = "OnHit",
		["Cooldown"] = 5,
		["StunDuration"] = 4,
		["SlowDuration"] = 8,
		["SpeedMultiplier"] = 0.25
	},
	["AcidVenom"] = {
		["Name"] = "AcidVenom",
		["Trigger"] = "OnHit",
		["Cooldown"] = 3,
		["Duration"] = 7,
		["TickInterval"] = 1,
		["DamagePerTick"] = 1
	}
}
local v2 = {
	["Name"] = "WaspKingBoss",
	["Trigger"] = "Routine",
	["CastInterval"] = 5,
	["Abilities"] = nil,
	["Abilities"] = {
		["StunShockwave"] = {
			["Name"] = "StunShockwave",
			["Cooldown"] = 18,
			["Radius"] = 50,
			["Damage"] = 15,
			["StunDuration"] = 5
		},
		["PoisonStrikes"] = {
			["Name"] = "PoisonStrikes",
			["Cooldown"] = 10,
			["Radius"] = 50,
			["ProjectileCount"] = 6,
			["Duration"] = 10,
			["TickInterval"] = 1,
			["DamagePerTick"] = 2
		},
		["SummonWasps"] = {
			["Name"] = "SummonWasps",
			["Cooldown"] = 25,
			["MinCount"] = 3,
			["MaxCount"] = 5,
			["Duration"] = 15,
			["WaspName"] = "Wasp"
		}
	}
}
v1.WaspKingBoss = v2
return v1