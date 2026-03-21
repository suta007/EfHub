local v1 = game:GetService("ReplicatedStorage")
local v_u_2 = game:GetService("Players")
local v3 = v1.GameEvents.GiveawayConfirmationEvent
local v_u_4 = require(v1.Modules.ItemImageFinder)
v3.OnClientEvent:Connect(function(p5, p6, p7)
	-- upvalues: (copy) v_u_2, (copy) v_u_4
	local v_u_8 = v_u_2.LocalPlayer.PlayerGui:WaitForChild("GiveawayConfirmation_UI")
	v_u_8.Enabled = true
	v_u_8.Frame.ImageFrame.ItemImage.Image = v_u_4(p7, p6)
	v_u_8.Frame.TextFrame.ReceiveText.Text = p5
	v_u_8.Frame.ItemFrame.Frame.Confirm.Activated:Connect(function()
		-- upvalues: (copy) v_u_8
		v_u_8.Enabled = false
	end)
	v_u_8.Frame.Frame.ExitButton.Activated:Connect(function()
		-- upvalues: (copy) v_u_8
		v_u_8.Enabled = false
	end)
end)