local v1 = game:GetService("Players")
game:GetService("UserInputService")
game:GetService("ReplicatedStorage")
local v2 = v1.LocalPlayer
local v_u_3 = v2.PlayerGui
local v_u_4 = v2:GetMouse()
local v_u_5 = {
	["TradeItemHover"] = true,
	["TouchGui"] = true
}
local function v_u_10(p6)
	-- upvalues: (copy) v_u_5
	if not p6:IsA("GuiObject") then
		return false
	end
	local v7 = p6:FindFirstAncestorOfClass("ScreenGui")
	if not (v7 and v7.Enabled) then
		return false
	end
	if v_u_5[v7.Name] then
		return false
	end
	local v8 = 0
	local v9 = 0
	while p6 do
		if p6:IsA("GuiObject") then
			if not p6.Visible then
				return false
			end
			v8 = v8 + 1
			if p6:IsA("ImageLabel") or p6:IsA("ImageButton") then
				if p6.ImageTransparency >= 1 then
					v9 = v9 + 1
				end
			elseif p6:IsA("TextLabel") or p6:IsA("TextButton") then
				if p6.BackgroundTransparency >= 1 then
					v9 = v9 + 1
				end
			elseif p6.BackgroundTransparency >= 1 then
				v9 = v9 + 1
			end
		end
		if not p6.Parent or (p6.Parent:IsA("Player") or p6.Parent:IsA("PlayerGui")) then
			break
		end
		p6 = p6.Parent
	end
	return v8 > v9
end
return function()
	-- upvalues: (copy) v_u_3, (copy) v_u_4, (copy) v_u_10
	for _, v11 in v_u_3:GetGuiObjectsAtPosition(v_u_4.X, v_u_4.Y) do
		if v_u_10(v11) then
			return true
		end
	end
	return false
end