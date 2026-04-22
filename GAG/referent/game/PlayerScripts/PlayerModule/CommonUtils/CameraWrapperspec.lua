local v1 = game:GetService("CorePackages")
local v2 = require(v1.Packages.Dev.JestGlobals)
local v3 = v2.describe
local v_u_4 = v2.expect
local v_u_5 = v2.it
local v_u_6 = require(v1.Workspace.Packages.TestUtils).DeferredLuaHelpers.waitForEvents
local v_u_7 = require(script.Parent.CameraWrapper)
v3("CameraWrapper", function()
	-- upvalues: (copy) v_u_5, (copy) v_u_7, (copy) v_u_4, (copy) v_u_6
	v_u_5("should instantiate", function()
		-- upvalues: (ref) v_u_7, (ref) v_u_4
		v_u_4((v_u_7.new())).never.toBeNil()
	end)
	v_u_5("should return updated camera", function()
		-- upvalues: (ref) v_u_7, (ref) v_u_4, (ref) v_u_6
		local v8 = v_u_7.new()
		v8:Enable()
		local v9 = Instance.new("Camera")
		v9.Parent = game.Workspace
		v_u_4(v8:getCamera()).toBe(game.Workspace.CurrentCamera)
		v_u_4(v8:getCamera()).never.toBe(v9)
		game.Workspace.CurrentCamera = v9
		v_u_6()
		v_u_4(v8:getCamera()).toBe(game.Workspace.CurrentCamera)
		v_u_4(v8:getCamera()).toBe(v9)
	end)
end)