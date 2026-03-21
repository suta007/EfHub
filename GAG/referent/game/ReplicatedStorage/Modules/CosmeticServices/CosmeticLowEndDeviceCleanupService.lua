local v1 = game:GetService("ReplicatedStorage")
local v_u_2 = game:GetService("UserInputService")
local v_u_3 = game:GetService("Players").LocalPlayer
local v_u_4 = require(v1.Modules.OptimisationControllers.IsBadDeviceHeuristic)
local v_u_5 = require(v1.Modules.GetFarmAsync)
local v_u_6 = workspace:WaitForChild("Farm")
task.spawn(function()
	-- upvalues: (copy) v_u_2, (copy) v_u_4, (copy) v_u_5, (copy) v_u_3, (copy) v_u_6
	v_u_2.InputBegan:Wait()
	task.wait(3)
	if v_u_4() then
		local v7 = v_u_5(v_u_3)
		for _, v8 in v_u_6:GetChildren() do
			if v7 ~= v8 then
				local v9 = v8.Important.Cosmetic_Physical
				for _, v10 in v9:GetChildren() do
					v10:Destroy()
				end
				v9.ChildAdded:Connect(function(p11)
					p11:Destroy()
				end)
			end
		end
	end
end)
return {}