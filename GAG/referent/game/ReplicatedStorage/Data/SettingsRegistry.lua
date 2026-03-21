local v1 = {}
local v2 = {
	["Title"] = "Master Audio",
	["Description"] = "Toggle all of your audio",
	["BackgroundTexture"] = "http://www.roblox.com/asset/?id=139632749336322",
	["SettingsData"] = {
		["Type"] = "Boolean",
		["DefaultValue"] = true
	},
	["LayoutOrder"] = 0
}
v1.Audio = v2
local v3 = {
	["Title"] = "Sound Effects",
	["Description"] = "Toggle your Sounds",
	["BackgroundTexture"] = "http://www.roblox.com/asset/?id=139632749336322",
	["SettingsData"] = {
		["Type"] = "Boolean",
		["DefaultValue"] = true
	},
	["LayoutOrder"] = 1
}
v1.Sounds = v3
local v4 = {
	["Title"] = "Music",
	["Description"] = "Toggle your Music",
	["BackgroundTexture"] = "http://www.roblox.com/asset/?id=139632749336322",
	["SettingsData"] = {
		["Type"] = "Boolean",
		["DefaultValue"] = true
	},
	["LayoutOrder"] = 0.5
}
v1.Music = v4
local v5 = {
	["Title"] = "Favorite Icons",
	["Description"] = "Toggle favorite icons display on fruit",
	["BackgroundTexture"] = "http://www.roblox.com/asset/?id=139632749336322",
	["SettingsData"] = {
		["Type"] = "Boolean",
		["DefaultValue"] = true
	},
	["LayoutOrder"] = 2
}
v1.FavoriteIcons = v5
local v6 = {
	["Title"] = "Textures",
	["Description"] = "Might help with performance!",
	["BackgroundTexture"] = "http://www.roblox.com/asset/?id=106644443200974",
	["SettingsData"] = {
		["Type"] = "Boolean",
		["DefaultValue"] = true
	},
	["LayoutOrder"] = 2,
	["Disabled"] = true
}
v1.Textures = v6
local v7 = {
	["Title"] = "Visual Effects",
	["Description"] = "Might help with performance!",
	["BackgroundTexture"] = "http://www.roblox.com/asset/?id=107407961055661",
	["SettingsData"] = {
		["Type"] = "Boolean",
		["DefaultValue"] = true
	},
	["LayoutOrder"] = 4,
	["Disabled"] = true
}
v1.VisualEffects = v7
local v8 = {
	["Title"] = "Gear Shop Button",
	["Description"] = "Teleport to the gear shop faster!",
	["BackgroundTexture"] = "http://www.roblox.com/asset/?id=139632749336322",
	["SettingsData"] = {
		["Type"] = "Boolean",
		["DefaultValue"] = false
	},
	["LayoutOrder"] = 5,
	["Disabled"] = true
}
v1.GearShopButton = v8
local v9 = {
	["Title"] = "Pet Shop Button",
	["Description"] = "Teleport to the pet shop faster!",
	["BackgroundTexture"] = "http://www.roblox.com/asset/?id=109511942140479",
	["SettingsData"] = {
		["Type"] = "Boolean",
		["DefaultValue"] = false
	},
	["LayoutOrder"] = 6,
	["Disabled"] = true
}
v1.PetShopButton = v9
local v10 = {
	["Title"] = "Recieve Gifts",
	["Description"] = "Players can send you gift requests!",
	["BackgroundTexture"] = "http://www.roblox.com/asset/?id=96138528769349",
	["SettingsData"] = {
		["Type"] = "Boolean",
		["DefaultValue"] = true
	},
	["LayoutOrder"] = 7
}
v1.RecieveGifts = v10
local v11 = {
	["Title"] = "Pet Update Rate",
	["Description"] = "Change the speed which pets update!",
	["BackgroundTexture"] = "http://www.roblox.com/asset/?id=85951736855597",
	["SettingsData"] = {
		["Type"] = "Slider",
		["DefaultValue"] = 0.035,
		["Scale"] = NumberRange.new(0.035, 1)
	},
	["LayoutOrder"] = 1,
	["Disabled"] = true
}
v1.PetUpdateRate = v11
local v12 = {
	["Title"] = "Plant Collisions",
	["Description"] = "Toggle collisions with plants!",
	["BackgroundTexture"] = "http://www.roblox.com/asset/?id=76649946815634",
	["SettingsData"] = {
		["Type"] = "Boolean",
		["DefaultValue"] = true
	},
	["LayoutOrder"] = 1,
	["Disabled"] = true
}
v1.PlantableCollisions = v12
local v13 = {
	["Title"] = "Trade Requests",
	["Description"] = "Players can send you trade requests!",
	["BackgroundTexture"] = "http://www.roblox.com/asset/?id=96138528769349",
	["SettingsData"] = {
		["Type"] = "Boolean",
		["DefaultValue"] = true
	},
	["LayoutOrder"] = 8
}
v1.TradeRequests = v13
local v14 = {
	["Title"] = "Tips",
	["Description"] = "Show game tips in chat.",
	["BackgroundTexture"] = "http://www.roblox.com/asset/?id=139632749336322",
	["SettingsData"] = {
		["Type"] = "Boolean",
		["DefaultValue"] = true
	},
	["LayoutOrder"] = 9
}
v1.Tips = v14
local v15 = {
	["Title"] = "Your Farm Icon",
	["Description"] = "Show the yellow indicator above your garden!",
	["BackgroundTexture"] = "http://www.roblox.com/asset/?id=139632749336322",
	["SettingsData"] = {
		["Type"] = "Boolean",
		["DefaultValue"] = true
	},
	["LayoutOrder"] = 10
}
v1.YourFarmIcon = v15
local v16 = {
	["Title"] = "Auto-Close Active Pets UI",
	["Description"] = "Automatically close active pet ui.",
	["BackgroundTexture"] = "http://www.roblox.com/asset/?id=139632749336322",
	["SettingsData"] = {
		["Type"] = "Boolean",
		["DefaultValue"] = true
	},
	["LayoutOrder"] = 11
}
v1.AutoCloseActivePetsUI = v16
local v17 = {
	["Title"] = "Crop Mutation VFX",
	["Description"] = "Toggles all visual effects from crop mutations!",
	["BackgroundTexture"] = "http://www.roblox.com/asset/?id=139632749336322",
	["SettingsData"] = {
		["Type"] = "Boolean",
		["DefaultValue"] = true
	},
	["LayoutOrder"] = 12
}
v1.CropMutationVFX = v17
local v18 = {
	["Title"] = "Pet Mutation VFX",
	["Description"] = "Toggles all visual effects from pet mutations!",
	["BackgroundTexture"] = "http://www.roblox.com/asset/?id=139632749336322",
	["SettingsData"] = {
		["Type"] = "Boolean",
		["DefaultValue"] = true
	},
	["LayoutOrder"] = 13
}
v1.PetMutationVFX = v18
local v19 = {
	["Title"] = "Pet Scaling",
	["Description"] = "Toggle visual scaling of pets (affects size only)",
	["BackgroundTexture"] = "http://www.roblox.com/asset/?id=139632749336322",
	["SettingsData"] = {
		["Type"] = "Boolean",
		["DefaultValue"] = true
	},
	["LayoutOrder"] = 15
}
v1.PetScaling = v19
local v20 = {
	["Title"] = "Keep Pet on Ground",
	["Description"] = "Have your pets visually stay on the ground (May improve performance)",
	["BackgroundTexture"] = "http://www.roblox.com/asset/?id=139632749336322",
	["SettingsData"] = {
		["Type"] = "Boolean",
		["DefaultValue"] = false
	},
	["LayoutOrder"] = 17
}
v1.KeepPetOnGround = v20
local v21 = {
	["Title"] = "Lower Plant FX Quality",
	["Description"] = "Plants with FX like Octobloom will be affected (May improve performance)",
	["BackgroundTexture"] = "http://www.roblox.com/asset/?id=139632749336322",
	["SettingsData"] = {
		["Type"] = "Boolean",
		["DefaultValue"] = false
	},
	["LayoutOrder"] = 18
}
v1.LowerPlantFXQuality = v21
local v22 = {
	["Title"] = "Performance Mode",
	["Description"] = "(EXPERIMENTAL) Reduce lag at the cost of visual quality.",
	["BackgroundTexture"] = "http://www.roblox.com/asset/?id=139632749336322",
	["SettingsData"] = {
		["Type"] = "Boolean",
		["DefaultValue"] = false
	},
	["LayoutOrder"] = 19
}
v1.PerformanceMode = v22
local v23 = {
	["Title"] = "Toggle Notifications",
	["Description"] = "Toggle those pesky notifications!",
	["BackgroundTexture"] = "http://www.roblox.com/asset/?id=139632749336322",
	["SettingsData"] = {
		["Type"] = "Boolean",
		["DefaultValue"] = true
	},
	["LayoutOrder"] = 20
}
v1.ToggleNotifications = v23
for v24, v25 in v1 do
	v25.Name = v24
end
return v1