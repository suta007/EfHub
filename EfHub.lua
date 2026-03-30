local game = game :: any
local PlaceId = game.PlaceId

if PlaceId == 123456789 then -- ไอดีเกม Garden Horizons
	loadstring(game:HttpGet("https://github.com/suta007/EfHub/releases/latest/download/EfHub_GardenHorizons.lua"))()
elseif PlaceId == 987654321 then -- ไอดีเกม Grow A Garden
	loadstring(game:HttpGet("https://github.com/suta007/EfHub/releases/latest/download/EfHub_GrowAGarden.lua"))()
else
	game.Players.LocalPlayer:Kick("EfHub ยังไม่รองรับเกมนี้ครับ!")
end
