local v1 = game:GetService("UserInputService")
local v2 = game:GetService("ReplicatedStorage")
local v3 = game:GetService("RunService")
local v_u_4 = require(v2.Modules.GetMouseToWorld)
local v_u_5 = require(v2.Modules.Utility.utils.Object.findFirstAncestorWithTag)
local v_u_6 = script:WaitForChild("Arrows")
local v_u_7 = v_u_6.Attachment1
local v_u_8 = v_u_6.Attachment2
local v_u_9 = {
	["Handler"] = nil,
	["CurrentTarget"] = nil,
	["LastHover"] = nil
}
local v_u_17 = {
	["Plant"] = function(p10)
		local v11 = p10:FindFirstAncestorWhichIsA("Model")
		if v11 then
			local v12 = v11:FindFirstChild("Grow")
			if v12 then
				if v12:FindFirstChild("Age") then
					return v11
				end
			end
		else
			return
		end
	end,
	["PetEgg"] = function(p13)
		-- upvalues: (copy) v_u_5
		local v14 = v_u_5(p13, "PetEggServer")
		if v14 then
			if v14:GetAttribute("OBJECT_TYPE") == "PetEgg" then
				return v14
			end
		end
	end,
	["Candy Blossom"] = function(p15)
		-- upvalues: (copy) v_u_5
		local v16 = v_u_5(p15, "Growable")
		if v16 then
			if v16.Name == "Candy Blossom" then
				return v16
			end
		end
	end
}
local v_u_18 = Instance.new("Highlight")
v_u_18.FillTransparency = 1
local v_u_19 = false
function v_u_9.Cancel(_)
	-- upvalues: (copy) v_u_9, (copy) v_u_18, (copy) v_u_6
	v_u_9.CurrentTarget = nil
	local v20 = v_u_9.Handler
	if v20 then
		v20.OnUnhover(v_u_9.LastHover)
		v20.OnCancelled()
	end
	v_u_9.LastHover = nil
	v_u_9.CurrentTarget = nil
	v_u_9.Handler = nil
	v_u_18.Parent = nil
	v_u_6.Parent = script
end
function v_u_9.CreateTargetingHandler(_, p21)
	-- upvalues: (ref) v_u_19, (copy) v_u_9, (copy) v_u_18, (copy) v_u_6
	v_u_19 = true
	v_u_9.LastHover = nil
	v_u_9.CurrentTarget = nil
	v_u_9.Handler = nil
	v_u_18.Parent = nil
	v_u_6.Parent = script
	v_u_9.Handler = p21
	p21.OnHover = p21.OnHover or function() end
	p21.OnUnhover = p21.OnUnhover or function() end
	p21.OnCancelled = p21.OnCancelled or function() end
	p21.OnConfirm = p21.OnConfirm or function() end
	p21.DontReset = p21.DontReset or false
	task.delay(0.5, function()
		-- upvalues: (ref) v_u_19
		v_u_19 = false
	end)
end
v3.RenderStepped:Connect(function()
	-- upvalues: (copy) v_u_9, (copy) v_u_17, (copy) v_u_4, (copy) v_u_6, (copy) v_u_18, (copy) v_u_7, (copy) v_u_8
	local v22 = v_u_9.Handler
	if v22 then
		local v23 = v_u_17[v22.TargetType]
		if v23 then
			local v24 = v_u_4(RaycastParams.new(), 100)
			local v25
			if v24 then
				v25 = v24.Instance
			else
				v25 = v24
			end
			local v26
			if v25 then
				v26 = v23(v25)
			else
				v26 = v25
			end
			v_u_9.CurrentTarget = v26
			v_u_6.Parent = v25 and workspace or script
			v_u_18.FillColor = v22.HighlightFillColor or Color3.fromRGB(255, 255, 255)
			v_u_18.FillTransparency = v22.HighlightFillTransparency or 1
			v_u_18.OutlineColor = v22.HighlightOutlineColor or Color3.fromRGB(255, 255, 255)
			v_u_18.Adornee = v26
			v_u_18.Parent = v26
			if v24 then
				v_u_7.WorldCFrame = v22.Targeter:GetPivot()
				v_u_8.WorldCFrame = v26 and v26:GetPivot() or CFrame.new(v24.Position)
			end
			local v27 = v_u_9.LastHover
			if v27 ~= v26 then
				v_u_9.LastHover = v26
				v22.OnUnhover(v27)
				v22.OnHover(v26)
			end
		else
			return
		end
	else
		return
	end
end)
local v_u_28 = {
	[Enum.UserInputType.MouseButton1] = {}
}
local v_u_29 = {}
local v31 = { function(_)
		-- upvalues: (ref) v_u_19, (copy) v_u_9, (copy) v_u_18, (copy) v_u_6
		if v_u_19 then
			return
		else
			local v30 = v_u_9.Handler
			if v30 then
				if v_u_9.CurrentTarget then
					v30.OnUnhover(v_u_9.LastHover)
					v30.OnConfirm(v_u_9.CurrentTarget)
					if not v30.DontReset then
						v_u_9.LastHover = nil
						v_u_9.CurrentTarget = nil
						v_u_9.Handler = nil
						v_u_18.Parent = nil
						v_u_6.Parent = script
					end
				end
			else
				return
			end
		end
	end }
v_u_29[Enum.UserInputType.MouseButton1] = v31
local v33 = { function(_)
		-- upvalues: (ref) v_u_19, (copy) v_u_9, (copy) v_u_18, (copy) v_u_6
		if v_u_19 then
			return
		else
			local v32 = v_u_9.Handler
			if v32 then
				if v_u_9.CurrentTarget then
					v32.OnUnhover(v_u_9.LastHover)
					v32.OnConfirm(v_u_9.CurrentTarget)
					if not v32.DontReset then
						v_u_9.LastHover = nil
						v_u_9.CurrentTarget = nil
						v_u_9.Handler = nil
						v_u_18.Parent = nil
						v_u_6.Parent = script
					end
				end
			else
				return
			end
		end
	end }
v_u_29[Enum.KeyCode.ButtonA] = v33
v1.InputBegan:Connect(function(p_u_34, _)
	-- upvalues: (copy) v_u_28
	local v35 = v_u_28[p_u_34.KeyCode] or v_u_28[p_u_34.UserInputType]
	if v35 then
		for _, v_u_36 in v35 do
			task.spawn(function()
				-- upvalues: (copy) v_u_36, (copy) p_u_34
				v_u_36(p_u_34)
			end)
		end
	end
end)
v1.InputEnded:Connect(function(p_u_37, _)
	-- upvalues: (copy) v_u_29
	local v38 = v_u_29[p_u_37.KeyCode] or v_u_29[p_u_37.UserInputType]
	if v38 then
		for _, v_u_39 in v38 do
			task.spawn(function()
				-- upvalues: (copy) v_u_39, (copy) p_u_37
				v_u_39(p_u_37)
			end)
		end
	end
end)
v1.TouchTap:Connect(function()
	-- upvalues: (ref) v_u_19, (copy) v_u_9, (copy) v_u_18, (copy) v_u_6
	if v_u_19 then
		return
	else
		local v40 = v_u_9.Handler
		if v40 then
			if v_u_9.CurrentTarget then
				v40.OnUnhover(v_u_9.LastHover)
				v40.OnConfirm(v_u_9.CurrentTarget)
				if not v40.DontReset then
					v_u_9.LastHover = nil
					v_u_9.CurrentTarget = nil
					v_u_9.Handler = nil
					v_u_18.Parent = nil
					v_u_6.Parent = script
				end
			end
		else
			return
		end
	end
end)
return v_u_9