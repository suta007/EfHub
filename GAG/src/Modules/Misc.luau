local Misc = {}
local reg
local sData
local Utils
local fVar
local HideConnection = nil

function Misc.Initialize(registry)
	reg = registry
	sData = reg.sData
	Utils = reg.Utils
	fVar = reg.fVar
end

function Misc.AntiLag()
	-- Lighting
	sData.Lighting.GlobalShadows = false
	sData.Lighting.FogEnd = 9e9
	sData.Lighting.Brightness = 1
	sData.Lighting.EnvironmentDiffuseScale = 0
	sData.Lighting.EnvironmentSpecularScale = 0
	sData.Lighting.OutdoorAmbient = Color3.new(0, 0, 0)

	-- Terrain Water
	sData.Terrain.WaterWaveSize = 0
	sData.Terrain.WaterWaveSpeed = 0
	sData.Terrain.WaterReflectance = 0
	sData.Terrain.WaterTransparency = 1

	-- Workspace optimize
	for i, v in ipairs(workspace:GetDescendants()) do
		if i % 200 == 0 then
			task.wait()
		end

		if v:IsA("BasePart") then
			v.Material = Enum.Material.SmoothPlastic
			v.Reflectance = 0
		elseif v:IsA("ParticleEmitter") then
			v.Enabled = false
		elseif v:IsA("Decal") or v:IsA("Texture") then
			v.Transparency = 1
		end
	end

	-- Rendering quality (safe)
	pcall(function()
		settings().Rendering.QualityLevel = Enum.QualityLevel.Level01
	end)
end

local function IsFruit(obj)
	local current = obj
	while current and current ~= workspace do
		if current.Name == "Fruits" then
			return true
		end
		current = current.Parent
	end
	return false
end

local function SetVisibility(obj, isHidden)
	if obj:IsA("BasePart") or obj:IsA("MeshPart") or obj:IsA("Decal") or obj:IsA("Texture") then
		if isHidden then
			-- ใช้คีย์เวิร์ดเดิม OriginalTrans
			if not obj:GetAttribute("OriginalTrans") then
				obj:SetAttribute("OriginalTrans", obj.Transparency)
			end
			obj.Transparency = 1
		else
			local orig = obj:GetAttribute("OriginalTrans")
			if orig then
				obj.Transparency = orig
			end
		end
	elseif obj:IsA("ParticleEmitter") or obj:IsA("Sparkles") or obj:IsA("Fire") or obj:IsA("Trail") then
		if isHidden then
			-- ใช้คีย์เวิร์ดเดิม OriginalEnabled
			if obj:GetAttribute("OriginalEnabled") == nil then
				obj:SetAttribute("OriginalEnabled", obj.Enabled)
			end
			obj.Enabled = false
		else
			local orig = obj:GetAttribute("OriginalEnabled")
			if orig ~= nil then
				obj.Enabled = orig
			end
		end
	end
end

function Misc.HidePlant(state)
	fVar.isPlantHidden = state
	local PlantFolder = Utils.GetPlantsFolder()
	if not PlantFolder then
		return
	end

	for _, obj in ipairs(PlantFolder:GetDescendants()) do
		if not IsFruit(obj) then
			SetVisibility(obj, state)
		end
	end
end

function Misc.HideFruit(state)
	fVar.isFruitHidden = state
	local PlantFolder = Utils.GetPlantsFolder()
	if not PlantFolder then
		return
	end

	for _, obj in ipairs(PlantFolder:GetDescendants()) do
		if IsFruit(obj) then
			SetVisibility(obj, state)
		end
	end
end

function Misc.HideTracker()
	local Options = reg.Options

	local Checker = (Options.tgHideFruits.Value or Options.tgHidePlants.Value)
	if Checker then
		local PlantFolder = Utils.GetPlantsFolder()
		if PlantFolder then
			if HideConnection then
				HideConnection:Disconnect()
				HideConnection = nil
			end
			HideConnection = PlantFolder.DescendantAdded:Connect(function(newObj)
				task.wait()
				if IsFruit(newObj) then
					if fVar.isFruitHidden then
						SetVisibility(newObj, true)
					end
				else
					if fVar.isPlantHidden then
						SetVisibility(newObj, true)
					end
				end
			end)
		end
	else
		if HideConnection then
			HideConnection:Disconnect()
			HideConnection = nil
		end
	end
end

return Misc
