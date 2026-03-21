local v_u_1 = {}
local v2 = game:GetService("Players")
local v3 = game:GetService("ReplicatedStorage")
local v_u_4 = game:GetService("CollectionService")
local v_u_5 = require(v3.Modules.GetFarm)
local v_u_6 = require(v3.Modules.MutationHandler)
require(v3.Modules.CreateTagHandler)
local v_u_7 = require(v3.Modules.Settings.SettingsService)
local v_u_8 = v_u_6:GetMutations()
local v_u_9 = v2.LocalPlayer
local v_u_10 = {}
local v_u_11 = {}
local v_u_12 = nil
local v_u_13 = {
	"CropMutationEffects",
	"Effect",
	"PetMutationVFX",
	"ParticleEmitter",
	"VisualEffects"
}
local function v_u_17(p14)
	if p14 then
		if p14:IsDescendantOf(game) then
			local v15 = {}
			if #v15 == 1 then
				return v15[1]
			elseif #v15 > 1 then
				return v15
			else
				local v16 = p14:IsA("Tool") and p14:WaitForChild("Handle", 0.3)
				if v16 then
					return v16
				elseif p14.PrimaryPart then
					return p14.PrimaryPart
				else
					return nil
				end
			end
		else
			return nil
		end
	else
		warn("MutationHandler.GetFXPart | No plant given!")
		return nil
	end
end
local function v_u_20(p18)
	for _, v19 in p18:GetDescendants() do
		if v19.Name ~= "RootPart" and (v19.Name ~= "Base" and not v19:IsA("Truss")) then
			if v19:IsA("Decal") or (v19:IsA("Texture") or (v19:IsA("ParticleEmitter") or (v19:HasTag("Effect") or (v19:IsA("Attachment") or (v19:IsA("PointLight") or v19:IsA("Trail")))))) then
				v19:Destroy()
			end
			if v19:IsA("BasePart") or (v19:IsA("UnionOperation") or v19:IsA("MeshPart")) then
				v19.Material = "Plastic"
				v19.MaterialVariant = "Studs 2x2 Plastic"
				if v19.Transparency > 0 and v19.Transparency < 1 then
					v19.Transparency = 0
				end
			end
		end
	end
end
local function v_u_22()
	-- upvalues: (copy) v_u_7, (copy) v_u_4, (copy) v_u_20
	if v_u_7:GetSetting("PerformanceMode") then
		for _, v_u_21 in v_u_4:GetTagged("PetModel") do
			if v_u_21:IsDescendantOf(workspace) then
				task.defer(function()
					-- upvalues: (ref) v_u_20, (copy) v_u_21
					v_u_20(v_u_21)
				end)
			end
		end
	end
end
local function v_u_27()
	-- upvalues: (copy) v_u_7, (copy) v_u_4, (copy) v_u_6, (copy) v_u_8, (copy) v_u_17, (copy) v_u_20
	if v_u_7:GetSetting("PerformanceMode") then
		for _, v_u_23 in v_u_4:GetTagged("PlantGenerated") do
			if v_u_23:HasTag("Harvestable") or v_u_23:HasTag("FruitTool") then
				local v_u_24 = v_u_6:GetPlantMutations(v_u_23)
				task.defer(function()
					-- upvalues: (copy) v_u_24, (ref) v_u_8, (copy) v_u_23, (ref) v_u_17, (ref) v_u_20
					for _, v25 in v_u_24 do
						local v26 = v_u_8[v25.Name]
						v26._RemoveFX(v26, v_u_23, (v_u_17(v_u_23)))
					end
					v_u_20(v_u_23)
				end)
			end
		end
	end
end
local function v_u_34(p28)
	-- upvalues: (copy) v_u_7, (copy) v_u_5, (copy) v_u_4, (copy) v_u_6, (copy) v_u_8, (copy) v_u_17, (copy) v_u_20
	if v_u_7:GetSetting("PerformanceMode") then
		local v29 = v_u_5(p28)
		if v29 then
			for _, v_u_30 in v_u_4:GetTagged("PlantGenerated") do
				if (v_u_30:HasTag("Harvestable") or v_u_30:HasTag("FruitTool")) and v_u_30:IsAncestorOf(v29) then
					local v_u_31 = v_u_6:GetPlantMutations(v_u_30)
					task.defer(function()
						-- upvalues: (copy) v_u_31, (ref) v_u_8, (copy) v_u_30, (ref) v_u_17, (ref) v_u_20
						for _, v32 in v_u_31 do
							local v33 = v_u_8[v32.Name]
							v33._RemoveFX(v33, v_u_30, (v_u_17(v_u_30)))
						end
						v_u_20(v_u_30)
					end)
				end
			end
		end
	else
		return
	end
