local v_u_1 = game:GetService("Players").LocalPlayer
local function v7(_)
	-- upvalues: (copy) v_u_1
	local v2 = v_u_1:FindFirstChild("Backpack")
	if v2 then
		local function v_u_4(p_u_3)
			if p_u_3:IsA("Tool") and string.find(p_u_3.Name, "(kg)") then
				p_u_3.ToolTip = p_u_3.Name
				p_u_3:GetPropertyChangedSignal("Name"):Connect(function()
					-- upvalues: (copy) p_u_3
					if string.find(p_u_3.Name, "(kg)") then
						p_u_3.ToolTip = p_u_3.Name
					end
				end)
			end
		end
		for _, v5 in ipairs(v2:GetChildren()) do
			v_u_4(v5)
		end
		v2.ChildAdded:Connect(function(p6)
			-- upvalues: (copy) v_u_4
			v_u_4(p6)
		end)
	end
end
v_u_1.CharacterAdded:Connect(v7)
if v_u_1.Character then
	v7(v_u_1.Character)
end