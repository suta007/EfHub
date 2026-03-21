local v1 = game:GetService("UserInputService")
local v2 = game:GetService("ReplicatedStorage")
local v3 = game:GetService("RunService")
local v_u_4 = require(v2.Modules.GetMouseToWorld)
local v_u_5 = script:WaitForChild("Arrows")
local v_u_6 = v_u_5.Attachment1
local v_u_7 = v_u_5.Attachment2
local v_u_8 = {
	["Handler"] = nil,
	["CurrentTarget"] = nil,
	["LastHover"] = nil
}
local v_u_12 = {
	["Plant"] = function(p9)
		local v10 = p9:FindFirstAncestorWhichIsA("Model")
		if v10 then
			local v11 = v10:FindFirstChild("Grow")
			if v11 then
				if v11:FindFirstChild("Age") then
					return v10
				end
			end
		else
			return
		end
	end
}
local v_u_13 = Instance.new("Highlight")
v_u_13.FillTransparency = 1
local v_u_14 = false
function v_u_8.Cancel(_)
	-- upvalues: (copy) v_u_8, (ref) v_u_14, (copy) v_u_13, (copy) v_u_5
	v_u_8.CurrentTarget = nil
	if v_u_14 then
		return
	else
		local v15 = v_u_8.Handler
		if v15 then
			v15.OnUnhover(v_u_8.LastHover)
			if v_u_8.CurrentTarget then
				v15.OnConfirm(v_u_8.CurrentTarget)
				v_u_8.LastHover = nil
				v_u_8.CurrentTarget = nil
				v_u_8.Handler = nil
				v_u_13.Parent = nil
				v_u_5.Parent = script
			else
				v15.OnCancelled()
				v_u_8.LastHover = nil
				v_u_8.CurrentTarget = nil
				v_u_8.Handler = nil
				v_u_13.Parent = nil
				v_u_5.Parent = script
			end
		else
			return
		end
	end
end
function v_u_8.CreateTargetingHandler(_, p16)
	-- upvalues: (ref) v_u_14, (copy) v_u_8, (copy) v_u_13, (copy) v_u_5
	v_u_14 = true
	v_u_8.LastHover = nil
	v_u_8.CurrentTarget = nil
	v_u_8.Handler = nil
	v_u_13.Parent = nil
	v_u_5.Parent = script
	v_u_8.Handler = p16
	p16.OnHover = p16.OnHover or function() end
	p16.OnUnhover = p16.OnUnhover or function() end
	p16.OnCancelled = p16.OnCancelled or function() end
	p16.OnConfirm = p16.OnConfirm or function() end
	task.delay(0.5, function()
		-- upvalues: (ref) v_u_14
		v_u_14 = false
	end)
end
v3.RenderStepped:Connect(function()
	-- upvalues: (copy) v_u_8, (copy) v_u_12, (copy) v_u_4, (copy) v_u_5, (copy) v_u_13, (copy) v_u_6, (copy) v_u_7
	local v17 = v_u_8.Handler
	if v17 then
		local v18 = v_u_12[v17.TargetType]
		if v18 then
			local v19 = v_u_4(RaycastParams.new(), 100)
			local v20
			if v19 then
				v20 = v19.Instance
			else
				v20 = v19
			end
			local v21
			if v20 then
				v21 = v18(v20)
			else
				v21 = v20
			end
			v_u_8.CurrentTarget = v21
			v_u_5.Parent = v20 and workspace or script
			v_u_13.Adornee = v21
			v_u_13.Parent = v21
			if v19 then
				v_u_6.WorldCFrame = v17.Targeter:GetPivot()
				v_u_7.WorldCFrame = v21 and v21:GetPivot() or CFrame.new(v19.Position)
			end
			local v22 = v_u_8.LastHover
			if v22 ~= v21 then
				v17.OnUnhover(v22)
				v17.OnHover(v21)
			end
		else
			return
		end
	else
		return
	end
end)
local v_u_23 = {
	[Enum.UserInputType.MouseButton1] = {}
}
local v_u_24 = {}
local v26 = { function(_)
		-- upvalues: (ref) v_u_14, (copy) v_u_8, (copy) v_u_13, (copy) v_u_5
		if v_u_14 then
			return
		else
			local v25 = v_u_8.Handler
			if v25 then
				v25.OnUnhover(v_u_8.LastHover)
				if v_u_8.CurrentTarget then
					v25.OnConfirm(v_u_8.CurrentTarget)
					v_u_8.LastHover = nil
					v_u_8.CurrentTarget = nil
					v_u_8.Handler = nil
					v_u_13.Parent = nil
					v_u_5.Parent = script
				else
					v25.OnCancelled()
					v_u_8.LastHover = nil
					v_u_8.CurrentTarget = nil
					v_u_8.Handler = nil
					v_u_13.Parent = nil
					v_u_5.Parent = script
				end
			else
				return
			end
		end
	end }
v_u_24[Enum.UserInputType.MouseButton1] = v26
v1.InputBegan:Connect(function(p_u_27, _)
	-- upvalues: (copy) v_u_23
	local v28 = v_u_23[p_u_27.KeyCode] or v_u_23[p_u_27.UserInputType]
	if v28 then
		for _, v_u_29 in v28 do
			task.spawn(function()
				-- upvalues: (copy) v_u_29, (copy) p_u_27
				v_u_29(p_u_27)
			end)
		end
	end
end)
v1.InputEnded:Connect(function(p_u_30, _)
	-- upvalues: (copy) v_u_24
	local v31 = v_u_24[p_u_30.KeyCode] or v_u_24[p_u_30.UserInputType]
	if v31 then
		for _, v_u_32 in v31 do
			task.spawn(function()
				-- upvalues: (copy) v_u_32, (copy) p_u_30
				v_u_32(p_u_30)
			end)
		end
	end
end)
v1.TouchTap:Connect(function()
	-- upvalues: (ref) v_u_14, (copy) v_u_8, (copy) v_u_13, (copy) v_u_5
	if v_u_14 then
		return
	else
		local v33 = v_u_8.Handler
		if v33 then
			v33.OnUnhover(v_u_8.LastHover)
			if v_u_8.CurrentTarget then
				v33.OnConfirm(v_u_8.CurrentTarget)
				v_u_8.LastHover = nil
				v_u_8.CurrentTarget = nil
				v_u_8.Handler = nil
				v_u_13.Parent = nil
				v_u_5.Parent = script
			else
				v33.OnCancelled()
				v_u_8.LastHover = nil
				v_u_8.CurrentTarget = nil
				v_u_8.Handler = nil
				v_u_13.Parent = nil
				v_u_5.Parent = script
			end
		else
			return
		end
	end
end)
return v_u_8