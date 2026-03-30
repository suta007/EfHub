local Misc = {}
local reg
local sData
local Utils
local fVar
local HideConnection = nil
local PlantsESPFolderName = "PlantsESP"
local FruitESPFolderName = "FruitESP"
local ESPFruitConnection
local bGuiSession = {}
local CoreGui = game:GetService("CoreGui")
local getgenv = (getfenv() :: any).getgenv
local gethui = if getgenv then getgenv().gethui else nil
if not gethui then
	gethui = function()
		return CoreGui
	end
end

local GetSelectedItems

function Misc.Initialize(registry)
	reg = registry
	sData = reg.sData
	Utils = reg.Utils
	fVar = reg.fVar
	GetSelectedItems = reg.Utils.GetSelectedItems
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
function Misc.CreatESP(espfolder, obj, uuid, txt1, txt2, arg)
	if not (espfolder and obj and txt1) then
		return
	end
	local priority = arg or 0
	if bGuiSession[uuid] then
		bGuiSession[uuid]:Destroy()
		bGuiSession[uuid] = nil
	end

	-- --- [ส่วนที่ 1: เตรียม BillboardGui และ Layout] ---
	local bgui = Instance.new("BillboardGui")
	bgui.Name = "ESP_" .. uuid
	bgui.Adornee = obj
	-- ปรับความสูงลงมาเหลือ 120 พิกเซล (ครอบคลุม 3-4 บรรทัดแบบพอดีๆ)
	bgui.Size = UDim2.fromOffset(600, 120)
	bgui.StudsOffset = Vector3.new(0, 4, 0)
	bgui.AlwaysOnTop = true
	bgui.LightInfluence = 0
	bgui.Active = false -- ป้องกันการบังคลิกเมาส์
	bgui.Parent = espfolder

	local listLayout = Instance.new("UIListLayout")
	listLayout.Parent = bgui
	listLayout.SortOrder = Enum.SortOrder.LayoutOrder
	listLayout.Padding = UDim.new(0, 2)
	listLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center
	-- *** เปลี่ยนการจัดตำแหน่งแนวตั้งให้ชิดด้านบน (Top) ***
	listLayout.VerticalAlignment = Enum.VerticalAlignment.Top

	-- --- [ส่วนที่ 2: สร้าง TextLabel ชุดที่ 1 (บรรทัดบน)] ---
	local textLabel1 = Instance.new("TextLabel")
	textLabel1.Name = "InfoLabel"
	textLabel1.Parent = bgui
	textLabel1.LayoutOrder = 1
	textLabel1.Size = UDim2.fromScale(1, 0) -- ให้กว้างเต็ม 100% ของ BillboardGui (ซึ่งก็คือครึ่งจอ)
	textLabel1.AutomaticSize = Enum.AutomaticSize.XY
	textLabel1.BackgroundTransparency = 1
	textLabel1.TextWrapped = false
	textLabel1.Active = false -- *** ป้องกันการบังคลิกเมาส์ ***
	textLabel1.RichText = true
	textLabel1.TextSize = 16

	-- ตัวอย่างข้อความ (พี่เอฟแทนที่ด้วยตัวแปรจริงได้เลยค่ะ)
	--textLabel1.Text = '<b>Shiny Apple</b> (<font color="#FF4500">12.5kg</font>, $120.5M)'

	-- --- [ส่วนที่ 3: สร้าง TextLabel ชุดที่ 2 (บรรทัดล่าง: Mutation)] ---
	local textLabel2 = Instance.new("TextLabel")
	textLabel2.Name = "MutationLabel"
	textLabel2.Parent = bgui
	textLabel2.LayoutOrder = 2
	textLabel2.Size = UDim2.fromScale(1, 0) -- ให้กว้างเต็ม 100% ของ BillboardGui เช่นกัน
	textLabel2.AutomaticSize = Enum.AutomaticSize.Y
	textLabel2.BackgroundTransparency = 1
	textLabel2.TextWrapped = true -- *** เปิดการตัดคำ (Wrap) ***
	textLabel2.Active = false -- *** ป้องกันการบังคลิกเมาส์ ***
	textLabel2.RichText = true
	textLabel2.TextSize = 14

	-- ตัวอย่างข้อความยาวๆ ที่ใส่สีมาแล้ว
	--textLabel2.Text = '<font color="#ADFF2F">Giant</font>, <font color="#ADFF2F">Golden</font>, <font color="#ADFF2F">Swift</font>, <font color="#ADFF2F">Rare</font>, <font color="#ADFF2F">Shiny</font>'

	---if txt2 and txt2 ~= "" then
	---textLabel.Text = string.format("%s\n%s", tostring(txt1), tostring(txt2))
	---else
	---textLabel.Text = tostring(txt1)
	---end
	textLabel1.Text = txt1
	textLabel2.Text = txt2
	if priority == 3 then
		textLabel1.TextColor3 = Color3.fromRGB(200, 200, 10)
	elseif priority == 2 then
		textLabel1.TextColor3 = Color3.fromRGB(200, 50, 10)
	elseif priority == 1 then
		textLabel1.TextColor3 = Color3.fromRGB(10, 200, 10)
	else
		textLabel1.TextColor3 = Color3.fromRGB(200, 200, 200)
	end

	bGuiSession[uuid] = bgui
