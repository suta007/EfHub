local v1 = game:GetService("ReplicatedStorage")
local v_u_2 = game:GetService("PolicyService")
local v_u_3 = game:GetService("RunService")
local v_u_4 = game:GetService("Players")
local v_u_5 = require(v1.Modules.RetryPcall)
local v6 = {}
local v_u_7 = {}
local v_u_8 = {}
function v6.GetPolicyInfoForPlayerAsync(_, p_u_9)
	-- upvalues: (copy) v_u_3, (copy) v_u_4, (copy) v_u_7, (copy) v_u_8, (copy) v_u_5, (copy) v_u_2
	if v_u_3:IsClient() and p_u_9 ~= v_u_4.LocalPlayer then
		error("PolicyService:GetPolicyForPlayerAsync can only be called for the LocalPlayer in the client")
	end
	while v_u_7[p_u_9] and p_u_9:IsDescendantOf(v_u_4) do
		task.wait()
	end
	if not p_u_9:IsDescendantOf(v_u_4) then
		return nil
	end
	local v10 = v_u_8[p_u_9]
	if v10 then
		return v10
	end
	v_u_7[p_u_9] = true
	local v11, v12 = v_u_5(15, 30, function()
		-- upvalues: (ref) v_u_2, (copy) p_u_9
		return v_u_2:GetPolicyInfoForPlayerAsync(p_u_9)
	end)
	v_u_7[p_u_9] = nil
	if not v11 then
		return nil
	end
	if p_u_9:IsDescendantOf(v_u_4) then
		v_u_8[p_u_9] = v12
	end
	return v12
end
if v_u_3:IsServer() then
	v_u_4.PlayerRemoving:Connect(function(p13)
		-- upvalues: (copy) v_u_8
		v_u_8[p13] = nil
	end)
end
return v6