game:GetService("RunService")
game:GetService("ReplicatedStorage")
local v_u_1 = game:GetService("RunService")
local v2 = {}
local v_u_3 = {
	["ChocolateRain"] = {
		["GrowRateMulti"] = 1.5
	},
	["DJJhai"] = {
		["GrowRateMulti"] = 1.5
	},
	["Disco"] = {
		["GrowRateMulti"] = 1.5
	},
	["Frost"] = {
		["GrowRateMulti"] = 1.5
	},
	["JandelLazer"] = {
		["GrowRateMulti"] = 1.5
	},
	["JandelMagician"] = {
		["GrowRateMulti"] = 1.5
	},
	["JandelZeus"] = {
		["GrowRateMulti"] = 1.5
	},
	["JandelStorm"] = {
		["GrowRateMulti"] = 1.5
	},
	["MeteorShower"] = {
		["GrowRateMulti"] = 1.5
	},
	["Rain"] = {
		["GrowRateMulti"] = 1.5
	},
	["SheckleRain"] = {
		["GrowRateMulti"] = 1.5
	},
	["Thunderstorm"] = {
		["GrowRateMulti"] = 1.5
	},
	["Tornado"] = {
		["GrowRateMulti"] = 1.5
	},
	["Blackhole"] = {
		["GrowRateMulti"] = 1.5
	},
	["BeeNado"] = {
		["GrowRateMulti"] = 1.5
	},
	["BeeStorm"] = {
		["GrowRateMulti"] = 1.5
	},
	["SpaceTravel"] = {
		["GrowRateMulti"] = 1.75
	},
	["TropicalRain"] = {
		["GrowRateMulti"] = 1.5
	},
	["AuroraBorealis"] = {
		["GrowRateMulti"] = 1.5
	},
	["RadioactiveCarrot"] = {
		["GrowRateMulti"] = 1.5
	},
	["JandelZombie"] = {
		["GrowRateMulti"] = 1.5
	},
	["FullMoon"] = {
		["GrowRateMulti"] = 2
	},
	["SafariStorm"] = {
		["GrowRateMulti"] = 5
	},
	["Cyclone"] = {
		["GrowRateMulti"] = 1.5
	},
	["YetiNight"] = {
		["GrowRateMulti"] = 3
	},
	["Default"] = {
		["GrowRateMulti"] = 1
	}
}
if v_u_1:IsServer() then
	for _, v4 in game.ServerScriptService.WeatherService.weatherManager.Events:GetChildren() do
		if not v_u_3[v4.Name] then
			v_u_3[v4.Name] = v_u_3.Default
		end
	end