end

function Misc.setEspCrop(fruit)
	local Options = reg.Options
	if not Options.tgEspCrops.Value then
		return
	end
	local TargetFolder = gethui and gethui() or CoreGui
	local ESPFolder = TargetFolder:FindFirstChild(FruitESPFolderName)
	if not ESPFolder then
		return
	end

	local fruitName = fruit.Name
	local fruitVariant = fruit:FindFirstChild("Variant") and fruit:FindFirstChild("Variant").Value
	local fruitWeight = fruit:FindFirstChild("Weight") and fruit:FindFirstChild("Weight").Value
	local Item_Seed = fruit:FindFirstChild("Item_Seed") and fruit:FindFirstChild("Item_Seed").Value
	local uuid = Item_Seed

	--local txt1 = fruitName
	--if fruitWeight then
	local txt1 = string.format("%s (%.2f) kg", fruitName, fruitWeight)
	--end

	local txt2 = ""
	if fruitVariant and fruitVariant ~= "Normal" then
		txt2 = string.format("<font color='#00FF00'>%s</font>", fruitVariant)
	end

	local scale = fruit:GetAttribute("WeightMulti") or 0
	local arg = 0
	if scale >= 30 then
		arg = 3
	elseif scale >= 20 then
		arg = 2
	elseif scale >= 10 then
		arg = 1
	end

	Misc.CreatESP(ESPFolder, fruit, uuid, txt1, txt2, arg)
end

function Misc.EspCrops(State)
	local Options = reg.Options
	local TargetFolder = gethui and gethui() or CoreGui
	local oldFolder = TargetFolder:FindFirstChild(FruitESPFolderName)
	if oldFolder then
		oldFolder:Destroy()
	end
	if ESPFruitConnection then
		ESPFruitConnection:Disconnect()
		ESPFruitConnection = nil
	end
	if State ~= true then
		return
	end
	local espCropsList = GetSelectedItems(Options.ddEspCrops.Value)
	if table.find(espCropsList, "NONE") then
		return
	end

	local ESPFolder = Instance.new("Folder")
	ESPFolder.Name = FruitESPFolderName
	ESPFolder.Parent = TargetFolder

	local Plants_Physical = Utils.GetPlantsFolder()
	if not Plants_Physical then
		return
	end

	for _, plant in ipairs(Plants_Physical:GetChildren()) do
		local FruitsContainer = plant:FindFirstChild("Fruits")
		local itemsToCheck = FruitsContainer and FruitsContainer:GetChildren() or { plant }
		for _, item in ipairs(itemsToCheck) do
			if item:IsA("Model") then
				if table.find(espCropsList, item.Name) then
					Misc.setEspCrop(item)
				end
			end
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
