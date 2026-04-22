local v_u_1 = game:GetService("GamepadService")
local v_u_2 = game:GetService("GuiService")
local v3 = game:GetService("ReplicatedStorage")
local v_u_4 = game:GetService("UserInputService")
local v_u_5 = require(v3.Modules.DeviceController)
local v6 = v_u_4.GamepadEnabled and not (v_u_4.KeyboardEnabled or v_u_4.MouseEnabled) and true or false
local function v9()
	-- upvalues: (copy) v_u_4
	local v7 = script.Parent:FindFirstChildOfClass("UIListLayout")
	if v7 then
		local v8
		if v_u_4.PreferredInput == Enum.PreferredInput.Touch then
			v8 = UDim.new(0.035, 0)
		else
			v8 = UDim.new(0, 0)
		end
		v7.Padding = v8
	end
end
v_u_4:GetPropertyChangedSignal("PreferredInput"):Connect(v9)
task.spawn(v9)
if v6 == true then
	function upd()
		-- upvalues: (copy) v_u_1
		if #script.Parent:GetChildren() == 2 then
			v_u_1:DisableGamepadCursor()
		else
			v_u_1:EnableGamepadCursor(script.Parent:FindFirstChildWhichIsA("Frame"))
		end
	end
	script.Parent.ChildAdded:Connect(upd)
	script.Parent.ChildRemoved:Connect(upd)
end
local function v11(p_u_10)
	-- upvalues: (copy) v_u_5, (copy) v_u_2
	if p_u_10:IsA("Frame") then
		if p_u_10.Frame ~= nil then
			p_u_10.MouseEnter:Connect(function()
				-- upvalues: (ref) v_u_5, (ref) v_u_2, (copy) p_u_10
				if v_u_5:GetCurrentDevice() == "Gamepad" then
					v_u_2.SelectedObject = p_u_10.Frame.ImageButton
				end
			end)
			p_u_10.Frame.ImageButton.Selectable = false
		end
	else
		return
	end
end
script.Parent.ChildAdded:Connect(v11)
for _, v12 in script.Parent:GetChildren() do
	task.spawn(v11, v12)
end