end
local v_u_5 = {}
local v6 = {
	["PlantName"] = "Carrot",
	["PlantData"] = {
		["GrowTickTime"] = NumberRange.new(0.8, 1.2),
		["GrowRate"] = 0.4,
		["PlantDown"] = 0.25
	}
}
v_u_5.Carrot = v6
local v7 = {
	["PlantName"] = "Tomato",
	["PlantData"] = {
		["GrowTickTime"] = NumberRange.new(1.6, 2.4),
		["GrowFruitTime"] = NumberRange.new(40, 60),
		["GrowRate"] = 0.02,
		["PlantDown"] = 0.25
	},
	["FruitData"] = {
		["GrowTickTime"] = NumberRange.new(0.8, 1.2),
		["GrowRate"] = 0.05,
		["PlantDown"] = 0.25
	}
}
v_u_5.Tomato = v7
local v8 = {
	["PlantName"] = "Apple",
	["PlantData"] = {
		["GrowTickTime"] = NumberRange.new(1.6, 2.4),
		["GrowFruitTime"] = NumberRange.new(40, 60),
		["GrowRate"] = 0.02,
		["PlantDown"] = -0.5
	},
	["FruitData"] = {
		["GrowTickTime"] = NumberRange.new(0.8, 1.2),
		["GrowRate"] = 0.05,
		["PlantDown"] = 0.25
	}
}
v_u_5.Apple = v8
local v9 = {
	["PlantName"] = "Blue Lollipop",
	["PlantData"] = {
		["GrowTickTime"] = NumberRange.new(1.2, 1.4),
		["GrowRate"] = 0.6,
		["PlantDown"] = 0.25
	}
}
v_u_5["Blue Lollipop"] = v9
local v10 = {
	["PlantName"] = "Cherry Blossom",
	["PlantData"] = {
		["GrowTickTime"] = NumberRange.new(6, 8),
		["GrowFruitTime"] = NumberRange.new(80, 160),
		["GrowRate"] = 0.05,
		["PlantDown"] = -0.5
	},
	["FruitData"] = {
		["GrowTickTime"] = NumberRange.new(1, 2),
		["GrowRate"] = 0.05,
		["PlantDown"] = 0.25
	}
}
v_u_5["Cherry Blossom"] = v10
local v11 = {
	["PlantName"] = "Pumpkin",
	["PlantData"] = {
		["GrowTickTime"] = NumberRange.new(1.6, 2.4),
		["GrowRate"] = 0.005,
		["PlantDown"] = -0.25
	}
}
v_u_5.Pumpkin = v11
local v12 = {
	["PlantName"] = "Watermelon",
	["PlantData"] = {
		["GrowTickTime"] = NumberRange.new(1.6, 2.4),
		["GrowRate"] = 0.01,
		["PlantDown"] = -0.25
	}
}
v_u_5.Watermelon = v12
local v13 = {
	["PlantName"] = "Coconut",
	["PlantData"] = {
		["GrowTickTime"] = NumberRange.new(1.6, 2.4),
		["GrowFruitTime"] = NumberRange.new(40, 60),
		["GrowRate"] = 0.001,
		["PlantDown"] = -0.5
	},
	["FruitData"] = {
		["GrowTickTime"] = NumberRange.new(0.8, 1.2),
		["GrowRate"] = 0.05,
		["PlantDown"] = 0.25
	}
}
v_u_5.Coconut = v13
local v14 = {
	["PlantName"] = "Candy Blossom",
	["PlantData"] = {
		["GrowTickTime"] = NumberRange.new(4, 6),
		["GrowFruitTime"] = NumberRange.new(120, 180),
		["GrowRate"] = 0.05,
		["PlantDown"] = -0.5
	},
	["FruitData"] = {
		["GrowTickTime"] = NumberRange.new(4, 5),
		["GrowRate"] = 0.05,
		["PlantDown"] = 0.25
	}
}
v_u_5["Candy Blossom"] = v14
local v15 = {
	["PlantName"] = "Candy Blossom 2026",
	["PlantData"] = {
		["GrowTickTime"] = NumberRange.new(4, 6),
		["GrowFruitTime"] = NumberRange.new(120, 180),
		["GrowRate"] = 0.05,
		["PlantDown"] = -0.5
	},
	["FruitData"] = {
		["GrowTickTime"] = NumberRange.new(4, 5),
		["GrowRate"] = 0.05,
		["PlantDown"] = 0.25
	}
}
v_u_5["Candy Blossom 2026"] = v15
local v16 = {
	["PlantName"] = "Cacao",
	["PlantData"] = {
		["GrowTickTime"] = NumberRange.new(4, 6),
		["GrowFruitTime"] = NumberRange.new(80, 160),
		["GrowRate"] = 0.05,
		["PlantDown"] = -0.5
	},
	["FruitData"] = {
		["GrowTickTime"] = NumberRange.new(1, 2),
		["GrowRate"] = 0.05,
		["PlantDown"] = 0.25
	}
}
v_u_5.Cacao = v16
local v17 = {
	["PlantName"] = "Sunflower",
	["PlantData"] = {
		["GrowTickTime"] = NumberRange.new(28, 32),
		["GrowFruitTime"] = NumberRange.new(200, 340),
		["GrowRate"] = 0.07,
		["PlantDown"] = 0
	},
	["FruitData"] = {
		["GrowTickTime"] = NumberRange.new(6, 8),
		["GrowRate"] = 0.05,
		["PlantDown"] = 0
	}
}
v_u_5.Sunflower = v17
local v18 = {
	["PlantName"] = "Beanstalk",
	["PlantData"] = {
		["GrowTickTime"] = NumberRange.new(8, 12),
		["GrowFruitTime"] = NumberRange.new(290, 310),
		["GrowRate"] = 0.05,
		["PlantDown"] = 1
	},
	["FruitData"] = {
		["GrowTickTime"] = NumberRange.new(0.8, 1.2),
		["GrowRate"] = 0.05,
		["PlantDown"] = -0.25
	}
}
v_u_5.Beanstalk = v18
local v19 = {
	["PlantName"] = "Coolcool Beanbeanstalk",
	["PlantData"] = {
		["GrowTickTime"] = NumberRange.new(8, 12),
		["GrowFruitTime"] = NumberRange.new(290, 310),
		["GrowRate"] = 0.05,
		["PlantDown"] = 1
	},
	["FruitData"] = {
		["GrowTickTime"] = NumberRange.new(0.8, 1.2),
		["GrowRate"] = 0.05,
		["PlantDown"] = -0.25
	}
}
v_u_5["Coolcool Beanbeanstalk"] = v19
local v20 = {
	["PlantName"] = "Ember Lily",
	["PlantData"] = {
		["GrowTickTime"] = NumberRange.new(15, 18),
		["GrowFruitTime"] = NumberRange.new(110, 160),
		["GrowRate"] = 0.0285,
		["PlantDown"] = -1.15
	},
	["FruitData"] = {
		["GrowTickTime"] = NumberRange.new(6, 8),
		["GrowRate"] = 0.035,
		["PlantDown"] = 0.25
	}
}
v_u_5["Ember Lily"] = v20
local v21 = {
	["PlantName"] = "Sugar Apple",
	["PlantData"] = {
		["GrowTickTime"] = NumberRange.new(9, 11),
		["GrowFruitTime"] = NumberRange.new(40, 80),
		["GrowRate"] = 0.025,
		["PlantDown"] = -0.5
	},
	["FruitData"] = {
		["GrowTickTime"] = NumberRange.new(5.5, 7),
		["GrowRate"] = 0.025,
		["PlantDown"] = 0.25
	}
}
v_u_5["Sugar Apple"] = v21
local v22 = {
	["PlantName"] = "Burning Bud",
	["PlantData"] = {
		["GrowTickTime"] = NumberRange.new(4, 6),
		["GrowFruitTime"] = NumberRange.new(250, 300),
		["GrowRate"] = 0.005,
		["PlantDown"] = 4
	},
	["FruitData"] = {
		["GrowTickTime"] = NumberRange.new(1, 2),
		["GrowRate"] = 0.05,
		["PlantDown"] = -0.25
	}
}
v_u_5["Burning Bud"] = v22
local v23 = {
	["PlantName"] = "Zebrazinkle",
	["PlantData"] = {
		["GrowTickTime"] = NumberRange.new(4, 6),
		["GrowFruitTime"] = NumberRange.new(250, 300),
		["GrowRate"] = 0.005,
		["PlantDown"] = 4
	},
	["FruitData"] = {
		["GrowTickTime"] = NumberRange.new(5, 6),
		["GrowRate"] = 0.02,
		["PlantDown"] = -0.25
	}
}
v_u_5.Zebrazinkle = v23
local v24 = {
	["PlantName"] = "Giant Pinecone",
	["PlantData"] = {
		["GrowTickTime"] = NumberRange.new(20, 21),
		["GrowFruitTime"] = NumberRange.new(180, 200),
		["GrowRate"] = 0.011,
		["PlantDown"] = 0
	},
	["FruitData"] = {
		["GrowTickTime"] = NumberRange.new(10.35, 11),
		["GrowRate"] = 0.075,
		["PlantDown"] = 0
	}
}
v_u_5["Giant Pinecone"] = v24
local v25 = {
	["PlantName"] = "Elder Strawberry",
	["PlantData"] = {
		["GrowTickTime"] = NumberRange.new(20.4, 20.65),
		["GrowFruitTime"] = NumberRange.new(200, 240),
		["GrowRate"] = 0.005,
		["PlantDown"] = 0
	},
	["FruitData"] = {
		["GrowTickTime"] = NumberRange.new(5, 6),
		["GrowRate"] = 0.0125,
		["PlantDown"] = 0
	}
}
v_u_5["Elder Strawberry"] = v25
local v26 = {
	["PlantName"] = "Romanesco",
	["PlantData"] = {
		["GrowTickTime"] = NumberRange.new(6, 8),
		["GrowFruitTime"] = NumberRange.new(333, 366),
		["GrowRate"] = 0.001,
		["PlantDown"] = 0
	},
	["FruitData"] = {
		["GrowTickTime"] = NumberRange.new(3.6, 4),
		["GrowRate"] = 0.02,
		["PlantDown"] = 0
	}
}
v_u_5.Romanesco = v26
local v27 = {
	["PlantName"] = "Crimson Thorn",
	["PlantData"] = {
		["GrowTickTime"] = NumberRange.new(1.7, 2.1),
		["GrowFruitTime"] = NumberRange.new(400, 500),
		["GrowRate"] = 0.001,
		["PlantDown"] = 0
	},
	["FruitData"] = {
		["GrowTickTime"] = NumberRange.new(0.7, 1.1),
		["GrowRate"] = 0.01,
		["PlantDown"] = 0
	}
}
v_u_5["Crimson Thorn"] = v27
local v28 = {
	["PlantName"] = "Great Pumpkin",
	["PlantData"] = {
		["GrowTickTime"] = NumberRange.new(9.65, 10),
		["GrowFruitTime"] = NumberRange.new(200, 240),
		["GrowRate"] = 0.015,
		["PlantDown"] = 0
	},
	["FruitData"] = {
		["GrowTickTime"] = NumberRange.new(8, 8.35),
		["GrowRate"] = 0.01,
		["PlantDown"] = 0
	}
}
v_u_5["Great Pumpkin"] = v28
local v29 = {
	["PlantName"] = "Octobloom",
	["PlantData"] = {
		["GrowTickTime"] = NumberRange.new(88, 88),
		["GrowFruitTime"] = NumberRange.new(333, 333),
		["GrowRate"] = 0.04,
		["PlantDown"] = 0
	},
	["FruitData"] = {
		["GrowTickTime"] = NumberRange.new(8, 8),
		["GrowRate"] = 0.04,
		["PlantDown"] = 0
	}
}
v_u_5.Octobloom = v29
local v30 = {
	["PlantName"] = "Trinity Fruit",
	["PlantData"] = {
		["GrowTickTime"] = NumberRange.new(12, 14),
		["GrowFruitTime"] = NumberRange.new(480, 480),
		["GrowRate"] = 0.004,
		["PlantDown"] = 0
	},
	["FruitData"] = {
		["GrowTickTime"] = NumberRange.new(20, 24),
		["GrowRate"] = 0.05,
		["PlantDown"] = 0
	}
}
v_u_5["Trinity Fruit"] = v30
local v31 = {
	["PlantName"] = "Four Leaf Clover",
	["PlantData"] = {
		["GrowTickTime"] = NumberRange.new(12, 14),
		["GrowFruitTime"] = NumberRange.new(480, 480),
		["GrowRate"] = 0.004,
		["PlantDown"] = 0
	},
	["FruitData"] = {
		["GrowTickTime"] = NumberRange.new(20, 24),
		["GrowRate"] = 0.05,
		["PlantDown"] = 0
	}
}
v_u_5["Four Leaf Clover"] = v31
local v32 = {
	["PlantName"] = "Peppermint Vine",
	["PlantData"] = {
		["GrowTickTime"] = NumberRange.new(20, 24),
		["GrowFruitTime"] = NumberRange.new(300, 400),
		["GrowRate"] = 0.025,
		["PlantDown"] = 0
	},
	["FruitData"] = {
		["GrowTickTime"] = NumberRange.new(6, 10),
		["GrowRate"] = 0.1,
		["PlantDown"] = 0
	}
}
v_u_5["Peppermint Vine"] = v32
local v33 = {
	["PlantName"] = "Reindeer Root",
	["PlantData"] = {
		["GrowTickTime"] = NumberRange.new(30, 40),
		["GrowFruitTime"] = NumberRange.new(300, 340),
		["GrowRate"] = 0.025,
		["PlantDown"] = 0
	},
	["FruitData"] = {
		["GrowTickTime"] = NumberRange.new(13, 14),
		["GrowRate"] = 0.025,
		["PlantDown"] = 0
	}
}
v_u_5["Reindeer Root"] = v33
local v34 = {
	["PlantName"] = "Spirit Sparkle",
	["PlantData"] = {
		["GrowTickTime"] = NumberRange.new(30, 40),
		["GrowFruitTime"] = NumberRange.new(300, 340),
		["GrowRate"] = 0.025,
		["PlantDown"] = 0
	},
	["FruitData"] = {
		["GrowTickTime"] = NumberRange.new(13, 14),
		["GrowRate"] = 0.025,
		["PlantDown"] = 0
	}
}
v_u_5["Spirit Sparkle"] = v34
local v35 = {
	["PlantName"] = "Candy Sunflower",
	["PlantData"] = {
		["GrowTickTime"] = NumberRange.new(3, 4),
		["GrowRate"] = 0.1,
		["PlantDown"] = 0.25
	}
}
v_u_5["Candy Sunflower"] = v35
local v36 = {
	["PlantName"] = "Grape",
	["PlantData"] = {
		["GrowTickTime"] = NumberRange.new(8, 12),
		["GrowFruitTime"] = NumberRange.new(290, 310),
		["GrowRate"] = 0.05,
		["PlantDown"] = 1
	},
	["FruitData"] = {
		["GrowTickTime"] = NumberRange.new(0.8, 1.2),
		["GrowRate"] = 0.05,
		["PlantDown"] = -0.25
	}
}
v_u_5.Grape = v36
local v37 = {
	["PlantName"] = "Venus Fly Trap",
	["PlantData"] = {
		["GrowTickTime"] = NumberRange.new(6, 8),
		["GrowFruitTime"] = NumberRange.new(120, 160),
		["GrowRate"] = 0.05,
		["PlantDown"] = -0.5
	},
	["FruitData"] = {
		["GrowTickTime"] = NumberRange.new(3, 5),
		["GrowRate"] = 0.05,
		["PlantDown"] = 0.25
	}
}
v_u_5["Venus Fly Trap"] = v37
local v38 = {
	["PlantName"] = "Raspberry",
	["PlantData"] = {
		["GrowTickTime"] = NumberRange.new(1.6, 2.4),
		["GrowFruitTime"] = NumberRange.new(40, 60),
		["GrowRate"] = 0.02,
		["PlantDown"] = -0.5
	},
	["FruitData"] = {
		["GrowTickTime"] = NumberRange.new(0.8, 1.2),
		["GrowRate"] = 0.05,
		["PlantDown"] = 0.25
	}
}
v_u_5.Raspberry = v38
local v39 = {
	["PlantName"] = "Peach",
	["PlantData"] = {
		["GrowTickTime"] = NumberRange.new(4, 6),
		["GrowFruitTime"] = NumberRange.new(110, 130),
		["GrowRate"] = 0.05,
		["PlantDown"] = 2
	},
	["FruitData"] = {
		["GrowTickTime"] = NumberRange.new(0.8, 1.2),
		["GrowRate"] = 0.025,
		["PlantDown"] = -0.25
	}
}
v_u_5.Peach = v39
local v40 = {
	["PlantName"] = "Passionfruit",
	["PlantData"] = {
		["GrowTickTime"] = NumberRange.new(3, 5),
		["GrowFruitTime"] = NumberRange.new(2, 4),
		["GrowRate"] = 0.05,
		["PlantDown"] = -0.5
	},
	["FruitData"] = {
		["GrowTickTime"] = NumberRange.new(1, 2),
		["GrowRate"] = 0.05,
		["PlantDown"] = 0.25
	}
}
v_u_5.Passionfruit = v40
local v41 = {
	["PlantName"] = "Blueberry",
	["PlantData"] = {
		["GrowTickTime"] = NumberRange.new(1.6, 2.4),
		["GrowFruitTime"] = NumberRange.new(40, 60),
		["GrowRate"] = 0.02,
		["PlantDown"] = -0.5
	},
	["FruitData"] = {
		["GrowTickTime"] = NumberRange.new(0.8, 1.2),
		["GrowRate"] = 0.05,
		["PlantDown"] = 0.25
	}
}
v_u_5.Blueberry = v41
local v42 = {
	["PlantName"] = "Celestiberry",
	["PlantData"] = {
		["GrowTickTime"] = NumberRange.new(0.6, 0.85),
		["GrowFruitTime"] = NumberRange.new(170, 190),
		["GrowRate"] = 0.02,
		["PlantDown"] = -0.5
	},
	["FruitData"] = {
		["GrowTickTime"] = NumberRange.new(3, 4),
		["GrowRate"] = 0.04,
		["PlantDown"] = 0.25
	}
}
v_u_5.Celestiberry = v42
local v43 = {
	["PlantName"] = "Eggplant",
	["PlantData"] = {
		["GrowTickTime"] = NumberRange.new(4, 7),
		["GrowFruitTime"] = NumberRange.new(110, 130),
		["GrowRate"] = 0.05,
		["PlantDown"] = -0.5
	},
	["FruitData"] = {
		["GrowTickTime"] = NumberRange.new(1, 2),
		["GrowRate"] = 0.05,
		["PlantDown"] = 0.25
	}
}
v_u_5.Eggplant = v43
local v44 = {
	["PlantName"] = "Easter Egg",
	["PlantData"] = {
		["GrowTickTime"] = NumberRange.new(2, 3),
		["GrowFruitTime"] = NumberRange.new(120, 130),
		["GrowRate"] = 0.05,
		["PlantDown"] = -0.5
	},
	["FruitData"] = {
		["GrowTickTime"] = NumberRange.new(1.5, 2),
		["GrowRate"] = 0.05,
		["PlantDown"] = 0.25
	}
}
v_u_5["Easter Egg"] = v44
local v45 = {
	["PlantName"] = "Purple Cabbage",
	["PlantData"] = {
		["GrowTickTime"] = NumberRange.new(4, 7),
		["GrowFruitTime"] = NumberRange.new(10, 20),
		["GrowRate"] = 0.05,
		["PlantDown"] = -0.5
	},
	["FruitData"] = {
		["GrowTickTime"] = NumberRange.new(1, 2),
		["GrowRate"] = 0.05,
		["PlantDown"] = 0.25
	}
}
v_u_5["Purple Cabbage"] = v45
local v46 = {
	["PlantName"] = "Lemon",
	["PlantData"] = {
		["GrowTickTime"] = NumberRange.new(4, 6),
		["GrowFruitTime"] = NumberRange.new(110, 130),
		["GrowRate"] = 0.05,
		["PlantDown"] = -0.5
	},
	["FruitData"] = {
		["GrowTickTime"] = NumberRange.new(1, 2),
		["GrowRate"] = 0.05,
		["PlantDown"] = 0.25
	}
}
v_u_5.Lemon = v46
local v47 = {
	["PlantName"] = "Chocolate Carrot",
	["PlantData"] = {
		["GrowTickTime"] = NumberRange.new(1.5, 2.3),
		["GrowRate"] = 0.4,
		["PlantDown"] = 0.25
	}
}
v_u_5["Chocolate Carrot"] = v47
local v48 = {
	["PlantName"] = "Soul Fruit",
	["PlantData"] = {
		["GrowTickTime"] = NumberRange.new(1.5, 2),
		["GrowFruitTime"] = NumberRange.new(200, 260),
		["GrowRate"] = 0.05,
		["PlantDown"] = -0.5
	},
	["FruitData"] = {
		["GrowTickTime"] = NumberRange.new(0.8, 1.3),
		["GrowRate"] = 0.05,
		["PlantDown"] = 0.25
	}
}
v_u_5["Soul Fruit"] = v48
local v49 = {
	["PlantName"] = "Pink Tulip",
	["PlantData"] = {
		["GrowTickTime"] = NumberRange.new(0.8, 1.2),
		["GrowRate"] = 0.4,
		["PlantDown"] = 0.25
	}
}
v_u_5["Pink Tulip"] = v49
local v50 = {
	["PlantName"] = "Orange Tulip",
	["PlantData"] = {
		["GrowTickTime"] = NumberRange.new(0.8, 1.2),
		["GrowRate"] = 0.4,
		["PlantDown"] = 0.25
	}
}
v_u_5["Orange Tulip"] = v50
local v51 = {
	["PlantName"] = "Buttercup",
	["PlantData"] = {
		["GrowTickTime"] = NumberRange.new(0.8, 1.2),
		["GrowRate"] = 0.2,
		["PlantDown"] = 0.25
	}
}
v_u_5.Buttercup = v51
local v52 = {
	["PlantName"] = "Big Buttercup",
	["PlantData"] = {
		["GrowTickTime"] = NumberRange.new(0.8, 1.2),
		["GrowRate"] = 0.2,
		["PlantDown"] = 0.25
	}
}
v_u_5["Big Buttercup"] = v52
local v53 = {
	["PlantName"] = "Bigger Buttercup",
	["PlantData"] = {
		["GrowTickTime"] = NumberRange.new(0.8, 1.2),
		["GrowRate"] = 0.2,
		["PlantDown"] = 0.25
	}
}
v_u_5["Bigger Buttercup"] = v53
local v54 = {
	["PlantName"] = "Biggest Buttercup",
	["PlantData"] = {
		["GrowTickTime"] = NumberRange.new(0.8, 1.2),
		["GrowRate"] = 0.025,
		["PlantDown"] = 0.25
	}
}
v_u_5["Biggest Buttercup"] = v54
local v55 = {
	["PlantName"] = "Beast Buttercup",
	["PlantData"] = {
		["GrowTickTime"] = NumberRange.new(0.8, 1.2),
		["GrowRate"] = 0.01,
		["PlantDown"] = 0.25
	}
}
v_u_5["Beast Buttercup"] = v55
local v56 = {
	["PlantName"] = "Shadow Buttercup",
	["PlantData"] = {
		["GrowTickTime"] = NumberRange.new(0.8, 1.2),
		["GrowRate"] = 0.2,
		["PlantDown"] = 0.25
	}
}
v_u_5["Shadow Buttercup"] = v56
local v57 = {
	["PlantName"] = "Big Shadow Buttercup",
	["PlantData"] = {
		["GrowTickTime"] = NumberRange.new(0.8, 1.2),
		["GrowRate"] = 0.2,
		["PlantDown"] = 0.25
	}
}
v_u_5["Big Shadow Buttercup"] = v57
local v58 = {
	["PlantName"] = "Bigger Shadow Buttercup",
	["PlantData"] = {
		["GrowTickTime"] = NumberRange.new(0.8, 1.2),
		["GrowRate"] = 0.2,
		["PlantDown"] = 0.25
	}
}
v_u_5["Bigger Shadow Buttercup"] = v58
local v59 = {
	["PlantName"] = "Biggest Shadow Buttercup",
	["PlantData"] = {
		["GrowTickTime"] = NumberRange.new(0.8, 1.2),
		["GrowRate"] = 0.025,
		["PlantDown"] = 0.25
	}
}
v_u_5["Biggest Shadow Buttercup"] = v59
local v60 = {
	["PlantName"] = "Beast Shadow Buttercup",
	["PlantData"] = {
		["GrowTickTime"] = NumberRange.new(0.8, 1.2),
		["GrowRate"] = 0.01,
		["PlantDown"] = 0.25
	}
}
v_u_5["Beast Shadow Buttercup"] = v60
local v61 = {
	["PlantName"] = "Daffodil",
	["PlantData"] = {
		["GrowTickTime"] = NumberRange.new(0.8, 1.2),
		["GrowRate"] = 0.4,
		["PlantDown"] = 0.25
	}
}
v_u_5.Daffodil = v61
local v62 = {
	["PlantName"] = "Cherry OLD",
	["PlantData"] = {
		["GrowTickTime"] = NumberRange.new(4, 6),
		["GrowFruitTime"] = NumberRange.new(290, 310),
		["GrowRate"] = 0.05,
		["PlantDown"] = -0.5
	},
	["FruitData"] = {
		["GrowTickTime"] = NumberRange.new(0.8, 1.2),
		["GrowRate"] = 0.05,
		["PlantDown"] = -0.25
	}
}
v_u_5["Cherry OLD"] = v62
local v63 = {
	["PlantName"] = "Banana",
	["PlantData"] = {
		["GrowTickTime"] = NumberRange.new(6, 9),
		["GrowFruitTime"] = NumberRange.new(80, 140),
		["GrowRate"] = 0.05,
		["PlantDown"] = -0.5
	},
	["FruitData"] = {
		["GrowTickTime"] = NumberRange.new(1, 2),
		["GrowRate"] = 0.05,
		["PlantDown"] = 0.25
	}
}
v_u_5.Banana = v63
local v64 = {
	["PlantName"] = "Red Lollipop",
	["PlantData"] = {
		["GrowTickTime"] = NumberRange.new(1.2, 1.4),
		["GrowRate"] = 0.6,
		["PlantDown"] = 0.25
	}
}
v_u_5["Red Lollipop"] = v64
local v65 = {
	["PlantName"] = "Bamboo",
	["PlantData"] = {
		["GrowTickTime"] = NumberRange.new(1.5, 3),
		["GrowRate"] = 0.1875,
		["PlantDown"] = -0.5
	}
}
v_u_5.Bamboo = v65
local v66 = {
	["PlantName"] = "Mushroom",
	["PlantData"] = {
		["GrowTickTime"] = NumberRange.new(3, 5),
		["GrowRate"] = 0.05,
		["PlantDown"] = -0.5
	}
}
v_u_5.Mushroom = v66
local v67 = {
	["PlantName"] = "Mega Mushroom",
	["PlantData"] = {
		["GrowTickTime"] = NumberRange.new(8, 12),
		["GrowRate"] = 0.05,
		["PlantDown"] = -0.5
	}
}
v_u_5["Mega Mushroom"] = v67
local v68 = {
	["PlantName"] = "Corn",
	["PlantData"] = {
		["GrowTickTime"] = NumberRange.new(1.6, 2.4),
		["GrowFruitTime"] = NumberRange.new(70, 90),
		["GrowRate"] = 0.005,
		["PlantDown"] = 0.25
	},
	["FruitData"] = {
		["GrowTickTime"] = NumberRange.new(0.8, 1.2),
		["GrowRate"] = 0.05,
		["PlantDown"] = 0.25
	}
}
v_u_5.Corn = v68
local v69 = {
	["PlantName"] = "Cactus",
	["PlantData"] = {
		["GrowTickTime"] = NumberRange.new(8, 12),
		["GrowFruitTime"] = NumberRange.new(290, 310),
		["GrowRate"] = 0.05,
		["PlantDown"] = 2
	},
	["FruitData"] = {
		["GrowTickTime"] = NumberRange.new(0.8, 1.2),
		["GrowRate"] = 0.05,
		["PlantDown"] = -0.25
	}
}
v_u_5.Cactus = v69
local v70 = {
	["PlantName"] = "Mango",
	["PlantData"] = {
		["GrowTickTime"] = NumberRange.new(4, 6),
		["GrowFruitTime"] = NumberRange.new(290, 310),
		["GrowRate"] = 0.05,
		["PlantDown"] = 2
	},
	["FruitData"] = {
		["GrowTickTime"] = NumberRange.new(0.8, 1.2),
		["GrowRate"] = 0.025,
		["PlantDown"] = -0.25
	}
}
v_u_5.Mango = v70
local v71 = {
	["PlantName"] = "Moon Mango",
	["PlantData"] = {
		["GrowTickTime"] = NumberRange.new(5, 6.5),
		["GrowFruitTime"] = NumberRange.new(1150, 1250),
		["GrowRate"] = 0.01,
		["PlantDown"] = 2
	},
	["FruitData"] = {
		["GrowTickTime"] = NumberRange.new(0.8, 1.2),
		["GrowRate"] = 0.025,
		["PlantDown"] = -0.25
	}
}
v_u_5["Moon Mango"] = v71
local v72 = {
	["PlantName"] = "Dragon Fruit",
	["PlantData"] = {
		["GrowTickTime"] = NumberRange.new(8, 12),
		["GrowFruitTime"] = NumberRange.new(290, 310),
		["GrowRate"] = 0.05,
		["PlantDown"] = -0.5
	},
	["FruitData"] = {
		["GrowTickTime"] = NumberRange.new(1, 2),
		["GrowRate"] = 0.25,
		["PlantDown"] = -0.25
	}
}
v_u_5["Dragon Fruit"] = v72
local v73 = {
	["PlantName"] = "Pineapple",
	["PlantData"] = {
		["GrowTickTime"] = NumberRange.new(1.6, 2.4),
		["GrowFruitTime"] = NumberRange.new(70, 90),
		["GrowRate"] = 0.02,
		["PlantDown"] = 0.5
	},
	["FruitData"] = {
		["GrowTickTime"] = NumberRange.new(0.8, 1.2),
		["GrowRate"] = 0.05,
		["PlantDown"] = 0.25
	}
}
v_u_5.Pineapple = v73
local v74 = {
	["PlantName"] = "Strawberry",
	["PlantData"] = {
		["GrowTickTime"] = NumberRange.new(1.6, 2.4),
		["GrowFruitTime"] = NumberRange.new(13, 18),
		["GrowRate"] = 0.25,
		["PlantDown"] = 0.1
	},
	["FruitData"] = {
		["GrowTickTime"] = NumberRange.new(0.8, 1.2),
		["GrowRate"] = 0.25,
		["PlantDown"] = 0.25
	}
}
v_u_5.Strawberry = v74
local v75 = {
	["PlantName"] = "Cranberry",
	["PlantData"] = {
		["GrowTickTime"] = NumberRange.new(4, 7),
		["GrowFruitTime"] = NumberRange.new(110, 130),
		["GrowRate"] = 0.05,
		["PlantDown"] = -0.5
	},
	["FruitData"] = {
		["GrowTickTime"] = NumberRange.new(1, 2),
		["GrowRate"] = 0.05,
		["PlantDown"] = 0.25
	}
}
v_u_5.Cranberry = v75
local v76 = {
	["PlantName"] = "Pepper",
	["PlantData"] = {
		["GrowTickTime"] = NumberRange.new(3, 4.5),
		["GrowFruitTime"] = NumberRange.new(80, 160),
		["GrowRate"] = 0.05,
		["PlantDown"] = -0.5
	},
	["FruitData"] = {
		["GrowTickTime"] = NumberRange.new(0.8, 1.2),
		["GrowRate"] = 0.05,
		["PlantDown"] = 0.25
	}
}
v_u_5.Pepper = v76
local v77 = {
	["PlantName"] = "Papaya",
	["PlantData"] = {
		["GrowTickTime"] = NumberRange.new(6, 8),
		["GrowFruitTime"] = NumberRange.new(200, 260),
		["GrowRate"] = 0.05,
		["PlantDown"] = -0.5
	},
	["FruitData"] = {
		["GrowTickTime"] = NumberRange.new(1, 2),
		["GrowRate"] = 0.05,
		["PlantDown"] = 0.25
	}
}
v_u_5.Papaya = v77
local v78 = {
	["PlantName"] = "Lotus",
	["PlantData"] = {
		["GrowTickTime"] = NumberRange.new(2, 3.5),
		["GrowFruitTime"] = NumberRange.new(200, 230),
		["GrowRate"] = 0.05,
		["PlantDown"] = -0.5
	},
	["FruitData"] = {
		["GrowTickTime"] = NumberRange.new(2, 3),
		["GrowRate"] = 0.05,
		["PlantDown"] = 0.25
	}
}
v_u_5.Lotus = v78
local v79 = {
	["PlantName"] = "Avocado",
	["PlantData"] = {
		["GrowTickTime"] = NumberRange.new(5, 6),
		["GrowFruitTime"] = NumberRange.new(80, 160),
		["GrowRate"] = 0.005,
		["PlantDown"] = -0.5
	},
	["FruitData"] = {
		["GrowTickTime"] = NumberRange.new(2, 3),
		["GrowRate"] = 0.05,
		["PlantDown"] = 0.25
	}
}
v_u_5.Avocado = v79
local v80 = {
	["PlantName"] = "Starfruit",
	["PlantData"] = {
		["GrowTickTime"] = NumberRange.new(4, 6),
		["GrowFruitTime"] = NumberRange.new(80, 160),
		["GrowRate"] = 0.05,
		["PlantDown"] = -0.5
	},
	["FruitData"] = {
		["GrowTickTime"] = NumberRange.new(0.8, 1.2),
		["GrowRate"] = 0.05,
		["PlantDown"] = 0.25
	}
}
v_u_5.Starfruit = v80
local v81 = {
	["PlantName"] = "Mint",
	["PlantData"] = {
		["GrowTickTime"] = NumberRange.new(2, 4),
		["GrowFruitTime"] = NumberRange.new(90, 120),
		["GrowRate"] = 0.1875,
		["PlantDown"] = -0.5
	},
	["FruitData"] = {
		["GrowTickTime"] = NumberRange.new(2, 4),
		["GrowRate"] = 0.05,
		["PlantDown"] = 0.25
	}
}
v_u_5.Mint = v81
local v82 = {
	["PlantName"] = "Moon Blossom",
	["PlantData"] = {
		["GrowTickTime"] = NumberRange.new(4, 6),
		["GrowFruitTime"] = NumberRange.new(120, 180),
		["GrowRate"] = 0.05,
		["PlantDown"] = -0.5
	},
	["FruitData"] = {
		["GrowTickTime"] = NumberRange.new(1, 2),
		["GrowRate"] = 0.05,
		["PlantDown"] = 0.25
	}
}
v_u_5["Moon Blossom"] = v82
local v83 = {
	["PlantName"] = "Nightshade",
	["PlantData"] = {
		["GrowTickTime"] = NumberRange.new(1.5, 3),
		["GrowRate"] = 0.1875,
		["PlantDown"] = -0.5
	}
}
v_u_5.Nightshade = v83
local v84 = {
	["PlantName"] = "Durian",
	["PlantData"] = {
		["GrowTickTime"] = NumberRange.new(5, 7.5),
		["GrowFruitTime"] = NumberRange.new(200, 230),
		["GrowRate"] = 0.05,
		["PlantDown"] = -0.5
	},
	["FruitData"] = {
		["GrowTickTime"] = NumberRange.new(2, 3),
		["GrowRate"] = 0.05,
		["PlantDown"] = 0.25
	}
}
v_u_5.Durian = v84
local v85 = {
	["PlantName"] = "Moonflower",
	["PlantData"] = {
		["GrowTickTime"] = NumberRange.new(2, 4),
		["GrowFruitTime"] = NumberRange.new(60, 90),
		["GrowRate"] = 0.1875,
		["PlantDown"] = -0.5
	},
	["FruitData"] = {
		["GrowTickTime"] = NumberRange.new(0.8, 1.2),
		["GrowRate"] = 0.05,
		["PlantDown"] = 0.25
	}
}
v_u_5.Moonflower = v85
local v86 = {
	["PlantName"] = "Moonglow",
	["PlantData"] = {
		["GrowTickTime"] = NumberRange.new(3, 4.5),
		["GrowFruitTime"] = NumberRange.new(80, 160),
		["GrowRate"] = 0.05,
		["PlantDown"] = -0.5
	},
	["FruitData"] = {
		["GrowTickTime"] = NumberRange.new(1, 2),
		["GrowRate"] = 0.05,
		["PlantDown"] = 0.25
	}
}
v_u_5.Moonglow = v86
local v87 = {
	["PlantName"] = "Glowshroom",
	["PlantData"] = {
		["GrowTickTime"] = NumberRange.new(2, 4),
		["GrowFruitTime"] = NumberRange.new(60, 90),
		["GrowRate"] = 0.1875,
		["PlantDown"] = -0.5
	},
	["FruitData"] = {
		["GrowTickTime"] = NumberRange.new(1, 2),
		["GrowRate"] = 0.05,
		["PlantDown"] = 0.25
	}
}
v_u_5.Glowshroom = v87
local v88 = {
	["PlantName"] = "Cursed Fruit",
	["PlantData"] = {
		["GrowTickTime"] = NumberRange.new(6, 8),
		["GrowFruitTime"] = NumberRange.new(120, 180),
		["GrowRate"] = 0.05,
		["PlantDown"] = -0.5
	},
	["FruitData"] = {
		["GrowTickTime"] = NumberRange.new(1, 2),
		["GrowRate"] = 0.05,
		["PlantDown"] = 0.25
	}
}
v_u_5["Cursed Fruit"] = v88
local v89 = {
	["PlantName"] = "Crimson Vine",
	["PlantData"] = {
		["GrowTickTime"] = NumberRange.new(1.6, 2.4),
		["GrowFruitTime"] = NumberRange.new(40, 60),
		["GrowRate"] = 0.02,
		["PlantDown"] = -0.5
	},
	["FruitData"] = {
		["GrowTickTime"] = NumberRange.new(0.8, 1.2),
		["GrowRate"] = 0.05,
		["PlantDown"] = 0.25
	}
}
v_u_5["Crimson Vine"] = v89
local v90 = {
	["PlantName"] = "Moon Melon",
	["PlantData"] = {
		["GrowTickTime"] = NumberRange.new(8, 12),
		["GrowFruitTime"] = NumberRange.new(140, 200),
		["GrowRate"] = 0.05,
		["PlantDown"] = -0.5
	},
	["FruitData"] = {
		["GrowTickTime"] = NumberRange.new(15, 20),
		["GrowRate"] = 0.05,
		["PlantDown"] = 0.25
	}
}
v_u_5["Moon Melon"] = v90
local v91 = {
	["PlantName"] = "Blood Banana",
	["PlantData"] = {
		["GrowTickTime"] = NumberRange.new(6, 9),
		["GrowFruitTime"] = NumberRange.new(80, 140),
		["GrowRate"] = 0.05,
		["PlantDown"] = -0.5
	},
	["FruitData"] = {
		["GrowTickTime"] = NumberRange.new(1, 2),
		["GrowRate"] = 0.05,
		["PlantDown"] = 0.25
	}
}
v_u_5["Blood Banana"] = v91
local v92 = {
	["PlantName"] = "Broccoli",
	["PlantData"] = {
		["GrowTickTime"] = NumberRange.new(16, 24),
		["GrowFruitTime"] = NumberRange.new(50, 90),
		["GrowRate"] = 0.025,
		["PlantDown"] = 0
	},
	["FruitData"] = {
		["GrowTickTime"] = NumberRange.new(8, 8.35),
		["GrowRate"] = 0.01,
		["PlantDown"] = 0
	}
}
v_u_5.Broccoli = v92
local v93 = {
	["PlantName"] = "Potato",
	["PlantData"] = {
		["GrowTickTime"] = NumberRange.new(10, 10),
		["GrowFruitTime"] = NumberRange.new(10, 20),
		["GrowRate"] = 0.02,
		["PlantDown"] = 0
	},
	["FruitData"] = {
		["GrowTickTime"] = NumberRange.new(1, 2),
		["GrowRate"] = 0.01,
		["PlantDown"] = 0
	}
}
v_u_5.Potato = v93
local v94 = {
	["PlantName"] = "Brussels Sprout",
	["PlantData"] = {
		["GrowTickTime"] = NumberRange.new(5, 6),
		["GrowFruitTime"] = NumberRange.new(90, 110),
		["GrowRate"] = 0.005,
		["PlantDown"] = -0.1
	},
	["FruitData"] = {
		["GrowTickTime"] = NumberRange.new(1, 2),
		["GrowRate"] = 0.05,
		["PlantDown"] = 0
	}
}
v_u_5["Brussels Sprout"] = v94
local v95 = {
	["PlantName"] = "Cocomango",
	["PlantData"] = {
		["GrowTickTime"] = NumberRange.new(4, 6),
		["GrowFruitTime"] = NumberRange.new(20, 40),
		["GrowRate"] = 0.01,
		["PlantDown"] = -0.5
	},
	["FruitData"] = {
		["GrowTickTime"] = NumberRange.new(10, 20),
		["GrowRate"] = 0.05,
		["PlantDown"] = 0.25
	}
}
v_u_5.Cocomango = v95
local v96 = {
	["PlantName"] = "Rose",
	["PlantData"] = {
		["GrowTickTime"] = NumberRange.new(7, 9),
		["GrowFruitTime"] = NumberRange.new(220, 300),
		["GrowRate"] = 0.1,
		["PlantDown"] = -1.15
	},
	["FruitData"] = {
		["GrowTickTime"] = NumberRange.new(4, 6),
		["GrowRate"] = 0.05,
		["PlantDown"] = 0.25
	}
}
v_u_5.Rose = v96
local v97 = {
	["PlantName"] = "Foxglove",
	["PlantData"] = {
		["GrowTickTime"] = NumberRange.new(10, 12),
		["GrowFruitTime"] = NumberRange.new(33, 44),
		["GrowRate"] = 0.05,
		["PlantDown"] = 0
	},
	["FruitData"] = {
		["GrowTickTime"] = NumberRange.new(3.5, 5),
		["GrowRate"] = 0.05,
		["PlantDown"] = 0
	}
}
v_u_5.Foxglove = v97
local v98 = {
	["PlantName"] = "Lilac",
	["PlantData"] = {
		["GrowTickTime"] = NumberRange.new(2, 4),
		["GrowFruitTime"] = NumberRange.new(60, 90),
		["GrowRate"] = 0.1875,
		["PlantDown"] = -0.5
	},
	["FruitData"] = {
		["GrowTickTime"] = NumberRange.new(1, 2),
		["GrowRate"] = 0.05,
		["PlantDown"] = 0.25
	}
}
v_u_5.Lilac = v98
local v99 = {
	["PlantName"] = "Pink Lily",
	["PlantData"] = {
		["GrowTickTime"] = NumberRange.new(3, 5),
		["GrowFruitTime"] = NumberRange.new(120, 160),
		["GrowRate"] = 0.05,
		["PlantDown"] = -1
	},
	["FruitData"] = {
		["GrowTickTime"] = NumberRange.new(3, 5),
		["GrowRate"] = 0.05,
		["PlantDown"] = 0.25
	}
}
v_u_5["Pink Lily"] = v99
local v100 = {
	["PlantName"] = "Purple Dahlia",
	["PlantData"] = {
		["GrowTickTime"] = NumberRange.new(3, 5),
		["GrowFruitTime"] = NumberRange.new(120, 160),
		["GrowRate"] = 0.05,
		["PlantDown"] = -0.5
	},
	["FruitData"] = {
		["GrowTickTime"] = NumberRange.new(3, 5),
		["GrowRate"] = 0.05,
		["PlantDown"] = 0.25
	}
}
v_u_5["Purple Dahlia"] = v100
local v101 = {
	["PlantName"] = "Legacy Sunflower",
	["PlantData"] = {
		["GrowTickTime"] = NumberRange.new(7, 10),
		["GrowFruitTime"] = NumberRange.new(220, 300),
		["GrowRate"] = 0.025,
		["PlantDown"] = -1.15
	},
	["FruitData"] = {
		["GrowTickTime"] = NumberRange.new(4, 6),
		["GrowRate"] = 0.05,
		["PlantDown"] = 0.25
	}
}
v_u_5["Legacy Sunflower"] = v101
local v102 = {
	["PlantName"] = "Lavender",
	["PlantData"] = {
		["GrowTickTime"] = NumberRange.new(6, 8),
		["GrowRate"] = 0.07,
		["PlantDown"] = 0.25
	}
}
v_u_5.Lavender = v102
local v103 = {
	["PlantName"] = "Nectarshade",
	["PlantData"] = {
		["GrowTickTime"] = NumberRange.new(6, 8),
		["GrowRate"] = 0.1,
		["PlantDown"] = 0.25
	}
}
v_u_5.Nectarshade = v103
local v104 = {
	["PlantName"] = "Nectarine",
	["PlantData"] = {
		["GrowTickTime"] = NumberRange.new(12, 18),
		["GrowFruitTime"] = NumberRange.new(60, 90),
		["GrowRate"] = 0.1,
		["PlantDown"] = -0.5
	},
	["FruitData"] = {
		["GrowTickTime"] = NumberRange.new(14, 21),
		["GrowRate"] = 0.05,
		["PlantDown"] = 0.25
	}
}
v_u_5.Nectarine = v104
local v105 = {
	["PlantName"] = "Hive Fruit",
	["PlantData"] = {
		["GrowTickTime"] = NumberRange.new(7.5, 10),
		["GrowFruitTime"] = NumberRange.new(80, 160),
		["GrowRate"] = 0.05,
		["PlantDown"] = -1.15
	},
	["FruitData"] = {
		["GrowTickTime"] = NumberRange.new(4, 6),
		["GrowRate"] = 0.025,
		["PlantDown"] = 0.25
	}
}
v_u_5["Hive Fruit"] = v105
local v106 = {
	["PlantName"] = "Manuka Flower",
	["PlantData"] = {
		["GrowTickTime"] = NumberRange.new(4, 6),
		["GrowRate"] = 0.06,
		["PlantDown"] = 0.25
	}
}
v_u_5["Manuka Flower"] = v106
local v107 = {
	["PlantName"] = "Dandelion",
	["PlantData"] = {
		["GrowTickTime"] = NumberRange.new(2.5, 4),
		["GrowRate"] = 0.01,
		["PlantDown"] = 0.25
	}
}
v_u_5.Dandelion = v107
local v108 = {
	["PlantName"] = "Lumira",
	["PlantData"] = {
		["GrowTickTime"] = NumberRange.new(3.5, 4.5),
		["GrowFruitTime"] = NumberRange.new(60, 80),
		["GrowRate"] = 0.02,
		["PlantDown"] = -0.5
	},
	["FruitData"] = {
		["GrowTickTime"] = NumberRange.new(6, 8),
		["GrowRate"] = 0.01,
		["PlantDown"] = 0.25
	}
}
v_u_5.Lumira = v108
local v109 = {
	["PlantName"] = "Honeysuckle",
	["PlantData"] = {
		["GrowTickTime"] = NumberRange.new(12, 14),
		["GrowFruitTime"] = NumberRange.new(110, 160),
		["GrowRate"] = 0.02,
		["PlantDown"] = -1.15
	},
	["FruitData"] = {
		["GrowTickTime"] = NumberRange.new(7, 9),
		["GrowRate"] = 0.035,
		["PlantDown"] = 0.25
	}
}
v_u_5.Honeysuckle = v109
local v110 = {
	["PlantName"] = "Crocus",
	["PlantData"] = {
		["GrowTickTime"] = NumberRange.new(2.75, 3.75),
		["GrowRate"] = 0.025,
		["PlantDown"] = 0.25
	}
}
v_u_5.Crocus = v110
local v111 = {
	["PlantName"] = "Succulent",
	["PlantData"] = {
		["GrowTickTime"] = NumberRange.new(6.75, 8.25),
		["GrowFruitTime"] = NumberRange.new(110, 130),
		["GrowRate"] = 0.025,
		["PlantDown"] = -0.5
	},
	["FruitData"] = {
		["GrowTickTime"] = NumberRange.new(7, 9),
		["GrowRate"] = 0.025,
		["PlantDown"] = 0.25
	}
}
v_u_5.Succulent = v111
local v112 = {
	["PlantName"] = "Violet Corn",
	["PlantData"] = {
		["GrowTickTime"] = NumberRange.new(1.6, 2.4),
		["GrowFruitTime"] = NumberRange.new(60, 80),
		["GrowRate"] = 0.05,
		["PlantDown"] = 0.25
	},
	["FruitData"] = {
		["GrowTickTime"] = NumberRange.new(0.8, 1.2),
		["GrowRate"] = 0.05,
		["PlantDown"] = 0.25
	}
}
v_u_5["Violet Corn"] = v112
local v113 = {
	["PlantName"] = "Bendboo",
	["PlantData"] = {
		["GrowTickTime"] = NumberRange.new(1.5, 4.5),
		["GrowRate"] = 0.1875,
		["PlantDown"] = 0
	}
}
v_u_5.Bendboo = v113
local v114 = {
	["PlantName"] = "Cocovine",
	["PlantData"] = {
		["GrowTickTime"] = NumberRange.new(3.8, 4.25),
		["GrowFruitTime"] = NumberRange.new(900, 1000),
		["GrowRate"] = 0.01,
		["PlantDown"] = 2
	},
	["FruitData"] = {
		["GrowTickTime"] = NumberRange.new(0.8, 1.2),
		["GrowRate"] = 0.025,
		["PlantDown"] = -0.25
	}
}
v_u_5.Cocovine = v114
local v115 = {
	["PlantName"] = "Dragon Pepper",
	["PlantData"] = {
		["GrowTickTime"] = NumberRange.new(4, 6),
		["GrowFruitTime"] = NumberRange.new(120, 180),
		["GrowRate"] = 0.05,
		["PlantDown"] = -0.5
	},
	["FruitData"] = {
		["GrowTickTime"] = NumberRange.new(4, 5),
		["GrowRate"] = 0.05,
		["PlantDown"] = 0.25
	}
}
v_u_5["Dragon Pepper"] = v115
local v116 = {
	["PlantName"] = "Bee Balm",
	["PlantData"] = {
		["GrowTickTime"] = NumberRange.new(24, 27),
		["GrowFruitTime"] = NumberRange.new(18, 22),
		["GrowRate"] = 0.03,
		["PlantDown"] = 0.1
	},
	["FruitData"] = {
		["GrowTickTime"] = NumberRange.new(2, 3.5),
		["GrowRate"] = 0.05,
		["PlantDown"] = 0.25
	}
}
v_u_5["Bee Balm"] = v116
local v117 = {
	["PlantName"] = "Nectarine",
	["PlantData"] = {
		["GrowTickTime"] = NumberRange.new(18, 22),
		["GrowFruitTime"] = NumberRange.new(70, 100),
		["GrowRate"] = 0.05,
		["PlantDown"] = -0.5
	},
	["FruitData"] = {
		["GrowTickTime"] = NumberRange.new(20, 24),
		["GrowRate"] = 0.025,
		["PlantDown"] = 0.25
	}
}
v_u_5["Nectar Thorn"] = v117
local v118 = {
	["PlantName"] = "Suncoil",
	["PlantData"] = {
		["GrowTickTime"] = NumberRange.new(6.5, 8.5),
		["GrowFruitTime"] = NumberRange.new(80, 90),
		["GrowRate"] = 0.025,
		["PlantDown"] = -0.5
	},
	["FruitData"] = {
		["GrowTickTime"] = NumberRange.new(5, 8),
		["GrowRate"] = 0.1,
		["PlantDown"] = 0.25
	}
}
v_u_5.Suncoil = v118
local v119 = {
	["PlantName"] = "Noble Flower",
	["PlantData"] = {
		["GrowTickTime"] = NumberRange.new(10, 12),
		["GrowFruitTime"] = NumberRange.new(33, 44),
		["GrowRate"] = 0.05,
		["PlantDown"] = 0
	},
	["FruitData"] = {
		["GrowTickTime"] = NumberRange.new(3.5, 5),
		["GrowRate"] = 0.05,
		["PlantDown"] = 0
	}
}
v_u_5["Noble Flower"] = v119
local v120 = {
	["PlantName"] = "Ice Cream Bean",
	["PlantData"] = {
		["GrowTickTime"] = NumberRange.new(12, 14),
		["GrowFruitTime"] = NumberRange.new(60, 120),
		["GrowRate"] = 0.025,
		["PlantDown"] = 0
	},
	["FruitData"] = {
		["GrowTickTime"] = NumberRange.new(4, 6),
		["GrowRate"] = 0.025,
		["PlantDown"] = 0
	}
}
v_u_5["Ice Cream Bean"] = v120
local v121 = {
	["PlantName"] = "Lime",
	["PlantData"] = {
		["GrowTickTime"] = NumberRange.new(5, 6.5),
		["GrowFruitTime"] = NumberRange.new(120, 160),
		["GrowRate"] = 0.075,
		["PlantDown"] = -0.5
	},
	["FruitData"] = {
		["GrowTickTime"] = NumberRange.new(4, 6),
		["GrowRate"] = 0.025,
		["PlantDown"] = 0.25
	}
}
v_u_5.Lime = v121
local v122 = {
	["PlantName"] = "Cauliflower",
	["PlantData"] = {
		["GrowTickTime"] = NumberRange.new(12, 14),
		["GrowFruitTime"] = NumberRange.new(80, 90),
		["GrowRate"] = 0.015,
		["PlantDown"] = 0
	},
	["FruitData"] = {
		["GrowTickTime"] = NumberRange.new(10, 13),
		["GrowRate"] = 0.1,
		["PlantDown"] = 0
	}
}
v_u_5.Cauliflower = v122
local v123 = {
	["PlantName"] = "Green Apple",
	["PlantData"] = {
		["GrowTickTime"] = NumberRange.new(9, 12),
		["GrowFruitTime"] = NumberRange.new(140, 180),
		["GrowRate"] = 0.005,
		["PlantDown"] = 0
	},
	["FruitData"] = {
		["GrowTickTime"] = NumberRange.new(8, 10),
		["GrowRate"] = 0.05,
		["PlantDown"] = 0
	}
}
v_u_5["Green Apple"] = v123
local v124 = {
	["PlantName"] = "Kiwi",
	["PlantData"] = {
		["GrowTickTime"] = NumberRange.new(5, 10),
		["GrowFruitTime"] = NumberRange.new(200, 220),
		["GrowRate"] = 0.005,
		["PlantDown"] = 0
	},
	["FruitData"] = {
		["GrowTickTime"] = NumberRange.new(0.8, 1.2),
		["GrowRate"] = 0.025,
		["PlantDown"] = 0
	}
}
v_u_5.Kiwi = v124
local v125 = {
	["PlantName"] = "Bell Pepper",
	["PlantData"] = {
		["GrowTickTime"] = NumberRange.new(9, 13),
		["GrowFruitTime"] = NumberRange.new(90, 170),
		["GrowRate"] = 0.04,
		["PlantDown"] = -0.5
	},
	["FruitData"] = {
		["GrowTickTime"] = NumberRange.new(4, 8),
		["GrowRate"] = 0.06,
		["PlantDown"] = 0.25
	}
}
v_u_5["Bell Pepper"] = v125
local v126 = {
	["PlantName"] = "Prickly Pear",
	["PlantData"] = {
		["GrowTickTime"] = NumberRange.new(19, 25),
		["GrowFruitTime"] = NumberRange.new(290, 310),
		["GrowRate"] = 0.05,
		["PlantDown"] = -0.5
	},
	["FruitData"] = {
		["GrowTickTime"] = NumberRange.new(10, 16),
		["GrowRate"] = 0.25,
		["PlantDown"] = -0.25
	}
}
v_u_5["Prickly Pear"] = v126
local v127 = {
	["PlantName"] = "Feijoa",
	["PlantData"] = {
		["GrowTickTime"] = NumberRange.new(8, 12),
		["GrowFruitTime"] = NumberRange.new(260, 290),
		["GrowRate"] = 0.005,
		["PlantDown"] = 0
	},
	["FruitData"] = {
		["GrowTickTime"] = NumberRange.new(1.5, 2),
		["GrowRate"] = 0.025,
		["PlantDown"] = -0.25
	}
}
v_u_5.Feijoa = v127
local v128 = {
	["PlantName"] = "Loquat",
	["PlantData"] = {
		["GrowTickTime"] = NumberRange.new(10, 15),
		["GrowFruitTime"] = NumberRange.new(120, 140),
		["GrowRate"] = 0.005,
		["PlantDown"] = 0
	},
	["FruitData"] = {
		["GrowTickTime"] = NumberRange.new(7, 10),
		["GrowRate"] = 0.025,
		["PlantDown"] = 0
	}
}
v_u_5.Loquat = v128
local v129 = {
	["PlantName"] = "Delphinium",
	["PlantData"] = {
		["GrowTickTime"] = NumberRange.new(8.25, 9),
		["GrowRate"] = 0.05,
		["PlantDown"] = 0.25
	}
}
v_u_5.Delphinium = v129
local v130 = {
	["PlantName"] = "Lily of the Valley",
	["PlantData"] = {
		["GrowTickTime"] = NumberRange.new(10, 12),
		["GrowFruitTime"] = NumberRange.new(120, 160),
		["GrowRate"] = 0.0175,
		["PlantDown"] = 0
	},
	["FruitData"] = {
		["GrowTickTime"] = NumberRange.new(15, 18),
		["GrowRate"] = 0.0125,
		["PlantDown"] = 0
	}
}
v_u_5["Lily of the Valley"] = v130
local v131 = {
	["PlantName"] = "Traveler\'s Fruit",
	["PlantData"] = {
		["GrowTickTime"] = NumberRange.new(25, 30),
		["GrowFruitTime"] = NumberRange.new(300, 320),
		["GrowRate"] = 0.01,
		["PlantDown"] = 0
	},
	["FruitData"] = {
		["GrowTickTime"] = NumberRange.new(2, 3),
		["GrowRate"] = 0.01,
		["PlantDown"] = 0
	}
}
v_u_5["Traveler\'s Fruit"] = v131
local v132 = {
	["PlantName"] = "Peace Lily",
	["PlantData"] = {
		["GrowTickTime"] = NumberRange.new(3, 4),
		["GrowRate"] = 0.05,
		["PlantDown"] = 0.25
	}
}
v_u_5["Peace Lily"] = v132
local v133 = {
	["PlantName"] = "Aloe Vera",
	["PlantData"] = {
		["GrowTickTime"] = NumberRange.new(12, 16),
		["GrowRate"] = 0.016,
		["PlantDown"] = 0.35
	}
}
v_u_5["Aloe Vera"] = v133
local v134 = {
	["PlantName"] = "Rafflesia",
	["PlantData"] = {
		["GrowTickTime"] = NumberRange.new(12, 13.5),
		["GrowRate"] = 0.01225,
		["PlantDown"] = 0
	}
}
v_u_5.Rafflesia = v134
local v135 = {
	["PlantName"] = "Guanabana",
	["PlantData"] = {
		["GrowTickTime"] = NumberRange.new(40, 45),
		["GrowFruitTime"] = NumberRange.new(90, 150),
		["GrowRate"] = 0.012,
		["PlantDown"] = 0
	},
	["FruitData"] = {
		["GrowTickTime"] = NumberRange.new(5, 8),
		["GrowRate"] = 0.0125,
		["PlantDown"] = 0
	}
}
v_u_5.Guanabana = v135
local v136 = {
	["PlantName"] = "Wild Carrot",
	["PlantData"] = {
		["GrowTickTime"] = NumberRange.new(0.6, 0.75),
		["GrowRate"] = 0.1,
		["PlantDown"] = 0.25
	}
}
v_u_5["Wild Carrot"] = v136
local v137 = {
	["PlantName"] = "Pear",
	["PlantData"] = {
		["GrowTickTime"] = NumberRange.new(3, 3.5),
		["GrowFruitTime"] = NumberRange.new(40, 60),
		["GrowRate"] = 0.025,
		["PlantDown"] = 0.25
	},
	["FruitData"] = {
		["GrowTickTime"] = NumberRange.new(1.25, 2),
		["GrowRate"] = 0.02,
		["PlantDown"] = 0.25
	}
}
v_u_5.Pear = v137
local v138 = {
	["PlantName"] = "Cantaloupe",
	["PlantData"] = {
		["GrowTickTime"] = NumberRange.new(9.5, 10.25),
		["GrowFruitTime"] = NumberRange.new(70, 90),
		["GrowRate"] = 0.0325,
		["PlantDown"] = -0.5
	},
	["FruitData"] = {
		["GrowTickTime"] = NumberRange.new(9, 11),
		["GrowRate"] = 0.0285,
		["PlantDown"] = 0.25
	}
}
v_u_5.Cantaloupe = v138
local v139 = {
	["PlantName"] = "Parasol Flower",
	["PlantData"] = {
		["GrowTickTime"] = NumberRange.new(20, 25),
		["GrowRate"] = 0.05,
		["PlantDown"] = 0.5
	}
}
v_u_5["Parasol Flower"] = v139
local v140 = {
	["PlantName"] = "Rosy Delight",
	["PlantData"] = {
		["GrowTickTime"] = NumberRange.new(12, 16),
		["GrowFruitTime"] = NumberRange.new(120, 160),
		["GrowRate"] = 0.015,
		["PlantDown"] = 0
	},
	["FruitData"] = {
		["GrowTickTime"] = NumberRange.new(15, 18),
		["GrowRate"] = 0.0125,
		["PlantDown"] = 0
	}
}
v_u_5["Rosy Delight"] = v140
local v141 = {
	["PlantName"] = "Elephant Ears",
	["PlantData"] = {
		["GrowTickTime"] = NumberRange.new(20, 35),
		["GrowFruitTime"] = NumberRange.new(150, 180),
		["GrowRate"] = 0.01,
		["PlantDown"] = 0
	},
	["FruitData"] = {
		["GrowTickTime"] = NumberRange.new(15, 20),
		["GrowRate"] = 0.01,
		["PlantDown"] = 0
	}
}
v_u_5["Elephant Ears"] = v141
local v142 = {
	["PlantName"] = "Liberty Lily",
	["PlantData"] = {
		["GrowTickTime"] = NumberRange.new(11.2, 11.4),
		["GrowFruitTime"] = NumberRange.new(120, 150),
		["GrowRate"] = 0.01,
		["PlantDown"] = 0
	},
	["FruitData"] = {
		["GrowTickTime"] = NumberRange.new(7, 7.4),
		["GrowRate"] = 0.0145,
		["PlantDown"] = 0
	}
}
v_u_5["Liberty Lily"] = v142
local v143 = {
	["PlantName"] = "Firework Flower",
	["PlantData"] = {
		["GrowTickTime"] = NumberRange.new(10, 15),
		["GrowRate"] = 0.07,
		["PlantDown"] = 2
	}
}
v_u_5["Firework Flower"] = v143
local v144 = {
	["PlantName"] = "White Mulberry",
	["PlantData"] = {
		["GrowTickTime"] = NumberRange.new(10, 12),
		["GrowFruitTime"] = NumberRange.new(150, 180),
		["GrowRate"] = 0.015,
		["PlantDown"] = 0
	},
	["FruitData"] = {
		["GrowTickTime"] = NumberRange.new(8, 9),
		["GrowRate"] = 0.025,
		["PlantDown"] = 0
	}
}
v_u_5["White Mulberry"] = v144
local v145 = {
	["PlantName"] = "Merica Mushroom",
	["PlantData"] = {
		["GrowTickTime"] = NumberRange.new(3, 5),
		["GrowRate"] = 0.07,
		["PlantDown"] = 2
	}
}
v_u_5["Merica Mushroom"] = v145
local v146 = {
	["PlantName"] = "Pitcher Plant",
	["PlantData"] = {
		["GrowTickTime"] = NumberRange.new(22, 24),
		["GrowFruitTime"] = NumberRange.new(900, 1000),
		["GrowRate"] = 0.01,
		["PlantDown"] = 0
	},
	["FruitData"] = {
		["GrowTickTime"] = NumberRange.new(4, 5),
		["GrowRate"] = 0.025,
		["PlantDown"] = 0
	}
}
v_u_5["Pitcher Plant"] = v146
local v147 = {
	["PlantName"] = "Bone Blossom",
	["PlantData"] = {
		["GrowTickTime"] = NumberRange.new(6, 8),
		["GrowFruitTime"] = NumberRange.new(100, 140),
		["GrowRate"] = 0.009,
		["PlantDown"] = -0.5
	},
	["FruitData"] = {
		["GrowTickTime"] = NumberRange.new(4.8, 6),
		["GrowRate"] = 0.025,
		["PlantDown"] = 0.25
	}
}
v_u_5["Bone Blossom"] = v147
local v148 = {
	["PlantName"] = "Stonebite",
	["PlantData"] = {
		["GrowTickTime"] = NumberRange.new(4, 6),
		["GrowRate"] = 0.1,
		["PlantDown"] = 0
	}
}
v_u_5.Stonebite = v148
local v149 = {
	["PlantName"] = "Paradise Petal",
	["PlantData"] = {
		["GrowTickTime"] = NumberRange.new(8, 9),
		["GrowFruitTime"] = NumberRange.new(120, 150),
		["GrowRate"] = 0.05,
		["PlantDown"] = 0
	},
	["FruitData"] = {
		["GrowTickTime"] = NumberRange.new(4.8, 6),
		["GrowRate"] = 0.05,
		["PlantDown"] = 0
	}
}
v_u_5["Paradise Petal"] = v149
local v150 = {
	["PlantName"] = "Horned Dinoshroom",
	["PlantData"] = {
		["GrowTickTime"] = NumberRange.new(10, 12),
		["GrowFruitTime"] = NumberRange.new(60, 80),
		["GrowRate"] = 0.02,
		["PlantDown"] = 0
	},
	["FruitData"] = {
		["GrowTickTime"] = NumberRange.new(3.6, 6),
		["GrowRate"] = 0.05,
		["PlantDown"] = 0
	}
}
v_u_5["Horned Dinoshroom"] = v150
local v151 = {
	["PlantName"] = "Boneboo",
	["PlantData"] = {
		["GrowTickTime"] = NumberRange.new(16, 20),
		["GrowRate"] = 0.1875,
		["PlantDown"] = 0.5
	}
}
v_u_5.Boneboo = v151
local v152 = {
	["PlantName"] = "Firefly Fern",
	["PlantData"] = {
		["GrowTickTime"] = NumberRange.new(12, 16),
		["GrowFruitTime"] = NumberRange.new(220, 240),
		["GrowRate"] = 0.01,
		["PlantDown"] = 0
	},
	["FruitData"] = {
		["GrowTickTime"] = NumberRange.new(6, 12),
		["GrowRate"] = 0.1,
		["PlantDown"] = 0
	}
}
v_u_5["Firefly Fern"] = v152
local v153 = {
	["PlantName"] = "Fossilight",
	["PlantData"] = {
		["GrowTickTime"] = NumberRange.new(6, 8),
		["GrowFruitTime"] = NumberRange.new(300, 360),
		["GrowRate"] = 0.005,
		["PlantDown"] = 0
	},
	["FruitData"] = {
		["GrowTickTime"] = NumberRange.new(7.2, 9.6),
		["GrowRate"] = 0.05,
		["PlantDown"] = 0
	}
}
v_u_5.Fossilight = v153
local v154 = {
	["PlantName"] = "Horsetail",
	["PlantData"] = {
		["GrowTickTime"] = NumberRange.new(8, 9),
		["GrowRate"] = 0.1,
		["PlantDown"] = 0.25
	}
}
v_u_5.Horsetail = v154
local v155 = {
	["PlantName"] = "Lingonberry",
	["PlantData"] = {
		["GrowTickTime"] = NumberRange.new(5.5, 5.8),
		["GrowFruitTime"] = NumberRange.new(100, 140),
		["GrowRate"] = 0.04,
		["PlantDown"] = 0
	},
	["FruitData"] = {
		["GrowTickTime"] = NumberRange.new(4, 5),
		["GrowRate"] = 0.05,
		["PlantDown"] = 0
	}
}
v_u_5.Lingonberry = v155
local v156 = {
	["PlantName"] = "Amber Spine",
	["PlantData"] = {
		["GrowTickTime"] = NumberRange.new(6, 8),
		["GrowFruitTime"] = NumberRange.new(120, 150),
		["GrowRate"] = 0.005,
		["PlantDown"] = 0
	},
	["FruitData"] = {
		["GrowTickTime"] = NumberRange.new(7, 8),
		["GrowRate"] = 0.01,
		["PlantDown"] = 0
	}
}
v_u_5["Amber Spine"] = v156
local v157 = {
	["PlantName"] = "Grand Volcania",
	["PlantData"] = {
		["GrowTickTime"] = NumberRange.new(18.25, 18.75),
		["GrowFruitTime"] = NumberRange.new(80, 120),
		["GrowRate"] = 0.005,
		["PlantDown"] = 0
	},
	["FruitData"] = {
		["GrowTickTime"] = NumberRange.new(7, 7.25),
		["GrowRate"] = 0.0185,
		["PlantDown"] = 0
	}
}
v_u_5["Grand Volcania"] = v157
local v158 = {
	["PlantName"] = "Monoblooma",
	["PlantData"] = {
		["GrowTickTime"] = NumberRange.new(0.8, 1.3),
		["GrowRate"] = 0.035,
		["PlantDown"] = 0.25
	}
}
v_u_5.Monoblooma = v158
local v159 = {
	["PlantName"] = "Serenity",
	["PlantData"] = {
		["GrowTickTime"] = NumberRange.new(15, 16),
		["GrowFruitTime"] = NumberRange.new(40, 60),
		["GrowRate"] = 0.02,
		["PlantDown"] = 0.1
	},
	["FruitData"] = {
		["GrowTickTime"] = NumberRange.new(0.8, 1.2),
		["GrowRate"] = 0.015,
		["PlantDown"] = 0
	}
}
v_u_5.Serenity = v159
local v160 = {
	["PlantName"] = "Taro Flower",
	["PlantData"] = {
		["GrowTickTime"] = NumberRange.new(8.25, 9),
		["GrowRate"] = 0.022,
		["PlantDown"] = 0.25
	}
}
v_u_5["Taro Flower"] = v160
local v161 = {
	["PlantName"] = "Zen Rocks",
	["PlantData"] = {
		["GrowTickTime"] = NumberRange.new(5, 6),
		["GrowRate"] = 0.027,
		["PlantDown"] = 0
	}
}
v_u_5["Zen Rocks"] = v161
local v162 = {
	["PlantName"] = "Hinomai",
	["PlantData"] = {
		["GrowTickTime"] = NumberRange.new(11.3, 12),
		["GrowFruitTime"] = NumberRange.new(90, 120),
		["GrowRate"] = 0.00875,
		["PlantDown"] = 1.25
	},
	["FruitData"] = {
		["GrowTickTime"] = NumberRange.new(7.2, 7.5),
		["GrowRate"] = 0.009,
		["PlantDown"] = 0
	}
}
v_u_5.Hinomai = v162
local v163 = {
	["PlantName"] = "Maple Apple",
	["PlantData"] = {
		["GrowTickTime"] = NumberRange.new(8, 9),
		["GrowFruitTime"] = NumberRange.new(200, 260),
		["GrowRate"] = 0.004,
		["PlantDown"] = -0.5
	},
	["FruitData"] = {
		["GrowTickTime"] = NumberRange.new(5, 6),
		["GrowRate"] = 0.02,
		["PlantDown"] = 0
	}
}
v_u_5["Maple Apple"] = v163
local v164 = {
	["PlantName"] = "Zenflare",
	["PlantData"] = {
		["GrowTickTime"] = NumberRange.new(5, 6),
		["GrowFruitTime"] = NumberRange.new(120, 160),
		["GrowRate"] = 0.0185,
		["PlantDown"] = -0.5
	},
	["FruitData"] = {
		["GrowTickTime"] = NumberRange.new(4, 5),
		["GrowRate"] = 0.075,
		["PlantDown"] = 0
	}
}
v_u_5.Zenflare = v164
local v165 = {
	["PlantName"] = "Sakura Bush",
	["PlantData"] = {
		["GrowTickTime"] = NumberRange.new(10, 12),
		["GrowFruitTime"] = NumberRange.new(60, 80),
		["GrowRate"] = 0.075,
		["PlantDown"] = 0
	},
	["FruitData"] = {
		["GrowTickTime"] = NumberRange.new(3.6, 6),
		["GrowRate"] = 0.0175,
		["PlantDown"] = 0
	}
}
v_u_5["Sakura Bush"] = v165
local v166 = {
	["PlantName"] = "Soft Sunshine",
	["PlantData"] = {
		["GrowTickTime"] = NumberRange.new(4.75, 4.76),
		["GrowFruitTime"] = NumberRange.new(120, 160),
		["GrowRate"] = 0.0035,
		["PlantDown"] = 0
	},
	["FruitData"] = {
		["GrowTickTime"] = NumberRange.new(4.8, 5),
		["GrowRate"] = 0.0125,
		["PlantDown"] = 0
	}
}
v_u_5["Soft Sunshine"] = v166
local v167 = {
	["PlantName"] = "Spiked Mango",
	["PlantData"] = {
		["GrowTickTime"] = NumberRange.new(5, 6.5),
		["GrowFruitTime"] = NumberRange.new(1150, 1250),
		["GrowRate"] = 0.0015,
		["PlantDown"] = 2
	},
	["FruitData"] = {
		["GrowTickTime"] = NumberRange.new(0.8, 1.2),
		["GrowRate"] = 0.0215,
		["PlantDown"] = -0.25
	}
}
v_u_5["Spiked Mango"] = v167
local v168 = {
	["PlantName"] = "Enkaku",
	["PlantData"] = {
		["GrowTickTime"] = NumberRange.new(10.7, 11.1),
		["GrowFruitTime"] = NumberRange.new(60, 80),
		["GrowRate"] = 0.01,
		["PlantDown"] = 0
	},
	["FruitData"] = {
		["GrowTickTime"] = NumberRange.new(3.6, 4),
		["GrowRate"] = 0.01,
		["PlantDown"] = 0
	}
}
v_u_5.Enkaku = v168
local v169 = {
	["PlantName"] = "Dezen",
	["PlantData"] = {
		["GrowTickTime"] = NumberRange.new(2, 3),
		["GrowRate"] = 0.1,
		["PlantDown"] = 0
	}
}
v_u_5.Dezen = v169
local v170 = {
	["PlantName"] = "Lucky Bamboo",
	["PlantData"] = {
		["GrowTickTime"] = NumberRange.new(40, 50),
		["GrowFruitTime"] = NumberRange.new(80, 90),
		["GrowRate"] = 0.035,
		["PlantDown"] = 0
	},
	["FruitData"] = {
		["GrowTickTime"] = NumberRange.new(3.6, 6),
		["GrowRate"] = 0.0135,
		["PlantDown"] = 0
	}
}
v_u_5["Lucky Bamboo"] = v170
local v171 = {
	["PlantName"] = "Tranquil Bloom",
	["PlantData"] = {
		["GrowTickTime"] = NumberRange.new(20.4, 20.6),
		["GrowFruitTime"] = NumberRange.new(240, 300),
		["GrowRate"] = 0.01,
		["PlantDown"] = 0
	},
	["FruitData"] = {
		["GrowTickTime"] = NumberRange.new(12, 15),
		["GrowRate"] = 0.01,
		["PlantDown"] = 0
	}
}
v_u_5["Tranquil Bloom"] = v171
local v172 = {
	["PlantName"] = "Fruitball",
	["PlantData"] = {
		["GrowTickTime"] = NumberRange.new(7.6, 8),
		["GrowFruitTime"] = NumberRange.new(120, 180),
		["GrowRate"] = 0.01,
		["PlantDown"] = 0
	},
	["FruitData"] = {
		["GrowTickTime"] = NumberRange.new(7, 7.35),
		["GrowRate"] = 0.0225,
		["PlantDown"] = 0
	}
}
v_u_5.Fruitball = v172
local v173 = {
	["PlantName"] = "Onion",
	["PlantData"] = {
		["GrowTickTime"] = NumberRange.new(3, 4),
		["GrowRate"] = 0.5,
		["PlantDown"] = -0.25
	}
}
v_u_5.Onion = v173
local v174 = {
	["PlantName"] = "Jalapeno",
	["PlantData"] = {
		["GrowTickTime"] = NumberRange.new(7.6, 8),
		["GrowFruitTime"] = NumberRange.new(120, 180),
		["GrowRate"] = 0.1,
		["PlantDown"] = 0
	},
	["FruitData"] = {
		["GrowTickTime"] = NumberRange.new(7, 7.35),
		["GrowRate"] = 0.01,
		["PlantDown"] = 0
	}
}
v_u_5.Jalapeno = v174
local v175 = {
	["PlantName"] = "Crown Melon",
	["PlantData"] = {
		["GrowTickTime"] = NumberRange.new(7.5, 8),
		["GrowFruitTime"] = NumberRange.new(120, 180),
		["GrowRate"] = 0.025,
		["PlantDown"] = 0
	},
	["FruitData"] = {
		["GrowTickTime"] = NumberRange.new(7, 7.25),
		["GrowRate"] = 0.01,
		["PlantDown"] = 0
	}
}
v_u_5["Crown Melon"] = v175
local v176 = {
	["PlantName"] = "Sugarglaze",
	["PlantData"] = {
		["GrowTickTime"] = NumberRange.new(30, 50),
		["GrowFruitTime"] = NumberRange.new(80, 90),
		["GrowRate"] = 0.035,
		["PlantDown"] = 1.5
	},
	["FruitData"] = {
		["GrowTickTime"] = NumberRange.new(3.6, 6),
		["GrowRate"] = 0.0135,
		["PlantDown"] = 0
	}
}
v_u_5.Sugarglaze = v176
local v177 = {
	["PlantName"] = "Tall Asparagus",
	["PlantData"] = {
		["GrowTickTime"] = NumberRange.new(60, 75),
		["GrowFruitTime"] = NumberRange.new(80, 90),
		["GrowRate"] = 0.035,
		["PlantDown"] = 0
	},
	["FruitData"] = {
		["GrowTickTime"] = NumberRange.new(3.6, 6),
		["GrowRate"] = 0.0135,
		["PlantDown"] = 0
	}
}
v_u_5["Tall Asparagus"] = v177
local v178 = {
	["PlantName"] = "Grand Tomato",
	["PlantData"] = {
		["GrowTickTime"] = NumberRange.new(2, 4),
		["GrowFruitTime"] = NumberRange.new(120, 180),
		["GrowRate"] = 0.001,
		["PlantDown"] = 0
	},
	["FruitData"] = {
		["GrowTickTime"] = NumberRange.new(7, 7.35),
		["GrowRate"] = 0.01,
		["PlantDown"] = 0
	}
}
v_u_5["Grand Tomato"] = v178
local v179 = {
	["PlantName"] = "Artichoke",
	["PlantData"] = {
		["GrowTickTime"] = NumberRange.new(1, 2),
		["GrowRate"] = 0.4,
		["PlantDown"] = 0
	}
}
v_u_5.Artichoke = v179
local v180 = {
	["PlantName"] = "Taco Fern",
	["PlantData"] = {
		["GrowTickTime"] = NumberRange.new(15, 20),
		["GrowFruitTime"] = NumberRange.new(80, 90),
		["GrowRate"] = 0.01,
		["PlantDown"] = 0
	},
	["FruitData"] = {
		["GrowTickTime"] = NumberRange.new(5, 6),
		["GrowRate"] = 0.05,
		["PlantDown"] = 0
	}
}
v_u_5["Taco Fern"] = v180
local v181 = {
	["PlantName"] = "Twisted Tangle",
	["PlantData"] = {
		["GrowTickTime"] = NumberRange.new(7.3, 8),
		["GrowFruitTime"] = NumberRange.new(120, 180),
		["GrowRate"] = 0.3,
		["PlantDown"] = 0
	},
	["FruitData"] = {
		["GrowTickTime"] = NumberRange.new(5, 6),
		["GrowRate"] = 0.1,
		["PlantDown"] = 0
	}
}
v_u_5["Twisted Tangle"] = v181
local v182 = {
	["PlantName"] = "Veinpetal",
	["PlantData"] = {
		["GrowTickTime"] = NumberRange.new(20, 24),
		["GrowFruitTime"] = NumberRange.new(120, 180),
		["GrowRate"] = 0.01,
		["PlantDown"] = 0
	},
	["FruitData"] = {
		["GrowTickTime"] = NumberRange.new(5, 6),
		["GrowRate"] = 0.1,
		["PlantDown"] = 0
	}
}
v_u_5.Veinpetal = v182
local v183 = {
	["PlantName"] = "Rhubarb",
	["PlantData"] = {
		["GrowTickTime"] = NumberRange.new(15, 20),
		["GrowFruitTime"] = NumberRange.new(80, 90),
		["GrowRate"] = 0.1,
		["PlantDown"] = 0
	},
	["FruitData"] = {
		["GrowTickTime"] = NumberRange.new(8, 8.35),
		["GrowRate"] = 0.01,
		["PlantDown"] = 0
	}
}
v_u_5.Rhubarb = v183
local v184 = {
	["PlantName"] = "Badlands Pepper",
	["PlantData"] = {
		["GrowTickTime"] = NumberRange.new(9.65, 10),
		["GrowFruitTime"] = NumberRange.new(80, 90),
		["GrowRate"] = 0.015,
		["PlantDown"] = 0
	},
	["FruitData"] = {
		["GrowTickTime"] = NumberRange.new(8, 8.35),
		["GrowRate"] = 0.01,
		["PlantDown"] = 0
	}
}
v_u_5["Badlands Pepper"] = v184
local v185 = {
	["PlantName"] = "King Cabbage",
	["PlantData"] = {
		["GrowTickTime"] = NumberRange.new(9.2, 10),
		["GrowFruitTime"] = NumberRange.new(80, 90),
		["GrowRate"] = 0.00215,
		["PlantDown"] = 0
	},
	["FruitData"] = {
		["GrowTickTime"] = NumberRange.new(8, 8.35),
		["GrowRate"] = 0.01,
		["PlantDown"] = 0
	}
}
v_u_5["King Cabbage"] = v185
local v186 = {
	["PlantName"] = "Spring Onion",
	["PlantData"] = {
		["GrowTickTime"] = NumberRange.new(1, 2),
		["GrowRate"] = 0.4,
		["PlantDown"] = 0
	}
}
v_u_5["Spring Onion"] = v186
local v187 = {
	["PlantName"] = "Butternut Squash",
	["PlantData"] = {
		["GrowTickTime"] = NumberRange.new(15, 20),
		["GrowFruitTime"] = NumberRange.new(80, 90),
		["GrowRate"] = 0.012,
		["PlantDown"] = 0
	},
	["FruitData"] = {
		["GrowTickTime"] = NumberRange.new(8, 8.35),
		["GrowRate"] = 0.01,
		["PlantDown"] = 0
	}
}
v_u_5["Butternut Squash"] = v187
local v188 = {
	["PlantName"] = "Pricklefruit",
	["PlantData"] = {
		["GrowTickTime"] = NumberRange.new(18, 24),
		["GrowFruitTime"] = NumberRange.new(80, 90),
		["GrowRate"] = 0.01,
		["PlantDown"] = 0
	},
	["FruitData"] = {
		["GrowTickTime"] = NumberRange.new(8, 8.35),
		["GrowRate"] = 0.01,
		["PlantDown"] = 0
	}
}
v_u_5.Pricklefruit = v188
local v189 = {
	["PlantName"] = "Bitter Melon",
	["PlantData"] = {
		["GrowTickTime"] = NumberRange.new(20, 35),
		["GrowFruitTime"] = NumberRange.new(80, 90),
		["GrowRate"] = 0.015,
		["PlantDown"] = 0
	},
	["FruitData"] = {
		["GrowTickTime"] = NumberRange.new(8, 8.35),
		["GrowRate"] = 0.01,
		["PlantDown"] = 0
	}
}
v_u_5["Bitter Melon"] = v189
local v190 = {
	["PlantName"] = "Golden Egg",
	["PlantData"] = {
		["GrowTickTime"] = NumberRange.new(1, 1),
		["GrowRate"] = 1,
		["PlantDown"] = 0
	}
}
v_u_5["Golden Egg"] = v190
local v191 = {
	["PlantName"] = "Flare Daisy",
	["PlantData"] = {
		["GrowTickTime"] = NumberRange.new(10, 12),
		["GrowFruitTime"] = NumberRange.new(60, 80),
		["GrowRate"] = 0.1,
		["PlantDown"] = 0
	},
	["FruitData"] = {
		["GrowTickTime"] = NumberRange.new(3.6, 6),
		["GrowRate"] = 0.05,
		["PlantDown"] = 0
	}
}
v_u_5["Flare Daisy"] = v191
local v192 = {
	["PlantName"] = "Duskpuff",
	["PlantData"] = {
		["GrowTickTime"] = NumberRange.new(15, 18),
		["GrowFruitTime"] = NumberRange.new(60, 80),
		["GrowRate"] = 0.02,
		["PlantDown"] = 0
	},
	["FruitData"] = {
		["GrowTickTime"] = NumberRange.new(3.6, 4),
		["GrowRate"] = 0.02,
		["PlantDown"] = 0
	}
}
v_u_5.Duskpuff = v192
local v193 = {
	["PlantName"] = "Mangosteen",
	["PlantData"] = {
		["GrowTickTime"] = NumberRange.new(9.65, 10),
		["GrowFruitTime"] = NumberRange.new(80, 90),
		["GrowRate"] = 0.015,
		["PlantDown"] = 0
	},
	["FruitData"] = {
		["GrowTickTime"] = NumberRange.new(8, 8.35),
		["GrowRate"] = 0.01,
		["PlantDown"] = 0
	}
}
v_u_5.Mangosteen = v193
local v194 = {
	["PlantName"] = "Poseidon Plant",
	["PlantData"] = {
		["GrowTickTime"] = NumberRange.new(9.65, 10),
		["GrowFruitTime"] = NumberRange.new(200, 240),
		["GrowRate"] = 0.015,
		["PlantDown"] = 0
	},
	["FruitData"] = {
		["GrowTickTime"] = NumberRange.new(8, 8.35),
		["GrowRate"] = 0.01,
		["PlantDown"] = 0
	}
}
v_u_5["Poseidon Plant"] = v194
local v195 = {
	["PlantName"] = "Gleamroot",
	["PlantData"] = {
		["GrowTickTime"] = NumberRange.new(9.65, 10),
		["GrowFruitTime"] = NumberRange.new(120, 140),
		["GrowRate"] = 0.015,
		["PlantDown"] = 0
	},
	["FruitData"] = {
		["GrowTickTime"] = NumberRange.new(8, 8.35),
		["GrowRate"] = 0.01,
		["PlantDown"] = 0
	}
}
v_u_5.Gleamroot = v195
local v196 = {
	["PlantName"] = "Princess Thorn",
	["PlantData"] = {
		["GrowTickTime"] = NumberRange.new(5, 6),
		["GrowFruitTime"] = NumberRange.new(400, 500),
		["GrowRate"] = 0.001,
		["PlantDown"] = 0
	},
	["FruitData"] = {
		["GrowTickTime"] = NumberRange.new(8, 8.35),
		["GrowRate"] = 0.01,
		["PlantDown"] = 0
	}
}
v_u_5["Princess Thorn"] = v196
local v197 = {
	["PlantName"] = "Mandrake",
	["PlantData"] = {
		["GrowTickTime"] = NumberRange.new(1, 2),
		["GrowFruitTime"] = NumberRange.new(80, 90),
		["GrowRate"] = 0.01,
		["PlantDown"] = 0
	},
	["FruitData"] = {
		["GrowTickTime"] = NumberRange.new(8, 8.35),
		["GrowRate"] = 0.01,
		["PlantDown"] = 0
	}
}
v_u_5.Mandrake = v197
local v198 = {
	["PlantName"] = "Canary Melon",
	["PlantData"] = {
		["GrowTickTime"] = NumberRange.new(9.65, 10),
		["GrowFruitTime"] = NumberRange.new(120, 140),
		["GrowRate"] = 0.015,
		["PlantDown"] = 0
	},
	["FruitData"] = {
		["GrowTickTime"] = NumberRange.new(8, 8.35),
		["GrowRate"] = 0.01,
		["PlantDown"] = 0
	}
}
v_u_5["Canary Melon"] = v198
local v199 = {
	["PlantName"] = "Amberheart",
	["PlantData"] = {
		["GrowTickTime"] = NumberRange.new(9.65, 10),
		["GrowFruitTime"] = NumberRange.new(40, 60),
		["GrowRate"] = 0.01,
		["PlantDown"] = 0
	},
	["FruitData"] = {
		["GrowTickTime"] = NumberRange.new(8, 8.35),
		["GrowRate"] = 0.01,
		["PlantDown"] = 0
	}
}
v_u_5.Amberheart = v199
local v200 = {
	["PlantName"] = "Crown of Thorns",
	["PlantData"] = {
		["GrowTickTime"] = NumberRange.new(3, 5),
		["GrowFruitTime"] = NumberRange.new(20, 40),
		["GrowRate"] = 0.1,
		["PlantDown"] = 0
	},
	["FruitData"] = {
		["GrowTickTime"] = NumberRange.new(3.6, 4),
		["GrowRate"] = 0.02,
		["PlantDown"] = 0
	}
}
v_u_5["Crown of Thorns"] = v200
local v201 = {
	["PlantName"] = "Calla Lily",
	["PlantData"] = {
		["GrowTickTime"] = NumberRange.new(24, 32),
		["GrowFruitTime"] = NumberRange.new(60, 80),
		["GrowRate"] = 0.025,
		["PlantDown"] = 0
	},
	["FruitData"] = {
		["GrowTickTime"] = NumberRange.new(3.6, 4),
		["GrowRate"] = 0.02,
		["PlantDown"] = 0
	}
}
v_u_5["Calla Lily"] = v201
local v202 = {
	["PlantName"] = "Cyclamen",
	["PlantData"] = {
		["GrowTickTime"] = NumberRange.new(9.65, 10),
		["GrowFruitTime"] = NumberRange.new(280, 300),
		["GrowRate"] = 0.0015,
		["PlantDown"] = 0
	},
	["FruitData"] = {
		["GrowTickTime"] = NumberRange.new(8, 8.35),
		["GrowRate"] = 0.01,
		["PlantDown"] = 0
	}
}
v_u_5.Cyclamen = v202
local v203 = {
	["PlantName"] = "Glowpod",
	["PlantData"] = {
		["GrowTickTime"] = NumberRange.new(20, 30),
		["GrowFruitTime"] = NumberRange.new(30, 40),
		["GrowRate"] = 0.5,
		["PlantDown"] = 0
	},
	["FruitData"] = {
		["GrowTickTime"] = NumberRange.new(3.6, 4),
		["GrowRate"] = 0.02,
		["PlantDown"] = 0
	}
}
v_u_5.Glowpod = v203
local v204 = {
	["PlantName"] = "Flare Melon",
	["PlantData"] = {
		["GrowTickTime"] = NumberRange.new(12, 16),
		["GrowFruitTime"] = NumberRange.new(200, 240),
		["GrowRate"] = 0.04,
		["PlantDown"] = 0
	},
	["FruitData"] = {
		["GrowTickTime"] = NumberRange.new(3.6, 4),
		["GrowRate"] = 0.02,
		["PlantDown"] = 0
	}
}
v_u_5["Flare Melon"] = v204
local v205 = {
	["PlantName"] = "Willowberry",
	["PlantData"] = {
		["GrowTickTime"] = NumberRange.new(3, 5),
		["GrowFruitTime"] = NumberRange.new(700, 780),
		["GrowRate"] = 0.0025,
		["PlantDown"] = 0
	},
	["FruitData"] = {
		["GrowTickTime"] = NumberRange.new(3.6, 4),
		["GrowRate"] = 0.02,
		["PlantDown"] = 0
	}
}
v_u_5.Willowberry = v205
local v206 = {
	["PlantName"] = "Sunbulb",
	["PlantData"] = {
		["GrowTickTime"] = NumberRange.new(4, 6),
		["GrowFruitTime"] = NumberRange.new(30, 40),
		["GrowRate"] = 0.1,
		["PlantDown"] = 0
	},
	["FruitData"] = {
		["GrowTickTime"] = NumberRange.new(1, 2),
		["GrowRate"] = 0.05,
		["PlantDown"] = 0
	}
}
v_u_5.Sunbulb = v206
local v207 = {
	["PlantName"] = "Glowthorn",
	["PlantData"] = {
		["GrowTickTime"] = NumberRange.new(24, 36),
		["GrowFruitTime"] = NumberRange.new(90, 90),
		["GrowRate"] = 0.1,
		["PlantDown"] = -0.5
	},
	["FruitData"] = {
		["GrowTickTime"] = NumberRange.new(1, 2),
		["GrowRate"] = 0.05,
		["PlantDown"] = 0.25
	}
}
v_u_5.Glowthorn = v207
local v208 = {
	["PlantName"] = "Lightshoot",
	["PlantData"] = {
		["GrowTickTime"] = NumberRange.new(6, 8),
		["GrowFruitTime"] = NumberRange.new(60, 80),
		["GrowRate"] = 0.025,
		["PlantDown"] = 0
	},
	["FruitData"] = {
		["GrowTickTime"] = NumberRange.new(3.6, 4),
		["GrowRate"] = 0.02,
		["PlantDown"] = 0
	}
}
v_u_5.Lightshoot = v208
local v209 = {
	["PlantName"] = "Briar Rose",
	["PlantData"] = {
		["GrowTickTime"] = NumberRange.new(4, 6),
		["GrowFruitTime"] = NumberRange.new(60, 80),
		["GrowRate"] = 0.008,
		["PlantDown"] = 0
	},
	["FruitData"] = {
		["GrowTickTime"] = NumberRange.new(5, 8),
		["GrowRate"] = 0.1,
		["PlantDown"] = 0
	}
}
v_u_5["Briar Rose"] = v209
local v210 = {
	["PlantName"] = "Pink Rose",
	["PlantData"] = {
		["GrowTickTime"] = NumberRange.new(4, 6),
		["GrowFruitTime"] = NumberRange.new(60, 80),
		["GrowRate"] = 0.008,
		["PlantDown"] = 0
	},
	["FruitData"] = {
		["GrowTickTime"] = NumberRange.new(5, 8),
		["GrowRate"] = 0.1,
		["PlantDown"] = 0
	}
}
v_u_5["Pink Rose"] = v210
local v211 = {
	["PlantName"] = "Spirit Flower",
	["PlantData"] = {
		["GrowTickTime"] = NumberRange.new(24, 36),
		["GrowFruitTime"] = NumberRange.new(120, 140),
		["GrowRate"] = 0.018,
		["PlantDown"] = -0.5
	},
	["FruitData"] = {
		["GrowTickTime"] = NumberRange.new(1, 2),
		["GrowRate"] = 0.5,
		["PlantDown"] = 0.25
	}
}
v_u_5["Spirit Flower"] = v211
local v212 = {
	["PlantName"] = "Wispwing",
	["PlantData"] = {
		["GrowTickTime"] = NumberRange.new(60, 80),
		["GrowFruitTime"] = NumberRange.new(100, 120),
		["GrowRate"] = 0.01,
		["PlantDown"] = 0
	},
	["FruitData"] = {
		["GrowTickTime"] = NumberRange.new(15, 18),
		["GrowRate"] = 0.1,
		["PlantDown"] = 0
	}
}
v_u_5.Wispwing = v212
local v213 = {
	["PlantName"] = "Emerald Bud",
	["PlantData"] = {
		["GrowTickTime"] = NumberRange.new(4, 6),
		["GrowFruitTime"] = NumberRange.new(110, 130),
		["GrowRate"] = 0.05,
		["PlantDown"] = -0.15
	},
	["FruitData"] = {
		["GrowTickTime"] = NumberRange.new(1, 2),
		["GrowRate"] = 0.05,
		["PlantDown"] = 0.25
	}
}
v_u_5["Emerald Bud"] = v213
local v214 = {
	["PlantName"] = "Pyracantha",
	["PlantData"] = {
		["GrowTickTime"] = NumberRange.new(8, 10),
		["GrowFruitTime"] = NumberRange.new(90, 110),
		["GrowRate"] = 0.075,
		["PlantDown"] = 0
	},
	["FruitData"] = {
		["GrowTickTime"] = NumberRange.new(4, 5),
		["GrowRate"] = 0.05,
		["PlantDown"] = 0
	}
}
v_u_5.Pyracantha = v214
local v215 = {
	["PlantName"] = "Aetherfruit",
	["PlantData"] = {
		["GrowTickTime"] = NumberRange.new(15, 15),
		["GrowFruitTime"] = NumberRange.new(110, 130),
		["GrowRate"] = 0.005,
		["PlantDown"] = -0.5
	},
	["FruitData"] = {
		["GrowTickTime"] = NumberRange.new(4, 5),
		["GrowRate"] = 0.05,
		["PlantDown"] = 0.25
	}
}
v_u_5.Aetherfruit = v215
local v216 = {
	["PlantName"] = "Radish",
	["PlantData"] = {
		["GrowTickTime"] = NumberRange.new(1, 2),
		["GrowRate"] = 0.55,
		["PlantDown"] = 0.65
	}
}
v_u_5.Radish = v216
local v217 = {
	["PlantName"] = "Blue Raspberry",
	["PlantData"] = {
		["GrowTickTime"] = NumberRange.new(2, 3),
		["GrowFruitTime"] = NumberRange.new(40, 60),
		["GrowRate"] = 0.02,
		["PlantDown"] = 0
	},
	["FruitData"] = {
		["GrowTickTime"] = NumberRange.new(1, 1.5),
		["GrowRate"] = 0.05,
		["PlantDown"] = 0
	}
}
v_u_5["Blue Raspberry"] = v217
local v218 = {
	["PlantName"] = "Horned Melon",
	["PlantData"] = {
		["GrowTickTime"] = NumberRange.new(10, 12),
		["GrowFruitTime"] = NumberRange.new(110, 130),
		["GrowRate"] = 0.01,
		["PlantDown"] = -0.5
	},
	["FruitData"] = {
		["GrowTickTime"] = NumberRange.new(2, 3),
		["GrowRate"] = 0.05,
		["PlantDown"] = 0.25
	}
}
v_u_5["Horned Melon"] = v218
local v219 = {
	["PlantName"] = "Ackee",
	["PlantData"] = {
		["GrowTickTime"] = NumberRange.new(8, 10),
		["GrowFruitTime"] = NumberRange.new(110, 130),
		["GrowRate"] = 0.015,
		["PlantDown"] = -0.5
	},
	["FruitData"] = {
		["GrowTickTime"] = NumberRange.new(2, 3),
		["GrowRate"] = 0.05,
		["PlantDown"] = 0.25
	}
}
v_u_5.Ackee = v219
local v220 = {
	["PlantName"] = "Urchin Plant",
	["PlantData"] = {
		["GrowTickTime"] = NumberRange.new(12, 15),
		["GrowFruitTime"] = NumberRange.new(90, 110),
		["GrowRate"] = 0.005,
		["PlantDown"] = 0
	},
	["FruitData"] = {
		["GrowTickTime"] = NumberRange.new(2, 3),
		["GrowRate"] = 0.05,
		["PlantDown"] = 0
	}
}
v_u_5["Urchin Plant"] = v220
local v221 = {
	["PlantName"] = "Pixie Faern",
	["PlantData"] = {
		["GrowTickTime"] = NumberRange.new(4, 6),
		["GrowFruitTime"] = NumberRange.new(40, 60),
		["GrowRate"] = 0.015,
		["PlantDown"] = 0
	},
	["FruitData"] = {
		["GrowTickTime"] = NumberRange.new(2, 3),
		["GrowRate"] = 0.05,
		["PlantDown"] = 0
	}
}
v_u_5["Pixie Faern"] = v221
local v222 = {
	["PlantName"] = "Untold Bell",
	["PlantData"] = {
		["GrowTickTime"] = NumberRange.new(20, 25),
		["GrowFruitTime"] = NumberRange.new(110, 130),
		["GrowRate"] = 0.005,
		["PlantDown"] = -0.5
	},
	["FruitData"] = {
		["GrowTickTime"] = NumberRange.new(3, 4),
		["GrowRate"] = 0.05,
		["PlantDown"] = 0.25
	}
}
v_u_5["Untold Bell"] = v222
local v223 = {
	["PlantName"] = "Turnip",
	["PlantData"] = {
		["GrowTickTime"] = NumberRange.new(4, 6),
		["GrowFruitTime"] = NumberRange.new(110, 130),
		["GrowRate"] = 0.036,
		["PlantDown"] = 0
	},
	["FruitData"] = {
		["GrowTickTime"] = NumberRange.new(0.8, 1.2),
		["GrowRate"] = 0.025,
		["PlantDown"] = 0
	}
}
v_u_5.Turnip = v223
local v224 = {
	["PlantName"] = "Parsley",
	["PlantData"] = {
		["GrowTickTime"] = NumberRange.new(1, 2),
		["GrowFruitTime"] = NumberRange.new(1, 2),
		["GrowRate"] = 0.01,
		["PlantDown"] = 0
	},
	["FruitData"] = {
		["GrowTickTime"] = NumberRange.new(0.8, 1.2),
		["GrowRate"] = 0.05,
		["PlantDown"] = 0
	}
}
v_u_5.Parsley = v224
local v225 = {
	["PlantName"] = "Meyer Lemon",
	["PlantData"] = {
		["GrowTickTime"] = NumberRange.new(4, 6),
		["GrowFruitTime"] = NumberRange.new(110, 130),
		["GrowRate"] = 0.0167,
		["PlantDown"] = 0
	},
	["FruitData"] = {
		["GrowTickTime"] = NumberRange.new(0.8, 1.2),
		["GrowRate"] = 0.025,
		["PlantDown"] = 0
	}
}
v_u_5["Meyer Lemon"] = v225
local v226 = {
	["PlantName"] = "Carnival Pumpkin",
	["PlantData"] = {
		["GrowTickTime"] = NumberRange.new(4, 6),
		["GrowFruitTime"] = NumberRange.new(150, 180),
		["GrowRate"] = 0.0067,
		["PlantDown"] = 0
	},
	["FruitData"] = {
		["GrowTickTime"] = NumberRange.new(0.8, 1.2),
		["GrowRate"] = 0.025,
		["PlantDown"] = 0
	}
}
v_u_5["Carnival Pumpkin"] = v226
local v227 = {
	["PlantName"] = "Kniphofia",
	["PlantData"] = {
		["GrowTickTime"] = NumberRange.new(4, 6),
		["GrowFruitTime"] = NumberRange.new(200, 240),
		["GrowRate"] = 0.0014,
		["PlantDown"] = 0
	},
	["FruitData"] = {
		["GrowTickTime"] = NumberRange.new(0.8, 1.2),
		["GrowRate"] = 0.025,
		["PlantDown"] = 0
	}
}
v_u_5.Kniphofia = v227
local v228 = {
	["PlantName"] = "Golden Peach",
	["PlantData"] = {
		["GrowTickTime"] = NumberRange.new(4, 6),
		["GrowFruitTime"] = NumberRange.new(90, 180),
		["GrowRate"] = 0.0025,
		["PlantDown"] = 0
	},
	["FruitData"] = {
		["GrowTickTime"] = NumberRange.new(0.8, 1.2),
		["GrowRate"] = 0.025,
		["PlantDown"] = 0
	}
}
v_u_5["Golden Peach"] = v228
local v229 = {
	["PlantName"] = "Maple Resin",
	["PlantData"] = {
		["GrowTickTime"] = NumberRange.new(4, 6),
		["GrowFruitTime"] = NumberRange.new(300, 380),
		["GrowRate"] = 0.0017,
		["PlantDown"] = 0
	},
	["FruitData"] = {
		["GrowTickTime"] = NumberRange.new(0.8, 1.2),
		["GrowRate"] = 0.025,
		["PlantDown"] = 0
	}
}
v_u_5["Maple Resin"] = v229
local v230 = {
	["PlantName"] = "Mangrove",
	["PlantData"] = {
		["GrowTickTime"] = NumberRange.new(4, 6),
		["GrowFruitTime"] = NumberRange.new(300, 380),
		["GrowRate"] = 0.0017,
		["PlantDown"] = 0
	},
	["FruitData"] = {
		["GrowTickTime"] = NumberRange.new(0.8, 1.2),
		["GrowRate"] = 0.025,
		["PlantDown"] = 0
	}
}
v_u_5.Mangrove = v230
local v231 = {
	["PlantName"] = "Sundew",
	["PlantData"] = {
		["GrowTickTime"] = NumberRange.new(4, 5),
		["GrowFruitTime"] = NumberRange.new(60, 90),
		["GrowRate"] = 0.05,
		["PlantDown"] = 0
	},
	["FruitData"] = {
		["GrowTickTime"] = NumberRange.new(2, 3),
		["GrowRate"] = 0.01,
		["PlantDown"] = 0
	}
}
v_u_5.Sundew = v231
local v232 = {
	["PlantName"] = "Black Bat Flower",
	["PlantData"] = {
		["GrowTickTime"] = NumberRange.new(4, 5),
		["GrowFruitTime"] = NumberRange.new(60, 90),
		["GrowRate"] = 0.05,
		["PlantDown"] = 0
	},
	["FruitData"] = {
		["GrowTickTime"] = NumberRange.new(2, 3),
		["GrowRate"] = 0.01,
		["PlantDown"] = 0
	}
}
v_u_5["Black Bat Flower"] = v232
local v233 = {
	["PlantName"] = "Mandrone Berry",
	["PlantData"] = {
		["GrowTickTime"] = NumberRange.new(4, 5),
		["GrowFruitTime"] = NumberRange.new(60, 90),
		["GrowRate"] = 0.05,
		["PlantDown"] = 0
	},
	["FruitData"] = {
		["GrowTickTime"] = NumberRange.new(2, 3),
		["GrowRate"] = 0.01,
		["PlantDown"] = 0
	}
}
v_u_5["Mandrone Berry"] = v233
local v234 = {
	["PlantName"] = "Corpse Flower",
	["PlantData"] = {
		["GrowTickTime"] = NumberRange.new(24, 32),
		["GrowFruitTime"] = NumberRange.new(60, 80),
		["GrowRate"] = 0.025,
		["PlantDown"] = 0
	},
	["FruitData"] = {
		["GrowTickTime"] = NumberRange.new(3.6, 4),
		["GrowRate"] = 0.02,
		["PlantDown"] = 0
	}
}
v_u_5["Corpse Flower"] = v234
local v235 = {
	["PlantName"] = "Inferno Quince",
	["PlantData"] = {
		["GrowTickTime"] = NumberRange.new(6, 8),
		["GrowFruitTime"] = NumberRange.new(120, 160),
		["GrowRate"] = 0.05,
		["PlantDown"] = 0
	},
	["FruitData"] = {
		["GrowTickTime"] = NumberRange.new(3, 5),
		["GrowRate"] = 0.05,
		["PlantDown"] = 0
	}
}
v_u_5["Inferno Quince"] = v235
local v236 = {
	["PlantName"] = "Multitrap",
	["PlantData"] = {
		["GrowTickTime"] = NumberRange.new(6, 8),
		["GrowFruitTime"] = NumberRange.new(120, 160),
		["GrowRate"] = 0.05,
		["PlantDown"] = 0
	},
	["FruitData"] = {
		["GrowTickTime"] = NumberRange.new(3, 5),
		["GrowRate"] = 0.05,
		["PlantDown"] = 0
	}
}
v_u_5.Multitrap = v236
local v237 = {
	["PlantName"] = "Naval Wort",
	["PlantData"] = {
		["GrowTickTime"] = NumberRange.new(20, 35),
		["GrowFruitTime"] = NumberRange.new(150, 180),
		["GrowRate"] = 0.01,
		["PlantDown"] = 0
	},
	["FruitData"] = {
		["GrowTickTime"] = NumberRange.new(15, 20),
		["GrowRate"] = 0.01,
		["PlantDown"] = 0
	}
}
v_u_5["Naval Wort"] = v237
local v238 = {
	["PlantName"] = "Evo Beetroot I",
	["PlantData"] = {
		["GrowTickTime"] = NumberRange.new(6, 8),
		["GrowRate"] = 0.025,
		["PlantDown"] = 0
	}
}
v_u_5["Evo Beetroot I"] = v238
local v239 = {
	["PlantName"] = "Evo Beetroot II",
	["PlantData"] = {
		["GrowTickTime"] = NumberRange.new(6, 8),
		["GrowRate"] = 0.009,
		["PlantDown"] = 0
	}
}
v_u_5["Evo Beetroot II"] = v239
local v240 = {
	["PlantName"] = "Evo Beetroot III",
	["PlantData"] = {
		["GrowTickTime"] = NumberRange.new(6, 8),
		["GrowRate"] = 0.0045,
		["PlantDown"] = 0
	}
}
v_u_5["Evo Beetroot III"] = v240
local v241 = {
	["PlantName"] = "Evo Beetroot IV",
	["PlantData"] = {
		["GrowTickTime"] = NumberRange.new(6, 8),
		["GrowFruitTime"] = NumberRange.new(400, 480),
		["GrowRate"] = 0.005,
		["PlantDown"] = 0
	},
	["FruitData"] = {
		["GrowTickTime"] = NumberRange.new(2.5, 3),
		["GrowRate"] = 0.01,
		["PlantDown"] = 0
	}
}
v_u_5["Evo Beetroot IV"] = v241
local v242 = {
	["PlantName"] = "Evo Blueberry I",
	["PlantData"] = {
		["GrowTickTime"] = NumberRange.new(6, 8),
		["GrowRate"] = 0.032,
		["PlantDown"] = 0
	}
}
v_u_5["Evo Blueberry I"] = v242
local v243 = {
	["PlantName"] = "Evo Blueberry II",
	["PlantData"] = {
		["GrowTickTime"] = NumberRange.new(6, 8),
		["GrowRate"] = 0.0096,
		["PlantDown"] = 0
	}
}
v_u_5["Evo Blueberry II"] = v243
local v244 = {
	["PlantName"] = "Evo Blueberry III",
	["PlantData"] = {
		["GrowTickTime"] = NumberRange.new(6, 8),
		["GrowRate"] = 0.0032,
		["PlantDown"] = 0
	}
}
v_u_5["Evo Blueberry III"] = v244
local v245 = {
	["PlantName"] = "Evo Blueberry IV",
	["PlantData"] = {
		["GrowTickTime"] = NumberRange.new(6, 8),
		["GrowFruitTime"] = NumberRange.new(400, 480),
		["GrowRate"] = 0.0032,
		["PlantDown"] = 0
	},
	["FruitData"] = {
		["GrowTickTime"] = NumberRange.new(2.5, 3),
		["GrowRate"] = 0.01,
		["PlantDown"] = 0
	}
}
v_u_5["Evo Blueberry IV"] = v245
local v246 = {
	["PlantName"] = "Evo Pumpkin I",
	["PlantData"] = {
		["GrowTickTime"] = NumberRange.new(6, 8),
		["GrowRate"] = 0.01,
		["PlantDown"] = 0
	}
}
v_u_5["Evo Pumpkin I"] = v246
local v247 = {
	["PlantName"] = "Evo Pumpkin II",
	["PlantData"] = {
		["GrowTickTime"] = NumberRange.new(6, 8),
		["GrowRate"] = 0.005,
		["PlantDown"] = 0
	}
}
v_u_5["Evo Pumpkin II"] = v247
local v248 = {
	["PlantName"] = "Evo Pumpkin III",
	["PlantData"] = {
		["GrowTickTime"] = NumberRange.new(6, 8),
		["GrowRate"] = 0.0015,
		["PlantDown"] = 0
	}
}
v_u_5["Evo Pumpkin III"] = v248
local v249 = {
	["PlantName"] = "Evo Pumpkin IV",
	["PlantData"] = {
		["GrowTickTime"] = NumberRange.new(6, 8),
		["GrowFruitTime"] = NumberRange.new(400, 480),
		["GrowRate"] = 0.001,
		["PlantDown"] = 0
	},
	["FruitData"] = {
		["GrowTickTime"] = NumberRange.new(2.5, 3),
		["GrowRate"] = 0.01,
		["PlantDown"] = 0
	}
}
v_u_5["Evo Pumpkin IV"] = v249
local v250 = {
	["PlantName"] = "Evo Mushroom I",
	["PlantData"] = {
		["GrowTickTime"] = NumberRange.new(6, 8),
		["GrowRate"] = 0.009,
		["PlantDown"] = 0
	}
}
v_u_5["Evo Mushroom I"] = v250
local v251 = {
	["PlantName"] = "Evo Mushroom II",
	["PlantData"] = {
		["GrowTickTime"] = NumberRange.new(6, 8),
		["GrowRate"] = 0.0035,
		["PlantDown"] = 0
	}
}
v_u_5["Evo Mushroom II"] = v251
local v252 = {
	["PlantName"] = "Evo Mushroom III",
	["PlantData"] = {
		["GrowTickTime"] = NumberRange.new(6, 8),
		["GrowRate"] = 0.0017,
		["PlantDown"] = 0
	}
}
v_u_5["Evo Mushroom III"] = v252
local v253 = {
	["PlantName"] = "Evo Mushroom IV",
	["PlantData"] = {
		["GrowTickTime"] = NumberRange.new(6, 8),
		["GrowFruitTime"] = NumberRange.new(400, 480),
		["GrowRate"] = 0.003,
		["PlantDown"] = 0
	},
	["FruitData"] = {
		["GrowTickTime"] = NumberRange.new(2.5, 3),
		["GrowRate"] = 0.01,
		["PlantDown"] = 0
	}
}
v_u_5["Evo Mushroom IV"] = v253
local v254 = {
	["PlantName"] = "Evo Apple I",
	["PlantData"] = {
		["GrowTickTime"] = NumberRange.new(6, 8),
		["GrowFruitTime"] = NumberRange.new(120, 160),
		["GrowRate"] = 0.01,
		["PlantDown"] = 0
	},
	["FruitData"] = {
		["GrowTickTime"] = NumberRange.new(2.5, 3),
		["GrowRate"] = 0.01,
		["PlantDown"] = 0
	}
}
v_u_5["Evo Apple I"] = v254
local v255 = {
	["PlantName"] = "Evo Apple II",
	["PlantData"] = {
		["GrowTickTime"] = NumberRange.new(10, 12),
		["GrowFruitTime"] = NumberRange.new(200, 240),
		["GrowRate"] = 0.01,
		["PlantDown"] = 0
	},
	["FruitData"] = {
		["GrowTickTime"] = NumberRange.new(4, 6),
		["GrowRate"] = 0.01,
		["PlantDown"] = 0
	}
}
v_u_5["Evo Apple II"] = v255
local v256 = {
	["PlantName"] = "Evo Apple III",
	["PlantData"] = {
		["GrowTickTime"] = NumberRange.new(15, 18),
		["GrowFruitTime"] = NumberRange.new(300, 340),
		["GrowRate"] = 0.007,
		["PlantDown"] = 0
	},
	["FruitData"] = {
		["GrowTickTime"] = NumberRange.new(8, 11),
		["GrowRate"] = 0.01,
		["PlantDown"] = 0
	}
}
v_u_5["Evo Apple III"] = v256
local v257 = {
	["PlantName"] = "Evo Apple IV",
	["PlantData"] = {
		["GrowTickTime"] = NumberRange.new(24, 30),
		["GrowFruitTime"] = NumberRange.new(400, 440),
		["GrowRate"] = 0.006,
		["PlantDown"] = 0
	},
	["FruitData"] = {
		["GrowTickTime"] = NumberRange.new(14, 17),
		["GrowRate"] = 0.01,
		["PlantDown"] = 0
	}
}
v_u_5["Evo Apple IV"] = v257
local v258 = {
	["PlantName"] = "Hazelnut",
	["PlantData"] = {
		["GrowTickTime"] = NumberRange.new(6, 8),
		["GrowFruitTime"] = NumberRange.new(90, 110),
		["GrowRate"] = 0.1,
		["PlantDown"] = 0
	},
	["FruitData"] = {
		["GrowTickTime"] = NumberRange.new(6, 8),
		["GrowRate"] = 0.09,
		["PlantDown"] = 0
	}
}
v_u_5.Hazelnut = v258
local v259 = {
	["PlantName"] = "Persimmon",
	["PlantData"] = {
		["GrowTickTime"] = NumberRange.new(24, 36),
		["GrowFruitTime"] = NumberRange.new(200, 240),
		["GrowRate"] = 0.1,
		["PlantDown"] = 0
	},
	["FruitData"] = {
		["GrowTickTime"] = NumberRange.new(8, 8.35),
		["GrowRate"] = 0.01,
		["PlantDown"] = 0
	}
}
v_u_5.Persimmon = v259
local v260 = {
	["PlantName"] = "Acorn",
	["PlantData"] = {
		["GrowTickTime"] = NumberRange.new(20, 20),
		["GrowFruitTime"] = NumberRange.new(120, 160),
		["GrowRate"] = 0.008,
		["PlantDown"] = 0
	},
	["FruitData"] = {
		["GrowTickTime"] = NumberRange.new(15, 20),
		["GrowRate"] = 0.03,
		["PlantDown"] = 0
	}
}
v_u_5.Acorn = v260
local v261 = {
	["PlantName"] = "Acorn Squash",
	["PlantData"] = {
		["GrowTickTime"] = NumberRange.new(6, 8),
		["GrowFruitTime"] = NumberRange.new(100, 120),
		["GrowRate"] = 0.2,
		["PlantDown"] = 0
	},
	["FruitData"] = {
		["GrowTickTime"] = NumberRange.new(0.03, 0.05),
		["GrowRate"] = 0.01,
		["PlantDown"] = 0
	}
}
v_u_5["Acorn Squash"] = v261
local v262 = {
	["PlantName"] = "Ferntail",
	["PlantData"] = {
		["GrowTickTime"] = NumberRange.new(14, 16),
		["GrowFruitTime"] = NumberRange.new(200, 240),
		["GrowRate"] = 0.02,
		["PlantDown"] = 0
	},
	["FruitData"] = {
		["GrowTickTime"] = NumberRange.new(15, 20),
		["GrowRate"] = 0.01,
		["PlantDown"] = 0
	}
}
v_u_5.Ferntail = v262
local v263 = {
	["PlantName"] = "Pecan",
	["PlantData"] = {
		["GrowTickTime"] = NumberRange.new(20, 25),
		["GrowFruitTime"] = NumberRange.new(300, 340),
		["GrowRate"] = 0.01,
		["PlantDown"] = 0
	},
	["FruitData"] = {
		["GrowTickTime"] = NumberRange.new(20, 25),
		["GrowRate"] = 0.01,
		["PlantDown"] = 0
	}
}
v_u_5.Pecan = v263
local v264 = {
	["PlantName"] = "Fissure Berry",
	["PlantData"] = {
		["GrowTickTime"] = NumberRange.new(15, 18),
		["GrowRate"] = 0.5,
		["PlantDown"] = 0
	}
}
v_u_5["Fissure Berry"] = v264
local v265 = {
	["PlantName"] = "Bloodred Mushroom",
	["PlantData"] = {
		["GrowTickTime"] = NumberRange.new(9.5, 9.85),
		["GrowFruitTime"] = NumberRange.new(60, 80),
		["GrowRate"] = 0.1,
		["PlantDown"] = 0
	},
	["FruitData"] = {
		["GrowTickTime"] = NumberRange.new(2, 4),
		["GrowRate"] = 0.1,
		["PlantDown"] = 0
	}
}
v_u_5["Bloodred Mushroom"] = v265
local v266 = {
	["PlantName"] = "Jack O Lantern",
	["PlantData"] = {
		["GrowTickTime"] = NumberRange.new(7, 8),
		["GrowFruitTime"] = NumberRange.new(120, 160),
		["GrowRate"] = 0.01,
		["PlantDown"] = 0
	},
	["FruitData"] = {
		["GrowTickTime"] = NumberRange.new(2.5, 3),
		["GrowRate"] = 0.01,
		["PlantDown"] = 0
	}
}
v_u_5["Jack O Lantern"] = v266
local v267 = {
	["PlantName"] = "Ghoul Root",
	["PlantData"] = {
		["GrowTickTime"] = NumberRange.new(20, 40),
		["GrowFruitTime"] = NumberRange.new(100, 120),
		["GrowRate"] = 0.02,
		["PlantDown"] = 0
	},
	["FruitData"] = {
		["GrowTickTime"] = NumberRange.new(8, 8.35),
		["GrowRate"] = 0.1,
		["PlantDown"] = 0
	}
}
v_u_5["Ghoul Root"] = v267
local v268 = {
	["PlantName"] = "Chicken Feed",
	["PlantData"] = {
		["GrowTickTime"] = NumberRange.new(16, 24),
		["GrowFruitTime"] = NumberRange.new(200, 240),
		["GrowRate"] = 0.015,
		["PlantDown"] = 0
	},
	["FruitData"] = {
		["GrowTickTime"] = NumberRange.new(4, 6),
		["GrowRate"] = 0.01,
		["PlantDown"] = 0
	}
}
v_u_5["Chicken Feed"] = v268
local v269 = {
	["PlantName"] = "Seer Vine",
	["PlantData"] = {
		["GrowTickTime"] = NumberRange.new(12, 14),
		["GrowFruitTime"] = NumberRange.new(200, 220),
		["GrowRate"] = 0.015,
		["PlantDown"] = 0
	},
	["FruitData"] = {
		["GrowTickTime"] = NumberRange.new(2.5, 3),
		["GrowRate"] = 0.01,
		["PlantDown"] = 0
	}
}
v_u_5["Seer Vine"] = v269
local v270 = {
	["PlantName"] = "Poison Apple",
	["PlantData"] = {
		["GrowTickTime"] = NumberRange.new(17, 18),
		["GrowFruitTime"] = NumberRange.new(300, 360),
		["GrowRate"] = 0.015,
		["PlantDown"] = 0
	},
	["FruitData"] = {
		["GrowTickTime"] = NumberRange.new(4, 6),
		["GrowRate"] = 0.01,
		["PlantDown"] = 0
	}
}
v_u_5["Poison Apple"] = v270
local v271 = {
	["PlantName"] = "Alien Apple",
	["PlantData"] = {
		["GrowTickTime"] = NumberRange.new(17, 18),
		["GrowFruitTime"] = NumberRange.new(300, 360),
		["GrowRate"] = 0.015,
		["PlantDown"] = 0
	},
	["FruitData"] = {
		["GrowTickTime"] = NumberRange.new(4, 6),
		["GrowRate"] = 0.01,
		["PlantDown"] = 0
	}
}
v_u_5["Alien Apple"] = v271
local v272 = {
	["PlantName"] = "Banesberry",
	["PlantData"] = {
		["GrowTickTime"] = NumberRange.new(4, 5),
		["GrowFruitTime"] = NumberRange.new(90, 90),
		["GrowRate"] = 0.05,
		["PlantDown"] = 0
	},
	["FruitData"] = {
		["GrowTickTime"] = NumberRange.new(4, 4),
		["GrowRate"] = 0.05,
		["PlantDown"] = 0
	}
}
v_u_5.Banesberry = v272
local v273 = {
	["PlantName"] = "Candy Cornflower",
	["PlantData"] = {
		["GrowTickTime"] = NumberRange.new(4, 5),
		["GrowFruitTime"] = NumberRange.new(90, 90),
		["GrowRate"] = 0.04,
		["PlantDown"] = 0
	},
	["FruitData"] = {
		["GrowTickTime"] = NumberRange.new(4, 4),
		["GrowRate"] = 0.05,
		["PlantDown"] = 0
	}
}
v_u_5["Candy Cornflower"] = v273
local v274 = {
	["PlantName"] = "Blood Orange",
	["PlantData"] = {
		["GrowTickTime"] = NumberRange.new(24, 28),
		["GrowFruitTime"] = NumberRange.new(300, 360),
		["GrowRate"] = 0.012,
		["PlantDown"] = 0
	},
	["FruitData"] = {
		["GrowTickTime"] = NumberRange.new(6, 8),
		["GrowRate"] = 0.01,
		["PlantDown"] = 0
	}
}
v_u_5["Blood Orange"] = v274
local v275 = {
	["PlantName"] = "Zombie Fruit",
	["PlantData"] = {
		["GrowTickTime"] = NumberRange.new(16, 20),
		["GrowFruitTime"] = NumberRange.new(5, 15),
		["GrowRate"] = 0.1,
		["PlantDown"] = 0
	},
	["FruitData"] = {
		["GrowTickTime"] = NumberRange.new(3, 4),
		["GrowRate"] = 0.04,
		["PlantDown"] = 0
	}
}
v_u_5["Zombie Fruit"] = v275
local v276 = {
	["PlantName"] = "Wisp Flower",
	["PlantData"] = {
		["GrowTickTime"] = NumberRange.new(16, 18),
		["GrowFruitTime"] = NumberRange.new(200, 240),
		["GrowRate"] = 0.08,
		["PlantDown"] = 0
	},
	["FruitData"] = {
		["GrowTickTime"] = NumberRange.new(6, 8),
		["GrowRate"] = 0.015,
		["PlantDown"] = 0
	}
}
v_u_5["Wisp Flower"] = v276
local v277 = {
	["PlantName"] = "Mummy\'s Hand",
	["PlantData"] = {
		["GrowTickTime"] = NumberRange.new(17, 17),
		["GrowFruitTime"] = NumberRange.new(200, 220),
		["GrowRate"] = 0.01,
		["PlantDown"] = 0
	},
	["FruitData"] = {
		["GrowTickTime"] = NumberRange.new(4, 8),
		["GrowRate"] = 0.01,
		["PlantDown"] = 0
	}
}
v_u_5["Mummy\'s Hand"] = v277
local v278 = {
	["PlantName"] = "Weeping Branch",
	["PlantData"] = {
		["GrowTickTime"] = NumberRange.new(24, 28),
		["GrowFruitTime"] = NumberRange.new(140, 170),
		["GrowRate"] = 0.009,
		["PlantDown"] = 0
	},
	["FruitData"] = {
		["GrowTickTime"] = NumberRange.new(15, 20),
		["GrowRate"] = 0.03,
		["PlantDown"] = 0
	}
}
v_u_5["Weeping Branch"] = v278
local v279 = {
	["PlantName"] = "Ghost Bush",
	["PlantData"] = {
		["GrowTickTime"] = NumberRange.new(9, 12),
		["GrowFruitTime"] = NumberRange.new(150, 200),
		["GrowRate"] = 0.25,
		["PlantDown"] = 0
	},
	["FruitData"] = {
		["GrowTickTime"] = NumberRange.new(6, 8),
		["GrowRate"] = 0.35,
		["PlantDown"] = 0
	}
}
v_u_5["Ghost Bush"] = v279
local v280 = {
	["PlantName"] = "Devilroot",
	["PlantData"] = {
		["GrowTickTime"] = NumberRange.new(16, 18),
		["GrowFruitTime"] = NumberRange.new(200, 240),
		["GrowRate"] = 0.02,
		["PlantDown"] = 0
	},
	["FruitData"] = {
		["GrowTickTime"] = NumberRange.new(6, 8),
		["GrowRate"] = 0.015,
		["PlantDown"] = 0
	}
}
v_u_5.Devilroot = v280
local v281 = {
	["PlantName"] = "Wereplant",
	["PlantData"] = {
		["GrowTickTime"] = NumberRange.new(24, 28),
		["GrowFruitTime"] = NumberRange.new(300, 360),
		["GrowRate"] = 0.011,
		["PlantDown"] = 0
	},
	["FruitData"] = {
		["GrowTickTime"] = NumberRange.new(6, 8),
		["GrowRate"] = 0.01,
		["PlantDown"] = 0
	}
}
v_u_5.Wereplant = v281
local v282 = {
	["PlantName"] = "Severed Spine",
	["PlantData"] = {
		["GrowTickTime"] = NumberRange.new(32, 36),
		["GrowFruitTime"] = NumberRange.new(140, 170),
		["GrowRate"] = 0.01,
		["PlantDown"] = 0
	},
	["FruitData"] = {
		["GrowTickTime"] = NumberRange.new(15, 20),
		["GrowRate"] = 0.03,
		["PlantDown"] = 0
	}
}
v_u_5["Severed Spine"] = v282
local v283 = {
	["PlantName"] = "Glass Kiwi",
	["PlantData"] = {
		["GrowTickTime"] = NumberRange.new(5, 10),
		["GrowFruitTime"] = NumberRange.new(200, 220),
		["GrowRate"] = 0.012,
		["PlantDown"] = 0
	},
	["FruitData"] = {
		["GrowTickTime"] = NumberRange.new(0.8, 1.2),
		["GrowRate"] = 0.025,
		["PlantDown"] = 0
	}
}
v_u_5["Glass Kiwi"] = v283
local v284 = {
	["PlantName"] = "Spider Vine",
	["PlantData"] = {
		["GrowTickTime"] = NumberRange.new(12, 14),
		["GrowFruitTime"] = NumberRange.new(200, 220),
		["GrowRate"] = 0.05,
		["PlantDown"] = 0
	},
	["FruitData"] = {
		["GrowTickTime"] = NumberRange.new(8, 9),
		["GrowRate"] = 0.05,
		["PlantDown"] = 0
	}
}
v_u_5["Spider Vine"] = v284
local v285 = {
	["PlantName"] = "Monster Flower",
	["PlantData"] = {
		["GrowTickTime"] = NumberRange.new(17, 21),
		["GrowFruitTime"] = NumberRange.new(300, 350),
		["GrowRate"] = 0.01,
		["PlantDown"] = 0
	},
	["FruitData"] = {
		["GrowTickTime"] = NumberRange.new(11, 13),
		["GrowRate"] = 0.035,
		["PlantDown"] = 0
	}
}
v_u_5["Monster Flower"] = v285
local v286 = {
	["PlantName"] = "Horned Redrose",
	["PlantData"] = {
		["GrowTickTime"] = NumberRange.new(4, 5),
		["GrowFruitTime"] = NumberRange.new(60, 90),
		["GrowRate"] = 0.05,
		["PlantDown"] = 0
	},
	["FruitData"] = {
		["GrowTickTime"] = NumberRange.new(2, 3),
		["GrowRate"] = 0.01,
		["PlantDown"] = 0
	}
}
v_u_5["Horned Redrose"] = v286
local v287 = {
	["PlantName"] = "Banana Orchid",
	["PlantData"] = {
		["GrowTickTime"] = NumberRange.new(4, 5),
		["GrowFruitTime"] = NumberRange.new(90, 110),
		["GrowRate"] = 0.025,
		["PlantDown"] = 0
	},
	["FruitData"] = {
		["GrowTickTime"] = NumberRange.new(4, 6),
		["GrowRate"] = 0.005,
		["PlantDown"] = 0
	}
}
v_u_5["Banana Orchid"] = v287
local v288 = {
	["PlantName"] = "Viburnum Berry",
	["PlantData"] = {
		["GrowTickTime"] = NumberRange.new(8, 9),
		["GrowFruitTime"] = NumberRange.new(120, 140),
		["GrowRate"] = 0.025,
		["PlantDown"] = 0
	},
	["FruitData"] = {
		["GrowTickTime"] = NumberRange.new(6, 7),
		["GrowRate"] = 0.008,
		["PlantDown"] = 0
	}
}
v_u_5["Viburnum Berry"] = v288
local v289 = {
	["PlantName"] = "Buddhas Hand",
	["PlantData"] = {
		["GrowTickTime"] = NumberRange.new(14, 14),
		["GrowFruitTime"] = NumberRange.new(160, 180),
		["GrowRate"] = 0.021,
		["PlantDown"] = 0
	},
	["FruitData"] = {
		["GrowTickTime"] = NumberRange.new(3.6, 4),
		["GrowRate"] = 0.02,
		["PlantDown"] = 0
	}
}
v_u_5["Buddhas Hand"] = v289
local v290 = {
	["PlantName"] = "Ghost Pepper",
	["PlantData"] = {
		["GrowTickTime"] = NumberRange.new(16, 18),
		["GrowFruitTime"] = NumberRange.new(200, 240),
		["GrowRate"] = 0.05,
		["PlantDown"] = 0
	},
	["FruitData"] = {
		["GrowTickTime"] = NumberRange.new(9, 12),
		["GrowRate"] = 0.05,
		["PlantDown"] = 0
	}
}
v_u_5["Ghost Pepper"] = v290
local v291 = {
	["PlantName"] = "Mahogany",
	["PlantData"] = {
		["GrowTickTime"] = NumberRange.new(16, 18),
		["GrowFruitTime"] = NumberRange.new(200, 240),
		["GrowRate"] = 0.05,
		["PlantDown"] = 0
	},
	["FruitData"] = {
		["GrowTickTime"] = NumberRange.new(9, 12),
		["GrowRate"] = 0.05,
		["PlantDown"] = 0
	}
}
v_u_5.Mahogany = v291
local v292 = {
	["PlantName"] = "Thornspire",
	["PlantData"] = {
		["GrowTickTime"] = NumberRange.new(26, 28),
		["GrowFruitTime"] = NumberRange.new(300, 300),
		["GrowRate"] = 0.02,
		["PlantDown"] = 0
	},
	["FruitData"] = {
		["GrowTickTime"] = NumberRange.new(10, 15),
		["GrowRate"] = 0.005,
		["PlantDown"] = 0
	}
}
v_u_5.Thornspire = v292
local v293 = {
	["PlantName"] = "Wyrmvine",
	["PlantData"] = {
		["GrowTickTime"] = NumberRange.new(12, 16),
		["GrowFruitTime"] = NumberRange.new(400, 460),
		["GrowRate"] = 0.01,
		["PlantDown"] = 0
	},
	["FruitData"] = {
		["GrowTickTime"] = NumberRange.new(7.85, 8.5),
		["GrowRate"] = 0.001,
		["PlantDown"] = 0
	}
}
v_u_5.Wyrmvine = v293
local v294 = {
	["PlantName"] = "Orange Delight",
	["PlantData"] = {
		["GrowTickTime"] = NumberRange.new(5, 5),
		["GrowFruitTime"] = NumberRange.new(80, 100),
		["GrowRate"] = 0.1,
		["PlantDown"] = 0
	},
	["FruitData"] = {
		["GrowTickTime"] = NumberRange.new(4, 4),
		["GrowRate"] = 0.05,
		["PlantDown"] = 0
	}
}
v_u_5["Orange Delight"] = v294
local v295 = {
	["PlantName"] = "Protea",
	["PlantData"] = {
		["GrowTickTime"] = NumberRange.new(18, 18),
		["GrowFruitTime"] = NumberRange.new(140, 160),
		["GrowRate"] = 0.03,
		["PlantDown"] = 0
	},
	["FruitData"] = {
		["GrowTickTime"] = NumberRange.new(10, 10),
		["GrowRate"] = 0.04,
		["PlantDown"] = 0
	}
}
v_u_5.Protea = v295
local v296 = {
	["PlantName"] = "Baobab",
	["PlantData"] = {
		["GrowTickTime"] = NumberRange.new(32, 32),
		["GrowFruitTime"] = NumberRange.new(400, 420),
		["GrowRate"] = 0.02,
		["PlantDown"] = 0
	},
	["FruitData"] = {
		["GrowTickTime"] = NumberRange.new(20, 20),
		["GrowRate"] = 0.03,
		["PlantDown"] = 0
	}
}
v_u_5.Baobab = v296
local v297 = {
	["PlantName"] = "Daisy",
	["PlantData"] = {
		["GrowTickTime"] = NumberRange.new(4, 5),
		["GrowFruitTime"] = NumberRange.new(60, 90),
		["GrowRate"] = 0.1,
		["PlantDown"] = 0
	},
	["FruitData"] = {
		["GrowTickTime"] = NumberRange.new(2, 3),
		["GrowRate"] = 0.01,
		["PlantDown"] = 0
	}
}
v_u_5.Daisy = v297
local v298 = {
	["PlantName"] = "Bamboo Tree",
	["PlantData"] = {
		["GrowTickTime"] = NumberRange.new(4, 5),
		["GrowFruitTime"] = NumberRange.new(90, 110),
		["GrowRate"] = 0.01,
		["PlantDown"] = 0
	},
	["FruitData"] = {
		["GrowTickTime"] = NumberRange.new(4, 6),
		["GrowRate"] = 0.005,
		["PlantDown"] = 0
	}
}
v_u_5["Bamboo Tree"] = v298
local v299 = {
	["PlantName"] = "Amberfruit Shrub",
	["PlantData"] = {
		["GrowTickTime"] = NumberRange.new(8, 9),
		["GrowFruitTime"] = NumberRange.new(120, 140),
		["GrowRate"] = 0.01,
		["PlantDown"] = 0
	},
	["FruitData"] = {
		["GrowTickTime"] = NumberRange.new(6, 7),
		["GrowRate"] = 0.008,
		["PlantDown"] = 0
	}
}
v_u_5["Amberfruit Shrub"] = v299
local v300 = {
	["PlantName"] = "Castor Bean",
	["PlantData"] = {
		["GrowTickTime"] = NumberRange.new(14, 14),
		["GrowFruitTime"] = NumberRange.new(160, 180),
		["GrowRate"] = 0.01,
		["PlantDown"] = 0
	},
	["FruitData"] = {
		["GrowTickTime"] = NumberRange.new(3.6, 4),
		["GrowRate"] = 0.02,
		["PlantDown"] = 0
	}
}
v_u_5["Castor Bean"] = v300
local v301 = {
	["PlantName"] = "Java Banana",
	["PlantData"] = {
		["GrowTickTime"] = NumberRange.new(16, 18),
		["GrowFruitTime"] = NumberRange.new(200, 240),
		["GrowRate"] = 0.01,
		["PlantDown"] = 0
	},
	["FruitData"] = {
		["GrowTickTime"] = NumberRange.new(9, 12),
		["GrowRate"] = 0.05,
		["PlantDown"] = 0
	}
}
v_u_5["Java Banana"] = v301
local v302 = {
	["PlantName"] = "Peacock Tail",
	["PlantData"] = {
		["GrowTickTime"] = NumberRange.new(32, 35),
		["GrowFruitTime"] = NumberRange.new(400, 500),
		["GrowRate"] = 0.01,
		["PlantDown"] = 0
	},
	["FruitData"] = {
		["GrowTickTime"] = NumberRange.new(10, 15),
		["GrowRate"] = 0.005,
		["PlantDown"] = 0
	}
}
v_u_5["Peacock Tail"] = v302
local v303 = {
	["PlantName"] = "Gem Fruit",
	["PlantData"] = {
		["GrowTickTime"] = NumberRange.new(10, 12),
		["GrowFruitTime"] = NumberRange.new(90, 120),
		["GrowRate"] = 0.1,
		["PlantDown"] = 0
	},
	["FruitData"] = {
		["GrowTickTime"] = NumberRange.new(3.6, 6),
		["GrowRate"] = 0.05,
		["PlantDown"] = 0
	}
}
v_u_5["Gem Fruit"] = v303
local v304 = {
	["PlantName"] = "Coilvine",
	["PlantData"] = {
		["GrowTickTime"] = NumberRange.new(13, 13),
		["GrowFruitTime"] = NumberRange.new(250, 250),
		["GrowRate"] = 0.008,
		["PlantDown"] = 0
	},
	["FruitData"] = {
		["GrowTickTime"] = NumberRange.new(6, 6),
		["GrowRate"] = 0.05,
		["PlantDown"] = 0
	}
}
v_u_5.Coilvine = v304
local v305 = {
	["PlantName"] = "Asteris",
	["PlantData"] = {
		["GrowTickTime"] = NumberRange.new(40, 40),
		["GrowFruitTime"] = NumberRange.new(400, 400),
		["GrowRate"] = 0.01,
		["PlantDown"] = 0
	},
	["FruitData"] = {
		["GrowTickTime"] = NumberRange.new(14, 14),
		["GrowRate"] = 0.05,
		["PlantDown"] = 0
	}
}
v_u_5.Asteris = v305
local v306 = {
	["PlantName"] = "Lumin Bloom",
	["PlantData"] = {
		["GrowTickTime"] = NumberRange.new(24, 24),
		["GrowFruitTime"] = NumberRange.new(120, 120),
		["GrowRate"] = 0.1,
		["PlantDown"] = 0
	},
	["FruitData"] = {
		["GrowTickTime"] = NumberRange.new(6, 6),
		["GrowRate"] = 0.08,
		["PlantDown"] = 0
	}
}
v_u_5["Lumin Bloom"] = v306
local v307 = {
	["PlantName"] = "Luna Stem",
	["PlantData"] = {
		["GrowTickTime"] = NumberRange.new(20, 20),
		["GrowFruitTime"] = NumberRange.new(60, 80),
		["GrowRate"] = 0.05,
		["PlantDown"] = 0
	},
	["FruitData"] = {
		["GrowTickTime"] = NumberRange.new(8, 8),
		["GrowRate"] = 0.1,
		["PlantDown"] = 0
	}
}
v_u_5["Luna Stem"] = v307
local v308 = {
	["PlantName"] = "Zucchini",
	["PlantData"] = {
		["GrowTickTime"] = NumberRange.new(14, 16),
		["GrowFruitTime"] = NumberRange.new(300, 360),
		["GrowRate"] = 0.005,
		["PlantDown"] = 0
	},
	["FruitData"] = {
		["GrowTickTime"] = NumberRange.new(24, 26),
		["GrowRate"] = 0.1,
		["PlantDown"] = 0
	}
}
v_u_5.Zucchini = v308
local v309 = {
	["PlantName"] = "Olive",
	["PlantData"] = {
		["GrowTickTime"] = NumberRange.new(10, 12),
		["GrowFruitTime"] = NumberRange.new(60, 80),
		["GrowRate"] = 0.1,
		["PlantDown"] = 0
	},
	["FruitData"] = {
		["GrowTickTime"] = NumberRange.new(10, 12),
		["GrowRate"] = 0.1,
		["PlantDown"] = 0
	}
}
v_u_5.Olive = v309
local v310 = {
	["PlantName"] = "Hollow Bamboo",
	["PlantData"] = {
		["GrowTickTime"] = NumberRange.new(18, 22),
		["GrowFruitTime"] = NumberRange.new(100, 140),
		["GrowRate"] = 0.015,
		["PlantDown"] = 0
	},
	["FruitData"] = {
		["GrowTickTime"] = NumberRange.new(7, 9),
		["GrowRate"] = 0.05,
		["PlantDown"] = 0
	}
}
v_u_5["Hollow Bamboo"] = v310
local v311 = {
	["PlantName"] = "Yarrow",
	["PlantData"] = {
		["GrowTickTime"] = NumberRange.new(26, 28),
		["GrowFruitTime"] = NumberRange.new(400, 460),
		["GrowRate"] = 0.007,
		["PlantDown"] = 0
	},
	["FruitData"] = {
		["GrowTickTime"] = NumberRange.new(2, 4),
		["GrowRate"] = 0.01,
		["PlantDown"] = 0
	}
}
v_u_5.Yarrow = v311
local v312 = {
	["PlantName"] = "Pomegranate",
	["PlantData"] = {
		["GrowTickTime"] = NumberRange.new(12, 12),
		["GrowFruitTime"] = NumberRange.new(90, 110),
		["GrowRate"] = 0.1,
		["PlantDown"] = 0
	},
	["FruitData"] = {
		["GrowTickTime"] = NumberRange.new(4, 6),
		["GrowRate"] = 0.1,
		["PlantDown"] = 0
	}
}
v_u_5.Pomegranate = v312
local v313 = {
	["PlantName"] = "Wild Pineapple",
	["PlantData"] = {
		["GrowTickTime"] = NumberRange.new(16, 24),
		["GrowFruitTime"] = NumberRange.new(300, 300),
		["GrowRate"] = 0.01,
		["PlantDown"] = 0
	},
	["FruitData"] = {
		["GrowTickTime"] = NumberRange.new(7, 8),
		["GrowRate"] = 0.05,
		["PlantDown"] = 0
	}
}
v_u_5["Wild Pineapple"] = v313
local v314 = {
	["PlantName"] = "Coinfruit",
	["PlantData"] = {
		["GrowTickTime"] = NumberRange.new(4, 8),
		["GrowFruitTime"] = NumberRange.new(100, 100),
		["GrowRate"] = 0.15,
		["PlantDown"] = 0
	},
	["FruitData"] = {
		["GrowTickTime"] = NumberRange.new(4, 8),
		["GrowRate"] = 0.1,
		["PlantDown"] = 0
	}
}
v_u_5.Coinfruit = v314
local v315 = {
	["PlantName"] = "Sherrybloom",
	["PlantData"] = {
		["GrowTickTime"] = NumberRange.new(14, 16),
		["GrowFruitTime"] = NumberRange.new(200, 200),
		["GrowRate"] = 0.045,
		["PlantDown"] = 0
	},
	["FruitData"] = {
		["GrowTickTime"] = NumberRange.new(6, 7),
		["GrowRate"] = 0.067,
		["PlantDown"] = 0
	}
}
v_u_5.Sherrybloom = v315
local v316 = {
	["PlantName"] = "Pinkside Dandelion",
	["PlantData"] = {
		["GrowTickTime"] = NumberRange.new(36, 40),
		["GrowFruitTime"] = NumberRange.new(400, 400),
		["GrowRate"] = 0.011,
		["PlantDown"] = 0
	},
	["FruitData"] = {
		["GrowTickTime"] = NumberRange.new(9, 12),
		["GrowRate"] = 0.08,
		["PlantDown"] = 0
	}
}
v_u_5["Pinkside Dandelion"] = v316
local v317 = {
	["PlantName"] = "Gingerbread Blossom",
	["PlantData"] = {
		["GrowTickTime"] = NumberRange.new(48, 48),
		["GrowFruitTime"] = NumberRange.new(500, 500),
		["GrowRate"] = 0.023,
		["PlantDown"] = 0
	},
	["FruitData"] = {
		["GrowTickTime"] = NumberRange.new(12, 12),
		["GrowRate"] = 0.045,
		["PlantDown"] = 0
	}
}
v_u_5["Gingerbread Blossom"] = v317
local v318 = {
	["PlantName"] = "Heart Blossom",
	["PlantData"] = {
		["GrowTickTime"] = NumberRange.new(48, 48),
		["GrowFruitTime"] = NumberRange.new(500, 500),
		["GrowRate"] = 0.023,
		["PlantDown"] = 0
	},
	["FruitData"] = {
		["GrowTickTime"] = NumberRange.new(12, 12),
		["GrowRate"] = 0.045,
		["PlantDown"] = 0
	}
}
v_u_5["Heart Blossom"] = v318
local v319 = {
	["PlantName"] = "Cookie Stack",
	["PlantData"] = {
		["GrowTickTime"] = NumberRange.new(12, 12),
		["GrowFruitTime"] = NumberRange.new(80, 80),
		["GrowRate"] = 0.1,
		["PlantDown"] = 0
	},
	["FruitData"] = {
		["GrowTickTime"] = NumberRange.new(6, 6),
		["GrowRate"] = 0.05,
		["PlantDown"] = 0
	}
}
v_u_5["Cookie Stack"] = v319
local v320 = {
	["PlantName"] = "Poinsettia",
	["PlantData"] = {
		["GrowTickTime"] = NumberRange.new(10, 12),
		["GrowFruitTime"] = NumberRange.new(120, 140),
		["GrowRate"] = 0.08,
		["PlantDown"] = 0
	},
	["FruitData"] = {
		["GrowTickTime"] = NumberRange.new(7, 8),
		["GrowRate"] = 0.05,
		["PlantDown"] = 0
	}
}
v_u_5.Poinsettia = v320
local v321 = {
	["PlantName"] = "Antlerbloom",
	["PlantData"] = {
		["GrowTickTime"] = NumberRange.new(24, 30),
		["GrowFruitTime"] = NumberRange.new(200, 300),
		["GrowRate"] = 0.1,
		["PlantDown"] = 0
	},
	["FruitData"] = {
		["GrowTickTime"] = NumberRange.new(10, 12),
		["GrowRate"] = 0.05,
		["PlantDown"] = 0
	}
}
v_u_5.Antlerbloom = v321
local v322 = {
	["PlantName"] = "Holly Berry",
	["PlantData"] = {
		["GrowTickTime"] = NumberRange.new(14, 18),
		["GrowFruitTime"] = NumberRange.new(250, 350),
		["GrowRate"] = 0.075,
		["PlantDown"] = 0
	},
	["FruitData"] = {
		["GrowTickTime"] = NumberRange.new(7, 9),
		["GrowRate"] = 0.05,
		["PlantDown"] = 0
	}
}
v_u_5["Holly Berry"] = v322
local v323 = {
	["PlantName"] = "Gift Berry",
	["PlantData"] = {
		["GrowTickTime"] = NumberRange.new(30, 30),
		["GrowFruitTime"] = NumberRange.new(400, 500),
		["GrowRate"] = 0.035,
		["PlantDown"] = 0
	},
	["FruitData"] = {
		["GrowTickTime"] = NumberRange.new(20, 24),
		["GrowRate"] = 0.1,
		["PlantDown"] = 0
	}
}
v_u_5["Gift Berry"] = v323
local v324 = {
	["PlantName"] = "Frosty Bite",
	["PlantData"] = {
		["GrowTickTime"] = NumberRange.new(6, 8),
		["GrowFruitTime"] = NumberRange.new(40, 60),
		["GrowRate"] = 0.1,
		["PlantDown"] = 0
	},
	["FruitData"] = {
		["GrowTickTime"] = NumberRange.new(6, 8),
		["GrowRate"] = 0.05,
		["PlantDown"] = 0
	}
}
v_u_5["Frosty Bite"] = v324
local v325 = {
	["PlantName"] = "Cryo Rose",
	["PlantData"] = {
		["GrowTickTime"] = NumberRange.new(8, 10),
		["GrowFruitTime"] = NumberRange.new(60, 100),
		["GrowRate"] = 0.05,
		["PlantDown"] = 0
	},
	["FruitData"] = {
		["GrowTickTime"] = NumberRange.new(8, 12),
		["GrowRate"] = 0.025,
		["PlantDown"] = 0
	}
}
v_u_5["Cryo Rose"] = v325
local v326 = {
	["PlantName"] = "Bush Flake",
	["PlantData"] = {
		["GrowTickTime"] = NumberRange.new(16, 20),
		["GrowFruitTime"] = NumberRange.new(100, 160),
		["GrowRate"] = 0.1,
		["PlantDown"] = 0
	},
	["FruitData"] = {
		["GrowTickTime"] = NumberRange.new(12, 14),
		["GrowRate"] = 0.05,
		["PlantDown"] = 0
	}
}
v_u_5["Bush Flake"] = v326
local v327 = {
	["PlantName"] = "Rosemary",
	["PlantData"] = {
		["GrowTickTime"] = NumberRange.new(30, 34),
		["GrowFruitTime"] = NumberRange.new(160, 200),
		["GrowRate"] = 0.018,
		["PlantDown"] = 0
	},
	["FruitData"] = {
		["GrowTickTime"] = NumberRange.new(14, 18),
		["GrowRate"] = 0.025,
		["PlantDown"] = 0
	}
}
v_u_5.Rosemary = v327
local v328 = {
	["PlantName"] = "Cryoshard",
	["PlantData"] = {
		["GrowTickTime"] = NumberRange.new(28, 32),
		["GrowFruitTime"] = NumberRange.new(300, 350),
		["GrowRate"] = 0.025,
		["PlantDown"] = 0
	},
	["FruitData"] = {
		["GrowTickTime"] = NumberRange.new(18, 22),
		["GrowRate"] = 0.025,
		["PlantDown"] = 0
	}
}
v_u_5.Cryoshard = v328
local v329 = {
	["PlantName"] = "Frostwing",
	["PlantData"] = {
		["GrowTickTime"] = NumberRange.new(40, 44),
		["GrowFruitTime"] = NumberRange.new(400, 440),
		["GrowRate"] = 0.004,
		["PlantDown"] = 0.333
	},
	["FruitData"] = {
		["GrowTickTime"] = NumberRange.new(40, 44),
		["GrowRate"] = 0.04,
		["PlantDown"] = 0
	}
}
v_u_5.Frostwing = v329
local v330 = {
	["PlantName"] = "Pollen Cone",
	["PlantData"] = {
		["GrowTickTime"] = NumberRange.new(30, 44),
		["GrowFruitTime"] = NumberRange.new(333, 350),
		["GrowRate"] = 0.01,
		["PlantDown"] = 2
	},
	["FruitData"] = {
		["GrowTickTime"] = NumberRange.new(17, 23),
		["GrowRate"] = 0.015,
		["PlantDown"] = -0.25
	}
}
v_u_5["Pollen Cone"] = v330
local v331 = {
	["PlantName"] = "Peppermint Pop",
	["PlantData"] = {
		["GrowTickTime"] = NumberRange.new(1, 1),
		["GrowRate"] = 0.1,
		["PlantDown"] = 0
	}
}
v_u_5["Peppermint Pop"] = v331
local v332 = {
	["PlantName"] = "Gumdrop",
	["PlantData"] = {
		["GrowTickTime"] = NumberRange.new(10, 12),
		["GrowFruitTime"] = NumberRange.new(80, 100),
		["GrowRate"] = 0.05,
		["PlantDown"] = 0
	},
	["FruitData"] = {
		["GrowTickTime"] = NumberRange.new(7, 7),
		["GrowRate"] = 0.05,
		["PlantDown"] = 0
	}
}
v_u_5.Gumdrop = v332
local v333 = {
	["PlantName"] = "Christmas Cracker",
	["PlantData"] = {
		["GrowTickTime"] = NumberRange.new(8, 12),
		["GrowFruitTime"] = NumberRange.new(100, 140),
		["GrowRate"] = 0.01,
		["PlantDown"] = 0
	},
	["FruitData"] = {
		["GrowTickTime"] = NumberRange.new(8, 8),
		["GrowRate"] = 0.025,
		["PlantDown"] = 0
	}
}
v_u_5["Christmas Cracker"] = v333
local v334 = {
	["PlantName"] = "Candy Cane",
	["PlantData"] = {
		["GrowTickTime"] = NumberRange.new(6, 8),
		["GrowRate"] = 0.1,
		["PlantDown"] = 0
	}
}
v_u_5["Candy Cane"] = v334
local v335 = {
	["PlantName"] = "Snowman Sprout",
	["PlantData"] = {
		["GrowTickTime"] = NumberRange.new(20, 24),
		["GrowFruitTime"] = NumberRange.new(300, 400),
		["GrowRate"] = 0.05,
		["PlantDown"] = 0.333
	},
	["FruitData"] = {
		["GrowTickTime"] = NumberRange.new(6, 8),
		["GrowRate"] = 0.05,
		["PlantDown"] = 0
	}
}
v_u_5["Snowman Sprout"] = v335
local v336 = {
	["PlantName"] = "Christmas Tree",
	["PlantData"] = {
		["GrowTickTime"] = NumberRange.new(5, 5),
		["GrowRate"] = 1,
		["PlantDown"] = 0
	}
}
v_u_5["Christmas Tree"] = v336
local v337 = {
	["PlantName"] = "Sparkle Slice",
	["PlantData"] = {
		["GrowTickTime"] = NumberRange.new(20, 26),
		["GrowFruitTime"] = NumberRange.new(222, 222),
		["GrowRate"] = 0.02026,
		["PlantDown"] = 0
	},
	["FruitData"] = {
		["GrowTickTime"] = NumberRange.new(2, 4),
		["GrowRate"] = 0.02,
		["PlantDown"] = 0
	}
}
v_u_5["Sparkle Slice"] = v337
local v338 = {
	["PlantName"] = "Colorpop Crop",
	["PlantData"] = {
		["GrowTickTime"] = NumberRange.new(40, 45),
		["GrowFruitTime"] = NumberRange.new(333, 333),
		["GrowRate"] = 0.02026,
		["PlantDown"] = 0
	},
	["FruitData"] = {
		["GrowTickTime"] = NumberRange.new(4, 6),
		["GrowRate"] = 0.02,
		["PlantDown"] = 0
	}
}
v_u_5["Colorpop Crop"] = v338
local v339 = {
	["PlantName"] = "Firework Fern",
	["PlantData"] = {
		["GrowTickTime"] = NumberRange.new(60, 60),
		["GrowFruitTime"] = NumberRange.new(444, 444),
		["GrowRate"] = 0.02026,
		["PlantDown"] = 0
	},
	["FruitData"] = {
		["GrowTickTime"] = NumberRange.new(6, 8),
		["GrowRate"] = 0.02,
		["PlantDown"] = 0
	}
}
v_u_5["Firework Fern"] = v339
local v340 = {
	["PlantName"] = "Kernel Curl",
	["PlantData"] = {
		["GrowTickTime"] = NumberRange.new(12, 16),
		["GrowFruitTime"] = NumberRange.new(129, 160),
		["GrowRate"] = 0.007,
		["PlantDown"] = 0
	},
	["FruitData"] = {
		["GrowTickTime"] = NumberRange.new(8, 10),
		["GrowRate"] = 0.025,
		["PlantDown"] = 0
	}
}
v_u_5["Kernel Curl"] = v340
local v341 = {
	["PlantName"] = "Bonanza Bloom",
	["PlantData"] = {
		["GrowTickTime"] = NumberRange.new(28, 32),
		["GrowFruitTime"] = NumberRange.new(280, 320),
		["GrowRate"] = 0.008,
		["PlantDown"] = 0
	},
	["FruitData"] = {
		["GrowTickTime"] = NumberRange.new(20, 24),
		["GrowRate"] = 0.025,
		["PlantDown"] = 0
	}
}
v_u_5["Bonanza Bloom"] = v341
local v342 = {
	["PlantName"] = "Shimmersprout",
	["PlantData"] = {
		["GrowTickTime"] = NumberRange.new(3, 4),
		["GrowFruitTime"] = NumberRange.new(80, 80),
		["GrowRate"] = 0.05,
		["PlantDown"] = -0.5
	},
	["FruitData"] = {
		["GrowTickTime"] = NumberRange.new(1, 2),
		["GrowRate"] = 0.05,
		["PlantDown"] = 0.25
	}
}
v_u_5.Shimmersprout = v342
local v343 = {
	["PlantName"] = "Crimson Cranberry",
	["PlantData"] = {
		["GrowTickTime"] = NumberRange.new(6, 8),
		["GrowFruitTime"] = NumberRange.new(110, 130),
		["GrowRate"] = 0.095,
		["PlantDown"] = 0
	},
	["FruitData"] = {
		["GrowTickTime"] = NumberRange.new(3, 4),
		["GrowRate"] = 0.025,
		["PlantDown"] = 0
	}
}
v_u_5["Crimson Cranberry"] = v343
local v344 = {
	["PlantName"] = "Confetti Tula",
	["PlantData"] = {
		["GrowTickTime"] = NumberRange.new(13, 14),
		["GrowFruitTime"] = NumberRange.new(110, 130),
		["GrowRate"] = 0.01,
		["PlantDown"] = 0
	},
	["FruitData"] = {
		["GrowTickTime"] = NumberRange.new(3, 3),
		["GrowRate"] = 0.025,
		["PlantDown"] = 0
	}
}
v_u_5["Confetti Tula"] = v344
local v345 = {
	["PlantName"] = "Hexberry",
	["PlantData"] = {
		["GrowTickTime"] = NumberRange.new(5, 8),
		["GrowFruitTime"] = NumberRange.new(100, 120),
		["GrowRate"] = 0.025,
		["PlantDown"] = 0
	},
	["FruitData"] = {
		["GrowTickTime"] = NumberRange.new(4, 4),
		["GrowRate"] = 0.11,
		["PlantDown"] = 0
	}
}
v_u_5.Hexberry = v345
local v346 = {
	["PlantName"] = "Peanut",
	["PlantData"] = {
		["GrowTickTime"] = NumberRange.new(9, 11),
		["GrowFruitTime"] = NumberRange.new(200, 240),
		["GrowRate"] = 0.0085,
		["PlantDown"] = 0
	},
	["FruitData"] = {
		["GrowTickTime"] = NumberRange.new(5, 5),
		["GrowRate"] = 0.09,
		["PlantDown"] = 0
	}
}
v_u_5.Peanut = v346
local v347 = {
	["PlantName"] = "Yellow Core",
	["PlantData"] = {
		["GrowTickTime"] = NumberRange.new(20, 20),
		["GrowFruitTime"] = NumberRange.new(160, 180),
		["GrowRate"] = 0.0066,
		["PlantDown"] = 0
	},
	["FruitData"] = {
		["GrowTickTime"] = NumberRange.new(6, 6),
		["GrowRate"] = 0.025,
		["PlantDown"] = 0
	}
}
v_u_5["Yellow Core"] = v347
local v348 = {
	["PlantName"] = "Crunchnut",
	["PlantData"] = {
		["GrowTickTime"] = NumberRange.new(20, 22),
		["GrowFruitTime"] = NumberRange.new(220, 240),
		["GrowRate"] = 0.015,
		["PlantDown"] = 0
	},
	["FruitData"] = {
		["GrowTickTime"] = NumberRange.new(7, 7),
		["GrowRate"] = 0.01,
		["PlantDown"] = 0
	}
}
v_u_5.Crunchnut = v348
local v349 = {
	["PlantName"] = "Candlite",
	["PlantData"] = {
		["GrowTickTime"] = NumberRange.new(18, 19),
		["GrowFruitTime"] = NumberRange.new(220, 220),
		["GrowRate"] = 0.0099,
		["PlantDown"] = 0.333
	},
	["FruitData"] = {
		["GrowTickTime"] = NumberRange.new(9, 9),
		["GrowRate"] = 0.05,
		["PlantDown"] = 0
	}
}
v_u_5.Candlite = v349
local v350 = {
	["PlantName"] = "Frost Pepper",
	["PlantData"] = {
		["GrowTickTime"] = NumberRange.new(24, 24),
		["GrowFruitTime"] = NumberRange.new(300, 300),
		["GrowRate"] = 0.008,
		["PlantDown"] = 0
	},
	["FruitData"] = {
		["GrowTickTime"] = NumberRange.new(13, 13),
		["GrowRate"] = 0.05,
		["PlantDown"] = 0
	}
}
v_u_5["Frost Pepper"] = v350
local v351 = {
	["PlantName"] = "Plumwillow",
	["PlantData"] = {
		["GrowTickTime"] = NumberRange.new(15, 15),
		["GrowFruitTime"] = NumberRange.new(300, 300),
		["GrowRate"] = 0.004,
		["PlantDown"] = 0
	},
	["FruitData"] = {
		["GrowTickTime"] = NumberRange.new(15, 15),
		["GrowRate"] = 0.02,
		["PlantDown"] = 0
	}
}
v_u_5.Plumwillow = v351
local v352 = {
	["PlantName"] = "Blooming Cactus",
	["PlantData"] = {
		["GrowTickTime"] = NumberRange.new(32, 34),
		["GrowFruitTime"] = NumberRange.new(350, 350),
		["GrowRate"] = 0.005,
		["PlantDown"] = 0
	},
	["FruitData"] = {
		["GrowTickTime"] = NumberRange.new(18, 18),
		["GrowRate"] = 0.05,
		["PlantDown"] = 0
	}
}
v_u_5["Blooming Cactus"] = v352
local v353 = {
	["PlantName"] = "Madcrown Vine",
	["PlantData"] = {
		["GrowTickTime"] = NumberRange.new(42, 44),
		["GrowFruitTime"] = NumberRange.new(400, 400),
		["GrowRate"] = 0.0067,
		["PlantDown"] = 0
	},
	["FruitData"] = {
		["GrowTickTime"] = NumberRange.new(24, 24),
		["GrowRate"] = 0.025,
		["PlantDown"] = 0
	}
}
v_u_5["Madcrown Vine"] = v353
local v354 = {
	["PlantName"] = "Magma Pepper",
	["PlantData"] = {
		["GrowTickTime"] = NumberRange.new(32, 32),
		["GrowFruitTime"] = NumberRange.new(666, 666),
		["GrowRate"] = 0.0035,
		["PlantDown"] = 0
	},
	["FruitData"] = {
		["GrowTickTime"] = NumberRange.new(33, 33),
		["GrowRate"] = 0.025,
		["PlantDown"] = 0
	}
}
v_u_5["Magma Pepper"] = v354
local v355 = {
	["PlantName"] = "Frost Fern",
	["PlantData"] = {
		["GrowTickTime"] = NumberRange.new(15, 20),
		["GrowFruitTime"] = NumberRange.new(200, 200),
		["GrowRate"] = 0.0072,
		["PlantDown"] = 0
	},
	["FruitData"] = {
		["GrowTickTime"] = NumberRange.new(6, 10),
		["GrowRate"] = 0.03,
		["PlantDown"] = 0
	}
}
v_u_5["Frost Fern"] = v355
local v356 = {
	["PlantName"] = "Dragon Sapling",
	["PlantData"] = {
		["GrowTickTime"] = NumberRange.new(10, 12),
		["GrowFruitTime"] = NumberRange.new(60, 80),
		["GrowRate"] = 0.02,
		["PlantDown"] = 0
	},
	["FruitData"] = {
		["GrowTickTime"] = NumberRange.new(3.6, 6),
		["GrowRate"] = 0.05,
		["PlantDown"] = 0
	}
}
v_u_5["Dragon Sapling"] = v356
local v357 = {
	["PlantName"] = "Sinisterdrip",
	["PlantData"] = {
		["GrowTickTime"] = NumberRange.new(10, 12),
		["GrowFruitTime"] = NumberRange.new(60, 80),
		["GrowRate"] = 0.02,
		["PlantDown"] = 0
	},
	["FruitData"] = {
		["GrowTickTime"] = NumberRange.new(3.6, 6),
		["GrowRate"] = 0.05,
		["PlantDown"] = 0
	}
}
v_u_5.Sinisterdrip = v357
local v358 = {
	["PlantName"] = "Log Pumpkin",
	["PlantData"] = {
		["GrowTickTime"] = NumberRange.new(9.65, 10),
		["GrowFruitTime"] = NumberRange.new(80, 90),
		["GrowRate"] = 0.015,
		["PlantDown"] = 0
	},
	["FruitData"] = {
		["GrowTickTime"] = NumberRange.new(8, 8.35),
		["GrowRate"] = 0.01,
		["PlantDown"] = 0
	}
}
v_u_5["Log Pumpkin"] = v358
local v359 = {
	["PlantName"] = "Aura Flora",
	["PlantData"] = {
		["GrowTickTime"] = NumberRange.new(10, 13.24),
		["GrowFruitTime"] = NumberRange.new(72, 85),
		["GrowRate"] = 0.21,
		["PlantDown"] = 0
	},
	["FruitData"] = {
		["GrowTickTime"] = NumberRange.new(5, 7.35),
		["GrowRate"] = 0.12,
		["PlantDown"] = 0
	}
}
v_u_5["Aura Flora"] = v359
local v360 = {
	["PlantName"] = "Mutant Carrot",
	["PlantData"] = {
		["GrowTickTime"] = NumberRange.new(9.65, 10),
		["GrowFruitTime"] = NumberRange.new(80, 90),
		["GrowRate"] = 0.015,
		["PlantDown"] = 0
	},
	["FruitData"] = {
		["GrowTickTime"] = NumberRange.new(8, 8.35),
		["GrowRate"] = 0.01,
		["PlantDown"] = 0
	}
}
v_u_5["Mutant Carrot"] = v360
local v361 = {
	["PlantName"] = "King Palm",
	["PlantData"] = {
		["GrowTickTime"] = NumberRange.new(6, 8),
		["GrowFruitTime"] = NumberRange.new(60, 80),
		["GrowRate"] = 0.025,
		["PlantDown"] = 0
	},
	["FruitData"] = {
		["GrowTickTime"] = NumberRange.new(3.6, 4),
		["GrowRate"] = 0.02,
		["PlantDown"] = 0
	}
}
v_u_5["King Palm"] = v361
local v362 = {
	["PlantName"] = "Spectralis",
	["PlantData"] = {
		["GrowTickTime"] = NumberRange.new(6, 8),
		["GrowFruitTime"] = NumberRange.new(60, 80),
		["GrowRate"] = 0.025,
		["PlantDown"] = 0
	},
	["FruitData"] = {
		["GrowTickTime"] = NumberRange.new(3.6, 4),
		["GrowRate"] = 0.02,
		["PlantDown"] = 0
	}
}
v_u_5.Spectralis = v362
local v363 = {
	["PlantName"] = "Spirit Lantern",
	["PlantData"] = {
		["GrowTickTime"] = NumberRange.new(6, 8),
		["GrowFruitTime"] = NumberRange.new(60, 80),
		["GrowRate"] = 0.025,
		["PlantDown"] = 0
	},
	["FruitData"] = {
		["GrowTickTime"] = NumberRange.new(3.6, 4),
		["GrowRate"] = 0.02,
		["PlantDown"] = 0
	}
}
v_u_5["Spirit Lantern"] = v363
local v364 = {
	["PlantName"] = "Aurora Vine",
	["PlantData"] = {
		["GrowTickTime"] = NumberRange.new(10, 12),
		["GrowFruitTime"] = NumberRange.new(20, 40),
		["GrowRate"] = 0.0085,
		["PlantDown"] = 0
	},
	["FruitData"] = {
		["GrowTickTime"] = NumberRange.new(1, 1),
		["GrowRate"] = 0.1,
		["PlantDown"] = 0
	}
}
v_u_5["Aurora Vine"] = v364
local v365 = {
	["PlantName"] = "Snaparino Beanarini",
	["PlantData"] = {
		["GrowTickTime"] = NumberRange.new(12, 16),
		["GrowFruitTime"] = NumberRange.new(90, 120),
		["GrowRate"] = 0.025,
		["PlantDown"] = 0
	},
	["FruitData"] = {
		["GrowTickTime"] = NumberRange.new(6, 8),
		["GrowRate"] = 0.02,
		["PlantDown"] = 0
	}
}
v_u_5["Snaparino Beanarini"] = v365
local v366 = {
	["PlantName"] = "Fennel",
	["PlantData"] = {
		["GrowTickTime"] = NumberRange.new(1.6, 2.4),
		["GrowRate"] = 0.02,
		["PlantDown"] = 0
	}
}
v_u_5.Fennel = v366
local v367 = {
	["PlantName"] = "Melon Flower",
	["PlantData"] = {
		["GrowTickTime"] = NumberRange.new(1.6, 2.4),
		["GrowFruitTime"] = NumberRange.new(40, 60),
		["GrowRate"] = 0.52,
		["PlantDown"] = 0
	},
	["FruitData"] = {
		["GrowTickTime"] = NumberRange.new(0.8, 1.2),
		["GrowRate"] = 0.785,
		["PlantDown"] = 0
	}
}
v_u_5["Melon Flower"] = v367
local v368 = {
	["PlantName"] = "Frostspike",
	["PlantData"] = {
		["GrowTickTime"] = NumberRange.new(5, 6),
		["GrowFruitTime"] = NumberRange.new(40, 60),
		["GrowRate"] = 0.005,
		["PlantDown"] = 0
	},
	["FruitData"] = {
		["GrowTickTime"] = NumberRange.new(2, 3),
		["GrowRate"] = 0.05,
		["PlantDown"] = 0
	}
}
v_u_5.Frostspike = v368
local v369 = {
	["PlantName"] = "Torchflare",
	["PlantData"] = {
		["GrowTickTime"] = NumberRange.new(4, 4.35),
		["GrowFruitTime"] = NumberRange.new(110, 130),
		["GrowRate"] = 0.01225,
		["PlantDown"] = 0
	},
	["FruitData"] = {
		["GrowTickTime"] = NumberRange.new(3.9, 4.15),
		["GrowRate"] = 0.0175,
		["PlantDown"] = 0
	}
}
v_u_5.Torchflare = v369
local v370 = {
	["PlantName"] = "Gooseberry",
	["PlantData"] = {
		["GrowTickTime"] = NumberRange.new(0.1, 0.2),
		["GrowFruitTime"] = NumberRange.new(0.1, 0.2),
		["GrowRate"] = 0.61,
		["PlantDown"] = 0
	},
	["FruitData"] = {
		["GrowTickTime"] = NumberRange.new(0.2, 0.3),
		["GrowRate"] = 0.525,
		["PlantDown"] = 0
	}
}
v_u_5.Gooseberry = v370
local v371 = {
	["PlantName"] = "Speargrass",
	["PlantData"] = {
		["GrowTickTime"] = NumberRange.new(17.8, 18.25),
		["GrowFruitTime"] = NumberRange.new(60, 90),
		["GrowRate"] = 0.02,
		["PlantDown"] = 0
	},
	["FruitData"] = {
		["GrowTickTime"] = NumberRange.new(3.3, 3.5),
		["GrowRate"] = 0.0285,
		["PlantDown"] = 0
	}
}
v_u_5.Speargrass = v371
local v372 = {
	["PlantName"] = "Fall Berry",
	["PlantData"] = {
		["GrowTickTime"] = NumberRange.new(7.35, 7.75),
		["GrowFruitTime"] = NumberRange.new(45, 75),
		["GrowRate"] = 0.085,
		["PlantDown"] = 0
	},
	["FruitData"] = {
		["GrowTickTime"] = NumberRange.new(3.5, 4),
		["GrowRate"] = 0.075,
		["PlantDown"] = 0
	}
}
v_u_5["Fall Berry"] = v372
local v373 = {
	["PlantName"] = "Firewell",
	["PlantData"] = {
		["GrowTickTime"] = NumberRange.new(7, 7.4),
		["GrowFruitTime"] = NumberRange.new(60, 90),
		["GrowRate"] = 0.0015,
		["PlantDown"] = 0
	},
	["FruitData"] = {
		["GrowTickTime"] = NumberRange.new(8, 8.4),
		["GrowRate"] = 0.0085,
		["PlantDown"] = 0
	}
}
v_u_5.Firewell = v373
local v374 = {
	["PlantName"] = "Auburn Pine",
	["PlantData"] = {
		["GrowTickTime"] = NumberRange.new(8.65, 9),
		["GrowFruitTime"] = NumberRange.new(60, 90),
		["GrowRate"] = 0.01,
		["PlantDown"] = 0
	},
	["FruitData"] = {
		["GrowTickTime"] = NumberRange.new(3.35, 3.75),
		["GrowRate"] = 0.00485,
		["PlantDown"] = 0
	}
}
v_u_5["Auburn Pine"] = v374
local v375 = {
	["PlantName"] = "Autumn Shroom",
	["PlantData"] = {
		["GrowTickTime"] = NumberRange.new(9.5, 9.85),
		["GrowFruitTime"] = NumberRange.new(60, 80),
		["GrowRate"] = 0.0585,
		["PlantDown"] = 0
	},
	["FruitData"] = {
		["GrowTickTime"] = NumberRange.new(1.75, 2),
		["GrowRate"] = 0.065,
		["PlantDown"] = 0
	}
}
v_u_5["Autumn Shroom"] = v375
local v376 = {
	["PlantName"] = "Black Magic Ears",
	["PlantData"] = {
		["GrowTickTime"] = NumberRange.new(20, 35),
		["GrowFruitTime"] = NumberRange.new(150, 180),
		["GrowRate"] = 0.01,
		["PlantDown"] = 0
	},
	["FruitData"] = {
		["GrowTickTime"] = NumberRange.new(15, 20),
		["GrowRate"] = 0.01,
		["PlantDown"] = 0
	}
}
v_u_5["Black Magic Ears"] = v376
local v377 = {
	["PlantName"] = "Helenium",
	["PlantData"] = {
		["GrowTickTime"] = NumberRange.new(0.2, 0.35),
		["GrowFruitTime"] = NumberRange.new(0.15, 0.18),
		["GrowRate"] = 0.41,
		["PlantDown"] = 0
	},
	["FruitData"] = {
		["GrowTickTime"] = NumberRange.new(0.125, 0.13),
		["GrowRate"] = 0.11,
		["PlantDown"] = 0.5
	}
}
v_u_5.Helenium = v377
local v378 = {
	["PlantName"] = "Jelpod",
	["PlantData"] = {
		["GrowTickTime"] = NumberRange.new(0.06, 0.12),
		["GrowFruitTime"] = NumberRange.new(0.082, 0.106),
		["GrowRate"] = 0.1,
		["PlantDown"] = 0
	},
	["FruitData"] = {
		["GrowTickTime"] = NumberRange.new(0.03, 0.05),
		["GrowRate"] = 0.09,
		["PlantDown"] = 0
	}
}
v_u_5.Jelpod = v378
local v379 = {
	["PlantName"] = "Filbert Nut",
	["PlantData"] = {
		["GrowTickTime"] = NumberRange.new(0.06, 0.12),
		["GrowFruitTime"] = NumberRange.new(0.082, 0.106),
		["GrowRate"] = 0.1,
		["PlantDown"] = 0
	},
	["FruitData"] = {
		["GrowTickTime"] = NumberRange.new(0.01, 0.02),
		["GrowRate"] = 0.29,
		["PlantDown"] = 0
	}
}
v_u_5["Filbert Nut"] = v379
local v380 = {
	["PlantName"] = "Wild Berry",
	["PlantData"] = {
		["GrowTickTime"] = NumberRange.new(7, 8),
		["GrowFruitTime"] = NumberRange.new(120, 160),
		["GrowRate"] = 0.01,
		["PlantDown"] = -1.75
	},
	["FruitData"] = {
		["GrowTickTime"] = NumberRange.new(2.5, 3),
		["GrowRate"] = 0.01,
		["PlantDown"] = 0
	}
}
v_u_5["Wild Berry"] = v380
local v381 = {
	["PlantName"] = "Turkish Hazel",
	["PlantData"] = {
		["GrowTickTime"] = NumberRange.new(0.07, 0.08),
		["GrowFruitTime"] = NumberRange.new(0.012, 0.016),
		["GrowRate"] = 0.01,
		["PlantDown"] = 0
	},
	["FruitData"] = {
		["GrowTickTime"] = NumberRange.new(0.025, 0.03),
		["GrowRate"] = 0.01,
		["PlantDown"] = 0
	}
}
v_u_5["Turkish Hazel"] = v381
local v382 = {
	["PlantName"] = "Cherry",
	["PlantData"] = {
		["GrowTickTime"] = NumberRange.new(9.65, 10),
		["GrowFruitTime"] = NumberRange.new(200, 240),
		["GrowRate"] = 0.015,
		["PlantDown"] = 0
	},
	["FruitData"] = {
		["GrowTickTime"] = NumberRange.new(8, 8.35),
		["GrowRate"] = 0.01,
		["PlantDown"] = 0
	}
}
v_u_5.Cherry = v382
local v383 = {
	["PlantName"] = "Witch Cap",
	["PlantData"] = {
		["GrowTickTime"] = NumberRange.new(16, 24),
		["GrowFruitTime"] = NumberRange.new(200, 240),
		["GrowRate"] = 0.015,
		["PlantDown"] = 0
	},
	["FruitData"] = {
		["GrowTickTime"] = NumberRange.new(4, 6),
		["GrowRate"] = 0.01,
		["PlantDown"] = 0
	}
}
v_u_5["Witch Cap"] = v383
local v384 = {
	["PlantName"] = "Skull Flower",
	["PlantData"] = {
		["GrowTickTime"] = NumberRange.new(0.07, 0.08),
		["GrowFruitTime"] = NumberRange.new(0.012, 0.016),
		["GrowRate"] = 0.41,
		["PlantDown"] = 0
	},
	["FruitData"] = {
		["GrowTickTime"] = NumberRange.new(0.025, 0.03),
		["GrowRate"] = 0.41,
		["PlantDown"] = 0
	}
}
v_u_5["Skull Flower"] = v384
local v385 = {
	["PlantName"] = "Mind Root",
	["PlantData"] = {
		["GrowTickTime"] = NumberRange.new(0.07, 0.08),
		["GrowFruitTime"] = NumberRange.new(0.012, 0.016),
		["GrowRate"] = 0.05,
		["PlantDown"] = 0
	},
	["FruitData"] = {
		["GrowTickTime"] = NumberRange.new(0.025, 0.03),
		["GrowRate"] = 0.05,
		["PlantDown"] = 0
	}
}
v_u_5["Mind Root"] = v385
local v386 = {
	["PlantName"] = "Vampbloom",
	["PlantData"] = {
		["GrowTickTime"] = NumberRange.new(6, 7),
		["GrowFruitTime"] = NumberRange.new(120, 180),
		["GrowRate"] = 0.05,
		["PlantDown"] = 0
	},
	["FruitData"] = {
		["GrowTickTime"] = NumberRange.new(6, 7),
		["GrowRate"] = 0.05,
		["PlantDown"] = 0
	}
}
v_u_5.Vampbloom = v386
local v387 = {
	["PlantName"] = "Sugarcane",
	["PlantData"] = {
		["GrowTickTime"] = NumberRange.new(6, 7),
		["GrowFruitTime"] = NumberRange.new(120, 180),
		["GrowRate"] = 0.05,
		["PlantDown"] = 0
	},
	["FruitData"] = {
		["GrowTickTime"] = NumberRange.new(6, 7),
		["GrowRate"] = 0.05,
		["PlantDown"] = 0
	}
}
v_u_5.Sugarcane = v387
local v388 = {
	["PlantName"] = "Queen Fruit",
	["PlantData"] = {
		["GrowTickTime"] = NumberRange.new(6, 7),
		["GrowFruitTime"] = NumberRange.new(120, 180),
		["GrowRate"] = 0.05,
		["PlantDown"] = 0
	},
	["FruitData"] = {
		["GrowTickTime"] = NumberRange.new(6, 7),
		["GrowRate"] = 0.05,
		["PlantDown"] = 0
	}
}
v_u_5["Queen Fruit"] = v388
local v389 = {
	["PlantName"] = "Crassula Umbrella",
	["PlantData"] = {
		["GrowTickTime"] = NumberRange.new(6, 7),
		["GrowFruitTime"] = NumberRange.new(120, 180),
		["GrowRate"] = 0.05,
		["PlantDown"] = 0
	},
	["FruitData"] = {
		["GrowTickTime"] = NumberRange.new(6, 7),
		["GrowRate"] = 0.05,
		["PlantDown"] = 0
	}
}
v_u_5["Crassula Umbrella"] = v389
local v390 = {
	["PlantName"] = "Faestar",
	["PlantData"] = {
		["GrowTickTime"] = NumberRange.new(10, 12),
		["GrowFruitTime"] = NumberRange.new(60, 80),
		["GrowRate"] = 0.1,
		["PlantDown"] = 0
	},
	["FruitData"] = {
		["GrowTickTime"] = NumberRange.new(3.6, 6),
		["GrowRate"] = 0.05,
		["PlantDown"] = 0
	}
}
v_u_5.Faestar = v390
local v391 = {
	["PlantName"] = "Madras Thorn",
	["PlantData"] = {
		["GrowTickTime"] = NumberRange.new(10, 12),
		["GrowFruitTime"] = NumberRange.new(60, 80),
		["GrowRate"] = 0.1,
		["PlantDown"] = 0
	},
	["FruitData"] = {
		["GrowTickTime"] = NumberRange.new(3.6, 6),
		["GrowRate"] = 0.05,
		["PlantDown"] = 0
	}
}
v_u_5["Madras Thorn"] = v391
local v392 = {
	["PlantName"] = "Aqua Lily",
	["PlantData"] = {
		["GrowTickTime"] = NumberRange.new(10, 12),
		["GrowFruitTime"] = NumberRange.new(60, 80),
		["GrowRate"] = 0.1,
		["PlantDown"] = 0
	},
	["FruitData"] = {
		["GrowTickTime"] = NumberRange.new(3.6, 6),
		["GrowRate"] = 0.05,
		["PlantDown"] = 0
	}
}
v_u_5["Aqua Lily"] = v392
local v393 = {
	["PlantName"] = "Akebi",
	["PlantData"] = {
		["GrowTickTime"] = NumberRange.new(10, 12),
		["GrowFruitTime"] = NumberRange.new(60, 80),
		["GrowRate"] = 0.1,
		["PlantDown"] = 0
	},
	["FruitData"] = {
		["GrowTickTime"] = NumberRange.new(3.6, 6),
		["GrowRate"] = 0.05,
		["PlantDown"] = 0
	}
}
v_u_5.Akebi = v393
local v394 = {
	["PlantName"] = "Observee",
	["PlantData"] = {
		["GrowTickTime"] = NumberRange.new(10, 12),
		["GrowFruitTime"] = NumberRange.new(60, 80),
		["GrowRate"] = 0.1,
		["PlantDown"] = 0
	},
	["FruitData"] = {
		["GrowTickTime"] = NumberRange.new(3.6, 6),
		["GrowRate"] = 0.05,
		["PlantDown"] = 0
	}
}
v_u_5.Observee = v394
local v395 = {
	["PlantName"] = "Crown Pumpkin",
	["PlantData"] = {
		["GrowTickTime"] = NumberRange.new(10, 12),
		["GrowFruitTime"] = NumberRange.new(60, 80),
		["GrowRate"] = 0.1,
		["PlantDown"] = 0
	},
	["FruitData"] = {
		["GrowTickTime"] = NumberRange.new(3.6, 6),
		["GrowRate"] = 0.05,
		["PlantDown"] = 0
	}
}
v_u_5["Crown Pumpkin"] = v395
local v396 = {
	["PlantName"] = "Cyberflare",
	["PlantData"] = {
		["GrowTickTime"] = NumberRange.new(10, 12),
		["GrowFruitTime"] = NumberRange.new(60, 80),
		["GrowRate"] = 0.1,
		["PlantDown"] = 0
	},
	["FruitData"] = {
		["GrowTickTime"] = NumberRange.new(3.6, 6),
		["GrowRate"] = 0.05,
		["PlantDown"] = 0
	}
}
v_u_5.Cyberflare = v396
local v397 = {
	["PlantName"] = "Rambutan",
	["PlantData"] = {
		["GrowTickTime"] = NumberRange.new(10, 12),
		["GrowFruitTime"] = NumberRange.new(60, 80),
		["GrowRate"] = 0.1,
		["PlantDown"] = 0
	},
	["FruitData"] = {
		["GrowTickTime"] = NumberRange.new(3.6, 6),
		["GrowRate"] = 0.05,
		["PlantDown"] = 0
	}
}
v_u_5.Rambutan = v397
local v398 = {
	["PlantName"] = "Strange Man\'s Wheat",
	["PlantData"] = {
		["GrowTickTime"] = NumberRange.new(10, 12),
		["GrowFruitTime"] = NumberRange.new(60, 80),
		["GrowRate"] = 0.1,
		["PlantDown"] = 0
	},
	["FruitData"] = {
		["GrowTickTime"] = NumberRange.new(3.6, 6),
		["GrowRate"] = 0.05,
		["PlantDown"] = 0
	}
}
v_u_5["Strange Man\'s Wheat"] = v398
local v399 = {
	["PlantName"] = "Walnut",
	["PlantData"] = {
		["GrowTickTime"] = NumberRange.new(10, 12),
		["GrowFruitTime"] = NumberRange.new(60, 80),
		["GrowRate"] = 0.1,
		["PlantDown"] = 0
	},
	["FruitData"] = {
		["GrowTickTime"] = NumberRange.new(3.6, 6),
		["GrowRate"] = 0.05,
		["PlantDown"] = 0
	}
}
v_u_5.Walnut = v399
local v400 = {
	["PlantName"] = "Leifo Fruit",
	["PlantData"] = {
		["GrowTickTime"] = NumberRange.new(10, 12),
		["GrowFruitTime"] = NumberRange.new(60, 80),
		["GrowRate"] = 0.1,
		["PlantDown"] = 0
	},
	["FruitData"] = {
		["GrowTickTime"] = NumberRange.new(3.6, 6),
		["GrowRate"] = 0.05,
		["PlantDown"] = 0
	}
}
v_u_5["Leifo Fruit"] = v400
local v401 = {
	["PlantName"] = "Festive Bamboo",
	["PlantData"] = {
		["GrowTickTime"] = NumberRange.new(10, 12),
		["GrowFruitTime"] = NumberRange.new(60, 80),
		["GrowRate"] = 0.1,
		["PlantDown"] = 0
	},
	["FruitData"] = {
		["GrowTickTime"] = NumberRange.new(3.6, 6),
		["GrowRate"] = 0.05,
		["PlantDown"] = 0
	}
}
v_u_5["Festive Bamboo"] = v401
local v402 = {
	["PlantName"] = "Iciclesco",
	["PlantData"] = {
		["GrowTickTime"] = NumberRange.new(10, 12),
		["GrowFruitTime"] = NumberRange.new(60, 80),
		["GrowRate"] = 0.1,
		["PlantDown"] = 0
	},
	["FruitData"] = {
		["GrowTickTime"] = NumberRange.new(3.6, 6),
		["GrowRate"] = 0.05,
		["PlantDown"] = 0
	}
}
v_u_5.Iciclesco = v402
local v403 = {
	["PlantName"] = "Icestalite",
	["PlantData"] = {
		["GrowTickTime"] = NumberRange.new(10, 12),
		["GrowFruitTime"] = NumberRange.new(60, 80),
		["GrowRate"] = 0.1,
		["PlantDown"] = 0
	},
	["FruitData"] = {
		["GrowTickTime"] = NumberRange.new(3.6, 6),
		["GrowRate"] = 0.05,
		["PlantDown"] = 0
	}
}
v_u_5.Icestalite = v403
local v404 = {
	["PlantName"] = "Frost Bush",
	["PlantData"] = {
		["GrowTickTime"] = NumberRange.new(10, 12),
		["GrowFruitTime"] = NumberRange.new(60, 80),
		["GrowRate"] = 0.1,
		["PlantDown"] = 0
	},
	["FruitData"] = {
		["GrowTickTime"] = NumberRange.new(3.6, 6),
		["GrowRate"] = 0.05,
		["PlantDown"] = 0
	}
}
v_u_5["Frost Bush"] = v404
local v405 = {
	["PlantName"] = "Grand Cucumber",
	["PlantData"] = {
		["GrowTickTime"] = NumberRange.new(10, 12),
		["GrowFruitTime"] = NumberRange.new(60, 80),
		["GrowRate"] = 0.1,
		["PlantDown"] = 0.333
	},
	["FruitData"] = {
		["GrowTickTime"] = NumberRange.new(3.6, 6),
		["GrowRate"] = 0.05,
		["PlantDown"] = 0
	}
}
v_u_5["Grand Cucumber"] = v405
local v406 = {
	["PlantName"] = "Mauve Fruit",
	["PlantData"] = {
		["GrowTickTime"] = NumberRange.new(10, 12),
		["GrowFruitTime"] = NumberRange.new(60, 80),
		["GrowRate"] = 0.1,
		["PlantDown"] = 0.333
	},
	["FruitData"] = {
		["GrowTickTime"] = NumberRange.new(3.6, 6),
		["GrowRate"] = 0.05,
		["PlantDown"] = 0
	}
}
v_u_5["Mauve Fruit"] = v406
local v407 = {
	["PlantName"] = "Archling",
	["PlantData"] = {
		["GrowTickTime"] = NumberRange.new(10, 12),
		["GrowFruitTime"] = NumberRange.new(60, 80),
		["GrowRate"] = 0.1,
		["PlantDown"] = 0
	},
	["FruitData"] = {
		["GrowTickTime"] = NumberRange.new(3.6, 6),
		["GrowRate"] = 0.05,
		["PlantDown"] = 0
	}
}
v_u_5.Archling = v407
local v408 = {
	["PlantName"] = "Cold Snap Suckle",
	["PlantData"] = {
		["GrowTickTime"] = NumberRange.new(10, 12),
		["GrowFruitTime"] = NumberRange.new(60, 80),
		["GrowRate"] = 0.1,
		["PlantDown"] = 0
	},
	["FruitData"] = {
		["GrowTickTime"] = NumberRange.new(3.6, 6),
		["GrowRate"] = 0.05,
		["PlantDown"] = 0
	}
}
v_u_5["Cold Snap Suckle"] = v408
local v409 = {
	["PlantName"] = "Monster Plum",
	["PlantData"] = {
		["GrowTickTime"] = NumberRange.new(10, 12),
		["GrowFruitTime"] = NumberRange.new(60, 80),
		["GrowRate"] = 0.1,
		["PlantDown"] = 0
	},
	["FruitData"] = {
		["GrowTickTime"] = NumberRange.new(3.6, 6),
		["GrowRate"] = 0.05,
		["PlantDown"] = 0
	}
}
v_u_5["Monster Plum"] = v409
local v410 = {
	["PlantName"] = "Gift Root",
	["PlantData"] = {
		["GrowTickTime"] = NumberRange.new(10, 12),
		["GrowFruitTime"] = NumberRange.new(60, 80),
		["GrowRate"] = 0.1,
		["PlantDown"] = 0
	},
	["FruitData"] = {
		["GrowTickTime"] = NumberRange.new(3.6, 6),
		["GrowRate"] = 0.05,
		["PlantDown"] = 0
	}
}
v_u_5["Gift Root"] = v410
local v411 = {
	["PlantName"] = "Mammoth Mistletoe",
	["PlantData"] = {
		["GrowTickTime"] = NumberRange.new(10, 12),
		["GrowFruitTime"] = NumberRange.new(60, 80),
		["GrowRate"] = 0.1,
		["PlantDown"] = 0
	},
	["FruitData"] = {
		["GrowTickTime"] = NumberRange.new(3.6, 6),
		["GrowRate"] = 0.05,
		["PlantDown"] = 0
	}
}
v_u_5["Mammoth Mistletoe"] = v411
local v412 = {
	["PlantName"] = "Frostline Flake",
	["PlantData"] = {
		["GrowTickTime"] = NumberRange.new(10, 12),
		["GrowFruitTime"] = NumberRange.new(60, 80),
		["GrowRate"] = 0.1,
		["PlantDown"] = 0
	},
	["FruitData"] = {
		["GrowTickTime"] = NumberRange.new(3.6, 6),
		["GrowRate"] = 0.05,
		["PlantDown"] = 0
	}
}
v_u_5["Frostline Flake"] = v412
local v413 = {
	["PlantName"] = "Wild Frond",
	["PlantData"] = {
		["GrowTickTime"] = NumberRange.new(10, 12),
		["GrowFruitTime"] = NumberRange.new(60, 80),
		["GrowRate"] = 0.1,
		["PlantDown"] = 0.333
	},
	["FruitData"] = {
		["GrowTickTime"] = NumberRange.new(3.6, 6),
		["GrowRate"] = 0.05,
		["PlantDown"] = 0
	}
}
v_u_5["Wild Frond"] = v413
local v414 = {
	["PlantName"] = "Peach Sun",
	["PlantData"] = {
		["GrowTickTime"] = NumberRange.new(4, 6),
		["GrowFruitTime"] = NumberRange.new(110, 130),
		["GrowRate"] = 0.05,
		["PlantDown"] = 2
	},
	["FruitData"] = {
		["GrowTickTime"] = NumberRange.new(0.8, 1.2),
		["GrowRate"] = 0.025,
		["PlantDown"] = -0.25
	}
}
v_u_5["Peach Sun"] = v414
local v415 = {
	["PlantName"] = "Wintercreep",
	["PlantData"] = {
		["GrowTickTime"] = NumberRange.new(4, 6),
		["GrowFruitTime"] = NumberRange.new(110, 130),
		["GrowRate"] = 0.05,
		["PlantDown"] = 0
	},
	["FruitData"] = {
		["GrowTickTime"] = NumberRange.new(0.8, 1.2),
		["GrowRate"] = 0.025,
		["PlantDown"] = 0
	}
}
v_u_5.Wintercreep = v415
local v416 = {
	["PlantName"] = "Milk Table",
	["PlantData"] = {
		["GrowTickTime"] = NumberRange.new(4, 6),
		["GrowFruitTime"] = NumberRange.new(110, 130),
		["GrowRate"] = 0.05,
		["PlantDown"] = 0
	},
	["FruitData"] = {
		["GrowTickTime"] = NumberRange.new(0.8, 1.2),
		["GrowRate"] = 0.025,
		["PlantDown"] = 0
	}
}
v_u_5["Milk Table"] = v416
local v417 = {
	["PlantName"] = "Ornament Vine",
	["PlantData"] = {
		["GrowTickTime"] = NumberRange.new(4, 6),
		["GrowFruitTime"] = NumberRange.new(110, 130),
		["GrowRate"] = 0.05,
		["PlantDown"] = 0
	},
	["FruitData"] = {
		["GrowTickTime"] = NumberRange.new(0.8, 1.2),
		["GrowRate"] = 0.025,
		["PlantDown"] = 0
	}
}
v_u_5["Ornament Vine"] = v417
local v418 = {
	["PlantName"] = "Tinsel",
	["PlantData"] = {
		["GrowTickTime"] = NumberRange.new(4, 6),
		["GrowFruitTime"] = NumberRange.new(110, 130),
		["GrowRate"] = 0.05,
		["PlantDown"] = 0
	},
	["FruitData"] = {
		["GrowTickTime"] = NumberRange.new(0.8, 1.2),
		["GrowRate"] = 0.025,
		["PlantDown"] = 0
	}
}
v_u_5.Tinsel = v418
local v419 = {
	["PlantName"] = "Wreath Span",
	["PlantData"] = {
		["GrowTickTime"] = NumberRange.new(4, 6),
		["GrowFruitTime"] = NumberRange.new(110, 130),
		["GrowRate"] = 0.05,
		["PlantDown"] = 0
	},
	["FruitData"] = {
		["GrowTickTime"] = NumberRange.new(0.8, 1.2),
		["GrowRate"] = 0.025,
		["PlantDown"] = 0
	}
}
v_u_5["Wreath Span"] = v419
local v420 = {
	["PlantName"] = "New Years Tinsel",
	["PlantData"] = {
		["GrowTickTime"] = NumberRange.new(4, 6),
		["GrowFruitTime"] = NumberRange.new(110, 130),
		["GrowRate"] = 0.05,
		["PlantDown"] = 0
	},
	["FruitData"] = {
		["GrowTickTime"] = NumberRange.new(0.8, 1.2),
		["GrowRate"] = 0.025,
		["PlantDown"] = 0
	}
}
v_u_5["New Years Tinsel"] = v420
local v421 = {
	["PlantName"] = "Taffy Tree",
	["PlantData"] = {
		["GrowTickTime"] = NumberRange.new(4, 6),
		["GrowFruitTime"] = NumberRange.new(110, 130),
		["GrowRate"] = 0.05,
		["PlantDown"] = 0
	},
	["FruitData"] = {
		["GrowTickTime"] = NumberRange.new(0.8, 1.2),
		["GrowRate"] = 0.025,
		["PlantDown"] = 0
	}
}
v_u_5["Taffy Tree"] = v421
local v422 = {
	["PlantName"] = "Star Palm",
	["PlantData"] = {
		["GrowTickTime"] = NumberRange.new(4, 6),
		["GrowFruitTime"] = NumberRange.new(110, 130),
		["GrowRate"] = 0.05,
		["PlantDown"] = 0
	},
	["FruitData"] = {
		["GrowTickTime"] = NumberRange.new(0.8, 1.2),
		["GrowRate"] = 0.025,
		["PlantDown"] = 0
	}
}
v_u_5["Star Palm"] = v422
local v423 = {
	["PlantName"] = "Heart Gem",
	["PlantData"] = {
		["GrowTickTime"] = NumberRange.new(4, 6),
		["GrowFruitTime"] = NumberRange.new(110, 130),
		["GrowRate"] = 0.05,
		["PlantDown"] = 0
	},
	["FruitData"] = {
		["GrowTickTime"] = NumberRange.new(0.8, 1.2),
		["GrowRate"] = 0.025,
		["PlantDown"] = 0
	}
}
v_u_5["Heart Gem"] = v423
local v424 = {
	["PlantName"] = "Witches Hair",
	["PlantData"] = {
		["GrowTickTime"] = NumberRange.new(4, 6),
		["GrowFruitTime"] = NumberRange.new(110, 130),
		["GrowRate"] = 0.05,
		["PlantDown"] = 0
	},
	["FruitData"] = {
		["GrowTickTime"] = NumberRange.new(0.8, 1.2),
		["GrowRate"] = 0.025,
		["PlantDown"] = 0
	}
}
v_u_5["Witches Hair"] = v424
local v425 = {
	["PlantName"] = "Luminova",
	["PlantData"] = {
		["GrowTickTime"] = NumberRange.new(4, 6),
		["GrowFruitTime"] = NumberRange.new(110, 130),
		["GrowRate"] = 0.05,
		["PlantDown"] = 0
	},
	["FruitData"] = {
		["GrowTickTime"] = NumberRange.new(0.8, 1.2),
		["GrowRate"] = 0.025,
		["PlantDown"] = 0
	}
}
v_u_5.Luminova = v425
local v426 = {
	["PlantName"] = "Jungle Kiwano",
	["PlantData"] = {
		["GrowTickTime"] = NumberRange.new(4, 6),
		["GrowFruitTime"] = NumberRange.new(110, 130),
		["GrowRate"] = 0.05,
		["PlantDown"] = 0
	},
	["FruitData"] = {
		["GrowTickTime"] = NumberRange.new(0.8, 1.2),
		["GrowRate"] = 0.025,
		["PlantDown"] = 0
	}
}
v_u_5["Jungle Kiwano"] = v426
local v427 = {
	["PlantName"] = "Birds Nest",
	["PlantData"] = {
		["GrowTickTime"] = NumberRange.new(4, 6),
		["GrowFruitTime"] = NumberRange.new(110, 130),
		["GrowRate"] = 0.05,
		["PlantDown"] = 0
	},
	["FruitData"] = {
		["GrowTickTime"] = NumberRange.new(0.8, 1.2),
		["GrowRate"] = 0.025,
		["PlantDown"] = 0
	}
}
v_u_5["Birds Nest"] = v427
local v428 = {
	["PlantName"] = "Candy Carrot",
	["PlantData"] = {
		["GrowTickTime"] = NumberRange.new(0.8, 1.2),
		["GrowRate"] = 0.4,
		["PlantDown"] = 0
	}
}
v_u_5["Candy Carrot"] = v428
local v429 = {
	["PlantName"] = "Chocolate Berry",
	["PlantData"] = {
		["GrowTickTime"] = NumberRange.new(4, 6),
		["GrowFruitTime"] = NumberRange.new(40, 60),
		["GrowRate"] = 0.028,
		["PlantDown"] = 0
	},
	["FruitData"] = {
		["GrowTickTime"] = NumberRange.new(0.8, 1.2),
		["GrowRate"] = 0.05,
		["PlantDown"] = 0
	}
}
v_u_5["Chocolate Berry"] = v429
local v430 = {
	["PlantName"] = "Gumball",
	["PlantData"] = {
		["GrowTickTime"] = NumberRange.new(1.6, 2.4),
		["GrowFruitTime"] = NumberRange.new(40, 60),
		["GrowRate"] = 0.03,
		["PlantDown"] = 0
	},
	["FruitData"] = {
		["GrowTickTime"] = NumberRange.new(0.8, 1.2),
		["GrowRate"] = 0.05,
		["PlantDown"] = 0
	}
}
v_u_5.Gumball = v430
local v431 = {
	["PlantName"] = "Liquorice",
	["PlantData"] = {
		["GrowTickTime"] = NumberRange.new(1.5, 3),
		["GrowRate"] = 0.1875,
		["PlantDown"] = 0
	}
}
v_u_5.Liquorice = v431
local v432 = {
	["PlantName"] = "Sugar Melon",
	["PlantData"] = {
		["GrowTickTime"] = NumberRange.new(6, 8),
		["GrowFruitTime"] = NumberRange.new(60, 80),
		["GrowRate"] = 0.05,
		["PlantDown"] = 0
	},
	["FruitData"] = {
		["GrowTickTime"] = NumberRange.new(0.8, 1.2),
		["GrowRate"] = 0.05,
		["PlantDown"] = 0
	}
}
v_u_5["Sugar Melon"] = v432
local v433 = {
	["PlantName"] = "Chocolate Coconut",
	["PlantData"] = {
		["GrowTickTime"] = NumberRange.new(8, 12),
		["GrowFruitTime"] = NumberRange.new(70, 90),
		["GrowRate"] = 0.15,
		["PlantDown"] = 0
	},
	["FruitData"] = {
		["GrowTickTime"] = NumberRange.new(1, 2),
		["GrowRate"] = 0.05,
		["PlantDown"] = 0
	}
}
v_u_5["Chocolate Coconut"] = v433
local v434 = {
	["PlantName"] = "Gummy Cactus",
	["PlantData"] = {
		["GrowTickTime"] = NumberRange.new(8, 12),
		["GrowFruitTime"] = NumberRange.new(80, 100),
		["GrowRate"] = 0.025,
		["PlantDown"] = 0
	},
	["FruitData"] = {
		["GrowTickTime"] = NumberRange.new(0.8, 1.2),
		["GrowRate"] = 0.05,
		["PlantDown"] = 0
	}
}
v_u_5["Gummy Cactus"] = v434
local v435 = {
	["PlantName"] = "Egg Melon",
	["PlantData"] = {
		["GrowTickTime"] = NumberRange.new(20, 24),
		["GrowFruitTime"] = NumberRange.new(90, 120),
		["GrowRate"] = 0.015,
		["PlantDown"] = 0
	},
	["FruitData"] = {
		["GrowTickTime"] = NumberRange.new(3, 6),
		["GrowRate"] = 0.05,
		["PlantDown"] = 0
	}
}
v_u_5["Egg Melon"] = v435
local v436 = {
	["PlantName"] = "Sour Lemon",
	["PlantData"] = {
		["GrowTickTime"] = NumberRange.new(16, 20),
		["GrowFruitTime"] = NumberRange.new(100, 120),
		["GrowRate"] = 0.04,
		["PlantDown"] = 0
	},
	["FruitData"] = {
		["GrowTickTime"] = NumberRange.new(1, 2),
		["GrowRate"] = 0.05,
		["PlantDown"] = 0
	}
}
v_u_5["Sour Lemon"] = v436
local v437 = {
	["PlantName"] = "Eggfruit",
	["PlantData"] = {
		["GrowTickTime"] = NumberRange.new(24, 28),
		["GrowFruitTime"] = NumberRange.new(120, 160),
		["GrowRate"] = 0.03,
		["PlantDown"] = 0
	},
	["FruitData"] = {
		["GrowTickTime"] = NumberRange.new(1, 2),
		["GrowRate"] = 0.05,
		["PlantDown"] = 0
	}
}
v_u_5.Eggfruit = v437
local v438 = {
	["PlantName"] = "Easter Sprout",
	["PlantData"] = {
		["GrowTickTime"] = NumberRange.new(12, 16),
		["GrowFruitTime"] = NumberRange.new(167, 167),
		["GrowRate"] = 0.0167,
		["PlantDown"] = 0
	},
	["FruitData"] = {
		["GrowTickTime"] = NumberRange.new(16, 17),
		["GrowRate"] = 0.025,
		["PlantDown"] = 0
	}
}
v_u_5["Easter Sprout"] = v438
local v439 = {
	["PlantName"] = "Easter Candy Carrot",
	["PlantData"] = {
		["GrowTickTime"] = NumberRange.new(0.8, 1.2),
		["GrowRate"] = 0.4,
		["PlantDown"] = 0
	}
}
v_u_5["Easter Candy Carrot"] = v439
local v440 = {
	["PlantName"] = "Easter Chocolate Berry",
	["PlantData"] = {
		["GrowTickTime"] = NumberRange.new(4, 6),
		["GrowFruitTime"] = NumberRange.new(20, 30),
		["GrowRate"] = 0.04,
		["PlantDown"] = 0
	},
	["FruitData"] = {
		["GrowTickTime"] = NumberRange.new(0.8, 1.2),
		["GrowRate"] = 0.05,
		["PlantDown"] = 0
	}
}
v_u_5["Easter Chocolate Berry"] = v440
local v441 = {
	["PlantName"] = "Easter Gumball",
	["PlantData"] = {
		["GrowTickTime"] = NumberRange.new(1.6, 2.4),
		["GrowFruitTime"] = NumberRange.new(40, 60),
		["GrowRate"] = 0.03,
		["PlantDown"] = 0
	},
	["FruitData"] = {
		["GrowTickTime"] = NumberRange.new(0.8, 1.2),
		["GrowRate"] = 0.05,
		["PlantDown"] = 0
	}
}
v_u_5["Easter Gumball"] = v441
local v442 = {
	["PlantName"] = "Easter Liquorice",
	["PlantData"] = {
		["GrowTickTime"] = NumberRange.new(1.5, 3),
		["GrowRate"] = 0.1875,
		["PlantDown"] = 0
	}
}
v_u_5["Easter Liquorice"] = v442
local v443 = {
	["PlantName"] = "Easter Sugar Melon",
	["PlantData"] = {
		["GrowTickTime"] = NumberRange.new(6, 8),
		["GrowFruitTime"] = NumberRange.new(60, 80),
		["GrowRate"] = 0.05,
		["PlantDown"] = 0
	},
	["FruitData"] = {
		["GrowTickTime"] = NumberRange.new(0.8, 1.2),
		["GrowRate"] = 0.05,
		["PlantDown"] = 0
	}
}
v_u_5["Easter Sugar Melon"] = v443
local v444 = {
	["PlantName"] = "Chocolate Coconut",
	["PlantData"] = {
		["GrowTickTime"] = NumberRange.new(8, 12),
		["GrowFruitTime"] = NumberRange.new(70, 90),
		["GrowRate"] = 0.15,
		["PlantDown"] = 0
	},
	["FruitData"] = {
		["GrowTickTime"] = NumberRange.new(1, 2),
		["GrowRate"] = 0.05,
		["PlantDown"] = 0
	}
}
v_u_5["Easter Chocolate Coconut"] = v444
local v445 = {
	["PlantName"] = "Easter Gummy Cactus",
	["PlantData"] = {
		["GrowTickTime"] = NumberRange.new(8, 12),
		["GrowFruitTime"] = NumberRange.new(80, 100),
		["GrowRate"] = 0.025,
		["PlantDown"] = 0
	},
	["FruitData"] = {
		["GrowTickTime"] = NumberRange.new(0.8, 1.2),
		["GrowRate"] = 0.05,
		["PlantDown"] = 0
	}
}
v_u_5["Easter Gummy Cactus"] = v445
local v446 = {
	["PlantName"] = "Easter Egg Melon",
	["PlantData"] = {
		["GrowTickTime"] = NumberRange.new(20, 24),
		["GrowFruitTime"] = NumberRange.new(90, 120),
		["GrowRate"] = 0.015,
		["PlantDown"] = 0
	},
	["FruitData"] = {
		["GrowTickTime"] = NumberRange.new(3, 6),
		["GrowRate"] = 0.05,
		["PlantDown"] = 0
	}
}
v_u_5["Easter Egg Melon"] = v446
local v447 = {
	["PlantName"] = "Easter Sour Lemon",
	["PlantData"] = {
		["GrowTickTime"] = NumberRange.new(16, 20),
		["GrowFruitTime"] = NumberRange.new(100, 120),
		["GrowRate"] = 0.04,
		["PlantDown"] = 0
	},
	["FruitData"] = {
		["GrowTickTime"] = NumberRange.new(1, 2),
		["GrowRate"] = 0.05,
		["PlantDown"] = 0
	}
}
v_u_5["Easter Sour Lemon"] = v447
local v448 = {
	["PlantName"] = "Easter Eggfruit",
	["PlantData"] = {
		["GrowTickTime"] = NumberRange.new(24, 28),
		["GrowFruitTime"] = NumberRange.new(120, 160),
		["GrowRate"] = 0.03,
		["PlantDown"] = 0
	},
	["FruitData"] = {
		["GrowTickTime"] = NumberRange.new(1, 2),
		["GrowRate"] = 0.05,
		["PlantDown"] = 0
	}
}
v_u_5["Easter Eggfruit"] = v448
local v449 = {
	["PlantName"] = "Easter Easter Sprout",
	["PlantData"] = {
		["GrowTickTime"] = NumberRange.new(12, 16),
		["GrowFruitTime"] = NumberRange.new(167, 167),
		["GrowRate"] = 0.0167,
		["PlantDown"] = 0
	},
	["FruitData"] = {
		["GrowTickTime"] = NumberRange.new(16, 17),
		["GrowRate"] = 0.025,
		["PlantDown"] = 0
	}
}
v_u_5["Easter Easter Sprout"] = v449
local v450 = {
	["PlantName"] = "Eggsnapper",
	["PlantData"] = {
		["GrowTickTime"] = NumberRange.new(33, 33),
		["GrowFruitTime"] = NumberRange.new(333, 333),
		["GrowRate"] = 0.007,
		["PlantDown"] = 0
	},
	["FruitData"] = {
		["GrowTickTime"] = NumberRange.new(13, 13),
		["GrowRate"] = 0.01,
		["PlantDown"] = 0
	}
}
v_u_5.Eggsnapper = v450
local v451 = {
	["PlantName"] = "Drowned Flower",
	["PlantData"] = {
		["GrowTickTime"] = NumberRange.new(6, 8),
		["GrowFruitTime"] = NumberRange.new(40, 60),
		["GrowRate"] = 0.1,
		["PlantDown"] = 0
	},
	["FruitData"] = {
		["GrowTickTime"] = NumberRange.new(6, 8),
		["GrowRate"] = 0.05,
		["PlantDown"] = 0
	}
}
v_u_5["Drowned Flower"] = v451
local v452 = {
	["PlantName"] = "Saskia",
	["PlantData"] = {
		["GrowTickTime"] = NumberRange.new(8, 10),
		["GrowFruitTime"] = NumberRange.new(60, 100),
		["GrowRate"] = 0.05,
		["PlantDown"] = 0
	},
	["FruitData"] = {
		["GrowTickTime"] = NumberRange.new(8, 12),
		["GrowRate"] = 0.025,
		["PlantDown"] = 0
	}
}
v_u_5.Saskia = v452
local v453 = {
	["PlantName"] = "Mini Pumpkin",
	["PlantData"] = {
		["GrowTickTime"] = NumberRange.new(16, 20),
		["GrowFruitTime"] = NumberRange.new(100, 160),
		["GrowRate"] = 0.25,
		["PlantDown"] = 0
	},
	["FruitData"] = {
		["GrowTickTime"] = NumberRange.new(12, 14),
		["GrowRate"] = 0.05,
		["PlantDown"] = 0
	}
}
v_u_5["Mini Pumpkin"] = v453
local v454 = {
	["PlantName"] = "Jungle Cherry",
	["PlantData"] = {
		["GrowTickTime"] = NumberRange.new(30, 34),
		["GrowFruitTime"] = NumberRange.new(160, 200),
		["GrowRate"] = 0.009,
		["PlantDown"] = 0
	},
	["FruitData"] = {
		["GrowTickTime"] = NumberRange.new(14, 18),
		["GrowRate"] = 0.025,
		["PlantDown"] = 0
	}
}
v_u_5["Jungle Cherry"] = v454
local v455 = {
	["PlantName"] = "Amazon Feather Fern",
	["PlantData"] = {
		["GrowTickTime"] = NumberRange.new(28, 32),
		["GrowFruitTime"] = NumberRange.new(300, 350),
		["GrowRate"] = 0.008,
		["PlantDown"] = 0
	},
	["FruitData"] = {
		["GrowTickTime"] = NumberRange.new(18, 22),
		["GrowRate"] = 0.025,
		["PlantDown"] = 0
	}
}
v_u_5["Amazon Feather Fern"] = v455
local v456 = {
	["PlantName"] = "Boreal Orange",
	["PlantData"] = {
		["GrowTickTime"] = NumberRange.new(20, 22),
		["GrowFruitTime"] = NumberRange.new(400, 440),
		["GrowRate"] = 0.0025,
		["PlantDown"] = 0
	},
	["FruitData"] = {
		["GrowTickTime"] = NumberRange.new(40, 44),
		["GrowRate"] = 0.04,
		["PlantDown"] = 0
	}
}
v_u_5["Boreal Orange"] = v456
local v457 = {
	["PlantName"] = "Purple Treeshroom",
	["PlantData"] = {
		["GrowTickTime"] = NumberRange.new(30, 44),
		["GrowFruitTime"] = NumberRange.new(333, 350),
		["GrowRate"] = 0.015,
		["PlantDown"] = 0
	},
	["FruitData"] = {
		["GrowTickTime"] = NumberRange.new(17, 23),
		["GrowRate"] = 0.015,
		["PlantDown"] = -0
	}
}
v_u_5["Purple Treeshroom"] = v457
local v458 = {
	["PlantName"] = "DJ Delight",
	["PlantData"] = {
		["GrowTickTime"] = NumberRange.new(6, 7),
		["GrowFruitTime"] = NumberRange.new(167, 167),
		["GrowRate"] = 0.0267,
		["PlantDown"] = 0
	},
	["FruitData"] = {
		["GrowTickTime"] = NumberRange.new(16, 17),
		["GrowRate"] = 0.025,
		["PlantDown"] = 0
	}
}
v_u_5["DJ Delight"] = v458
local v459 = {
	["PlantName"] = "Blue Candypop",
	["PlantData"] = {
		["GrowTickTime"] = NumberRange.new(4, 6),
		["GrowFruitTime"] = NumberRange.new(40, 60),
		["GrowRate"] = 0.028,
		["PlantDown"] = 0
	},
	["FruitData"] = {
		["GrowTickTime"] = NumberRange.new(0.8, 1.2),
		["GrowRate"] = 0.05,
		["PlantDown"] = 0
	}
}
v_u_5["Blue Candypop"] = v459
local v460 = {
	["PlantName"] = "Elder Candy Blossom",
	["PlantData"] = {
		["GrowTickTime"] = NumberRange.new(8, 12),
		["GrowFruitTime"] = NumberRange.new(200, 240),
		["GrowRate"] = 0.02,
		["PlantDown"] = 0
	},
	["FruitData"] = {
		["GrowTickTime"] = NumberRange.new(8, 10),
		["GrowRate"] = 0.04,
		["PlantDown"] = 0
	}
}
v_u_5["Elder Candy Blossom"] = v460
local v461 = {
	["PlantName"] = "Bunny Berry",
	["PlantData"] = {
		["GrowTickTime"] = NumberRange.new(15, 20),
		["GrowFruitTime"] = NumberRange.new(100, 150),
		["GrowRate"] = 0.3,
		["PlantDown"] = 0
	},
	["FruitData"] = {
		["GrowTickTime"] = NumberRange.new(8, 10),
		["GrowRate"] = 0.5,
		["PlantDown"] = 0
	}
}
v_u_5["Bunny Berry"] = v461
local v462 = {
	["PlantName"] = "Bonnet Bloom",
	["PlantData"] = {
		["GrowTickTime"] = NumberRange.new(6, 7),
		["GrowFruitTime"] = NumberRange.new(160, 160),
		["GrowRate"] = 0.005,
		["PlantDown"] = 0
	},
	["FruitData"] = {
		["GrowTickTime"] = NumberRange.new(16, 16),
		["GrowRate"] = 0.02,
		["PlantDown"] = 0
	}
}
v_u_5["Bonnet Bloom"] = v462
local v463 = {
	["PlantName"] = "Egg Shroom",
	["PlantData"] = {
		["GrowTickTime"] = NumberRange.new(18, 22),
		["GrowFruitTime"] = NumberRange.new(300, 300),
		["GrowRate"] = 0.008,
		["PlantDown"] = 0
	},
	["FruitData"] = {
		["GrowTickTime"] = NumberRange.new(16, 16),
		["GrowRate"] = 0.05,
		["PlantDown"] = 0
	}
}
v_u_5["Egg Shroom"] = v463
local v464 = {
	["PlantName"] = "Waddling Willow",
	["PlantData"] = {
		["GrowTickTime"] = NumberRange.new(15, 18),
		["GrowFruitTime"] = NumberRange.new(300, 350),
		["GrowRate"] = 0.009,
		["PlantDown"] = 0
	},
	["FruitData"] = {
		["GrowTickTime"] = NumberRange.new(15, 20),
		["GrowRate"] = 0.025,
		["PlantDown"] = 0
	}
}
v_u_5["Waddling Willow"] = v464
local v465 = {
	["PlantName"] = "Marshmallow Root",
	["PlantData"] = {
		["GrowTickTime"] = NumberRange.new(10, 10),
		["GrowFruitTime"] = NumberRange.new(300, 350),
		["GrowRate"] = 0.005,
		["PlantDown"] = 0
	},
	["FruitData"] = {
		["GrowTickTime"] = NumberRange.new(12, 14),
		["GrowRate"] = 0.005,
		["PlantDown"] = 0
	}
}
v_u_5["Marshmallow Root"] = v465
local v466 = {
	["PlantName"] = "Jelly Bean Sprout",
	["PlantData"] = {
		["GrowTickTime"] = NumberRange.new(8, 12),
		["GrowFruitTime"] = NumberRange.new(200, 240),
		["GrowRate"] = 0.02,
		["PlantDown"] = 0
	},
	["FruitData"] = {
		["GrowTickTime"] = NumberRange.new(8, 10),
		["GrowRate"] = 0.04,
		["PlantDown"] = 0
	}
}
v_u_5["Jelly Bean Sprout"] = v466
local v467 = {
	["PlantName"] = "Basket Bouquet",
	["PlantData"] = {
		["GrowTickTime"] = NumberRange.new(8, 12),
		["GrowFruitTime"] = NumberRange.new(200, 240),
		["GrowRate"] = 0.02,
		["PlantDown"] = 0
	},
	["FruitData"] = {
		["GrowTickTime"] = NumberRange.new(8, 10),
		["GrowRate"] = 0.04,
		["PlantDown"] = 0
	}
}
v_u_5["Basket Bouquet"] = v467
function v2.GetDataForWeather(_, p468)
	-- upvalues: (copy) v_u_3, (copy) v_u_1
	if not p468 or type(p468) ~= "string" then
		warn("GrowableData:GetDataForWeather | weatherName is not applicable!")
		return v_u_3.Default
	end
	local v469 = v_u_3[p468]
	if v469 then
		return v469
	end
	if v_u_1:IsStudio() then
		warn("GrowableData:GetDataForWeather | weatherData is nil! Using Default", p468)
	end
	return v_u_3.Default
