local v1 = game:GetService("UserInputService")
if v1.TouchEnabled == true then
	script.Parent.Visible = false
	return
elseif v1.GamepadEnabled == true then
	script.Parent.PC.Visible = false
	script.Parent.Console.Visible = true
	script.Parent.Visible = true
else
	script.Parent.PC.Visible = true
	script.Parent.Console.Visible = false
	script.Parent.Visible = true
end