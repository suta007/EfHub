local v1 = game:GetService("Players")
local v2 = game:GetService("ReplicatedStorage")
local v_u_3 = v1.LocalPlayer
local v_u_4 = require(v2.Modules.InventoryService)
local function v11(_)
	-- upvalues: (copy) v_u_3, (copy) v_u_4
	local v5 = v_u_3:FindFirstChild("Backpack")
	if v5 then
		local function v_u_8(p_u_6)
			-- upvalues: (ref) v_u_4
			local v7 = v_u_4:GetToolData(p_u_6)
			if v7 then
				if v7.ItemType == "Holdable" then
					p_u_6.ToolTip = p_u_6.Name
					p_u_6:GetPropertyChangedSignal("Name"):Connect(function()
						-- upvalues: (copy) p_u_6
						p_u_6.ToolTip = p_u_6.Name
					end)
				end
			else
				return
			end
		end
		for _, v9 in ipairs(v5:GetChildren()) do
			v_u_8(v9)
		end
		v5.ChildAdded:Connect(function(p10)
			-- upvalues: (copy) v_u_8
			v_u_8(p10)
		end)
	end
end
v_u_3.CharacterAdded:Connect(v11)
if v_u_3.Character then
	v11(v_u_3.Character)
end