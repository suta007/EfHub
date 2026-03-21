local v_u_1 = game:GetService("ReplicatedStorage")
local v_u_2 = game:GetService("Players").LocalPlayer.PlayerGui:WaitForChild("FindSellerPrompt")
local v_u_3 = require(v_u_1.Modules.TradeTokens.TokenRAPUtil)
local v_u_4 = require(v_u_1.Modules.GuiController)
local v_u_5 = require(v_u_1.Modules.Notification)
local v_u_6 = require(v_u_1.Modules.Trove).new()
local v_u_7 = false
local v15 = {
	["Prompt"] = function(_, p_u_8, p9)
		-- upvalues: (ref) v_u_7, (copy) v_u_6, (copy) v_u_3, (copy) v_u_1, (copy) v_u_5, (copy) v_u_4, (copy) v_u_2
		if v_u_7 then
			return
		else
			v_u_6:Clean()
			local v_u_10 = v_u_3.GetDefaultItemData(p_u_8, p9)
			local v11 = ("Data for %*/%* not found"):format(p_u_8, p9)
			assert(v_u_10, v11)
			v_u_7 = true
			local v12, v13, v_u_14 = pcall(function()
				-- upvalues: (ref) v_u_1, (copy) p_u_8, (copy) v_u_10
				return v_u_1.GameEvents.TradeEvents.TokenRAPs.FindSellers:InvokeServer(p_u_8, v_u_10)
			end)
			v_u_7 = false
			if v12 then
				if v13 and v_u_14 then
					v_u_4:Open(v_u_2)
					v_u_6:Add(v_u_2.Frame.Close.Activated:Connect(function()
						-- upvalues: (ref) v_u_6, (ref) v_u_4, (ref) v_u_2
						v_u_6:Clean()
						v_u_4:Close(v_u_2)
					end))
					v_u_6:Add(v_u_2.Frame.Options.Yes.Activated:Connect(function()
						-- upvalues: (ref) v_u_1, (copy) v_u_14, (ref) v_u_6, (ref) v_u_4, (ref) v_u_2
						v_u_1.GameEvents.TradeEvents.TokenRAPs.TeleportToListing:InvokeServer(v_u_14)
						v_u_6:Clean()
						v_u_4:Close(v_u_2)
					end))
					v_u_6:Add(v_u_2.Frame.Options.No.Activated:Connect(function()
						-- upvalues: (ref) v_u_6, (ref) v_u_4, (ref) v_u_2
						v_u_6:Clean()
						v_u_4:Close(v_u_2)
					end))
				else
					v_u_5:CreateNotification("There are no online sellers for this item!")
				end
			else
				return
			end
		end
	end,
	["Start"] = function(_)
		-- upvalues: (copy) v_u_4, (copy) v_u_2
		v_u_4:UsePopupAnims(v_u_2)
	end
}
task.spawn(v15.Start, v15)
return v15