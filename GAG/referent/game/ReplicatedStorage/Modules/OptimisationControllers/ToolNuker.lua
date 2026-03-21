local v1 = game:GetService("ReplicatedStorage")
local v_u_2 = game:GetService("UserInputService")
local _ = game:GetService("Players").LocalPlayer
require(v1.Modules.PlatformProvider)
require(v1.Modules.GetFarmAsync)
require(v1.Modules.userprint)
local v3 = require(v1.Modules.MutationHandler)
require(v1.Modules.IsDev)
require(v1.Modules.Trove)
require(v1.Modules.OptimisationControllers.IsBadDeviceHeuristic)
require(v1.Data.EnumRegistry.InventoryServiceEnums)
v3:GetMutations()
task.spawn(function()
	-- upvalues: (copy) v_u_2
	v_u_2.InputBegan:Wait()
	task.wait(5)
end)
return {}