local v1 = game:GetService("CorePackages")
local v2 = require(v1.Packages.Dev.JestGlobals)
local v3 = v2.describe
local v_u_4 = v2.expect
local v_u_5 = v2.it
local v_u_6 = require(v1.Workspace.Packages.AppCommonLib).Signal
local v_u_7 = require(script.Parent.ConnectionUtil)
v3("ConnectionUtil", function()
	-- upvalues: (copy) v_u_5, (copy) v_u_7, (copy) v_u_4, (copy) v_u_6
	v_u_5("should instantiate", function()
		-- upvalues: (ref) v_u_7, (ref) v_u_4
		v_u_4((v_u_7.new())).never.toBeNil()
	end)
	v_u_5("should track a connection", function()
		-- upvalues: (ref) v_u_7, (ref) v_u_6, (ref) v_u_4
		local v8 = v_u_7.new()
		local v9 = v_u_6.new()
		local v_u_10 = ""
		v8:trackConnection("Signal", v9:Connect(function(p11)
			-- upvalues: (ref) v_u_10
			v_u_10 = p11
		end))
		v9:fire("Testing")
		v_u_4(v_u_10).toBe("Testing")
	end)
	v_u_5("should disconnect from signal", function()
		-- upvalues: (ref) v_u_7, (ref) v_u_6, (ref) v_u_4
		local v12 = v_u_7.new()
		local v13 = v_u_6.new()
		local v_u_14 = ""
		v12:trackConnection("Signal", v13:Connect(function(p15)
			-- upvalues: (ref) v_u_14
			v_u_14 = p15
		end))
		v12:disconnect("Signal")
		v13:fire("Testing")
		v_u_4(v_u_14).toBe("")
	end)
	v_u_5("should disconnect from all", function()
		-- upvalues: (ref) v_u_7, (ref) v_u_6, (ref) v_u_4
		local v16 = v_u_7.new()
		local v17 = v_u_6.new()
		local v18 = v_u_6.new()
		local v19 = v_u_6.new()
		local v_u_20 = ""
		local v_u_21 = ""
		local v_u_22 = ""
		v16:trackConnection("Signal", v17:Connect(function(p23)
			-- upvalues: (ref) v_u_20
			v_u_20 = p23
		end))
		v16:trackConnection("Signal1", v18:Connect(function(p24)
			-- upvalues: (ref) v_u_21
			v_u_21 = p24
		end))
		v16:trackConnection("Signal2", v19:Connect(function(p25)
			-- upvalues: (ref) v_u_22
			v_u_22 = p25
		end))
		v16:disconnectAll()
		v17:fire("TestingPrimary")
		v17:fire("TestingSecondary")
		v17:fire("TestingTertiary")
		v_u_4(v_u_20).toBe("")
		v_u_4(v_u_21).toBe("")
		v_u_4(v_u_22).toBe("")
	end)
	v_u_5("should call manual disconnect", function()
		-- upvalues: (ref) v_u_7, (ref) v_u_4
		local v26 = v_u_7.new()
		local v_u_27 = ""
		v26:trackBoundFunction("Manual", function()
			-- upvalues: (ref) v_u_27
			v_u_27 = "Disconnected"
		end)
		v26:disconnect("Manual")
		v_u_4(v_u_27).toBe("Disconnected")
	end)
end)