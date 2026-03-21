local v1 = game:GetService("ReplicatedStorage")
local v2 = game:GetService("Players")
for _, v3 in v1:WaitForChild("ReplicateUI"):GetChildren() do
	v3.Parent = v2.LocalPlayer.PlayerGui
end
for _, v_u_4 in pairs(v1.Modules:GetDescendants()) do
	if v_u_4:IsA("ModuleScript") then
		task.spawn(function()
			-- upvalues: (copy) v_u_4
			debug.setmemorycategory(v_u_4.Name)
			local v5, v6 = pcall(function()
				-- upvalues: (ref) v_u_4
				require(v_u_4)
			end)
			if not v5 then
				warn(v_u_4.Name, v6)
			end
		end)
	end
end