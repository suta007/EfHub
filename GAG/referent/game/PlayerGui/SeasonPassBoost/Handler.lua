local v_u_1 = game:GetService("Players").LocalPlayer
local v_u_2 = script.Parent.Frame.CurrentBoost
v_u_1:GetAttributeChangedSignal("PassBoost"):Connect(function()
	-- upvalues: (copy) v_u_1, (copy) v_u_2
	local v3 = v_u_1:GetAttribute("PassBoost") or 0
	v_u_2.Visible = v3 > 0
	local v4 = v_u_2
	local v5 = v3 * 100
	v4.Text = ("Pass Boost: +%*%%"):format((math.floor(v5)))
end)
local v6 = v_u_1:GetAttribute("PassBoost") or 0
v_u_2.Visible = v6 > 0
local v7 = v6 * 100
v_u_2.Text = ("Pass Boost: +%*%%"):format((math.floor(v7)))