end
function v2.GetDataForPlant(_, p470)
	-- upvalues: (copy) v_u_5
	if not p470 then
		warn((("GrowableData:GetDataForPlan | %* is not a valid plant!"):format(not p470 and "nil" or p470.Name)))
		return nil
	end
	local v471 = p470.Parent and (p470.Parent.Name == "Fruits" or p470.Parent.Name == "Fruit_Spawn") and true or false
	local v472 = p470:FindFirstChild("Fruit_Spawn") and true or false
	local v473 = v_u_5[p470.Name]
	if not v473 then
		warn((("GrowableData:GetDataForPlan | No GrowData for %*!"):format(p470.Name)))
		return nil
	end
	local v474 = nil
	if v471 and v473.FruitData then
		v474 = v473.FruitData
	elseif v473.PlantData then
		v474 = v473.PlantData
	end
	if not v474 then
		warn((("GrowableData:GetDataForPlan | %* has no PlantData or FruitData!"):format(p470.Name)))
		return nil
	end
	if not v474.GrowTickTime then
		warn((("GrowableData:GetDataForPlan | %* has no GrowTickTime!"):format(p470.Name)))
		return nil
	end
	if not v474.GrowRate then
		warn((("GrowableData:GetDataForPlan | %* has no GrowRate!"):format(p470.Name)))
		return nil
	end
	if v474.PlantDown == nil then
		warn((("GrowableData:GetDataForPlant | %* has no PlantDown!"):format(p470.Name)))
		return nil
	end
	if not v472 or v474.GrowFruitTime then
		return v474
	end
	print(v474)
	warn((("GrowableData:GetDataForPlan | %* has no GrowFruitTime!"):format(p470.Name)))
	return nil
