local v_u_1 = game:GetService("CollectionService")
local v_u_2 = game:GetService("Players").LocalPlayer
local v3 = {}
local v_u_4 = true
local v_u_5 = true
local v_u_6 = { "CropMutationEffects", "Effect" }
local v_u_7 = { "PetMutationVFX" }
local function v_u_11(p8, p9)
	if p8:IsA("ParticleEmitter") or (p8:IsA("Trail") or p8:IsA("Beam")) then
		p8.Enabled = p9
	elseif p8:IsA("BasePart") or (p8:IsA("MeshPart") or p8:IsA("UnionOperation")) then
		if p9 then
			local v10 = p8:GetAttribute("OriginalTransparency")
			if v10 ~= nil then
				p8.Transparency = v10
				return
			end
		else
			if p8:GetAttribute("OriginalTransparency") == nil then
				p8:SetAttribute("OriginalTransparency", p8.Transparency)
			end
			p8.Transparency = 1
		end
	end
end
local function v_u_16(p12, p13)
	-- upvalues: (copy) v_u_1, (copy) v_u_11
	for _, v14 in p12 do
		for _, v15 in v_u_1:GetTagged(v14) do
			v_u_11(v15, p13)
		end
	end
end
local function v18()
	-- upvalues: (copy) v_u_2, (ref) v_u_4, (copy) v_u_16, (copy) v_u_6
	local v17 = v_u_2:GetAttribute("CropMutationVFX") ~= false
	v_u_4 = v17
	v_u_16(v_u_6, v17)
end
local function v20()
	-- upvalues: (copy) v_u_2, (ref) v_u_5, (copy) v_u_16, (copy) v_u_7
	local v19 = v_u_2:GetAttribute("PetMutationVFX") ~= false
	v_u_5 = v19
	v_u_16(v_u_7, v19)
end
local v_u_21 = v_u_5
local v_u_22 = v_u_4
for _, v23 in v_u_6 do
	v_u_1:GetInstanceAddedSignal(v23):Connect(function(p24)
		-- upvalues: (ref) v_u_22, (copy) v_u_11
		if not v_u_22 then
			v_u_11(p24, false)
		end
	end)
end
for _, v25 in v_u_7 do
	v_u_1:GetInstanceAddedSignal(v25):Connect(function(p26)
		-- upvalues: (ref) v_u_21, (copy) v_u_11
		if not v_u_21 then
			v_u_11(p26, false)
		end
	end)
end
v_u_2:GetAttributeChangedSignal("CropMutationVFX"):Connect(v18)
v_u_2:GetAttributeChangedSignal("PetMutationVFX"):Connect(v20)
task.defer(function()
	-- upvalues: (copy) v_u_2, (ref) v_u_22, (copy) v_u_16, (copy) v_u_6, (ref) v_u_21, (copy) v_u_7
	local v27 = v_u_2:GetAttribute("CropMutationVFX") ~= false
	v_u_22 = v27
	v_u_16(v_u_6, v27)
	local v28 = v_u_2:GetAttribute("PetMutationVFX") ~= false
	v_u_21 = v28
	v_u_16(v_u_7, v28)
end)
return v3