local v_u_1 = game:GetService("UserInputService")
local v_u_2 = game:GetService("CollectionService")
local v_u_3 = game:GetService("GuiService")
local v_u_4 = game:GetService("Players").LocalPlayer:WaitForChild("PlayerGui")
return function(p5)
	-- upvalues: (copy) v_u_2, (copy) v_u_1, (copy) v_u_3, (copy) v_u_4
	local v6 = v_u_2:GetTagged(p5)
	local v7 = v_u_1:GetMouseLocation() - v_u_3:GetGuiInset()
	local v8 = v_u_4:GetGuiObjectsAtPosition(v7.X, v7.Y)
	for _, v9 in v6 do
		if v9:IsDescendantOf(v_u_4) and table.find(v8, v9) then
			return v9
		end
	end
	return nil
end