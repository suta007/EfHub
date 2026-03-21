local v1 = game:GetService("ReplicatedStorage")
local v2 = game:GetService("Players")
local v_u_3 = require(v1.Modules.GuiController)
require(v1.Modules.SetupButton)
local v_u_4 = v2.LocalPlayer.PlayerGui:WaitForChild("SeasonPassUI")
v_u_3:GetStateForGui(v_u_4)
local v5 = {
	["Open"] = function(_)
		-- upvalues: (copy) v_u_3, (copy) v_u_4
		v_u_3:Open(v_u_4)
	end,
	["Close"] = function(_)
		-- upvalues: (copy) v_u_3, (copy) v_u_4
		v_u_3:Close(v_u_4)
	end,
	["Toggle"] = function(_)
		-- upvalues: (copy) v_u_3, (copy) v_u_4
		v_u_3:Toggle(v_u_4)
	end,
	["Start"] = function(_)
		-- upvalues: (copy) v_u_3, (copy) v_u_4
		v_u_3:UsePopupAnims(v_u_4)
	end
}
task.spawn(v5.Start, v5)
return v5