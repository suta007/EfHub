local function ShowData(tbl, indent)
	local lclIndent = indent or 0
	local spacing = string.rep("  ", lclIndent)
	if type(tbl) == "table" then
		for k, v in pairs(tbl) do
			if type(v) == "table" then
				print(spacing .. "[" .. tostring(k) .. "] : (Table)")
				ShowData(v, lclIndent + 1)
			else
				print(spacing .. "[" .. tostring(k) .. "] : " .. tostring(v))
			end
			--return
		end
	else
		print(spacing .. tostring(tbl))
	end
end


local ReplicatedStorage = game:GetService("ReplicatedStorage")
local DataService = require(ReplicatedStorage.Modules.DataService)
local GetData_result = DataService:GetData()
local seasonInfo = GetData_result.SeasonPass

ShowData(seasonInfo)


local ReplicatedStorage = game:GetService("ReplicatedStorage")
local DataService = require(ReplicatedStorage.Modules.DataService)

local SeedShop1 = DataService:GetPathSignal("SeedStocks/@")
SeedShop1:Connect(function(Key, NewData)
	print("SeedShop1 : ===================== ")
	print("Key : ")
	ShowData(Key)
	print("NewData : ")
	ShowData(NewData)
end)

local SeedShop2 = DataService:GetPathSignal("SeedStocks/Shop/Stocks/@")
SeedShop2:Connect(function(FolderName, FolderData)
	print("SeedShop2 : ===================== ")
	print("FolderName : ")
	ShowData(FolderName)
	print("FolderData : ")
	ShowData(FolderData)
end)
