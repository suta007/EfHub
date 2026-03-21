local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer

local targets = {
	ReplicatedStorage = game:GetService("ReplicatedStorage"),
	--ReplicatedFirst = game:GetService("ReplicatedFirst"),
	--PlayerScripts = LocalPlayer:WaitForChild("PlayerScripts"),
	--PlayerGui = LocalPlayer:WaitForChild("PlayerGui"),
	--Workspace = game:GetService("Workspace"),
}

local baseFolderName = "GAG_Replicate"
if not isfolder(baseFolderName) then
	makefolder(baseFolderName)
end

-- ฟังก์ชันจัดการชื่อไฟล์ไม่ให้ซ้ำและไม่มีอักขระพิเศษ
local function getSafeName(name)
	local safe = name:gsub("[^%w%-%_ ]", "")
	return safe == "" and "Unnamed_Object" or safe
end

local function dumpHierarchy(obj, currentPath)
	local children = obj:GetChildren()

	for _, child in ipairs(children) do
		-- ป้องกันอาการค้าง (Throttle)
		task.wait(0.01)

		local safeName = getSafeName(child.Name)
		local newPath = currentPath .. "/" .. safeName

		-- ถ้าเป็น Script ให้ Decompile
		if child:IsA("ModuleScript") or child:IsA("LocalScript") then
			local fileName = newPath .. ".lua"
			-- ตรวจสอบว่าไฟล์ซ้ำไหม ถ้าซ้ำให้เติมเลข (ป้องกันไฟล์หาย)
			local counter = 1
			while isfile(fileName) do
				fileName = newPath .. "_" .. tostring(counter) .. ".lua"
				counter = counter + 1
			end

			local success, sourceCode = pcall(function()
				return decompile(child)
			end)
			if success and type(sourceCode) == "string" and #sourceCode > 0 then
				writefile(fileName, sourceCode)
			else
				writefile(newPath .. "_Error.txt", "-- Cannot decompile or Empty Source")
			end
		end

		-- บันทึก Remote ต่างๆ
		if child:IsA("RemoteEvent") or child:IsA("RemoteFunction") then
			writefile(newPath .. "_" .. child.ClassName .. ".txt", "FullName: " .. child:GetFullName())
		end

		-- หัวใจสำคัญ: ถ้า Object นี้มี "ลูก" ให้สร้างโฟลเดอร์แล้วขุดลงไป (Recursive)
		-- ไม่ว่าจะประเภทไหนก็ตาม เพื่อไม่ให้หลุดโฟลเดอร์ Modules
		if #child:GetChildren() > 0 then
			if not isfolder(newPath) then
				makefolder(newPath)
			end
			dumpHierarchy(child, newPath)
		end
	end
end

print("🚀 เริ่มการดึงข้อมูลแบบละเอียด (Deep Scan)...")

for name, obj in pairs(targets) do
	local targetPath = baseFolderName .. "/" .. name
	if not isfolder(targetPath) then
		makefolder(targetPath)
	end

	print("⏳ กำลังสแกน: " .. name)
	pcall(function()
		dumpHierarchy(obj, targetPath)
	end)
end

print("🎉 เสร็จเรียบร้อยแล้วค่ะพี่เอฟ! ลองเช็คในโฟลเดอร์ " .. baseFolderName .. " ดูนะคะ")
