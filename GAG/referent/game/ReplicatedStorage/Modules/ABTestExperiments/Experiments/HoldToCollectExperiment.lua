local v1 = game:GetService("ReplicatedStorage")
local v_u_2 = game:GetService("UserInputService")
local v_u_3 = game:GetService("GuiService")
require(v1.Modules.ABTestExperiments.ABTestTypes)
local v4 = {
	["RemoteConfig"] = "HoldToCollect",
	["Disabled"] = false,
	["DefaultState"] = false
}
local v7 = {
	[true] = {
		["Client"] = function(p5, _)
			-- upvalues: (copy) v_u_2, (copy) v_u_3
			local v6 = v_u_2.TouchEnabled and not v_u_2.KeyboardEnabled
			if v6 then
				v6 = not v_u_3:IsTenFootInterface()
			end
			if v6 then
				p5:SetAttribute("AB_HoldToCollect", true)
			end
		end
	}
}
v4.States = v7
return v4