end
function v2.GetAllPlantData(_)
	-- upvalues: (copy) v_u_5
	return v_u_5
end
local function v483()
	-- upvalues: (copy) v_u_5
	local v475 = game:GetService("ServerStorage")
	local v476 = v475:WaitForChild("Collectables")
	local v477 = v475:WaitForChild("Fruit_Spawn")
	local v478 = 0
	for _, v479 in pairs(v476:GetChildren()) do
		local v480 = v479.Name
		if v_u_5[v480] then
			if not (v_u_5[v480].PlantData and v_u_5[v480].PlantData.GrowTickTime) then
				warn("Missing GrowTickTime for plant: ", v479)
				v478 = v478 + 1
			end
			if not (v_u_5[v480].PlantData and v_u_5[v480].PlantData.GrowRate) then
				warn("Missing required GrowRate for plant: ", v479)
				v478 = v478 + 1
			end
			if not v_u_5[v480].PlantData.PlantDown then
				warn("Missing required PlantDown for plant: ", v479)
				v478 = v478 + 1
			end
			if v477:FindFirstChild(v480) then
				if not v_u_5[v480].PlantData.GrowFruitTime then
					warn("Missing GrowFruitTime for plant with fruit: ", v479)
					v478 = v478 + 1
				end
				if not (v_u_5[v480].FruitData and v_u_5[v480].FruitData.GrowTickTime) then
					warn("Missing FruitData.GrowTickTime for fruit: ", v479)
					v478 = v478 + 1
				end
				if not (v_u_5[v480].FruitData and v_u_5[v480].FruitData.GrowRate) then
					warn("Missing required FruitData.GrowRate for fruit: ", v479)
					v478 = v478 + 1
				end
			end
		else
			warn("Missing plant entry: ", v479)
			v478 = v478 + 1
		end
	end
	for _, v481 in pairs(v477:GetChildren()) do
		local v482 = v481.Name
		if v_u_5[v482] then
			if v_u_5[v482].FruitData then
				if v_u_5[v482].FruitData and not v_u_5[v482].FruitData.PlantDown then
					warn("Missing required PlantDown for fruit: ", v481)
					v478 = v478 + 1
				end
			else
				warn("Missing FruitData for fruit: ", v481)
				v478 = v478 + 1
			end
		else
			warn("Missing plant entry for fruit: ", v481)
			v478 = v478 + 1
		end
	end
	local _ = 0 < v478
	return v478 == 0
end
if v_u_1:IsStudio() and v_u_1:IsServer() then
	v483()
end
return v2