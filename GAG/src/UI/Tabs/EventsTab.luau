--!nocheck

local getgenv = (getfenv() :: any).getgenv
local EF_REMOTE = getgenv().EF_REMOTE
local EventsTab = {}
local reg
local Tabs

local function LoadEvents()
	local Events = {}
	if getgenv().DEV_MODE then
		--Events.Egghunt = EF_REMOTE("UI/Tabs/Events/Egghunt")
		Events.Eastersell = EF_REMOTE("UI/Tabs/Events/Eastersell")
		Events.Angryplant = EF_REMOTE("UI/Tabs/Events/Angryplant")
		Events.Goldenegg = EF_REMOTE("UI/Tabs/Events/Goldenegg")
		Events.Evilbunny = EF_REMOTE("UI/Tabs/Events/Evilbunny")
		Events.Eggwar = EF_REMOTE("UI/Tabs/Events/Eggwar")
	else
		--Events.Egghunt = require("./Events/Egghunt.luau")
		Events.Eastersell = require("./Events/Eastersell.luau")
		Events.Angryplant = require("./Events/Angryplant.luau")
		Events.Goldenegg = require("./Events/Goldenegg.luau")
		Events.Evilbunny = require("./Events/Evilbunny.luau")
		Events.Eggwar = require("./Events/Eggwar.luau")
	end
	return Events
end

function EventsTab.Initialize(registry)
	reg = registry
	local Interface = reg.Interface
	Tabs = reg.Tabs
	--local Options = reg.Options
	--local QuickSave = reg.Window.QuickSave
	reg.IsEasterHarvesting = false
	reg.IsHuntEgg = false
	Tabs.Events = Interface:AddTab({ Title = "Events", Icon = "calendar" })

	local Events = LoadEvents()
	--Events.Egghunt.Initialize(reg, Tabs.Events)
	Events.Eastersell.Initialize(reg, Tabs.Events)
	Events.Angryplant.Initialize(reg, Tabs.Events)
	Events.Goldenegg.Initialize(reg, Tabs.Events)
	Events.Evilbunny.Initialize(reg, Tabs.Events)
	Events.Eggwar.Initialize(reg, Tabs.Events)

	--return Events
end

return EventsTab
