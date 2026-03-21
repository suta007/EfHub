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
v_u_5.Cacao = v15
local v16 = {
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
v_u_5.Sunflower = v16
local v17 = {
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
v_u_5.Beanstalk = v17
local v18 = {
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
v_u_5["Coolcool Beanbeanstalk"] = v18
local v19 = {
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
v_u_5["Ember Lily"] = v19
local v20 = {
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
v_u_5["Sugar Apple"] = v20
local v21 = {
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
v_u_5["Burning Bud"] = v21
local v22 = {
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
v_u_5.Zebrazinkle = v22
local v23 = {
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
v_u_5["Giant Pinecone"] = v23
local v24 = {
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
v_u_5["Elder Strawberry"] = v24
local v25 = {
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
v_u_5.Romanesco = v25
local v26 = {
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
v_u_5["Crimson Thorn"] = v26
local v27 = {
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
v_u_5["Great Pumpkin"] = v27
local v28 = {
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
v_u_5.Octobloom = v28
local v29 = {
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
v_u_5["Trinity Fruit"] = v29
local v30 = {
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
v_u_5["Four Leaf Clover"] = v30
local v31 = {
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
v_u_5["Peppermint Vine"] = v31
local v32 = {
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
v_u_5["Reindeer Root"] = v32
local v33 = {
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
v_u_5["Spirit Sparkle"] = v33
local v34 = {
	["PlantName"] = "Candy Sunflower",
	["PlantData"] = {
		["GrowTickTime"] = NumberRange.new(3, 4),
		["GrowRate"] = 0.1,
		["PlantDown"] = 0.25
	}
}
v_u_5["Candy Sunflower"] = v34
local v35 = {
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
v_u_5.Grape = v35
local v36 = {
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
v_u_5["Venus Fly Trap"] = v36
local v37 = {
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
v_u_5.Raspberry = v37
local v38 = {
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
v_u_5.Peach = v38
local v39 = {
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
v_u_5.Passionfruit = v39
local v40 = {
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
v_u_5.Blueberry = v40
local v41 = {
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
v_u_5.Celestiberry = v41
local v42 = {
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
v_u_5.Eggplant = v42
local v43 = {
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
v_u_5["Easter Egg"] = v43
local v44 = {
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
v_u_5["Purple Cabbage"] = v44
local v45 = {
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
v_u_5.Lemon = v45
local v46 = {
	["PlantName"] = "Chocolate Carrot",
	["PlantData"] = {
		["GrowTickTime"] = NumberRange.new(1.5, 2.3),
		["GrowRate"] = 0.4,
		["PlantDown"] = 0.25
	}
}
v_u_5["Chocolate Carrot"] = v46
local v47 = {
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
v_u_5["Soul Fruit"] = v47
local v48 = {
	["PlantName"] = "Pink Tulip",
	["PlantData"] = {
		["GrowTickTime"] = NumberRange.new(0.8, 1.2),
		["GrowRate"] = 0.4,
		["PlantDown"] = 0.25
	}
}
v_u_5["Pink Tulip"] = v48
local v49 = {
	["PlantName"] = "Orange Tulip",
	["PlantData"] = {
		["GrowTickTime"] = NumberRange.new(0.8, 1.2),
		["GrowRate"] = 0.4,
		["PlantDown"] = 0.25
	}
}
v_u_5["Orange Tulip"] = v49
local v50 = {
	["PlantName"] = "Buttercup",
	["PlantData"] = {
		["GrowTickTime"] = NumberRange.new(0.8, 1.2),
		["GrowRate"] = 0.2,
		["PlantDown"] = 0.25
	}
}
v_u_5.Buttercup = v50
local v51 = {
	["PlantName"] = "Big Buttercup",
	["PlantData"] = {
		["GrowTickTime"] = NumberRange.new(0.8, 1.2),
		["GrowRate"] = 0.2,
		["PlantDown"] = 0.25
	}
}
v_u_5["Big Buttercup"] = v51
local v52 = {
	["PlantName"] = "Bigger Buttercup",
	["PlantData"] = {
		["GrowTickTime"] = NumberRange.new(0.8, 1.2),
		["GrowRate"] = 0.2,
		["PlantDown"] = 0.25
	}
}
v_u_5["Bigger Buttercup"] = v52
local v53 = {
	["PlantName"] = "Biggest Buttercup",
	["PlantData"] = {
		["GrowTickTime"] = NumberRange.new(0.8, 1.2),
		["GrowRate"] = 0.025,
		["PlantDown"] = 0.25
	}
}
v_u_5["Biggest Buttercup"] = v53
local v54 = {
	["PlantName"] = "Beast Buttercup",
	["PlantData"] = {
		["GrowTickTime"] = NumberRange.new(0.8, 1.2),
		["GrowRate"] = 0.01,
		["PlantDown"] = 0.25
	}
}
v_u_5["Beast Buttercup"] = v54
local v55 = {
	["PlantName"] = "Shadow Buttercup",
	["PlantData"] = {
		["GrowTickTime"] = NumberRange.new(0.8, 1.2),
		["GrowRate"] = 0.2,
		["PlantDown"] = 0.25
	}
}
v_u_5["Shadow Buttercup"] = v55
local v56 = {
	["PlantName"] = "Big Shadow Buttercup",
	["PlantData"] = {
		["GrowTickTime"] = NumberRange.new(0.8, 1.2),
		["GrowRate"] = 0.2,
		["PlantDown"] = 0.25
	}
}
v_u_5["Big Shadow Buttercup"] = v56
local v57 = {
	["PlantName"] = "Bigger Shadow Buttercup",
	["PlantData"] = {
		["GrowTickTime"] = NumberRange.new(0.8, 1.2),
		["GrowRate"] = 0.2,
		["PlantDown"] = 0.25
	}
}
v_u_5["Bigger Shadow Buttercup"] = v57
local v58 = {
	["PlantName"] = "Biggest Shadow Buttercup",
	["PlantData"] = {
		["GrowTickTime"] = NumberRange.new(0.8, 1.2),
		["GrowRate"] = 0.025,
		["PlantDown"] = 0.25
	}
}
v_u_5["Biggest Shadow Buttercup"] = v58
local v59 = {
	["PlantName"] = "Beast Shadow Buttercup",
	["PlantData"] = {
		["GrowTickTime"] = NumberRange.new(0.8, 1.2),
		["GrowRate"] = 0.01,
		["PlantDown"] = 0.25
	}
}
v_u_5["Beast Shadow Buttercup"] = v59
local v60 = {
	["PlantName"] = "Daffodil",
	["PlantData"] = {
		["GrowTickTime"] = NumberRange.new(0.8, 1.2),
		["GrowRate"] = 0.4,
		["PlantDown"] = 0.25
	}
}
v_u_5.Daffodil = v60
local v61 = {
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
v_u_5["Cherry OLD"] = v61
local v62 = {
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
v_u_5.Banana = v62
local v63 = {
	["PlantName"] = "Red Lollipop",
	["PlantData"] = {
		["GrowTickTime"] = NumberRange.new(1.2, 1.4),
		["GrowRate"] = 0.6,
		["PlantDown"] = 0.25
	}
}
v_u_5["Red Lollipop"] = v63
local v64 = {
	["PlantName"] = "Bamboo",
	["PlantData"] = {
		["GrowTickTime"] = NumberRange.new(1.5, 3),
		["GrowRate"] = 0.1875,
		["PlantDown"] = -0.5
	}
}
v_u_5.Bamboo = v64
local v65 = {
	["PlantName"] = "Mushroom",
	["PlantData"] = {
		["GrowTickTime"] = NumberRange.new(3, 5),
		["GrowRate"] = 0.05,
		["PlantDown"] = -0.5
	}
}
v_u_5.Mushroom = v65
local v66 = {
	["PlantName"] = "Mega Mushroom",
	["PlantData"] = {
		["GrowTickTime"] = NumberRange.new(8, 12),
		["GrowRate"] = 0.05,
		["PlantDown"] = -0.5
	}
}
v_u_5["Mega Mushroom"] = v66
local v67 = {
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
v_u_5.Corn = v67
local v68 = {
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
v_u_5.Cactus = v68
local v69 = {
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
v_u_5.Mango = v69
local v70 = {
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
v_u_5["Moon Mango"] = v70
local v71 = {
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
v_u_5["Dragon Fruit"] = v71
local v72 = {
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
v_u_5.Pineapple = v72
local v73 = {
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
v_u_5.Strawberry = v73
local v74 = {
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
v_u_5.Cranberry = v74
local v75 = {
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
v_u_5.Pepper = v75
local v76 = {
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
v_u_5.Papaya = v76
local v77 = {
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
v_u_5.Lotus = v77
local v78 = {
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
v_u_5.Avocado = v78
local v79 = {
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
v_u_5.Starfruit = v79
local v80 = {
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
v_u_5.Mint = v80
local v81 = {
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
v_u_5["Moon Blossom"] = v81
local v82 = {
	["PlantName"] = "Nightshade",
	["PlantData"] = {
		["GrowTickTime"] = NumberRange.new(1.5, 3),
		["GrowRate"] = 0.1875,
		["PlantDown"] = -0.5
	}
}
v_u_5.Nightshade = v82
local v83 = {
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
v_u_5.Durian = v83
local v84 = {
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
v_u_5.Moonflower = v84
local v85 = {
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
v_u_5.Moonglow = v85
local v86 = {
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
v_u_5.Glowshroom = v86
local v87 = {
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
v_u_5["Cursed Fruit"] = v87
local v88 = {
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
v_u_5["Crimson Vine"] = v88
local v89 = {
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
v_u_5["Moon Melon"] = v89
local v90 = {
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
v_u_5["Blood Banana"] = v90
local v91 = {
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
v_u_5.Broccoli = v91
local v92 = {
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
v_u_5.Potato = v92
local v93 = {
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
v_u_5["Brussels Sprout"] = v93
local v94 = {
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
v_u_5.Cocomango = v94
local v95 = {
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
v_u_5.Rose = v95
local v96 = {
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
v_u_5.Foxglove = v96
local v97 = {
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
v_u_5.Lilac = v97
local v98 = {
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
v_u_5["Pink Lily"] = v98
local v99 = {
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
v_u_5["Purple Dahlia"] = v99
local v100 = {
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
v_u_5["Legacy Sunflower"] = v100
local v101 = {
	["PlantName"] = "Lavender",
	["PlantData"] = {
		["GrowTickTime"] = NumberRange.new(6, 8),
		["GrowRate"] = 0.07,
		["PlantDown"] = 0.25
	}
}
v_u_5.Lavender = v101
local v102 = {
	["PlantName"] = "Nectarshade",
	["PlantData"] = {
		["GrowTickTime"] = NumberRange.new(6, 8),
		["GrowRate"] = 0.1,
		["PlantDown"] = 0.25
	}
}
v_u_5.Nectarshade = v102
local v103 = {
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
v_u_5.Nectarine = v103
local v104 = {
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
v_u_5["Hive Fruit"] = v104
local v105 = {
	["PlantName"] = "Manuka Flower",
	["PlantData"] = {
		["GrowTickTime"] = NumberRange.new(4, 6),
		["GrowRate"] = 0.06,
		["PlantDown"] = 0.25
	}
}
v_u_5["Manuka Flower"] = v105
local v106 = {
	["PlantName"] = "Dandelion",
	["PlantData"] = {
		["GrowTickTime"] = NumberRange.new(2.5, 4),
		["GrowRate"] = 0.01,
		["PlantDown"] = 0.25
	}
}
v_u_5.Dandelion = v106
local v107 = {
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
v_u_5.Lumira = v107
local v108 = {
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
v_u_5.Honeysuckle = v108
local v109 = {
	["PlantName"] = "Crocus",
	["PlantData"] = {
		["GrowTickTime"] = NumberRange.new(2.75, 3.75),
		["GrowRate"] = 0.025,
		["PlantDown"] = 0.25
	}
}
v_u_5.Crocus = v109
local v110 = {
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
v_u_5.Succulent = v110
local v111 = {
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
v_u_5["Violet Corn"] = v111
local v112 = {
	["PlantName"] = "Bendboo",
	["PlantData"] = {
		["GrowTickTime"] = NumberRange.new(1.5, 4.5),
		["GrowRate"] = 0.1875,
		["PlantDown"] = 0
	}
}
v_u_5.Bendboo = v112
local v113 = {
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
v_u_5.Cocovine = v113
local v114 = {
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
v_u_5["Dragon Pepper"] = v114
local v115 = {
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
v_u_5["Bee Balm"] = v115
local v116 = {
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
v_u_5["Nectar Thorn"] = v116
local v117 = {
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
v_u_5.Suncoil = v117
local v118 = {
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
v_u_5["Noble Flower"] = v118
local v119 = {
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
v_u_5["Ice Cream Bean"] = v119
local v120 = {
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
v_u_5.Lime = v120
local v121 = {
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
v_u_5.Cauliflower = v121
local v122 = {
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
v_u_5["Green Apple"] = v122
local v123 = {
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
v_u_5.Kiwi = v123
local v124 = {
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
v_u_5["Bell Pepper"] = v124
local v125 = {
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
v_u_5["Prickly Pear"] = v125
local v126 = {
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
v_u_5.Feijoa = v126
local v127 = {
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
v_u_5.Loquat = v127
local v128 = {
	["PlantName"] = "Delphinium",
	["PlantData"] = {
		["GrowTickTime"] = NumberRange.new(8.25, 9),
		["GrowRate"] = 0.05,
		["PlantDown"] = 0.25
	}
}
v_u_5.Delphinium = v128
local v129 = {
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
v_u_5["Lily of the Valley"] = v129
local v130 = {
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
v_u_5["Traveler\'s Fruit"] = v130
local v131 = {
	["PlantName"] = "Peace Lily",
	["PlantData"] = {
		["GrowTickTime"] = NumberRange.new(3, 4),
		["GrowRate"] = 0.05,
		["PlantDown"] = 0.25
	}
}
v_u_5["Peace Lily"] = v131
local v132 = {
	["PlantName"] = "Aloe Vera",
	["PlantData"] = {
		["GrowTickTime"] = NumberRange.new(12, 16),
		["GrowRate"] = 0.016,
		["PlantDown"] = 0.35
	}
}
v_u_5["Aloe Vera"] = v132
local v133 = {
	["PlantName"] = "Rafflesia",
	["PlantData"] = {
		["GrowTickTime"] = NumberRange.new(12, 13.5),
		["GrowRate"] = 0.01225,
		["PlantDown"] = 0
	}
}
v_u_5.Rafflesia = v133
local v134 = {
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
v_u_5.Guanabana = v134
local v135 = {
	["PlantName"] = "Wild Carrot",
	["PlantData"] = {
		["GrowTickTime"] = NumberRange.new(0.6, 0.75),
		["GrowRate"] = 0.1,
		["PlantDown"] = 0.25
	}
}
v_u_5["Wild Carrot"] = v135
local v136 = {
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
v_u_5.Pear = v136
local v137 = {
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
v_u_5.Cantaloupe = v137
local v138 = {
	["PlantName"] = "Parasol Flower",
	["PlantData"] = {
		["GrowTickTime"] = NumberRange.new(20, 25),
		["GrowRate"] = 0.05,
		["PlantDown"] = 0.5
	}
}
v_u_5["Parasol Flower"] = v138
local v139 = {
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
v_u_5["Rosy Delight"] = v139
local v140 = {
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
v_u_5["Elephant Ears"] = v140
local v141 = {
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
v_u_5["Liberty Lily"] = v141
local v142 = {
	["PlantName"] = "Firework Flower",
	["PlantData"] = {
		["GrowTickTime"] = NumberRange.new(10, 15),
		["GrowRate"] = 0.07,
		["PlantDown"] = 2
	}
}
v_u_5["Firework Flower"] = v142
local v143 = {
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
v_u_5["White Mulberry"] = v143
local v144 = {
	["PlantName"] = "Merica Mushroom",
	["PlantData"] = {
		["GrowTickTime"] = NumberRange.new(3, 5),
		["GrowRate"] = 0.07,
		["PlantDown"] = 2
	}
}
v_u_5["Merica Mushroom"] = v144
local v145 = {
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
v_u_5["Pitcher Plant"] = v145
local v146 = {
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
v_u_5["Bone Blossom"] = v146
local v147 = {
	["PlantName"] = "Stonebite",
	["PlantData"] = {
		["GrowTickTime"] = NumberRange.new(4, 6),
		["GrowRate"] = 0.1,
		["PlantDown"] = 0
	}
}
v_u_5.Stonebite = v147
local v148 = {
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
v_u_5["Paradise Petal"] = v148
local v149 = {
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
v_u_5["Horned Dinoshroom"] = v149
local v150 = {
	["PlantName"] = "Boneboo",
	["PlantData"] = {
		["GrowTickTime"] = NumberRange.new(16, 20),
		["GrowRate"] = 0.1875,
		["PlantDown"] = 0.5
	}
}
v_u_5.Boneboo = v150
local v151 = {
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
v_u_5["Firefly Fern"] = v151
local v152 = {
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
v_u_5.Fossilight = v152
local v153 = {
	["PlantName"] = "Horsetail",
	["PlantData"] = {
		["GrowTickTime"] = NumberRange.new(8, 9),
		["GrowRate"] = 0.1,
		["PlantDown"] = 0.25
	}
}
v_u_5.Horsetail = v153
local v154 = {
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
v_u_5.Lingonberry = v154
local v155 = {
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
v_u_5["Amber Spine"] = v155
local v156 = {
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
v_u_5["Grand Volcania"] = v156
local v157 = {
	["PlantName"] = "Monoblooma",
	["PlantData"] = {
		["GrowTickTime"] = NumberRange.new(0.8, 1.3),
		["GrowRate"] = 0.035,
		["PlantDown"] = 0.25
	}
}
v_u_5.Monoblooma = v157
local v158 = {
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
v_u_5.Serenity = v158
local v159 = {
	["PlantName"] = "Taro Flower",
	["PlantData"] = {
		["GrowTickTime"] = NumberRange.new(8.25, 9),
		["GrowRate"] = 0.022,
		["PlantDown"] = 0.25
	}
}
v_u_5["Taro Flower"] = v159
local v160 = {
	["PlantName"] = "Zen Rocks",
	["PlantData"] = {
		["GrowTickTime"] = NumberRange.new(5, 6),
		["GrowRate"] = 0.027,
		["PlantDown"] = 0
	}
}
v_u_5["Zen Rocks"] = v160
local v161 = {
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
v_u_5.Hinomai = v161
local v162 = {
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
v_u_5["Maple Apple"] = v162
local v163 = {
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
v_u_5.Zenflare = v163
local v164 = {
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
v_u_5["Sakura Bush"] = v164
local v165 = {
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
v_u_5["Soft Sunshine"] = v165
local v166 = {
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
v_u_5["Spiked Mango"] = v166
local v167 = {
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
v_u_5.Enkaku = v167
local v168 = {
	["PlantName"] = "Dezen",
	["PlantData"] = {
		["GrowTickTime"] = NumberRange.new(2, 3),
		["GrowRate"] = 0.1,
		["PlantDown"] = 0
	}
}
v_u_5.Dezen = v168
local v169 = {
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
v_u_5["Lucky Bamboo"] = v169
local v170 = {
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
v_u_5["Tranquil Bloom"] = v170
local v171 = {
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
v_u_5.Fruitball = v171
local v172 = {
	["PlantName"] = "Onion",
	["PlantData"] = {
		["GrowTickTime"] = NumberRange.new(3, 4),
		["GrowRate"] = 0.5,
		["PlantDown"] = -0.25
	}
}
v_u_5.Onion = v172
local v173 = {
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
v_u_5.Jalapeno = v173
local v174 = {
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
v_u_5["Crown Melon"] = v174
local v175 = {
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
v_u_5.Sugarglaze = v175
local v176 = {
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
v_u_5["Tall Asparagus"] = v176
local v177 = {
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
v_u_5["Grand Tomato"] = v177
local v178 = {
	["PlantName"] = "Artichoke",
	["PlantData"] = {
		["GrowTickTime"] = NumberRange.new(1, 2),
		["GrowRate"] = 0.4,
		["PlantDown"] = 0
	}
}
v_u_5.Artichoke = v178
local v179 = {
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
v_u_5["Taco Fern"] = v179
local v180 = {
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
v_u_5["Twisted Tangle"] = v180
local v181 = {
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
v_u_5.Veinpetal = v181
local v182 = {
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
v_u_5.Rhubarb = v182
local v183 = {
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
v_u_5["Badlands Pepper"] = v183
local v184 = {
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
v_u_5["King Cabbage"] = v184
local v185 = {
	["PlantName"] = "Spring Onion",
	["PlantData"] = {
		["GrowTickTime"] = NumberRange.new(1, 2),
		["GrowRate"] = 0.4,
		["PlantDown"] = 0
	}
}
v_u_5["Spring Onion"] = v185
local v186 = {
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
v_u_5["Butternut Squash"] = v186
local v187 = {
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
v_u_5.Pricklefruit = v187
local v188 = {
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
v_u_5["Bitter Melon"] = v188
local v189 = {
	["PlantName"] = "Golden Egg",
	["PlantData"] = {
		["GrowTickTime"] = NumberRange.new(1, 1),
		["GrowRate"] = 1,
		["PlantDown"] = 0
	}
}
v_u_5["Golden Egg"] = v189
local v190 = {
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
v_u_5["Flare Daisy"] = v190
local v191 = {
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
v_u_5.Duskpuff = v191
local v192 = {
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
v_u_5.Mangosteen = v192
local v193 = {
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
v_u_5["Poseidon Plant"] = v193
local v194 = {
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
v_u_5.Gleamroot = v194
local v195 = {
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
v_u_5["Princess Thorn"] = v195
local v196 = {
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
v_u_5.Mandrake = v196
local v197 = {
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
v_u_5["Canary Melon"] = v197
local v198 = {
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
v_u_5.Amberheart = v198
local v199 = {
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
v_u_5["Crown of Thorns"] = v199
local v200 = {
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
v_u_5["Calla Lily"] = v200
local v201 = {
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
v_u_5.Cyclamen = v201
local v202 = {
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
v_u_5.Glowpod = v202
local v203 = {
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
v_u_5["Flare Melon"] = v203
local v204 = {
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
v_u_5.Willowberry = v204
local v205 = {
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
v_u_5.Sunbulb = v205
local v206 = {
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
v_u_5.Glowthorn = v206
local v207 = {
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
v_u_5.Lightshoot = v207
local v208 = {
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
v_u_5["Briar Rose"] = v208
local v209 = {
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
v_u_5["Pink Rose"] = v209
local v210 = {
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
v_u_5["Spirit Flower"] = v210
local v211 = {
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
v_u_5.Wispwing = v211
local v212 = {
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
v_u_5["Emerald Bud"] = v212
local v213 = {
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
v_u_5.Pyracantha = v213
local v214 = {
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
v_u_5.Aetherfruit = v214
local v215 = {
	["PlantName"] = "Radish",
	["PlantData"] = {
		["GrowTickTime"] = NumberRange.new(1, 2),
		["GrowRate"] = 0.55,
		["PlantDown"] = 0.65
	}
}
v_u_5.Radish = v215
local v216 = {
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
v_u_5["Blue Raspberry"] = v216
local v217 = {
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
v_u_5["Horned Melon"] = v217
local v218 = {
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
v_u_5.Ackee = v218
local v219 = {
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
v_u_5["Urchin Plant"] = v219
local v220 = {
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
v_u_5["Pixie Faern"] = v220
local v221 = {
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
v_u_5["Untold Bell"] = v221
local v222 = {
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
v_u_5.Turnip = v222
local v223 = {
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
v_u_5.Parsley = v223
local v224 = {
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
v_u_5["Meyer Lemon"] = v224
local v225 = {
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
v_u_5["Carnival Pumpkin"] = v225
local v226 = {
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
v_u_5.Kniphofia = v226
local v227 = {
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
v_u_5["Golden Peach"] = v227
local v228 = {
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
v_u_5["Maple Resin"] = v228
local v229 = {
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
v_u_5.Mangrove = v229
local v230 = {
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
v_u_5.Sundew = v230
local v231 = {
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
v_u_5["Black Bat Flower"] = v231
local v232 = {
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
v_u_5["Mandrone Berry"] = v232
local v233 = {
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
v_u_5["Corpse Flower"] = v233
local v234 = {
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
v_u_5["Inferno Quince"] = v234
local v235 = {
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
v_u_5.Multitrap = v235
local v236 = {
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
v_u_5["Naval Wort"] = v236
local v237 = {
	["PlantName"] = "Evo Beetroot I",
	["PlantData"] = {
		["GrowTickTime"] = NumberRange.new(6, 8),
		["GrowRate"] = 0.025,
		["PlantDown"] = 0
	}
}
v_u_5["Evo Beetroot I"] = v237
local v238 = {
	["PlantName"] = "Evo Beetroot II",
	["PlantData"] = {
		["GrowTickTime"] = NumberRange.new(6, 8),
		["GrowRate"] = 0.009,
		["PlantDown"] = 0
	}
}
v_u_5["Evo Beetroot II"] = v238
local v239 = {
	["PlantName"] = "Evo Beetroot III",
	["PlantData"] = {
		["GrowTickTime"] = NumberRange.new(6, 8),
		["GrowRate"] = 0.0045,
		["PlantDown"] = 0
	}
}
v_u_5["Evo Beetroot III"] = v239
local v240 = {
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
v_u_5["Evo Beetroot IV"] = v240
local v241 = {
	["PlantName"] = "Evo Blueberry I",
	["PlantData"] = {
		["GrowTickTime"] = NumberRange.new(6, 8),
		["GrowRate"] = 0.032,
		["PlantDown"] = 0
	}
}
v_u_5["Evo Blueberry I"] = v241
local v242 = {
	["PlantName"] = "Evo Blueberry II",
	["PlantData"] = {
		["GrowTickTime"] = NumberRange.new(6, 8),
		["GrowRate"] = 0.0096,
		["PlantDown"] = 0
	}
}
v_u_5["Evo Blueberry II"] = v242
local v243 = {
	["PlantName"] = "Evo Blueberry III",
	["PlantData"] = {
		["GrowTickTime"] = NumberRange.new(6, 8),
		["GrowRate"] = 0.0032,
		["PlantDown"] = 0
	}
}
v_u_5["Evo Blueberry III"] = v243
local v244 = {
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
v_u_5["Evo Blueberry IV"] = v244
local v245 = {
	["PlantName"] = "Evo Pumpkin I",
	["PlantData"] = {
		["GrowTickTime"] = NumberRange.new(6, 8),
		["GrowRate"] = 0.01,
		["PlantDown"] = 0
	}
}
v_u_5["Evo Pumpkin I"] = v245
local v246 = {
	["PlantName"] = "Evo Pumpkin II",
	["PlantData"] = {
		["GrowTickTime"] = NumberRange.new(6, 8),
		["GrowRate"] = 0.005,
		["PlantDown"] = 0
	}
}
v_u_5["Evo Pumpkin II"] = v246
local v247 = {
	["PlantName"] = "Evo Pumpkin III",
	["PlantData"] = {
		["GrowTickTime"] = NumberRange.new(6, 8),
		["GrowRate"] = 0.0015,
		["PlantDown"] = 0
	}
}
v_u_5["Evo Pumpkin III"] = v247
local v248 = {
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
v_u_5["Evo Pumpkin IV"] = v248
local v249 = {
	["PlantName"] = "Evo Mushroom I",
	["PlantData"] = {
		["GrowTickTime"] = NumberRange.new(6, 8),
		["GrowRate"] = 0.009,
		["PlantDown"] = 0
	}
}
v_u_5["Evo Mushroom I"] = v249
local v250 = {
	["PlantName"] = "Evo Mushroom II",
	["PlantData"] = {
		["GrowTickTime"] = NumberRange.new(6, 8),
		["GrowRate"] = 0.0035,
		["PlantDown"] = 0
	}
}
v_u_5["Evo Mushroom II"] = v250
local v251 = {
	["PlantName"] = "Evo Mushroom III",
	["PlantData"] = {
		["GrowTickTime"] = NumberRange.new(6, 8),
		["GrowRate"] = 0.0017,
		["PlantDown"] = 0
	}
}
v_u_5["Evo Mushroom III"] = v251
local v252 = {
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
v_u_5["Evo Mushroom IV"] = v252
local v253 = {
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
v_u_5["Evo Apple I"] = v253
local v254 = {
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
v_u_5["Evo Apple II"] = v254
local v255 = {
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
v_u_5["Evo Apple III"] = v255
local v256 = {
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
v_u_5["Evo Apple IV"] = v256
local v257 = {
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
v_u_5.Hazelnut = v257
local v258 = {
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
v_u_5.Persimmon = v258
local v259 = {
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
v_u_5.Acorn = v259
local v260 = {
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
v_u_5["Acorn Squash"] = v260
local v261 = {
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
v_u_5.Ferntail = v261
local v262 = {
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
v_u_5.Pecan = v262
local v263 = {
	["PlantName"] = "Fissure Berry",
	["PlantData"] = {
		["GrowTickTime"] = NumberRange.new(15, 18),
		["GrowRate"] = 0.5,
		["PlantDown"] = 0
	}
}
v_u_5["Fissure Berry"] = v263
local v264 = {
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
v_u_5["Bloodred Mushroom"] = v264
local v265 = {
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
v_u_5["Jack O Lantern"] = v265
local v266 = {
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
v_u_5["Ghoul Root"] = v266
local v267 = {
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
v_u_5["Chicken Feed"] = v267
local v268 = {
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
v_u_5["Seer Vine"] = v268
local v269 = {
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
v_u_5["Poison Apple"] = v269
local v270 = {
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
v_u_5["Alien Apple"] = v270
local v271 = {
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
v_u_5.Banesberry = v271
local v272 = {
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
v_u_5["Candy Cornflower"] = v272
local v273 = {
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
v_u_5["Blood Orange"] = v273
local v274 = {
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
v_u_5["Zombie Fruit"] = v274
local v275 = {
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
v_u_5["Wisp Flower"] = v275
local v276 = {
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
v_u_5["Mummy\'s Hand"] = v276
local v277 = {
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
v_u_5["Weeping Branch"] = v277
local v278 = {
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
v_u_5["Ghost Bush"] = v278
local v279 = {
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
v_u_5.Devilroot = v279
local v280 = {
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
v_u_5.Wereplant = v280
local v281 = {
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
v_u_5["Severed Spine"] = v281
local v282 = {
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
v_u_5["Glass Kiwi"] = v282
local v283 = {
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
v_u_5["Spider Vine"] = v283
local v284 = {
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
v_u_5["Monster Flower"] = v284
local v285 = {
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
v_u_5["Horned Redrose"] = v285
local v286 = {
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
v_u_5["Banana Orchid"] = v286
local v287 = {
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
v_u_5["Viburnum Berry"] = v287
local v288 = {
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
v_u_5["Buddhas Hand"] = v288
local v289 = {
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
v_u_5["Ghost Pepper"] = v289
local v290 = {
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
v_u_5.Mahogany = v290
local v291 = {
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
v_u_5.Thornspire = v291
local v292 = {
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
v_u_5.Wyrmvine = v292
local v293 = {
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
v_u_5["Orange Delight"] = v293
local v294 = {
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
v_u_5.Protea = v294
local v295 = {
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
v_u_5.Baobab = v295
local v296 = {
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
v_u_5.Daisy = v296
local v297 = {
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
v_u_5["Bamboo Tree"] = v297
local v298 = {
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
v_u_5["Amberfruit Shrub"] = v298
local v299 = {
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
v_u_5["Castor Bean"] = v299
local v300 = {
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
v_u_5["Java Banana"] = v300
local v301 = {
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
v_u_5["Peacock Tail"] = v301
local v302 = {
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
v_u_5["Gem Fruit"] = v302
local v303 = {
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
v_u_5.Coilvine = v303
local v304 = {
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
v_u_5.Asteris = v304
local v305 = {
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
v_u_5["Lumin Bloom"] = v305
local v306 = {
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
v_u_5["Luna Stem"] = v306
local v307 = {
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
v_u_5.Zucchini = v307
local v308 = {
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
v_u_5.Olive = v308
local v309 = {
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
v_u_5["Hollow Bamboo"] = v309
local v310 = {
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
v_u_5.Yarrow = v310
local v311 = {
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
v_u_5.Pomegranate = v311
local v312 = {
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
v_u_5["Wild Pineapple"] = v312
local v313 = {
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
v_u_5.Coinfruit = v313
local v314 = {
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
v_u_5.Sherrybloom = v314
local v315 = {
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
v_u_5["Pinkside Dandelion"] = v315
local v316 = {
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
v_u_5["Gingerbread Blossom"] = v316
local v317 = {
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
v_u_5["Heart Blossom"] = v317
local v318 = {
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
v_u_5["Cookie Stack"] = v318
local v319 = {
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
v_u_5.Poinsettia = v319
local v320 = {
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
v_u_5.Antlerbloom = v320
local v321 = {
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
v_u_5["Holly Berry"] = v321
local v322 = {
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
v_u_5["Gift Berry"] = v322
local v323 = {
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
v_u_5["Frosty Bite"] = v323
local v324 = {
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
v_u_5["Cryo Rose"] = v324
local v325 = {
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
v_u_5["Bush Flake"] = v325
local v326 = {
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
v_u_5.Rosemary = v326
local v327 = {
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
v_u_5.Cryoshard = v327
local v328 = {
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
v_u_5.Frostwing = v328
local v329 = {
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
v_u_5["Pollen Cone"] = v329
local v330 = {
	["PlantName"] = "Peppermint Pop",
	["PlantData"] = {
		["GrowTickTime"] = NumberRange.new(1, 1),
		["GrowRate"] = 0.1,
		["PlantDown"] = 0
	}
}
v_u_5["Peppermint Pop"] = v330
local v331 = {
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
v_u_5.Gumdrop = v331
local v332 = {
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
v_u_5["Christmas Cracker"] = v332
local v333 = {
	["PlantName"] = "Candy Cane",
	["PlantData"] = {
		["GrowTickTime"] = NumberRange.new(6, 8),
		["GrowRate"] = 0.1,
		["PlantDown"] = 0
	}
}
v_u_5["Candy Cane"] = v333
local v334 = {
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
v_u_5["Snowman Sprout"] = v334
local v335 = {
	["PlantName"] = "Christmas Tree",
	["PlantData"] = {
		["GrowTickTime"] = NumberRange.new(5, 5),
		["GrowRate"] = 1,
		["PlantDown"] = 0
	}
}
v_u_5["Christmas Tree"] = v335
local v336 = {
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
v_u_5["Sparkle Slice"] = v336
local v337 = {
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
v_u_5["Colorpop Crop"] = v337
local v338 = {
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
v_u_5["Firework Fern"] = v338
local v339 = {
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
v_u_5["Kernel Curl"] = v339
local v340 = {
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
v_u_5["Bonanza Bloom"] = v340
local v341 = {
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
v_u_5.Shimmersprout = v341
local v342 = {
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
v_u_5["Crimson Cranberry"] = v342
local v343 = {
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
v_u_5["Confetti Tula"] = v343
local v344 = {
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
v_u_5.Hexberry = v344
local v345 = {
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
v_u_5.Peanut = v345
local v346 = {
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
v_u_5["Yellow Core"] = v346
local v347 = {
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
v_u_5.Crunchnut = v347
local v348 = {
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
v_u_5.Candlite = v348
local v349 = {
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
v_u_5["Frost Pepper"] = v349
local v350 = {
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
v_u_5.Plumwillow = v350
local v351 = {
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
v_u_5["Blooming Cactus"] = v351
local v352 = {
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
v_u_5["Madcrown Vine"] = v352
local v353 = {
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
v_u_5["Magma Pepper"] = v353
local v354 = {
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
v_u_5["Dragon Sapling"] = v354
local v355 = {
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
v_u_5.Sinisterdrip = v355
local v356 = {
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
v_u_5["Log Pumpkin"] = v356
local v357 = {
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
v_u_5["Aura Flora"] = v357
local v358 = {
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
v_u_5["Mutant Carrot"] = v358
local v359 = {
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
v_u_5["King Palm"] = v359
local v360 = {
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
v_u_5.Spectralis = v360
local v361 = {
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
v_u_5["Spirit Lantern"] = v361
local v362 = {
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
v_u_5["Aurora Vine"] = v362
local v363 = {
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
v_u_5["Snaparino Beanarini"] = v363
local v364 = {
	["PlantName"] = "Fennel",
	["PlantData"] = {
		["GrowTickTime"] = NumberRange.new(1.6, 2.4),
		["GrowRate"] = 0.02,
		["PlantDown"] = 0
	}
}
v_u_5.Fennel = v364
local v365 = {
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
v_u_5["Melon Flower"] = v365
local v366 = {
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
v_u_5.Frostspike = v366
local v367 = {
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
v_u_5.Torchflare = v367
local v368 = {
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
v_u_5.Gooseberry = v368
local v369 = {
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
v_u_5.Speargrass = v369
local v370 = {
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
v_u_5["Fall Berry"] = v370
local v371 = {
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
v_u_5.Firewell = v371
local v372 = {
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
v_u_5["Auburn Pine"] = v372
local v373 = {
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
v_u_5["Autumn Shroom"] = v373
local v374 = {
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
v_u_5["Black Magic Ears"] = v374
local v375 = {
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
v_u_5.Helenium = v375
local v376 = {
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
v_u_5.Jelpod = v376
local v377 = {
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
v_u_5["Filbert Nut"] = v377
local v378 = {
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
v_u_5["Wild Berry"] = v378
local v379 = {
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
v_u_5["Turkish Hazel"] = v379
local v380 = {
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
v_u_5.Cherry = v380
local v381 = {
	["PlantName"] = "Mini Pumpkin",
	["PlantData"] = {
		["GrowTickTime"] = NumberRange.new(0.7, 0.8),
		["GrowFruitTime"] = NumberRange.new(0.12, 0.16),
		["GrowRate"] = 0.11,
		["PlantDown"] = 0
	},
	["FruitData"] = {
		["GrowTickTime"] = NumberRange.new(0.25, 0.3),
		["GrowRate"] = 0.11,
		["PlantDown"] = 0
	}
}
v_u_5["Mini Pumpkin"] = v381
local v382 = {
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
v_u_5["Witch Cap"] = v382
local v383 = {
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
v_u_5["Skull Flower"] = v383
local v384 = {
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
v_u_5["Mind Root"] = v384
local v385 = {
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
v_u_5.Vampbloom = v385
local v386 = {
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
v_u_5.Sugarcane = v386
local v387 = {
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
v_u_5["Queen Fruit"] = v387
local v388 = {
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
v_u_5["Crassula Umbrella"] = v388
local v389 = {
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
v_u_5.Faestar = v389
local v390 = {
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
v_u_5["Madras Thorn"] = v390
local v391 = {
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
v_u_5["Aqua Lily"] = v391
local v392 = {
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
v_u_5.Akebi = v392
local v393 = {
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
v_u_5.Observee = v393
local v394 = {
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
v_u_5["Crown Pumpkin"] = v394
local v395 = {
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
v_u_5.Cyberflare = v395
local v396 = {
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
v_u_5.Rambutan = v396
local v397 = {
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
v_u_5["Strange Man\'s Wheat"] = v397
local v398 = {
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
v_u_5.Walnut = v398
local v399 = {
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
v_u_5["Leifo Fruit"] = v399
local v400 = {
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
v_u_5["Festive Bamboo"] = v400
local v401 = {
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
v_u_5.Iciclesco = v401
local v402 = {
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
v_u_5.Icestalite = v402
local v403 = {
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
v_u_5["Frost Bush"] = v403
local v404 = {
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
v_u_5["Grand Cucumber"] = v404
local v405 = {
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
v_u_5["Mauve Fruit"] = v405
local v406 = {
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
v_u_5.Archling = v406
local v407 = {
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
v_u_5["Cold Snap Suckle"] = v407
local v408 = {
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
v_u_5["Monster Plum"] = v408
local v409 = {
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
v_u_5["Gift Root"] = v409
local v410 = {
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
v_u_5["Mammoth Mistletoe"] = v410
local v411 = {
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
v_u_5["Frostline Flake"] = v411
local v412 = {
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
v_u_5["Wild Frond"] = v412
local v413 = {
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
v_u_5["Peach Sun"] = v413
local v414 = {
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
v_u_5.Wintercreep = v414
local v415 = {
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
v_u_5["Milk Table"] = v415
local v416 = {
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
v_u_5["Ornament Vine"] = v416
local v417 = {
	["PlantName"] = "Frost Fern",
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
v_u_5["Frost Fern"] = v417
local v418 = {
	["PlantName"] = "Saskia",
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
v_u_5.Saskia = v418
local v419 = {
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
v_u_5.Tinsel = v419
local v420 = {
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
v_u_5["Wreath Span"] = v420
local v421 = {
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
v_u_5["New Years Tinsel"] = v421
local v422 = {
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
v_u_5["Taffy Tree"] = v422
local v423 = {
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
v_u_5["Star Palm"] = v423
local v424 = {
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
v_u_5["Heart Gem"] = v424
local v425 = {
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
v_u_5["Witches Hair"] = v425
local v426 = {
	["PlantName"] = "Purple Treeshroom",
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
v_u_5["Purple Treeshroom"] = v426
local v427 = {
	["PlantName"] = "Amazon Feather Fern",
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
v_u_5["Amazon Feather Fern"] = v427
local v428 = {
	["PlantName"] = "Jungle Cherry",
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
v_u_5["Jungle Cherry"] = v428
local v429 = {
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
v_u_5.Luminova = v429
function v2.GetDataForWeather(_, p430)
	-- upvalues: (copy) v_u_3, (copy) v_u_1
	if not p430 or type(p430) ~= "string" then
		warn("GrowableData:GetDataForWeather | weatherName is not applicable!")
		return v_u_3.Default
	end
	local v431 = v_u_3[p430]
	if v431 then
		return v431
	end
	if v_u_1:IsStudio() then
		warn("GrowableData:GetDataForWeather | weatherData is nil! Using Default", p430)
	end
	return v_u_3.Default
end
function v2.GetDataForPlant(_, p432)
	-- upvalues: (copy) v_u_5
	if not p432 then
		warn((("GrowableData:GetDataForPlan | %* is not a valid plant!"):format(not p432 and "nil" or p432.Name)))
		return nil
	end
	local v433 = p432.Parent and (p432.Parent.Name == "Fruits" or p432.Parent.Name == "Fruit_Spawn") and true or false
	local v434 = p432:FindFirstChild("Fruit_Spawn") and true or false
	local v435 = v_u_5[p432.Name]
	if not v435 then
		warn((("GrowableData:GetDataForPlan | No GrowData for %*!"):format(p432.Name)))
		return nil
	end
	local v436 = nil
	if v433 and v435.FruitData then
		v436 = v435.FruitData
	elseif v435.PlantData then
		v436 = v435.PlantData
	end
	if not v436 then
		warn((("GrowableData:GetDataForPlan | %* has no PlantData or FruitData!"):format(p432.Name)))
		return nil
	end
	if not v436.GrowTickTime then
		warn((("GrowableData:GetDataForPlan | %* has no GrowTickTime!"):format(p432.Name)))
		return nil
	end
	if not v436.GrowRate then
		warn((("GrowableData:GetDataForPlan | %* has no GrowRate!"):format(p432.Name)))
		return nil
	end
	if v436.PlantDown == nil then
		warn((("GrowableData:GetDataForPlant | %* has no PlantDown!"):format(p432.Name)))
		return nil
	end
	if not v434 or v436.GrowFruitTime then
		return v436
	end
	print(v436)
	warn((("GrowableData:GetDataForPlan | %* has no GrowFruitTime!"):format(p432.Name)))
	return nil
end
function v2.GetAllPlantData(_)
	-- upvalues: (copy) v_u_5
	return v_u_5
end
local function v445()
	-- upvalues: (copy) v_u_5
	local v437 = game:GetService("ServerStorage")
	local v438 = v437:WaitForChild("Collectables")
	local v439 = v437:WaitForChild("Fruit_Spawn")
	local v440 = 0
	for _, v441 in pairs(v438:GetChildren()) do
		local v442 = v441.Name
		if v_u_5[v442] then
			if not (v_u_5[v442].PlantData and v_u_5[v442].PlantData.GrowTickTime) then
				warn("Missing GrowTickTime for plant: ", v441)
				v440 = v440 + 1
			end
			if not (v_u_5[v442].PlantData and v_u_5[v442].PlantData.GrowRate) then
				warn("Missing required GrowRate for plant: ", v441)
				v440 = v440 + 1
			end
			if not v_u_5[v442].PlantData.PlantDown then
				warn("Missing required PlantDown for plant: ", v441)
				v440 = v440 + 1
			end
			if v439:FindFirstChild(v442) then
				if not v_u_5[v442].PlantData.GrowFruitTime then
					warn("Missing GrowFruitTime for plant with fruit: ", v441)
					v440 = v440 + 1
				end
				if not (v_u_5[v442].FruitData and v_u_5[v442].FruitData.GrowTickTime) then
					warn("Missing FruitData.GrowTickTime for fruit: ", v441)
					v440 = v440 + 1
				end
				if not (v_u_5[v442].FruitData and v_u_5[v442].FruitData.GrowRate) then
					warn("Missing required FruitData.GrowRate for fruit: ", v441)
					v440 = v440 + 1
				end
			end
		else
			warn("Missing plant entry: ", v441)
			v440 = v440 + 1
		end
	end
	for _, v443 in pairs(v439:GetChildren()) do
		local v444 = v443.Name
		if v_u_5[v444] then
			if v_u_5[v444].FruitData then
				if v_u_5[v444].FruitData and not v_u_5[v444].FruitData.PlantDown then
					warn("Missing required PlantDown for fruit: ", v443)
					v440 = v440 + 1
				end
			else
				warn("Missing FruitData for fruit: ", v443)
				v440 = v440 + 1
			end
		else
			warn("Missing plant entry for fruit: ", v443)
			v440 = v440 + 1
		end
	end
	local _ = 0 < v440
	return v440 == 0
end
if v_u_1:IsStudio() and v_u_1:IsServer() then
	v445()
end
return v2