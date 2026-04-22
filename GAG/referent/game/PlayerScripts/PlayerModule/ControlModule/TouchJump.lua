game:GetService("Players")
local v_u_1 = game:GetService("GuiService")
local v2 = script.Parent.Parent:WaitForChild("CommonUtils")
local v_u_3 = require(v2:WaitForChild("ConnectionUtil"))
local v_u_4 = require(v2:WaitForChild("CharacterUtil"))
local v_u_5 = require(v2:WaitForChild("FlagUtil")).getUserFlag("UserPlayerScriptsCanUseLCC")
local v_u_6
if v_u_5 then
	v_u_6 = require(script.Parent:WaitForChild("AvatarAbilitiesInterface"))
else
	v_u_6 = nil
end
local v_u_7 = { "rbxasset://textures/ui/Input/JumpButtonRegular.png", "rbxasset://textures/ui/Input/JumpButtonPressed.png" }
local v_u_8 = {
	["HUMANOID_STATE_ENABLED_CHANGED"] = "HUMANOID_STATE_ENABLED_CHANGED",
	["HUMANOID_JUMP_POWER"] = "HUMANOID_JUMP_POWER",
	["HUMANOID_JUMP_HEIGHT"] = "HUMANOID_JUMP_HEIGHT",
	["HUMANOID"] = "HUMANOID",
	["JUMP_INPUT_ENDED"] = "JUMP_INPUT_ENDED",
	["MENU_OPENED"] = "MENU_OPENED"
}
local v_u_9 = require(script.Parent:WaitForChild("BaseCharacterController"))
local v_u_10 = setmetatable({}, v_u_9)
v_u_10.__index = v_u_10
function v_u_10.new()
	-- upvalues: (copy) v_u_9, (copy) v_u_10, (copy) v_u_3
	local v11 = v_u_9.new()
	local v12 = v_u_10
	local v13 = setmetatable(v11, v12)
	v13.parentUIFrame = nil
	v13.jumpButton = nil
	v13.externallyEnabled = false
	v13.isJumping = false
	v13._active = false
	v13._connectionUtil = v_u_3.new()
	return v13
end
function v_u_10._reset(p14)
	-- upvalues: (copy) v_u_5, (ref) v_u_6, (copy) v_u_7
	p14.isJumping = false
	p14.touchObject = nil
	if p14.jumpButton then
		if v_u_5 and v_u_6:isEnabled() then
			p14.jumpButton.Image = v_u_7[1]
			return
		end
		p14.jumpButton.ImageRectOffset = Vector2.new(1, 146)
	end
end
function v_u_10.EnableButton(p_u_15, p16)
	-- upvalues: (copy) v_u_8, (copy) v_u_1
	if p16 ~= p_u_15._active then
		if p16 then
			if not p_u_15.jumpButton then
				p_u_15:Create()
			end
			p_u_15.jumpButton.Visible = true
			p_u_15._connectionUtil:trackConnection(v_u_8.JUMP_INPUT_ENDED, p_u_15.jumpButton.InputEnded:Connect(function(p17)
				-- upvalues: (copy) p_u_15
				if p17 == p_u_15.touchObject then
					p_u_15:_reset()
				end
			end))
			p_u_15._connectionUtil:trackConnection(v_u_8.MENU_OPENED, v_u_1.MenuOpened:Connect(function()
				-- upvalues: (copy) p_u_15
				if p_u_15.touchObject then
					p_u_15:_reset()
				end
			end))
		else
			if p_u_15.jumpButton then
				p_u_15.jumpButton.Visible = false
			end
			p_u_15._connectionUtil:disconnect(v_u_8.JUMP_INPUT_ENDED)
			p_u_15._connectionUtil:disconnect(v_u_8.MENU_OPENED)
		end
		p_u_15:_reset()
		p_u_15._active = p16
	end
end
function v_u_10.UpdateEnabled(p18)
	-- upvalues: (copy) v_u_4
	local v19 = v_u_4.getChild("Humanoid", "Humanoid")
	if v19 and p18.externallyEnabled and (v19.UseJumpPower and v19.JumpPower > 0 or not v19.UseJumpPower and v19.JumpHeight > 0) and v19:GetStateEnabled(Enum.HumanoidStateType.Jumping) then
		p18:EnableButton(true)
	else
		p18:EnableButton(false)
	end
end
function v_u_10._setupConfigurations(p_u_20)
	-- upvalues: (copy) v_u_4, (copy) v_u_8
	local function v_u_21()
		-- upvalues: (copy) p_u_20
		p_u_20:UpdateEnabled()
	end
	local v25 = v_u_4.onChild("Humanoid", "Humanoid", function(p22)
		-- upvalues: (copy) p_u_20, (ref) v_u_8, (copy) v_u_21
		p_u_20:UpdateEnabled()
		p_u_20:_reset()
		p_u_20._connectionUtil:trackConnection(v_u_8.HUMANOID_JUMP_POWER, p22:GetPropertyChangedSignal("JumpPower"):Connect(v_u_21))
		p_u_20._connectionUtil:trackConnection(v_u_8.HUMANOID_JUMP_HEIGHT, p22:GetPropertyChangedSignal("JumpHeight"):Connect(v_u_21))
		p_u_20._connectionUtil:trackConnection(v_u_8.HUMANOID_STATE_ENABLED_CHANGED, p22.StateEnabledChanged:Connect(function(p23, p24)
			-- upvalues: (ref) p_u_20
			if p23 == Enum.HumanoidStateType.Jumping and p24 ~= p_u_20._active then
				p_u_20:UpdateEnabled()
			end
		end))
	end)
	p_u_20._connectionUtil:trackConnection(v_u_8.HUMANOID, v25)
