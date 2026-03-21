local v_u_1 = {
	["Idle"] = 0,
	["Animating"] = 1
}
local v_u_2 = {
	["In"] = UDim2.new(0.0008, 0, 0.0008, 0),
	["Out"] = UDim2.new(3, 0, 3, 0)
}
function TweenGUI(p3, p4)
	-- upvalues: (copy) v_u_2
	if p3 == "Close" then
		p4:TweenSize(v_u_2.In, Enum.EasingDirection.In, Enum.EasingStyle.Linear, 0.5)
	elseif p3 == "Open" then
		p4:TweenSize(v_u_2.Out, Enum.EasingDirection.Out, Enum.EasingStyle.Linear, 0.5)
	end
end
local v_u_5 = setmetatable({}, {
	["__tostring"] = function()
		return "CircularTransition"
	end
})
v_u_5.__index = v_u_5
function v_u_5.new(...)
	-- upvalues: (ref) v_u_5
	local v6 = v_u_5
	local v7 = setmetatable({}, v6)
	return v7:constructor(...) or v7
end
function v_u_5.constructor(p8, ...)
	-- upvalues: (copy) v_u_1
	p8.screenGUI = script.Transition:Clone()
	p8.State = ""
	p8.screenGUI.Parent = game.Players.LocalPlayer.PlayerGui
	p8.screenGUI.Enabled = false
	TweenGUI("Open", p8.screenGUI.Main)
	wait(1)
	p8.State = v_u_1.Idle
end
function v_u_5.Close(p9)
	-- upvalues: (copy) v_u_1
	if p9.State ~= v_u_1.Animating then
		p9.State = v_u_1.Animating
		p9.screenGUI.Enabled = true
		TweenGUI("Close", p9.screenGUI.Main)
		p9.State = v_u_1.Idle
	end
end
function v_u_5.Open(p_u_10)
	-- upvalues: (copy) v_u_1
	if p_u_10.State ~= v_u_1.Animating then
		p_u_10.State = v_u_1.Animating
		task.spawn(function()
			-- upvalues: (copy) p_u_10
			TweenGUI("Open", p_u_10.screenGUI.Main)
			task.wait(0.5)
			p_u_10.screenGUI.Enabled = false
		end)
		p_u_10.State = v_u_1.Idle
	end
end
function v_u_5.Play(p11, p12)
	-- upvalues: (copy) v_u_1
	if p11.State ~= v_u_1.Animating then
		p11.State = v_u_1.Animating
		local v13 = (not p12 or p12 <= 0.5) and 0.6 or p12
		TweenGUI("Close", p11.screenGUI.Main)
		wait(v13)
		TweenGUI("Open", p11.screenGUI.Main)
		p11.State = v_u_1.Idle
	end
end
function v_u_5.SetColor(p14, p15)
	for _, v16 in pairs(p14.screenGUI:GetDescendants()) do
		if v16:IsA("Frame") then
			v16.BackgroundColor3 = p15
		elseif v16:IsA("ImageLabel") then
			v16.ImageColor3 = p15
		end
	end
end
function v_u_5.getScreenGui(p17)
	return p17.screenGUI
end
return v_u_5