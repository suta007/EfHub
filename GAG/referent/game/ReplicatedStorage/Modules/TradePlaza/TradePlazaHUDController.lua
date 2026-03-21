local v1 = game:GetService("ReplicatedStorage")
local v2 = game:GetService("Players")
local v_u_3 = require(v1.Modules.GuiController)
local v_u_4 = require(v1.Modules.TradeBoothControllers.TradeBoothController)
local v_u_5 = require(v1.Modules.TradeControllers.TradeWorldController)
local v_u_6 = require(v1.Modules.TradePlaza.TradePlazaIndexController)
local v_u_7 = require(v1.Modules.PlayClickSound)
local v_u_8 = v2.LocalPlayer.PlayerGui
local v_u_9 = v_u_8:WaitForChild("TradePlazaIndex")
local v_u_10 = v_u_8:WaitForChild("Teleport_UI")
local v_u_11 = v_u_10.TradePlaza
local v12 = {
	["Start"] = function(_)
		-- upvalues: (copy) v_u_11, (copy) v_u_7, (copy) v_u_4, (copy) v_u_3, (copy) v_u_8, (copy) v_u_9, (copy) v_u_6, (copy) v_u_5, (copy) v_u_10
		v_u_11.Booth.Activated:Connect(function()
			-- upvalues: (ref) v_u_7, (ref) v_u_4
			v_u_7()
			v_u_4:TeleportToBooth()
		end)
		v_u_11.Tokens.Activated:Connect(function()
			-- upvalues: (ref) v_u_7, (ref) v_u_3, (ref) v_u_8
			v_u_7()
			v_u_3:Toggle(v_u_8.BuyTokens)
		end)
		v_u_11.Index.Activated:Connect(function()
			-- upvalues: (ref) v_u_7, (ref) v_u_9, (ref) v_u_6, (ref) v_u_3
			v_u_7()
			if not v_u_9.Enabled then
				v_u_6.Initialize()
			end
			v_u_3:Toggle(v_u_9)
		end)
		if v_u_5:IsInWorld() then
			v_u_10.TradePlaza.Visible = true
			v_u_10.Frame.Visible = false
		end
	end
}
task.spawn(v12.Start, v12)
return v12