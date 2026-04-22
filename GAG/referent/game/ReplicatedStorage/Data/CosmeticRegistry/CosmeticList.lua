local v1 = game:GetService("ReplicatedStorage")
local v2 = game:GetService("ServerStorage")
local v3 = game:GetService("RunService")
local v4 = v3:IsServer() and v2:WaitForChild("Cosmetics") or Instance.new("Folder")
local v5 = require(v1.Modules.CreateHitBoxFor)
local v6 = {
	["SeedEventCraftingWorkBench"] = {
		["Description"] = "SeedEventCraftingWorkBench",
		["Rarity"] = "Prismatic",
		["Icon"] = "rbxassetid://0",
		["Model"] = v4:FindFirstChild("SeedEventCraftingWorkBench"),
		["Actions"] = {},
		["Tags"] = { "MACHINE" },
		["Undeletable"] = true
	},
	["Monster Mash Trophy"] = {
		["Description"] = "Monster Mash Trophy gained by participating in the WORLD RECORD monster mash!",
		["Rarity"] = "Prismatic",
		["Icon"] = "rbxassetid://77599265819344",
		["Model"] = v4:FindFirstChild("Monster Mash Trophy"),
		["Actions"] = {},
		["Tags"] = { "STATUE" },
		["Undeletable"] = true
	},
	["Grilled Moon Lit Owl"] = {
		["Description"] = "R.I.P. little birdy",
		["Rarity"] = "Mythical",
		["Icon"] = "rbxassetid://102528497739104",
		["Model"] = v4:FindFirstChild("Grilled Moon Lit Owl"),
		["Actions"] = {},
		["Tags"] = { "STATUE" }
	},
	["Jump Pad"] = {
		["Description"] = "You completed the obby!",
		["Rarity"] = "Prismatic",
		["Icon"] = "rbxassetid://86613236531689",
		["Model"] = v4:FindFirstChild("Jump Pad"),
		["Actions"] = {},
		["Tags"] = { "MISC", "UTILITY" }
	},
	["Yellow Umbrella"] = {
		["Description"] = "Sunshine on a stick.",
		["Rarity"] = "Common",
		["Icon"] = "rbxassetid://94314012476539",
		["Model"] = v4:FindFirstChild("Yellow Umbrella"),
		["Actions"] = {},
		["Tags"] = { "MISC" }
	},
	["Orange Umbrella"] = {
		["Description"] = "Citrusy shade for sunny days.",
		["Rarity"] = "Common",
		["Icon"] = "rbxassetid://88274038012868",
		["Model"] = v4:FindFirstChild("Orange Umbrella"),
		["Actions"] = {},
		["Tags"] = { "MISC" }
	},
	["Brick Stack"] = {
		["Description"] = "Stacked with brickstar power.",
		["Rarity"] = "Common",
		["Icon"] = "rbxassetid://128357565698061",
		["Model"] = v4:FindFirstChild("Brick Stack"),
		["Actions"] = {},
		["Tags"] = { "MISC" }
	},
	["Compost Bin"] = {
		["Description"] = "Trash to treasure, garden edition.",
		["Rarity"] = "Common",
		["Icon"] = "rbxassetid://96378933887328",
		["Model"] = v4:FindFirstChild("Compost Bin"),
		["Actions"] = {},
		["Tags"] = { "MISC" }
	},
	["Log"] = {
		["Description"] = "The OG garden decor.",
		["Rarity"] = "Common",
		["Icon"] = "rbxassetid://76301661478378",
		["Model"] = v4:FindFirstChild("Log"),
		["Actions"] = {},
		["Tags"] = { "MISC" }
	},
	["Rock Pile"] = {
		["Description"] = "Rocks with sedimental value.",
		["Rarity"] = "Common",
		["Icon"] = "rbxassetid://115500068524301",
		["Model"] = v4:FindFirstChild("Rock Pile"),
		["Actions"] = {},
		["Tags"] = { "MISC" }
	},
	["Rake"] = {
		["Description"] = "Tools with cult-ivation.",
		["Rarity"] = "Common",
		["Icon"] = "rbxassetid://112597085006662",
		["Model"] = v4:FindFirstChild("Rake"),
		["Actions"] = {},
		["Tags"] = { "MISC" }
	},
	["Shovel"] = {
		["Description"] = "Tools with cult-ivation.",
		["Rarity"] = "Common",
		["Icon"] = "rbxassetid://91314518527541",
		["Model"] = v4:FindFirstChild("Shovel"),
		["Actions"] = {},
		["Tags"] = { "MISC" }
	},
	["Torch"] = {
		["Description"] = "Light up the night\226\128\148flamingly.",
		["Rarity"] = "Common",
		["Icon"] = "rbxassetid://138930375147694",
		["Model"] = v4:FindFirstChild("Torch"),
		["Actions"] = {},
		["Tags"] = { "MISC" }
	},
	["Red Pottery"] = {
		["Description"] = "Clay-zy for garden decor.",
		["Rarity"] = "Common",
		["Icon"] = "rbxassetid://116715517791414",
		["Model"] = v4:FindFirstChild("Red Pottery"),
		["Actions"] = {},
		["Tags"] = { "MISC" }
	},
	["White Pottery"] = {
		["Description"] = "Clay-zy for garden decor.",
		["Rarity"] = "Common",
		["Icon"] = "rbxassetid://98046045828300",
		["Model"] = v4:FindFirstChild("White Pottery"),
		["Actions"] = {},
		["Tags"] = { "MISC" }
	},
	["Wood Pile"] = {
		["Description"] = "Logging some serious style points.",
		["Rarity"] = "Common",
		["Icon"] = "rbxassetid://123525466548522",
		["Model"] = v4:FindFirstChild("Wood Pile"),
		["Actions"] = {},
		["Tags"] = { "MISC" }
	},
	["Small Circle Tile"] = {
		["Description"] = "Going in circles never looked so good.",
		["Rarity"] = "Common",
		["Icon"] = "rbxassetid://140549587097599",
		["Model"] = v4:FindFirstChild("Small Circle Tile"),
		["Actions"] = {},
		["Tags"] = { "MISC" }
	},
	["Medium Circle Tile"] = {
		["Description"] = "Going in circles never looked so good.",
		["Rarity"] = "Common",
		["Icon"] = "rbxassetid://114920818848221",
		["Model"] = v4:FindFirstChild("Medium Circle Tile"),
		["Actions"] = {},
		["Tags"] = { "MISC" }
	},
	["Small Path Tile"] = {
		["Description"] = "Pave the way to floral fame.",
		["Rarity"] = "Common",
		["Icon"] = "rbxassetid://115709059245481",
		["Model"] = v4:FindFirstChild("Small Path Tile"),
		["Actions"] = {},
		["Tags"] = { "MISC" }
	},
	["Medium Path Tile"] = {
		["Description"] = "Pave the way to floral fame.",
		["Rarity"] = "Common",
		["Icon"] = "rbxassetid://71405070143013",
		["Model"] = v4:FindFirstChild("Medium Path Tile"),
		["Actions"] = {},
		["Tags"] = { "MISC" }
	},
	["Large Path Tile"] = {
		["Description"] = "Pave the way to floral fame.",
		["Rarity"] = "Common",
		["Icon"] = "rbxassetid://85801904008201",
		["Model"] = v4:FindFirstChild("Large Path Tile"),
		["Actions"] = {},
		["Tags"] = { "MISC" }
	},
	["Duckfloat"] = {
		["Description"] = "Ducky Floaty Hehe.",
		["Rarity"] = "Rare",
		["Icon"] = "rbxassetid://122002865494426",
		["Model"] = v4:FindFirstChild("Duckfloat"),
		["Actions"] = {},
		["Tags"] = { "MISC" }
	},
	["Axe Stump"] = {
		["Description"] = "Chopped, but never forgotten.",
		["Rarity"] = "Uncommon",
		["Icon"] = "rbxassetid://96264914166618",
		["Model"] = v4:FindFirstChild("Axe Stump"),
		["Actions"] = {},
		["Tags"] = { "MISC" }
	},
	["Bookshelf"] = {
		["Description"] = "Grow your mind while your garden grows.",
		["Rarity"] = "Uncommon",
		["Icon"] = "rbxassetid://115973373909016",
		["Model"] = v4:FindFirstChild("Bookshelf"),
		["Actions"] = {},
		["Tags"] = { "MISC" }
	},
	["Brown Bench"] = {
		["Description"] = "Sit, stay, bloom.",
		["Rarity"] = "Uncommon",
		["Icon"] = "rbxassetid://98910490474013",
		["Model"] = v4:FindFirstChild("Brown Bench"),
		["Actions"] = {},
		["Tags"] = { "MISC" }
	},
	["Hay Bale"] = {
		["Description"] = "Bale-out plan for bland gardens.",
		["Rarity"] = "Uncommon",
		["Icon"] = "rbxassetid://87723268241453",
		["Model"] = v4:FindFirstChild("Hay Bale"),
		["Actions"] = {},
		["Tags"] = { "MISC" }
	},
	["Light On Ground"] = {
		["Description"] = "Bright ideas start here.",
		["Rarity"] = "Uncommon",
		["Icon"] = "rbxassetid://117164021377008",
		["Model"] = v4:FindFirstChild("Light On Ground"),
		["Actions"] = {},
		["Tags"] = { "MISC" }
	},
	["Log Bench"] = {
		["Description"] = "Take a seat and branch out.",
		["Rarity"] = "Uncommon",
		["Icon"] = "rbxassetid://70530203579288",
		["Model"] = v4:FindFirstChild("Log Bench"),
		["Actions"] = {},
		["Tags"] = { "MISC" }
	},
	["Mini TV"] = {
		["Description"] = "Binge-watch your plants grow.",
		["Rarity"] = "Uncommon",
		["Icon"] = "rbxassetid://131992955716873",
		["Model"] = v4:FindFirstChild("Mini TV"),
		["Actions"] = {},
		["Tags"] = { "MISC" }
	},
	["Shovel Grave"] = {
		["Description"] = "RIP, dear tool\226\128\148you dug your last hole.",
		["Rarity"] = "Uncommon",
		["Icon"] = "rbxassetid://120224305204338",
		["Model"] = v4:FindFirstChild("Shovel Grave"),
		["Actions"] = {},
		["Tags"] = { "MISC" }
	},
	["Small Stone Lantern"] = {
		["Description"] = "Glow stoned.",
		["Rarity"] = "Uncommon",
		["Icon"] = "rbxassetid://106313535982394",
		["Model"] = v4:FindFirstChild("Small Stone Lantern"),
		["Actions"] = {},
		["Tags"] = { "MISC" }
	},
	["Small Stone Pad"] = {
		["Description"] = "Rock your garden\'s world.",
		["Rarity"] = "Uncommon",
		["Icon"] = "rbxassetid://76334118664068",
		["Model"] = v4:FindFirstChild("Small Stone Pad"),
		["Actions"] = {},
		["Tags"] = { "MISC" }
	},
	["Large Stone Pad"] = {
		["Description"] = "Rock your garden\'s world.",
		["Rarity"] = "Uncommon",
		["Icon"] = "rbxassetid://136964060505236",
		["Model"] = v4:FindFirstChild("Large Stone Pad"),
		["Actions"] = {},
		["Tags"] = { "MISC" }
	},
	["Stone Lantern"] = {
		["Description"] = "Glow stoned.",
		["Rarity"] = "Uncommon",
		["Icon"] = "rbxassetid://119551465521930",
		["Model"] = v4:FindFirstChild("Stone Lantern"),
		["Actions"] = {},
		["Tags"] = { "MISC" }
	},
	["Viney Beam"] = {
		["Description"] = "Nature\'s way of saying, \'Hang in there.\'",
		["Rarity"] = "Uncommon",
		["Icon"] = "rbxassetid://124170877039835",
		["Model"] = v4:FindFirstChild("Viney Beam"),
		["Actions"] = {},
		["Tags"] = { "MISC" }
	},
	["Water Trough"] = {
		["Description"] = "Hydration station for your green nation.",
		["Rarity"] = "Uncommon",
		["Icon"] = "rbxassetid://75910954482613",
		["Model"] = v4:FindFirstChild("Water Trough"),
		["Actions"] = {},
		["Tags"] = { "MISC" }
	},
	["White Bench"] = {
		["Description"] = "Sit, stay, bloom.",
		["Rarity"] = "Uncommon",
		["Icon"] = "rbxassetid://84377225645349",
		["Model"] = v4:FindFirstChild("White Bench"),
		["Actions"] = {},
		["Tags"] = { "MISC" }
	},
	["Wood Fence"] = {
		["Description"] = "Good fences make good gardeners.",
		["Rarity"] = "Uncommon",
		["Icon"] = "rbxassetid://132290111901072",
		["Model"] = v4:FindFirstChild("Wood Fence"),
		["Actions"] = {},
		["Tags"] = { "MISC" }
	},
	["Small Wood Flooring"] = {
		["Description"] = "Floors so nice, you wood not believe it.",
		["Rarity"] = "Uncommon",
		["Icon"] = "rbxassetid://130831326552652",
		["Model"] = v4:FindFirstChild("Small Wood Flooring"),
		["Actions"] = {},
		["Tags"] = { "MISC" }
	},
	["Medium Wood Flooring"] = {
		["Description"] = "Floors so nice, you wood not believe it.",
		["Rarity"] = "Uncommon",
		["Icon"] = "rbxassetid://77772412695376",
		["Model"] = v4:FindFirstChild("Medium Wood Flooring"),
		["Actions"] = {},
		["Tags"] = { "MISC" }
	},
	["Large Wood Flooring"] = {
		["Description"] = "Floors so nice, you wood not believe it.",
		["Rarity"] = "Uncommon",
		["Icon"] = "rbxassetid://74406299280955",
		["Model"] = v4:FindFirstChild("Large Wood Flooring"),
		["Actions"] = {},
		["Tags"] = { "MISC" }
	},
	["Small Stone Table"] = {
		["Description"] = "Dine rock-style.",
		["Rarity"] = "Uncommon",
		["Icon"] = "rbxassetid://93138997640716",
		["Model"] = v4:FindFirstChild("Small Stone Table"),
		["Actions"] = {},
		["Tags"] = { "MISC" }
	},
	["Medium Stone Table"] = {
		["Description"] = "Dine rock-style.",
		["Rarity"] = "Uncommon",
		["Icon"] = "rbxassetid://83559202798747",
		["Model"] = v4:FindFirstChild("Medium Stone Table"),
		["Actions"] = {},
		["Tags"] = { "MISC" }
	},
	["Long Stone Table"] = {
		["Description"] = "Dine rock-style.",
		["Rarity"] = "Uncommon",
		["Icon"] = "rbxassetid://119328686937204",
		["Model"] = v4:FindFirstChild("Long Stone Table"),
		["Actions"] = {},
		["Tags"] = { "MISC" }
	},
	["Lamp Post"] = {
		["Description"] = "Shine bright like a garden diamond.",
		["Rarity"] = "Rare",
		["Icon"] = "rbxassetid://138744299024719",
		["Model"] = v4:FindFirstChild("Lamp Post"),
		["Actions"] = {},
		["Tags"] = { "MISC" }
	},
	["Bamboo Wind Chime"] = {
		["Description"] = "Let the wind drop the beat.",
		["Rarity"] = "Rare",
		["Icon"] = "rbxassetid://78310105473480",
		["Model"] = v4:FindFirstChild("Bamboo Wind Chime"),
		["Actions"] = {},
		["Tags"] = { "MISC" }
	},
	["Metal Wind Chime"] = {
		["Description"] = "Let the wind drop the beat.",
		["Rarity"] = "Rare",
		["Icon"] = "rbxassetid://111513959090645",
		["Model"] = v4:FindFirstChild("Metal Wind Chime"),
		["Actions"] = {},
		["Tags"] = { "MISC" }
	},
	["Bird Bath"] = {
		["Description"] = "A spa day for your feathered friends.",
		["Rarity"] = "Rare",
		["Icon"] = "rbxassetid://114210337316371",
		["Model"] = v4:FindFirstChild("Bird Bath"),
		["Actions"] = {},
		["Tags"] = { "MISC" }
	},
	["Brown Stone Pillar"] = {
		["Description"] = "Pillars of rock-solid style.",
		["Rarity"] = "Rare",
		["Icon"] = "rbxassetid://80217593163027",
		["Model"] = v4:FindFirstChild("Brown Stone Pillar"),
		["Actions"] = {},
		["Tags"] = { "MISC" }
	},
	["Dark Stone Pillar"] = {
		["Description"] = "Pillars of rock-solid style.",
		["Rarity"] = "Rare",
		["Icon"] = "rbxassetid://115143090894918",
		["Model"] = v4:FindFirstChild("Dark Stone Pillar"),
		["Actions"] = {},
		["Tags"] = { "MISC" }
	},
	["Grey Stone Pillar"] = {
		["Description"] = "Pillars of rock-solid style.",
		["Rarity"] = "Rare",
		["Icon"] = "rbxassetid://108713406223798",
		["Model"] = v4:FindFirstChild("Grey Stone Pillar"),
		["Actions"] = {},
		["Tags"] = { "MISC" }
	},
	["Campfire"] = {
		["Description"] = "For lit garden vibes.",
		["Rarity"] = "Rare",
		["Icon"] = "rbxassetid://114219794929389",
		["Model"] = v4:FindFirstChild("Campfire"),
		["Actions"] = {},
		["Tags"] = { "MISC" }
	},
	["Clothesline"] = {
		["Description"] = "Hang your worries out to dry.",
		["Rarity"] = "Rare",
		["Icon"] = "rbxassetid://135426465898486",
		["Model"] = v4:FindFirstChild("Clothesline"),
		["Actions"] = {},
		["Tags"] = { "MISC" }
	},
	["Cooking Pot"] = {
		["Description"] = "Stirring up some botanical brews.",
		["Rarity"] = "Rare",
		["Icon"] = "rbxassetid://74493838787153",
		["Model"] = v4:FindFirstChild("Cooking Pot"),
		["Actions"] = {},
		["Tags"] = { "MISC" }
	},
	["Curved Canopy"] = {
		["Description"] = "Shelter with arch-appeal.",
		["Rarity"] = "Rare",
		["Icon"] = "rbxassetid://140452365544446",
		["Model"] = v4:FindFirstChild("Curved Canopy"),
		["Actions"] = {},
		["Tags"] = { "MISC" }
	},
	["Flat Canopy"] = {
		["Description"] = "Shelter with arch-appeal.",
		["Rarity"] = "Rare",
		["Icon"] = "rbxassetid://98042972289231",
		["Model"] = v4:FindFirstChild("Flat Canopy"),
		["Actions"] = {},
		["Tags"] = { "MISC" }
	},
	["Small Wood Arbour"] = {
		["Description"] = "Walk this way\226\128\148blossom that way.",
		["Rarity"] = "Rare",
		["Icon"] = "rbxassetid://101767783873802",
		["Model"] = v4:FindFirstChild("Small Wood Arbour"),
		["Actions"] = {},
		["Tags"] = { "MISC" }
	},
	["Square Metal Arbour"] = {
		["Description"] = "Walk this way\226\128\148blossom that way.",
		["Rarity"] = "Rare",
		["Icon"] = "rbxassetid://124482021450642",
		["Model"] = v4:FindFirstChild("Square Metal Arbour"),
		["Actions"] = {},
		["Tags"] = { "MISC" }
	},
	["Small Wood Table"] = {
		["Description"] = "Gather \'round the stump speech.",
		["Rarity"] = "Rare",
		["Icon"] = "rbxassetid://79156265194662",
		["Model"] = v4:FindFirstChild("Small Wood Table"),
		["Actions"] = {},
		["Tags"] = { "MISC" }
	},
	["Large Wood Table"] = {
		["Description"] = "Gather \'round the stump speech.",
		["Rarity"] = "Rare",
		["Icon"] = "rbxassetid://81844858986120",
		["Model"] = v4:FindFirstChild("Large Wood Table"),
		["Actions"] = {},
		["Tags"] = { "MISC" }
	},
	["Wheelbarrow"] = {
		["Description"] = "Hauling blooms and dad jokes since forever.",
		["Rarity"] = "Rare",
		["Icon"] = "rbxassetid://129661977849436",
		["Model"] = v4:FindFirstChild("Wheelbarrow"),
		["Actions"] = {},
		["Tags"] = { "MISC" }
	},
	["Blue Well"] = {
		["Description"] = "Make a wish\226\128\148petals crossed!",
		["Rarity"] = "Legendary",
		["Icon"] = "rbxassetid://137217556459922",
		["Model"] = v4:FindFirstChild("Blue Well"),
		["Actions"] = {},
		["Tags"] = { "MISC" }
	},
	["Brown Well"] = {
		["Description"] = "Make a wish\226\128\148petals crossed!",
		["Rarity"] = "Legendary",
		["Icon"] = "rbxassetid://97081445435777",
		["Model"] = v4:FindFirstChild("Brown Well"),
		["Actions"] = {},
		["Tags"] = { "MISC" }
	},
	["Red Well"] = {
		["Description"] = "Make a wish\226\128\148petals crossed!",
		["Rarity"] = "Legendary",
		["Icon"] = "rbxassetid://100605398217067",
		["Model"] = v4:FindFirstChild("Red Well"),
		["Actions"] = {},
		["Tags"] = { "MISC" }
	},
	["Green Tractor"] = {
		["Description"] = "Crop-tastic cruising.",
		["Rarity"] = "Legendary",
		["Icon"] = "rbxassetid://127815398735746",
		["Model"] = v4:FindFirstChild("Green Tractor"),
		["Actions"] = {},
		["Tags"] = { "MACHINE" }
	},
	["Red Tractor"] = {
		["Description"] = "Crop-tastic cruising.",
		["Rarity"] = "Legendary",
		["Icon"] = "rbxassetid://88340270174678",
		["Model"] = v4:FindFirstChild("Red Tractor"),
		["Actions"] = {},
		["Tags"] = { "MACHINE" }
	},
	["Ring Walkway"] = {
		["Description"] = "Walk in circles, but make it fashion.",
		["Rarity"] = "Legendary",
		["Icon"] = "rbxassetid://111450830262119",
		["Model"] = v4:FindFirstChild("Ring Walkway"),
		["Actions"] = {},
		["Tags"] = { "MISC" }
	},
	["Viney Ring Walkway"] = {
		["Description"] = "Step into the vine zone.",
		["Rarity"] = "Legendary",
		["Icon"] = "rbxassetid://96399926163763",
		["Model"] = v4:FindFirstChild("Viney Ring Walkway"),
		["Actions"] = {},
		["Tags"] = { "MISC" }
	},
	["Large Wood Arbour"] = {
		["Description"] = "Walk this way\226\128\148blossom that way.",
		["Rarity"] = "Legendary",
		["Icon"] = "rbxassetid://114586442817919",
		["Model"] = v4:FindFirstChild("Large Wood Arbour"),
		["Actions"] = {},
		["Tags"] = { "MISC" }
	},
	["Round Metal Arbour"] = {
		["Description"] = "Walk this way\226\128\148blossom that way.",
		["Rarity"] = "Legendary",
		["Icon"] = "rbxassetid://104999736010025",
		["Model"] = v4:FindFirstChild("Round Metal Arbour"),
		["Actions"] = {},
		["Tags"] = { "MISC" }
	},
	["Frog Fountain"] = {
		["Description"] = "Ribbit and relax.",
		["Rarity"] = "Legendary",
		["Icon"] = "rbxassetid://124446917752784",
		["Model"] = v4:FindFirstChild("Frog Fountain"),
		["Actions"] = {},
		["Tags"] = { "MISC" }
	},
	["Arcade Machine"] = {
		["Description"] = "A nostalgic money-eating box that promises endless fun and occasional finger cramps.",
		["Rarity"] = "Legendary",
		["Icon"] = "rbxassetid://80636317407905",
		["Model"] = v4:FindFirstChild("ArcadeMachine"),
		["Actions"] = {},
		["Tags"] = { "MACHINE" }
	},
	["Beach Towel Blue"] = {
		["Description"] = "A portable sandy throne for your sunbathing empire.",
		["Rarity"] = "Rare",
		["Icon"] = "rbxassetid://99004531154140",
		["Model"] = v4:FindFirstChild("BeachTowelBlue"),
		["Actions"] = {},
		["Tags"] = { "MISC" }
	},
	["Beach Towel Pink"] = {
		["Description"] = "A portable sandy throne for your sunbathing empire.",
		["Rarity"] = "Rare",
		["Icon"] = "rbxassetid://109969533331323",
		["Model"] = v4:FindFirstChild("BeachTowelPink"),
		["Actions"] = {},
		["Tags"] = { "MISC" }
	},
	["Beach Towel Red"] = {
		["Description"] = "A portable sandy throne for your sunbathing empire.",
		["Rarity"] = "Rare",
		["Icon"] = "rbxassetid://107120167826878",
		["Model"] = v4:FindFirstChild("BeachTowelRed"),
		["Actions"] = {},
		["Tags"] = { "MISC" }
	},
	["Beach Towel Yellow"] = {
		["Description"] = "A portable sandy throne for your sunbathing empire.",
		["Rarity"] = "Rare",
		["Icon"] = "rbxassetid://116055841484575",
		["Model"] = v4:FindFirstChild("BeachTowelYellow"),
		["Actions"] = {},
		["Tags"] = { "MISC" }
	},
	["Bean Bag Toss Blue"] = {
		["Description"] = "A portable sandy throne for your sunbathing empire.",
		["Rarity"] = "Rare",
		["Icon"] = "rbxassetid://131369979026921",
		["Model"] = v4:FindFirstChild("BeanBagTossBlue"),
		["Actions"] = {},
		["Tags"] = { "MISC" }
	},
	["Bean Bag Toss Red"] = {
		["Description"] = "A portable sandy throne for your sunbathing empire.",
		["Rarity"] = "Rare",
		["Icon"] = "rbxassetid://93045760456133",
		["Model"] = v4:FindFirstChild("BeanBagTossRed"),
		["Actions"] = {},
		["Tags"] = { "MISC" }
	},
	["Blue Beach Ball"] = {
		["Description"] = "A vibrant blue inflatable ball designed for fun and games at the beach or pool.",
		["Rarity"] = "Rare",
		["Icon"] = "rbxassetid://71837625336616",
		["Model"] = v4:FindFirstChild("BlueBeachBall"),
		["Actions"] = {},
		["Tags"] = { "MISC" }
	},
	["Blue Cooler Chest"] = {
		["Description"] = "Keeps your drinks perfectly chilled for those sunny hangouts with friends!",
		["Rarity"] = "Rare",
		["Icon"] = "rbxassetid://103573199416660",
		["Model"] = v4:FindFirstChild("BlueCoolerChest"),
		["Actions"] = {},
		["Tags"] = { "MISC" }
	},
	["Pink Cooler Chest"] = {
		["Description"] = "Keeps your drinks perfectly chilled for those sunny hangouts with friends!",
		["Rarity"] = "Rare",
		["Icon"] = "rbxassetid://100763899517565",
		["Model"] = v4:FindFirstChild("PinkCoolerChest"),
		["Actions"] = {},
		["Tags"] = { "MISC" }
	},
	["Blue Popsicle"] = {
		["Description"] = "A cool, sweet treat that\226\128\153s perfect for beating the summer heat!",
		["Rarity"] = "Rare",
		["Icon"] = "rbxassetid://132544002490198",
		["Model"] = v4:FindFirstChild("BluePopsicle"),
		["Actions"] = {},
		["Tags"] = { "MISC" }
	},
	["Blue Short Beach Chair"] = {
		["Description"] = "Relax in style with this comfy, compact chair made for soaking up the sun by the shore!",
		["Rarity"] = "Rare",
		["Icon"] = "rbxassetid://106287089125606",
		["Model"] = v4:FindFirstChild("BlueShortBeachChair"),
		["Actions"] = {},
		["Tags"] = { "MISC" }
	},
	["Blue Beach Umbrella"] = {
		["Description"] = "Stay cool and shaded while enjoying a day of fun under this breezy blue canopy!",
		["Rarity"] = "Rare",
		["Icon"] = "rbxassetid://95490603436919",
		["Model"] = v4:FindFirstChild("Blue Beach Umbrella"),
		["Actions"] = {},
		["Tags"] = { "MISC" }
	},
	["Cabana"] = {
		["Description"] = "More shade than an umbrella",
		["Rarity"] = "Legendary",
		["Icon"] = "rbxassetid://122281158985851",
		["Model"] = v4:FindFirstChild("Cabana"),
		["Actions"] = {},
		["Tags"] = { "MISC" }
	},
	["Ice Cream Cart"] = {
		["Description"] = "Never to cool for an ice cream",
		["Rarity"] = "Mythical",
		["Icon"] = "rbxassetid://73029854192902",
		["Model"] = v4:FindFirstChild("IceCreamCart"),
		["Actions"] = {},
		["Tags"] = { "MACHINE" }
	},
	["Lemonade Stand"] = {
		["Description"] = "Who doesn\'t like a glass of fresh lemonade",
		["Rarity"] = "Mythical",
		["Icon"] = "rbxassetid://83319614843666",
		["Model"] = v4:FindFirstChild("LemonadeStand"),
		["Actions"] = {},
		["Tags"] = { "MISC" }
	},
	["Market Cart"] = {
		["Description"] = "Always great prices!",
		["Rarity"] = "Mythical",
		["Icon"] = "rbxassetid://110100785748233",
		["Model"] = v4:FindFirstChild("MarketCart"),
		["Actions"] = {},
		["Tags"] = { "MISC" }
	},
	["Red Surf Board"] = {
		["Description"] = "Great board to ride the waves, easy to see against the blue ocean",
		["Rarity"] = "Rare",
		["Icon"] = "rbxassetid://90176745523850",
		["Model"] = v4:FindFirstChild("RedSurfBoard"),
		["Actions"] = {},
		["Tags"] = { "MISC" }
	},
	["Blue Surf Board"] = {
		["Description"] = "Great board to ride the waves, not easy to see against the blue ocean",
		["Rarity"] = "Rare",
		["Icon"] = "rbxassetid://95460515956088",
		["Model"] = v4:FindFirstChild("BlueSurfBoard"),
		["Actions"] = {},
		["Tags"] = { "MISC" }
	},
	["Yellow Surf Board"] = {
		["Description"] = "Great board to ride the waves, easy to see against the blue ocean",
		["Rarity"] = "Rare",
		["Icon"] = "rbxassetid://89453521848259",
		["Model"] = v4:FindFirstChild("YellowSurfBoard"),
		["Actions"] = {},
		["Tags"] = { "MISC" }
	},
	["Pink Surf Board"] = {
		["Description"] = "Great board to ride the waves, easy to see against the blue ocean",
		["Rarity"] = "Rare",
		["Icon"] = "rbxassetid://114981177780072",
		["Model"] = v4:FindFirstChild("PinkSurfBoard"),
		["Actions"] = {},
		["Tags"] = { "MISC" }
	},
	["Pink Beach Ball"] = {
		["Description"] = "A bright pink inflatable ball designed for fun and games at the beach or pool.",
		["Rarity"] = "Rare",
		["Icon"] = "rbxassetid://117179532514857",
		["Model"] = v4:FindFirstChild("PinkBeachBall"),
		["Actions"] = {},
		["Tags"] = { "MISC" }
	},
	["Pink Popsicle"] = {
		["Description"] = "A cool, sweet treat that\226\128\153s perfect for beating the summer heat!",
		["Rarity"] = "Rare",
		["Icon"] = "rbxassetid://138395803583239",
		["Model"] = v4:FindFirstChild("PinkPopsicle"),
		["Actions"] = {},
		["Tags"] = { "MISC" }
	},
	["Pink Short Beach Chair"] = {
		["Description"] = "Relax in style with this comfy, compact chair made for soaking up the sun by the shore!",
		["Rarity"] = "Rare",
		["Icon"] = "rbxassetid://102436585837305",
		["Model"] = v4:FindFirstChild("PinkShortBeachChair"),
		["Actions"] = {},
		["Tags"] = { "MISC" }
	},
	["Pink Beach Umbrella"] = {
		["Description"] = "Stay cool and shaded while enjoying a day of fun under this breezy pink canopy!",
		["Rarity"] = "Rare",
		["Icon"] = "rbxassetid://104654926646080",
		["Model"] = v4:FindFirstChild("Pink Beach Umbrella"),
		["Actions"] = {},
		["Tags"] = { "MISC" }
	},
	["Red Beach Ball"] = {
		["Description"] = "A red inflatable ball designed for fun and games at the beach or pool.",
		["Rarity"] = "Rare",
		["Icon"] = "rbxassetid://80096178020566",
		["Model"] = v4:FindFirstChild("RedBeachBall"),
		["Actions"] = {},
		["Tags"] = { "MISC" }
	},
	["Red Cooler Chest"] = {
		["Description"] = "Keeps your drinks perfectly chilled for those sunny hangouts with friends!",
		["Rarity"] = "Rare",
		["Icon"] = "rbxassetid://103299416006910",
		["Model"] = v4:FindFirstChild("RedCoolerChest"),
		["Actions"] = {},
		["Tags"] = { "MISC" }
	},
	["Blue Hammock"] = {
		["Description"] = "A great spot for a nap, now in blue!",
		["Rarity"] = "Rare",
		["Icon"] = "rbxassetid://94505677915520",
		["Model"] = v4:FindFirstChild("BlueHammock"),
		["Actions"] = {},
		["Tags"] = { "MISC" }
	},
	["Red Hammock"] = {
		["Description"] = "A great spot for a nap, now in red!",
		["Rarity"] = "Rare",
		["Icon"] = "rbxassetid://82064982360485",
		["Model"] = v4:FindFirstChild("RedHammock"),
		["Actions"] = {},
		["Tags"] = { "MISC" }
	},
	["Red Long Beach Chair"] = {
		["Description"] = "Now all we need is a beach.",
		["Rarity"] = "Rare",
		["Icon"] = "rbxassetid://88627619442635",
		["Model"] = v4:FindFirstChild("RedLongBeachChair"),
		["Actions"] = {},
		["Tags"] = { "MISC" }
	},
	["Red Popsicle"] = {
		["Description"] = "A cool, sweet treat that\226\128\153s perfect for beating the summer heat!",
		["Rarity"] = "Rare",
		["Icon"] = "rbxassetid://120788253745071",
		["Model"] = v4:FindFirstChild("RedPopsicle"),
		["Actions"] = {},
		["Tags"] = { "MISC" }
	},
	["Red Short Beach Chair"] = {
		["Description"] = "Relax in style with this comfy, compact chair made for soaking up the sun by the shore!",
		["Rarity"] = "Rare",
		["Icon"] = "rbxassetid://106546394681244",
		["Model"] = v4:FindFirstChild("RedShortBeachChair"),
		["Actions"] = {},
		["Tags"] = { "MISC" }
	},
	["Red Beach Umbrella"] = {
		["Description"] = "Stay cool and shaded while enjoying a day of fun under this red canopy!",
		["Rarity"] = "Rare",
		["Icon"] = "rbxassetid://136165125481786",
		["Model"] = v4:FindFirstChild("Red Beach Umbrella"),
		["Actions"] = {},
		["Tags"] = { "MISC" }
	},
	["Speakers"] = {
		["Description"] = "Creates a lot of noise",
		["Rarity"] = "Legendary",
		["Icon"] = "rbxassetid://80430866675960",
		["Model"] = v4:FindFirstChild("Speakers"),
		["Actions"] = {},
		["Tags"] = { "MACHINE" }
	},
	["Tiki Bar"] = {
		["Description"] = "The one stop place to get all your cool drinks and refreshments.",
		["Rarity"] = "Mythical",
		["Icon"] = "rbxassetid://106886101958316",
		["Model"] = v4:FindFirstChild("TikiBar"),
		["Actions"] = {},
		["Tags"] = { "MISC" }
	},
	["Volley Ball Net"] = {
		["Description"] = "Great place to make use of all those beach balls",
		["Rarity"] = "Legendary",
		["Icon"] = "rbxassetid://129721262517254",
		["Model"] = v4:FindFirstChild("VolleyBallNet"),
		["Actions"] = {},
		["Tags"] = { "MISC" }
	},
	["Yellow Beach Ball"] = {
		["Description"] = "A yellow inflatable ball designed for fun and games at the beach or pool.",
		["Rarity"] = "Rare",
		["Icon"] = "rbxassetid://136111379252509",
		["Model"] = v4:FindFirstChild("YellowBeachBall"),
		["Actions"] = {},
		["Tags"] = { "MISC" }
	},
	["Yellow Long Beach Chair"] = {
		["Description"] = "Now all we need is a beach.",
		["Rarity"] = "Rare",
		["Icon"] = "rbxassetid://120486654324450",
		["Model"] = v4:FindFirstChild("YellowLongBeachChair"),
		["Actions"] = {},
		["Tags"] = { "MISC" }
	},
	["Yellow Short Beach Chair"] = {
		["Description"] = "Relax in style with this comfy, compact chair made for soaking up the sun by the shore!",
		["Rarity"] = "Rare",
		["Icon"] = "rbxassetid://95784261871354",
		["Model"] = v4:FindFirstChild("YellowShortBeachChair"),
		["Actions"] = {},
		["Tags"] = { "MISC" }
	},
	["Yellow Beach Umbrella"] = {
		["Description"] = "Stay cool and shaded while enjoying a day of fun under this yellow canopy!",
		["Rarity"] = "Rare",
		["Icon"] = "rbxassetid://72656459420319",
		["Model"] = v4:FindFirstChild("Yellow Beach Umbrella"),
		["Actions"] = {},
		["Tags"] = { "MISC" }
	},
	["Mower"] = {
		["Description"] = "Not to be confused with the other Moa",
		["Rarity"] = "Legendary",
		["Icon"] = "rbxassetid://135914882416689",
		["Model"] = v4:FindFirstChild("Mower"),
		["Actions"] = {},
		["Tags"] = { "MACHINE" }
	},
	["Beta Gnome"] = {
		["Description"] = "Crash test Gnomey.",
		["Rarity"] = "Rare",
		["Icon"] = "rbxassetid://82942574971091",
		["Model"] = v4:FindFirstChild("BetaGnome"),
		["Actions"] = {},
		["Tags"] = { "GNOME" }
	},
	["Green Gnome"] = {
		["Description"] = "Gree-gnome.",
		["Rarity"] = "Rare",
		["Icon"] = "rbxassetid://114712911840962",
		["Model"] = v4:FindFirstChild("GreenGnome"),
		["Actions"] = {},
		["Tags"] = { "GNOME" }
	},
	["Blue Gnome"] = {
		["Description"] = "No one hates blue!",
		["Rarity"] = "Rare",
		["Icon"] = "rbxassetid://126793677651227",
		["Model"] = v4:FindFirstChild("BlueGnome"),
		["Actions"] = {},
		["Tags"] = { "GNOME" }
	},
	["No Trespassing Sign"] = {
		["Description"] = "Sign here for sass.",
		["Rarity"] = "Rare",
		["Icon"] = "rbxassetid://111642019686941",
		["Model"] = v4:FindFirstChild("NoTrespassingSign"),
		["Actions"] = {},
		["Tags"] = { "SIGN" }
	},
	["Beware Of Dog Sign"] = {
		["Description"] = "Sign here for sass.",
		["Rarity"] = "Rare",
		["Icon"] = "rbxassetid://89778210976821",
		["Model"] = v4:FindFirstChild("BewareOfDogSign"),
		["Actions"] = {},
		["Tags"] = { "SIGN" }
	},
	["Mean Gardener Sign"] = {
		["Description"] = "Sign here for sass.",
		["Rarity"] = "Rare",
		["Icon"] = "rbxassetid://74001450966740",
		["Model"] = v4:FindFirstChild("MeanGardenerSign"),
		["Actions"] = {},
		["Tags"] = { "SIGN" }
	},
	["Keep Out Sign"] = {
		["Description"] = "Sign here for sass.",
		["Rarity"] = "Rare",
		["Icon"] = "rbxassetid://137279504847698",
		["Model"] = v4:FindFirstChild("KeepOutSign"),
		["Actions"] = {},
		["Tags"] = { "SIGN" }
	},
	["Smile On Cam Sign"] = {
		["Description"] = "Sign here for sass.",
		["Rarity"] = "Rare",
		["Icon"] = "rbxassetid://135786183918317",
		["Model"] = v4:FindFirstChild("SmileOnCamSign"),
		["Actions"] = {},
		["Tags"] = { "SIGN" }
	},
	["No Stealing Sign"] = {
		["Description"] = "Sign here for sass.",
		["Rarity"] = "Legendary",
		["Icon"] = "rbxassetid://96708017956784",
		["Model"] = v4:FindFirstChild("NoStealingSign"),
		["Actions"] = {},
		["Tags"] = { "SIGN" }
	},
	["Sleepy Gnome"] = {
		["Description"] = "Catching some zzzzeeds.",
		["Rarity"] = "Rare",
		["Icon"] = "rbxassetid://104198914328516",
		["Model"] = v4:FindFirstChild("SleepyGnome"),
		["Actions"] = {},
		["Tags"] = { "GNOME" }
	},
	["Silly Gnome"] = {
		["Description"] = "If you wait long enough it\'ll do a backflip",
		["Rarity"] = "Rare",
		["Icon"] = "rbxassetid://85284169151224",
		["Model"] = v4:FindFirstChild("SillyGnome"),
		["Actions"] = {},
		["Tags"] = { "GNOME" }
	},
	["Crazy Gnome"] = {
		["Description"] = "Gnome way out.",
		["Rarity"] = "Rare",
		["Icon"] = "rbxassetid://114913163768225",
		["Model"] = v4:FindFirstChild("CrazyGnome"),
		["Actions"] = {},
		["Tags"] = { "GNOME" }
	},
	["Grumpy Gnome"] = {
		["Description"] = "You are gnot going to like me when grumpy!",
		["Rarity"] = "Rare",
		["Icon"] = "rbxassetid://113529246996386",
		["Model"] = v4:FindFirstChild("GrumpyGnome"),
		["Actions"] = {},
		["Tags"] = { "GNOME" }
	},
	["Fearless Gnome"] = {
		["Description"] = "I AM LE-GNOME!",
		["Rarity"] = "Legendary",
		["Icon"] = "rbxassetid://71291637119739",
		["Model"] = v4:FindFirstChild("FearlessGnome"),
		["Actions"] = {},
		["Tags"] = { "GNOME" }
	},
	["Roundabout"] = {
		["Description"] = "Spin your garden drama away.",
		["Rarity"] = "Legendary",
		["Icon"] = "rbxassetid://127576228279994",
		["Model"] = v4:FindFirstChild("Roundabout"),
		["Actions"] = {},
		["Tags"] = { "MISC" }
	},
	["Seesaw"] = {
		["Description"] = "Ups and downs, but make it playful.",
		["Rarity"] = "Legendary",
		["Icon"] = "rbxassetid://129298071024340",
		["Model"] = v4:FindFirstChild("Seesaw"),
		["Actions"] = {},
		["Tags"] = { "MISC" }
	},
	["Swing set"] = {
		["Description"] = "Swinging into serenity.",
		["Rarity"] = "Legendary",
		["Icon"] = "rbxassetid://97650946469601",
		["Model"] = v4:FindFirstChild("Swingset"),
		["Actions"] = {},
		["Tags"] = { "MISC" }
	},
	["Red Flag"] = {
		["Description"] = "Claim your petal territory.",
		["Rarity"] = "Legendary",
		["Icon"] = "rbxassetid://108826376055758",
		["Model"] = v4:FindFirstChild("RedFlag"),
		["Actions"] = {},
		["Tags"] = { "MISC" }
	},
	["Blue Flag"] = {
		["Description"] = "Claim your petal territory.",
		["Rarity"] = "Legendary",
		["Icon"] = "rbxassetid://86956824591443",
		["Model"] = v4:FindFirstChild("BlueFlag"),
		["Actions"] = {},
		["Tags"] = { "MISC" }
	},
	["Trampoline"] = {
		["Description"] = "Bounce into botanical bliss.",
		["Rarity"] = "Mythical",
		["Icon"] = "rbxassetid://72039279547348",
		["Model"] = v4:FindFirstChild("Trampoline"),
		["Actions"] = {},
		["Tags"] = { "MISC" }
	},
	["Raphael Gnome"] = {
		["Description"] = "A gnome of Raphael, owner of the pet stall!",
		["Rarity"] = "Rare",
		["Icon"] = "rbxassetid://83040285262266",
		["Model"] = v4:FindFirstChild("RaphaelGnome"),
		["Actions"] = {},
		["Tags"] = { "GNOME" }
	},
	["Steven Gnome"] = {
		["Description"] = "A gnome of Steven, owner of the sell stall!",
		["Rarity"] = "Rare",
		["Icon"] = "rbxassetid://130945698778443",
		["Model"] = v4:FindFirstChild("StevenGnome"),
		["Actions"] = {},
		["Tags"] = { "GNOME" }
	},
	["Eloise Gnome"] = {
		["Description"] = "A gnome of Eloise, owner of the gear shop!",
		["Rarity"] = "Legendary",
		["Icon"] = "rbxassetid://111228051132202",
		["Model"] = v4:FindFirstChild("EloiseGnome"),
		["Actions"] = {},
		["Tags"] = { "GNOME" }
	},
	["Sam Gnome"] = {
		["Description"] = "A gnome of Sam, owner of the seed shop!",
		["Rarity"] = "Legendary",
		["Icon"] = "rbxassetid://120985613541798",
		["Model"] = v4:FindFirstChild("SamGnome"),
		["Actions"] = {},
		["Tags"] = { "GNOME" }
	},
	["Cleetus Gnome"] = {
		["Description"] = "HOWDY!",
		["Rarity"] = "Mythical",
		["Icon"] = "rbxassetid://105475165224126",
		["Model"] = v4:FindFirstChild("CleetusGnome"),
		["Actions"] = {},
		["Tags"] = { "GNOME" }
	},
	["Builderman Gnome"] = {
		["Description"] = "He will design a gnomenclature!",
		["Rarity"] = "Mythical",
		["Icon"] = "rbxassetid://112903384537909",
		["Model"] = v4:FindFirstChild("BuildermanGnome"),
		["Actions"] = {},
		["Tags"] = { "GNOME" }
	},
	["Bacon Gnome"] = {
		["Description"] = "Cant get enough of (GNO)ME!",
		["Rarity"] = "Mythical",
		["Icon"] = "rbxassetid://120778286675384",
		["Model"] = v4:FindFirstChild("BaconGnome"),
		["Actions"] = {},
		["Tags"] = { "GNOME" }
	},
	["Zombie Gnome"] = {
		["Description"] = "These are real zombie hours!",
		["Rarity"] = "Mythical",
		["Icon"] = "rbxassetid://133857140992876",
		["Model"] = v4:FindFirstChild("ZombieGnome"),
		["Actions"] = {},
		["Tags"] = { "GNOME" }
	},
	["Noob Gnome"] = {
		["Description"] = "You as a gnome!",
		["Rarity"] = "Mythical",
		["Icon"] = "rbxassetid://98160377296946",
		["Model"] = v4:FindFirstChild("NoobGnome"),
		["Actions"] = {},
		["Tags"] = { "GNOME" }
	},
	["Gold Gnome"] = {
		["Description"] = "You\'ve been golden gnomed!",
		["Rarity"] = "Divine",
		["Icon"] = "rbxassetid://107517587303429",
		["Model"] = v4:FindFirstChild("GoldGnome"),
		["Actions"] = {},
		["Tags"] = { "GNOME" }
	},
	["Female Scarecrow"] = {
		["Description"] = "Scare the crows, charm the neighbors.",
		["Rarity"] = "Rare",
		["Icon"] = "rbxassetid://104939198269666",
		["Model"] = v4:FindFirstChild("FemaleScarecrow"),
		["Actions"] = {},
		["Tags"] = { "STATUE" }
	},
	["Male Scarecrow"] = {
		["Description"] = "Scare the crows, charm the neighbors.",
		["Rarity"] = "Rare",
		["Icon"] = "rbxassetid://135026002683202",
		["Model"] = v4:FindFirstChild("MaleScarecrow"),
		["Actions"] = {},
		["Tags"] = { "STATUE" }
	},
	["Stone Mango Statue"] = {
		["Description"] = "Rock solid style for your garden!",
		["Rarity"] = "Legendary",
		["Icon"] = "rbxassetid://91117322281959",
		["Model"] = v4:FindFirstChild("StoneMangoStatue"),
		["Actions"] = {},
		["Tags"] = { "STATUE" }
	},
	["Mossy Stone Blossom Statue"] = {
		["Description"] = "Rock solid style for your garden!",
		["Rarity"] = "Legendary",
		["Icon"] = "rbxassetid://125324768942930",
		["Model"] = v4:FindFirstChild("MossyStoneBlossomStatue"),
		["Actions"] = {},
		["Tags"] = { "STATUE" }
	},
	["Stone Candy Blossom Statue"] = {
		["Description"] = "Rock solid style for your garden!",
		["Rarity"] = "Mythical",
		["Icon"] = "rbxassetid://107207612180537",
		["Model"] = v4:FindFirstChild("StoneCandyBlossomStatue"),
		["Actions"] = {},
		["Tags"] = { "STATUE" }
	},
	["Stone Bunny Statue"] = {
		["Description"] = "A stone bunny who\226\128\153s been guarding gardens longer than anyone can remember.",
		["Rarity"] = "Legendary",
		["Icon"] = "rbxassetid://83622392226670",
		["Model"] = v4:FindFirstChild("StoneBunnyStatue"),
		["Actions"] = {},
		["Tags"] = { "STATUE" }
	},
	["Gold Pillar"] = {
		["Description"] = "A shiny gold pillar, way too fancy for a vegetable patch.",
		["Rarity"] = "Mythical",
		["Icon"] = "rbxassetid://73954265276442",
		["Model"] = v4:FindFirstChild("GoldPillar"),
		["Actions"] = {},
		["Tags"] = { "MISC" }
	},
	["Gold Fire Pit"] = {
		["Description"] = "A dazzling firepit.",
		["Rarity"] = "Mythical",
		["Icon"] = "rbxassetid://138669093930760",
		["Model"] = v4:FindFirstChild("GoldFirePit"),
		["Actions"] = {},
		["Tags"] = { "MISC" }
	},
	["Gold Torii"] = {
		["Description"] = "A golden gateway that welcomes good vibes.",
		["Rarity"] = "Divine",
		["Icon"] = "rbxassetid://133029271065028",
		["Model"] = v4:FindFirstChild("GoldTorii"),
		["Actions"] = {},
		["Tags"] = { "MISC" }
	},
	["Gold Water Fountain"] = {
		["Description"] = "Golden water not included.",
		["Rarity"] = "Divine",
		["Icon"] = "rbxassetid://133358999373894",
		["Model"] = v4:FindFirstChild("GoldWaterFountain"),
		["Actions"] = {},
		["Tags"] = { "MISC" }
	},
	["Gold Candy Blossom Statue"] = {
		["Description"] = "Rock solid style for your garden!",
		["Rarity"] = "Divine",
		["Icon"] = "rbxassetid://136237571582291",
		["Model"] = v4:FindFirstChild("GoldCandyBlossomStatue"),
		["Actions"] = {},
		["Tags"] = { "STATUE" }
	},
	["Platinum Candy Blossom Statue"] = {
		["Description"] = "Rock solid style for your garden!",
		["Rarity"] = "Prismatic",
		["Icon"] = "rbxassetid://97698023241956",
		["Model"] = v4:FindFirstChild("PlatinumCandyBlossomStatue"),
		["Actions"] = {},
		["Tags"] = { "STATUE" }
	},
	["Twilight Ring Walkway"] = {
		["Description"] = "Rock solid style for your garden!",
		["Rarity"] = "Mythical",
		["Icon"] = "rbxassetid://108295843838649",
		["Model"] = v4:FindFirstChild("Twilight Ring Walkway"),
		["Actions"] = {},
		["Tags"] = { "MISC" }
	},
	["Twilight Pillar"] = {
		["Description"] = "Imbued with the moon\'s energy.",
		["Rarity"] = "Mythical",
		["Icon"] = "rbxassetid://76251994949545",
		["Model"] = v4:FindFirstChild("Twilight Pillar"),
		["Actions"] = {},
		["Tags"] = { "MISC" }
	},
	["Twilight Fence"] = {
		["Description"] = "It shimmers with the light of the moon.",
		["Rarity"] = "Mythical",
		["Icon"] = "rbxassetid://111459308259276",
		["Model"] = v4:FindFirstChild("Twilight Fence"),
		["Actions"] = {},
		["Tags"] = { "MISC" }
	},
	["Twilight Night Owl Statue"] = {
		["Description"] = "Hoo, hoo. Who? Me?",
		["Rarity"] = "Mythical",
		["Icon"] = "rbxassetid://71069798187910",
		["Model"] = v4:FindFirstChild("Twilight Night Owl Statue"),
		["Actions"] = {},
		["Tags"] = { "STATUE" }
	},
	["Twilight Fire Pit"] = {
		["Description"] = "The fire seems to be cold.",
		["Rarity"] = "Mythical",
		["Icon"] = "rbxassetid://128525890363803",
		["Model"] = v4:FindFirstChild("Twilight Fire Pit"),
		["Actions"] = {},
		["Tags"] = { "MISC" }
	},
	["Blood Bench"] = {
		["Description"] = "A crimson seat for daring souls who love the night.",
		["Rarity"] = "Mythical",
		["Icon"] = "rbxassetid://91426040633172",
		["Model"] = v4:FindFirstChild("Blood Bench"),
		["Actions"] = {},
		["Tags"] = { "MISC" }
	},
	["Blood Lamp"] = {
		["Description"] = "A blood-red light that casts a haunting glow.",
		["Rarity"] = "Mythical",
		["Icon"] = "rbxassetid://130449439996161",
		["Model"] = v4:FindFirstChild("Blood Lamp"),
		["Actions"] = {},
		["Tags"] = { "MISC" }
	},
	["Blood Chain"] = {
		["Description"] = "Chains that emit a dark, magical pulse.",
		["Rarity"] = "Mythical",
		["Icon"] = "rbxassetid://129878935477772",
		["Model"] = v4:FindFirstChild("Blood Chain"),
		["Actions"] = {},
		["Tags"] = { "MISC" }
	},
	["Blood Fence"] = {
		["Description"] = "A fence dyed with the eerie glow of the blood moon.",
		["Rarity"] = "Mythical",
		["Icon"] = "rbxassetid://114306578289240",
		["Model"] = v4:FindFirstChild("Blood Fence"),
		["Actions"] = {},
		["Tags"] = { "MISC" }
	},
	["Blood Fire Pit"] = {
		["Description"] = "A fire pit that burns with an unsettling crimson flame.",
		["Rarity"] = "Mythical",
		["Icon"] = "rbxassetid://87320185293134",
		["Model"] = v4:FindFirstChild("Blood Fire Pit"),
		["Actions"] = {},
		["Tags"] = { "MISC" }
	},
	["Bee Chair"] = {
		["Description"] = "A bee-sized chair or a chair-sized bee? Neither.",
		["Rarity"] = "Common",
		["Icon"] = "rbxassetid://124322647736138",
		["Model"] = v4:FindFirstChild("BeeChair"),
		["Actions"] = {},
		["Tags"] = { "MISC" }
	},
	["Honey Comb"] = {
		["Description"] = "Excellent structural integrity.",
		["Rarity"] = "Rare",
		["Icon"] = "rbxassetid://127458246297955",
		["Model"] = v4:FindFirstChild("HoneyComb"),
		["Actions"] = {},
		["Tags"] = { "MISC" }
	},
	["Honey Walkway"] = {
		["Description"] = "Watch out for drips.",
		["Rarity"] = "Rare",
		["Icon"] = "rbxassetid://92765418822065",
		["Model"] = v4:FindFirstChild("HoneyWalkway"),
		["Actions"] = {},
		["Tags"] = { "MISC" }
	},
	["Honey Torch"] = {
		["Description"] = "The honey emits a strange glow.",
		["Rarity"] = "Legendary",
		["Icon"] = "rbxassetid://73494334572183",
		["Model"] = v4:FindFirstChild("HoneyTorch"),
		["Actions"] = {},
		["Tags"] = { "MISC" }
	},
	["Honey Barrel"] = {
		["Description"] = "I hope they don\'t want this back.",
		["Rarity"] = "Mythical",
		["Icon"] = "rbxassetid://95914467481199",
		["Model"] = v4:FindFirstChild("HoneyBarrel"),
		["Actions"] = {},
		["Tags"] = { "MISC" }
	},
	["Honey Fountain"] = {
		["Description"] = "The perfect companion for a stack of buttered toast.",
		["Rarity"] = "Mythical",
		["Icon"] = "rbxassetid://77404037269428",
		["Model"] = v4:FindFirstChild("HoneyFountain"),
		["Actions"] = {},
		["Tags"] = { "MISC" }
	},
	["Honey Pillar"] = {
		["Description"] = "Greek-designed, bee-built.",
		["Rarity"] = "Mythical",
		["Icon"] = "rbxassetid://134173394113465",
		["Model"] = v4:FindFirstChild("HoneyPillar"),
		["Actions"] = {},
		["Tags"] = { "MISC" }
	},
	["Honey Pot"] = {
		["Description"] = "Mythical of sweet, sticky honey.",
		["Rarity"] = "Mythical",
		["Icon"] = "rbxassetid://133164059676431",
		["Model"] = v4:FindFirstChild("HoneyPot"),
		["Actions"] = {},
		["Tags"] = { "MISC" }
	},
	["Bee Podium"] = {
		["Description"] = "Her Majesty is on display.",
		["Rarity"] = "Prismatic",
		["Icon"] = "rbxassetid://130464966061346",
		["Model"] = v4:FindFirstChild("BeePodium"),
		["Actions"] = {},
		["Tags"] = { "MACHINE" }
	},
	["BeeHive"] = {
		["Description"] = "Infinite honey glitch.",
		["Rarity"] = "Mythical",
		["Icon"] = "rbxassetid://77959075692985",
		["Model"] = v4:FindFirstChild("ActiveBeeHive"),
		["Actions"] = {},
		["Tags"] = { "MISC" }
	},
	["Honey Gate"] = {
		["Description"] = "The entry to the hive.",
		["Rarity"] = "Mythical",
		["Icon"] = "rbxassetid://101078824256085",
		["Model"] = v4:FindFirstChild("HoneyGate"),
		["Actions"] = {},
		["Tags"] = { "MISC" }
	},
	["Bee Flag"] = {
		["Description"] = "A sticky flagpole representing bee-kind.",
		["Rarity"] = "Mythical",
		["Icon"] = "rbxassetid://126322654949831",
		["Model"] = v4:FindFirstChild("BeeFlag"),
		["Actions"] = {},
		["Tags"] = { "MISC" }
	},
	["Bee Hunter Statue"] = {
		["Description"] = "Never stand between a bee hunter and his honey.",
		["Rarity"] = "Prismatic",
		["Icon"] = "rbxassetid://74475541400439",
		["Model"] = v4:FindFirstChild("BeeHunterStatue"),
		["Actions"] = {},
		["Tags"] = { "STATUE" }
	},
	["Bee Mailbox"] = {
		["Description"] = "You\'ve got mail!",
		["Rarity"] = "Mythical",
		["Icon"] = "rbxassetid://97954964771347",
		["Model"] = v4:FindFirstChild("BeeMailbox"),
		["Actions"] = {},
		["Tags"] = { "MISC" }
	},
	["Bee Painting"] = {
		["Description"] = "According to all known laws of aviation...",
		["Rarity"] = "Mythical",
		["Icon"] = "rbxassetid://87070081617616",
		["Model"] = v4:FindFirstChild("BeePainting"),
		["Actions"] = {},
		["Tags"] = { "MISC" }
	},
	["Bee Rug"] = {
		["Description"] = "Footwear recommended.",
		["Rarity"] = "Mythical",
		["Icon"] = "rbxassetid://111312932734327",
		["Model"] = v4:FindFirstChild("BeeRug"),
		["Actions"] = {},
		["Tags"] = { "MISC" }
	},
	["Bee Stinger Painting"] = {
		["Description"] = "Pointy.",
		["Rarity"] = "Mythical",
		["Icon"] = "rbxassetid://98657062197407",
		["Model"] = v4:FindFirstChild("BeeStingerPainting"),
		["Actions"] = {},
		["Tags"] = { "MISC" }
	},
	["Queen Bee Painting"] = {
		["Description"] = "A painting dedicated to her royal highness.",
		["Rarity"] = "Mythical",
		["Icon"] = "rbxassetid://95766006476194",
		["Model"] = v4:FindFirstChild("QueenBeePainting"),
		["Actions"] = {},
		["Tags"] = { "MISC" }
	},
	["1x1x1x1 Gnome"] = {
		["Description"] = "A mysterious gnome with powers nobody dares to question.",
		["Rarity"] = "Mythical",
		["Icon"] = "rbxassetid://131967223688140",
		["Model"] = v4:FindFirstChild("1x1x1x1Gnome"),
		["Actions"] = {},
		["Tags"] = { "GNOME" }
	},
	["Bloxy Cola Gnome"] = {
		["Description"] = "This gnome runs purely on sugar and carbonated chaos.",
		["Rarity"] = "Mythical",
		["Icon"] = "rbxassetid://75332180369848",
		["Model"] = v4:FindFirstChild("BloxyColaGnome"),
		["Actions"] = {},
		["Tags"] = { "GNOME" }
	},
	["Candy Blossom Gnome"] = {
		["Description"] = "A sweet little guardian of candy trees and sugar dreams.",
		["Rarity"] = "Mythical",
		["Icon"] = "rbxassetid://92609695018363",
		["Model"] = v4:FindFirstChild("CandyBlossomGnome"),
		["Actions"] = {},
		["Tags"] = { "GNOME" }
	},
	["Guest Gnome"] = {
		["Description"] = "A nostalgic gnome from the days before usernames were cool.",
		["Rarity"] = "Mythical",
		["Icon"] = "rbxassetid://100014278372173",
		["Model"] = v4:FindFirstChild("GuestGnome"),
		["Actions"] = {},
		["Tags"] = { "GNOME" }
	},
	["Shedletsky Gnome"] = {
		["Description"] = "A legendary gnome with hair as epic as his adventures.",
		["Rarity"] = "Divine",
		["Icon"] = "rbxassetid://117836343477747",
		["Model"] = v4:FindFirstChild("ShedletskyGnome"),
		["Actions"] = {},
		["Tags"] = { "GNOME" }
	},
	["Blue Long Beach Chair"] = {
		["Description"] = "Now all we need is a beach.",
		["Rarity"] = "Legendary",
		["Icon"] = "rbxassetid://71991465120758",
		["Model"] = v4:FindFirstChild("Blue Long Beach Chair"),
		["Actions"] = {},
		["Tags"] = { "MISC" }
	},
	["Pink Long Beach Chair"] = {
		["Description"] = "Now all we need is a beach.",
		["Rarity"] = "Legendary",
		["Icon"] = "rbxassetid://91651365490043",
		["Model"] = v4:FindFirstChild("Pink Long Beach Chair"),
		["Actions"] = {},
		["Tags"] = { "MISC" }
	},
	["Heart"] = {
		["Description"] = "The archway of loooove.",
		["Rarity"] = "Legendary",
		["Icon"] = "rbxassetid://108059871334863",
		["Model"] = v4:FindFirstChild("Heart"),
		["Actions"] = {},
		["Tags"] = { "MISC" }
	},
	["Slide"] = {
		["Description"] = "Wheeeeeee!",
		["Rarity"] = "Legendary",
		["Icon"] = "rbxassetid://105765854848210",
		["Model"] = v4:FindFirstChild("Slide"),
		["Actions"] = {},
		["Tags"] = { "MISC" }
	},
	["Pool"] = {
		["Description"] = "Fancy a swim?",
		["Rarity"] = "Legendary",
		["Icon"] = "rbxassetid://104950169841584",
		["Model"] = v4:FindFirstChild("Pool"),
		["Actions"] = {},
		["Tags"] = { "MISC" }
	},
	["Boat Painting"] = {
		["Description"] = "Do not use as a buoyancy device.",
		["Rarity"] = "Legendary",
		["Icon"] = "rbxassetid://113199592747087",
		["Model"] = v4:FindFirstChild("Boat Painting"),
		["Actions"] = {},
		["Tags"] = { "MISC" }
	},
	["Palm Tree Painting"] = {
		["Description"] = "Masterfully painted by a swarm of crabs.",
		["Rarity"] = "Legendary",
		["Icon"] = "rbxassetid://122087058031386",
		["Model"] = v4:FindFirstChild("Palm Tree Painting"),
		["Actions"] = {},
		["Tags"] = { "MISC" }
	},
	["Sun Carpet"] = {
		["Description"] = "The sun is high in the sky... no, it\'s on the floor!",
		["Rarity"] = "Legendary",
		["Icon"] = "rbxassetid://132563627216085",
		["Model"] = v4:FindFirstChild("Sun Carpet"),
		["Actions"] = {},
		["Tags"] = { "MISC" }
	},
	["Sun Gate"] = {
		["Description"] = "Enough to brighten the day of anyone who walks through.",
		["Rarity"] = "Legendary",
		["Icon"] = "rbxassetid://77503031812482",
		["Model"] = v4:FindFirstChild("Sun Gate"),
		["Actions"] = {},
		["Tags"] = { "MISC" }
	},
	["Sun Painting"] = {
		["Description"] = "A beautiful sunset.",
		["Rarity"] = "Legendary",
		["Icon"] = "rbxassetid://135714213682077",
		["Model"] = v4:FindFirstChild("Sun Painting"),
		["Actions"] = {},
		["Tags"] = { "MISC" }
	},
	["Surfer Statue"] = {
		["Description"] = "Surf\'s up!",
		["Rarity"] = "Legendary",
		["Icon"] = "rbxassetid://118898226476172",
		["Model"] = v4:FindFirstChild("Surfer Statue"),
		["Actions"] = {},
		["Tags"] = { "STATUE" }
	},
	["Throne Sun"] = {
		["Description"] = "Do not look directly at the throne.",
		["Rarity"] = "Legendary",
		["Icon"] = "rbxassetid://101215048324104",
		["Model"] = v4:FindFirstChild("Throne Sun"),
		["Actions"] = {},
		["Tags"] = { "MISC" }
	},
	["Dino Skull"] = {
		["Description"] = "Perfectly preserved over millions of years.",
		["Rarity"] = "Legendary",
		["Icon"] = "rbxassetid://135977449505109",
		["Model"] = v4:FindFirstChild("Dino Skull"),
		["Actions"] = {},
		["Tags"] = { "MISC" }
	},
	["Dinosaur Footprints"] = {
		["Description"] = "Must have been a big dog...",
		["Rarity"] = "Legendary",
		["Icon"] = "rbxassetid://118119830496962",
		["Model"] = v4:FindFirstChild("Dinosaur Footprints"),
		["Actions"] = {},
		["Tags"] = { "MISC" }
	},
	["Dino Proof Fence"] = {
		["Description"] = "Is it to keep the dinos in, or keep us out?",
		["Rarity"] = "Legendary",
		["Icon"] = "rbxassetid://132790191705590",
		["Model"] = v4:FindFirstChild("Dino Proof Fence"),
		["Actions"] = {},
		["Tags"] = { "MISC" }
	},
	["Bone"] = {
		["Description"] = "Keep out of reach of pets.",
		["Rarity"] = "Legendary",
		["Icon"] = "rbxassetid://70986536992671",
		["Model"] = v4:FindFirstChild("Bone"),
		["Actions"] = {},
		["Tags"] = { "MISC" }
	},
	["Rock Car"] = {
		["Description"] = "Yabba-dabba-doo your way to work in prehistoric style!",
		["Rarity"] = "Legendary",
		["Icon"] = "rbxassetid://84416518410872",
		["Model"] = v4:FindFirstChild("Rock Car"),
		["Actions"] = {},
		["Tags"] = { "MACHINE" }
	},
	["Skeleton Statue"] = {
		["Description"] = "It\'s said to be the remains of the last dino hunter.",
		["Rarity"] = "Legendary",
		["Icon"] = "rbxassetid://137874336811380",
		["Model"] = v4:FindFirstChild("Skeleton Statue"),
		["Actions"] = {},
		["Tags"] = { "STATUE" }
	},
	["Spine Fence"] = {
		["Description"] = "Ouch! Spiky!",
		["Rarity"] = "Legendary",
		["Icon"] = "rbxassetid://119358212260594",
		["Model"] = v4:FindFirstChild("Spine Fence"),
		["Actions"] = {},
		["Tags"] = { "MISC" }
	},
	["DNA Container"] = {
		["Description"] = "The twisty code of life, neatly packed into a tube.",
		["Rarity"] = "Legendary",
		["Icon"] = "rbxassetid://104144486946979",
		["Model"] = v4:FindFirstChild("DNA Container"),
		["Actions"] = {},
		["Tags"] = { "MISC" }
	},
	["Archeology Tool Rack"] = {
		["Description"] = "The essentials for digging up ancient secrets.",
		["Rarity"] = "Legendary",
		["Icon"] = "rbxassetid://124130509505417",
		["Model"] = v4:FindFirstChild("Archeology Tool Rack"),
		["Actions"] = {},
		["Tags"] = { "MISC" }
	},
	["Dino Lamp"] = {
		["Description"] = "A tall lamp, carefully crafted from bones and sinew.",
		["Rarity"] = "Legendary",
		["Icon"] = "rbxassetid://133738368629123",
		["Model"] = v4:FindFirstChild("Dino Lamp"),
		["Actions"] = {},
		["Tags"] = { "MISC" }
	},
	["Dino Trophy"] = {
		["Description"] = "Prized skull of a real dinosaur!",
		["Rarity"] = "Legendary",
		["Icon"] = "rbxassetid://120457261434549",
		["Model"] = v4:FindFirstChild("Dino Trophy"),
		["Actions"] = {},
		["Tags"] = { "MISC" }
	},
	["Dino Bone Case"] = {
		["Description"] = "Not a chew toy.",
		["Rarity"] = "Legendary",
		["Icon"] = "rbxassetid://90556385672649",
		["Model"] = v4:FindFirstChild("Dino Bone Case"),
		["Actions"] = {},
		["Tags"] = { "MISC" }
	},
	["Dino Slayer Statue"] = {
		["Description"] = "Legend has it, the dino slayer made the dinosaurs go extinct.",
		["Rarity"] = "Legendary",
		["Icon"] = "rbxassetid://88357970667971",
		["Model"] = v4:FindFirstChild("Dino Slayer Statue"),
		["Actions"] = {},
		["Tags"] = { "STATUE" }
	},
	["Long Neck Dino Statue"] = {
		["Description"] = "How\'s the weather up there?",
		["Rarity"] = "Legendary",
		["Icon"] = "rbxassetid://107433332329644",
		["Model"] = v4:FindFirstChild("Long Neck Dino Statue"),
		["Actions"] = {},
		["Tags"] = { "STATUE" }
	},
	["Volcano"] = {
		["Description"] = "Full of red hot lava.",
		["Rarity"] = "Legendary",
		["Icon"] = "rbxassetid://138206771411283",
		["Model"] = v4:FindFirstChild("Volcano"),
		["Actions"] = {},
		["Tags"] = { "MISC" }
	},
	["America Banner"] = {
		["Description"] = "Wave it proud - your garden is the land of the free and home of the harvest!",
		["Rarity"] = "Legendary",
		["Icon"] = "rbxassetid://79593589083679",
		["Model"] = v4:FindFirstChild("America Banner"),
		["Actions"] = {},
		["Tags"] = { "MISC" }
	},
	["America Flag Badge"] = {
		["Description"] = "True patriots only.",
		["Rarity"] = "Legendary",
		["Icon"] = "rbxassetid://120228722090334",
		["Model"] = v4:FindFirstChild("America Flag Badge"),
		["Actions"] = {},
		["Tags"] = { "MISC" }
	},
	["American Flag"] = {
		["Description"] = "Planting freedom one seed at a time.",
		["Rarity"] = "Legendary",
		["Icon"] = "rbxassetid://92722333236046",
		["Model"] = v4:FindFirstChild("American Flag"),
		["Actions"] = {},
		["Tags"] = { "MISC" }
	},
	["Bald Eagle Statue"] = {
		["Description"] = "EagleSoundEffect.mp3",
		["Rarity"] = "Legendary",
		["Icon"] = "rbxassetid://126085067316745",
		["Model"] = v4:FindFirstChild("Bald Eagle Statue"),
		["Actions"] = {},
		["Tags"] = { "STATUE" }
	},
	["July 4th Toy"] = {
		["Description"] = "Celebrate your harvest\'s independence with explosive flair!",
		["Rarity"] = "Legendary",
		["Icon"] = "rbxassetid://81836108062745",
		["Model"] = v4:FindFirstChild("July 4th Toy"),
		["Actions"] = {},
		["Tags"] = { "MISC" }
	},
	["Uncle Sam Gnome"] = {
		["Description"] = "Wants YOU to have the most patriotic garden in the neighborhood.",
		["Rarity"] = "Legendary",
		["Icon"] = "rbxassetid://120023580280311",
		["Model"] = v4:FindFirstChild("Uncle Sam Gnome"),
		["Actions"] = {},
		["Tags"] = { "GNOME" }
	},
	["Dark Ninja Gnome"] = {
		["Description"] = "Strikes from the shadows to protect your crops.",
		["Rarity"] = "Legendary",
		["Icon"] = "rbxassetid://93038221719499",
		["Model"] = v4:FindFirstChild("Dark Ninja Gnome"),
		["Actions"] = {},
		["Tags"] = { "GNOME" }
	},
	["Light Ninja Gnome"] = {
		["Description"] = "Bringing balance to the darkness.",
		["Rarity"] = "Legendary",
		["Icon"] = "rbxassetid://110343561582804",
		["Model"] = v4:FindFirstChild("Light Ninja Gnome"),
		["Actions"] = {},
		["Tags"] = { "GNOME" }
	},
	["Zen Channeller Gnome"] = {
		["Description"] = "Enlightenment sold separately.",
		["Rarity"] = "Legendary",
		["Icon"] = "rbxassetid://130020217436802",
		["Model"] = v4:FindFirstChild("Zen Channeller Gnome"),
		["Actions"] = {},
		["Tags"] = { "GNOME" }
	},
	["Panda Gnome"] = {
		["Description"] = "You are gnot going to like me when grumpy!",
		["Rarity"] = "Legendary",
		["Icon"] = "rbxassetid://136464590894047",
		["Model"] = v4:FindFirstChild("Panda Gnome"),
		["Actions"] = {},
		["Tags"] = { "GNOME" }
	},
	["Samurai Gnome"] = {
		["Description"] = "Honor your harvest with the way of the warrior gardener.",
		["Rarity"] = "Legendary",
		["Icon"] = "rbxassetid://98408249952275",
		["Model"] = v4:FindFirstChild("Samurai Gnome"),
		["Actions"] = {},
		["Tags"] = { "GNOME" }
	},
	["Whispering Torii"] = {
		["Description"] = "What secrets does it hold?",
		["Rarity"] = "Mythical",
		["Icon"] = "rbxassetid://123218145042358",
		["Model"] = v4:FindFirstChild("Whispering Torii"),
		["Actions"] = {},
		["Tags"] = { "MISC" }
	},
	["Hot Spring"] = {
		["Description"] = "The perfect spot to unwind after a long day.",
		["Rarity"] = "Rare",
		["Icon"] = "rbxassetid://102701113946399",
		["Model"] = v4:FindFirstChild("Hot Spring"),
		["Actions"] = {},
		["Tags"] = { "MISC", "UTILITY" }
	},
	["Pancake Stack"] = {
		["Description"] = "Your pets seem to be really attracted to the stack of pancakes!",
		["Rarity"] = "Mythical",
		["Icon"] = "rbxassetid://72003221560635",
		["Model"] = v4:FindFirstChild("Pancake Stack"),
		["Actions"] = {},
		["Tags"] = { "MISC", "UTILITY" },
		["Undeletable"] = true
	},
	["Zen Sand"] = {
		["Description"] = "Raking in the peace.",
		["Rarity"] = "Legendary",
		["Icon"] = "rbxassetid://89555305118515",
		["Model"] = v4:FindFirstChild("Zen Sand"),
		["Actions"] = {},
		["Tags"] = { "MISC" }
	},
	["Temple Lamp"] = {
		["Description"] = "A beacon in the dark for garden spirits.",
		["Rarity"] = "Legendary",
		["Icon"] = "rbxassetid://118855603196154",
		["Model"] = v4:FindFirstChild("Temple Lamp"),
		["Actions"] = {},
		["Tags"] = { "MISC" }
	},
	["Bamboo Fence"] = {
		["Description"] = "Keeps the gnomes out.",
		["Rarity"] = "Legendary",
		["Icon"] = "rbxassetid://108164141573262",
		["Model"] = v4:FindFirstChild("Bamboo Fence"),
		["Actions"] = {},
		["Tags"] = { "MISC" }
	},
	["Bamboo Tech"] = {
		["Description"] = "Such a creative little contraption.",
		["Rarity"] = "Legendary",
		["Icon"] = "rbxassetid://136277100467130",
		["Model"] = v4:FindFirstChild("Bamboo Tech"),
		["Actions"] = {},
		["Tags"] = { "MISC" }
	},
	["Japanese Gong"] = {
		["Description"] = "~BWONNGGGGGGGGG~",
		["Rarity"] = "Legendary",
		["Icon"] = "rbxassetid://98584483995379",
		["Model"] = v4:FindFirstChild("Japanese Gong"),
		["Actions"] = {},
		["Tags"] = { "MISC" }
	},
	["Zen Bridge"] = {
		["Description"] = "A simple wooden bridge that invites calm steps and peaceful strolls.",
		["Rarity"] = "Legendary",
		["Icon"] = "rbxassetid://107695376294579",
		["Model"] = v4:FindFirstChild("Zen Bridge"),
		["Actions"] = {},
		["Tags"] = { "MISC" }
	},
	["Zen Waterfall"] = {
		["Description"] = "A gentle waterfall inviting peace and serenity.",
		["Rarity"] = "Legendary",
		["Icon"] = "rbxassetid://82333210563868",
		["Model"] = v4:FindFirstChild("Zen Waterfall"),
		["Actions"] = {},
		["Tags"] = { "MISC" }
	},
	["Buddha Statue"] = {
		["Description"] = "A serene statue spreading chill vibes and quiet wisdom.",
		["Rarity"] = "Legendary",
		["Icon"] = "rbxassetid://129654063898982",
		["Model"] = v4:FindFirstChild("Buddha Statue"),
		["Actions"] = {},
		["Tags"] = { "STATUE" }
	},
	["Zen Fan"] = {
		["Description"] = "Bringing a cool, calm breeze to your garden.",
		["Rarity"] = "Uncommon",
		["Icon"] = "rbxassetid://75369672011401",
		["Model"] = v4:FindFirstChild("Zen Fan"),
		["Actions"] = {},
		["Tags"] = { "MISC" }
	},
	["Corrupted Garden Light"] = {
		["Description"] = "Fills your garden with a pulsating glow of corruption.",
		["Rarity"] = "Rare",
		["Icon"] = "rbxassetid://115031659359620",
		["Model"] = v4:FindFirstChild("Corrupted Garden Light"),
		["Actions"] = {},
		["Tags"] = { "MISC" }
	},
	["Corrupted Bamboo Fence"] = {
		["Description"] = "A regular old bamboo fence (but it\'s evil).",
		["Rarity"] = "Rare",
		["Icon"] = "rbxassetid://86998488556965",
		["Model"] = v4:FindFirstChild("Corrupted Bamboo Fence"),
		["Actions"] = {},
		["Tags"] = { "MISC" }
	},
	["Mounted Katanas"] = {
		["Description"] = "Legendary twin blades, thought to have been lost to time.",
		["Rarity"] = "Legendary",
		["Icon"] = "rbxassetid://87570375939460",
		["Model"] = v4:FindFirstChild("Mounted Katanas"),
		["Actions"] = {},
		["Tags"] = { "MISC" }
	},
	["Corrupted Bridge"] = {
		["Description"] = "It seems to be pulsing with dark energy.",
		["Rarity"] = "Mythical",
		["Icon"] = "rbxassetid://99827869575418",
		["Model"] = v4:FindFirstChild("Corrupted Bridge"),
		["Actions"] = {},
		["Tags"] = { "MISC" }
	},
	["Corrupted Well"] = {
		["Description"] = "Well, well, well...",
		["Rarity"] = "Mythical",
		["Icon"] = "rbxassetid://117482074049800",
		["Model"] = v4:FindFirstChild("Corrupted Well"),
		["Actions"] = {},
		["Tags"] = { "MISC" }
	},
	["Pink Cake"] = {
		["Description"] = "Sweet vibes only.",
		["Rarity"] = "Common",
		["Icon"] = "rbxassetid://139803447090329",
		["Model"] = v4:FindFirstChild("Pink Cake"),
		["Actions"] = {},
		["Tags"] = { "MISC" }
	},
	["Blue Cake"] = {
		["Description"] = "A berry blue-tiful dessert.",
		["Rarity"] = "Common",
		["Icon"] = "rbxassetid://107286814174017",
		["Model"] = v4:FindFirstChild("Blue Cake"),
		["Actions"] = {},
		["Tags"] = { "MISC" }
	},
	["Coffee Machine"] = {
		["Description"] = "The pick me up station.",
		["Rarity"] = "Uncommon",
		["Icon"] = "rbxassetid://131424870913780",
		["Model"] = v4:FindFirstChild("Coffee Machine"),
		["Actions"] = {},
		["Tags"] = { "MISC" }
	},
	["Banana Hammock"] = {
		["Description"] = "An ap-peel-ing spot for a nap.",
		["Rarity"] = "Rare",
		["Icon"] = "rbxassetid://111292578609127",
		["Model"] = v4:FindFirstChild("Banana Hammock"),
		["Actions"] = {},
		["Tags"] = { "MISC" }
	},
	["Cheese Mat"] = {
		["Description"] = "The grate-est mat to ever bless your garden.",
		["Rarity"] = "Rare",
		["Icon"] = "rbxassetid://120715470358349",
		["Model"] = v4:FindFirstChild("Cheese Mat"),
		["Actions"] = {},
		["Tags"] = { "MISC" }
	},
	["Hotdog Cart"] = {
		["Description"] = "Mobile dog dispenser.",
		["Rarity"] = "Legendary",
		["Icon"] = "rbxassetid://130716429170835",
		["Model"] = v4:FindFirstChild("Hotdog Cart"),
		["Actions"] = {},
		["Tags"] = { "MISC" }
	},
	["Golden Hotdog Statue"] = {
		["Description"] = "The ULTIMATE symbol of status!",
		["Rarity"] = "Mythical",
		["Icon"] = "rbxassetid://73484648804885",
		["Model"] = v4:FindFirstChild("Golden Hotdog Statue"),
		["Actions"] = {},
		["Tags"] = { "STATUE" }
	},
	["Fork Fence"] = {
		["Description"] = "It was either this or the spork fence.",
		["Rarity"] = "Uncommon",
		["Icon"] = "rbxassetid://116492910249771",
		["Model"] = v4:FindFirstChild("Fork Fence"),
		["Actions"] = {},
		["Tags"] = { "MISC" }
	},
	["Pretzel Cart"] = {
		["Description"] = "Portable snack wagon of twisty bread and dreams.",
		["Rarity"] = "Legendary",
		["Icon"] = "rbxassetid://106567090231143",
		["Model"] = v4:FindFirstChild("Pretzel Cart"),
		["Actions"] = {},
		["Tags"] = { "MISC" }
	},
	["Cooking Cauldron"] = {
		["Description"] = "UNGA BUNGA COOKING TIME",
		["Rarity"] = "Rare",
		["Icon"] = "rbxassetid://140572721830268",
		["Model"] = v4:FindFirstChild("Cooking Cauldron"),
		["Actions"] = {},
		["Tags"] = { "MISC", "UTILITY" }
	},
	["Stoplight"] = {
		["Description"] = "Tells you when to vibe, zoom, or full send.",
		["Rarity"] = "Prismatic",
		["Icon"] = "rbxassetid://72661770099625",
		["Model"] = v4:FindFirstChild("Stoplight"),
		["Actions"] = {},
		["Tags"] = { "MISC" }
	},
	["Pizza Box"] = {
		["Description"] = "Smells like gamer fuel.",
		["Rarity"] = "Rare",
		["Icon"] = "rbxassetid://117102090447163",
		["Model"] = v4:FindFirstChild("Pizza Box"),
		["Actions"] = {},
		["Tags"] = { "MISC" }
	},
	["Donut Swing"] = {
		["Description"] = "Swings you into another dimension of sweetness.",
		["Rarity"] = "Legendary",
		["Icon"] = "rbxassetid://70992139994852",
		["Model"] = v4:FindFirstChild("Donut Swing"),
		["Actions"] = {},
		["Tags"] = { "MISC" }
	},
	["Sink Cabinet"] = {
		["Description"] = "Where dishes to go cry and respawn.",
		["Rarity"] = "Common",
		["Icon"] = "rbxassetid://119530033900682",
		["Model"] = v4:FindFirstChild("Sink Cabinet"),
		["Actions"] = {},
		["Tags"] = { "MISC" }
	},
	["Chris P Statue"] = {
		["Description"] = "Would you pick up the phone?",
		["Rarity"] = "Prismatic",
		["Icon"] = "rbxassetid://76638055963426",
		["Model"] = v4:FindFirstChild("Chris P Statue"),
		["Actions"] = {},
		["Tags"] = { "STATUE" }
	},
	["Fridge"] = {
		["Description"] = "Anything tasty in here?",
		["Rarity"] = "Uncommon",
		["Icon"] = "rbxassetid://100427797189679",
		["Model"] = v4:FindFirstChild("Fridge"),
		["Actions"] = {},
		["Tags"] = { "MISC" }
	},
	["Cabinet Utensil"] = {
		["Description"] = "Full of handy kitchen tools.",
		["Rarity"] = "Rare",
		["Icon"] = "rbxassetid://123693600291594",
		["Model"] = v4:FindFirstChild("CabinetUtensil"),
		["Actions"] = {},
		["Tags"] = { "MISC" }
	},
	["Stove"] = {
		["Description"] = "The heart of every garden kitchen.",
		["Rarity"] = "Rare",
		["Icon"] = "rbxassetid://112715903134219",
		["Model"] = v4:FindFirstChild("Stove"),
		["Actions"] = {},
		["Tags"] = { "MISC" }
	},
	["Frying Pan"] = {
		["Description"] = "Perfect for flipping pancakes or chasing garden gnomes.",
		["Rarity"] = "Uncommon",
		["Icon"] = "rbxassetid://124704815957312",
		["Model"] = v4:FindFirstChild("Frying Pan"),
		["Actions"] = {},
		["Tags"] = { "MISC" }
	},
	["Kitchen Cart"] = {
		["Description"] = "Meals on wheels.",
		["Rarity"] = "Uncommon",
		["Icon"] = "rbxassetid://135556889455073",
		["Model"] = v4:FindFirstChild("Kitchen Cart"),
		["Actions"] = {},
		["Tags"] = { "MISC" }
	},
	["Kitchen Flooring"] = {
		["Description"] = "Kitchen isn\'t a kitchen without a floor!",
		["Rarity"] = "Uncommon",
		["Icon"] = "rbxassetid://127702999731295",
		["Model"] = v4:FindFirstChild("Kitchen Flooring"),
		["Actions"] = {},
		["Tags"] = { "MISC" }
	},
	["Smoothie Fountain"] = {
		["Description"] = "Infinite fruity goodness.",
		["Rarity"] = "Uncommon",
		["Icon"] = "rbxassetid://108938932915450",
		["Model"] = v4:FindFirstChild("Smoothie Fountain"),
		["Actions"] = {},
		["Tags"] = { "MISC" }
	},
	["Flamingo Garden Stake"] = {
		["Description"] = "The fabulous guardian of the garden.",
		["Rarity"] = "Uncommon",
		["Icon"] = "rbxassetid://94984928124462",
		["Model"] = v4:FindFirstChild("Flamingo Garden Stake"),
		["Actions"] = {},
		["Tags"] = { "MISC" }
	},
	["Beanpod Crate"] = {
		["Description"] = "A crate that smells faintly of beans. You probably shouldn\226\128\153t store soup in it.",
		["Rarity"] = "Rare",
		["Icon"] = "rbxassetid://111143723554629",
		["Model"] = v4:FindFirstChild("Beanpod Crate"),
		["Actions"] = {},
		["Tags"] = { "MISC" }
	},
	["Beanstalk Entrance"] = {
		["Description"] = "Step through here and you might find a giant\226\128\166 or just more beans.",
		["Rarity"] = "Legendary",
		["Icon"] = "rbxassetid://133847364538116",
		["Model"] = v4:FindFirstChild("Beanstalk Entrance"),
		["Actions"] = {},
		["Tags"] = { "MISC" }
	},
	["Beanstalk Hammock"] = {
		["Description"] = "Perfect for a nap high above the clouds, if you\226\128\153re not scared of heights.",
		["Rarity"] = "Rare",
		["Icon"] = "rbxassetid://106954303075560",
		["Model"] = v4:FindFirstChild("Beanstalk Hammock"),
		["Actions"] = {},
		["Tags"] = { "MISC" }
	},
	["Chopped Beanstalk"] = {
		["Description"] = "The story ends here\226\128\166 unless you like falling.",
		["Rarity"] = "Legendary",
		["Icon"] = "rbxassetid://113996684408956",
		["Model"] = v4:FindFirstChild("Chopped Beanstalk"),
		["Actions"] = {},
		["Tags"] = { "MISC" }
	},
	["Bean Vine Pillar"] = {
		["Description"] = "Strong enough to hold a castle... and some clouds.",
		["Rarity"] = "Uncommon",
		["Icon"] = "rbxassetid://97688674720996",
		["Model"] = v4:FindFirstChild("Bean Vine Pillar"),
		["Actions"] = {},
		["Tags"] = { "MISC" }
	},
	["Egg Podium"] = {
		["Description"] = "Where only the most eggcellent eggs deserve to stand.",
		["Rarity"] = "Mythical",
		["Icon"] = "rbxassetid://112480478736815",
		["Model"] = v4:FindFirstChild("Egg Podium"),
		["Actions"] = {},
		["Tags"] = { "MISC" }
	},
	["Cooking Kit"] = {
		["Description"] = "A mini Cooking Kit for cooking food!",
		["Rarity"] = "Prismatic",
		["Icon"] = "rbxassetid://76909170310985",
		["Model"] = v4:FindFirstChild("Cooking Kit"),
		["Actions"] = {},
		["Tags"] = { "MISC", "UTILITY" },
		["Max"] = 3,
		["Undeletable"] = true
	},
	["Statue Of Achievement"] = {
		["Description"] = "The Grand Reward for getting all core Achievements! Increases backpack size by 100!",
		["Rarity"] = "Prismatic",
		["Icon"] = "rbxassetid://121858779296935",
		["Model"] = v4:FindFirstChild("Statue Of Achievement"),
		["Actions"] = {},
		["Tags"] = { "STATUE", "UTILITY" },
		["Max"] = 1,
		["Undeletable"] = true
	},
	["Pet Incubator"] = {
		["Description"] = "Increases Pet EXP gain",
		["Rarity"] = "Prismatic",
		["Icon"] = "rbxassetid://85299659167272",
		["Model"] = v4:FindFirstChild("Pet Incubator"),
		["Actions"] = {},
		["Tags"] = { "MACHINE", "UTILITY" },
		["Undeletable"] = true,
		["Max"] = 3
	},
	["Egg Incubator"] = {
		["Description"] = "Increases Egg Hatch Time",
		["Rarity"] = "Prismatic",
		["Icon"] = "rbxassetid://109904712559790",
		["Model"] = v4:FindFirstChild("Egg Incubator"),
		["Actions"] = {},
		["Tags"] = { "MACHINE", "UTILITY" },
		["Undeletable"] = true,
		["Max"] = 3
	},
	["Mutation Machine Booster"] = {
		["Description"] = "Reduces the time of the pet mutation machine",
		["Rarity"] = "Prismatic",
		["Icon"] = "rbxassetid://117000789940046",
		["Model"] = v4:FindFirstChild("Mutation Machine Booster"),
		["Actions"] = {},
		["Tags"] = { "MACHINE", "UTILITY" },
		["Undeletable"] = true,
		["Max"] = 3
	},
	["Steal a Character Tombstone"] = {
		["Description"] = "Go BIG or go fix feet under",
		["Rarity"] = "Divine",
		["Icon"] = "rbxassetid://138270941214642",
		["Model"] = v4:FindFirstChild("Steal a Character Tombstone"),
		["Actions"] = {},
		["Tags"] = { "MISC" }
	},
	["Bean Chair"] = {
		["Description"] = "That does not look too comfortable...",
		["Rarity"] = "Common",
		["Icon"] = "rbxassetid://93975598685883",
		["Model"] = v4:FindFirstChild("Bean Chair"),
		["Actions"] = {},
		["Tags"] = { "MISC" }
	},
	["Giant Painting"] = {
		["Description"] = "What\'ll it be, tiny?",
		["Rarity"] = "Uncommon",
		["Icon"] = "rbxassetid://108391142160867",
		["Model"] = v4:FindFirstChild("Giant Painting"),
		["Actions"] = {},
		["Tags"] = { "MISC" }
	},
	["Beanstalk Painting"] = {
		["Description"] = "As you look at this, it may or may not remind you of that time you climbed up the beanstalk.",
		["Rarity"] = "Uncommon",
		["Icon"] = "rbxassetid://79662411456574",
		["Model"] = v4:FindFirstChild("Beanstalk Painting"),
		["Actions"] = {},
		["Tags"] = { "MISC" }
	},
	["Golden Goose Painting"] = {
		["Description"] = "There is only one Golden Goose in the world! (Real)",
		["Rarity"] = "Uncommon",
		["Icon"] = "rbxassetid://90257134404383",
		["Model"] = v4:FindFirstChild("Golden Goose Painting"),
		["Actions"] = {},
		["Tags"] = { "MISC" }
	},
	["Bean Sprout Float Light"] = {
		["Description"] = "Lights out, bean sprout.",
		["Rarity"] = "Rare",
		["Icon"] = "rbxassetid://107117826079251",
		["Model"] = v4:FindFirstChild("Bean Sprout Float Light"),
		["Actions"] = {},
		["Tags"] = { "MISC" }
	},
	["Green Bean Memories"] = {
		["Description"] = "Where have you bean? Always green, never leave...",
		["Rarity"] = "Legendary",
		["Icon"] = "rbxassetid://72082340784003",
		["Model"] = v4:FindFirstChild("Green Bean Memories"),
		["Actions"] = {},
		["Tags"] = { "MISC" }
	},
	["Bean Pool Table"] = {
		["Description"] = "The sounds of the pool beans rolling across the bean table doesn\'t sound too pleasant.",
		["Rarity"] = "Legendary",
		["Icon"] = "rbxassetid://106141930841467",
		["Model"] = v4:FindFirstChild("Bean Pool Table"),
		["Actions"] = {},
		["Tags"] = { "MISC" }
	},
	["Bouncy Mushroom"] = {
		["Description"] = "BEAN BOING!",
		["Rarity"] = "Divine",
		["Icon"] = "rbxassetid://134306738320631",
		["Model"] = v4:FindFirstChild("Bouncy Mushroom"),
		["Actions"] = {},
		["Tags"] = { "MISC", "UTILITY" }
	},
	["Griffin Statue"] = {
		["Description"] = "These glorious creatures create winds strong enough to knock even giants down to defend their nests set up on beanstalk leaves.",
		["Rarity"] = "Divine",
		["Icon"] = "rbxassetid://86408013808631",
		["Model"] = v4:FindFirstChild("Griffin Statue"),
		["Actions"] = {},
		["Tags"] = { "STATUE" }
	},
	["Fairy Chair"] = {
		["Description"] = "A delicate seat woven from petals and moonlight, perfect for resting tiny wings.",
		["Rarity"] = "Rare",
		["Icon"] = "rbxassetid://100414519497909",
		["Model"] = v4:FindFirstChild("Fairy Chair"),
		["Actions"] = {},
		["Tags"] = { "MISC" }
	},
	["Fairy Lamp"] = {
		["Description"] = "A glowing lantern filled with captured starlight, guiding fairies through the night.",
		["Rarity"] = "Rare",
		["Icon"] = "rbxassetid://119538947585220",
		["Model"] = v4:FindFirstChild("Fairy Lamp"),
		["Actions"] = {},
		["Tags"] = { "MISC" }
	},
	["Fairy Stand"] = {
		["Description"] = "A tiny pedestal carved from enchanted wood, where fairies display their treasures.",
		["Rarity"] = "Rare",
		["Icon"] = "rbxassetid://135551660321823",
		["Model"] = v4:FindFirstChild("Fairy Stand"),
		["Actions"] = {},
		["Tags"] = { "MISC" }
	},
	["Gnome Wagon"] = {
		["Description"] = "A sturdy wooden wagon used by gnomes to carry mushrooms, gems, and secrets.",
		["Rarity"] = "Legendary",
		["Icon"] = "rbxassetid://102150891226977",
		["Model"] = v4:FindFirstChild("Gnome Wagon"),
		["Actions"] = {},
		["Tags"] = { "MISC" }
	},
	["Fairy Gate"] = {
		["Description"] = "An enchanted archway that shimmers with hidden magic, leading to realms unseen.",
		["Rarity"] = "Legendary",
		["Icon"] = "rbxassetid://126215858817107",
		["Model"] = v4:FindFirstChild("Fairy Gate"),
		["Actions"] = {},
		["Tags"] = { "MISC" }
	},
	["Mushroom Gnome Home"] = {
		["Description"] = "A cozy home nestled inside a giant mushroom, glowing warmly with gnome magic.",
		["Rarity"] = "Legendary",
		["Icon"] = "rbxassetid://111227810329813",
		["Model"] = v4:FindFirstChild("Mushroom Gnome Home"),
		["Actions"] = {},
		["Tags"] = { "MISC" }
	},
	["Fairy Mirror"] = {
		["Description"] = "A mystical mirror that shows not only reflections, but whispers of future dreams.",
		["Rarity"] = "Mythical",
		["Icon"] = "rbxassetid://77646378358232",
		["Model"] = v4:FindFirstChild("Fairy Mirror"),
		["Actions"] = {},
		["Tags"] = { "MISC" }
	},
	["Fairy Pond"] = {
		["Description"] = "A crystal-clear pond where moonlight dances and fairies gather to sing.",
		["Rarity"] = "Mythical",
		["Icon"] = "rbxassetid://114756185049128",
		["Model"] = v4:FindFirstChild("Fairy Pond"),
		["Actions"] = {},
		["Tags"] = { "MISC" }
	},
	["Wisp Well"] = {
		["Description"] = "There is a great overwhelming force of Wisp energy eminating from this mystical well.",
		["Rarity"] = "Mythical",
		["Icon"] = "rbxassetid://79205504566654",
		["Model"] = v4:FindFirstChild("Wisp Well"),
		["Actions"] = {},
		["Tags"] = { "MISC", "UTILITY" },
		["Undeletable"] = true
	},
	["Elden Fairy Lamp Post"] = {
		["Description"] = "A Elden Fairy Lamp Post",
		["Rarity"] = "Mythical",
		["Icon"] = "rbxassetid://131342736520551",
		["Model"] = v4:FindFirstChild("EldenFairyLampPost"),
		["Actions"] = {},
		["Tags"] = { "MISC" }
	},
	["Fairy Book Shelf"] = {
		["Description"] = "A Fairy Book Shelf",
		["Rarity"] = "Mythical",
		["Icon"] = "rbxassetid://112212297537595",
		["Model"] = v4:FindFirstChild("FairyBookShelf"),
		["Actions"] = {},
		["Tags"] = { "MISC" }
	},
	["Fairy Purple Chair"] = {
		["Description"] = "A Fairy Purple Chair",
		["Rarity"] = "Mythical",
		["Icon"] = "rbxassetid://135179698088586",
		["Model"] = v4:FindFirstChild("FairyPurpleChair"),
		["Actions"] = {},
		["Tags"] = { "MISC" }
	},
	["Fairy Statue"] = {
		["Description"] = "A Fairy Statue",
		["Rarity"] = "Mythical",
		["Icon"] = "rbxassetid://139645908100040",
		["Model"] = v4:FindFirstChild("FairyStatue"),
		["Actions"] = {},
		["Tags"] = { "STATUE" }
	},
	["Mushroom Lamp"] = {
		["Description"] = "A Mushroom Lamp",
		["Rarity"] = "Mythical",
		["Icon"] = "rbxassetid://114948584388331",
		["Model"] = v4:FindFirstChild("MushroomLamp"),
		["Actions"] = {},
		["Tags"] = { "MISC" }
	},
	["Mushroom Table"] = {
		["Description"] = "A Mushroom Table",
		["Rarity"] = "Mythical",
		["Icon"] = "rbxassetid://110882742794079",
		["Model"] = v4:FindFirstChild("MushroomTable"),
		["Actions"] = {},
		["Tags"] = { "MISC" }
	},
	["Wish Fountain"] = {
		["Description"] = "Wish Fountain",
		["Rarity"] = "Prismatic",
		["Icon"] = "rbxassetid://127146743394145",
		["Model"] = v4:FindFirstChild("Wish Fountain"),
		["Actions"] = {},
		["Tags"] = { "MISC" }
	},
	["Alien Lamp"] = {
		["Description"] = "",
		["Rarity"] = "Mythical",
		["Icon"] = "rbxassetid://75938358432703",
		["Model"] = v4:FindFirstChild("Alien Lamp"),
		["Actions"] = {},
		["Tags"] = { "MISC" }
	},
	["AlienShip"] = {
		["Description"] = "",
		["Rarity"] = "Mythical",
		["Icon"] = "rbxassetid://98708880341870",
		["Model"] = v4:FindFirstChild("AlienShip"),
		["Actions"] = {},
		["Tags"] = { "MISC" }
	},
	["AlienShipTrophy"] = {
		["Description"] = "",
		["Rarity"] = "Mythical",
		["Icon"] = "rbxassetid://73515066175359",
		["Model"] = v4:FindFirstChild("AlienShipTrophy"),
		["Actions"] = {},
		["Tags"] = { "MISC" }
	},
	["Sphinx"] = {
		["Description"] = "",
		["Rarity"] = "Mythical",
		["Icon"] = "rbxassetid://106974983987906",
		["Model"] = v4:FindFirstChild("Sphinx"),
		["Actions"] = {},
		["Tags"] = { "STATUE" }
	},
	["EgyptianPillar"] = {
		["Description"] = "",
		["Rarity"] = "Mythical",
		["Icon"] = "rbxassetid://123449668900156",
		["Model"] = v4:FindFirstChild("EgyptianPillar"),
		["Actions"] = {},
		["Tags"] = { "MISC" }
	},
	["EgyptianPainting"] = {
		["Description"] = "",
		["Rarity"] = "Mythical",
		["Icon"] = "rbxassetid://111339106695829",
		["Model"] = v4:FindFirstChild("EgyptianPainting"),
		["Actions"] = {},
		["Tags"] = { "MISC" }
	},
	["Green Bean Chamber"] = {
		["Description"] = "The war is over. May the beans rest well.",
		["Rarity"] = "Prismatic",
		["Icon"] = "rbxassetid://88363440397145",
		["Model"] = v4:FindFirstChild("Green Bean Chamber"),
		["Actions"] = {},
		["Tags"] = { "MISC" }
	},
	["Fall Wheel"] = {
		["Description"] = "A wheel of a fall harvest wagon.",
		["Rarity"] = "Uncommon",
		["Icon"] = "rbxassetid://117160661132152",
		["Model"] = v4:FindFirstChild("Fall Wheel"),
		["Actions"] = {},
		["Tags"] = { "MISC" }
	},
	["Crate Of Pumpkin Corn"] = {
		["Description"] = "A crate filled with pumpkin and corn, some fall staples.",
		["Rarity"] = "Rare",
		["Icon"] = "rbxassetid://139249116184958",
		["Model"] = v4:FindFirstChild("Crate Of Pumpkin Corn"),
		["Actions"] = {},
		["Tags"] = { "MISC" }
	},
	["Acorn Brazier"] = {
		["Description"] = "Ancient squirrel civilization used acorns as fire pits to keep warm just before the great winter hibernation.",
		["Rarity"] = "Rare",
		["Icon"] = "rbxassetid://74641482329908",
		["Model"] = v4:FindFirstChild("Acorn Brazier"),
		["Actions"] = {},
		["Tags"] = { "MISC" }
	},
	["Maple Trophy"] = {
		["Description"] = "Embody the spirit of Fall!",
		["Rarity"] = "Legendary",
		["Icon"] = "rbxassetid://130271298819838",
		["Model"] = v4:FindFirstChild("Maple Trophy"),
		["Actions"] = {},
		["Tags"] = { "MISC" }
	},
	["Log Tunnel Fall"] = {
		["Description"] = "Crisp leaves crunch as you step through.",
		["Rarity"] = "Mythical",
		["Icon"] = "rbxassetid://86171077862769",
		["Model"] = v4:FindFirstChild("Log Tunnel Fall"),
		["Actions"] = {},
		["Tags"] = { "MISC" }
	},
	["Fall Leaf Chair"] = {
		["Description"] = "Perfect for relaxing while watching the leaves drift down around you.",
		["Rarity"] = "Common",
		["Icon"] = "rbxassetid://125212137128357",
		["Model"] = v4:FindFirstChild("Fall Leaf Chair"),
		["Actions"] = {},
		["Tags"] = { "MISC" }
	},
	["Maple Flag"] = {
		["Description"] = "A beautiful maple flag displaying the colors of fall.",
		["Rarity"] = "Rare",
		["Icon"] = "rbxassetid://115615263120810",
		["Model"] = v4:FindFirstChild("Maple Flag"),
		["Actions"] = {},
		["Tags"] = { "MISC" }
	},
	["Flying Kite"] = {
		["Description"] = "The leaves fall and the kites rise.",
		["Rarity"] = "Legendary",
		["Icon"] = "rbxassetid://99214834487736",
		["Model"] = v4:FindFirstChild("Flying Kite"),
		["Actions"] = {},
		["Tags"] = { "MISC" }
	},
	["Fall Fountain"] = {
		["Description"] = "Periodically imbues your crops with the Fall mutation!",
		["Rarity"] = "Divine",
		["Icon"] = "rbxassetid://94850925562735",
		["Model"] = v4:FindFirstChild("Fall Fountain"),
		["Actions"] = {},
		["Tags"] = { "MISC" },
		["Max"] = 6
	},
	["RDCAward"] = {
		["Description"] = "You are the only reason this was possible so for that; Thank you for everything!",
		["Rarity"] = "Prismatic",
		["Icon"] = "rbxassetid://92157401543343",
		["Model"] = v4:FindFirstChild("RDCAward"),
		["Actions"] = {},
		["Tags"] = { "MISC" }
	},
	["Acorn Painting"] = {
		["Description"] = "Acorns are Fall\'s carrots!",
		["Rarity"] = "Legendary",
		["Icon"] = "rbxassetid://107143164439177",
		["Model"] = v4:FindFirstChild("Acorn Painting"),
		["Actions"] = {},
		["Tags"] = { "MISC" }
	},
	["Fall Market Painting"] = {
		["Description"] = "Oh, it\'s the Fall Market!",
		["Rarity"] = "Legendary",
		["Icon"] = "rbxassetid://77819899927387",
		["Model"] = v4:FindFirstChild("Fall Market Painting"),
		["Actions"] = {},
		["Tags"] = { "MISC" }
	},
	["Fall Table"] = {
		["Description"] = "Put leaves, plants, pets on me!",
		["Rarity"] = "Rare",
		["Icon"] = "rbxassetid://100709295775548",
		["Model"] = v4:FindFirstChild("Fall Table"),
		["Actions"] = {},
		["Tags"] = { "MISC" }
	},
	["Fall Wreath"] = {
		["Description"] = "Whispers of fall spun round and round!",
		["Rarity"] = "Rare",
		["Icon"] = "rbxassetid://118680729910862",
		["Model"] = v4:FindFirstChild("Fall Wreath"),
		["Actions"] = {},
		["Tags"] = { "MISC" }
	},
	["Golden Swan Statue"] = {
		["Description"] = "A graceful guardian cast in gold!",
		["Rarity"] = "Divine",
		["Icon"] = "rbxassetid://86969051940942",
		["Model"] = v4:FindFirstChild("Golden Swan Statue"),
		["Actions"] = {},
		["Tags"] = { "MISC", "STATUE" }
	},
	["Fall Hay Bale"] = {
		["Description"] = "It\'s just a hay bale!",
		["Rarity"] = "Rare",
		["Icon"] = "rbxassetid://120930808526597",
		["Model"] = v4:FindFirstChild("Fall Hay Bale"),
		["Actions"] = {},
		["Tags"] = { "MISC" }
	},
	["Pile Of Leaves"] = {
		["Description"] = "Go on, jump in it!",
		["Rarity"] = "Rare",
		["Icon"] = "rbxassetid://110846948895211",
		["Model"] = v4:FindFirstChild("Pile Of Leaves"),
		["Actions"] = {},
		["Tags"] = { "MISC" }
	},
	["Pumpkin Wheelbarrow"] = {
		["Description"] = "Easier to carry your crops!",
		["Rarity"] = "Rare",
		["Icon"] = "rbxassetid://73703895481552",
		["Model"] = v4:FindFirstChild("Pumpkin Wheelbarrow"),
		["Actions"] = {},
		["Tags"] = { "MISC" }
	},
	["Scarecrow"] = {
		["Description"] = "Always smiling, even when no one\226\128\153s around...",
		["Rarity"] = "Rare",
		["Icon"] = "rbxassetid://112374836896137",
		["Model"] = v4:FindFirstChild("Scarecrow"),
		["Actions"] = {},
		["Tags"] = { "MISC" }
	},
	["Fall Market Cart"] = {
		["Description"] = "Become a Fall Market Merchant!",
		["Rarity"] = "Rare",
		["Icon"] = "rbxassetid://138446161837381",
		["Model"] = v4:FindFirstChild("Fall Market Cart"),
		["Actions"] = {},
		["Tags"] = { "MISC" }
	},
	["Computer Monitor"] = {
		["Description"] = "A glowing frame.",
		["Rarity"] = "Rare",
		["Icon"] = "rbxassetid://100475940251774",
		["Model"] = v4:FindFirstChild("Computer Monitor"),
		["Actions"] = {},
		["Tags"] = { "MISC" }
	},
	["Flower Swing"] = {
		["Description"] = "A seat wrapped in blossoms.",
		["Rarity"] = "Legendary",
		["Icon"] = "rbxassetid://73173574113839",
		["Model"] = v4:FindFirstChild("Flower Swing"),
		["Actions"] = {},
		["Tags"] = { "MISC" }
	},
	["Golden Harp"] = {
		["Description"] = "Melody spun from gold!",
		["Rarity"] = "Divine",
		["Icon"] = "rbxassetid://96793904572444",
		["Model"] = v4:FindFirstChild("Golden Harp"),
		["Actions"] = {},
		["Tags"] = { "MISC" }
	},
	["Golden Radio"] = {
		["Description"] = "Golden voice box of joy!",
		["Rarity"] = "Mythical",
		["Icon"] = "rbxassetid://121910138612270",
		["Model"] = v4:FindFirstChild("Golden Radio"),
		["Actions"] = {},
		["Tags"] = { "MISC" }
	},
	["Golden Rings"] = {
		["Description"] = "Circles that gleam forever!",
		["Rarity"] = "Mythical",
		["Icon"] = "rbxassetid://74995141061303",
		["Model"] = v4:FindFirstChild("Golden Rings"),
		["Actions"] = {},
		["Tags"] = { "MISC", "STATUE" }
	},
	["Mushroom Bed"] = {
		["Description"] = "Cozy bed grown from the forest.",
		["Rarity"] = "Legendary",
		["Icon"] = "rbxassetid://139362142949816",
		["Model"] = v4:FindFirstChild("Mushroom Bed"),
		["Actions"] = {},
		["Tags"] = { "MISC" }
	},
	["Mushroom Rug"] = {
		["Description"] = "Soft, spongy magic for your toes.",
		["Rarity"] = "Legendary",
		["Icon"] = "rbxassetid://107413853079743",
		["Model"] = v4:FindFirstChild("Mushroom Rug"),
		["Actions"] = {},
		["Tags"] = { "MISC" }
	},
	["Mushroom Throne"] = {
		["Description"] = "The seat where stories and magic begin!",
		["Rarity"] = "Legendary",
		["Icon"] = "rbxassetid://92423835907357",
		["Model"] = v4:FindFirstChild("Mushroom Throne"),
		["Actions"] = {},
		["Tags"] = { "MISC" }
	},
	["Mystical Archway"] = {
		["Description"] = "An archway that whispers secrets of old...",
		["Rarity"] = "Mythical",
		["Icon"] = "rbxassetid://127453298266430",
		["Model"] = v4:FindFirstChild("Mystical Archway"),
		["Actions"] = {},
		["Tags"] = { "MISC" }
	},
	["Mystical Waterfall"] = {
		["Description"] = "Nature\226\128\153s spell in flowing form!",
		["Rarity"] = "Mythical",
		["Icon"] = "rbxassetid://96179259788217",
		["Model"] = v4:FindFirstChild("Mystical Waterfall"),
		["Actions"] = {},
		["Tags"] = { "MISC" }
	},
	["Snake Pillar"] = {
		["Description"] = "A snake that loves to play peek-a-boo!",
		["Rarity"] = "Legendary",
		["Icon"] = "rbxassetid://106063311813613",
		["Model"] = v4:FindFirstChild("Snake Pillar"),
		["Actions"] = {},
		["Tags"] = { "MISC" }
	},
	["Tree Trunk Stairs"] = {
		["Description"] = "Wonder where those steps lead?",
		["Rarity"] = "Rare",
		["Icon"] = "rbxassetid://121142939380745",
		["Model"] = v4:FindFirstChild("Tree Trunk Stairs"),
		["Actions"] = {},
		["Tags"] = { "MISC" }
	},
	["Vine Spiked Fence"] = {
		["Description"] = "Ouch, that\'s spiky!",
		["Rarity"] = "Rare",
		["Icon"] = "rbxassetid://134126728404869",
		["Model"] = v4:FindFirstChild("Vine Spiked Fence"),
		["Actions"] = {},
		["Tags"] = { "MISC" }
	},
	["Treasure Chest"] = {
		["Description"] = "Packed with loot and secrets!",
		["Rarity"] = "Legendary",
		["Icon"] = "rbxassetid://89617169584023",
		["Model"] = v4:FindFirstChild("Treasure Chest"),
		["Actions"] = {},
		["Tags"] = { "MISC" }
	},
	["Telescope"] = {
		["Description"] = "Galaxies at your fingertips!",
		["Rarity"] = "Rare",
		["Icon"] = "rbxassetid://87521337166060",
		["Model"] = v4:FindFirstChild("Telescope"),
		["Actions"] = {},
		["Tags"] = { "MISC" }
	},
	["Fireplace"] = {
		["Description"] = "Warmth and cozy vibes!",
		["Rarity"] = "Mythical",
		["Icon"] = "rbxassetid://73881410789867",
		["Model"] = v4:FindFirstChild("Fireplace"),
		["Actions"] = {},
		["Tags"] = { "MISC" }
	},
	["Grandfather Clock"] = {
		["Description"] = "Tick-tock .... tick-tock ...",
		["Rarity"] = "Rare",
		["Icon"] = "rbxassetid://131195281744176",
		["Model"] = v4:FindFirstChild("Grandfather Clock"),
		["Actions"] = {},
		["Tags"] = { "MISC" }
	},
	["Wood Windmill"] = {
		["Description"] = "Turning with the breeze!",
		["Rarity"] = "Rare",
		["Icon"] = "rbxassetid://139928525381726",
		["Model"] = v4:FindFirstChild("Wood Windmill"),
		["Actions"] = {},
		["Tags"] = { "MISC" }
	},
	["Cannon"] = {
		["Description"] = "Big boom, big impact!!",
		["Rarity"] = "Mythical",
		["Icon"] = "rbxassetid://121227189383431",
		["Model"] = v4:FindFirstChild("Cannon"),
		["Actions"] = {},
		["Tags"] = { "MISC" }
	},
	["Workbench"] = {
		["Description"] = "Gotta get to work!",
		["Rarity"] = "Legendary",
		["Icon"] = "rbxassetid://119867985372344",
		["Model"] = v4:FindFirstChild("Workbench"),
		["Actions"] = {},
		["Tags"] = { "MISC" }
	},
	["Keyboard"] = {
		["Description"] = "Make every key count!",
		["Rarity"] = "Rare",
		["Icon"] = "rbxassetid://125435823218731",
		["Model"] = v4:FindFirstChild("Keyboard"),
		["Actions"] = {},
		["Tags"] = { "MISC" }
	},
	["Scooter"] = {
		["Description"] = "Swift, smooth, speedy!",
		["Rarity"] = "Legendary",
		["Icon"] = "rbxassetid://102512725078827",
		["Model"] = v4:FindFirstChild("Scooter"),
		["Actions"] = {},
		["Tags"] = { "MISC" }
	},
	["Treadmill"] = {
		["Description"] = "Step into fitness!",
		["Rarity"] = "Rare",
		["Icon"] = "rbxassetid://135628781134806",
		["Model"] = v4:FindFirstChild("Treadmill"),
		["Actions"] = {},
		["Tags"] = { "MISC" }
	},
	["Woody Sign"] = {
		["Description"] = "A woody sign",
		["Rarity"] = "Common",
		["Icon"] = "rbxassetid://90947798053901",
		["Model"] = v4:FindFirstChild("Woody Sign"),
		["Actions"] = {},
		["Tags"] = { "MISC" }
	},
	["Stalky Sign"] = {
		["Description"] = "A stalky sign",
		["Rarity"] = "Common",
		["Icon"] = "rbxassetid://113785321384989",
		["Model"] = v4:FindFirstChild("Stalky Sign"),
		["Actions"] = {},
		["Tags"] = { "MISC" }
	},
	["Spicy Sign"] = {
		["Description"] = "A spicy sign",
		["Rarity"] = "Common",
		["Icon"] = "rbxassetid://87914101845857",
		["Model"] = v4:FindFirstChild("Spicy Sign"),
		["Actions"] = {},
		["Tags"] = { "MISC" }
	},
	["Sweet Sign"] = {
		["Description"] = "A sweet sign",
		["Rarity"] = "Common",
		["Icon"] = "rbxassetid://136360670714246",
		["Model"] = v4:FindFirstChild("Sweet Sign"),
		["Actions"] = {},
		["Tags"] = { "MISC" }
	},
	["Tropical Sign"] = {
		["Description"] = "A tropical sign",
		["Rarity"] = "Common",
		["Icon"] = "rbxassetid://74098972118405",
		["Model"] = v4:FindFirstChild("Tropical Sign"),
		["Actions"] = {},
		["Tags"] = { "MISC" }
	},
	["Vegetable Sign"] = {
		["Description"] = "A vegetable sign",
		["Rarity"] = "Common",
		["Icon"] = "rbxassetid://82835390126793",
		["Model"] = v4:FindFirstChild("Vegetable Sign"),
		["Actions"] = {},
		["Tags"] = { "MISC" }
	},
	["Prickly Sign"] = {
		["Description"] = "A prickly sign",
		["Rarity"] = "Common",
		["Icon"] = "rbxassetid://138335256345399",
		["Model"] = v4:FindFirstChild("Prickly Sign"),
		["Actions"] = {},
		["Tags"] = { "MISC" }
	},
	["Berry Sign"] = {
		["Description"] = "A berry sign",
		["Rarity"] = "Common",
		["Icon"] = "rbxassetid://120921984292872",
		["Model"] = v4:FindFirstChild("Berry Sign"),
		["Actions"] = {},
		["Tags"] = { "MISC" }
	},
	["Flower Sign"] = {
		["Description"] = "A flower sign",
		["Rarity"] = "Common",
		["Icon"] = "rbxassetid://121138671792368",
		["Model"] = v4:FindFirstChild("Flower Sign"),
		["Actions"] = {},
		["Tags"] = { "MISC" }
	},
	["Fruit Sign"] = {
		["Description"] = "A fruit sign",
		["Rarity"] = "Common",
		["Icon"] = "rbxassetid://117553553339011",
		["Model"] = v4:FindFirstChild("Fruit Sign"),
		["Actions"] = {},
		["Tags"] = { "MISC" }
	},
	["Leafy Sign"] = {
		["Description"] = "A leafy sign",
		["Rarity"] = "Common",
		["Icon"] = "rbxassetid://72408063141032",
		["Model"] = v4:FindFirstChild("Leafy Sign"),
		["Actions"] = {},
		["Tags"] = { "MISC" }
	},
	["Egg Yolk Mat"] = {
		["Description"] = "A sunny splash of golden yolk, perfectly fried into comfort. Step onto it and feel breakfast\226\128\153s warm embrace beneath your feet.",
		["Rarity"] = "Mythical",
		["Icon"] = "rbxassetid://116585587483820",
		["Model"] = v4:FindFirstChild("Egg Yolk Mat"),
		["Actions"] = {},
		["Tags"] = { "MISC" }
	},
	["Football Goal"] = {
		["Description"] = "A fun goal post!",
		["Rarity"] = "Prismatic",
		["Icon"] = "rbxassetid://83428419041866",
		["Model"] = v4:FindFirstChild("Football Goal"),
		["Actions"] = {},
		["Tags"] = { "MISC" }
	},
	["Squirrel House"] = {
		["Description"] = "Wonder who lives in here ...",
		["Rarity"] = "Rare",
		["Icon"] = "rbxassetid://98770681631165",
		["Model"] = v4:FindFirstChild("Squirrel House"),
		["Actions"] = {},
		["Tags"] = { "MISC" }
	},
	["Acorn Bookshelf"] = {
		["Description"] = "Can squirrels read?",
		["Rarity"] = "Rare",
		["Icon"] = "rbxassetid://133207959679854",
		["Model"] = v4:FindFirstChild("Acorn Bookshelf"),
		["Actions"] = {},
		["Tags"] = { "MISC" }
	},
	["Acorn Couch"] = {
		["Description"] = "A place to sit for tiny critters",
		["Rarity"] = "Rare",
		["Icon"] = "rbxassetid://96109651776731",
		["Model"] = v4:FindFirstChild("Acorn Couch"),
		["Actions"] = {},
		["Tags"] = { "MISC" }
	},
	["Acorn Fountain"] = {
		["Description"] = "Tiny streams from a woodland gem.",
		["Rarity"] = "Mythical",
		["Icon"] = "rbxassetid://136063174535857",
		["Model"] = v4:FindFirstChild("Acorn Fountain"),
		["Actions"] = {},
		["Tags"] = { "MISC" }
	},
	["Acorn Lantern"] = {
		["Description"] = "An acorn that glows brightly.",
		["Rarity"] = "Rare",
		["Icon"] = "rbxassetid://106427986646630",
		["Model"] = v4:FindFirstChild("Acorn Lantern"),
		["Actions"] = {},
		["Tags"] = { "MISC" }
	},
	["Acorn Mirror"] = {
		["Description"] = "I guess squirrels need to look good too!",
		["Rarity"] = "Rare",
		["Icon"] = "rbxassetid://135032889367452",
		["Model"] = v4:FindFirstChild("Acorn Mirror"),
		["Actions"] = {},
		["Tags"] = { "MISC" }
	},
	["Acorn Rug"] = {
		["Description"] = "A regular acorn rug.",
		["Rarity"] = "Rare",
		["Icon"] = "rbxassetid://79708170599291",
		["Model"] = v4:FindFirstChild("Acorn Rug"),
		["Actions"] = {},
		["Tags"] = { "MISC" }
	},
	["Acorn Statue"] = {
		["Description"] = "Ooooh shiny acorn!",
		["Rarity"] = "Mythical",
		["Icon"] = "rbxassetid://86864992731654",
		["Model"] = v4:FindFirstChild("Acorn Statue"),
		["Actions"] = {},
		["Tags"] = { "MISC" }
	},
	["Acorn Stool"] = {
		["Description"] = "Squirrels need to sit down and rest!",
		["Rarity"] = "Rare",
		["Icon"] = "rbxassetid://105779714869638",
		["Model"] = v4:FindFirstChild("Acorn Stool"),
		["Actions"] = {},
		["Tags"] = { "MISC" }
	},
	["Acorn Table"] = {
		["Description"] = "Dinner time for squirrels!",
		["Rarity"] = "Rare",
		["Icon"] = "rbxassetid://96964684093251",
		["Model"] = v4:FindFirstChild("Acorn Table"),
		["Actions"] = {},
		["Tags"] = { "MISC" }
	},
	["Garden Lanterns"] = {
		["Description"] = "Light up your garden!",
		["Rarity"] = "Rare",
		["Icon"] = "rbxassetid://109111690407497",
		["Model"] = v4:FindFirstChild("Garden Lanterns"),
		["Actions"] = {},
		["Tags"] = { "MISC" }
	},
	["Glass Bookshelf"] = {
		["Description"] = "A clear home for hidden tales!",
		["Rarity"] = "Legendary",
		["Icon"] = "rbxassetid://131736832761119",
		["Model"] = v4:FindFirstChild("Glass Bookshelf"),
		["Actions"] = {},
		["Tags"] = { "MISC" }
	},
	["Glass Staircase"] = {
		["Description"] = "Each step shimmers like dew...",
		["Rarity"] = "Legendary",
		["Icon"] = "rbxassetid://119725575499382",
		["Model"] = v4:FindFirstChild("Glass Staircase"),
		["Actions"] = {},
		["Tags"] = { "MISC" }
	},
	["Glass Table"] = {
		["Description"] = "A table made of daylight!",
		["Rarity"] = "Rare",
		["Icon"] = "rbxassetid://96062261432935",
		["Model"] = v4:FindFirstChild("Glass Table"),
		["Actions"] = {},
		["Tags"] = { "MISC" }
	},
	["Party Lights"] = {
		["Description"] = "Time to party!",
		["Rarity"] = "Rare",
		["Icon"] = "rbxassetid://137721146601497",
		["Model"] = v4:FindFirstChild("Party Lights"),
		["Actions"] = {},
		["Tags"] = { "MISC" }
	},
	["Round Lantern"] = {
		["Description"] = "A lantern but round!",
		["Rarity"] = "Rare",
		["Icon"] = "rbxassetid://112123770115507",
		["Model"] = v4:FindFirstChild("Round Lantern"),
		["Actions"] = {},
		["Tags"] = { "MISC" }
	},
	["Street Lantern"] = {
		["Description"] = "A little light for wandering feet!",
		["Rarity"] = "Rare",
		["Icon"] = "rbxassetid://110993339282133",
		["Model"] = v4:FindFirstChild("Street Lantern"),
		["Actions"] = {},
		["Tags"] = { "MISC" }
	},
	["Jack-O-Lantern"] = {
		["Description"] = "A classic Halloween decorative staple!",
		["Rarity"] = "Rare",
		["Icon"] = "rbxassetid://139597230777550",
		["Models"] = {
			v4:FindFirstChild("Happy Pumpkin"),
			v4:FindFirstChild("Devious Pumpkin"),
			v4:FindFirstChild("Sad Pumpkin"),
			v4:FindFirstChild("Cry Pumpkin"),
			v4:FindFirstChild("Sleepy Pumpkin")
		},
		["Actions"] = {},
		["Tags"] = { "MISC" }
	},
	["Witch\'s Cauldron"] = {
		["Description"] = "Double, double toil and trouble; Fire burn and cauldron bubble.",
		["Rarity"] = "Mythical",
		["Icon"] = "rbxassetid://73021053514257",
		["Model"] = v4:FindFirstChild("Witch\'s Cauldron"),
		["Actions"] = {},
		["Tags"] = { "MISC" }
	},
	["Fog Machine"] = {
		["Description"] = "Whispers mist into the air.",
		["Rarity"] = "Rare",
		["Icon"] = "rbxassetid://70889663680181",
		["Model"] = v4:FindFirstChild("Fog Machine"),
		["Actions"] = {},
		["Tags"] = { "MISC" }
	},
	["Ghost Chair"] = {
		["Description"] = "Looks empty... yet feels alive..",
		["Rarity"] = "Rare",
		["Icon"] = "rbxassetid://93022780864567",
		["Model"] = v4:FindFirstChild("Ghost Chair"),
		["Actions"] = {},
		["Tags"] = { "MISC" }
	},
	["Ghost Lantern"] = {
		["Description"] = "A glow from the other side.",
		["Rarity"] = "Rare",
		["Icon"] = "rbxassetid://127706061197677",
		["Model"] = v4:FindFirstChild("Ghost Lantern"),
		["Actions"] = {},
		["Tags"] = { "MISC" }
	},
	["Halloween Basket"] = {
		["Description"] = "Carry your tricks and treats in style.",
		["Rarity"] = "Legendary",
		["Icon"] = "rbxassetid://116536035330186",
		["Model"] = v4:FindFirstChild("Halloween Basket"),
		["Actions"] = {},
		["Tags"] = { "MISC" }
	},
	["Halloween Candles"] = {
		["Description"] = "Flickers of spooky warmth.",
		["Rarity"] = "Rare",
		["Icon"] = "rbxassetid://130332100496134",
		["Model"] = v4:FindFirstChild("Halloween Candles"),
		["Actions"] = {},
		["Tags"] = { "MISC" }
	},
	["Pallet Grave"] = {
		["Description"] = "Watch your step!!",
		["Rarity"] = "Legendary",
		["Icon"] = "rbxassetid://81383255386017",
		["Model"] = v4:FindFirstChild("Pallet Grave"),
		["Actions"] = {},
		["Tags"] = { "MISC" }
	},
	["Pumpkin Lantern"] = {
		["Description"] = "Keeps the dark away with a grin.",
		["Rarity"] = "Legendary",
		["Icon"] = "rbxassetid://116484217723185",
		["Model"] = v4:FindFirstChild("Pumpkin Lantern"),
		["Actions"] = {},
		["Tags"] = { "MISC" }
	},
	["Pumpkin Light"] = {
		["Description"] = "Pumpkin warmth, bottled in a glow.",
		["Rarity"] = "Rare",
		["Icon"] = "rbxassetid://115111162877107",
		["Model"] = v4:FindFirstChild("Pumpkin Light"),
		["Actions"] = {},
		["Tags"] = { "MISC" }
	},
	["Pumpkin Set"] = {
		["Description"] = "A cozy cluster of pumpkins.",
		["Rarity"] = "Rare",
		["Icon"] = "rbxassetid://131102235209478",
		["Model"] = v4:FindFirstChild("Pumpkin Set"),
		["Actions"] = {},
		["Tags"] = { "MISC" }
	},
	["Skull Chain"] = {
		["Description"] = "A rattling row of spooky smiles.",
		["Rarity"] = "Mythical",
		["Icon"] = "rbxassetid://104452469816621",
		["Model"] = v4:FindFirstChild("Skull Chain"),
		["Actions"] = {},
		["Tags"] = { "MISC" }
	},
	["Headless Horseman Statue"] = {
		["Description"] = "A ghost who rides a horse and carries a pumpkin instead of a head...",
		["Rarity"] = "Divine",
		["Icon"] = "rbxassetid://119355044809313",
		["Model"] = v4:FindFirstChild("Headless Horseman Statue"),
		["Actions"] = {},
		["Tags"] = { "MISC", "STATUE" }
	},
	["Tombstones"] = {
		["Description"] = "Resting.. sort of.",
		["Rarity"] = "Legendary",
		["Icon"] = "rbxassetid://94361324763679",
		["Model"] = v4:FindFirstChild("Tombstones"),
		["Actions"] = {},
		["Tags"] = { "MISC" }
	},
	["Pumpkin on a Stick"] = {
		["Description"] = "Cheerfully creepy.",
		["Rarity"] = "Rare",
		["Icon"] = "rbxassetid://137947408195393",
		["Model"] = v4:FindFirstChild("Pumpkin on a Stick"),
		["Actions"] = {},
		["Tags"] = { "MISC" }
	},
	["Halloween Lights"] = {
		["Description"] = "Twinkling lights that dance with ghostly delight.",
		["Rarity"] = "Rare",
		["Icon"] = "rbxassetid://121996063183790",
		["Model"] = v4:FindFirstChild("Halloween Lights"),
		["Actions"] = {},
		["Tags"] = { "MISC" }
	},
	["Casket"] = {
		["Description"] = "Wonder who\'s inside?",
		["Rarity"] = "Mythical",
		["Icon"] = "rbxassetid://82910491809508",
		["Model"] = v4:FindFirstChild("Casket"),
		["Actions"] = {},
		["Tags"] = { "MISC" }
	},
	["Pumpkin Scarecrow"] = {
		["Description"] = "A grinning guardian of the haunted patch.",
		["Rarity"] = "Legendary",
		["Icon"] = "rbxassetid://113076006623309",
		["Model"] = v4:FindFirstChild("Pumpkin Scarecrow"),
		["Actions"] = {},
		["Tags"] = { "MISC" }
	},
	["Halloween Archway"] = {
		["Description"] = "Step through\226\128\166 if you dare to delight.",
		["Rarity"] = "Mythical",
		["Icon"] = "rbxassetid://98723874771666",
		["Model"] = v4:FindFirstChild("Halloween Archway"),
		["Actions"] = {},
		["Tags"] = { "MISC" }
	},
	["Halloween Ribbon"] = {
		["Description"] = "Tied with a twist of spooky cheer.",
		["Rarity"] = "Rare",
		["Icon"] = "rbxassetid://72805409953125",
		["Model"] = v4:FindFirstChild("Halloween Ribbon"),
		["Actions"] = {},
		["Tags"] = { "MISC" }
	},
	["Halloween Stump"] = {
		["Description"] = "Once a tree, now a seat for spooky stories.",
		["Rarity"] = "Legendary",
		["Icon"] = "rbxassetid://123568924429983",
		["Model"] = v4:FindFirstChild("Halloween Stump"),
		["Actions"] = {},
		["Tags"] = { "MISC" }
	},
	["Hex Circle"] = {
		["Description"] = "Looksss like its used for sssome ritualistic practice...",
		["Rarity"] = "Mythical",
		["Icon"] = "rbxassetid://87455983401272",
		["Model"] = v4:FindFirstChild("Hex Circle"),
		["Actions"] = {},
		["Tags"] = { "MISC" }
	},
	["Sarcophagus"] = {
		["Description"] = "A great ruler deserves sarcophagorgeous burial.",
		["Rarity"] = "Divine",
		["Icon"] = "rbxassetid://96717470384967",
		["Model"] = v4:FindFirstChild("Sarcophagus"),
		["Actions"] = {},
		["Tags"] = { "MISC" }
	},
	["Gravestone"] = {
		["Description"] = "RIP",
		["Rarity"] = "Rare",
		["Icon"] = "rbxassetid://114879563099440",
		["Models"] = {
			v4:FindFirstChild("Gravestone_1"),
			v4:FindFirstChild("Gravestone_2"),
			v4:FindFirstChild("Gravestone_3"),
			v4:FindFirstChild("Gravestone_4"),
			v4:FindFirstChild("Gravestone_5"),
			v4:FindFirstChild("Gravestone_6")
		},
		["Actions"] = {},
		["Tags"] = { "MISC" }
	},
	["Cobweb"] = {
		["Description"] = "Don\226\128\153t get tangled up in the details.",
		["Rarity"] = "Rare",
		["Icon"] = "rbxassetid://118924465497200",
		["Models"] = {
			v4:FindFirstChild("Cobweb_1"),
			v4:FindFirstChild("Cobweb_2"),
			v4:FindFirstChild("Cobweb_3"),
			v4:FindFirstChild("Cobweb_4"),
			v4:FindFirstChild("Cobweb_5")
		},
		["Actions"] = {},
		["Tags"] = { "MISC" }
	},
	["Graveyard Fence"] = {
		["Description"] = "For keeping intruders out and keeping ghosts in!",
		["Rarity"] = "Rare",
		["Icon"] = "rbxassetid://118758054291891",
		["Model"] = v4:FindFirstChild("Graveyard Fence"),
		["Actions"] = {},
		["Tags"] = { "MISC" }
	},
	["Graveyard Lamp Post"] = {
		["Description"] = "Lighting the way for the dearly de-parted.",
		["Rarity"] = "Rare",
		["Icon"] = "rbxassetid://73143571843994",
		["Model"] = v4:FindFirstChild("Graveyard Lamp Post"),
		["Actions"] = {},
		["Tags"] = { "MISC" }
	},
	["Graveyard Urn"] = {
		["Description"] = "Oh how the tables urn?",
		["Rarity"] = "Rare",
		["Icon"] = "rbxassetid://89152422090075",
		["Model"] = v4:FindFirstChild("Graveyard Urn"),
		["Actions"] = {},
		["Tags"] = { "MISC" }
	},
	["Black String Lights"] = {
		["Description"] = "Darkest lights in the spooky market.",
		["Rarity"] = "Rare",
		["Icon"] = "rbxassetid://126278824766131",
		["Model"] = v4:FindFirstChild("Black String Lights"),
		["Actions"] = {},
		["Tags"] = { "MISC" }
	},
	["Spell Book"] = {
		["Description"] = "Your spooky spells in one book!",
		["Rarity"] = "Legendary",
		["Icon"] = "rbxassetid://107421290151802",
		["Model"] = v4:FindFirstChild("Spell Book"),
		["Actions"] = {},
		["Tags"] = { "MISC" }
	},
	["Spider Prop"] = {
		["Description"] = "Looks like a bunch of real spiders!",
		["Rarity"] = "Rare",
		["Icon"] = "rbxassetid://95206497311955",
		["Model"] = v4:FindFirstChild("Spider Prop"),
		["Actions"] = {},
		["Tags"] = { "MISC" }
	},
	["Mausoleum"] = {
		["Description"] = "A silent stone tomb where whispers never fade.",
		["Rarity"] = "Legendary",
		["Icon"] = "rbxassetid://100270381298737",
		["Model"] = v4:FindFirstChild("Mausoleum"),
		["Actions"] = {},
		["Tags"] = { "MISC" }
	},
	["Lich Statue"] = {
		["Description"] = "A towering figure cloaked in shadow.",
		["Rarity"] = "Legendary",
		["Icon"] = "rbxassetid://76042030381858",
		["Model"] = v4:FindFirstChild("Lich Statue"),
		["Actions"] = {},
		["Tags"] = { "MISC", "STATUE" }
	},
	["Safari Arch"] = {
		["Description"] = "Entrance to the Safari.",
		["Rarity"] = "Legendary",
		["Icon"] = "rbxassetid://82271666801469",
		["Model"] = v4:FindFirstChild("Safari Arch"),
		["Actions"] = {},
		["Tags"] = { "MISC" }
	},
	["Explorer Kit"] = {
		["Description"] = "Don\'t forget your tools!",
		["Rarity"] = "Rare",
		["Icon"] = "rbxassetid://88961710358079",
		["Model"] = v4:FindFirstChild("Explorer Kit"),
		["Actions"] = {},
		["Tags"] = { "MISC" }
	},
	["Suitcases"] = {
		["Description"] = "Carries all your explorer clothes and stuff",
		["Rarity"] = "Rare",
		["Icon"] = "rbxassetid://106137546684529",
		["Model"] = v4:FindFirstChild("Suitcases"),
		["Actions"] = {},
		["Tags"] = { "MISC" }
	},
	["Safari Tent"] = {
		["Description"] = "Time to rest....",
		["Rarity"] = "Legendary",
		["Icon"] = "rbxassetid://135155740975217",
		["Model"] = v4:FindFirstChild("Safari Tent"),
		["Actions"] = {},
		["Tags"] = { "MISC" }
	},
	["Elephant Statue"] = {
		["Description"] = "Wait ... is that a shiny elephant?",
		["Rarity"] = "Mythical",
		["Icon"] = "rbxassetid://105604230176380",
		["Model"] = v4:FindFirstChild("Elephant Statue"),
		["Actions"] = {},
		["Tags"] = { "MISC", "STATUE" }
	},
	["Safari Painting"] = {
		["Description"] = "A nice painting of the Safari.",
		["Rarity"] = "Rare",
		["Icon"] = "rbxassetid://119129370276754",
		["Model"] = v4:FindFirstChild("Safari Painting"),
		["Actions"] = {},
		["Tags"] = { "MISC" }
	},
	["Basketball Hoop"] = {
		["Description"] = "Lets play ball!",
		["Rarity"] = "Rare",
		["Icon"] = "rbxassetid://106112826191131",
		["Model"] = v4:FindFirstChild("Basketball Hoop"),
		["Actions"] = {},
		["Tags"] = { "MISC" }
	},
	["Bonfire"] = {
		["Description"] = "Gather \'round the bonfire.",
		["Rarity"] = "Rare",
		["Icon"] = "rbxassetid://105815532052304",
		["Model"] = v4:FindFirstChild("Bonfire"),
		["Actions"] = {},
		["Tags"] = { "MISC" }
	},
	["Rotary Clothesline"] = {
		["Description"] = "Set the clothes to spin dry.",
		["Rarity"] = "Rare",
		["Icon"] = "rbxassetid://135671594715771",
		["Model"] = v4:FindFirstChild("Rotary Clothesline"),
		["Actions"] = {},
		["Tags"] = { "MISC" }
	},
	["Flower Bench"] = {
		["Description"] = "They are very strong flowers.",
		["Rarity"] = "Rare",
		["Icon"] = "rbxassetid://124929387730332",
		["Model"] = v4:FindFirstChild("Flower Bench"),
		["Actions"] = {},
		["Tags"] = { "MISC" }
	},
	["Garden Arbor"] = {
		["Description"] = "A charming wooden arbor perfect for any garden entrance.",
		["Rarity"] = "Rare",
		["Icon"] = "rbxassetid://113516853670313",
		["Model"] = v4:FindFirstChild("Garden Arbor"),
		["Actions"] = {},
		["Tags"] = { "MISC" }
	},
	["Garden Workbench"] = {
		["Description"] = "A useful bench for working outdoors.",
		["Rarity"] = "Rare",
		["Icon"] = "rbxassetid://82693446156704",
		["Model"] = v4:FindFirstChild("Garden Bench"),
		["Actions"] = {},
		["Tags"] = { "MISC" }
	},
	["Garden Hose"] = {
		["Description"] = "A trusty hose for watering your plants.",
		["Rarity"] = "Rare",
		["Icon"] = "rbxassetid://124616104262605",
		["Model"] = v4:FindFirstChild("Garden Hose"),
		["Actions"] = {},
		["Tags"] = { "MISC" }
	},
	["Garden Shed"] = {
		["Description"] = "A small shed to store all your gardening tools.",
		["Rarity"] = "Rare",
		["Icon"] = "rbxassetid://138121014938433",
		["Model"] = v4:FindFirstChild("Garden Shed"),
		["Actions"] = {},
		["Tags"] = { "MISC" }
	},
	["Gazebo"] = {
		["Description"] = "A beautiful outdoor gazebo for shade and style.",
		["Rarity"] = "Rare",
		["Icon"] = "rbxassetid://140215849240233",
		["Model"] = v4:FindFirstChild("Gazebo"),
		["Actions"] = {},
		["Tags"] = { "MISC" }
	},
	["Grill"] = {
		["Description"] = "A shiny grill for your next backyard barbecue.",
		["Rarity"] = "Rare",
		["Icon"] = "rbxassetid://115167736334853",
		["Model"] = v4:FindFirstChild("Grill"),
		["Actions"] = {},
		["Tags"] = { "MISC" }
	},
	["Manual Lawnmower"] = {
		["Description"] = "An old-school manual lawnmower for a bit of a workout.",
		["Rarity"] = "Rare",
		["Icon"] = "rbxassetid://80251024139315",
		["Model"] = v4:FindFirstChild("Manual Lawnmower"),
		["Actions"] = {},
		["Tags"] = { "MISC" }
	},
	["Mossy Rock"] = {
		["Description"] = "A moss-covered rock to add some nature to your yard.",
		["Rarity"] = "Rare",
		["Icon"] = "rbxassetid://103711780677419",
		["Model"] = v4:FindFirstChild("Mossy Rock"),
		["Actions"] = {},
		["Tags"] = { "MISC" }
	},
	["Sun Dial"] = {
		["Description"] = "A classic sun dial to tell time the old-fashioned way.",
		["Rarity"] = "Rare",
		["Icon"] = "rbxassetid://98602814047955",
		["Model"] = v4:FindFirstChild("Sun Dial"),
		["Actions"] = {},
		["Tags"] = { "MISC" }
	},
	["Skull Chair"] = {
		["Description"] = "A throne carved from bone and shadow.",
		["Rarity"] = "Legendary",
		["Icon"] = "rbxassetid://94644139300848",
		["Model"] = v4:FindFirstChild("Skull Chair"),
		["Actions"] = {},
		["Tags"] = { "MISC" }
	},
	["Silver Beetle Trophy"] = {
		["Description"] = "For the almost champions.",
		["Rarity"] = "Rare",
		["Icon"] = "rbxassetid://106695276316428",
		["Model"] = v4:FindFirstChild("Silver Beetle Trophy"),
		["Actions"] = {},
		["Tags"] = { "STATUE" }
	},
	["Gold Beetle Trophy"] = {
		["Description"] = "For the champions.",
		["Rarity"] = "Legendary",
		["Icon"] = "rbxassetid://117363879598257",
		["Model"] = v4:FindFirstChild("Gold Beetle Trophy"),
		["Actions"] = {},
		["Tags"] = { "STATUE" }
	},
	["Pine Beetle Trophy"] = {
		["Description"] = "For the festive champions.",
		["Rarity"] = "Legendary",
		["Icon"] = "rbxassetid://91545706770851",
		["Model"] = v4:FindFirstChild("Pine Beetle Trophy"),
		["Actions"] = {},
		["Tags"] = { "STATUE" }
	},
	["Safari Animal Statue"] = {
		["Description"] = "Different Safari animals cared into beautiful marble.",
		["Rarity"] = "Legendary",
		["Icon"] = "rbxassetid://114149311930351",
		["Models"] = {
			v4:FindFirstChild("Safari Oxpecker Statue"),
			v4:FindFirstChild("Safari Zebra Statue"),
			v4:FindFirstChild("Safari Giraffe Statue"),
			v4:FindFirstChild("Safari Rhino Statue"),
			v4:FindFirstChild("Safari Elephant Statue")
		},
		["Actions"] = {},
		["Tags"] = { "STATUE" }
	},
	["Safari Chair"] = {
		["Description"] = "Take a break from exploring the Safari.",
		["Rarity"] = "Rare",
		["Icon"] = "rbxassetid://107278965484084",
		["Model"] = v4:FindFirstChild("Safari Chair"),
		["Actions"] = {},
		["Tags"] = { "MISC" }
	},
	["Lion Rug"] = {
		["Description"] = "A fluffy lion rug that looks fierce but feels fancy.",
		["Rarity"] = "Rare",
		["Icon"] = "rbxassetid://121092374245194",
		["Model"] = v4:FindFirstChild("Lion Rug"),
		["Actions"] = {},
		["Tags"] = { "MISC" }
	},
	["Open Tent"] = {
		["Description"] = "Adventure outside, snacks and chill vibes inside.",
		["Rarity"] = "Legendary",
		["Icon"] = "rbxassetid://112740184415387",
		["Model"] = v4:FindFirstChild("Open Tent"),
		["Actions"] = {},
		["Tags"] = { "MISC" }
	},
	["Safari Car Statue"] = {
		["Description"] = "A miniature safari truck frozen mid-adventure.",
		["Rarity"] = "Legendary",
		["Icon"] = "rbxassetid://87392652878665",
		["Model"] = v4:FindFirstChild("Safari Car Statue"),
		["Actions"] = {},
		["Tags"] = { "MISC", "STATUE" }
	},
	["Safari Lamp Post"] = {
		["Description"] = "Glows like a cozy campfire for explorers.",
		["Rarity"] = "Rare",
		["Icon"] = "rbxassetid://94681144072423",
		["Model"] = v4:FindFirstChild("Safari Lamp Post"),
		["Actions"] = {},
		["Tags"] = { "MISC" }
	},
	["Safari Telescope"] = {
		["Description"] = "Rugged safari telescope perched on a tripod, ready to spy lions in the wild\226\128\166.",
		["Rarity"] = "Rare",
		["Icon"] = "rbxassetid://84440344986769",
		["Model"] = v4:FindFirstChild("Safari Telescope"),
		["Actions"] = {},
		["Tags"] = { "MISC" }
	},
	["Safari Shipping Container"] = {
		["Description"] = "Special imported fruits from the Safari!",
		["Rarity"] = "Mythical",
		["Icon"] = "rbxassetid://79434384379842",
		["Model"] = v4:FindFirstChild("Safari Shipping Container"),
		["Actions"] = {},
		["Tags"] = { "MISC" }
	},
	["Anvil"] = {
		["Description"] = "Perfect for crafting masterpieces or just making a lot of noise.",
		["Rarity"] = "Rare",
		["Icon"] = "rbxassetid://93100248901098",
		["Model"] = v4:FindFirstChild("Anvil"),
		["Actions"] = {},
		["Tags"] = { "MISC" }
	},
	["Anvil Statue"] = {
		["Description"] = "Silent now, but it still hums with the echoes of a thousand strikes.",
		["Rarity"] = "Legendary",
		["Icon"] = "rbxassetid://126995080935350",
		["Model"] = v4:FindFirstChild("Anvil Statue"),
		["Actions"] = {},
		["Tags"] = { "MISC", "STATUE" }
	},
	["Coal Box"] = {
		["Description"] = "Where embers rest, waiting for their next forge-born flame.",
		["Rarity"] = "Rare",
		["Icon"] = "rbxassetid://97680338753167",
		["Model"] = v4:FindFirstChild("Coal Box"),
		["Actions"] = {},
		["Tags"] = { "MISC" }
	},
	["Blacksmith Grinder"] = {
		["Description"] = "Designed for grinding, shaping, and sharpening metal. Watch your fingers!",
		["Rarity"] = "Legendary",
		["Icon"] = "rbxassetid://78243597750567",
		["Model"] = v4:FindFirstChild("Blacksmith Grinder"),
		["Actions"] = {},
		["Tags"] = { "MISC" }
	},
	["Shield Statue"] = {
		["Description"] = "A proud shield statue, standing ready\226\128\166 though don\226\128\153t expect it to block any real dragons!",
		["Rarity"] = "Mythical",
		["Icon"] = "rbxassetid://76837871817367",
		["Model"] = v4:FindFirstChild("Shield Statue"),
		["Actions"] = {},
		["Tags"] = { "MISC", "STATUE" }
	},
	["Tools Rack"] = {
		["Description"] = "Hammers and tongs neatly displayed... ready for forging legends...",
		["Rarity"] = "Rare",
		["Icon"] = "rbxassetid://123860695640127",
		["Model"] = v4:FindFirstChild("Tools Rack"),
		["Actions"] = {},
		["Tags"] = { "MISC" }
	},
	["Garden Signpost"] = {
		["Description"] = "Guiding lost gardeners since... well, whenever it feels like it...",
		["Rarity"] = "Rare",
		["Icon"] = "rbxassetid://87078986230727",
		["Model"] = v4:FindFirstChild("Garden Signpost"),
		["Actions"] = {},
		["Tags"] = { "MISC" }
	},
	["Metal Ladder"] = {
		["Description"] = "Sturdy steps to reach new heights (or tall tomatoes).",
		["Rarity"] = "Rare",
		["Icon"] = "rbxassetid://121044177049636",
		["Model"] = v4:FindFirstChild("Metal Ladder"),
		["Actions"] = {},
		["Tags"] = { "MISC" }
	},
	["Sack Pallet"] = {
		["Description"] = "A tidy stack of bundled goods, ready for any hardworking gardener\226\128\153s day.",
		["Rarity"] = "Rare",
		["Icon"] = "rbxassetid://88252397951881",
		["Model"] = v4:FindFirstChild("Sack Pallet"),
		["Actions"] = {},
		["Tags"] = { "MISC" }
	},
	["Seed Display"] = {
		["Description"] = "Are those the old seedpacks?!",
		["Rarity"] = "Legendary",
		["Icon"] = "rbxassetid://86420818588158",
		["Model"] = v4:FindFirstChild("Seed Display"),
		["Actions"] = {},
		["Tags"] = { "MISC" }
	},
	["Trellis"] = {
		["Description"] = "A gentle climb for wandering vines.",
		["Rarity"] = "Rare",
		["Icon"] = "rbxassetid://96391014646182",
		["Model"] = v4:FindFirstChild("Trellis"),
		["Actions"] = {},
		["Tags"] = { "MISC" }
	},
	["Wagon Planter"] = {
		["Description"] = "Old wheels, new life...flowers hit the road in style.",
		["Rarity"] = "Rare",
		["Icon"] = "rbxassetid://137046567395908",
		["Model"] = v4:FindFirstChild("Wagon Planter"),
		["Actions"] = {},
		["Tags"] = { "MISC" }
	},
	["Horse Shoe Magnet"] = {
		["Description"] = "A curious charm said to draw nearby critters with its magnetic pull...",
		["Rarity"] = "Mythical",
		["Icon"] = "rbxassetid://114819719255479",
		["Model"] = v4:FindFirstChild("Horse Shoe Magnet"),
		["Actions"] = {},
		["Tags"] = { "MISC" },
		["Undeletable"] = true
	},
	["Gem Chair"] = {
		["Description"] = "A comfy seat covered in little gems.",
		["Rarity"] = "Rare",
		["Icon"] = "rbxassetid://92482271426460",
		["Model"] = v4:FindFirstChild("Gem Chair"),
		["Actions"] = {},
		["Tags"] = { "MISC" }
	},
	["Gem Table"] = {
		["Description"] = "A gem-lit table that glows with a gentle, colorful shimmer.",
		["Rarity"] = "Rare",
		["Icon"] = "rbxassetid://81382564359168",
		["Model"] = v4:FindFirstChild("Gem Table"),
		["Actions"] = {},
		["Tags"] = { "MISC" }
	},
	["Gem Lamp"] = {
		["Description"] = "A bright little lamp powered by pure crystal sparkle.",
		["Rarity"] = "Rare",
		["Icon"] = "rbxassetid://123195871956713",
		["Model"] = v4:FindFirstChild("Gem Lamp"),
		["Actions"] = {},
		["Tags"] = { "MISC" }
	},
	["Gem Bookshelf"] = {
		["Description"] = "A crystal-lined shelf that makes every book feel like treasure.",
		["Rarity"] = "Rare",
		["Icon"] = "rbxassetid://122681872342416",
		["Model"] = v4:FindFirstChild("Gem Bookshelf"),
		["Actions"] = {},
		["Tags"] = { "MISC" }
	},
	["Gem Bench"] = {
		["Description"] = "A radiant bench studded with twinkling stones.",
		["Rarity"] = "Rare",
		["Icon"] = "rbxassetid://129352519789499",
		["Model"] = v4:FindFirstChild("Gem Bench"),
		["Actions"] = {},
		["Tags"] = { "MISC" }
	},
	["Silver Ingot"] = {
		["Description"] = "A shiny bar of silver.",
		["Rarity"] = "Rare",
		["Icon"] = "rbxassetid://96553028511092",
		["Model"] = v4:FindFirstChild("Silver Ingot"),
		["Actions"] = {},
		["Tags"] = { "MISC" }
	},
	["Gold Ingot"] = {
		["Description"] = "A very shiny bar of gold.",
		["Rarity"] = "Legendary",
		["Icon"] = "rbxassetid://87430159003961",
		["Model"] = v4:FindFirstChild("Gold Ingot"),
		["Actions"] = {},
		["Tags"] = { "MISC" }
	},
	["Smelter"] = {
		["Description"] = "Bubbles, burns, and blazes\226\128\148this smelter turns rocky ore into shiny, shapable metal.",
		["Rarity"] = "Rare",
		["Icon"] = "rbxassetid://109370809205883",
		["Model"] = v4:FindFirstChild("Smelter"),
		["Actions"] = {},
		["Tags"] = { "MISC" }
	},
	["Forge Blower"] = {
		["Description"] = "An old-style forge blower that wheezes and whirs, breathing life into the flames.",
		["Rarity"] = "Rare",
		["Icon"] = "rbxassetid://71753838383643",
		["Model"] = v4:FindFirstChild("Forge Blower"),
		["Actions"] = {},
		["Tags"] = { "MISC" }
	},
	["Cooling Barrel"] = {
		["Description"] = "A splashy barrel where red-hot metal goes \226\128\152hisss!\226\128\153 and chills out.",
		["Rarity"] = "Rare",
		["Icon"] = "rbxassetid://102821774461827",
		["Model"] = v4:FindFirstChild("Cooling Barrel"),
		["Actions"] = {},
		["Tags"] = { "MISC" }
	},
	["Blacksmith Forge"] = {
		["Description"] = "Where metal takes a fiery bath before being hammered into greatness.",
		["Rarity"] = "Legendary",
		["Icon"] = "rbxassetid://81645215037629",
		["Model"] = v4:FindFirstChild("Blacksmith Forge"),
		["Actions"] = {},
		["Tags"] = { "MISC" }
	},
	["Bellows"] = {
		["Description"] = "A puff-powered helper that keeps the fire lively.",
		["Rarity"] = "Legendary",
		["Icon"] = "rbxassetid://89019460036468",
		["Model"] = v4:FindFirstChild("Bellows"),
		["Actions"] = {},
		["Tags"] = { "MISC" }
	},
	["Christmas Gift Small"] = {
		["Description"] = "I wonder what\'s inside? Something tiny?",
		["Rarity"] = "Uncommon",
		["Icon"] = "rbxassetid://83663076636173",
		["Model"] = v4:FindFirstChild("Christmas Gift Small"),
		["Actions"] = {},
		["Tags"] = { "MISC" }
	},
	["Christmas Gift Medium"] = {
		["Description"] = "I wonder what\'s inside? Something just right?",
		["Rarity"] = "Uncommon",
		["Icon"] = "rbxassetid://71573321333783",
		["Model"] = v4:FindFirstChild("Christmas Gift Medium"),
		["Actions"] = {},
		["Tags"] = { "MISC" }
	},
	["Christmas Gift Large"] = {
		["Description"] = "I wonder what\'s inside? Something huge?",
		["Rarity"] = "Uncommon",
		["Icon"] = "rbxassetid://103596951824599",
		["Model"] = v4:FindFirstChild("Christmas Gift Large"),
		["Actions"] = {},
		["Tags"] = { "MISC" }
	},
	["Christmas Gift Tall"] = {
		["Description"] = "I wonder what\'s inside? Something tall?",
		["Rarity"] = "Uncommon",
		["Icon"] = "rbxassetid://128072199521894",
		["Model"] = v4:FindFirstChild("Christmas Gift Tall"),
		["Actions"] = {},
		["Tags"] = { "MISC" }
	},
	["Christmas Gift Long"] = {
		["Description"] = "I wonder what\'s inside? Something long?",
		["Rarity"] = "Uncommon",
		["Icon"] = "rbxassetid://111339711670641",
		["Model"] = v4:FindFirstChild("Christmas Gift Long"),
		["Actions"] = {},
		["Tags"] = { "MISC" }
	},
	["Christmas Gift Tube"] = {
		["Description"] = "I wonder what\'s inside? Something cylindrical?",
		["Rarity"] = "Uncommon",
		["Icon"] = "rbxassetid://76106924019987",
		["Model"] = v4:FindFirstChild("Christmas Gift Tube"),
		["Actions"] = {},
		["Tags"] = { "MISC" }
	},
	["Snow Fort Wall"] = {
		["Description"] = "Perfect for keeping snowballs on *their* side.",
		["Rarity"] = "Rare",
		["Icon"] = "rbxassetid://122786444825708",
		["Model"] = v4:FindFirstChild("Snow Fort Wall"),
		["Actions"] = {},
		["Tags"] = { "MISC" }
	},
	["Snow Fort Staircase"] = {
		["Description"] = "Rise above all, one crunchy snow step at a time.",
		["Rarity"] = "Rare",
		["Icon"] = "rbxassetid://98124209949698",
		["Model"] = v4:FindFirstChild("Snow Fort Staircase"),
		["Actions"] = {},
		["Tags"] = { "MISC" }
	},
	["Snow Fort Tower"] = {
		["Description"] = "Its over snowmen, I have the high ground!",
		["Rarity"] = "Rare",
		["Icon"] = "rbxassetid://126116444637716",
		["Model"] = v4:FindFirstChild("Snow Fort Tower"),
		["Actions"] = {},
		["Tags"] = { "MISC" }
	},
	["Snow Fort Banner"] = {
		["Description"] = "Wintery fabric.",
		["Rarity"] = "Rare",
		["Icon"] = "rbxassetid://115050520456825",
		["Model"] = v4:FindFirstChild("Snow Fort Banner"),
		["Actions"] = {},
		["Tags"] = { "MISC" }
	},
	["Snow Fort Gate"] = {
		["Description"] = "Open wide the grand entrance to a frosty kingdom.",
		["Rarity"] = "Rare",
		["Icon"] = "rbxassetid://75020265466703",
		["Model"] = v4:FindFirstChild("Snow Fort Gate"),
		["Actions"] = {},
		["Tags"] = { "MISC" }
	},
	["Snow Fort Lantern"] = {
		["Description"] = "A warm glow in a cold world. Light up those late night sieges.",
		["Rarity"] = "Rare",
		["Icon"] = "rbxassetid://116202214397669",
		["Model"] = v4:FindFirstChild("Snow Fort Lantern"),
		["Actions"] = {},
		["Tags"] = { "MISC" }
	},
	["Winter Bridge"] = {
		["Description"] = "A cozy winter bridge wrapped in garlands and frost.",
		["Rarity"] = "Legendary",
		["Icon"] = "rbxassetid://130817083747877",
		["Model"] = v4:FindFirstChild("Winter Bridge"),
		["Actions"] = {},
		["Tags"] = { "MISC" }
	},
	["Frost Rune"] = {
		["Description"] = "A mysterious rune etched in ancient ice.",
		["Rarity"] = "Legendary",
		["Icon"] = "rbxassetid://84232130989736",
		["Model"] = v4:FindFirstChild("Frost Rune"),
		["Actions"] = {},
		["Tags"] = { "MISC" }
	},
	["Frozen Pond"] = {
		["Description"] = "A still pond captured in frost.",
		["Rarity"] = "Rare",
		["Icon"] = "rbxassetid://125623633434242",
		["Model"] = v4:FindFirstChild("Frozen Pond"),
		["Actions"] = {},
		["Tags"] = { "MISC" }
	},
	["Winter Arch"] = {
		["Description"] = "Walk through winter\226\128\153s welcome\226\128\148complete with bell and bow.",
		["Rarity"] = "Mythical",
		["Icon"] = "rbxassetid://104242207664536",
		["Model"] = v4:FindFirstChild("Winter Arch"),
		["Actions"] = {},
		["Tags"] = { "MISC" }
	},
	["Winter Fountain"] = {
		["Description"] = "Silent waters, sparkling frost.",
		["Rarity"] = "Legendary",
		["Icon"] = "rbxassetid://83474243882209",
		["Model"] = v4:FindFirstChild("Winter Fountain"),
		["Actions"] = {},
		["Tags"] = { "MISC" }
	},
	["Winter Globe"] = {
		["Description"] = "A tiny frozen wonderland.",
		["Rarity"] = "Mythical",
		["Icon"] = "rbxassetid://102511160943340",
		["Model"] = v4:FindFirstChild("Winter Globe"),
		["Actions"] = {},
		["Tags"] = { "MISC" }
	},
	["Winter Lantern"] = {
		["Description"] = "Soft light in a world of snow.",
		["Rarity"] = "Rare",
		["Icon"] = "rbxassetid://125345612856155",
		["Model"] = v4:FindFirstChild("Winter Lantern"),
		["Actions"] = {},
		["Tags"] = { "MISC" }
	},
	["Winter Wheelbarrow"] = {
		["Description"] = "Hauling snow and holiday cheer.",
		["Rarity"] = "Rare",
		["Icon"] = "rbxassetid://136354706459270",
		["Model"] = v4:FindFirstChild("Winter Wheelbarrow"),
		["Actions"] = {},
		["Tags"] = { "MISC" }
	},
	["Toy Horse"] = {
		["Description"] = "Trotting in festive style.",
		["Rarity"] = "Rare",
		["Icon"] = "rbxassetid://135018077483755",
		["Model"] = v4:FindFirstChild("Toy Horse"),
		["Actions"] = {},
		["Tags"] = { "MISC" }
	},
	["Ice Table"] = {
		["Description"] = "Ice cold table and chair.",
		["Rarity"] = "Rare",
		["Icon"] = "rbxassetid://121679969550679",
		["Model"] = v4:FindFirstChild("Ice Table"),
		["Actions"] = {},
		["Tags"] = { "MISC" }
	},
	["Christmas Lamp"] = {
		["Description"] = "The most festive lamp there ever was.",
		["Rarity"] = "Legendary",
		["Icon"] = "rbxassetid://84954761168545",
		["Model"] = v4:FindFirstChild("Christmas Lamp"),
		["Actions"] = {},
		["Tags"] = { "MISC" }
	},
	["Nutcracker"] = {
		["Description"] = "A wooden hero brought to life for the holidays.",
		["Rarity"] = "Legendary",
		["Icon"] = "rbxassetid://108460999021109",
		["Model"] = v4:FindFirstChild("Nutcracker"),
		["Actions"] = {},
		["Tags"] = { "MISC" }
	},
	["Christmas Bench"] = {
		["Description"] = "A merry little bench ready for holiday memories.",
		["Rarity"] = "Legendary",
		["Icon"] = "rbxassetid://89433127103432",
		["Model"] = v4:FindFirstChild("Christmas Bench"),
		["Actions"] = {},
		["Tags"] = { "MISC" }
	},
	["Penguin Statue"] = {
		["Description"] = "This little penguin may not swim, but it sure knows how to strike a pose.",
		["Rarity"] = "Legendary",
		["Icon"] = "rbxassetid://102293094118977",
		["Model"] = v4:FindFirstChild("Penguin Statue"),
		["Actions"] = {},
		["Tags"] = { "MISC" }
	},
	["Candycane Fence"] = {
		["Description"] = "A fence so sweet, you almost want to take a bite!",
		["Rarity"] = "Legendary",
		["Icon"] = "rbxassetid://133577137208326",
		["Model"] = v4:FindFirstChild("Candycane Fence"),
		["Actions"] = {},
		["Tags"] = { "MISC" }
	},
	["Christmas Tree Painting"] = {
		["Description"] = "A colorful tree captured on canvas.",
		["Rarity"] = "Rare",
		["Icon"] = "rbxassetid://109269916258884",
		["Model"] = v4:FindFirstChild("Christmas Tree Painting"),
		["Actions"] = {},
		["Tags"] = { "MISC" }
	},
	["Elf Chair"] = {
		["Description"] = "A cheerful little chair, ready for an elf to take a seat.",
		["Rarity"] = "Rare",
		["Icon"] = "rbxassetid://111334528868338",
		["Model"] = v4:FindFirstChild("Elf Chair"),
		["Actions"] = {},
		["Tags"] = { "MISC" }
	},
	["Gift Stack"] = {
		["Description"] = "Presents piled high \226\128\148 who\226\128\153s lucky enough to open them first?",
		["Rarity"] = "Rare",
		["Icon"] = "rbxassetid://92235206873270",
		["Model"] = v4:FindFirstChild("Gift Stack"),
		["Actions"] = {},
		["Tags"] = { "MISC" }
	},
	["Christmas Ribbon"] = {
		["Description"] = "A ribbon so festive, it practically jingles with Christmas spirit.",
		["Rarity"] = "Rare",
		["Icon"] = "rbxassetid://93565308522143",
		["Model"] = v4:FindFirstChild("Christmas Ribbon"),
		["Actions"] = {},
		["Tags"] = { "MISC" }
	},
	["Christmas Lights"] = {
		["Description"] = "Glowing bulbs that shimmer with holiday magic.",
		["Rarity"] = "Rare",
		["Icon"] = "rbxassetid://95522328864056",
		["Model"] = v4:FindFirstChild("Christmas Lights"),
		["Actions"] = {},
		["Tags"] = { "MISC" }
	},
	["Frozen Krampus"] = {
		["Description"] = "The fearsome Krampus, paused in icy stillness, waiting in winter\226\128\153s grip.",
		["Rarity"] = "Legendary",
		["Icon"] = "rbxassetid://122618334241261",
		["Model"] = v4:FindFirstChild("Frozen Krampus"),
		["Actions"] = {},
		["Tags"] = { "MISC" }
	},
	["Santa Chair"] = {
		["Description"] = "Santa\226\128\153s special chair, waiting for the holiday magic to begin.",
		["Rarity"] = "Rare",
		["Icon"] = "rbxassetid://138218541127571",
		["Model"] = v4:FindFirstChild("Santa Chair"),
		["Actions"] = {},
		["Tags"] = { "MISC" }
	},
	["Snowman"] = {
		["Description"] = "A friendly snowman, ready for snowball fights and winter fun.",
		["Rarity"] = "Rare",
		["Icon"] = "rbxassetid://93488154659802",
		["Model"] = v4:FindFirstChild("Snowman"),
		["Actions"] = {},
		["Tags"] = { "MISC" }
	},
	["Snowman Lights"] = {
		["Description"] = "Snowman-shaped lights that brighten up any festive scene.",
		["Rarity"] = "Rare",
		["Icon"] = "rbxassetid://139945494671286",
		["Model"] = v4:FindFirstChild("Snowman Lights"),
		["Actions"] = {},
		["Tags"] = { "MISC" }
	},
	["Hot Chocolate Mug"] = {
		["Description"] = "COSMETIC: Nothing beats a cup of hot Cocoa on a cold winter night...",
		["Rarity"] = "Rare",
		["Icon"] = "rbxassetid://81385371190734",
		["Model"] = v4:FindFirstChild("Hot Chocolate Mug"),
		["Actions"] = {},
		["Tags"] = { "MISC" }
	},
	["Snow Globe"] = {
		["Description"] = "Snowflakes trapped in a globe of magic!",
		["Rarity"] = "Mythical",
		["Icon"] = "rbxassetid://102600165060105",
		["Model"] = v4:FindFirstChild("Snow Globe"),
		["Actions"] = {},
		["Tags"] = { "MISC" }
	},
	["North Pole Sign"] = {
		["Description"] = "North Pole: Santa\226\128\153s Playground!",
		["Rarity"] = "Legendary",
		["Icon"] = "rbxassetid://136433741552918",
		["Model"] = v4:FindFirstChild("North Pole Sign"),
		["Actions"] = {},
		["Tags"] = { "MISC" }
	},
	["Christmas Drums"] = {
		["Description"] = "Drum up some holiday cheer!",
		["Rarity"] = "Legendary",
		["Icon"] = "rbxassetid://88210316515948",
		["Model"] = v4:FindFirstChild("Christmas Drums"),
		["Actions"] = {},
		["Tags"] = { "MISC" }
	},
	["Christmas Ornament"] = {
		["Description"] = "Comes in different vibrant colors to elevate your Christmas Tree!",
		["Rarity"] = "Uncommon",
		["Icon"] = "rbxassetid://98655021197453",
		["Models"] = {
			v4:FindFirstChild("Christmas Ornament Red"),
			v4:FindFirstChild("Christmas Ornament Green"),
			v4:FindFirstChild("Christmas Ornament Blue"),
			v4:FindFirstChild("Christmas Ornament Yellow")
		},
		["Actions"] = {},
		["Tags"] = { "MISC" }
	},
	["Christmas Topper"] = {
		["Description"] = "The final touch to your Christmas Tree!!",
		["Rarity"] = "Rare",
		["Icon"] = "rbxassetid://86949094785347",
		["Model"] = v4:FindFirstChild("Christmas Topper"),
		["Actions"] = {},
		["Tags"] = { "MISC" }
	},
	["Disco Ball"] = {
		["Description"] = "It\'s the new year time to party!!",
		["Rarity"] = "Rare",
		["Icon"] = "rbxassetid://119643167400356",
		["Model"] = v4:FindFirstChild("Disco Ball"),
		["Actions"] = {},
		["Tags"] = { "MISC" }
	},
	["Party Sign"] = {
		["Description"] = "Let everyone know where the party is at!",
		["Rarity"] = "Rare",
		["Icon"] = "rbxassetid://118455719780708",
		["Model"] = v4:FindFirstChild("Party Sign"),
		["Actions"] = {},
		["Tags"] = { "SIGN" }
	},
	["Firework Shooter"] = {
		["Description"] = "Insert fireworks here and launch!",
		["Rarity"] = "Rare",
		["Icon"] = "rbxassetid://118051589631565",
		["Model"] = v4:FindFirstChild("Firework Shooter"),
		["Actions"] = {},
		["Tags"] = { "MISC" }
	},
	["Confetti Cannon"] = {
		["Description"] = "Throw confetti like its the new year everyday.",
		["Rarity"] = "Rare",
		["Icon"] = "rbxassetid://126531195035317",
		["Model"] = v4:FindFirstChild("Confetti Cannon"),
		["Actions"] = {},
		["Tags"] = { "MISC" }
	},
	["Sparkler"] = {
		["Description"] = "Let the sparks fly.",
		["Rarity"] = "Rare",
		["Icon"] = "rbxassetid://97349039087490",
		["Model"] = v4:FindFirstChild("Sparkler"),
		["Actions"] = {},
		["Tags"] = { "MISC" }
	},
	["Firework Rockets"] = {
		["Description"] = "The works. The Fireworks.",
		["Rarity"] = "Rare",
		["Icon"] = "rbxassetid://89508568465290",
		["Model"] = v4:FindFirstChild("Firework Rockets"),
		["Actions"] = {},
		["Tags"] = { "MISC" }
	},
	["Party Hat"] = {
		["Description"] = "For the New Year and for your head!",
		["Rarity"] = "Rare",
		["Icon"] = "rbxassetid://118589533938333",
		["Models"] = { v4:FindFirstChild("Polka Dot Party Hat"), v4:FindFirstChild("Black Party Hat") },
		["Actions"] = {},
		["Tags"] = { "MISC" }
	},
	["Clockwork Key"] = {
		["Description"] = "What could this possibly unlock? We may never know.",
		["Rarity"] = "Rare",
		["Icon"] = "rbxassetid://75020102537955",
		["Model"] = v4:FindFirstChild("Clockwork Key"),
		["Actions"] = {},
		["Tags"] = { "MISC" }
	},
	["Chains"] = {
		["Description"] = "Chain, chain go away.",
		["Rarity"] = "Rare",
		["Icon"] = "rbxassetid://129196816165190",
		["Model"] = v4:FindFirstChild("Chains"),
		["Actions"] = {},
		["Tags"] = { "MISC" }
	},
	["Gear Wheel"] = {
		["Description"] = "A gear wheel (or just gear) is a rotating machine part with teeth (cogs) around its edge, designed to mesh with another toothed part to transmit rotational motion, power, or change speed/direction in a mechanism, with synonyms like cogwheel, toothed wheel, or pinion (for a small gear). It\'s a fundamental component in mechanics, forming gear trains when multiple gears interlock, controlling how force and speed are managed in devices from clocks to cars.",
		["Rarity"] = "Rare",
		["Icon"] = "rbxassetid://135771267664982",
		["Model"] = v4:FindFirstChild("Gear Wheel"),
		["Actions"] = {},
		["Tags"] = { "MISC" }
	},
	["Pipes"] = {
		["Description"] = "Transfer liquids between to points or drop it. It makes a funny sound!",
		["Rarity"] = "Rare",
		["Icon"] = "rbxassetid://88609712593803",
		["Model"] = v4:FindFirstChild("Pipes"),
		["Actions"] = {},
		["Tags"] = { "MISC" }
	},
	["Clockwork Lantern"] = {
		["Description"] = "Light up those intricate machineries.",
		["Rarity"] = "Rare",
		["Icon"] = "rbxassetid://106767732565639",
		["Model"] = v4:FindFirstChild("Clockwork Lantern"),
		["Actions"] = {},
		["Tags"] = { "MISC" }
	},
	["Bell Arch"] = {
		["Description"] = "A cozy arch crowned with one grand bell.",
		["Rarity"] = "Mythical",
		["Icon"] = "rbxassetid://95765932512980",
		["Model"] = v4:FindFirstChild("Bell Arch"),
		["Actions"] = {},
		["Tags"] = { "MISC" }
	},
	["Big Chair"] = {
		["Description"] = "A big, cozy chair that feels perfect for resting after a long day in the garden.",
		["Rarity"] = "Mythical",
		["Icon"] = "rbxassetid://123149649402544",
		["Model"] = v4:FindFirstChild("Big Chair"),
		["Actions"] = {},
		["Tags"] = { "MISC" }
	},
	["Chain Swing"] = {
		["Description"] = "A playful chain swing that gently sways, adding a touch of fun and charm to your garden.",
		["Rarity"] = "Mythical",
		["Icon"] = "rbxassetid://82216889205694",
		["Model"] = v4:FindFirstChild("Chain Swing"),
		["Actions"] = {},
		["Tags"] = { "MISC" }
	},
	["Dresser"] = {
		["Description"] = "Stack, stash, and style\226\128\148your outfit\226\128\153s happy place.",
		["Rarity"] = "Mythical",
		["Icon"] = "rbxassetid://121541278874931",
		["Model"] = v4:FindFirstChild("Dresser"),
		["Actions"] = {},
		["Tags"] = { "MISC" }
	},
	["Flower Bridge"] = {
		["Description"] = "A bridge that blooms as beautifully as it connects.",
		["Rarity"] = "Mythical",
		["Icon"] = "rbxassetid://84037821709636",
		["Model"] = v4:FindFirstChild("Flower Bridge"),
		["Actions"] = {},
		["Tags"] = { "MISC" }
	},
	["Flower Cart"] = {
		["Description"] = "Fresh flowers, happy vibes, zero traffic jams.",
		["Rarity"] = "Mythical",
		["Icon"] = "rbxassetid://120709604627317",
		["Model"] = v4:FindFirstChild("Flower Cart"),
		["Actions"] = {},
		["Tags"] = { "MISC" }
	},
	["Giant Scorpion Statue"] = {
		["Description"] = "Big, bold, and ready to sting your imagination.",
		["Rarity"] = "Mythical",
		["Icon"] = "rbxassetid://81049787896991",
		["Model"] = v4:FindFirstChild("Giant Scorpion Statue"),
		["Actions"] = {},
		["Tags"] = { "MISC" }
	},
	["Gramophone"] = {
		["Description"] = "Spinning tunes and old-school charm, one crackle at a time.",
		["Rarity"] = "Mythical",
		["Icon"] = "rbxassetid://112737038077633",
		["Model"] = v4:FindFirstChild("Gramophone"),
		["Actions"] = {},
		["Tags"] = { "MISC" }
	},
	["Lab Samples"] = {
		["Description"] = "Small tubes, massive potential.",
		["Rarity"] = "Mythical",
		["Icon"] = "rbxassetid://84743529605346",
		["Model"] = v4:FindFirstChild("Lab Samples"),
		["Actions"] = {},
		["Tags"] = { "MISC" }
	},
	["Medieval Table"] = {
		["Description"] = "Where knights, peasants, and snacks all feel welcome.",
		["Rarity"] = "Mythical",
		["Icon"] = "rbxassetid://85316821603093",
		["Model"] = v4:FindFirstChild("Medieval Table"),
		["Actions"] = {},
		["Tags"] = { "MISC" }
	},
	["Piano Set"] = {
		["Description"] = "A mini concert waiting to happen.",
		["Rarity"] = "Mythical",
		["Icon"] = "rbxassetid://140100425394401",
		["Model"] = v4:FindFirstChild("Piano Set"),
		["Actions"] = {},
		["Tags"] = { "MISC" }
	},
	["Power Lamp"] = {
		["Description"] = "Power on, worries off.",
		["Rarity"] = "Mythical",
		["Icon"] = "rbxassetid://71162989597476",
		["Model"] = v4:FindFirstChild("Power Lamp"),
		["Actions"] = {},
		["Tags"] = { "MISC" }
	},
	["Sandpit"] = {
		["Description"] = "Where castles rise and boredom sinks.",
		["Rarity"] = "Mythical",
		["Icon"] = "rbxassetid://128303287766722",
		["Model"] = v4:FindFirstChild("Sandpit"),
		["Actions"] = {},
		["Tags"] = { "MISC" }
	},
	["Simple Shelf"] = {
		["Description"] = "A tidy spot for your treasures and trinkets.",
		["Rarity"] = "Mythical",
		["Icon"] = "rbxassetid://87369657966088",
		["Model"] = v4:FindFirstChild("Simple Shelf"),
		["Actions"] = {},
		["Tags"] = { "MISC" }
	},
	["Steampunk Lamp"] = {
		["Description"] = "Turning heads and cranking up the charm.",
		["Rarity"] = "Mythical",
		["Icon"] = "rbxassetid://87686180805440",
		["Model"] = v4:FindFirstChild("Steampunk Lamp"),
		["Actions"] = {},
		["Tags"] = { "MISC" }
	},
	["Sword In Stone"] = {
		["Description"] = "Where heroes are made, one tug at a time.",
		["Rarity"] = "Mythical",
		["Icon"] = "rbxassetid://122152059621951",
		["Model"] = v4:FindFirstChild("Sword In Stone"),
		["Actions"] = {},
		["Tags"] = { "MISC" }
	},
	["Tarp"] = {
		["Description"] = "Simple, sturdy, and ready for anything.",
		["Rarity"] = "Mythical",
		["Icon"] = "rbxassetid://131024443587365",
		["Model"] = v4:FindFirstChild("Tarp"),
		["Actions"] = {},
		["Tags"] = { "MISC" }
	},
	["Water Tank"] = {
		["Description"] = "Your trusty reservoir for all things splashy.",
		["Rarity"] = "Mythical",
		["Icon"] = "rbxassetid://133481476446725",
		["Model"] = v4:FindFirstChild("Water Tank"),
		["Actions"] = {},
		["Tags"] = { "MISC" }
	},
	["Wooden Throne"] = {
		["Description"] = "A seat fit for legends (and long naps).",
		["Rarity"] = "Mythical",
		["Icon"] = "rbxassetid://78124872369170",
		["Model"] = v4:FindFirstChild("Wooden Throne"),
		["Actions"] = {},
		["Tags"] = { "MISC" }
	},
	["Wooden Well"] = {
		["Description"] = "A wooden well that\226\128\153s deep on character.",
		["Rarity"] = "Mythical",
		["Icon"] = "rbxassetid://84223199265594",
		["Model"] = v4:FindFirstChild("Wooden Well"),
		["Actions"] = {},
		["Tags"] = { "MISC" }
	},
	["Storage Frame"] = {
		["Description"] = "A sleek spot for all the bits and bobs you cherish.",
		["Rarity"] = "Mythical",
		["Icon"] = "rbxassetid://125538849640600",
		["Model"] = v4:FindFirstChild("Storage Frame"),
		["Actions"] = {},
		["Tags"] = { "MISC" }
	},
	["Chainsaw"] = {
		["Description"] = "Big teeth, bigger fun.",
		["Rarity"] = "Mythical",
		["Icon"] = "rbxassetid://95311524007342",
		["Model"] = v4:FindFirstChild("Chainsaw"),
		["Actions"] = {},
		["Tags"] = { "MISC" }
	},
	["Carnival Arch"] = {
		["Description"] = "Step right up! This cheerful arch marks the start of carnival magic.",
		["Rarity"] = "Mythical",
		["Icon"] = "rbxassetid://103716276123603",
		["Model"] = v4:FindFirstChild("Carnival Arch"),
		["Actions"] = {},
		["Tags"] = { "MISC" }
	},
	["Fire Ring"] = {
		["Description"] = "A fiery hoop made for carnival showstoppers.",
		["Rarity"] = "Mythical",
		["Icon"] = "rbxassetid://129168923594236",
		["Model"] = v4:FindFirstChild("Fire Ring"),
		["Actions"] = {},
		["Tags"] = { "MISC" }
	},
	["Carnival Ribbon"] = {
		["Description"] = "A colorful ribbon made for festive carnival flair.",
		["Rarity"] = "Rare",
		["Icon"] = "rbxassetid://130862824234035",
		["Model"] = v4:FindFirstChild("Carnival Ribbon"),
		["Actions"] = {},
		["Tags"] = { "MISC" }
	},
	["Carnival Flag"] = {
		["Description"] = "A festive flag for carnival fun.",
		["Rarity"] = "Rare",
		["Icon"] = "rbxassetid://104560158750928",
		["Model"] = v4:FindFirstChild("Carnival Flag"),
		["Actions"] = {},
		["Tags"] = { "MISC" }
	},
	["Magic Bunny"] = {
		["Description"] = "Surprise! A fluffy bunny hops out of this magic hat.",
		["Rarity"] = "Legendary",
		["Icon"] = "rbxassetid://71561328489060",
		["Model"] = v4:FindFirstChild("Magic Bunny"),
		["Actions"] = {},
		["Tags"] = { "MISC" }
	},
	["Unicycle"] = {
		["Description"] = "A classic carnival unicycle.",
		["Rarity"] = "Legendary",
		["Icon"] = "rbxassetid://73128977042804",
		["Model"] = v4:FindFirstChild("Unicycle"),
		["Actions"] = {},
		["Tags"] = { "MISC" }
	},
	["Valentine Arch"] = {
		["Description"] = "A cute valentine arch.",
		["Rarity"] = "Legendary",
		["Icon"] = "rbxassetid://97219704562929",
		["Model"] = v4:FindFirstChild("Valentine Arch"),
		["Actions"] = {},
		["Tags"] = { "MISC" }
	},
	["Heart Bench"] = {
		["Description"] = "A cute heart bench.",
		["Rarity"] = "Legendary",
		["Icon"] = "rbxassetid://128917754594343",
		["Model"] = v4:FindFirstChild("Heart Bench"),
		["Actions"] = {},
		["Tags"] = { "MISC" }
	},
	["L Heart Sign"] = {
		["Description"] = "A cute sign with the letter L.",
		["Rarity"] = "Legendary",
		["Icon"] = "rbxassetid://98514769555823",
		["Model"] = v4:FindFirstChild("L Heart Sign"),
		["Actions"] = {},
		["Tags"] = { "MISC" }
	},
	["O Heart Sign"] = {
		["Description"] = "A cute sign with the letter O.",
		["Rarity"] = "Legendary",
		["Icon"] = "rbxassetid://109734954051672",
		["Model"] = v4:FindFirstChild("O Heart Sign"),
		["Actions"] = {},
		["Tags"] = { "MISC" }
	},
	["V Heart Sign"] = {
		["Description"] = "A cute sign with the letter V.",
		["Rarity"] = "Legendary",
		["Icon"] = "rbxassetid://91291345238598",
		["Model"] = v4:FindFirstChild("V Heart Sign"),
		["Actions"] = {},
		["Tags"] = { "MISC" }
	},
	["E Heart Sign"] = {
		["Description"] = "A cute sign with the letter E.",
		["Rarity"] = "Legendary",
		["Icon"] = "rbxassetid://122286172972373",
		["Model"] = v4:FindFirstChild("E Heart Sign"),
		["Actions"] = {},
		["Tags"] = { "MISC" }
	},
	["Heart Arch"] = {
		["Description"] = "Beautiful heart arch.",
		["Rarity"] = "Legendary",
		["Icon"] = "rbxassetid://128917754594343",
		["Model"] = v4:FindFirstChild("Heart Arch"),
		["Actions"] = {},
		["Tags"] = { "MISC" }
	},
	["Heart String Light"] = {
		["Description"] = "A cute post with heart lights.",
		["Rarity"] = "Legendary",
		["Icon"] = "rbxassetid://126349155864878",
		["Model"] = v4:FindFirstChild("Heart String Light"),
		["Actions"] = {},
		["Tags"] = { "MISC" }
	},
	["Baby Cupid Statue"] = {
		["Description"] = "A cute baby cupid statue to display.",
		["Rarity"] = "Legendary",
		["Icon"] = "rbxassetid://109725256981468",
		["Model"] = v4:FindFirstChild("Baby Cupid Statue"),
		["Actions"] = {},
		["Tags"] = { "MISC" }
	},
	["Valentines Mailbox"] = {
		["Description"] = "Best way to get a letter from that special someone.",
		["Rarity"] = "Legendary",
		["Icon"] = "rbxassetid://130900999578592",
		["Model"] = v4:FindFirstChild("Valentines Mailbox"),
		["Actions"] = {},
		["Tags"] = { "MISC" }
	},
	["Love Walkway"] = {
		["Description"] = "A cute walkway.",
		["Rarity"] = "Legendary",
		["Icon"] = "rbxassetid://114763613429040",
		["Model"] = v4:FindFirstChild("Love Walkway"),
		["Actions"] = {},
		["Tags"] = { "MISC" }
	},
	["Red Rose Fox Statue"] = {
		["Description"] = "Displays a cute red rose fox!",
		["Rarity"] = "Legendary",
		["Icon"] = "rbxassetid://91154040471814",
		["Model"] = v4:FindFirstChild("Red Rose Fox Statue"),
		["Actions"] = {},
		["Tags"] = { "MISC" }
	},
	["Heart Bridge"] = {
		["Description"] = "A bridge with hearts on it.",
		["Rarity"] = "Legendary",
		["Icon"] = "rbxassetid://74260656011472",
		["Model"] = v4:FindFirstChild("Heart Bridge"),
		["Actions"] = {},
		["Tags"] = { "MISC" }
	},
	["Cross Heart Statue"] = {
		["Description"] = "This statue was struck by cupid.",
		["Rarity"] = "Legendary",
		["Icon"] = "rbxassetid://136252630962023",
		["Model"] = v4:FindFirstChild("Cross Heart Statue"),
		["Actions"] = {},
		["Tags"] = { "MISC" }
	},
	["Angel Arrow Statue"] = {
		["Description"] = "A cute angel with a bow.",
		["Rarity"] = "Legendary",
		["Icon"] = "rbxassetid://128337355541873",
		["Model"] = v4:FindFirstChild("Angel Arrow Statue"),
		["Actions"] = {},
		["Tags"] = { "MISC" }
	},
	["Heart Fountain"] = {
		["Description"] = "Beautiful heart shaped fountain.",
		["Rarity"] = "Legendary",
		["Icon"] = "rbxassetid://73111367882659",
		["Model"] = v4:FindFirstChild("Heart Fountain"),
		["Actions"] = {},
		["Tags"] = { "MISC" }
	},
	["Heart Stepping Stone"] = {
		["Description"] = "A pathway that is shaped like a heart.",
		["Rarity"] = "Legendary",
		["Icon"] = "rbxassetid://79739309175027",
		["Model"] = v4:FindFirstChild("Heart Stepping Stone"),
		["Actions"] = {},
		["Tags"] = { "MISC" }
	},
	["Heart Shaped Gate"] = {
		["Description"] = "A gate that is shaped like a heart with roses!",
		["Rarity"] = "Legendary",
		["Icon"] = "rbxassetid://73467197257053",
		["Model"] = v4:FindFirstChild("Heart Shaped Gate"),
		["Actions"] = {},
		["Tags"] = { "MISC" }
	},
	["Clover String Light"] = {
		["Description"] = "A string of clover shaped lights!",
		["Rarity"] = "Legendary",
		["Icon"] = "rbxassetid://110689828351845",
		["Model"] = v4:FindFirstChild("Clover String Light"),
		["Actions"] = {},
		["Tags"] = { "MISC" }
	},
	["Pot of Gold"] = {
		["Description"] = "A golden pot.. that has gold!",
		["Rarity"] = "Legendary",
		["Icon"] = "rbxassetid://123629969648843",
		["Model"] = v4:FindFirstChild("Pot of Gold"),
		["Actions"] = {},
		["Tags"] = { "MISC" }
	},
	["Clover Statue"] = {
		["Description"] = "A statue of a beautiful clover!",
		["Rarity"] = "Legendary",
		["Icon"] = "rbxassetid://98275012940649",
		["Model"] = v4:FindFirstChild("Clover Statue"),
		["Actions"] = {},
		["Tags"] = { "MISC" }
	},
	["Golden Throne"] = {
		["Description"] = "A regal seat made from pure gold. Perfect for ruling over your garden plots.",
		["Rarity"] = "Rare",
		["Icon"] = "rbxassetid://105877034009358",
		["Model"] = v4:FindFirstChild("Golden Throne"),
		["Actions"] = {},
		["Tags"] = { "MISC" }
	},
	["Picnic Table"] = {
		["Description"] = "A cozy picnic table for relaxing.",
		["Rarity"] = "Rare",
		["Icon"] = "rbxassetid://105025670459365",
		["Model"] = v4:FindFirstChild("Picnic Table"),
		["Actions"] = {},
		["Tags"] = { "MISC" }
	},
	["Garden Basin"] = {
		["Description"] = "Keep your garden plots feeling fresh.",
		["Rarity"] = "Rare",
		["Icon"] = "rbxassetid://130284931152446",
		["Model"] = v4:FindFirstChild("Garden Basin"),
		["Actions"] = {},
		["Tags"] = { "MISC" }
	},
	["Vine Bench"] = {
		["Description"] = "Leafy vine bench, perfect for resting.",
		["Rarity"] = "Legendary",
		["Icon"] = "rbxassetid://97843511506024",
		["Model"] = v4:FindFirstChild("Vine Bench"),
		["Actions"] = {},
		["Tags"] = { "MISC" }
	},
	["Garden Shade"] = {
		["Description"] = "Keeps you cool while you nurture your garden plots.",
		["Rarity"] = "Legendary",
		["Icon"] = "rbxassetid://102223718437962",
		["Model"] = v4:FindFirstChild("Garden Shade"),
		["Actions"] = {},
		["Tags"] = { "MISC" }
	},
	["Lava Arch"] = {
		["Description"] = "Fiery gateway that marks the path through molten gardens.",
		["Rarity"] = "Mythical",
		["Icon"] = "rbxassetid://84382700238502",
		["Model"] = v4:FindFirstChild("Lava Arch"),
		["Actions"] = {},
		["Tags"] = { "MISC" }
	},
	["Lava Fountain"] = {
		["Description"] = "Blazing fountain of molten lava.",
		["Rarity"] = "Mythical",
		["Icon"] = "rbxassetid://136366934293320",
		["Model"] = v4:FindFirstChild("Lava Fountain"),
		["Actions"] = {},
		["Tags"] = { "MISC" }
	},
	["Pool Table"] = {
		["Description"] = "Classic table for a friendly game, indoors or out.",
		["Rarity"] = "Rare",
		["Icon"] = "rbxassetid://99417028609088",
		["Model"] = v4:FindFirstChild("Pool Table"),
		["Actions"] = {},
		["Tags"] = { "MISC" }
	},
	["Fire Lamp"] = {
		["Description"] = "Keep your garden glowing, one flame at a time.",
		["Rarity"] = "Rare",
		["Icon"] = "rbxassetid://96181837245115",
		["Model"] = v4:FindFirstChild("Fire Lamp"),
		["Actions"] = {},
		["Tags"] = { "MISC" }
	},
	["Vials"] = {
		["Description"] = "Collect rare elixirs and enchanted brews in these delicate vials.",
		["Rarity"] = "Legendary",
		["Icon"] = "rbxassetid://128022698282843",
		["Model"] = v4:FindFirstChild("Vials"),
		["Actions"] = {},
		["Tags"] = { "MISC" }
	},
	["Cerberus Statue"] = {
		["Description"] = "A fearsome guardian with three heads, watching over your domain.",
		["Rarity"] = "Mythical",
		["Icon"] = "rbxassetid://117621526842802",
		["Model"] = v4:FindFirstChild("Cerberus Statue"),
		["Actions"] = {},
		["Tags"] = { "MISC" }
	},
	["Gear Lamp"] = {
		["Description"] = "Turning gears and glowing light combine for a steampunk touch.",
		["Rarity"] = "Legendary",
		["Icon"] = "rbxassetid://83193888394253",
		["Model"] = v4:FindFirstChild("Gear Lamp"),
		["Actions"] = {},
		["Tags"] = { "MISC" }
	},
	["Hydro Pillar"] = {
		["Description"] = "A calming cascade captured in a striking pillar.",
		["Rarity"] = "Legendary",
		["Icon"] = "rbxassetid://125512307952785",
		["Model"] = v4:FindFirstChild("Hydro Pillar"),
		["Actions"] = {},
		["Tags"] = { "MISC" }
	},
	["Ash Castle Wall"] = {
		["Description"] = "Perfect for keeping ashened cannonballs on *their* side.",
		["Rarity"] = "Rare",
		["Icon"] = "rbxassetid://71743855105491",
		["Model"] = v4:FindFirstChild("Ash Castle Wall"),
		["Actions"] = {},
		["Tags"] = { "MISC" }
	},
	["Ash Castle Staircase"] = {
		["Description"] = "Rise above all, one coarse ashened step at a time.",
		["Rarity"] = "Rare",
		["Icon"] = "rbxassetid://71531666579302",
		["Model"] = v4:FindFirstChild("Ash Castle Staircase"),
		["Actions"] = {},
		["Tags"] = { "MISC" }
	},
	["Ash Castle Tower"] = {
		["Description"] = "Its over for these ashened monstrosities, I have the high ground!",
		["Rarity"] = "Rare",
		["Icon"] = "rbxassetid://87991071493713",
		["Model"] = v4:FindFirstChild("Ash Castle Tower"),
		["Actions"] = {},
		["Tags"] = { "MISC" }
	},
	["Ash Castle Banner"] = {
		["Description"] = "Ashened fabric.",
		["Rarity"] = "Rare",
		["Icon"] = "rbxassetid://139032943559136",
		["Model"] = v4:FindFirstChild("Ash Castle Banner"),
		["Actions"] = {},
		["Tags"] = { "MISC" }
	},
	["Ash Castle Gate"] = {
		["Description"] = "Open wide the grand entrance to a ashened kingdom.",
		["Rarity"] = "Rare",
		["Icon"] = "rbxassetid://100002258431163",
		["Model"] = v4:FindFirstChild("Ash Castle Gate"),
		["Actions"] = {},
		["Tags"] = { "MISC" }
	},
	["Ash Castle Lantern"] = {
		["Description"] = "A cold glow in a warm world. Light up those late night sieges.",
		["Rarity"] = "Rare",
		["Icon"] = "rbxassetid://123402445803627",
		["Model"] = v4:FindFirstChild("Ash Castle Lantern"),
		["Actions"] = {},
		["Tags"] = { "MISC" }
	},
	["Egg Lights"] = {
		["Description"] = "Easter eggs that will light up your garden.",
		["Rarity"] = "Rare",
		["Icon"] = "rbxassetid://81879823778004",
		["Model"] = v4:FindFirstChild("Egg Lights"),
		["Actions"] = {},
		["Tags"] = { "MISC" }
	},
	["Egg Lamp"] = {
		["Description"] = "Is that an egg shaped lamp?",
		["Rarity"] = "Rare",
		["Icon"] = "rbxassetid://109953849556509",
		["Model"] = v4:FindFirstChild("Egg Lamp"),
		["Actions"] = {},
		["Tags"] = { "MISC" }
	},
	["Egg Basket"] = {
		["Description"] = "Use this to collect all your Easter eggs.",
		["Rarity"] = "Rare",
		["Icon"] = "rbxassetid://91464687991109",
		["Model"] = v4:FindFirstChild("Egg Basket"),
		["Actions"] = {},
		["Tags"] = { "MISC" }
	},
	["Easter Bunny Statue"] = {
		["Description"] = "Big Easter Bunny overlooking your garden.",
		["Rarity"] = "Mythical",
		["Icon"] = "rbxassetid://107771512352539",
		["Model"] = v4:FindFirstChild("Easter Bunny Statue"),
		["Actions"] = {},
		["Tags"] = { "MISC" }
	},
	["Carrot Chair"] = {
		["Description"] = "Cozy chair that looks like a... carrot...?",
		["Rarity"] = "Legendary",
		["Icon"] = "rbxassetid://78938790520178",
		["Model"] = v4:FindFirstChild("Carrot Chair"),
		["Actions"] = {},
		["Tags"] = { "MISC" }
	},
	["Bunny Mat"] = {
		["Description"] = "Hop into comfort on this mat!",
		["Rarity"] = "Legendary",
		["Icon"] = "rbxassetid://137147944662174",
		["Model"] = v4:FindFirstChild("Bunny Mat"),
		["Actions"] = {},
		["Tags"] = { "MISC" }
	},
	["Easter Nest"] = {
		["Description"] = "A nest that holds all your Easter eggs.",
		["Rarity"] = "Legendary",
		["Icon"] = "rbxassetid://128025957608754",
		["Model"] = v4:FindFirstChild("Easter Nest"),
		["Actions"] = {},
		["Tags"] = { "MISC" }
	},
	["Easter Sign"] = {
		["Description"] = "Easter Hunt begins!",
		["Rarity"] = "Legendary",
		["Icon"] = "rbxassetid://113597392808346",
		["Model"] = v4:FindFirstChild("Easter Sign"),
		["Actions"] = {},
		["Tags"] = { "MISC" }
	},
	["Bunny Stump"] = {
		["Description"] = "A rabbit resting on a stump.",
		["Rarity"] = "Rare",
		["Icon"] = "rbxassetid://134908608925316",
		["Model"] = v4:FindFirstChild("Bunny Stump"),
		["Actions"] = {},
		["Tags"] = { "MISC" }
	},
	["Wooden Wall With Door"] = {
		["Description"] = "A wooden wall with a door.",
		["Rarity"] = "Rare",
		["Icon"] = "rbxassetid://107378482389658",
		["Model"] = v4:FindFirstChild("Wooden Wall With Door"),
		["Actions"] = {},
		["Tags"] = { "MISC" }
	},
	["Wooden Floor"] = {
		["Description"] = "A simple wooden floor.",
		["Rarity"] = "Rare",
		["Icon"] = "rbxassetid://102852409467271",
		["Model"] = v4:FindFirstChild("Wooden Floor"),
		["Actions"] = {},
		["Tags"] = { "MISC" }
	},
	["Wooden Wall With Window"] = {
		["Description"] = "A wooden wall with a window.",
		["Rarity"] = "Rare",
		["Icon"] = "rbxassetid://99596569046069",
		["Model"] = v4:FindFirstChild("Wooden Wall With Window"),
		["Actions"] = {},
		["Tags"] = { "MISC" }
	},
	["Wooden Wall"] = {
		["Description"] = "A simple wooden wall.",
		["Rarity"] = "Rare",
		["Icon"] = "rbxassetid://72327404006878",
		["Model"] = v4:FindFirstChild("Wooden Wall"),
		["Actions"] = {},
		["Tags"] = { "MISC" }
	},
	["Wooden Corner Log"] = {
		["Description"] = "Connect your wooden walls with this log connector!",
		["Rarity"] = "Rare",
		["Icon"] = "rbxassetid://114143520834365",
		["Model"] = v4:FindFirstChild("Wooden Corner Log"),
		["Actions"] = {},
		["Tags"] = { "MISC" }
	},
	["Wooden Roof Panel"] = {
		["Description"] = "A wooden roof to take cover in.",
		["Rarity"] = "Mythical",
		["Icon"] = "rbxassetid://87427077517030",
		["Model"] = v4:FindFirstChild("Wooden Roof Panel"),
		["Actions"] = {},
		["Tags"] = { "MISC" }
	}
}
local v7 = {
	["Description"] = "This item has no description! Please write one!",
	["Rarity"] = "Common",
	["Icon"] = "rbxassetid://6937742258"
}
local v8 = v3:IsServer()
if v8 then
	v8 = v4:WaitForChild("Axe Stump")
