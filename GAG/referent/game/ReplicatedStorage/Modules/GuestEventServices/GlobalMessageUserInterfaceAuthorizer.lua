local v1 = game:GetService("ReplicatedStorage")
local v_u_2 = game:GetService("Players")
local v_u_3 = require(v1.Modules.ModernInputNotificationUserInterfaceService)
local v_u_4 = require(v1.Modules.GuestEventServices.GlobalChatController)
v_u_4.AuthorizerMessageCreated:Connect(function(p_u_5)
	-- upvalues: (copy) v_u_2, (copy) v_u_3, (copy) v_u_4
	local v6 = v_u_2:GetNameFromUserIdAsync(p_u_5.Messager)
	local v7 = v_u_2:GetUserThumbnailAsync(p_u_5.Messager, Enum.ThumbnailType.HeadShot, Enum.ThumbnailSize.Size420x420)
	local v8 = v_u_3
	local v9 = {
		["Text"] = ("%* wants to say: %*!"):format(v6, p_u_5.Message),
		["EnabledComponents"] = {
			["OptionSet"] = true,
			["Confirm"] = true,
			["Decline"] = true,
			["IconSet"] = true
		},
		["Icon"] = v7,
		["OnConfirm"] = function()
			-- upvalues: (ref) v_u_4, (copy) p_u_5
			v_u_4:AuthorizeMessage(p_u_5.MessageId)
		end,
		["OnDecline"] = function()
			-- upvalues: (ref) v_u_4, (copy) p_u_5
			v_u_4:DenyMessage(p_u_5.MessageId)
		end
	}
	v8:CreateNotification(v9)
end)
return {}