end
function v_u_10.Enable(p26, p27, p28)
	if p28 then
		p26.parentUIFrame = p28
	end
	if p26.externallyEnabled == p27 then
		return
	else
		p26.externallyEnabled = p27
		p26:UpdateEnabled()
		if p27 then
			p26:_setupConfigurations()
		else
			p26._connectionUtil:disconnectAll()
		end
	end
end
function v_u_10.Create(p_u_29)
	-- upvalues: (copy) v_u_5, (ref) v_u_6, (copy) v_u_7
	if p_u_29.parentUIFrame then
		if p_u_29.jumpButton then
			p_u_29.jumpButton:Destroy()
			p_u_29.jumpButton = nil
		end
		if p_u_29.absoluteSizeChangedConn then
			p_u_29.absoluteSizeChangedConn:Disconnect()
			p_u_29.absoluteSizeChangedConn = nil
		end
		if v_u_5 and p_u_29.avatarAbilitiesEnabledChangedConn then
			p_u_29.avatarAbilitiesEnabledChangedConn:Disconnect()
			p_u_29.avatarAbilitiesEnabledChangedConn = nil
		end
		p_u_29.jumpButton = Instance.new("ImageButton")
		p_u_29.jumpButton.Name = "JumpButton"
		p_u_29.jumpButton.Visible = false
		p_u_29.jumpButton.BackgroundTransparency = 1
		if v_u_5 and v_u_6:isEnabled() then
			p_u_29.jumpButton.Image = v_u_7[1]
		else
			p_u_29.jumpButton.Image = "rbxasset://textures/ui/Input/TouchControlsSheetV2.png"
			p_u_29.jumpButton.ImageRectOffset = Vector2.new(1, 146)
			p_u_29.jumpButton.ImageRectSize = Vector2.new(144, 144)
		end
		local function v36()
			-- upvalues: (copy) p_u_29, (ref) v_u_5, (ref) v_u_6, (ref) v_u_7
			local v30 = p_u_29.parentUIFrame.AbsoluteSize.x
			local v31 = p_u_29.parentUIFrame.AbsoluteSize.y
			local v32 = math.min(v30, v31) <= 500
			if v_u_5 and v_u_6:isEnabled() then
				local v33 = v32 and 72 or 120
				local v34 = -v33 - (v32 and 64 or 88)
				p_u_29.jumpButton.Image = v_u_7[1]
				p_u_29.jumpButton.ImageRectOffset = Vector2.new(0, 0)
				p_u_29.jumpButton.ImageRectSize = Vector2.new(0, 0)
				p_u_29.jumpButton.Size = UDim2.new(0, v33, 0, v33)
				p_u_29.jumpButton.Position = UDim2.new(1, v34, 1, v34)
			else
				local v35 = v32 and 70 or 120
				if v_u_5 then
					p_u_29.jumpButton.Image = "rbxasset://textures/ui/Input/TouchControlsSheetV2.png"
					p_u_29.jumpButton.ImageRectOffset = Vector2.new(1, 146)
					p_u_29.jumpButton.ImageRectSize = Vector2.new(144, 144)
				end
				p_u_29.jumpButton.Size = UDim2.new(0, v35, 0, v35)
				p_u_29.jumpButton.Position = v32 and UDim2.new(1, -(v35 * 1.5 - 10), 1, -v35 - 20) or UDim2.new(1, -(v35 * 1.5 - 10), 1, -v35 * 1.75)
			end
		end
		v36()
		p_u_29.absoluteSizeChangedConn = p_u_29.parentUIFrame:GetPropertyChangedSignal("AbsoluteSize"):Connect(v36)
		if v_u_5 then
			p_u_29.avatarAbilitiesEnabledChangedConn = v_u_6:GetEnabledChangedSignal():Connect(v36)
		end
		p_u_29.touchObject = nil
		p_u_29.jumpButton.InputBegan:connect(function(p37)
			-- upvalues: (copy) p_u_29, (ref) v_u_5, (ref) v_u_6, (ref) v_u_7
			if not p_u_29.touchObject and (p37.UserInputType == Enum.UserInputType.Touch and p37.UserInputState == Enum.UserInputState.Begin) then
				p_u_29.touchObject = p37
				if v_u_5 and v_u_6:isEnabled() then
					p_u_29.jumpButton.Image = v_u_7[2]
				else
					p_u_29.jumpButton.ImageRectOffset = Vector2.new(146, 146)
				end
				p_u_29.isJumping = true
			end
		end)
		p_u_29.jumpButton.Parent = p_u_29.parentUIFrame
	end
end
return v_u_10