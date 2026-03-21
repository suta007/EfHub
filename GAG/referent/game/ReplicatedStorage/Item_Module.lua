local v_u_1 = require(game.ReplicatedStorage.Modules.StringUtils)
local v2 = {}
local v_u_3 = {
	{ "Normal", 1000, 1 },
	{ "Silver", -1, 5 },
	{ "Gold", 10, 20 },
	{ "Rainbow", 1, 50 },
	{ "Diamond", -1, 50 }
}
v2.VariantNames = {}
local v_u_4 = {
	{
		"Carrot",
		0.275,
		20,
		100
	},
	{
		"Strawberry",
		0.3,
		15,
		100
	},
	{
		"Blueberry",
		0.2,
		20,
		100
	},
	{
		"Orange Tulip",
		0.05,
		850,
		55
	},
	{
		"Buttercup",
		0.2,
		600,
		55
	},
	{
		"Big Buttercup",
		7,
		10000,
		700
	},
	{
		"Bigger Buttercup",
		15,
		200000,
		700
	},
	{
		"Biggest Buttercup",
		34,
		400000,
		700
	},
	{
		"Beast Buttercup",
		50,
		3000000,
		700
	},
	{
		"Shadow Buttercup",
		0.2,
		600,
		55
	},
	{
		"Big Shadow Buttercup",
		7,
		10000,
		700
	},
	{
		"Bigger Shadow Buttercup",
		15,
		200000,
		700
	},
	{
		"Biggest Shadow Buttercup",
		34,
		400000,
		700
	},
	{
		"Beast Shadow Buttercup",
		50,
		3000000,
		700
	},
	{
		"Tomato",
		0.5,
		30,
		100
	},
	{
		"Corn",
		2,
		40,
		100
	},
	{
		"Daffodil",
		0.2,
		1000,
		45
	},
	{
		"Watermelon",
		7,
		3000,
		70
	},
	{
		"Pumpkin",
		8,
		3400,
		80
	},
	{
		"Apple",
		3,
		275,
		50
	},
	{
		"Bamboo",
		4,
		4000,
		35
	},
	{
		"Coconut",
		14,
		400,
		70
	},
	{
		"Cactus",
		7,
		3400,
		100
	},
	{
		"Dragon Fruit",
		12,
		4750,
		100
	},
	{
		"Mango",
		15,
		6500,
		200
	},
	{
		"Grape",
		3,
		7850,
		200
	},
	{
		"Mushroom",
		25,
		151000,
		220
	},
	{
		"Pepper",
		5,
		8000,
		200
	},
	{
		"Cacao",
		8,
		12000,
		250
	},
	{
		"Sunflower",
		9,
		55555,
		255
	},
	{
		"Beanstalk",
		10,
		28000,
		300
	},
	{
		"Coolcool Beanbeanstalk",
		5,
		28000,
		300
	},
	{
		"Ember Lily",
		12,
		66666,
		450
	},
	{
		"Sugar Apple",
		9,
		48000,
		200
	},
	{
		"Burning Bud",
		12,
		70000,
		500
	},
	{
		"Giant Pinecone",
		5,
		72000,
		375
	},
	{
		"Elder Strawberry",
		6,
		90000,
		280
	},
	{
		"Romanesco",
		8,
		166000,
		160
	},
	{
		"Crimson Thorn",
		6,
		210000,
		400
	},
	{
		"Zebrazinkle",
		11,
		260000,
		700
	},
	{
		"Octobloom",
		5,
		288888,
		444
	},
	{
		"Great Pumpkin",
		20,
		180000,
		250
	},
	{
		"Trinity Fruit",
		5,
		155555,
		250
	},
	{
		"Four Leaf Clover",
		3,
		70000,
		250
	},
	{
		"Peppermint Vine",
		3.5,
		177777,
		250
	},
	{
		"Reindeer Root",
		8,
		150000,
		300
	},
	{
		"Spirit Sparkle",
		7,
		200000,
		400
	},
	{
		"Broccoli",
		4,
		55555,
		100
	},
	{
		"Potato",
		4,
		90000,
		150
	},
	{
		"Brussels Sprout",
		3,
		120000,
		150
	},
	{
		"Cocomango",
		15,
		180000,
		200
	},
	{
		"Cauliflower",
		5,
		50,
		150
	},
	{
		"Rafflesia",
		8,
		3500,
		80
	},
	{
		"Green Apple",
		3,
		300,
		200
	},
	{
		"Avocado",
		6.5,
		350,
		300
	},
	{
		"Banana",
		1.5,
		2000,
		100
	},
	{
		"Pineapple",
		3,
		2000,
		70
	},
	{
		"Kiwi",
		5,
		2750,
		300
	},
	{
		"Bell Pepper",
		8,
		5500,
		325
	},
	{
		"Prickly Pear",
		7,
		7000,
		375
	},
	{
		"Loquat",
		6.5,
		8000,
		200
	},
	{
		"Pitcher Plant",
		12,
		52000,
		275
	},
	{
		"Feijoa",
		10,
		13000,
		400
	},
	{
		"Wild Carrot",
		1.3,
		25000,
		100
	},
	{
		"Pear",
		3,
		20000,
		120
	},
	{
		"Cantaloupe",
		5.5,
		34000,
		250
	},
	{
		"Parasol Flower",
		6,
		200000,
		350
	},
	{
		"Rosy Delight",
		10,
		69000,
		450
	},
	{
		"Elephant Ears",
		18,
		77000,
		500
	},
	{
		"Delphinium",
		0.3,
		24000,
		100
	},
	{
		"Lily of the Valley",
		6,
		49120,
		400
	},
	{
		"Traveler\'s Fruit",
		15,
		59000,
		500
	},
	{
		"Peace Lily",
		0.6,
		24000,
		100
	},
	{
		"Aloe Vera",
		5.5,
		69000,
		350
	},
	{
		"Guanabana",
		4,
		70500,
		400
	},
	{
		"Chocolate Carrot",
		0.275,
		11000,
		100
	},
	{
		"Red Lollipop",
		4,
		50000,
		65
	},
	{
		"Blue Lollipop",
		1,
		50000,
		65
	},
	{
		"Candy Sunflower",
		1.5,
		80000,
		85
	},
	{
		"Easter Egg",
		3,
		2500,
		20
	},
	{
		"Candy Blossom",
		3,
		100000,
		40
	},
	{
		"Peach",
		2,
		300,
		70
	},
	{
		"Raspberry",
		0.75,
		100,
		70
	},
	{
		"Papaya",
		3,
		1000,
		60
	},
	{
		"Banana",
		1.5,
		1750,
		100
	},
	{
		"Passionfruit",
		3,
		3550,
		40
	},
	{
		"Soul Fruit",
		25,
		7750,
		200
	},
	{
		"Cursed Fruit",
		30,
		25750,
		200
	},
	{
		"Cranberry",
		1,
		3500,
		50
	},
	{
		"Durian",
		8,
		7500,
		200
	},
	{
		"Eggplant",
		5,
		12000,
		220
	},
	{
		"Lotus",
		20,
		35000,
		650
	},
	{
		"Venus Fly Trap",
		10,
		85000,
		650
	},
	{
		"Nightshade",
		0.5,
		3500,
		100
	},
	{
		"Glowshroom",
		0.75,
		300,
		100
	},
	{
		"Mint",
		1,
		5250,
		150
	},
	{
		"Moonflower",
		2,
		9500,
		200
	},
	{
		"Starfruit",
		3,
		15000,
		250
	},
	{
		"Moonglow",
		7,
		25000,
		400
	},
	{
		"Moon Blossom",
		3,
		66666,
		400
	},
	{
		"Crimson Vine",
		1,
		1250,
		100
	},
	{
		"Moon Melon",
		8,
		18000,
		300
	},
	{
		"Blood Banana",
		1.5,
		6000,
		200
	},
	{
		"Celestiberry",
		2,
		10000,
		200
	},
	{
		"Moon Mango",
		15,
		50000,
		300
	},
	{
		"Rose",
		1,
		5000,
		100
	},
	{
		"Foxglove",
		2,
		20000,
		250
	},
	{
		"Lilac",
		3,
		35000,
		250
	},
	{
		"Pink Lily",
		6,
		65000,
		400
	},
	{
		"Purple Dahlia",
		12,
		75000,
		400
	},
	{
		"Legacy Sunflower",
		16.5,
		160000,
		600
	},
	{
		"Lavender",
		0.275,
		25000,
		90
	},
	{
		"Nectarshade",
		0.8,
		50000,
		100
	},
	{
		"Nectarine",
		3,
		48000,
		200
	},
	{
		"Hive Fruit",
		8,
		62000,
		300
	},
	{
		"Manuka Flower",
		0.3,
		25000,
		200
	},
	{
		"Dandelion",
		4,
		50000,
		300
	},
	{
		"Lumira",
		6,
		85000,
		350
	},
	{
		"Honeysuckle",
		12,
		100000,
		400
	},
	{
		"Crocus",
		0.275,
		30000,
		150
	},
	{
		"Succulent",
		5,
		25000,
		175
	},
	{
		"Violet Corn",
		3,
		50000,
		250
	},
	{
		"Bendboo",
		18,
		155000,
		275
	},
	{
		"Cocovine",
		14,
		66666,
		275
	},
	{
		"Dragon Pepper",
		6,
		88888,
		300
	},
	{
		"Bee Balm",
		1,
		18000,
		200
	},
	{
		"Nectar Thorn",
		7,
		44444,
		350
	},
	{
		"Suncoil",
		10,
		80000,
		400
	},
	{
		"Liberty Lily",
		6.5,
		30000,
		350
	},
	{
		"Firework Flower",
		20,
		151000,
		450
	},
	{
		"Stonebite",
		1,
		35000,
		200
	},
	{
		"Paradise Petal",
		2.75,
		25000,
		250
	},
	{
		"Horned Dinoshroom",
		5,
		69000,
		275
	},
	{
		"Boneboo",
		15,
		141141,
		300
	},
	{
		"Firefly Fern",
		5,
		72000,
		400
	},
	{
		"Fossilight",
		4,
		88000,
		500
	},
	{
		"Bone Blossom",
		3,
		200000,
		40
	},
	{
		"Horsetail",
		3,
		30000,
		75
	},
	{
		"Lingonberry",
		0.5,
		35000,
		150
	},
	{
		"Amber Spine",
		6,
		55000,
		250
	},
	{
		"Grand Volcania",
		7,
		70555,
		400
	},
	{
		"Noble Flower",
		5,
		20000,
		250
	},
	{
		"Ice Cream Bean",
		4,
		4500,
		200
	},
	{
		"Lime",
		1,
		1000,
		125
	},
	{
		"White Mulberry",
		3,
		3000,
		200
	},
	{
		"Merica Mushroom",
		30,
		40000,
		20
	},
	{
		"Monoblooma",
		0.5,
		22000,
		150
	},
	{
		"Serenity",
		0.25,
		30000,
		150
	},
	{
		"Taro Flower",
		7,
		120000,
		300
	},
	{
		"Zen Rocks",
		18,
		150000,
		300
	},
	{
		"Hinomai",
		10,
		80000,
		400
	},
	{
		"Maple Apple",
		3.5,
		77777,
		350
	},
	{
		"Zenflare",
		1.4,
		25000,
		90
	},
	{
		"Sakura Bush",
		1.5,
		28575,
		90
	},
	{
		"Soft Sunshine",
		2,
		45000,
		200
	},
	{
		"Spiked Mango",
		15,
		67500,
		400
	},
	{
		"Enkaku",
		5,
		62000,
		200
	},
	{
		"Dezen",
		2,
		29250,
		40
	},
	{
		"Lucky Bamboo",
		5,
		65000,
		300
	},
	{
		"Tranquil Bloom",
		4,
		93333,
		120
	},
	{
		"Onion",
		1.5,
		10000,
		50
	},
	{
		"Jalapeno",
		4,
		30000,
		150
	},
	{
		"Crown Melon",
		4.5,
		50000,
		250
	},
	{
		"Sugarglaze",
		5,
		70000,
		300
	},
	{
		"Tall Asparagus",
		8,
		100000,
		400
	},
	{
		"Grand Tomato",
		8,
		88000,
		300
	},
	{
		"Artichoke",
		1.5,
		30000,
		75
	},
	{
		"Taco Fern",
		9,
		75000,
		80
	},
	{
		"Twisted Tangle",
		3,
		20000,
		80
	},
	{
		"Veinpetal",
		9,
		60000,
		70
	},
	{
		"Rhubarb",
		2,
		15000,
		80
	},
	{
		"Badlands Pepper",
		3.5,
		45000,
		125
	},
	{
		"King Cabbage",
		9,
		120000,
		400
	},
	{
		"Spring Onion",
		1.5,
		30000,
		75
	},
	{
		"Butternut Squash",
		5,
		35000,
		200
	},
	{
		"Pricklefruit",
		8,
		80000,
		300
	},
	{
		"Bitter Melon",
		3.5,
		77000,
		200
	},
	{
		"Golden Egg",
		8,
		250000,
		50
	},
	{
		"Flare Daisy",
		1.5,
		25000,
		125
	},
	{
		"Duskpuff",
		3,
		35000,
		150
	},
	{
		"Mangosteen",
		1.5,
		50000,
		150
	},
	{
		"Poseidon Plant",
		3,
		65555,
		400
	},
	{
		"Gleamroot",
		2.5,
		75000,
		200
	},
	{
		"Princess Thorn",
		12,
		111111,
		500
	},
	{
		"Mandrake",
		3,
		50000,
		80
	},
	{
		"Canary Melon",
		8,
		65000,
		300
	},
	{
		"Amberheart",
		4,
		175000,
		200
	},
	{
		"Crown of Thorns",
		0.85,
		25000,
		100
	},
	{
		"Calla Lily",
		8,
		67676,
		150
	},
	{
		"Cyclamen",
		9,
		95000,
		350
	},
	{
		"Glowpod",
		3,
		30000,
		200
	},
	{
		"Flare Melon",
		4,
		50000,
		200
	},
	{
		"Willowberry",
		4,
		73500,
		250
	},
	{
		"Sunbulb",
		3,
		20000,
		125
	},
	{
		"Glowthorn",
		3,
		35000,
		140
	},
	{
		"Lightshoot",
		2,
		40444,
		290
	},
	{
		"Briar Rose",
		7,
		75000,
		450
	},
	{
		"Pink Rose",
		7,
		120000,
		450
	},
	{
		"Spirit Flower",
		6,
		135000,
		500
	},
	{
		"Wispwing",
		10,
		180000,
		500
	},
	{
		"Aurora Vine",
		4.5,
		120000,
		100
	},
	{
		"Emerald Bud",
		5,
		25000,
		150
	},
	{
		"Pyracantha",
		4,
		42000,
		300
	},
	{
		"Aetherfruit",
		9,
		100000,
		200
	},
	{
		"Radish",
		2,
		40000,
		100
	},
	{
		"Blue Raspberry",
		0.75,
		45000,
		200
	},
	{
		"Horned Melon",
		3,
		66666,
		300
	},
	{
		"Ackee",
		1.5,
		88888,
		350
	},
	{
		"Urchin Plant",
		8,
		111111,
		400
	},
	{
		"Pixie Faern",
		3,
		30000,
		100
	},
	{
		"Untold Bell",
		3,
		94000,
		500
	},
	{
		"Turnip",
		2,
		12000,
		100
	},
	{
		"Parsley",
		2,
		20000,
		150
	},
	{
		"Meyer Lemon",
		1,
		32000,
		220
	},
	{
		"Carnival Pumpkin",
		5,
		48000,
		200
	},
	{
		"Kniphofia",
		7,
		110000,
		400
	},
	{
		"Golden Peach",
		2,
		88000,
		250
	},
	{
		"Maple Resin",
		2,
		190000,
		50
	},
	{
		"Mangrove",
		1.65,
		100000,
		400
	},
	{
		"Autumn Shroom",
		3,
		25000,
		150
	},
	{
		"Fall Berry",
		3,
		45222,
		155
	},
	{
		"Speargrass",
		3,
		51000,
		155
	},
	{
		"Torchflare",
		3,
		66250,
		400
	},
	{
		"Auburn Pine",
		2.5,
		73555,
		250
	},
	{
		"Firewell",
		4.5,
		112111,
		325
	},
	{
		"Sundew",
		2,
		40000,
		80
	},
	{
		"Black Bat Flower",
		1.75,
		70000,
		100
	},
	{
		"Mandrone Berry",
		2,
		65000,
		100
	},
	{
		"Corpse Flower",
		8,
		85000,
		150
	},
	{
		"Inferno Quince",
		3,
		130000,
		250
	},
	{
		"Multitrap",
		9,
		180000,
		320
	},
	{
		"Naval Wort",
		8,
		150000,
		200
	},
	{
		"Evo Beetroot I",
		1,
		25000,
		85
	},
	{
		"Evo Beetroot II",
		1.5,
		30000,
		135
	},
	{
		"Evo Beetroot III",
		2,
		35000,
		150
	},
	{
		"Evo Beetroot IV",
		6,
		50000,
		190
	},
	{
		"Evo Blueberry I",
		2,
		30000,
		85
	},
	{
		"Evo Blueberry II",
		5,
		35000,
		135
	},
	{
		"Evo Blueberry III",
		8,
		40000,
		150
	},
	{
		"Evo Blueberry IV",
		6,
		60000,
		250
	},
	{
		"Evo Pumpkin I",
		3,
		35000,
		85
	},
	{
		"Evo Pumpkin II",
		4,
		40000,
		135
	},
	{
		"Evo Pumpkin III",
		4,
		45000,
		150
	},
	{
		"Evo Pumpkin IV",
		8,
		70000,
		250
	},
	{
		"Evo Mushroom I",
		3,
		40000,
		85
	},
	{
		"Evo Mushroom II",
		5,
		45000,
		135
	},
	{
		"Evo Mushroom III",
		7,
		50000,
		150
	},
	{
		"Evo Mushroom IV",
		3,
		80000,
		250
	},
	{
		"Evo Apple I",
		0.75,
		60000,
		300
	},
	{
		"Evo Apple II",
		0.9,
		75000,
		280
	},
	{
		"Evo Apple III",
		1.4,
		90000,
		260
	},
	{
		"Evo Apple IV",
		4.65,
		165000,
		190
	},
	{
		"Hazelnut",
		2,
		25000,
		200
	},
	{
		"Persimmon",
		2,
		60000,
		250
	},
	{
		"Acorn",
		6,
		123123,
		90
	},
	{
		"Acorn Squash",
		3,
		15555,
		100
	},
	{
		"Ferntail",
		7,
		2000,
		400
	},
	{
		"Pecan",
		4.25,
		100000,
		300
	},
	{
		"Fissure Berry",
		4,
		13000,
		400
	},
	{
		"Bloodred Mushroom",
		3,
		22222,
		100
	},
	{
		"Jack O Lantern",
		4.5,
		33333,
		100
	},
	{
		"Ghoul Root",
		4,
		55555,
		150
	},
	{
		"Chicken Feed",
		6,
		77777,
		200
	},
	{
		"Seer Vine",
		2.75,
		88888,
		300
	},
	{
		"Poison Apple",
		3.75,
		111111,
		350
	},
	{
		"Alien Apple",
		5,
		1000000,
		350
	},
	{
		"Banesberry",
		2.5,
		33333,
		100
	},
	{
		"Candy Cornflower",
		1,
		44444,
		200
	},
	{
		"Blood Orange",
		3,
		140000,
		200
	},
	{
		"Zombie Fruit",
		3,
		60000,
		300
	},
	{
		"Wisp Flower",
		2,
		70000,
		250
	},
	{
		"Mummy\'s Hand",
		4.5,
		111111,
		300
	},
	{
		"Weeping Branch",
		8,
		155555,
		200
	},
	{
		"Ghost Bush",
		5,
		30500,
		150
	},
	{
		"Devilroot",
		3.5,
		66666,
		166
	},
	{
		"Wereplant",
		8,
		170000,
		400
	},
	{
		"Severed Spine",
		9,
		98980,
		300
	},
	{
		"Glass Kiwi",
		4,
		65000,
		250
	},
	{
		"Spider Vine",
		4,
		44444,
		333
	},
	{
		"Monster Flower",
		5.3,
		67666,
		350
	},
	{
		"Horned Redrose",
		1.33,
		18000,
		80
	},
	{
		"Banana Orchid",
		2,
		24000,
		110
	},
	{
		"Viburnum Berry",
		2,
		35000,
		140
	},
	{
		"Buddhas Hand",
		1.5,
		48000,
		180
	},
	{
		"Ghost Pepper",
		4,
		77777,
		220
	},
	{
		"Mahogany",
		4,
		77777,
		220
	},
	{
		"Thornspire",
		4.5,
		100000,
		300
	},
	{
		"Wyrmvine",
		7,
		120000,
		200
	},
	{
		"Orange Delight",
		2,
		25000,
		80
	},
	{
		"Protea",
		5,
		50000,
		200
	},
	{
		"Baobab",
		7,
		120000,
		300
	},
	{
		"Daisy",
		1.5,
		20000,
		80
	},
	{
		"Bamboo Tree",
		4,
		35000,
		120
	},
	{
		"Amberfruit Shrub",
		4,
		40444,
		160
	},
	{
		"Castor Bean",
		2,
		53333,
		200
	},
	{
		"Java Banana",
		3,
		92222,
		240
	},
	{
		"Peacock Tail",
		7,
		150000,
		300
	},
	{
		"Lumin Bloom",
		2,
		2000,
		100
	},
	{
		"Luna Stem",
		4,
		68700,
		325
	},
	{
		"Zucchini",
		3,
		144321,
		300
	},
	{
		"Olive",
		0.5,
		20000,
		120
	},
	{
		"Hollow Bamboo",
		5,
		120000,
		250
	},
	{
		"Yarrow",
		10,
		170000,
		400
	},
	{
		"Gem Fruit",
		4,
		45000,
		200
	},
	{
		"Coilvine",
		5,
		65000,
		250
	},
	{
		"Asteris",
		10,
		125000,
		350
	},
	{
		"Pomegranate",
		2,
		33333,
		100
	},
	{
		"Wild Pineapple",
		6,
		88888,
		200
	},
	{
		"Coinfruit",
		1,
		22222,
		100
	},
	{
		"Sherrybloom",
		4.25,
		80000,
		200
	},
	{
		"Pinkside Dandelion",
		6.5,
		177000,
		350
	},
	{
		"Cookie Stack",
		4.5,
		20000,
		100
	},
	{
		"Poinsettia",
		3,
		30000,
		150
	},
	{
		"Antlerbloom",
		2.5,
		55000,
		200
	},
	{
		"Holly Berry",
		2.5,
		100000,
		250
	},
	{
		"Gift Berry",
		2.3,
		188888,
		300
	},
	{
		"Gingerbread Blossom",
		3,
		250000,
		50
	},
	{
		"Heart Blossom",
		3,
		200000,
		100
	},
	{
		"Frosty Bite",
		0.5,
		25000,
		75
	},
	{
		"Cryo Rose",
		2.5,
		35000,
		100
	},
	{
		"Bush Flake",
		2,
		76000,
		150
	},
	{
		"Rosemary",
		2.5,
		98000,
		250
	},
	{
		"Cryoshard",
		5,
		124124,
		350
	},
	{
		"Frostwing",
		7,
		200000,
		400
	},
	{
		"Pollen Cone",
		4,
		120000,
		200
	},
	{
		"Peppermint Pop",
		2,
		25000,
		50
	},
	{
		"Gumdrop",
		2.5,
		65000,
		75
	},
	{
		"Christmas Cracker",
		3,
		120000,
		100
	},
	{
		"Candy Cane",
		2,
		150000,
		150
	},
	{
		"Snowman Sprout",
		3,
		165000,
		250
	},
	{
		"Christmas Tree",
		5,
		500000,
		1000000
	},
	{
		"Sparkle Slice",
		3,
		125000,
		300
	},
	{
		"Colorpop Crop",
		10,
		150000,
		350
	},
	{
		"Firework Fern",
		8.5,
		150000,
		400
	},
	{
		"Kernel Curl",
		2,
		80000,
		80
	},
	{
		"Bonanza Bloom",
		8.5,
		288888,
		350
	},
	{
		"Shimmersprout",
		1,
		10000,
		65
	},
	{
		"Crimson Cranberry",
		1,
		15000,
		135
	},
	{
		"Confetti Tula",
		2,
		20000,
		155
	},
	{
		"Hexberry",
		4,
		33333,
		180
	},
	{
		"Peanut",
		2,
		35000,
		180
	},
	{
		"Yellow Core",
		2,
		44440,
		180
	},
	{
		"Candlite",
		1.5,
		66666,
		220
	},
	{
		"Frost Pepper",
		3,
		88888,
		275
	},
	{
		"Plumwillow",
		3,
		111111,
		275
	},
	{
		"Blooming Cactus",
		9,
		120000,
		300
	},
	{
		"Madcrown Vine",
		4,
		156156,
		300
	},
	{
		"Magma Pepper",
		11,
		222222,
		166
	},
	{
		"Mega Mushroom",
		70,
		500,
		2000000
	},
	{
		"Cherry Blossom",
		3,
		500,
		400
	},
	{
		"Purple Cabbage",
		5,
		500,
		70
	},
	{
		"Lemon",
		1,
		350,
		50
	},
	{
		"Pink Tulip",
		0.05,
		850,
		55
	},
	{
		"Dragon Sapling",
		8,
		69000,
		275
	},
	{
		"Sinisterdrip",
		5,
		69000,
		275
	},
	{
		"Fruitball",
		6,
		35000,
		90
	},
	{
		"Log Pumpkin",
		10,
		18000,
		120
	},
	{
		"Aura Flora",
		2.9,
		29000,
		270
	},
	{
		"Mutant Carrot",
		10,
		18000,
		90
	},
	{
		"King Palm",
		6,
		15000,
		140
	},
	{
		"Willowberry",
		4,
		7500,
		140
	},
	{
		"Spectralis",
		3,
		7500,
		90
	},
	{
		"Spirit Lantern",
		10,
		7500,
		60
	},
	{
		"Snaparino Beanarini",
		4,
		35000,
		100
	},
	{
		"Fennel",
		12,
		50000,
		145
	},
	{
		"Frostspike",
		4,
		45000,
		250
	},
	{
		"Gooseberry",
		2,
		350,
		75
	},
	{
		"Black Magic Ears",
		18,
		77000,
		500
	},
	{
		"Helenium",
		15,
		129000,
		600
	},
	{
		"Jelpod",
		2,
		32500,
		250
	},
	{
		"Filbert Nut",
		2,
		32500,
		250
	},
	{
		"Melon Flower",
		2,
		32500,
		250
	},
	{
		"Wild Berry",
		2,
		2000,
		60
	},
	{
		"Turkish Hazel",
		4,
		2000,
		60
	},
	{
		"Crunchnut",
		3,
		2000,
		150
	},
	{
		"Cherry",
		1,
		28575,
		90
	},
	{
		"Mini Pumpkin",
		2,
		50000,
		120
	},
	{
		"Witch Cap",
		3,
		77777,
		120
	},
	{
		"Skull Flower",
		4,
		8000,
		120
	},
	{
		"Mind Root",
		3,
		8000,
		120
	},
	{
		"Vampbloom",
		4.75,
		4500,
		90
	},
	{
		"Sugarcane",
		5,
		4500,
		100
	},
	{
		"Queen Fruit",
		2,
		4500,
		100
	},
	{
		"Crassula Umbrella",
		3,
		4500,
		175
	},
	{
		"Faestar",
		3,
		4500,
		175
	},
	{
		"Madras Thorn",
		7,
		4000,
		150
	},
	{
		"Peach Sun",
		4,
		40500,
		175
	},
	{
		"Amberfruit Shrub",
		4,
		40500,
		175
	},
	{
		"Aqua Lily",
		12,
		20,
		110
	},
	{
		"Observee",
		12,
		20,
		110
	},
	{
		"Archling",
		12,
		20,
		2
	},
	{
		"Cold Snap Suckle",
		12,
		20,
		110
	},
	{
		"Monster Plum",
		12,
		20,
		110
	},
	{
		"Gift Root",
		1,
		20,
		110
	},
	{
		"Mammoth Mistletoe",
		0.3,
		20,
		110
	},
	{
		"Frostline Flake",
		2,
		20,
		110
	},
	{
		"Akebi",
		4,
		40500,
		175
	},
	{
		"Holly Berry",
		2.5,
		15000,
		120
	},
	{
		"Crown Pumpkin",
		5,
		15000,
		120
	},
	{
		"Cyberflare",
		5,
		15000,
		120
	},
	{
		"Rambutan",
		2,
		20,
		110
	},
	{
		"Strange Man\'s Wheat",
		2.5,
		4000,
		110
	},
	{
		"Walnut",
		4.5,
		5000,
		100
	},
	{
		"Leifo Fruit",
		4.5,
		5000,
		10
	},
	{
		"Festive Bamboo",
		1.5,
		45000,
		100
	},
	{
		"Iciclesco",
		8,
		166000,
		160
	},
	{
		"Icestalite",
		3.5,
		20000,
		160
	},
	{
		"Grand Cucumber",
		12,
		13500,
		300
	},
	{
		"Mauve Fruit",
		3,
		13500,
		100
	},
	{
		"Wild Frond",
		4,
		13500,
		100
	},
	{
		"Wintercreep",
		4,
		20000,
		100
	},
	{
		"Milk Table",
		2.5,
		20000,
		100
	},
	{
		"Ornament Vine",
		2.5,
		20000,
		100
	},
	{
		"Wreath Span",
		2,
		20000,
		100
	},
	{
		"Frost Fern",
		4.5,
		20000,
		100
	},
	{
		"Frost Bush",
		3,
		20000,
		120
	},
	{
		"Saskia",
		1.5,
		20000,
		100
	},
	{
		"Tinsel",
		6,
		20000,
		100
	},
	{
		"Heart Gem",
		3,
		37777,
		150
	},
	{
		"Taffy Tree",
		3,
		37777,
		150
	},
	{
		"New Years Tinsel",
		6,
		35000,
		180
	},
	{
		"Jungle Queen Bulb",
		10,
		35000,
		180
	},
	{
		"Star Palm",
		6,
		35000,
		180
	},
	{
		"Luminova",
		6,
		35000,
		180
	},
	{
		"Witches Hair",
		1.5,
		35000,
		180
	},
	{
		"Purple Treeshroom",
		3,
		35000,
		180
	},
	{
		"Amazon Feather Fern",
		1,
		35000,
		180
	},
	{
		"Jungle Cherry",
		3,
		35000,
		180
	}
}
for _, v5 in v_u_3 do
	local v6 = v2.VariantNames
	local v7 = v5[1]
	table.insert(v6, v7)
