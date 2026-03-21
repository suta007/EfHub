game:GetService("Players")
local v_u_1 = require(game.ReplicatedStorage.Modules.TradeControllers.TradeWorldController)
local v_u_2 = {}
for _, v_u_3 in workspace.Farm:GetChildren() do
	local v4 = v_u_3:FindFirstChild("Important"):FindFirstChild("Data")
	v_u_2[v4.Owner.Value] = v_u_3
	local v_u_5 = v4.Owner.Value
	v4.Owner.Changed:Connect(function(p6)
		-- upvalues: (copy) v_u_2, (ref) v_u_5, (copy) v_u_3
		v_u_2[v_u_5] = nil
		v_u_2[p6] = v_u_3
		v_u_5 = p6
	end)
end
local function v_u_11(p7)
	-- upvalues: (copy) v_u_1
	if v_u_1:IsInWorld() then
		return nil
	elseif p7 then
		for _, v8 in workspace.Farm:GetChildren() do
			local v9 = v8:FindFirstChild("Important")
			if v9 then
				local v10 = v9:FindFirstChild("Data")
				if v10 and v10.Owner.Value == p7.Name then
					return v8
				end
			end
		end
	end
end
return function(p12)
	-- upvalues: (copy) v_u_1, (copy) v_u_2, (copy) v_u_11
	if v_u_1:IsInWorld() then
		return nil
	elseif p12 then
		if v_u_2[p12.Name] then
			return v_u_2[p12.Name]
		else
			return v_u_11(p12)
		end
	else
		return
	end
end