end
function v_u_1.Enable(_)
	-- upvalues: (copy) v_u_7, (copy) v_u_10, (ref) v_u_12, (copy) v_u_4, (copy) v_u_6, (copy) v_u_8, (copy) v_u_17, (copy) v_u_20, (copy) v_u_13, (copy) v_u_9, (copy) v_u_27, (copy) v_u_22
	if v_u_7:GetSetting("PerformanceMode") then
		for _, v35 in v_u_10 do
			v35:Disconnect()
		end
		table.clear(v_u_10)
		if v_u_12 then
			v_u_12:Disconnect()
			v_u_12 = nil
		end
		local v36 = v_u_10
		local v37 = v_u_4:GetInstanceAddedSignal("PlantGenerated")
		local function v48(p_u_38)
			-- upvalues: (ref) v_u_6, (ref) v_u_8, (ref) v_u_17, (ref) v_u_20
			if p_u_38:HasTag("Harvestable") then
				local v43 = p_u_38.AttributeChanged:Connect(function()
					-- upvalues: (copy) p_u_38, (ref) v_u_6, (ref) v_u_8, (ref) v_u_17, (ref) v_u_20
					task.defer(function()
						-- upvalues: (ref) p_u_38, (ref) v_u_6, (ref) v_u_8, (ref) v_u_17, (ref) v_u_20
						local v_u_39 = p_u_38
						local v_u_40 = v_u_6:GetPlantMutations(v_u_39)
						task.defer(function()
							-- upvalues: (copy) v_u_40, (ref) v_u_8, (copy) v_u_39, (ref) v_u_17, (ref) v_u_20
							for _, v41 in v_u_40 do
								local v42 = v_u_8[v41.Name]
								v42._RemoveFX(v42, v_u_39, (v_u_17(v_u_39)))
							end
							v_u_20(v_u_39)
						end)
					end)
				end)
				task.wait(60)
				task.defer(function()
					-- upvalues: (copy) p_u_38, (ref) v_u_6, (ref) v_u_8, (ref) v_u_17, (ref) v_u_20
					local v_u_44 = p_u_38
					local v_u_45 = v_u_6:GetPlantMutations(v_u_44)
					task.defer(function()
						-- upvalues: (copy) v_u_45, (ref) v_u_8, (copy) v_u_44, (ref) v_u_17, (ref) v_u_20
						for _, v46 in v_u_45 do
							local v47 = v_u_8[v46.Name]
							v47._RemoveFX(v47, v_u_44, (v_u_17(v_u_44)))
						end
						v_u_20(v_u_44)
					end)
				end)
				if v43 then
					v43:Disconnect()
				end
			end
		end
		table.insert(v36, v37:Connect(v48))
		local v49 = v_u_10
		local v50 = v_u_4:GetInstanceAddedSignal("PetModel")
		local function v53(p_u_51)
			-- upvalues: (ref) v_u_20
			task.wait(5)
			task.defer(function()
				-- upvalues: (copy) p_u_51, (ref) v_u_20
				local v_u_52 = p_u_51
				task.defer(function()
					-- upvalues: (ref) v_u_20, (copy) v_u_52
					v_u_20(v_u_52)
				end)
			end)
		end
		table.insert(v49, v50:Connect(v53))
		local v54 = v_u_10
		local v55 = v_u_4:GetInstanceAddedSignal("VisualEffects")
		table.insert(v54, v55:Connect(function(p_u_56)
			task.defer(function()
				-- upvalues: (copy) p_u_56
				if p_u_56:IsA("ParticleEmitter") then
					p_u_56.Enabled = false
				end
			end)
		end))
		local v57 = v_u_10
		local v58 = v_u_4:GetInstanceAddedSignal("ParticleEmitter")
		table.insert(v57, v58:Connect(function(p_u_59)
			task.defer(function()
				-- upvalues: (copy) p_u_59
				if p_u_59:IsA("ParticleEmitter") then
					p_u_59.Enabled = false
				end
			end)
		end))
		task.defer(function()
			-- upvalues: (ref) v_u_13, (ref) v_u_4
			for _, v60 in v_u_13 do
				for _, v_u_61 in v_u_4:GetTagged(v60) do
					task.defer(function()
						-- upvalues: (copy) v_u_61
						if v_u_61:IsA("ParticleEmitter") then
							v_u_61.Enabled = false
						end
					end)
				end
			end
		end)
		if v_u_9:GetAttribute("FarmFullyLoaded") then
			v_u_27()
			v_u_22()
		else
			v_u_12 = v_u_9:GetAttributeChangedSignal("FarmFullyLoaded"):Connect(function()
				-- upvalues: (ref) v_u_9, (ref) v_u_27, (ref) v_u_22
				if v_u_9:GetAttribute("FarmFullyLoaded") == true then
					task.wait(10)
					v_u_27()
					v_u_22()
				end
			end)
		end
	else
		return
	end
end
v_u_9:GetAttributeChangedSignal("PerformanceMode"):Connect(function()
	-- upvalues: (copy) v_u_9, (copy) v_u_1, (copy) v_u_10, (ref) v_u_12
	if v_u_9:GetAttribute("PerformanceMode") then
		v_u_1:Enable()
	else
		for _, v62 in v_u_10 do
			v62:Disconnect()
		end
		table.clear(v_u_10)
		if v_u_12 then
			v_u_12:Disconnect()
			v_u_12 = nil
		end
	end
end)
task.defer(v_u_1.Enable, v_u_1)
v2.PlayerAdded:Connect(function(p_u_63)
	-- upvalues: (copy) v_u_9, (copy) v_u_11, (copy) v_u_7, (copy) v_u_34
	if p_u_63 ~= v_u_9 then
		v_u_11[p_u_63] = p_u_63:GetAttributeChangedSignal("FarmFullyLoaded"):Connect(function()
			-- upvalues: (ref) v_u_7, (ref) v_u_9, (ref) v_u_34, (copy) p_u_63
			if v_u_7:GetSetting("PerformanceMode") then
				if v_u_9:GetAttribute("FarmFullyLoaded") == true then
					task.wait(10)
					v_u_34(p_u_63)
				end
			else
				return
			end
		end)
	end
end)
v2.PlayerRemoving:Connect(function(p64)
	-- upvalues: (copy) v_u_11
	if v_u_11[p64] then
		v_u_11[p64]:Disconnect()
		v_u_11[p64] = nil
	end
end)
return v_u_1