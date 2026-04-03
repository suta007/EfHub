--!nocheck
--!native
--!optimize 2

local getgenv = (getfenv() :: any).getgenv
local EF_REMOTE = getgenv().EF_REMOTE
local EfHub = {}

local function LoadModules()
	local Registry = {}
	local isDev = getgenv().DEV_MODE
	local LoaderPath = "Core/Loader"
	local Loader

	if isDev then
		Loader = EF_REMOTE(LoaderPath)
	else
		Loader = require("./" .. LoaderPath .. ".luau")
	end

	Registry.Loader = Loader
	Registry.Log = getgenv().Log

	local function Require(path)
		return Loader.Require(path)
	end

	-- 1. Core
	Registry.sData = Require("Core/sData")
	Registry.fVar = Require("Core/fVar")

	-- 2. Functional Modules
	Registry.Utils = Require("Modules/Utils")
	Registry.EfTasks = Require("Modules/EfTasks")

	Registry.Main = Require("Modules/Main")
	Registry.Shop = Require("Modules/Shop")
	Registry.Auto = Require("Modules/Auto")
	Registry.Pets = Require("Modules/Pets")
	Registry.Misc = Require("Modules/Misc")

	-- 3. UI Modules
	Registry.Window = Require("UI/Window")
	Registry.MainTab = Require("UI/Tabs/MainTab")
	Registry.ShopTab = Require("UI/Tabs/ShopTab")
	Registry.PetsTab = Require("UI/Tabs/PetsTab")
	Registry.AutoTab = Require("UI/Tabs/AutoTab")
	Registry.MiscTab = Require("UI/Tabs/MiscTab")
	Registry.LogTab = Require("UI/Tabs/LogTab")

	return Registry
end

function EfHub.Initialize()
	local Registry = LoadModules()
	-- Initialize UI (ต้องทำก่อน เพราะ Window สร้าง Registry.Options = Fluent.Options)
	Registry.Window.Initialize(Registry)

	-- Initialize Modules (ตอนนี้ Registry.Options มีค่าแล้ว)
	--Registry.sData.Initialize(Registry)
	Registry.Pets.Initialize(Registry)
	Registry.Utils.Initialize(Registry)
	Registry.Misc.Initialize(Registry)
	Registry.Main.Initialize(Registry)
	Registry.Shop.Initialize(Registry)
	-- Registry.Process.Initialize(Registry)
	Registry.Auto.Initialize(Registry)
	-- Registry.EventDrive.Initialize(Registry)

	Registry.MainTab.Initialize(Registry)
	Registry.ShopTab.Initialize(Registry)
	Registry.AutoTab.Initialize(Registry)
	-- Registry.EventsTab.Initialize(Registry)
	Registry.MiscTab.Initialize(Registry)
	Registry.PetsTab.Initialize(Registry)
	Registry.LogTab.Initialize(Registry)

	Registry.Window.Finalize()
	Registry.Utils.ViewButton()

	--Registry.test.init(Registry)
	return Registry
end

return EfHub
