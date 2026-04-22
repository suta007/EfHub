local v1 = game:GetService("ReplicatedStorage")
local v2 = game:GetService("RunService")
local v_u_3 = game:GetService("UserInputService")
local v4 = game:GetService("Players")
local v_u_5 = game:GetService("GuiService")
local v6 = v4.LocalPlayer
local v_u_7 = v6.PlayerGui
local v_u_8 = v_u_7:WaitForChild("GlobalMessageUI")
local v9 = require(v1.Modules.GameConfigController)
v_u_8.Enabled = table.find(v9:GetConfig("AuthorizedGlobalChatQueuers") or {}, v6.UserId) ~= nil
local v10 = require(v1.Modules.SetupHoverAnimations)
local v_u_11 = require(v1.Modules.GuestEventServices.GlobalChatController)
local v_u_12 = v_u_8.MainFrame
local v_u_13 = v_u_12.Frame.Frame.Frame.GLOBAL_MESSAGE_INPUT
local v14 = v_u_12.Frame.TextLabel.Frame.CLOSE_BUTTON
local v15 = v_u_12.Frame.Frame1.Frame.SUBMIT_BUTTON
v10(v14).Activated:Connect(function()
	-- upvalues: (copy) v_u_8
	v_u_8:Destroy()
end)
v10(v15).Activated:Connect(function()
	-- upvalues: (copy) v_u_11, (copy) v_u_13
	v_u_11:QueueChatMessage(v_u_13.Text)
end)
local v_u_16 = v_u_3:GetMouseLocation()
v2.RenderStepped:Connect(function()
	-- upvalues: (copy) v_u_3, (ref) v_u_16, (copy) v_u_5, (copy) v_u_7, (copy) v_u_12
	local v17 = v_u_3:GetMouseLocation()
	if v17 ~= v_u_16 then
		local v18 = v17.X - v_u_16.X
		local v19 = v17.Y - v_u_16.Y
		v_u_16 = v17
		if v_u_3:IsMouseButtonPressed(Enum.UserInputType.MouseButton1) then
			local v20 = v_u_3:GetMouseLocation() - v_u_5:GetGuiInset()
			local v21 = v_u_7:GetGuiObjectsAtPosition(v20.X, v20.Y)
			if table.find(v21, v_u_12) then
				v_u_12.Position = v_u_12.Position + UDim2.fromOffset(v18, v19)
			end
		end
	end
end)
return {}