end
local v_u_8 = {
	{ "Common", Color3.new(0.666667, 0.666667, 0.666667) },
	{ "Uncommon", Color3.new(0.32549, 0.666667, 0.384314) },
	{ "Rare", Color3.new(0.027451, 0.466667, 1) },
	{ "Legendary", Color3.new(1, 1, 0) },
	{ "Mythical", Color3.new(0.666667, 0.333333, 1) },
	{ "Divine", Color3.fromRGB(255, 85, 0) },
	{ "Prismatic", Color3.fromHSV(0, 1, 1), true },
	{ "Transcendent", Color3.fromHSV(0.0973889, 1, 1), true }
}
local v_u_9 = {
	{
		"Carrot Seed",
		"Carrot",
		1.1,
		"Common",
		3248692171,
		10,
		5,
		3269339926
	},
	{
		"Strawberry Seed",
		"Strawberry",
		2,
		"Common",
		3248695947,
		50,
		3,
		3269339924
	},
	{
		"Tomato Seed",
		"Tomato",
		4,
		"Rare",
		3248696942,
		800,
		1,
		3269339929
	},
	{
		"Blueberry Seed",
		"Blueberry",
		3,
		"Uncommon",
		3248690960,
		400,
		3,
		3269339931
	},
	{
		"Orange Tulip Seed",
		"Orange Tulip",
		3,
		"Common",
		3265927408,
		100,
		0,
		3269339925
	},
	{
		"Corn Seed",
		"Corn",
		5,
		"Rare",
		3248692845,
		1300,
		0,
		3269339919
	},
	{
		"Pumpkin Seed",
		"Pumpkin",
		10,
		"Legendary",
		3248695199,
		3000,
		0,
		3269339934
	},
	{
		"Daffodil Seed",
		"Daffodil",
		10,
		"Common",
		3265927978,
		100,
		0,
		3269339921
	},
	{
		"Watermelon Seed",
		"Watermelon",
		7,
		"Legendary",
		3248697546,
		2500,
		0,
		3269339904
	},
	{
		"Apple Seed",
		"Apple",
		14,
		"Legendary",
		3248716238,
		3250,
		0,
		3269339923
	},
	{
		"Bamboo Seed",
		"Bamboo",
		3,
		"Uncommon",
		3261009117,
		4000,
		3,
		3269339922
	},
	{
		"Purple Cabbage Seed",
		"Purple Cabbage",
		40,
		"Mythical",
		3273005969,
		5250,
		0,
		3273008000
	},
	{
		"Coconut Seed",
		"Coconut",
		20,
		"Mythical",
		3248744789,
		4750,
		0,
		3269339918
	},
	{
		"Cactus Seed",
		"Cactus",
		100,
		"Legendary",
		3260940714,
		17000,
		0,
		3269339920
	},
	{
		"Eggplant Seed",
		"Eggplant",
		16,
		"Mythical",
		3273006109,
		30000,
		0,
		3273007733
	},
	{
		"Dragon Fruit Seed",
		"Dragon Fruit",
		40,
		"Mythical",
		3253012192,
		27000,
		0,
		3269339909
	},
	{
		"Mango Seed",
		"Mango",
		70,
		"Mythical",
		3259333414,
		50000,
		0,
		3269339912
	},
	{
		"Grape Seed",
		"Grape",
		20,
		"Mythical",
		3261068725,
		4750,
		0,
		3269339905
	},
	{
		"Pepper Seed",
		"Pepper",
		2,
		"Rare",
		3277675404,
		25000,
		3,
		3277675837
	},
	{
		"Cacao Seed",
		"Cacao",
		2,
		"Rare",
		3282870834,
		50,
		3,
		3282871246
	},
	{
		"Beanstalk Seed",
		"Beanstalk",
		2,
		"Rare",
		3284390402,
		50,
		3,
		3284390954
	},
	{
		"Coolcool Coolcool Beanbeanstalk Seed",
		"Coolcool Beanbeanstalk",
		2,
		"Rare",
		0,
		50,
		3,
		0
	},
	{
		"Burning Bud Seed",
		"Burning Bud",
		2,
		"Rare",
		3316826714,
		50,
		3,
		3316827012
	},
	{
		"Red Lollipop Seed",
		"Red Lollipop",
		1.5,
		"Rare",
		3268186603,
		100,
		0,
		nil
	},
	{
		"Blue Lollipop Seed",
		"Blue Lollipop",
		1.5,
		"Rare",
		3268186832,
		100,
		0,
		nil
	},
	{
		"Candy Sunflower Seed",
		"Candy Sunflower",
		1.5,
		"Legendary",
		3268187175,
		500,
		0,
		nil
	},
	{
		"Candy Blossom Seed",
		"Candy Blossom",
		10,
		"Divine",
		3268187638,
		8000,
		0,
		nil
	},
	{
		"Peach Seed",
		"Peach",
		10,
		"Rare",
		0,
		10000,
		0,
		nil
	},
	{
		"Raspberry Seed",
		"Raspberry",
		10,
		"Rare",
		0,
		10000,
		0,
		nil
	},
	{
		"Pineapple Seed",
		"Pineapple",
		10,
		"Rare",
		3312005774,
		10000,
		0,
		3312005892
	},
	{
		"Papaya Seed",
		"Papaya",
		10,
		"Rare",
		3265927598,
		10000,
		0,
		nil
	},
	{
		"Banana Seed",
		"Banana",
		10,
		"Rare",
		3269001250,
		8000,
		0,
		3312010696
	},
	{
		"Passionfruit Seed",
		"Passionfruit",
		10,
		"Rare",
		3265927598,
		10000,
		0,
		nil
	},
	{
		"Soul Fruit Seed",
		"Soul Fruit",
		10000000,
		"Robux",
		1,
		0,
		0,
		nil
	},
	{
		"Cursed Fruit Seed",
		"Cursed Fruit",
		10000000,
		"Robux",
		1,
		0,
		0,
		nil
	},
	{
		"Cranberry Seed",
		"Cranberry",
		10,
		"Rare",
		0,
		10000,
		0,
		nil
	},
	{
		"Durian Seed",
		"Durian",
		2,
		"Common",
		0,
		50,
		3,
		nil
	},
	{
		"Lotus Seed",
		"Lotus",
		2,
		"Common",
		0,
		50,
		3,
		nil
	},
	{
		"Venus Fly Trap Seed",
		"Venus Fly Trap",
		10,
		"Rare",
		0,
		10000,
		0,
		nil
	},
	{
		"Nightshade Seed",
		"Nightshade",
		2,
		"Rare",
		0,
		50,
		3,
		nil
	},
	{
		"Glowshroom Seed",
		"Glowshroom",
		2,
		"Rare",
		0,
		50,
		3,
		nil
	},
	{
		"Mint Seed",
		"Mint",
		2,
		"Rare",
		0,
		50,
		3,
		nil
	},
	{
		"Moonflower Seed",
		"Moonflower",
		2,
		"Rare",
		0,
		50,
		3,
		nil
	},
	{
		"Starfruit Seed",
		"Starfruit",
		2,
		"Rare",
		0,
		50,
		3,
		nil
	},
	{
		"Moonglow Seed",
		"Moonglow",
		2,
		"Rare",
		0,
		50,
		3,
		nil
	},
	{
		"Moon Blossom Seed",
		"Moon Blossom",
		2,
		"Rare",
		0,
		50,
		3,
		nil
	},
	{
		"Mega Mushroom Seed",
		"Mega Mushroom",
		10,
		"Divine",
		0,
		10000,
		0,
		nil
	},
	{
		"Mushroom Seed",
		"Mushroom",
		10,
		"Rare",
		3273973729,
		10000,
		0,
		3273973524
	},
	{
		"Succulent Seed",
		"Succulent",
		2,
		"Common",
		0,
		50,
		3,
		nil
	},
	{
		"Lemon Seed",
		"Lemon",
		4,
		"Rare",
		0,
		800,
		1,
		nil
	},
	{
		"Cherry Blossom Seed",
		"Cherry Blossom",
		2,
		"Common",
		0,
		50,
		3,
		nil
	},
	{
		"Avocado Seed",
		"Avocado",
		2,
		"Rare",
		3312011056,
		50,
		3,
		3312011436
	},
	{
		"Pink Tulip Seed",
		"Pink Tulip",
		15,
		"Common",
		3265927598,
		100,
		0,
		nil
	},
	{
		"Crocus Seed",
		"Crocus",
		10,
		"Common",
		3265927895,
		100,
		0,
		nil
	},
	{
		"Crimson Vine Seed",
		"Crimson Vine",
		10,
		"Common",
		3265927895,
		100,
		0,
		nil
	},
	{
		"Moon Melon Seed",
		"Moon Melon",
		10,
		"Common",
		3265927895,
		100,
		0,
		nil
	},
	{
		"Blood Banana Seed",
		"Blood Banana",
		10,
		"Common",
		3265927895,
		100,
		0,
		nil
	},
	{
		"Moon Mango Seed",
		"Moon Mango",
		10,
		"Common",
		3265927895,
		100,
		0,
		nil
	},
	{
		"Celestiberry Seed",
		"Celestiberry",
		10,
		"Common",
		3265927895,
		100,
		0,
		nil
	},
	{
		"Purple Dahlia Seed",
		"Purple Dahlia",
		10,
		"Common",
		0,
		100,
		0,
		nil
	},
	{
		"Pink Lily Seed",
		"Pink Lily",
		10,
		"Common",
		0,
		100,
		0,
		nil
	},
	{
		"Hive Fruit Seed",
		"Hive Fruit",
		10,
		"Common",
		3265927895,
		100,
		0,
		nil
	},
	{
		"Legacy Sunflower Seed",
		"Legacy Sunflower",
		10,
		"Common",
		0,
		100,
		0,
		nil
	},
	{
		"Rose Seed",
		"Rose",
		10,
		"Common",
		0,
		100,
		0,
		nil
	},
	{
		"Foxglove Seed",
		"Foxglove",
		10,
		"Common",
		0,
		100,
		0,
		nil
	},
	{
		"Bee Balm Seed",
		"Bee Balm",
		10,
		"Common",
		3265927895,
		100,
		0,
		nil
	},
	{
		"Noble Flower Seed",
		"Noble Flower",
		10,
		"Common",
		3265927895,
		100,
		0,
		nil
	},
	{
		"Honeysuckle Seed",
		"Honeysuckle",
		10,
		"Common",
		3265927895,
		100,
		0,
		nil
	},
	{
		"Nectar Thorn Seed",
		"Nectar Thorn",
		10,
		"Common",
		3265927895,
		100,
		0,
		nil
	},
	{
		"Elephant Ears Seed",
		"Elephant Ears",
		10,
		"Common",
		3265927895,
		100,
		0,
		nil
	},
	{
		"Horsetail Seed",
		"Horsetail",
		10,
		"Common",
		3265927895,
		100,
		0,
		nil
	},
	{
		"Traveler\'s Fruit Seed",
		"Traveler\'s Fruit",
		10,
		"Common",
		3265927895,
		100,
		0,
		nil
	},
	{
		"Dandelion Seed",
		"Dandelion",
		10,
		"Common",
		3265927895,
		100,
		0,
		nil
	},
	{
		"Manuka Flower Seed",
		"Manuka Flower",
		10,
		"Common",
		3265927895,
		100,
		0,
		nil
	},
	{
		"Delphinium Seed",
		"Delphinium",
		10,
		"Common",
		3265927895,
		100,
		0,
		nil
	},
	{
		"Peace Lily Seed",
		"Peace Lily",
		10,
		"Common",
		3265927895,
		100,
		0,
		nil
	},
	{
		"Bendboo Seed",
		"Bendboo",
		10,
		"Common",
		3265927895,
		100,
		0,
		nil
	},
	{
		"Violet Corn Seed",
		"Violet Corn",
		5,
		"Rare",
		0,
		1300,
		0,
		nil
	},
	{
		"Parasol Flower Seed",
		"Parasol Flower",
		10,
		"Common",
		3265927895,
		100,
		0,
		nil
	},
	{
		"Lavender Seed",
		"Lavender",
		10,
		"Common",
		3265927895,
		100,
		0,
		nil
	},
	{
		"Nectarine Seed",
		"Nectarine",
		10,
		"Common",
		3265927895,
		100,
		0,
		nil
	},
	{
		"Ember Lily Seed",
		"Ember Lily",
		10,
		"Common",
		3300984139,
		100,
		0,
		3300985820
	},
	{
		"Nectarshade Seed",
		"Nectarshade",
		10,
		"Common",
		3265927895,
		100,
		0,
		nil
	},
	{
		"Lumira Seed",
		"Lumira",
		10,
		"Common",
		3265927895,
		100,
		0,
		nil
	},
	{
		"Suncoil Seed",
		"Suncoil",
		10,
		"Common",
		3265927895,
		100,
		0,
		nil
	},
	{
		"Prickly Pear Seed",
		"Prickly Pear",
		10,
		"Common",
		3312013208,
		100,
		0,
		3312013360
	},
	{
		"Green Apple Seed",
		"Green Apple",
		10,
		"Legendary",
		3312008833,
		100,
		0,
		3312008995
	},
	{
		"Sugar Apple Seed",
		"Sugar Apple",
		10,
		"Legendary",
		3304968889,
		100,
		0,
		3304969010
	},
	{
		"Dragon Pepper Seed",
		"Dragon Pepper",
		10,
		"Legendary",
		0,
		100,
		0,
		0
	},
	{
		"Cocovine Seed",
		"Cocovine",
		10,
		"Legendary",
		0,
		100,
		0,
		0
	},
	{
		"Loquat Seed",
		"Loquat",
		10,
		"Legendary",
		3312014286,
		100,
		0,
		3312014416
	},
	{
		"Ice Cream Bean Seed",
		"Ice Cream Bean",
		10,
		"Legendary",
		0,
		100,
		0,
		0
	},
	{
		"Lime Seed",
		"Lime",
		10,
		"Legendary",
		0,
		100,
		0,
		0
	},
	{
		"Kiwi Seed",
		"Kiwi",
		10,
		"Legendary",
		3312011732,
		100,
		0,
		3312011920
	},
	{
		"Feijoa Seed",
		"Feijoa",
		10,
		"Legendary",
		3312013874,
		100,
		0,
		3312014052
	},
	{
		"Cantaloupe Seed",
		"Cantaloupe",
		10,
		"Legendary",
		0,
		100,
		0,
		0
	},
	{
		"Cauliflower Seed",
		"Cauliflower",
		10,
		"Legendary",
		3312007044,
		100,
		0,
		3312007405
	},
	{
		"Wild Carrot Seed",
		"Wild Carrot",
		10,
		"Legendary",
		0,
		100,
		0,
		0
	},
	{
		"Rosy Delight Seed",
		"Rosy Delight",
		10,
		"Divine",
		3265927895,
		100,
		0,
		nil
	},
	{
		"Bell Pepper Seed",
		"Bell Pepper",
		10,
		"Divine",
		3312012483,
		100,
		0,
		3312012716
	},
	{
		"Aloe Vera Seed",
		"Aloe Vera",
		10,
		"Legendary",
		0,
		100,
		0,
		0
	},
	{
		"Rafflesia Seed",
		"Rafflesia",
		10,
		"Legendary",
		3317729900,
		100,
		0,
		3317750415
	},
	{
		"White Mulberry Seed",
		"White Mulberry",
		10,
		"Legendary",
		0,
		100,
		0,
		0
	},
	{
		"Lily of the Valley Seed",
		"Lily of the Valley",
		10,
		"Divine",
		3265927895,
		100,
		0,
		nil
	},
	{
		"Guanabana Seed",
		"Guanabana",
		10,
		"Divine",
		3265927895,
		100,
		0,
		nil
	},
	{
		"Pitcher Plant Seed",
		"Pitcher Plant",
		10,
		"Legendary",
		3317730202,
		100,
		0,
		3317750224
	},
	{
		"Bone Blossom Seed",
		"Bone Blossom",
		10,
		"Transcendent",
		0,
		100,
		0,
		0
	},
	{
		"Stonebite Seed",
		"Stonebite",
		10,
		"Legendary",
		0,
		100,
		0,
		0
	},
	{
		"Firefly Fern Seed",
		"Firefly Fern",
		10,
		"Legendary",
		0,
		100,
		0,
		0
	},
	{
		"Horned Dinoshroom Seed",
		"Horned Dinoshroom",
		10,
		"Legendary",
		0,
		100,
		0,
		0
	},
	{
		"Grand Volcania Seed",
		"Grand Volcania",
		10,
		"Legendary",
		0,
		100,
		0,
		0
	},
	{
		"Paradise Petal Seed",
		"Paradise Petal",
		10,
		"Legendary",
		0,
		100,
		0,
		0
	},
	{
		"Boneboo Seed",
		"Boneboo",
		10,
		"Legendary",
		0,
		100,
		0,
		0
	},
	{
		"Merica Mushroom Seed",
		"Merica Mushroom",
		10,
		"Legendary",
		0,
		10000,
		0,
		0
	},
	{
		"Liberty Lily Seed",
		"Liberty Lily",
		10,
		"Rare",
		0,
		10000,
		0,
		0
	},
	{
		"Firework Flower Seed",
		"Firework Flower",
		10,
		"Rare",
		0,
		10000,
		0,
		0
	},
	{
		"Fossilight Seed",
		"Fossilight",
		10,
		"Rare",
		0,
		10000,
		0,
		0
	},
	{
		"Amber Spine Seed",
		"Amber Spine",
		10,
		"Rare",
		0,
		10000,
		0,
		0
	},
	{
		"Giant Pinecone Seed",
		"Giant Pinecone",
		10,
		"Prismatic",
		3330562080,
		100,
		0,
		3330562261
	},
	{
		"Lingonberry Seed",
		"Lingonberry",
		10,
		"Legendary",
		0,
		100,
		0,
		0
	},
	{
		"Spiked Mango Seed",
		"Spiked Mango",
		10,
		"Legendary",
		0,
		100,
		0,
		0
	},
	{
		"Serenity Seed",
		"Serenity",
		10,
		"Legendary",
		0,
		100,
		0,
		0
	},
	{
		"Zenflare Seed",
		"Zenflare",
		10,
		"Legendary",
		0,
		100,
		0,
		0
	},
	{
		"Monoblooma Seed",
		"Monoblooma",
		10,
		"Common",
		3265927895,
		100,
		0,
		nil
	},
	{
		"Maple Apple Seed",
		"Maple Apple",
		10,
		"Common",
		3265927895,
		100,
		0,
		nil
	},
	{
		"Soft Sunshine Seed",
		"Soft Sunshine",
		10,
		"Common",
		0,
		100,
		0,
		nil
	},
	{
		"Zen Rocks Seed",
		"Zen Rocks",
		10,
		"Common",
		3265927895,
		100,
		0,
		nil
	},
	{
		"Dragon Sapling Seed",
		"Dragon Sapling",
		10,
		"Legendary",
		0,
		100,
		0,
		0
	},
	{
		"Hinomai Seed",
		"Hinomai",
		10,
		"Legendary",
		0,
		100,
		0,
		0
	},
	{
		"Sinisterdrip Seed",
		"Sinisterdrip",
		10,
		"Legendary",
		0,
		100,
		0,
		0
	},
	{
		"Lucky Bamboo Seed",
		"Lucky Bamboo",
		10,
		"Legendary",
		0,
		100,
		0,
		0
	},
	{
		"Trainquil Bloom Seed",
		"Trainquil Bloom",
		10,
		"Legendary",
		0,
		100,
		0,
		0
	},
	{
		"Veinpetal Seed",
		"Veinpetal",
		10,
		"Legendary",
		0,
		100,
		0,
		0
	},
	{
		"Elder Strawberry Seed",
		"Elder Strawberry",
		10,
		"Legendary",
		3345148119,
		100,
		0,
		3345148525
	},
	{
		"Dezen Seed",
		"Dezen",
		10,
		"Legendary",
		0,
		100,
		0,
		0
	},
	{
		"Sakura Bush Seed",
		"Sakura Bush",
		10,
		"Legendary",
		0,
		100,
		0,
		0
	},
	{
		"Enkaku Seed",
		"Enkaku",
		10,
		"Legendary",
		0,
		100,
		0,
		0
	},
	{
		"Fruitball Seed",
		"Fruitball",
		10,
		"Legendary",
		0,
		100,
		0,
		0
	},
	{
		"Onion Seed",
		"Onion",
		10,
		"Legendary",
		0,
		100,
		0,
		0
	},
	{
		"Jalapeno Seed",
		"Jalapeno",
		10,
		"Legendary",
		0,
		100,
		0,
		0
	},
	{
		"Artichoke Seed",
		"Artichoke",
		10,
		"Legendary",
		0,
		100,
		0,
		0
	},
	{
		"Grand Tomato Seed",
		"Grand Tomato",
		10,
		"Legendary",
		0,
		100,
		0,
		0
	},
	{
		"Tall Asparagus Seed",
		"Tall Asparagus",
		10,
		"Legendary",
		0,
		100,
		0,
		0
	},
	{
		"Crown Melon Seed",
		"Crown Melon",
		10,
		"Legendary",
		0,
		100,
		0,
		0
	},
	{
		"Sugarglaze Seed",
		"Sugarglaze",
		10,
		"Legendary",
		0,
		100,
		0,
		0
	},
	{
		"Taco Fern Seed",
		"Taco Fern",
		10,
		"Legendary",
		0,
		100,
		0,
		0
	},
	{
		"Potato Seed",
		"Potato",
		10,
		"Legendary",
		3388363390,
		100,
		0,
		3388449849
	},
	{
		"Broccoli Seed",
		"Broccoli",
		10,
		"Legendary",
		3388363071,
		100,
		0,
		3388448748
	},
	{
		"Bitter Melon Seed",
		"Bitter Melon",
		10,
		"Legendary",
		0,
		100,
		0,
		0
	},
	{
		"Rhubarb Seed",
		"Rhubarb",
		10,
		"Legendary",
		0,
		100,
		0,
		0
	},
	{
		"Spring Onion Seed",
		"Spring Onion",
		10,
		"Legendary",
		0,
		100,
		0,
		0
	},
	{
		"Log Pumpkin Seed",
		"Log Pumpkin",
		10,
		"Legendary",
		0,
		100,
		0,
		0
	},
	{
		"King Cabbage Seed",
		"King Cabbage",
		10,
		"Legendary",
		0,
		100,
		0,
		0
	},
	{
		"Badlands Pepper Seed",
		"Badlands Pepper",
		10,
		"Legendary",
		0,
		100,
		0,
		0
	},
	{
		"Butternut Squash Seed",
		"Butternut Squash",
		10,
		"Legendary",
		0,
		100,
		0,
		0
	},
	{
		"Pricklefruit Seed",
		"Pricklefruit",
		10,
		"Legendary",
		0,
		100,
		0,
		0
	},
	{
		"Canary Melon Seed",
		"Canary Melon",
		10,
		"Legendary",
		0,
		100,
		0,
		0
	},
	{
		"Poseidon Plant Seed",
		"Poseidon Plant",
		10,
		"Legendary",
		0,
		100,
		0,
		0
	},
	{
		"Gleamroot Seed",
		"Gleamroot",
		10,
		"Legendary",
		0,
		100,
		0,
		0
	},
	{
		"Aura Flora Seed",
		"Aura Flora",
		10,
		"Legendary",
		0,
		100,
		0,
		0
	},
	{
		"Mangosteen Seed",
		"Mangosteen",
		10,
		"Legendary",
		0,
		100,
		0,
		0
	},
	{
		"Mandrake Seed",
		"Mandrake",
		10,
		"Legendary",
		0,
		100,
		0,
		0
	},
	{
		"Golden Egg Seed",
		"Golden Egg",
		10,
		"Legendary",
		0,
		100,
		0,
		0
	},
	{
		"Mutant Carrot Seed",
		"Mutant Carrot",
		10,
		"Legendary",
		0,
		100,
		0,
		0
	},
	{
		"Princess Thorn Seed",
		"Princess Thorn",
		10,
		"Legendary",
		0,
		100,
		0,
		0
	},
	{
		"Cyclamen Seed",
		"Cyclamen",
		10,
		"Legendary",
		0,
		100,
		0,
		0
	},
	{
		"Amberheart Seed",
		"Amberheart",
		10,
		"Legendary",
		0,
		100,
		0,
		0
	},
	{
		"Flare Daisy Seed",
		"Flare Daisy",
		10,
		"Legendary",
		0,
		100,
		0,
		0
	},
	{
		"Duskpuff Seed",
		"Duskpuff",
		10,
		"Legendary",
		0,
		100,
		0,
		0
	},
	{
		"King Palm Seed",
		"King Palm",
		10,
		"Legendary",
		0,
		100,
		0,
		0
	},
	{
		"Romanesco Seed",
		"Romanesco",
		10,
		"Legendary",
		3372004188,
		100,
		0,
		3372004716
	},
	{
		"Crown of Thorns Seed",
		"Crown of Thorns",
		10,
		"Legendary",
		0,
		100,
		0,
		0
	},
	{
		"Glowpod Seed",
		"Glowpod",
		10,
		"Legendary",
		0,
		100,
		0,
		0
	},
	{
		"Willowberry Seed",
		"Willowberry",
		10,
		"Legendary",
		0,
		100,
		0,
		0
	},
	{
		"Calla Lily Seed",
		"Calla Lily",
		10,
		"Legendary",
		0,
		100,
		0,
		0
	},
	{
		"Spectralis Seed",
		"Spectralis",
		10,
		"Legendary",
		0,
		100,
		0,
		0
	},
	{
		"Flare Melon Seed",
		"Flare Melon",
		10,
		"Legendary",
		0,
		100,
		0,
		0
	},
	{
		"Lightshoot Seed",
		"Lightshoot",
		10,
		"Legendary",
		0,
		100,
		0,
		0
	},
	{
		"Spirit Lantern Seed",
		"Spirit Lantern",
		10,
		"Legendary",
		0,
		100,
		0,
		0
	},
	{
		"Aurora Vine Seed",
		"Aurora Vine",
		10,
		"Legendary",
		0,
		100,
		0,
		0
	},
	{
		"Snaparino Beanarini Seed",
		"Snaparino Beanarini",
		10,
		"Legendary",
		0,
		100,
		0,
		0
	},
	{
		"Shimmersprout Seed",
		"Shimmersprout",
		4,
		"Rare",
		0,
		800,
		1,
		nil
	},
	{
		"Pomegranate Seed",
		"Pomegranate",
		4,
		"Rare",
		0,
		800,
		1,
		nil
	},
	{
		"Glowthorn Seed",
		"Glowthorn",
		10,
		"Rare",
		0,
		100,
		0,
		nil
	},
	{
		"Horned Melon Seed",
		"Horned Melon",
		10,
		"Rare",
		0,
		100,
		0,
		nil
	},
	{
		"Briar Rose Seed",
		"Briar Rose",
		10,
		"Rare",
		0,
		100,
		0,
		nil
	},
	{
		"Pink Rose Seed",
		"Pink Rose",
		10,
		"Rare",
		0,
		100,
		0,
		nil
	},
	{
		"Spirit Flower Seed",
		"Spirit Flower",
		10,
		"Rare",
		0,
		100,
		0,
		nil
	},
	{
		"Untold Bell Seed",
		"Untold Bell",
		10,
		"Rare",
		0,
		100,
		0,
		nil
	},
	{
		"Emerald Bud Seed",
		"Emerald Bud",
		10,
		"Rare",
		0,
		100,
		0,
		nil
	},
	{
		"Cocomango Seed",
		"Cocomango",
		10,
		"Rare",
		3388359799,
		100,
		0,
		3388451065
	},
	{
		"Wispwing Seed",
		"Wispwing",
		10,
		"Rare",
		0,
		100,
		0,
		nil
	},
	{
		"Ackee Seed",
		"Ackee",
		10,
		"Rare",
		0,
		100,
		0,
		nil
	},
	{
		"Brussels Sprout Seed",
		"Brussels Sprout",
		10,
		"Rare",
		3388360759,
		100,
		0,
		3388450348
	},
	{
		"Sunbulb Seed",
		"Sunbulb",
		10,
		"Rare",
		0,
		100,
		0,
		nil
	},
	{
		"Aetherfruit Seed",
		"Aetherfruit",
		10,
		"Rare",
		0,
		100,
		0,
		nil
	},
	{
		"Urchin Plant Seed",
		"Urchin Plant",
		10,
		"Rare",
		0,
		100,
		0,
		nil
	},
	{
		"Pyracantha Seed",
		"Pyracantha",
		10,
		"Rare",
		0,
		100,
		0,
		nil
	},
	{
		"Blue Raspberry Seed",
		"Blue Raspberry",
		10,
		"Rare",
		0,
		100,
		0,
		nil
	},
	{
		"Fennel Seed",
		"Fennel",
		10,
		"Legendary",
		0,
		100,
		0,
		0
	},
	{
		"Melon Flower Seed",
		"Melon Flower",
		10,
		"Legendary",
		0,
		10000,
		0,
		0
	},
	{
		"Pixie Faern Seed",
		"Pixie Faern",
		10,
		"Rare",
		0,
		100,
		0,
		nil
	},
	{
		"Frostspike Seed",
		"Frostspike",
		10,
		"Rare",
		0,
		100,
		0,
		nil
	},
	{
		"Golden Peach Seed",
		"Golden Peach",
		10,
		"Rare",
		0,
		100,
		0,
		nil
	},
	{
		"Torchflare Seed",
		"Torchflare",
		10,
		"Rare",
		0,
		100,
		0,
		nil
	},
	{
		"Kniphofia Seed",
		"Kniphofia",
		10,
		"Rare",
		0,
		100,
		0,
		nil
	},
	{
		"Parsley Seed",
		"Parsley",
		10,
		"Rare",
		0,
		100,
		0,
		nil
	},
	{
		"Meyer Lemon Seed",
		"Meyer Lemon",
		10,
		"Rare",
		0,
		100,
		0,
		nil
	},
	{
		"Carnival Pumpkin Seed",
		"Carnival Pumpkin",
		10,
		"Rare",
		0,
		100,
		0,
		nil
	},
	{
		"Turnip Seed",
		"Turnip",
		10,
		"Rare",
		0,
		100,
		0,
		nil
	},
	{
		"Maple Resin Seed",
		"Maple Resin",
		10,
		"Rare",
		0,
		100,
		0,
		nil
	},
	{
		"Mangrove Seed",
		"Mangrove",
		10,
		"Rare",
		0,
		100,
		0,
		nil
	},
	{
		"Gooseberry Seed",
		"Gooseberry",
		10,
		"Rare",
		0,
		100,
		0,
		nil
	},
	{
		"Banana Orchid Seed",
		"Banana Orchid",
		10,
		"Rare",
		0,
		100,
		0,
		nil
	},
	{
		"Plumwillow Seed",
		"Plumwillow",
		10,
		"Rare",
		0,
		100,
		0,
		nil
	},
	{
		"Black Bat Flower Seed",
		"Black Bat Flower",
		10,
		"Rare",
		0,
		100,
		0,
		nil
	},
	{
		"Corpse Flower Seed",
		"Corpse Flower",
		10,
		"Rare",
		0,
		100,
		0,
		nil
	},
	{
		"Speargrass Seed",
		"Speargrass",
		10,
		"Rare",
		0,
		100,
		0,
		nil
	},
	{
		"Fall Berry Seed",
		"Fall Berry",
		10,
		"Rare",
		0,
		100,
		0,
		nil
	},
	{
		"Firewell Seed",
		"Firewell",
		10,
		"Rare",
		0,
		100,
		0,
		nil
	},
	{
		"Auburn Pine Seed",
		"Auburn Pine",
		10,
		"Rare",
		0,
		100,
		0,
		nil
	},
	{
		"Autumn Shroom Seed",
		"Autumn Shroom",
		10,
		"Rare",
		0,
		100,
		0,
		nil
	},
	{
		"Black Magic Ears Seed",
		"Black Magic Ears",
		10,
		"Common",
		3265927895,
		100,
		0,
		nil
	},
	{
		"Naval Wort Seed",
		"Naval Wort Ears",
		10,
		"Common",
		3265927895,
		100,
		0,
		nil
	},
	{
		"Helenium Seed",
		"Helenium",
		10,
		"Common",
		-1,
		100,
		0,
		nil
	},
	{
		"Sundew Seed",
		"Sundew",
		10,
		"Common",
		0,
		100,
		0,
		nil
	},
	{
		"Mandrone Berry Seed",
		"Mandrone Berry",
		10,
		"Common",
		0,
		100,
		0,
		nil
	},
	{
		"Mulitrap Seed",
		"Mulitrap",
		10,
		"Common",
		0,
		100,
		0,
		nil
	},
	{
		"Acorn Squash Seed",
		"Acorn Squash ",
		10,
		"Common",
		0,
		100,
		0,
		nil
	},
	{
		"Inferno Quince Seed",
		"Inferno Quince",
		10,
		"Common",
		0,
		100,
		0,
		nil
	},
	{
		"Blooming Cactus Seed",
		"Blooming Cactus",
		10,
		"Common",
		0,
		100,
		0,
		nil
	},
	{
		"Hazelnut Seed",
		"Hazelnut",
		10,
		"Uncomon",
		0,
		100,
		0,
		nil
	},
	{
		"Peanut Seed",
		"Peanut",
		10,
		"Uncomon",
		0,
		100,
		0,
		nil
	},
	{
		"Jelpod Seed",
		"Jelpod",
		10,
		"Uncomon",
		0,
		100,
		0,
		nil
	},
	{
		"Evo Pumpkin I Seed",
		"Evo Pumpkin I",
		10,
		"Uncomon",
		0,
		100,
		0,
		nil
	},
	{
		"Evo Pumpkin II Seed",
		"Evo Pumpkin II",
		10,
		"Uncomon",
		0,
		100,
		0,
		nil
	},
	{
		"Evo Pumpkin III Seed",
		"Evo Pumpkin III",
		10,
		"Uncomon",
		0,
		100,
		0,
		nil
	},
	{
		"Evo Pumpkin IV Seed",
		"Evo Pumpkin IV",
		10,
		"Uncomon",
		0,
		100,
		0,
		nil
	},
	{
		"Crimson Thorn Seed",
		"Crimson Thorn",
		100000,
		"Transcendent",
		3414035789,
		1000000000,
		0,
		3414037165
	},
	{
		"Great Pumpkin Seed",
		"Great Pumpkin",
		10,
		"Transcendent",
		3426542757,
		100,
		0,
		3426546544
	},
	{
		"Trinity Fruit Seed",
		"Trinity Fruit",
		10,
		"Transcendent",
		3445164189,
		100,
		0,
		3445174669
	},
	{
		"Zebrazinkle Seed",
		"Zebrazinkle",
		10,
		"Transcendent",
		3445262332,
		100,
		0,
		3445262531
	},
	{
		"Buttercup Seed",
		"Buttercup",
		10,
		"Common",
		3445155701,
		100,
		0,
		3445174239
	},
	{
		"Big Buttercup Seed",
		"Big Buttercup",
		10,
		"Rare",
		5,
		100,
		0,
		5
	},
	{
		"Bigger Buttercup Seed",
		"Bigger Buttercup",
		10,
		"Legendary",
		5,
		100,
		0,
		5
	},
	{
		"Biggest Buttercup Seed",
		"Biggest Buttercup",
		10,
		"Mythic",
		5,
		100,
		0,
		5
	},
	{
		"Beast Buttercup Seed",
		"Beast Buttercup",
		10,
		"Transcendent",
		3519865801,
		100,
		0,
		3519865904
	},
	{
		"Evo Mushroom I Seed",
		"Evo Mushroom I",
		10,
		"Rare",
		0,
		100,
		0,
		nil
	},
	{
		"Evo Mushroom II Seed",
		"Evo Mushroom II",
		10,
		"Rare",
		0,
		100,
		0,
		nil
	},
	{
		"Evo Mushroom III Seed",
		"Evo Mushroom III",
		10,
		"Rare",
		0,
		100,
		0,
		nil
	},
	{
		"Evo Mushroom IV Seed",
		"Evo Mushroom IV",
		10,
		"Rare",
		0,
		100,
		0,
		nil
	},
	{
		"Evo Beetroot I Seed",
		"Evo Beetroot I",
		10,
		"Rare",
		0,
		100,
		0,
		nil
	},
	{
		"Evo Beetroot II Seed",
		"Evo Beetroot II",
		10,
		"Rare",
		0,
		100,
		0,
		nil
	},
	{
		"Evo Beetroot III Seed",
		"Evo Beetroot III",
		10,
		"Rare",
		0,
		100,
		0,
		nil
	},
	{
		"Evo Beetroot IV Seed",
		"Evo Beetroot IV",
		10,
		"Rare",
		0,
		100,
		0,
		nil
	},
	{
		"Filbert Nut Seed",
		"Filbert Nut",
		10,
		"Rare",
		0,
		100,
		0,
		nil
	},
	{
		"Evo Apple I Seed",
		"Evo Apple I",
		10,
		"Rare",
		0,
		100,
		0,
		nil
	},
	{
		"Evo Apple II Seed",
		"Evo Apple II",
		10,
		"Rare",
		0,
		100,
		0,
		nil
	},
	{
		"Evo Apple III Seed",
		"Evo Apple III",
		10,
		"Rare",
		0,
		100,
		0,
		nil
	},
	{
		"Evo Apple IV Seed",
		"Evo Apple IV",
		10,
		"Rare",
		0,
		100,
		0,
		nil
	},
	{
		"Evo Blueberry I Seed",
		"Evo Blueberry I",
		10,
		"Rare",
		0,
		100,
		0,
		nil
	},
	{
		"Evo Blueberry II Seed",
		"Evo Blueberry II",
		10,
		"Rare",
		0,
		100,
		0,
		nil
	},
	{
		"Evo Blueberry III Seed",
		"Evo Blueberry III",
		10,
		"Rare",
		0,
		100,
		0,
		nil
	},
	{
		"Evo Blueberry IV Seed",
		"Evo Blueberry IV",
		10,
		"Rare",
		0,
		100,
		0,
		nil
	},
	{
		"Wild Berry Seed",
		"Wild Berry",
		10,
		"Rare",
		0,
		100,
		0,
		nil
	},
	{
		"Turkish Hazel Seed",
		"Turkish Hazel",
		10,
		"Rare",
		0,
		100,
		0,
		nil
	},
	{
		"Ferntail Seed",
		"Ferntail",
		10,
		"Rare",
		0,
		100,
		0,
		nil
	},
	{
		"Acorn Seed",
		"Acorn",
		10,
		"Rare",
		0,
		100,
		0,
		nil
	},
	{
		"Crunchnut Seed",
		"Crunchnut",
		10,
		"Rare",
		0,
		100,
		0,
		nil
	},
	{
		"Pecan Seed",
		"Pecan",
		10,
		"Rare",
		0,
		100,
		0,
		nil
	},
	{
		"Fissure Berry Seed",
		"Fissure Berry",
		10,
		"Rare",
		0,
		100,
		0,
		nil
	},
	{
		"Persimmon Seed",
		"Persimmon",
		10,
		"Rare",
		0,
		100,
		0,
		nil
	},
	{
		"Cherry Seed",
		"Cherry",
		10,
		"Rare",
		0,
		100,
		0,
		nil
	},
	{
		"Ghoul Root Seed",
		"Ghoul Root",
		10,
		"Rare",
		0,
		100,
		0,
		nil
	},
	{
		"Poison Apple Seed",
		"Poison Apple",
		10,
		"Rare",
		0,
		100,
		0,
		nil
	},
	{
		"Alien Apple Seed",
		"Alien Apple",
		10,
		"Rare",
		3546475721,
		100,
		0,
		3546475861
	},
	{
		"Bloodred Mushroom Seed",
		"Bloodred Mushroom",
		10,
		"Rare",
		0,
		100,
		0,
		nil
	},
	{
		"Jack O Lantern Seed",
		"Jack O Lantern",
		10,
		"Rare",
		0,
		100,
		0,
		nil
	},
	{
		"Chicken Feed Seed",
		"Chicken Feed",
		10,
		"Rare",
		0,
		100,
		0,
		nil
	},
	{
		"Banesberry Seed",
		"Banesberry",
		10,
		"Rare",
		0,
		100,
		0,
		nil
	},
	{
		"Hexberry Seed",
		"Hexberry",
		10,
		"Rare",
		0,
		100,
		0,
		nil
	},
	{
		"Blood Orange Seed",
		"Blood Orange",
		10,
		"Rare",
		0,
		100,
		0,
		nil
	},
	{
		"Seer Vine Seed",
		"Seer Vine",
		10,
		"Rare",
		0,
		100,
		0,
		nil
	},
	{
		"Mini Pumpkin Seed",
		"Mini Pumpkin",
		10,
		"Rare",
		0,
		100,
		0,
		nil
	},
	{
		"Zombie Fruit Seed",
		"Zombie Fruit",
		10,
		"Rare",
		0,
		100,
		0,
		nil
	},
	{
		"Weeping Branch Seed",
		"Weeping Branch",
		10,
		"Rare",
		0,
		100,
		0,
		nil
	},
	{
		"Witch Cap Seed",
		"Witch Cap",
		10,
		"Rare",
		0,
		100,
		0,
		nil
	},
	{
		"Monster Flower Seed",
		"Monster Flower",
		10,
		"Rare",
		0,
		100,
		0,
		nil
	},
	{
		"Mummy\'s Hand Seed",
		"Mummy\'s Hand",
		10,
		"Rare",
		0,
		100,
		0,
		nil
	},
	{
		"Candy Cornflower Seed",
		"Candy Cornflower",
		10,
		"Rare",
		0,
		100,
		0,
		nil
	},
	{
		"Wisp Flower Seed",
		"Wisp Flower",
		10,
		"Rare",
		0,
		100,
		0,
		nil
	},
	{
		"Ghost Bush Seed",
		"Ghost Bush",
		10,
		"Rare",
		0,
		100,
		0,
		nil
	},
	{
		"Wereplant Seed",
		"Wereplant",
		10,
		"Rare",
		0,
		100,
		0,
		nil
	},
	{
		"Skull Flower Seed",
		"Skull Flower",
		10,
		"Rare",
		0,
		100,
		0,
		nil
	},
	{
		"Horned Redrose Seed",
		"Horned Redrose",
		10,
		"Rare",
		0,
		100,
		0,
		nil
	},
	{
		"Mind Root Seed",
		"Mind Root",
		10,
		"Rare",
		0,
		100,
		0,
		nil
	},
	{
		"Severed Spine Seed",
		"Severed Spine",
		10,
		"Rare",
		0,
		100,
		0,
		nil
	},
	{
		"Devilroot Seed",
		"Devilroot",
		10,
		"Rare",
		0,
		100,
		0,
		nil
	},
	{
		"Glass Kiwi Seed",
		"Glass Kiwi",
		10,
		"Rare",
		0,
		100,
		0,
		nil
	},
	{
		"Vampbloom Seed",
		"Vampbloom",
		10,
		"Rare",
		0,
		100,
		0,
		nil
	},
	{
		"Ghost Pepper Seed",
		"Ghost Pepper",
		10,
		"Rare",
		0,
		100,
		0,
		nil
	},
	{
		"Mahogany Seed",
		"Mahogany",
		10,
		"Rare",
		0,
		100,
		0,
		nil
	},
	{
		"Spider Vine Seed",
		"Spider Vine",
		10,
		"Rare",
		0,
		100,
		0,
		nil
	},
	{
		"Wyrmvine Seed",
		"Wyrmvine",
		10,
		"Rare",
		0,
		100,
		0,
		nil
	},
	{
		"Sugarcane Seed",
		"Sugarcane",
		10,
		"Rare",
		0,
		100,
		0,
		nil
	},
	{
		"Buddhas Hand Seed",
		"Buddhas Hand",
		10,
		"Rare",
		0,
		100,
		0,
		nil
	},
	{
		"Viburnum Berry Seed",
		"Viburnum Berry",
		10,
		"Rare",
		0,
		100,
		0,
		nil
	},
	{
		"Queen Fruit Seed",
		"Queen Fruit",
		10,
		"Rare",
		0,
		100,
		0,
		nil
	},
	{
		"Java Banana Seed",
		"Java Banana",
		10,
		"Rare",
		0,
		100,
		0,
		nil
	},
	{
		"Protea Seed",
		"Protea",
		10,
		"Rare",
		0,
		100,
		0,
		nil
	},
	{
		"Crassula Umbrella Seed",
		"Crassula Umbrella",
		10,
		"Rare",
		0,
		100,
		0,
		nil
	},
	{
		"Thornspire Seed",
		"Thornspire",
		10,
		"Rare",
		0,
		100,
		0,
		nil
	},
	{
		"Baobab Seed",
		"Baobab",
		10,
		"Rare",
		0,
		100,
		0,
		nil
	},
	{
		"Orange Delight Seed",
		"Orange Delight",
		10,
		"Rare",
		0,
		100,
		0,
		nil
	},
	{
		"Castor Bean Seed",
		"Castor Bean",
		10,
		"Rare",
		0,
		100,
		0,
		nil
	},
	{
		"Daisy Seed",
		"Daisy",
		10,
		"Common",
		0,
		100,
		0,
		0
	},
	{
		"Faestar Seed",
		"Faestar",
		10,
		"Divine",
		0,
		100,
		0,
		0
	},
	{
		"Bamboo Tree Seed",
		"Bamboo Tree",
		10,
		"Divine",
		0,
		100,
		0,
		0
	},
	{
		"Peacock Tail Seed",
		"Peacock Tail",
		10,
		"Divine",
		0,
		100,
		0,
		0
	},
	{
		"Madras Thorn Seed",
		"Madras Thorn",
		10,
		"Divine",
		0,
		100,
		0,
		0
	},
	{
		"Peach Sun Seed",
		"Peach Sun",
		10,
		"Rare",
		0,
		100,
		0,
		nil
	},
	{
		"Amberfruit Shrub Seed",
		"Amberfruit Shrub",
		10,
		"Rare",
		0,
		100,
		0,
		nil
	},
	{
		"Sunflower Seed",
		"Sunflower",
		10,
		"Rare",
		3455804869,
		100,
		0,
		3455805368
	},
	{
		"Akebi Seed",
		"Akebi",
		10,
		"Rare",
		0,
		100,
		0,
		nil
	},
	{
		"Peppermint Vine Seed",
		"Peppermint Vine",
		10,
		"Rare",
		3471911127,
		100,
		0,
		3471911353
	},
	{
		"Zucchini Seed",
		"Zucchini",
		10,
		"Rare",
		0,
		100,
		0,
		nil
	},
	{
		"Luna Stem Seed",
		"Luna Stem",
		10,
		"Rare",
		0,
		100,
		0,
		nil
	},
	{
		"Lumin Bloom Seed",
		"Lumin Bloom",
		10,
		"Rare",
		0,
		100,
		0,
		nil
	},
	{
		"Gingerbread Blossom Seed",
		"Gingerbread Blossom",
		10,
		"Rare",
		0,
		100,
		0,
		nil
	},
	{
		"Heart Blossom Seed",
		"Heart Blossom",
		10,
		"Rare",
		0,
		100,
		0,
		nil
	},
	{
		"Olive Seed",
		"Olive",
		10,
		"Rare",
		0,
		100,
		0,
		nil
	},
	{
		"Yarrow Seed",
		"Yarrow",
		10,
		"Rare",
		0,
		100,
		0,
		nil
	},
	{
		"Hollow Bamboo Seed",
		"Hollow Bamboo",
		10,
		"Rare",
		0,
		100,
		0,
		nil
	},
	{
		"Crown Pumpkin Seed",
		"Crown Pumpkin",
		10,
		"Rare",
		0,
		100,
		0,
		nil
	},
	{
		"Holly Berry Seed",
		"Holly Berry",
		10,
		"Rare",
		0,
		100,
		0,
		nil
	},
	{
		"Cyberflare Seed",
		"Cyberflare",
		10,
		"Rare",
		0,
		100,
		0,
		nil
	},
	{
		"Antlerbloom Seed",
		"Antlerbloom",
		10,
		"Rare",
		0,
		100,
		0,
		nil
	},
	{
		"Strange Man\'s Wheat Seed",
		"Strange Man\'s Wheat",
		10,
		"Rare",
		0,
		100,
		0,
		nil
	},
	{
		"Gumdrop Seed",
		"Gumdrop",
		10,
		"Rare",
		0,
		100,
		0,
		nil
	},
	{
		"Cookie Stack Seed",
		"Cookie Stack",
		10,
		"Rare",
		0,
		100,
		0,
		nil
	},
	{
		"Walnut Seed",
		"Walnut",
		10,
		"Rare",
		0,
		100,
		0,
		nil
	},
	{
		"Leifo Fruit Seed",
		"Leifo Fruit",
		10,
		"Rare",
		0,
		100,
		0,
		nil
	},
	{
		"Wild Pineapple Seed",
		"Wild Pineapple",
		10,
		"Rare",
		0,
		100,
		0,
		nil
	},
	{
		"Coilvine Seed",
		"Coilvine",
		10,
		"Rare",
		0,
		100,
		0,
		nil
	},
	{
		"Asteris Seed",
		"Asteris",
		10,
		"Rare",
		0,
		100,
		0,
		nil
	},
	{
		"Octobloom Seed",
		"Octobloom",
		10,
		"Rare",
		3461239818,
		100,
		0,
		3461241465
	},
	{
		"Festive Bamboo Seed",
		"Festive Bamboo",
		10,
		"Rare",
		0,
		100,
		0,
		nil
	},
	{
		"Gem Fruit Seed",
		"Gem Fruit",
		10,
		"Rare",
		0,
		100,
		0,
		nil
	},
	{
		"Iciclesco Seed",
		"Iciclesco",
		10,
		"Legendary",
		0,
		100,
		0,
		nil
	},
	{
		"Frosty Bite Seed",
		"Frosty Bite",
		10,
		"Legendary",
		0,
		100,
		0,
		nil
	},
	{
		"Poinsettia Seed",
		"Poinsettia",
		10,
		"Legendary",
		0,
		100,
		0,
		nil
	},
	{
		"Bush Flake Seed",
		"Bush Flake",
		10,
		"Legendary",
		0,
		100,
		0,
		nil
	},
	{
		"Icestalite Seed",
		"Icestalite",
		10,
		"Legendary",
		0,
		100,
		0,
		nil
	},
	{
		"Sherrybloom Seed",
		"Sherrybloom",
		10,
		"Legendary",
		0,
		100,
		0,
		nil
	},
	{
		"Frost Pepper Seed",
		"Frost Pepper",
		10,
		"Legendary",
		0,
		100,
		0,
		nil
	},
	{
		"Coinfruit Seed",
		"Coinfruit",
		10,
		"Legendary",
		0,
		100,
		0,
		nil
	},
	{
		"Gift Berry Seed",
		"Gift Berry",
		10,
		"Legendary",
		0,
		100,
		0,
		nil
	},
	{
		"Pinkside Dandelion Seed",
		"Pinkside Dandelion",
		10,
		"Legendary",
		0,
		100,
		0,
		nil
	},
	{
		"Grand Cucumber Seed",
		"Grand Cucumber",
		10,
		"Legendary",
		0,
		100,
		0,
		nil
	},
	{
		"Candlite Seed",
		"Candlite",
		10,
		"Legendary",
		0,
		100,
		0,
		nil
	},
	{
		"Snowman Sprout Seed",
		"Snowman Sprout",
		10,
		"Legendary",
		0,
		100,
		0,
		nil
	},
	{
		"Mauve Fruit Seed",
		"Mauve Fruit",
		10,
		"Legendary",
		0,
		100,
		0,
		nil
	},
	{
		"Wild Frond Seed",
		"Wild Frond",
		10,
		"Legendary",
		0,
		100,
		0,
		nil
	},
	{
		"Frostwing Seed",
		"Frostwing",
		10,
		"Legendary",
		0,
		100,
		0,
		nil
	},
	{
		"Cryoshard Seed",
		"Cryoshard",
		10,
		"Legendary",
		0,
		100,
		0,
		nil
	},
	{
		"Pollen Cone Seed",
		"Pollen Cone",
		10,
		"Legendary",
		0,
		100,
		0,
		nil
	},
	{
		"Rosemary Seed",
		"Rosemary",
		10,
		"Legendary",
		0,
		100,
		0,
		nil
	},
	{
		"Wintercreep Seed",
		"Wintercreep",
		10,
		"Legendary",
		0,
		100,
		0,
		nil
	},
	{
		"Cryo Rose Seed",
		"Cryo Rose",
		10,
		"Legendary",
		0,
		100,
		0,
		nil
	},
	{
		"Ornament Vine Seed",
		"Ornament Vine",
		10,
		"Legendary",
		0,
		100,
		0,
		nil
	},
	{
		"Peppermint Pop Seed",
		"Peppermint Pop",
		10,
		"Legendary",
		0,
		100,
		0,
		nil
	},
	{
		"Wreath Span Seed",
		"Wreath Span",
		10,
		"Legendary",
		0,
		100,
		0,
		nil
	},
	{
		"Christmas Cracker Seed",
		"Christmas Cracker",
		10,
		"Legendary",
		0,
		100,
		0,
		nil
	},
	{
		"Frost Fern Seed",
		"Frost Fern",
		10,
		"Legendary",
		0,
		100,
		0,
		nil
	},
	{
		"Saskia Seed",
		"Saskia",
		10,
		"Legendary",
		0,
		100,
		0,
		nil
	},
	{
		"Tinsel Seed",
		"Tinsel",
		10,
		"Legendary",
		0,
		100,
		0,
		nil
	},
	{
		"Madcrown Vine Seed",
		"Madcrown Vine",
		10,
		"Legendary",
		0,
		100,
		0,
		nil
	},
	{
		"Crimson Cranberry Seed",
		"Crimson Cranberry",
		10,
		"Rare",
		0,
		100,
		0,
		nil
	},
	{
		"Yellow Core Seed",
		"Yellow Core",
		10,
		"Rare",
		0,
		100,
		0,
		nil
	},
	{
		"Christmas Tree Seed",
		"Christmas Tree",
		10,
		"Rare",
		0,
		100,
		0,
		nil
	},
	{
		"Candy Cane Seed",
		"Candy Cane",
		10,
		"Rare",
		0,
		100,
		0,
		nil
	},
	{
		"Heart Gem Seed",
		"Heart Gem",
		10,
		"Rare",
		0,
		100,
		0,
		nil
	},
	{
		"Taffy Tree Seed",
		"Taffy Tree",
		10,
		"Rare",
		0,
		100,
		0,
		nil
	},
	{
		"Reindeer Root Seed",
		"Reindeer Root",
		10,
		"Rare",
		3482980939,
		100,
		0,
		3482981252
	},
	{
		"Spirit Sparkle Seed",
		"Spirit Sparkle",
		10,
		"Rare",
		3482982251,
		100,
		0,
		3482983514
	},
	{
		"New Years Tinsel Seed",
		"New Years Tinsel",
		10,
		"Rare",
		0,
		100,
		0,
		nil
	},
	{
		"Colorpop Crop Seed",
		"Colorpop Crop",
		10,
		"Rare",
		0,
		100,
		0,
		nil
	},
	{
		"Firework Fern Seed",
		"Firework Fern",
		10,
		"Rare",
		3490207231,
		100,
		0,
		3490207392
	},
	{
		"Magma Pepper Seed",
		"Magma Pepper",
		10,
		"Rare",
		0,
		100,
		0,
		nil
	},
	{
		"Kernel Curl Seed",
		"Kernel Curl",
		10,
		"Rare",
		0,
		100,
		0,
		nil
	},
	{
		"Star Palm Seed",
		"Star Palm",
		10,
		"Rare",
		0,
		100,
		0,
		nil
	},
	{
		"Bonanza Bloom Seed",
		"Bonanza Bloom",
		10,
		"Rare",
		3498980651,
		100,
		0,
		3498981023
	},
	{
		"Luminova Seed",
		"Luminova",
		10,
		"Rare",
		0,
		100,
		0,
		nil
	},
	{
		"Witches Hair Seed",
		"Witches Hair",
		10,
		"Rare",
		0,
		100,
		0,
		nil
	},
	{
		"Purple Treeshroom Seed",
		"Purple Treeshroom",
		10,
		"Rare",
		0,
		100,
		0,
		nil
	},
	{
		"Amazon Feather Fern Seed",
		"Amazon Feather Fern",
		10,
		"Rare",
		0,
		100,
		0,
		nil
	},
	{
		"Jungle Cherry Seed",
		"Jungle Cherry",
		10,
		"Rare",
		0,
		100,
		0,
		nil
	}
}
function v2.Return_All_Data()
	-- upvalues: (copy) v_u_4
	return v_u_4
