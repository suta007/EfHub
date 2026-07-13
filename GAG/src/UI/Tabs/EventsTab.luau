--!nocheck

local getgenv = (getfenv() :: any).getgenv
local EF_REMOTE = getgenv().EF_REMOTE
local EventsTab = {}
local reg
local Tabs

local function LoadEvents()
	local Events = {}
	if getgenv().DEV_MODE then
		Events.Summer = EF_REMOTE("UI/Tabs/Events/SummerHarvest")
		Events.EventShop = EF_REMOTE("UI/Tabs/Events/EventShop")
	else
		Events.Summer = require("./Events/SummerHarvest.luau")
		Events.EventShop = require("./Events/EventShop.luau")
	end
	return Events
end

function EventsTab.Initialize(registry)
	reg = registry
	local Interface = reg.Interface
	Tabs = reg.Tabs
	Tabs.Events = Interface:AddTab({ Title = "Events", Icon = "calendar" })
	reg.EVENT_DATA = require(reg.sData.Data:WaitForChild("EventShopData") :: any)
	local Events = LoadEvents()
	Events.Summer.Initialize(reg, Tabs.Events)
	Events.EventShop.Initialize(reg, Tabs.Events)
end

return EventsTab
