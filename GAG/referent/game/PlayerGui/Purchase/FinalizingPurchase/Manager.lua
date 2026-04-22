local v1 = game:GetService("ReplicatedStorage")
game:GetService("RunService")
local v2 = game:GetService("Players")
local v_u_3 = require(v1.Modules.Spring)
local v_u_4 = v2.LocalPlayer
local v_u_5 = script.Parent
v_u_5.GroupTransparency = 1
v_u_5.Position = UDim2.fromScale(0.5, 0.185)
local function v_u_7(p6)
	-- upvalues: (copy) v_u_3, (copy) v_u_5
	v_u_3.target(v_u_5, 1, 2.625, {
		["Position"] = UDim2.fromScale(0.5, p6 and 0.215 or 0.185)
	})
	v_u_3.target(v_u_5, 1, 3.5, {
		["GroupTransparency"] = p6 and 0 or 1
	})
end
v_u_4:GetAttributeChangedSignal("IsPurchaseActive"):Connect(function(_)
	-- upvalues: (copy) v_u_7, (copy) v_u_4
	v_u_7(v_u_4:GetAttribute("IsPurchaseActive"))
end)