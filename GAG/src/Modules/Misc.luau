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
			-- 1. ล่องหน (จัดการเรื่องภาพ)
			if not obj:GetAttribute("OriginalTrans") then
				obj:SetAttribute("OriginalTrans", obj.Transparency)
			end
			obj.Transparency = 1

			-- 2. ปิดการชนและการสัมผัสทุกรูปแบบ (เฉพาะที่เป็นก้อนโมเดล)
			if obj:IsA("BasePart") then
				-- บันทึกค่าดั้งเดิมเก็บไว้
				if obj:GetAttribute("OriginalCanCollide") == nil then
					obj:SetAttribute("OriginalCanCollide", obj.CanCollide)
				end
				if obj:GetAttribute("OriginalCanTouch") == nil then
					obj:SetAttribute("OriginalCanTouch", obj.CanTouch)
				end
				if obj:GetAttribute("OriginalCanQuery") == nil then
					obj:SetAttribute("OriginalCanQuery", obj.CanQuery)
				end

				-- ปิดให้หมด! (เดินทะลุ, ไม่โดนกับดัก, ไม่ขวางเมาส์คลิก)
				obj.CanCollide = false
				obj.CanTouch = false
				obj.CanQuery = false
			end
		else
			-- 3. คืนค่าการมองเห็น
			local origTrans = obj:GetAttribute("OriginalTrans")
			if origTrans then
				obj.Transparency = origTrans
			end

			-- 4. คืนค่าการชนและการสัมผัสกลับเป็นปกติ
			if obj:IsA("BasePart") then
				local origCollide = obj:GetAttribute("OriginalCanCollide")
				local origTouch = obj:GetAttribute("OriginalCanTouch")
				local origQuery = obj:GetAttribute("OriginalCanQuery")

				-- กฎของ Roblox: ต้องตั้ง CanCollide ก่อน CanQuery เสมอ ไม่งั้นจะ Error
				if origCollide ~= nil then
					obj.CanCollide = origCollide
				end
				if origQuery ~= nil then
					obj.CanQuery = origQuery
				end
				if origTouch ~= nil then
					obj.CanTouch = origTouch
				end
			end
		end
	elseif obj:IsA("ParticleEmitter") or obj:IsA("Sparkles") or obj:IsA("Fire") or obj:IsA("Trail") then
		-- 5. จัดการพวกเอฟเฟกต์แสงสีต่างๆ ให้ดับลง
		if isHidden then
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
	local tgHideFruits = Options.tgHideFruits
	local tgHidePlants = Options.tgHidePlants
	if not tgHideFruits or not tgHidePlants then
		return
	end

	local Checker = (tgHideFruits.Value or tgHidePlants.Value)
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
