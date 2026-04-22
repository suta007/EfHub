game:GetService("Players")
local v_u_1 = game:GetService("GuiService")
local v_u_2 = game:GetService("UserInputService")
UserSettings():GetService("UserGameSettings")
local v3 = script.Parent.Parent:WaitForChild("CommonUtils")
local v_u_4 = require(v3:WaitForChild("FlagUtil")).getUserFlag("UserPlayerScriptsCanUseLCC")
local v_u_5
if v_u_4 then
	v_u_5 = require(script.Parent:WaitForChild("AvatarAbilitiesInterface"))
else
	v_u_5 = nil
end
local v_u_6 = require(script.Parent:WaitForChild("BaseCharacterController"))
local v_u_7 = setmetatable({}, v_u_6)
v_u_7.__index = v_u_7
function v_u_7.new()
	-- upvalues: (copy) v_u_6, (copy) v_u_7
	local v8 = v_u_6.new()
	local v9 = v_u_7
	local v10 = setmetatable(v8, v9)
	v10.isFollowStick = false
	v10.thumbstickFrame = nil
	v10.moveTouchObject = nil
	v10.onTouchMovedConn = nil
	v10.onTouchEndedConn = nil
	v10.screenPos = nil
	v10.stickImage = nil
	v10.thumbstickSize = nil
	return v10
end
function v_u_7.Enable(p11, p12, p13)
	if p12 == nil then
		return false
	end
	local v14 = p12 and true or false
	if p11.enabled == v14 then
		return true
	end
	p11.moveVector = Vector3.new(0, 0, 0)
	p11.isJumping = false
	if v14 then
		if not p11.thumbstickFrame then
			p11:Create(p13)
		end
		p11.thumbstickFrame.Visible = true
	else
		p11.thumbstickFrame.Visible = false
		p11:OnInputEnded()
	end
	p11.enabled = v14
end
function v_u_7.OnInputEnded(p15)
	p15.thumbstickFrame.Position = p15.screenPos
	p15.stickImage.Position = UDim2.new(0, p15.thumbstickFrame.Size.X.Offset / 2 - p15.thumbstickSize / 4, 0, p15.thumbstickFrame.Size.Y.Offset / 2 - p15.thumbstickSize / 4)
	p15.moveVector = Vector3.new(0, 0, 0)
	p15.isJumping = false
	p15.thumbstickFrame.Position = p15.screenPos
	p15.moveTouchObject = nil
