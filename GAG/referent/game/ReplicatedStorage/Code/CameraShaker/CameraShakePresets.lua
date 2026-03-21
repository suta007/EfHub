local v_u_1 = require(script.Parent.CameraShakeInstance)
local v_u_15 = {
	["Bump"] = function()
		-- upvalues: (copy) v_u_1
		local v2 = v_u_1.new(2.5, 4, 0.1, 0.75)
		v2.PositionInfluence = Vector3.new(0.15, 0.15, 0.15)
		v2.RotationInfluence = Vector3.new(1, 1, 1)
		return v2
	end,
	["Damage"] = function()
		-- upvalues: (copy) v_u_1
		local v3 = v_u_1.new(1.5, 4, 0.1, 0.75)
		v3.PositionInfluence = Vector3.new(0.15, 0.15, 0.15)
		v3.RotationInfluence = Vector3.new(1, 1, 1)
		return v3
	end,
	["Explosion"] = function()
		-- upvalues: (copy) v_u_1
		local v4 = v_u_1.new(5, 10, 0, 1.5)
		v4.PositionInfluence = Vector3.new(0.25, 0.25, 0.25)
		v4.RotationInfluence = Vector3.new(4, 1, 1)
		return v4
	end,
	["BigExplosion"] = function()
		-- upvalues: (copy) v_u_1
		local v5 = v_u_1.new(10, 15, 0, 1.5)
		v5.PositionInfluence = Vector3.new(0.5, 0.5, 0.5)
		v5.RotationInfluence = Vector3.new(4, 1, 1)
		return v5
	end,
	["AbruptExplosion"] = function()
		-- upvalues: (copy) v_u_1
		local v6 = v_u_1.new(5, 10, 0, 1.5)
		v6.PositionInfluence = Vector3.new(2, 0.5, 2)
		v6.RotationInfluence = Vector3.new(4, 1, 1)
		return v6
	end,
	["SmallExplosion"] = function()
		-- upvalues: (copy) v_u_1
		local v7 = v_u_1.new(5, 10, 0, 0.75)
		v7.PositionInfluence = Vector3.new(2, 0.5, 2)
		v7.RotationInfluence = Vector3.new(4, 1, 1)
		return v7
	end,
	["VerySmallExplosion"] = function()
		-- upvalues: (copy) v_u_1
		local v8 = v_u_1.new(2, 10, 0, 0.75)
		v8.PositionInfluence = Vector3.new(2, 0.5, 2)
		v8.RotationInfluence = Vector3.new(4, 1, 1)
		return v8
	end,
	["Earthquake"] = function()
		-- upvalues: (copy) v_u_1
		local v9 = v_u_1.new(0.6, 3.5, 2, 10)
		v9.PositionInfluence = Vector3.new(0.25, 0.25, 0.25)
		v9.RotationInfluence = Vector3.new(1, 1, 4)
		return v9
	end,
	["WeakEarthquake"] = function()
		-- upvalues: (copy) v_u_1
		local v10 = v_u_1.new(0.6, 3.5, 2, 10)
		v10.PositionInfluence = Vector3.new(0.05, 0.05, 0.05)
		v10.RotationInfluence = Vector3.new(0.25, 0.25, 1)
		return v10
	end,
	["BadTrip"] = function()
		-- upvalues: (copy) v_u_1
		local v11 = v_u_1.new(10, 0.15, 5, 10)
		v11.PositionInfluence = Vector3.new(0, 0, 0.15)
		v11.RotationInfluence = Vector3.new(2, 1, 4)
		return v11
	end,
	["HandheldCamera"] = function()
		-- upvalues: (copy) v_u_1
		local v12 = v_u_1.new(1, 0.25, 2, 10)
		v12.PositionInfluence = Vector3.new(0.01, 0.01, 0.01)
		v12.RotationInfluence = Vector3.new(0, 0, 0)
		return v12
	end,
	["Vibration"] = function()
		-- upvalues: (copy) v_u_1
		local v13 = v_u_1.new(0.4, 20, 2, 2)
		v13.PositionInfluence = Vector3.new(0.15, 0.15, 0.15)
		v13.RotationInfluence = Vector3.new(1.25, 0, 4)
		return v13
	end,
	["RoughDriving"] = function()
		-- upvalues: (copy) v_u_1
		local v14 = v_u_1.new(1, 2, 1, 1)
		v14.PositionInfluence = Vector3.new(0, 0, 0)
		v14.RotationInfluence = Vector3.new(1, 1, 1)
		return v14
	end
}
return setmetatable({}, {
	["__index"] = function(_, p16)
		-- upvalues: (copy) v_u_15
		local v17 = v_u_15[p16]
		if type(v17) == "function" then
			return v17()
		end
		error("No preset found with index \"" .. p16 .. "\"")
	end
})