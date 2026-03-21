local v1 = {}
game:GetService("RunService")
local v_u_2 = game.ReplicatedStorage.Gift_Notification
function v1.Gift(p3, p4, p5, _, p6)
	-- upvalues: (copy) v_u_2
	if not workspace:GetAttribute("InTutorial") then
		print(p3, p4)
		local v7 = v_u_2:Clone()
		if game:GetService("UserInputService").PreferredInput == Enum.PreferredInput.Touch then
			local v8 = Instance.new("UIScale")
			v8.Scale = 1.3
			v8.Parent = v7
		end
		v7.Parent = p3.PlayerGui.Gift_Notification.Frame
		v7.Holder.TextLabel.Text = p5.Name
		v7.Holder.Tool_OBJ.Value = p5
		v7.Holder.String_OF.Value = p6
		v7.Holder.PLR_OBJ.Value = p4
		v7.Holder.PLR_String.Value = p4.Name
	end
end
return v1