local v1 = {}
local v2 = game:GetService("ReplicatedStorage")
local v_u_3 = game:GetService("TweenService")
local v4 = game:GetService("Players")
local v_u_5 = game:GetService("Debris")
local v_u_6 = v2.GameEvents.TradeEvents
local v_u_7 = require(v2.Modules.SetupButton)
local v_u_8 = require(v2.Modules.Spring)
local v_u_9 = v4.LocalPlayer:WaitForChild("PlayerGui"):WaitForChild("Gift_Notification")
function v1.SendRequest(_, p10)
	-- upvalues: (copy) v_u_6
	v_u_6.SendRequest:FireServer(p10)
end
local function v_u_13(p11)
	-- upvalues: (copy) v_u_8, (copy) v_u_5
	if p11 and not p11:HasTag("_fadingOut") then
		p11:AddTag("_fadingOut")
		local v12 = p11.Wrapper.Canvas
		v_u_8.target(p11.Wrapper.DropShadow, 1, 3, {
			["ImageTransparency"] = 1
		})
		v_u_8.target(v12.UIStroke, 1, 3, {
			["Transparency"] = 1
		})
		v_u_8.target(v12, 1, 3, {
			["Position"] = UDim2.fromScale(0.65, 0.5),
			["GroupTransparency"] = 1
		})
		v_u_5:AddItem(p11, 1)
	end
end
v_u_6.SendRequest.OnClientEvent:Connect(function(p_u_14, p15, p16)
	-- upvalues: (copy) v_u_3, (copy) v_u_8, (copy) v_u_13, (copy) v_u_7, (copy) v_u_6, (copy) v_u_9
	local v17 = p16 - workspace:GetServerTimeNow()
	local v_u_18 = script.TradeRequest:Clone()
	local v19 = v_u_18.Wrapper.Canvas
	local v20 = v19.Segment.Main
	local v21 = v_u_18.Wrapper.DropShadow
	local v22 = v_u_18.Wrapper.Canvas.Segment.Main.Profile.Holder.PLAYER_IMAGE
	v_u_18.Wrapper.Canvas.Segment.Main.Timeout.Size = UDim2.fromScale(0, 1)
	v22.Image = ("rbxthumb://type=AvatarHeadShot&id=%*&w=180&h=180"):format(p15.UserId)
	v20.SENDER_NAME.Text = p15.Name
	v20.SENDER_NAME_SHADOW.Text = p15.Name
	v19.GroupTransparency = 1
	v_u_18.Wrapper.Position = UDim2.fromScale(0.65, 0.5)
	v19.UIStroke.Transparency = 1
	v20.Timeout.Size = UDim2.fromScale(1, 0.05)
	v21.ImageTransparency = 1
	local v23 = v20.Timeout.BackgroundColor3
	v_u_3:Create(v20.Timeout, TweenInfo.new(v17, Enum.EasingStyle.Exponential), {
		["BackgroundColor3"] = v23:Lerp(Color3.new(1, 0, 0), 0.75),
		["Size"] = UDim2.fromScale(0, 0.05)
	}):Play()
	v_u_8.target(v21, 1, 3, {
		["ImageTransparency"] = 0.6
	})
	v_u_8.target(v19.UIStroke, 1, 3, {
		["Transparency"] = 0
	})
	v_u_8.target(v19, 1, 3, {
		["GroupTransparency"] = 0
	})
	v_u_8.target(v_u_18.Wrapper, 1, 3, {
		["Position"] = UDim2.fromScale(0.5, 0.5)
	})
	task.delay(v17, function()
		-- upvalues: (ref) v_u_13, (copy) v_u_18
		v_u_13(v_u_18)
	end)
	v_u_7({
		["instance"] = v_u_18.Wrapper.Canvas.Segment.Buttons.ACCEPT_BUTTON.Main.SENSOR,
		["onclick"] = function()
			-- upvalues: (ref) v_u_13, (copy) v_u_18, (ref) v_u_6, (copy) p_u_14
			v_u_13(v_u_18)
			v_u_6.RespondRequest:FireServer(p_u_14, true)
		end
	})
	v_u_7({
		["instance"] = v_u_18.Wrapper.Canvas.Segment.Buttons.DECLINE_BUTTON.Main.SENSOR,
		["onclick"] = function()
			-- upvalues: (ref) v_u_13, (copy) v_u_18, (ref) v_u_6, (copy) p_u_14
			v_u_13(v_u_18)
			v_u_6.RespondRequest:FireServer(p_u_14, false)
		end
	})
	v_u_18.Parent = v_u_9.Frame
end)
return v1