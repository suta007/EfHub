--!nocheck

local getgenv = (getfenv() :: any).getgenv
local EF_REMOTE = getgenv().EF_REMOTE
local EventsTab = {}
local reg
local Tabs

local function LoadEvents()
	local Events = {}
	if getgenv().DEV_MODE then
		Events.Egghunt = EF_REMOTE("UI/Tabs/Events/Egghunt")
	else
		Events.Egghunt = require("./Events/Egghunt.luau")
	end
	return Events
end

function EventsTab.Initialize(registry)
	reg = registry
	local Interface = reg.Interface
	Tabs = reg.Tabs
	--local Options = reg.Options
	--local QuickSave = reg.Window.QuickSave

	Tabs.Events = Interface:AddTab({ Title = "Events", Icon = "calendar" })

	local Events = LoadEvents()
	Events.Egghunt.Initialize(reg, Tabs.Events)

	--return Events
end

return EventsTab