end
v7.Model = v8
for _, _ in v6 do
	for v9, v10 in v6 do
		for v11, v12 in v7 do
			if not v10[v11] and (v11 ~= "Model" or v3:IsServer()) then
				if v11 == "Model" then
					v10.Model = v4:FindFirstChild(v9)
				else
					v10[v11] = v12
				end
			end
		end
		if v10.Models then
			for v13, v14 in v10.Models do
				if not v14 then
					warn((("[CosmeticRegistry] %* variant %* is nil or missing"):format(v9, v13)))
					v10.Models[v13] = v4:FindFirstChild(v9)
				end
			end
		else
			v10.Models = { v10.Model }
		end
		if v3:IsServer() then
			for _, v15 in v10.Models do
				if v15 then
					local v16 = v15.PrimaryPart or v15:FindFirstChild("HitBox")
					if not v16 then
						warn(v9, "variant has no PrimaryPart; generating temporary hitbox")
						v16 = v5(v15)
						v16:AddTag("CosmeticHitBox")
					end
					v15.PrimaryPart = v16
					v15.Name = v9
					v16:AddTag("CosmeticHitBox")
					v16.Anchored = true
				else
					warn((("[CosmeticRegistry] %* has nil model variant."):format(v9)))
				end
			end
		end
	end
end
return v6