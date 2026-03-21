game:GetService("ServerScriptService")
local v1 = game:GetService("ReplicatedStorage")
game:GetService("Players")
game:GetService("RunService")
local v2 = v1:WaitForChild("GameEvents"):WaitForChild("InventorySortingServiceEvents")
local v3 = {}
local v_u_4 = require(v1.Modules.DataService)
function v3.GetEntry(_, p5)
	-- upvalues: (copy) v_u_4
	local v6 = v_u_4:GetData().InventorySortData
	return table.find(v6, p5)
end
local v_u_7 = v2:WaitForChild("MoveEntry")
function v3.MoveEntry(_, p8, p9)
	-- upvalues: (copy) v_u_7
	return v_u_7:FireServer(p8, p9)
end
function v3.GetSortedData(_)
	-- upvalues: (copy) v_u_4
	local v10 = v_u_4:GetData().InventorySortData
	if not table.find(v10, "SHOVEL") then
		table.insert(v10, "SHOVEL")
	end
	return v10
end
return v3