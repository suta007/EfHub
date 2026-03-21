local v1 = game:GetService("ReplicatedStorage")
local v2 = game:GetService("RunService")
local v_u_3 = game:GetService("UserInputService")
local v4 = game:GetService("Players")
local v_u_5 = game:GetService("GuiService")
local v6 = v4.LocalPlayer
local v_u_7 = v6.PlayerGui
local v_u_8 = v_u_7:WaitForChild("GlobalMessageUI")
v_u_8.Enabled = require(v1.Data.AuthorizedGlobalChatQueuers)[v6.UserId]
local v9 = require(v1.Modules.SetupHoverAnimations)
local v_u_10 = require(v1.Modules.GuestEventServices.GlobalChatController)
local v_u_11 = v_u_8.MainFrame
local v_u_12 = v_u_11.Frame.Frame.Frame.GLOBAL_MESSAGE_INPUT
local v13 = v_u_11.Frame.TextLabel.Frame.CLOSE_BUTTON
local v14 = v_u_11.Frame.Frame1.Frame.SUBMIT_BUTTON
v9(v13).Activated:Connect(function()
	-- upvalues: (copy) v_u_8
	v_u_8:Destroy()
end)
v9(v14).Activated:Connect(function()
	-- upvalues: (copy) v_u_10, (copy) v_u_12
	v_u_10:QueueChatMessage(v_u_12.Text)
end)
local v_u_15 = v_u_3:GetMouseLocation()
v2.RenderStepped:Connect(function()
	-- upvalues: (copy) v_u_3, (ref) v_u_15, (copy) v_u_5, (copy) v_u_7, (copy) v_u_11
	local v16 = v_u_3:GetMouseLocation()
	if v16 ~= v_u_15 then
		local v17 = v16.X - v_u_15.X
		local v18 = v16.Y - v_u_15.Y
		v_u_15 = v16
		if v_u_3:IsMouseButtonPressed(Enum.UserInputType.MouseButton1) then
			local v19 = v_u_3:GetMouseLocation() - v_u_5:GetGuiInset()
			local v20 = v_u_7:GetGuiObjectsAtPosition(v19.X, v19.Y)
			if table.find(v20, v_u_11) then
				v_u_11.Position = v_u_11.Position + UDim2.fromOffset(v17, v18)
			end
		end
	end
end)
return {}