game:GetService("Players")
local v_u_1 = require(game.ReplicatedStorage.Modules.TradeControllers.TradeWorldController)
local v_u_2 = {}
for _, v_u_3 in workspace.Farm:GetChildren() do
	if not v_u_3:GetAttribute("CommunityGarden") then
		local v4 = v_u_3:FindFirstChild("Important")
		if v4 then
			local v5 = v4:FindFirstChild("Data")
			v_u_2[v5.Owner.Value] = v_u_3
			local v_u_6 = v5.Owner.Value
			v5.Owner.Changed:Connect(function(p7)
				-- upvalues: (copy) v_u_2, (ref) v_u_6, (copy) v_u_3
				v_u_2[v_u_6] = nil
				v_u_2[p7] = v_u_3
				v_u_6 = p7
			end)
		else
			warn(v_u_3, "doesn\'t have important attached?")
		end
	end
end
local function v_u_12(p8)
	-- upvalues: (copy) v_u_1
	if v_u_1:IsInWorld() then
		return nil
	elseif p8 then
		for _, v9 in workspace.Farm:GetChildren() do
			local v10 = v9:FindFirstChild("Important")
			if v10 then
				local v11 = v10:FindFirstChild("Data")
				if v11 and v11.Owner.Value == p8.Name then
					return v9
				end
			end
		end
	end
end
return function(p13)
	-- upvalues: (copy) v_u_1, (copy) v_u_2, (copy) v_u_12
	if v_u_1:IsInWorld() then
		return nil
	elseif p13 then
		if v_u_2[p13.Name] then
			return v_u_2[p13.Name]
		else
			return v_u_12(p13)
		end
	else
		return
	end
end