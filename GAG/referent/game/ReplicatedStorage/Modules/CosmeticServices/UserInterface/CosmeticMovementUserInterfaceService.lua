local v1 = game:GetService("Players")
local v2 = game:GetService("RunService")
local v_u_3 = game:GetService("UserInputService")
local v_u_4 = game:GetService("GuiService")
local v5 = game:GetService("ReplicatedStorage")
local v6 = v1.LocalPlayer
local v_u_7 = require(v5.Modules.Fingers)
local v_u_8 = v6:WaitForChild("PlayerGui"):WaitForChild("CosmeticUI"):WaitForChild("MovementIcon")
v_u_8.Visible = false
local v_u_9 = {
	["Active"] = false
}
local v_u_10 = nil
function v_u_9.Toggle(_, p11)
	-- upvalues: (ref) v_u_10, (copy) v_u_7, (copy) v_u_9, (copy) v_u_3, (copy) v_u_4, (copy) v_u_8
	v_u_10 = v_u_7:GetOne()
	v_u_9.Active = p11
	local v12 = v_u_3:GetMouseLocation()
	local v13 = v_u_4:GetGuiInset()
	local _ = (FingerPosition or v12).X
	v_u_8.Position = UDim2.fromOffset(v12.X + v13.X, v12.Y - v13.Y)
	v_u_8.Visible = p11
end
v2.RenderStepped:Connect(function()
	-- upvalues: (copy) v_u_9, (copy) v_u_3, (copy) v_u_4, (copy) v_u_8
	if v_u_9.Active then
		local v14 = v_u_3:GetMouseLocation()
		local v15 = v_u_4:GetGuiInset()
		local _ = (FingerPosition or v14).X
		v_u_8.Position = UDim2.fromOffset(v14.X + v15.X, v14.Y - v15.Y)
	end
end)
return v_u_9