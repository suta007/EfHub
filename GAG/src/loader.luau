--!nocheck
local getgenv = (getfenv() :: any).getgenv
getgenv().DEV_MODE = true

local EfHub

if getgenv().DEV_MODE then
	local BASE_URL = "https://raw.githubusercontent.com/suta007/EfHub/refs/heads/master/GAG/src/"

	-- 1. โหลด Loader Service มาก่อนเป็นตัวแรกสุด
	local success, content = pcall(function()
		return (game :: any):HttpGet(BASE_URL .. "Core/Loader.luau")
	end)
	if not success or not content then
		error("Bootloader Error: Could not fetch Core/Loader")
	end

	local loaderFunc, err = loadstring(content)
	if not loaderFunc then
		error("Bootloader Compile Error: Core/Loader: " .. tostring(err))
	end
	local Loader = loaderFunc()

	-- 2. เชื่อมต่อระบบการโหลด Remote ให้กับทั้งระบบ
	getgenv().EF_REMOTE = Loader.Require

	-- 3. โหลด EfHub ผ่าน Loader
	EfHub = Loader.Require("EfHub")
else
	EfHub = require("./EfHub.luau")
end

--local Registry = EfHub.Initialize()
EfHub.Initialize()
task.wait(1)
--EfHub.RunTask(Registry)

-- Anti AFK
local LocalPlayer = game:GetService("Players").LocalPlayer
local VirtualUser = game:GetService("VirtualUser")
LocalPlayer.Idled:Connect(function()
	VirtualUser:CaptureController()
	VirtualUser:ClickButton2(Vector2.new())
end)