end
function v2.Return_All_Seeds()
	-- upvalues: (copy) v_u_9
	return v_u_9
end
function v2.Return_All_Seed_Rarities()
	-- upvalues: (copy) v_u_8
	return v_u_8
end
local v_u_10 = {}
local v_u_11 = {
	{ "Gold", 4, 20 },
	{ "Rainbow", 1, 50 }
}
for _, v12 in v_u_9 do
	v_u_10[v12[1]] = v12
end
function v2.Return_Seed_Data(p13)
	-- upvalues: (copy) v_u_10
	return v_u_10[p13]
end
function v2.Return_Rarity_Data(p14)
	-- upvalues: (copy) v_u_8
	for _, v15 in pairs(v_u_8) do
		if v15[1] == p14 then
			return v15
		end
	end
end
function v2.Return_Variant_Multiplier(p16)
	-- upvalues: (copy) v_u_3
	for _, v17 in pairs(v_u_3) do
		if v17[1] == p16 then
			return v17[3]
		end
	end
	return 0
end
function v2.Return_Random_Variant(p18)
	-- upvalues: (copy) v_u_3
	local v19 = math.max(p18, 1)
	local v20 = 0
	for _, v21 in v_u_3 do
		v20 = v20 + v21[2] / (v21[1] == "Normal" and v19 and v19 or 1)
	end
	local v22 = Random.new():NextInteger(0, v20)
	local v23 = 0
	for _, v24 in v_u_3 do
		v23 = v23 + v24[2] / (v24[1] == "Normal" and v19 and v19 or 1)
		if v22 <= v23 then
			return v24[1]
		end
	end
end
function v2.Return_Random_Super_Variant()
	-- upvalues: (copy) v_u_11
	local v25 = 0
	for _, v26 in ipairs(v_u_11) do
		v25 = v25 + v26[2]
	end
	local v27 = Random.new():NextInteger(1, v25)
	local v28 = 0
	for _, v29 in ipairs(v_u_11) do
		v28 = v28 + v29[2]
		if v27 <= v28 then
			return v29[1]
		end
	end
end
local v_u_30 = {}
for _, v31 in v_u_4 do
	v_u_30[v31[1]] = v31
end
function v2.Return_Data(p32)
	-- upvalues: (copy) v_u_1, (copy) v_u_30
	return v_u_30[v_u_1:StipFlavourText(p32)]
end
return v2