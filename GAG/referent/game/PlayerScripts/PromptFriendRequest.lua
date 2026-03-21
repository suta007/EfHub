local v_u_1 = game:GetService("StarterGui")
game.ReplicatedStorage.GameEvents.Prompt_Friend.OnClientEvent:Connect(function(p2)
	-- upvalues: (copy) v_u_1
	v_u_1:SetCore("PromptSendFriendRequest", p2)
end)