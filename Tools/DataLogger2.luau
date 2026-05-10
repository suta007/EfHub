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

local MarketplaceService = game:GetService("MarketplaceService")
local productId = 74479628

local infoType = Enum.InfoType.Product

local success, productInfo = pcall(function()
	return MarketplaceService:GetProductInfo(productId, infoType)
end)

if success and productInfo then
	ShowData(productInfo)
else
	warn("เกิดข้อผิดพลาด: ไม่สามารถดึงข้อมูลของสินค้า ID " .. tostring(productId) .. " ได้")
end
