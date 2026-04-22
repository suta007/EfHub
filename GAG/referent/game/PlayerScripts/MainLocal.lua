local v1 = game:GetService("ReplicatedStorage")
local v2 = game:GetService("Players")
for _, v3 in v1:WaitForChild("ReplicateUI"):GetChildren() do
	v3.Parent = v2.LocalPlayer.PlayerGui
end
local v_u_4 = {}
for _, v_u_5 in pairs(v1.Modules:GetDescendants()) do
	if v_u_5:IsA("ModuleScript") then
		task.spawn(function()
			-- upvalues: (copy) v_u_5, (copy) v_u_4
			debug.setmemorycategory(v_u_5.Name)
			local v6 = os.clock()
			local v7, v8 = pcall(function()
				-- upvalues: (ref) v_u_5
				require(v_u_5)
			end)
			local v9 = os.clock() - v6
			local v10 = v_u_4
			local v11 = {
				["Script"] = v_u_5.Name,
				["Time"] = v9
			}
			table.insert(v10, v11)
			if not v7 then
				warn(v_u_5.Name, v8)
			end
		end)
	end
end
table.sort(v_u_4, function(p12, p13)
	return p12.Time > p13.Time
end)
local _ = v_u_4[1]
local _ = v_u_4[2]
local _ = v_u_4[3]
local _ = v_u_4[4]
local _ = v_u_4[5]
local _ = v_u_4[6]
local _ = v_u_4[7]
local _ = v_u_4[8]
local _ = v_u_4[9]
local _ = v_u_4[10]