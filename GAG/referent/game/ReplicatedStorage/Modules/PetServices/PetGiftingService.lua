local v1 = {}
local v_u_2 = game:GetService("ReplicatedStorage"):WaitForChild("GameEvents"):WaitForChild("PetGiftingService")
local v_u_3 = script.Gift_Notification
local v_u_4 = game.Players.LocalPlayer.PlayerGui:WaitForChild("Gift_Notification")
function v1.GivePet(_, p5)
	-- upvalues: (copy) v_u_2
	v_u_2:FireServer("GivePet", p5)
end
game.ReplicatedStorage.GameEvents.GiftPet.OnClientEvent:Connect(function(p_u_6, p7, p8)
	-- upvalues: (copy) v_u_3, (copy) v_u_4
	local v_u_9 = v_u_3:Clone()
	if game:GetService("UserInputService").PreferredInput == Enum.PreferredInput.Touch then
		local v10 = Instance.new("UIScale")
		v10.Scale = 1.3
		v10.Parent = v_u_9
	end
	v_u_9.Parent = v_u_4.Frame
	v_u_9.Holder.Notification_UI.TextLabel.Text = "Gift from @" .. p8
	v_u_9.Holder.TextLabel.Text = p7
	v_u_9.Holder.Frame.Accept.MouseButton1Click:Connect(function()
		-- upvalues: (copy) v_u_9, (copy) p_u_6
		v_u_9:Destroy()
		game.ReplicatedStorage.GameEvents.AcceptPetGift:FireServer(true, p_u_6)
	end)
	v_u_9.Holder.Frame.Decline.MouseButton1Click:Connect(function()
		-- upvalues: (copy) v_u_9, (copy) p_u_6
		v_u_9:Destroy()
		game.ReplicatedStorage.GameEvents.AcceptPetGift:FireServer(false, p_u_6)
	end)
end)
return v1