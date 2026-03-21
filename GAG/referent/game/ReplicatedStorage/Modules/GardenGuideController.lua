local v1 = game:GetService("ReplicatedStorage")
local v2 = game:GetService("Players")
local v3 = require(v1.Data.GardenGuideData)
local v_u_4 = require(v1.Modules.GuiController)
require(v1.Modules.SetupButton)
local v_u_5 = not v3.UseTool
local v_u_6 = v2.LocalPlayer.PlayerGui:WaitForChild("GardenGuide")
v_u_4:GetStateForGui(v_u_6)
local v_u_7 = v1.GameEvents.GardenGuide.ToggleBook
local v_u_8 = {
	["Open"] = function(_)
		-- upvalues: (copy) v_u_5, (copy) v_u_4, (copy) v_u_6
		if v_u_5 then
			v_u_4:Open(v_u_6)
		else
			v_u_6.Enabled = true
		end
	end,
	["Close"] = function(_)
		-- upvalues: (copy) v_u_5, (copy) v_u_4, (copy) v_u_6
		if v_u_5 then
			v_u_4:Close(v_u_6)
		else
			v_u_6.Enabled = false
		end
	end,
	["Toggle"] = function(_)
		-- upvalues: (copy) v_u_5, (copy) v_u_4, (copy) v_u_6, (copy) v_u_8
		if v_u_5 then
			v_u_4:Toggle(v_u_6)
			return
		elseif v_u_6.Enabled then
			v_u_8:Close()
		else
			v_u_8:Open()
		end
	end,
	["Start"] = function(_)
		-- upvalues: (copy) v_u_5, (copy) v_u_4, (copy) v_u_6, (copy) v_u_7
		if v_u_5 then
			v_u_4:UsePopupAnims(v_u_6)
		end
		v_u_6:GetPropertyChangedSignal("Enabled"):Connect(function()
			-- upvalues: (ref) v_u_7, (ref) v_u_6
			v_u_7:FireServer(v_u_6.Enabled)
		end)
	end
}
task.spawn(v_u_8.Start, v_u_8)
return v_u_8