local v1 = {
	["MOVEMENT_CONFIG"] = {
		["Y_HEIGHT_CLAMP"] = NumberRange.new(-10, 100),
		["RAY_SIZE"] = NumberRange.new(-10, 100),
		["MOVEMENT_ROUNDING"] = 1,
		["MAX_RAY_DISTANCE"] = 1000,
		["NEAR_ZERO_EPSILON"] = 0.001
	},
	["ROTATION_CONFIG"] = {
		["ROTATION_ROUNDING_PIXEL"] = 25,
		["ROTATION_STEP_DEGREE"] = 15
	},
	["DEFAULT_PLACEMENT_CONFIG"] = {
		["CFRAME_OFFSET"] = CFrame.new(0, 0, -5)
	}
}
return v1