game:GetService("TweenService")
local v1 = game:GetService("ReplicatedStorage")
local v_u_2 = game:GetService("Lighting")
local v3 = game:GetService("ProximityPromptService")
local v4 = require(v1.Modules.Trove)
local v_u_5 = require(v1.Modules.SkyboxManager)
local v_u_6 = v4.new()
local v_u_7 = script:FindFirstChild("Sky")
local v_u_8 = false
local v_u_9 = {}
local function v_u_12(p10)
	while p10 do
		if p10:IsA("Model") then
			local v11 = p10:FindFirstChild("WE_Highlight")
			if v11 and v11:IsA("Highlight") then
				return v11
			end
		end
		p10 = p10.Parent
	end
	return nil
end
v3.PromptShown:Connect(function(p_u_13)
	-- upvalues: (copy) v_u_12, (copy) v_u_9
	if p_u_13:GetAttribute("WhiteElephantGift") == true then
		local v14 = v_u_12(p_u_13)
		if v14 then
			v14.Enabled = true
			v_u_9[p_u_13] = v14
			p_u_13.Destroying:Once(function()
				-- upvalues: (ref) v_u_9, (copy) p_u_13
				local v15 = v_u_9[p_u_13]
				if v15 then
					v15.Enabled = false
					v_u_9[p_u_13] = nil
				end
			end)
		end
	end
end)
v3.PromptHidden:Connect(function(p16)
	-- upvalues: (copy) v_u_9
	local v17 = v_u_9[p16]
	if v17 then
		v17.Enabled = false
		v_u_9[p16] = nil
	end
end)
local function v_u_22()
	-- upvalues: (copy) v_u_6
	local v18 = workspace:FindFirstChild("BasePlate")
	if v18 then
		v21 = v18:FindFirstChild("TopBaseplate")
		if v21 and v21:IsA("BasePart") then
			::l5::
			if v21 then
				local v19 = script:WaitForChild("SnowParticles"):Clone()
				local v20 = Instance.new("Part")
				v20.Name = "SnowParticleHolder"
				v20.Anchored = true
				v20.CanCollide = false
				v20.CanQuery = false
				v20.CanTouch = false
				v20.Transparency = 1
				v20.Size = v21.Size
				v20.CFrame = v21.CFrame * CFrame.new(0, 100, 0) * CFrame.Angles(0, 0, 3.141592653589793)
				v20.Parent = workspace
				v19.Parent = v20
				v_u_6:Add(v20)
			end
		end
	end
	local v21 = workspace:FindFirstChildWhichIsA("BasePart")
	goto l5
end
local function v_u_25()
	-- upvalues: (ref) v_u_8, (copy) v_u_6, (copy) v_u_9, (copy) v_u_7, (copy) v_u_5
	v_u_8 = false
	v_u_6:Clean()
	for v23, v24 in pairs(v_u_9) do
		if v24 then
			v24.Enabled = false
		end
		v_u_9[v23] = nil
	end
	if v_u_7 then
		v_u_5.UpdateSkybox(v_u_7, 0)
	end
end
workspace:GetAttributeChangedSignal("WhiteElephant"):Connect(function()
	-- upvalues: (copy) v_u_6, (ref) v_u_8, (copy) v_u_22, (copy) v_u_7, (copy) v_u_2, (copy) v_u_5, (copy) v_u_25
	if workspace:GetAttribute("WhiteElephant") then
		v_u_6:Clean()
		v_u_8 = true
		v_u_22()
		if v_u_7 then
			v_u_7.Parent = v_u_2
			v_u_5.AddSkybox(v_u_7)
			v_u_5.UpdateSkybox(v_u_7, 4)
			return
		end
	else
		v_u_25()
	end
end)
if workspace:GetAttribute("WhiteElephant") then
	v_u_6:Clean()
	v_u_8 = true
	v_u_22()
	if v_u_7 then
		v_u_7.Parent = v_u_2
		v_u_5.AddSkybox(v_u_7)
		v_u_5.UpdateSkybox(v_u_7, 4)
	end
end
return {}