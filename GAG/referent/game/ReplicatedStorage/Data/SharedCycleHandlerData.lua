local v1 = game:GetService("ReplicatedStorage")
local v2 = require(v1.Modules.CycleHandler)
game:GetService("CollectionService")
local v3 = require(v1.Data.DiggingMinigame.DiggingEventConfigData)
local v4 = require(v1.Data.SellingStockData)
local v5 = require(v1.Data.ChristmasEvent.AdventCalendarConfigData)
local v6 = require(v1.Data.NewYearsEvent.AdventCalendarConfigData)
local v7 = require(v1.Data.AdminMachineConfigData)
local v8 = {
	["TraderEventRequirement"] = v2.new({
		["Name"] = "Trader Event Requirement",
		["Interval"] = 600,
		["Duration"] = 600,
		["TimeOffset"] = 0,
		["PrintDebug"] = "None"
	}),
	["Gravedigger"] = v2.new({
		["Name"] = "Digging Event",
		["Interval"] = v3.EVENT_APPEARANCE_TIME,
		["Duration"] = v3.EVENT_ACTIVE_DURATION,
		["TimeOffset"] = v3.HALF_EVENT_TIME,
		["PrintDebug"] = "None"
	}),
	["SellingStocksRefresh"] = v2.new({
		["Name"] = "Selling Stocks Refresh",
		["Interval"] = v4.SellingStockParameters.STOCK_DURATION,
		["Duration"] = 0,
		["DisableCommandAutocomplete"] = true
	}),
	["PermanentDigging"] = v2.new({
		["Name"] = "Treasure Digging",
		["Interval"] = v3.PERMANENT_RESET_TIME,
		["Duration"] = v3.PERMANENT_RESET_TIME - 3,
		["TimeOffset"] = 0,
		["PrintDebug"] = "None"
	}),
	["ChristmasAdventCalendar"] = v2.new({
		["Name"] = "Advent Calendar",
		["Interval"] = v5.DAY_LENGTH,
		["Duration"] = 0,
		["TimeOffset"] = -v5.DAY_LENGTH,
		["PrintDebug"] = "None"
	}),
	["NewYearsAdventCalendar"] = v2.new({
		["Name"] = "New Years Advent Calendar",
		["Interval"] = v6.DAY_LENGTH,
		["Duration"] = 0,
		["TimeOffset"] = -v6.DAY_LENGTH,
		["PrintDebug"] = "None"
	}),
	["GardenGamesQuest"] = v2.new({
		["Name"] = "Garden Games Quest",
		["Interval"] = 1800,
		["Duration"] = 0,
		["TimeOffset"] = 0,
		["PrintDebug"] = "None"
	}),
	["ButtercupEventQuest"] = v2.new({
		["Name"] = "Buttercup Event Quest",
		["Interval"] = 86400,
		["Duration"] = 0,
		["TimeOffset"] = -86400,
		["PrintDebug"] = "None"
	}),
	["HeartstruckRain"] = v2.new({
		["Name"] = "Heartstruck Rain",
		["Interval"] = 3600,
		["Duration"] = 0,
		["TimeOffset"] = 0,
		["PrintDebug"] = "None"
	}),
	["AlienChaosRain"] = v2.new({
		["Name"] = "Alien Chaos Rain",
		["Interval"] = 3600,
		["Duration"] = 0,
		["TimeOffset"] = 0,
		["PrintDebug"] = "None"
	}),
	["HarvestPartyTimer"] = v2.new({
		["Name"] = "Harvest Party Timer",
		["Interval"] = 3600,
		["Duration"] = 600,
		["TimeOffset"] = 0,
		["PrintDebug"] = "None"
	}),
	["RainbowEventTimer"] = v2.new({
		["Name"] = "Rainbow Event Timer",
		["Interval"] = 3600,
		["Duration"] = 600,
		["TimeOffset"] = 0,
		["PrintDebug"] = "None"
	}),
	["KOHTimer"] = v2.new({
		["Name"] = "King of the hill Timer",
		["Interval"] = 1200,
		["Duration"] = 300,
		["TimeOffset"] = 0,
		["PrintDebug"] = "None"
	}),
	["StealAPetEvent"] = v2.new({
		["Name"] = "Steal A Pet Event",
		["Interval"] = 600,
		["Duration"] = 0,
		["TimeOffset"] = 0,
		["PrintDebug"] = "None"
	}),
	["AdminMachine"] = v2.new({
		["Name"] = "Admin Machine",
		["Interval"] = v7.INTERVAL_LENGTH,
		["Duration"] = 0,
		["TimeOffset"] = 0,
		["PrintDebug"] = "None"
	}),
	["ChristmasGiftingV2"] = v2.new({
		["Name"] = "Christmas Gifting V2 10M",
		["Interval"] = 600,
		["Duration"] = 0,
		["TimeOffset"] = 0,
		["PrintDebug"] = "None",
		["DisableCommandAutocomplete"] = true
	}),
	["ChristmasGiftingV2_5M"] = v2.new({
		["Name"] = "Christmas Gifting V2 5M",
		["Interval"] = 300,
		["Duration"] = 0,
		["TimeOffset"] = 0,
		["PrintDebug"] = "None",
		["DisableCommandAutocomplete"] = true
	}),
	["ChristmasGiftingV2_20M"] = v2.new({
		["Name"] = "Christmas Gifting V2 20M",
		["Interval"] = 1200,
		["Duration"] = 0,
		["TimeOffset"] = 0,
		["PrintDebug"] = "None",
		["DisableCommandAutocomplete"] = true
	}),
	["ChristmasGiftingV2_40M"] = v2.new({
		["Name"] = "Christmas Gifting V2 40M",
		["Interval"] = 2400,
		["Duration"] = 0,
		["TimeOffset"] = 0,
		["PrintDebug"] = "None",
		["DisableCommandAutocomplete"] = true
	}),
	["ChristmasGiftingV2_60M"] = v2.new({
		["Name"] = "Christmas Gifting V2 60M",
		["Interval"] = 3600,
		["Duration"] = 0,
		["TimeOffset"] = 0,
		["PrintDebug"] = "None",
		["DisableCommandAutocomplete"] = true
	})
}
return v8