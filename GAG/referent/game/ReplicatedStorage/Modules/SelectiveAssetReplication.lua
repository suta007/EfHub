local v1 = game:GetService("ReplicatedStorage")
local v2 = game:GetService("Players")
local _ = v2.LocalPlayer
local v_u_3 = v1:WaitForChild("GameEvents"):WaitForChild("ReplicationChannel")
local v_u_4 = v2.LocalPlayer
v_u_4:WaitForChild("PlayerGui"):WaitForChild("ReplicatedAssets")
local v_u_5 = require(v1.Modules.IsDev)
local v6 = {}
local function v_u_11(p7)
	-- upvalues: (copy) v_u_4
	local v8 = v_u_4:WaitForChild("PlayerGui")
	if v8 then
		local v9 = v8:WaitForChild("ReplicatedAssets")
		if v9 then
			local v10 = v9:WaitForChild(p7, 60)
			if not v10 then
				warn((("[%*]: Could not find %* in ReplicatedAssets after 60 seconds"):format(script.Name, p7)))
			end
			return v10
		end
		warn("ReplicatedAssets did not exist after 4 seconds")
	else
		warn("PlayerGui did not exist after 4 seconds")
	end
end
function v6.GetAssetAsync(_, p12, p13, p14)
	-- upvalues: (copy) v_u_11, (copy) v_u_3, (copy) v_u_5
	local v15 = v_u_11(p12)
	local v16
	if v15 then
		v16 = v15:FindFirstChild(p13)
	else
		v16 = v15
	end
	if not v16 then
		v_u_3:FireServer(p12, p13)
	end
	if v15 then
		return v15:WaitForChild(p13, p14)
	end
	if v_u_5() then
		warn((("[%*]: Could not find namespace \'%*\'"):format(script.Name, p12)))
	end
	return nil
end
return v6