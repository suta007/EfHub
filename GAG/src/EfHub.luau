--!nocheck
--!native
--!optimize 2

local getgenv = (getfenv() :: any).getgenv
local EF_REMOTE = getgenv().EF_REMOTE
local EfHub = {}

local function LoadModules()
	local Registry = {}
	local isDev = getgenv().DEV_MODE
	if isDev then
		-- 1. Core
		Registry.sData = EF_REMOTE("Core/sData")
		Registry.fVar = EF_REMOTE("Core/fVar")

		-- 2. Functional Modules
		Registry.Utils = EF_REMOTE("Modules/Utils")
		Registry.EfTasks = EF_REMOTE("Modules/EfTasks")
		Registry.Main = EF_REMOTE("Modules/Main")
		--Registry.Pets = EF_REMOTE("Modules/Pets")

		--
		Registry.Misc = EF_REMOTE("Modules/Misc")
		--
		--Registry.Shop = EF_REMOTE("Modules/Shop")
		--Registry.Process = EF_REMOTE("Modules/Process")
		--Registry.Auto = EF_REMOTE("Modules/Auto")
		--Registry.EventDrive = EF_REMOTE("Modules/EventDrive")

		-- 3. UI Modules
		Registry.Window = EF_REMOTE("UI/Window")
		Registry.MainTab = EF_REMOTE("UI/Tabs/MainTab")
		--Registry.PetsTab = EF_REMOTE("UI/Tabs/PetsTab")
		Registry.MiscTab = EF_REMOTE("UI/Tabs/MiscTab")
		Registry.LogTab = EF_REMOTE("UI/Tabs/LogTab")

		--
		-- Registry.ShopTab = EF_REMOTE("UI/Tabs/ShopTab")
		-- Registry.EventsTab = EF_REMOTE("UI/Tabs/EventsTab")
		-- Registry.AutoTab = EF_REMOTE("UI/Tabs/AutoTab")
	else
		-- 1. Core
		Registry.sData = require("./Core/sData.luau")
		Registry.fVar = require("./Core/fVar.luau")

		-- 2. Functional Modules
		Registry.Utils = require("./Modules/Utils.luau")
		Registry.EfTasks = require("./Modules/EfTasks.luau")
		Registry.Main = require("./Modules/Main.luau")
		--Registry.Pets = require("./Modules/Pets.luau")
		Registry.Misc = require("./Modules/Misc.luau")

		--
		--Registry.Shop = require("./Modules/Shop.luau")
		--Registry.Process = require("./Modules/Process.luau")
		--Registry.Auto = require("./Modules/Auto.luau")
		--Registry.EventDrive = require("./Modules/EventDrive.luau")

		-- 3. UI Modules
		Registry.Window = require("./UI/Window.luau")
		Registry.MainTab = require("./UI/Tabs/MainTab.luau")
		--Registry.PetsTab = require("./UI/Tabs/PetsTab.luau")
		Registry.MiscTab = require("./UI/Tabs/MiscTab.luau")
		Registry.LogTab = require("./UI/Tabs/LogTab.luau")

		--
		-- Registry.ShopTab = require("./UI/Tabs/ShopTab.luau")
		-- Registry.EventsTab = require("./UI/Tabs/EventsTab.luau")
		-- Registry.AutoTab = require("./UI/Tabs/AutoTab.luau")
	end

	return Registry
end

function EfHub.Initialize()
	local Registry = LoadModules()
	-- Initialize UI (ต้องทำก่อน เพราะ Window สร้าง Registry.Options = Fluent.Options)
	Registry.Window.Initialize(Registry)

	-- Initialize Modules (ตอนนี้ Registry.Options มีค่าแล้ว)
	--Registry.sData.Initialize(Registry)
	--Registry.Pets.Initialize(Registry)
	Registry.Utils.Initialize(Registry)
	-- Registry.Misc.Initialize(Registry)
	Registry.Main.Initialize(Registry)
	-- Registry.Shop.Initialize(Registry)
	-- Registry.Process.Initialize(Registry)
	-- Registry.Auto.Initialize(Registry)
	-- Registry.EventDrive.Initialize(Registry)

	Registry.MainTab.Initialize(Registry)
	-- Registry.ShopTab.Initialize(Registry)
	-- Registry.AutoTab.Initialize(Registry)
	-- Registry.EventsTab.Initialize(Registry)
	Registry.MiscTab.Initialize(Registry)
	--Registry.PetsTab.Initialize(Registry)
	Registry.LogTab.Initialize(Registry)

	Registry.Window.Finalize()
	Registry.Utils.ViewButton()
	return Registry
end

return EfHub
