local v1 = game:GetService("ReplicatedStorage"):WaitForChild("GameEvents")
local v_u_2 = game:GetService("Players")
local v_u_3 = v1:WaitForChild("FriendshipPotToolService_RE")
local v4 = v1:WaitForChild("FriendPotLink_RE")
local v5 = v1:WaitForChild("FriendPotLinkEnded_RE")
local v6 = v_u_2.LocalPlayer.PlayerGui
local v_u_7 = script.Gift_Notification
local v_u_8 = v6:WaitForChild("Gift_Notification")
local v_u_9 = {}
v4.OnClientEvent:Connect(function(p10, p11, p_u_12, p13)
	-- upvalues: (copy) v_u_2, (copy) v_u_7, (copy) v_u_9, (copy) v_u_8, (copy) v_u_3
	local v14 = v_u_2:GetPlayerByUserId(p10)
	v_u_2:GetPlayerByUserId(p11)
	local v_u_15 = v_u_7:Clone()
	v_u_9[p_u_12] = v_u_15
	v_u_15.Parent = v_u_8.Frame
	v_u_15.Holder.Notification_UI.TextLabel.Text = "Friend Pot from @" .. v14.Name
	v_u_15.Holder.TextLabel.Text = p13
	v_u_15.Holder.Frame.Accept.MouseButton1Click:Connect(function()
		-- upvalues: (copy) v_u_15, (ref) v_u_3, (copy) p_u_12
		v_u_15:Destroy()
		v_u_3:FireServer("AcceptTrade", p_u_12)
	end)
	v_u_15.Holder.Frame.Decline.MouseButton1Click:Connect(function()
		-- upvalues: (copy) v_u_15, (ref) v_u_3, (copy) p_u_12
		v_u_15:Destroy()
		v_u_3:FireServer("CancelTrade", p_u_12)
	end)
end)
v5.OnClientEvent:Connect(function(_, _, p16)
	-- upvalues: (copy) v_u_9
	local v17 = v_u_9[p16]
	if v17 then
		v17:Destroy()
	end
end)
return {}