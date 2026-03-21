local v_u_1 = game:GetService("Players").LocalPlayer:WaitForChild("PlayerGui"):WaitForChild("CosmeticUI"):WaitForChild("ActionMenu"):WaitForChild("ICON_INSERTION_POINT")
local v_u_2 = {
	["Active"] = false
}
local v_u_3 = Color3.fromRGB(98, 255, 93)
local v_u_4 = Color3.fromRGB(255, 93, 93)
function v_u_2.Toggle(_)
	-- upvalues: (copy) v_u_1, (copy) v_u_2, (copy) v_u_3, (copy) v_u_4
	xpcall(function()
		-- upvalues: (ref) v_u_1, (ref) v_u_2, (ref) v_u_3, (ref) v_u_4
		local v5 = v_u_1:WaitForChild("RotateLock", 3):FindFirstChild("IMAGE_ICON", 3)
		v_u_2.Active = not v_u_2.Active
		v5.ImageColor3 = v_u_2.Active and v_u_3 or v_u_4
	end, warn)
	return v_u_2.Active
end
function v_u_2.GetCurrentColor(_)
	-- upvalues: (copy) v_u_2, (copy) v_u_3, (copy) v_u_4
	return v_u_2.Active and v_u_3 or v_u_4
end
return v_u_2