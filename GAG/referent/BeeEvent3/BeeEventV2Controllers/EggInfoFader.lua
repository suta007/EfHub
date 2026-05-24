local v_u_1 = game:GetService("TweenService")
local v2 = {}
local v_u_3 = {}
local function v_u_5(p4) -- name: GetTransparencyProps
	return p4:IsA("UIStroke") and { "Transparency" } or ((p4:IsA("ImageLabel") or p4:IsA("ImageButton")) and { "BackgroundTransparency", "ImageTransparency" } or ((p4:IsA("TextLabel") or (p4:IsA("TextButton") or p4:IsA("TextBox"))) and { "BackgroundTransparency", "TextTransparency", "TextStrokeTransparency" } or (p4:IsA("CanvasGroup") and { "GroupTransparency" } or ((p4:IsA("Frame") or p4:IsA("ScrollingFrame")) and { "BackgroundTransparency" } or nil))))
end
local function v_u_14(p6) -- name: CaptureOriginals
	-- upvalues: (copy) v_u_3, (copy) v_u_5
	local v7 = v_u_3[p6]
	if v7 then
		return v7
	end
	local v8 = {}
	for _, v9 in p6:GetDescendants() do
		local v10 = v_u_5(v9)
		if v10 then
			local v11 = {}
			for _, v12 in v10 do
				v11[v12] = v9[v12]
			end
			v8[v9] = v11
		end
	end
	local v13 = {
		["Originals"] = v8,
		["ActiveTweens"] = {}
	}
	v_u_3[p6] = v13
	return v13
end
local function v_u_21(p15, p16) -- name: ApplyInstant
	for v17, v18 in p15.Originals do
		if v17.Parent then
			for v19, v20 in v18 do
				v17[v19] = v20 + (1 - v20) * p16
			end
		end
	end
end
function v2.Show(p22) -- name: Show
	-- upvalues: (copy) v_u_14, (copy) v_u_21, (copy) v_u_1
	local v23 = v_u_14(p22)
	for _, v24 in v23.ActiveTweens do
		v24:Cancel()
	end
	table.clear(v23.ActiveTweens)
	if not p22.Enabled then
		v_u_21(v23, 1)
		p22.Enabled = true
	end
	local v25 = TweenInfo.new(0.18, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)
	for v26, v27 in v23.Originals do
		if v26.Parent then
			local v28 = v_u_1:Create(v26, v25, v27)
			local v29 = v23.ActiveTweens
			table.insert(v29, v28)
			v28:Play()
		end
	end
end
function v2.Hide(p_u_30) -- name: Hide
	-- upvalues: (copy) v_u_14, (copy) v_u_1, (copy) v_u_3
	if p_u_30.Enabled then
		local v_u_31 = v_u_14(p_u_30)
		for _, v32 in v_u_31.ActiveTweens do
			v32:Cancel()
		end
		table.clear(v_u_31.ActiveTweens)
		local v33 = TweenInfo.new(0.18, Enum.EasingStyle.Quad, Enum.EasingDirection.In)
		local v34 = nil
		for v35, v36 in v_u_31.Originals do
			if v35.Parent then
				local v37 = {}
				for v38 in v36 do
					v37[v38] = 1
				end
				local v39 = v_u_1:Create(v35, v33, v37)
				local v40 = v_u_31.ActiveTweens
				table.insert(v40, v39)
				v39:Play()
				v34 = v34 or v39
			end
		end
		if v34 then
			v34.Completed:Connect(function(p41)
				-- upvalues: (ref) v_u_3, (copy) p_u_30, (copy) v_u_31
				if p41 == Enum.PlaybackState.Completed and (v_u_3[p_u_30] == v_u_31 and #v_u_31.ActiveTweens > 0) then
					p_u_30.Enabled = false
				end
			end)
		else
			p_u_30.Enabled = false
		end
	else
		return
	end
end
return v2