end
function v_u_7.Create(p_u_16, p_u_17)
	-- upvalues: (copy) v_u_4, (ref) v_u_5, (copy) v_u_2, (copy) v_u_1
	if p_u_16.thumbstickFrame then
		p_u_16.thumbstickFrame:Destroy()
		p_u_16.thumbstickFrame = nil
		if p_u_16.onTouchMovedConn then
			p_u_16.onTouchMovedConn:Disconnect()
			p_u_16.onTouchMovedConn = nil
		end
		if p_u_16.onTouchEndedConn then
			p_u_16.onTouchEndedConn:Disconnect()
			p_u_16.onTouchEndedConn = nil
		end
		if p_u_16.absoluteSizeChangedConn then
			p_u_16.absoluteSizeChangedConn:Disconnect()
			p_u_16.absoluteSizeChangedConn = nil
		end
		if v_u_4 and p_u_16.avatarAbilitiesEnabledChangedConn then
			p_u_16.avatarAbilitiesEnabledChangedConn:Disconnect()
			p_u_16.avatarAbilitiesEnabledChangedConn = nil
		end
	end
	p_u_16.thumbstickFrame = Instance.new("Frame")
	p_u_16.thumbstickFrame.Name = "ThumbstickFrame"
	p_u_16.thumbstickFrame.Active = true
	p_u_16.thumbstickFrame.Visible = false
	p_u_16.thumbstickFrame.BackgroundTransparency = 1
	local v_u_18 = Instance.new("ImageLabel")
	v_u_18.Name = "OuterImage"
	v_u_18.Image = "rbxasset://textures/ui/TouchControlsSheet.png"
	v_u_18.ImageRectOffset = Vector2.new()
	v_u_18.ImageRectSize = Vector2.new(220, 220)
	v_u_18.BackgroundTransparency = 1
	v_u_18.Position = UDim2.new(0, 0, 0, 0)
	p_u_16.stickImage = Instance.new("ImageLabel")
	p_u_16.stickImage.Name = "StickImage"
	p_u_16.stickImage.Image = "rbxasset://textures/ui/TouchControlsSheet.png"
	p_u_16.stickImage.ImageRectOffset = Vector2.new(220, 0)
	p_u_16.stickImage.ImageRectSize = Vector2.new(111, 111)
	p_u_16.stickImage.BackgroundTransparency = 1
	p_u_16.stickImage.ZIndex = 2
	local function v23()
		-- upvalues: (copy) p_u_17, (ref) v_u_4, (ref) v_u_5, (copy) p_u_16, (copy) v_u_18
		local v19 = p_u_17.AbsoluteSize.X
		local v20 = p_u_17.AbsoluteSize.Y
		local v21 = math.min(v19, v20) <= 500
		if v_u_4 and v_u_5:isEnabled() then
			local v22 = v21 and 64 or 88
			p_u_16.thumbstickSize = v21 and 72 or 120
			p_u_16.screenPos = UDim2.new(0, v22, 1, -p_u_16.thumbstickSize - v22)
		else
			p_u_16.thumbstickSize = v21 and 70 or 120
			p_u_16.screenPos = v21 and UDim2.new(0, p_u_16.thumbstickSize / 2 - 10, 1, -p_u_16.thumbstickSize - 20) or UDim2.new(0, p_u_16.thumbstickSize / 2, 1, -p_u_16.thumbstickSize * 1.75)
		end
		p_u_16.thumbstickFrame.Size = UDim2.new(0, p_u_16.thumbstickSize, 0, p_u_16.thumbstickSize)
		p_u_16.thumbstickFrame.Position = p_u_16.screenPos
		v_u_18.Size = UDim2.new(0, p_u_16.thumbstickSize, 0, p_u_16.thumbstickSize)
		p_u_16.stickImage.Size = UDim2.new(0, p_u_16.thumbstickSize / 2, 0, p_u_16.thumbstickSize / 2)
		p_u_16.stickImage.Position = UDim2.new(0, p_u_16.thumbstickSize / 2 - p_u_16.thumbstickSize / 4, 0, p_u_16.thumbstickSize / 2 - p_u_16.thumbstickSize / 4)
	end
	v23()
	p_u_16.absoluteSizeChangedConn = p_u_17:GetPropertyChangedSignal("AbsoluteSize"):Connect(v23)
	if v_u_4 then
		p_u_16.avatarAbilitiesEnabledChangedConn = v_u_5:GetEnabledChangedSignal():Connect(v23)
	end
	v_u_18.Parent = p_u_16.thumbstickFrame
	p_u_16.stickImage.Parent = p_u_16.thumbstickFrame
	local v_u_24 = nil
	local function v_u_31(p25)
		-- upvalues: (ref) v_u_24, (copy) p_u_16
		local v26 = Vector2.new(p25.X - v_u_24.X, p25.Y - v_u_24.Y)
		local v27 = v26.magnitude
		local v28 = p_u_16.thumbstickFrame.AbsoluteSize.X / 2
		if p_u_16.isFollowStick and v28 < v27 then
			local v29 = v26.unit * v28
			p_u_16.thumbstickFrame.Position = UDim2.new(0, p25.X - p_u_16.thumbstickFrame.AbsoluteSize.X / 2 - v29.X, 0, p25.Y - p_u_16.thumbstickFrame.AbsoluteSize.Y / 2 - v29.Y)
		else
			local v30 = math.min(v27, v28)
			v26 = v26.unit * v30
		end
		p_u_16.stickImage.Position = UDim2.new(0, v26.X + p_u_16.stickImage.AbsoluteSize.X / 2, 0, v26.Y + p_u_16.stickImage.AbsoluteSize.Y / 2)
	end
	p_u_16.thumbstickFrame.InputBegan:Connect(function(p32)
		-- upvalues: (copy) p_u_16, (ref) v_u_24
		if not p_u_16.moveTouchObject and (p32.UserInputType == Enum.UserInputType.Touch and p32.UserInputState == Enum.UserInputState.Begin) then
			p_u_16.moveTouchObject = p32
			p_u_16.thumbstickFrame.Position = UDim2.new(0, p32.Position.X - p_u_16.thumbstickFrame.Size.X.Offset / 2, 0, p32.Position.Y - p_u_16.thumbstickFrame.Size.Y.Offset / 2)
			v_u_24 = Vector2.new(p_u_16.thumbstickFrame.AbsolutePosition.X + p_u_16.thumbstickFrame.AbsoluteSize.X / 2, p_u_16.thumbstickFrame.AbsolutePosition.Y + p_u_16.thumbstickFrame.AbsoluteSize.Y / 2)
			Vector2.new(p32.Position.X - v_u_24.X, p32.Position.Y - v_u_24.Y)
		end
	end)
	p_u_16.onTouchMovedConn = v_u_2.TouchMoved:Connect(function(p33, _)
		-- upvalues: (copy) p_u_16, (ref) v_u_24, (copy) v_u_31
		if p33 == p_u_16.moveTouchObject then
			v_u_24 = Vector2.new(p_u_16.thumbstickFrame.AbsolutePosition.X + p_u_16.thumbstickFrame.AbsoluteSize.X / 2, p_u_16.thumbstickFrame.AbsolutePosition.Y + p_u_16.thumbstickFrame.AbsoluteSize.Y / 2)
			local v34 = Vector2.new(p33.Position.X - v_u_24.X, p33.Position.Y - v_u_24.Y) / (p_u_16.thumbstickSize / 2)
			local v35 = v34.magnitude
			local v36
			if v35 < 0.05 then
				v36 = Vector3.new()
			else
				local v37 = v34.unit
				local v38 = (v35 - 0.05) / 0.95
				local v39 = v37 * math.min(1, v38)
				local v40 = v39.X
				local v41 = v39.Y
				v36 = Vector3.new(v40, 0, v41)
			end
			p_u_16.moveVector = v36
			v_u_31(p33.Position)
		end
	end)
	p_u_16.onTouchEndedConn = v_u_2.TouchEnded:Connect(function(p42, _)
		-- upvalues: (copy) p_u_16
		if p42 == p_u_16.moveTouchObject then
			p_u_16:OnInputEnded()
		end
	end)
	v_u_1.MenuOpened:Connect(function()
		-- upvalues: (copy) p_u_16
		if p_u_16.moveTouchObject then
			p_u_16:OnInputEnded()
		end
	end)
	p_u_16.thumbstickFrame.Parent = p_u_17
end
return v_u_7