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
		Events.MainBee = EF_REMOTE("UI/Tabs/Events/MainBee")
		Events.ShopBee = EF_REMOTE("UI/Tabs/Events/ShopBee")
	else
		--Events.Egghunt = require("./Events/Egghunt.luau")
		Events.MainBee = require("./Events/MainBee.luau")
		Events.ShopBee = require("./Events/ShopBee.luau")
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
	reg.EVENT_DATA = require(reg.sData.Data:WaitForChild("EventShopData") :: any)
	local Events = LoadEvents()
	--Events.Egghunt.Initialize(reg, Tabs.Events)
	Events.MainBee.Initialize(reg, Tabs.Events)
	Events.ShopBee.Initialize(reg, Tabs.Events)
end

return EventsTab
