local v_u_1 = game:GetService("Players")
local v_u_2 = v_u_1.LocalPlayer
local v_u_3 = script.Parent.Frame.CurrentBoost
v_u_2:GetAttributeChangedSignal("FriendBoost"):Connect(function()
	-- upvalues: (copy) v_u_2, (copy) v_u_3
	local v4 = v_u_3
	local v5 = (v_u_2:GetAttribute("FriendBoost") or 0) * 100
	v4.Text = ("Friend Boost: +%*%%"):format((math.floor(v5)))
end)
local v6 = (v_u_2:GetAttribute("FriendBoost") or 0) * 100
v_u_3.Text = ("Friend Boost: +%*%%"):format((math.floor(v6)))
local v7 = script.Parent.Frame.InviteFriend.ImageButton
local v_u_8 = game:GetService("StarterGui")
local v_u_9 = game:GetService("SocialService")
local _ = game.ReplicatedStorage.GameEvents.Notification
v7.MouseButton1Click:Connect(function()
	-- upvalues: (copy) v_u_1, (copy) v_u_2, (copy) v_u_8, (copy) v_u_9
	local v10 = {}
	for _, v11 in pairs(v_u_1:GetChildren()) do
		if v11 ~= v_u_2 and v11:IsFriendsWith(v_u_2.UserId) == false then
			table.insert(v10, v11)
		end
	end
	if #v10 >= 1 then
		v_u_8:SetCore("PromptSendFriendRequest", v10[math.random(1, #v10)])
	else
		v_u_9:PromptGameInvite(v_u_2)
	end
end)