local v1 = game:GetService("ReplicatedStorage")
local v2 = game:GetService("Players")
local v3 = v1.GameEvents
local v_u_4 = game:GetService("StarterGui")
local v5 = v3.FriendGiftEvent
local v_u_6 = {}
local v_u_7 = v2.LocalPlayer
local v_u_8 = v_u_7.PlayerGui:WaitForChild("Friend_Notification", 3)
local v_u_9 = v_u_8.Frame.Frame.Background.Holder.BodyLabel
local v10 = v_u_8.Frame.Frame.Background.Holder.Frame.Accept
local v11 = v_u_8.Frame.Frame.Background.Holder.Frame.Decline
local v_u_12 = {}
local v_u_13 = nil
function v_u_6.DismissCurrent(_)
	-- upvalues: (copy) v_u_12, (ref) v_u_13, (copy) v_u_9, (copy) v_u_8
	print("EVENT FIRED 1")
	local v14 = table.find(v_u_12, v_u_13)
	if v14 then
		table.remove(v_u_12, v14)
	end
	v_u_13 = nil
	if #v_u_12 > 0 then
		print("Trying to show next")
		print("EVENT FIRED 5")
		if not v_u_13 then
			local v15 = v_u_12[1]
			v_u_13 = v15
			print("EVENT FIRED 6")
			v_u_9.Text = ("Friend request from\n%*"):format(v15.Name)
			print("EVENT FIRED 7")
			v_u_8.Show_VAL.Value = true
		end
	else
		print("Hiding")
		v_u_8.Show_VAL.Value = false
		return
	end
end
function v_u_6.AcceptCurrent(_)
	-- upvalues: (ref) v_u_13, (copy) v_u_6, (copy) v_u_4
	print("EVENT FIRED 2")
	local v16 = v_u_13
	v_u_6:DismissCurrent()
	if v16 then
		v_u_4:SetCore("PromptSendFriendRequest", v16)
	end
end
v5.OnClientEvent:Connect(function(p17)
	-- upvalues: (copy) v_u_7, (copy) v_u_12, (ref) v_u_13, (copy) v_u_9, (copy) v_u_8
	print("EVENT FIRED 3")
	if p17:IsFriendsWith(v_u_7.UserId) then
		return
	else
		if not table.find(v_u_12, p17) then
			local v18 = v_u_12
			table.insert(v18, p17)
		end
		print("EVENT FIRED 5")
		if not v_u_13 then
			local v19 = v_u_12[1]
			v_u_13 = v19
			print("EVENT FIRED 6")
			v_u_9.Text = ("Friend request from\n%*"):format(v19.Name)
			print("EVENT FIRED 7")
			v_u_8.Show_VAL.Value = true
		end
	end
end)
v10.MouseButton1Click:Connect(function()
	-- upvalues: (copy) v_u_6
	v_u_6:AcceptCurrent()
end)
v11.MouseButton1Click:Connect(function()
	-- upvalues: (copy) v_u_6
	v_u_6:DismissCurrent()
end)
return v_u_6