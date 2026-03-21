local v1 = game:GetService("ReplicatedStorage")
local v2 = require(v1.Modules.GiveServiceCommon)
local v_u_3 = require(v1.Modules.PickRandom)
require(v1.Modules.UpdateService)
local v4 = v2.Types
local v_u_5 = {
	{
		{
			["Type"] = "GiveItem",
			["RewardType"] = "Gear",
			["Name"] = "Harvest Tool",
			["Quantity"] = 50,
			["Reward"] = v4.Gear:Use("Harvest Tool", 50),
			["Chance"] = 9
		},
		{
			["Type"] = "GiveItem",
			["RewardType"] = "Gear",
			["Name"] = "Reclaimer",
			["Quantity"] = 8,
			["Reward"] = v4.Gear:Use("Reclaimer", 8),
			["Chance"] = 8
		},
		{
			["Type"] = "GiveItem",
			["RewardType"] = "Gear",
			["Name"] = "Medium Toy",
			["Quantity"] = 3,
			["Reward"] = v4.Gear:Use("Medium Toy", 3),
			["Chance"] = 6
		},
		{
			["Type"] = "GiveItem",
			["RewardType"] = "Gear",
			["Name"] = "Medium Treat",
			["Quantity"] = 3,
			["Reward"] = v4.Gear:Use("Medium Treat", 3),
			["Chance"] = 6
		},
		{
			["Type"] = "GiveItem",
			["RewardType"] = "Seed",
			["Name"] = "Pomegranate",
			["Quantity"] = 1,
			["Reward"] = v4.Seed:Use("Pomegranate", 1),
			["Chance"] = 6.5
		},
		{
			["Type"] = "GiveItem",
			["RewardType"] = "Gear",
			["Name"] = "Large Toy",
			["Quantity"] = 1,
			["Reward"] = v4.Gear:Use("Large Toy", 1),
			["Chance"] = 5.5
		},
		{
			["Type"] = "GiveItem",
			["RewardType"] = "Crate",
			["Name"] = "Outdoors Crate",
			["Quantity"] = 1,
			["Reward"] = v4.Crate:Use("Outdoors Crate", 1),
			["Chance"] = 5
		},
		{
			["Type"] = "GiveItem",
			["RewardType"] = "Pet",
			["Name"] = "Geode Turtle",
			["Quantity"] = 1,
			["Reward"] = v4.Pet:Use("Geode Turtle"),
			["Chance"] = 4.5
		}
	},
	{
		{
			["Type"] = "GiveItem",
			["RewardType"] = "Gear",
			["Name"] = "Reclaimer",
			["Quantity"] = 8,
			["Reward"] = v4.Gear:Use("Reclaimer", 8),
			["Chance"] = 8
		},
		{
			["Type"] = "GiveItem",
			["RewardType"] = "Gear",
			["Name"] = "Medium Toy",
			["Quantity"] = 3,
			["Reward"] = v4.Gear:Use("Medium Toy", 3),
			["Chance"] = 6
		},
		{
			["Type"] = "GiveItem",
			["RewardType"] = "Gear",
			["Name"] = "Medium Treat",
			["Quantity"] = 3,
			["Reward"] = v4.Gear:Use("Medium Treat", 3),
			["Chance"] = 6
		},
		{
			["Type"] = "GiveItem",
			["RewardType"] = "Seed",
			["Name"] = "Pomegranate",
			["Quantity"] = 1,
			["Reward"] = v4.Seed:Use("Pomegranate", 1),
			["Chance"] = 6.5
		},
		{
			["Type"] = "GiveItem",
			["RewardType"] = "Gear",
			["Name"] = "Large Toy",
			["Quantity"] = 1,
			["Reward"] = v4.Gear:Use("Large Toy", 1),
			["Chance"] = 5.5
		},
		{
			["Type"] = "GiveItem",
			["RewardType"] = "Crate",
			["Name"] = "Outdoors Crate",
			["Quantity"] = 1,
			["Reward"] = v4.Crate:Use("Outdoors Crate", 1),
			["Chance"] = 5
		},
		{
			["Type"] = "GiveItem",
			["RewardType"] = "Pet",
			["Name"] = "Geode Turtle",
			["Quantity"] = 1,
			["Reward"] = v4.Pet:Use("Geode Turtle"),
			["Chance"] = 4.5
		},
		{
			["Type"] = "GiveItem",
			["RewardType"] = "Egg",
			["Name"] = "Jungle Egg",
			["Quantity"] = 1,
			["Reward"] = v4.Egg:Use("Jungle Egg", 1),
			["Chance"] = 4
		}
	},
	{
		{
			["Type"] = "GiveItem",
			["RewardType"] = "Gear",
			["Name"] = "Medium Toy",
			["Quantity"] = 3,
			["Reward"] = v4.Gear:Use("Medium Toy", 3),
			["Chance"] = 6
		},
		{
			["Type"] = "GiveItem",
			["RewardType"] = "Gear",
			["Name"] = "Medium Treat",
			["Quantity"] = 3,
			["Reward"] = v4.Gear:Use("Medium Treat", 3),
			["Chance"] = 6
		},
		{
			["Type"] = "GiveItem",
			["RewardType"] = "Seed",
			["Name"] = "Pomegranate",
			["Quantity"] = 1,
			["Reward"] = v4.Seed:Use("Pomegranate", 1),
			["Chance"] = 6.5
		},
		{
			["Type"] = "GiveItem",
			["RewardType"] = "Gear",
			["Name"] = "Large Toy",
			["Quantity"] = 1,
			["Reward"] = v4.Gear:Use("Large Toy", 1),
			["Chance"] = 5.5
		},
		{
			["Type"] = "GiveItem",
			["RewardType"] = "Crate",
			["Name"] = "Outdoors Crate",
			["Quantity"] = 1,
			["Reward"] = v4.Crate:Use("Outdoors Crate", 1),
			["Chance"] = 5
		},
		{
			["Type"] = "GiveItem",
			["RewardType"] = "Pet",
			["Name"] = "Geode Turtle",
			["Quantity"] = 1,
			["Reward"] = v4.Pet:Use("Geode Turtle"),
			["Chance"] = 4.5
		},
		{
			["Type"] = "GiveItem",
			["RewardType"] = "Egg",
			["Name"] = "Jungle Egg",
			["Quantity"] = 1,
			["Reward"] = v4.Egg:Use("Jungle Egg", 1),
			["Chance"] = 4
		},
		{
			["Type"] = "GiveItem",
			["RewardType"] = "Egg",
			["Name"] = "Gem Egg",
			["Quantity"] = 1,
			["Reward"] = v4.Egg:Use("Gem Egg", 1),
			["Chance"] = 3
		}
	},
	{
		{
			["Type"] = "GiveItem",
			["RewardType"] = "Seed",
			["Name"] = "Pomegranate",
			["Quantity"] = 1,
			["Reward"] = v4.Seed:Use("Pomegranate", 1),
			["Chance"] = 6.5
		},
		{
			["Type"] = "GiveItem",
			["RewardType"] = "Gear",
			["Name"] = "Large Toy",
			["Quantity"] = 1,
			["Reward"] = v4.Gear:Use("Large Toy", 1),
			["Chance"] = 5.5
		},
		{
			["Type"] = "GiveItem",
			["RewardType"] = "Crate",
			["Name"] = "Outdoors Crate",
			["Quantity"] = 1,
			["Reward"] = v4.Crate:Use("Outdoors Crate", 1),
			["Chance"] = 5
		},
		{
			["Type"] = "GiveItem",
			["RewardType"] = "Pet",
			["Name"] = "Geode Turtle",
			["Quantity"] = 1,
			["Reward"] = v4.Pet:Use("Geode Turtle"),
			["Chance"] = 4.5
		},
		{
			["Type"] = "GiveItem",
			["RewardType"] = "Egg",
			["Name"] = "Jungle Egg",
			["Quantity"] = 1,
			["Reward"] = v4.Egg:Use("Jungle Egg", 1),
			["Chance"] = 4
		},
		{
			["Type"] = "GiveItem",
			["RewardType"] = "Egg",
			["Name"] = "Gem Egg",
			["Quantity"] = 1,
			["Reward"] = v4.Egg:Use("Gem Egg", 1),
			["Chance"] = 3
		},
		{
			["Type"] = "GiveItem",
			["RewardType"] = "Gear",
			["Name"] = "Levelup Lollipop",
			["Quantity"] = 1,
			["Reward"] = v4.Gear:Use("Levelup Lollipop", 1),
			["Chance"] = 3
		},
		{
			["Type"] = "GiveItem",
			["RewardType"] = "Seed Pack",
			["Name"] = "Gem Chest",
			["Quantity"] = 1,
			["Reward"] = v4.SeedPack:Use("Gem Chest", 1),
			["Chance"] = 2
		}
	},
	{
		{
			["Type"] = "GiveItem",
			["RewardType"] = "Gear",
			["Name"] = "Large Toy",
			["Quantity"] = 1,
			["Reward"] = v4.Gear:Use("Large Toy", 1),
			["Chance"] = 5.5
		},
		{
			["Type"] = "GiveItem",
			["RewardType"] = "Crate",
			["Name"] = "Outdoors Crate",
			["Quantity"] = 1,
			["Reward"] = v4.Crate:Use("Outdoors Crate", 1),
			["Chance"] = 5
		},
		{
			["Type"] = "GiveItem",
			["RewardType"] = "Pet",
			["Name"] = "Geode Turtle",
			["Quantity"] = 1,
			["Reward"] = v4.Pet:Use("Geode Turtle"),
			["Chance"] = 4.5
		},
		{
			["Type"] = "GiveItem",
			["RewardType"] = "Egg",
			["Name"] = "Jungle Egg",
			["Quantity"] = 1,
			["Reward"] = v4.Egg:Use("Jungle Egg", 1),
			["Chance"] = 4
		},
		{
			["Type"] = "GiveItem",
			["RewardType"] = "Egg",
			["Name"] = "Gem Egg",
			["Quantity"] = 1,
			["Reward"] = v4.Egg:Use("Gem Egg", 1),
			["Chance"] = 3
		},
		{
			["Type"] = "GiveItem",
			["RewardType"] = "Gear",
			["Name"] = "Levelup Lollipop",
			["Quantity"] = 1,
			["Reward"] = v4.Gear:Use("Levelup Lollipop", 1),
			["Chance"] = 3
		},
		{
			["Type"] = "GiveItem",
			["RewardType"] = "Seed Pack",
			["Name"] = "Gem Chest",
			["Quantity"] = 1,
			["Reward"] = v4.SeedPack:Use("Gem Chest", 1),
			["Chance"] = 2
		},
		{
			["Type"] = "GiveItem",
			["RewardType"] = "Gear",
			["Name"] = "Grandmaster Sprinkler",
			["Quantity"] = 1,
			["Reward"] = v4.Gear:Use("Grandmaster Sprinkler", 1),
			["Chance"] = 1.5
		}
	},
	{
		{
			["Type"] = "GiveItem",
			["RewardType"] = "Crate",
			["Name"] = "Outdoors Crate",
			["Quantity"] = 1,
			["Reward"] = v4.Crate:Use("Outdoors Crate", 1),
			["Chance"] = 5
		},
		{
			["Type"] = "GiveItem",
			["RewardType"] = "Pet",
			["Name"] = "Geode Turtle",
			["Quantity"] = 1,
			["Reward"] = v4.Pet:Use("Geode Turtle"),
			["Chance"] = 4.5
		},
		{
			["Type"] = "GiveItem",
			["RewardType"] = "Egg",
			["Name"] = "Jungle Egg",
			["Quantity"] = 1,
			["Reward"] = v4.Egg:Use("Jungle Egg", 1),
			["Chance"] = 4
		},
		{
			["Type"] = "GiveItem",
			["RewardType"] = "Egg",
			["Name"] = "Gem Egg",
			["Quantity"] = 1,
			["Reward"] = v4.Egg:Use("Gem Egg", 1),
			["Chance"] = 3
		},
		{
			["Type"] = "GiveItem",
			["RewardType"] = "Gear",
			["Name"] = "Levelup Lollipop",
			["Quantity"] = 1,
			["Reward"] = v4.Gear:Use("Levelup Lollipop", 1),
			["Chance"] = 3
		},
		{
			["Type"] = "GiveItem",
			["RewardType"] = "Seed Pack",
			["Name"] = "Gem Chest",
			["Quantity"] = 1,
			["Reward"] = v4.SeedPack:Use("Gem Chest", 1),
			["Chance"] = 2
		},
		{
			["Type"] = "GiveItem",
			["RewardType"] = "Gear",
			["Name"] = "Grandmaster Sprinkler",
			["Quantity"] = 1,
			["Reward"] = v4.Gear:Use("Grandmaster Sprinkler", 1),
			["Chance"] = 1.5
		},
		{
			["Type"] = "GiveItem",
			["RewardType"] = "Seed",
			["Name"] = "Wild Pineapple",
			["Quantity"] = 1,
			["Reward"] = v4.Seed:Use("Wild Pineapple", 1),
			["Chance"] = 1
		}
	},
	{
		{
			["Type"] = "GiveItem",
			["RewardType"] = "Pet",
			["Name"] = "Geode Turtle",
			["Quantity"] = 1,
			["Reward"] = v4.Pet:Use("Geode Turtle"),
			["Chance"] = 4.5
		},
		{
			["Type"] = "GiveItem",
			["RewardType"] = "Egg",
			["Name"] = "Jungle Egg",
			["Quantity"] = 1,
			["Reward"] = v4.Egg:Use("Jungle Egg", 1),
			["Chance"] = 4
		},
		{
			["Type"] = "GiveItem",
			["RewardType"] = "Egg",
			["Name"] = "Gem Egg",
			["Quantity"] = 1,
			["Reward"] = v4.Egg:Use("Gem Egg", 1),
			["Chance"] = 3
		},
		{
			["Type"] = "GiveItem",
			["RewardType"] = "Gear",
			["Name"] = "Levelup Lollipop",
			["Quantity"] = 1,
			["Reward"] = v4.Gear:Use("Levelup Lollipop", 1),
			["Chance"] = 3
		},
		{
			["Type"] = "GiveItem",
			["RewardType"] = "Seed Pack",
			["Name"] = "Gem Chest",
			["Quantity"] = 1,
			["Reward"] = v4.SeedPack:Use("Gem Chest", 1),
			["Chance"] = 2
		},
		{
			["Type"] = "GiveItem",
			["RewardType"] = "Gear",
			["Name"] = "Grandmaster Sprinkler",
			["Quantity"] = 1,
			["Reward"] = v4.Gear:Use("Grandmaster Sprinkler", 1),
			["Chance"] = 1.5
		},
		{
			["Type"] = "GiveItem",
			["RewardType"] = "Seed",
			["Name"] = "Wild Pineapple",
			["Quantity"] = 1,
			["Reward"] = v4.Seed:Use("Wild Pineapple", 1),
			["Chance"] = 1
		},
		{
			["Type"] = "GiveItem",
			["RewardType"] = "Gear",
			["Name"] = "Silver Lollipop",
			["Quantity"] = 1,
			["Reward"] = v4.Gear:Use("Silver Lollipop", 1),
			["Chance"] = 0.25
		}
	},
	{
		{
			["Type"] = "GiveItem",
			["RewardType"] = "Egg",
			["Name"] = "Jungle Egg",
			["Quantity"] = 1,
			["Reward"] = v4.Egg:Use("Jungle Egg", 1),
			["Chance"] = 4
		},
		{
			["Type"] = "GiveItem",
			["RewardType"] = "Egg",
			["Name"] = "Gem Egg",
			["Quantity"] = 1,
			["Reward"] = v4.Egg:Use("Gem Egg", 1),
			["Chance"] = 3
		},
		{
			["Type"] = "GiveItem",
			["RewardType"] = "Gear",
			["Name"] = "Levelup Lollipop",
			["Quantity"] = 1,
			["Reward"] = v4.Gear:Use("Levelup Lollipop", 1),
			["Chance"] = 3
		},
		{
			["Type"] = "GiveItem",
			["RewardType"] = "Seed Pack",
			["Name"] = "Gem Chest",
			["Quantity"] = 1,
			["Reward"] = v4.SeedPack:Use("Gem Chest", 1),
			["Chance"] = 2
		},
		{
			["Type"] = "GiveItem",
			["RewardType"] = "Gear",
			["Name"] = "Grandmaster Sprinkler",
			["Quantity"] = 1,
			["Reward"] = v4.Gear:Use("Grandmaster Sprinkler", 1),
			["Chance"] = 1.5
		},
		{
			["Type"] = "GiveItem",
			["RewardType"] = "Seed",
			["Name"] = "Wild Pineapple",
			["Quantity"] = 1,
			["Reward"] = v4.Seed:Use("Wild Pineapple", 1),
			["Chance"] = 1
		},
		{
			["Type"] = "GiveItem",
			["RewardType"] = "Gear",
			["Name"] = "Silver Lollipop",
			["Quantity"] = 1,
			["Reward"] = v4.Gear:Use("Silver Lollipop", 1),
			["Chance"] = 0.25
		},
		{
			["Type"] = "GiveItem",
			["RewardType"] = "Pet",
			["Name"] = "Pack Mule",
			["Quantity"] = 1,
			["Reward"] = v4.Pet:Use("Pack Mule"),
			["Chance"] = 0.25
		}
	},
	{
		{
			["Type"] = "GiveItem",
			["RewardType"] = "Egg",
			["Name"] = "Gem Egg",
			["Quantity"] = 1,
			["Reward"] = v4.Egg:Use("Gem Egg", 1),
			["Chance"] = 3.5
		},
		{
			["Type"] = "GiveItem",
			["RewardType"] = "Gear",
			["Name"] = "Levelup Lollipop",
			["Quantity"] = 1,
			["Reward"] = v4.Gear:Use("Levelup Lollipop", 1),
			["Chance"] = 3
		},
		{
			["Type"] = "GiveItem",
			["RewardType"] = "Seed Pack",
			["Name"] = "Gem Chest",
			["Quantity"] = 1,
			["Reward"] = v4.SeedPack:Use("Gem Chest", 1),
			["Chance"] = 3
		},
		{
			["Type"] = "GiveItem",
			["RewardType"] = "Gear",
			["Name"] = "Grandmaster Sprinkler",
			["Quantity"] = 1,
			["Reward"] = v4.Gear:Use("Grandmaster Sprinkler", 1),
			["Chance"] = 2
		},
		{
			["Type"] = "GiveItem",
			["RewardType"] = "Seed",
			["Name"] = "Wild Pineapple",
			["Quantity"] = 1,
			["Reward"] = v4.Seed:Use("Wild Pineapple", 1),
			["Chance"] = 1.5
		},
		{
			["Type"] = "GiveItem",
			["RewardType"] = "Gear",
			["Name"] = "Silver Lollipop",
			["Quantity"] = 1,
			["Reward"] = v4.Gear:Use("Silver Lollipop", 1),
			["Chance"] = 1
		},
		{
			["Type"] = "GiveItem",
			["RewardType"] = "Pet",
			["Name"] = "Pack Mule",
			["Quantity"] = 1,
			["Reward"] = v4.Pet:Use("Pack Mule"),
			["Chance"] = 0.25
		},
		{
			["Type"] = "GiveItem",
			["RewardType"] = "Gear",
			["Name"] = "Large Toy",
			["Quantity"] = 3,
			["Reward"] = v4.Gear:Use("Large Toy", 3),
			["Chance"] = 0.25
		}
	},
	{
		{
			["Type"] = "GiveItem",
			["RewardType"] = "Gear",
			["Name"] = "Levelup Lollipop",
			["Quantity"] = 1,
			["Reward"] = v4.Gear:Use("Levelup Lollipop", 1),
			["Chance"] = 3.5
		},
		{
			["Type"] = "GiveItem",
			["RewardType"] = "Seed Pack",
			["Name"] = "Gem Chest",
			["Quantity"] = 1,
			["Reward"] = v4.SeedPack:Use("Gem Chest", 1),
			["Chance"] = 3
		},
		{
			["Type"] = "GiveItem",
			["RewardType"] = "Gear",
			["Name"] = "Grandmaster Sprinkler",
			["Quantity"] = 1,
			["Reward"] = v4.Gear:Use("Grandmaster Sprinkler", 1),
			["Chance"] = 3
		},
		{
			["Type"] = "GiveItem",
			["RewardType"] = "Seed",
			["Name"] = "Wild Pineapple",
			["Quantity"] = 1,
			["Reward"] = v4.Seed:Use("Wild Pineapple", 1),
			["Chance"] = 2
		},
		{
			["Type"] = "GiveItem",
			["RewardType"] = "Gear",
			["Name"] = "Silver Lollipop",
			["Quantity"] = 1,
			["Reward"] = v4.Gear:Use("Silver Lollipop", 1),
			["Chance"] = 1.5
		},
		{
			["Type"] = "GiveItem",
			["RewardType"] = "Pet",
			["Name"] = "Pack Mule",
			["Quantity"] = 1,
			["Reward"] = v4.Pet:Use("Pack Mule"),
			["Chance"] = 1
		},
		{
			["Type"] = "GiveItem",
			["RewardType"] = "Gear",
			["Name"] = "Large Toy",
			["Quantity"] = 3,
			["Reward"] = v4.Gear:Use("Large Toy", 3),
			["Chance"] = 0.25
		},
		{
			["Type"] = "GiveItem",
			["RewardType"] = "Crate",
			["Name"] = "Outdoors Crate",
			["Quantity"] = 3,
			["Reward"] = v4.Crate:Use("Outdoors Crate", 3),
			["Chance"] = 0.25
		}
	},
	{
		{
			["Type"] = "GiveItem",
			["RewardType"] = "Seed Pack",
			["Name"] = "Gem Chest",
			["Quantity"] = 1,
			["Reward"] = v4.SeedPack:Use("Gem Chest", 1),
			["Chance"] = 3.5
		},
		{
			["Type"] = "GiveItem",
			["RewardType"] = "Gear",
			["Name"] = "Grandmaster Sprinkler",
			["Quantity"] = 1,
			["Reward"] = v4.Gear:Use("Grandmaster Sprinkler", 1),
			["Chance"] = 3
		},
		{
			["Type"] = "GiveItem",
			["RewardType"] = "Seed",
			["Name"] = "Wild Pineapple",
			["Quantity"] = 1,
			["Reward"] = v4.Seed:Use("Wild Pineapple", 1),
			["Chance"] = 3
		},
		{
			["Type"] = "GiveItem",
			["RewardType"] = "Gear",
			["Name"] = "Silver Lollipop",
			["Quantity"] = 1,
			["Reward"] = v4.Gear:Use("Silver Lollipop", 1),
			["Chance"] = 2
		},
		{
			["Type"] = "GiveItem",
			["RewardType"] = "Pet",
			["Name"] = "Pack Mule",
			["Quantity"] = 1,
			["Reward"] = v4.Pet:Use("Pack Mule"),
			["Chance"] = 1.5
		},
		{
			["Type"] = "GiveItem",
			["RewardType"] = "Gear",
			["Name"] = "Large Toy",
			["Quantity"] = 3,
			["Reward"] = v4.Gear:Use("Large Toy", 3),
			["Chance"] = 1
		},
		{
			["Type"] = "GiveItem",
			["RewardType"] = "Crate",
			["Name"] = "Outdoors Crate",
			["Quantity"] = 3,
			["Reward"] = v4.Crate:Use("Outdoors Crate", 3),
			["Chance"] = 1
		},
		{
			["Type"] = "GiveItem",
			["RewardType"] = "Egg",
			["Name"] = "Gem Egg",
			["Quantity"] = 3,
			["Reward"] = v4.Egg:Use("Gem Egg", 3),
			["Chance"] = 0.5
		}
	},
	{
		{
			["Type"] = "GiveItem",
			["RewardType"] = "Seed Pack",
			["Name"] = "Gem Chest",
			["Quantity"] = 1,
			["Reward"] = v4.SeedPack:Use("Gem Chest", 1),
			["Chance"] = 3.5
		},
		{
			["Type"] = "GiveItem",
			["RewardType"] = "Seed",
			["Name"] = "Wild Pineapple",
			["Quantity"] = 1,
			["Reward"] = v4.Seed:Use("Wild Pineapple", 1),
			["Chance"] = 3
		},
		{
			["Type"] = "GiveItem",
			["RewardType"] = "Gear",
			["Name"] = "Silver Lollipop",
			["Quantity"] = 1,
			["Reward"] = v4.Gear:Use("Silver Lollipop", 1),
			["Chance"] = 3
		},
		{
			["Type"] = "GiveItem",
			["RewardType"] = "Pet",
			["Name"] = "Pack Mule",
			["Quantity"] = 1,
			["Reward"] = v4.Pet:Use("Pack Mule"),
			["Chance"] = 2
		},
		{
			["Type"] = "GiveItem",
			["RewardType"] = "Gear",
			["Name"] = "Large Toy",
			["Quantity"] = 3,
			["Reward"] = v4.Gear:Use("Large Toy", 3),
			["Chance"] = 1.5
		},
		{
			["Type"] = "GiveItem",
			["RewardType"] = "Crate",
			["Name"] = "Outdoors Crate",
			["Quantity"] = 3,
			["Reward"] = v4.Crate:Use("Outdoors Crate", 3),
			["Chance"] = 1
		},
		{
			["Type"] = "GiveItem",
			["RewardType"] = "Egg",
			["Name"] = "Gem Egg",
			["Quantity"] = 3,
			["Reward"] = v4.Egg:Use("Gem Egg", 3),
			["Chance"] = 0.5
		},
		{
			["Type"] = "GiveItem",
			["RewardType"] = "Seed Pack",
			["Name"] = "Gem Chest",
			["Quantity"] = 3,
			["Reward"] = v4.SeedPack:Use("Gem Chest", 3),
			["Chance"] = 0.5
		}
	}
}
local v_u_6 = {
	[17] = {
		{
			["Type"] = "GiveItem",
			["RewardType"] = "Seed Pack",
			["Name"] = "Gem Chest",
			["Quantity"] = 1,
			["Reward"] = v4.SeedPack:Use("Gem Chest", 1),
			["Chance"] = 3
		},
		{
			["Type"] = "GiveItem",
			["RewardType"] = "Egg",
			["Name"] = "Gem Egg",
			["Quantity"] = 1,
			["Reward"] = v4.Egg:Use("Gem Egg", 1),
			["Chance"] = 3
		},
		{
			["Type"] = "GiveItem",
			["RewardType"] = "Gear",
			["Name"] = "Silver Lollipop",
			["Quantity"] = 1,
			["Reward"] = v4.Gear:Use("Silver Lollipop", 1),
			["Chance"] = 2.9
		},
		{
			["Type"] = "GiveItem",
			["RewardType"] = "Seed",
			["Name"] = "Wild Pineapple",
			["Quantity"] = 1,
			["Reward"] = v4.Seed:Use("Wild Pineapple", 1),
			["Chance"] = 2.9
		},
		{
			["Type"] = "GiveItem",
			["RewardType"] = "Pet",
			["Name"] = "Pack Mule",
			["Quantity"] = 1,
			["Reward"] = v4.Pet:Use("Pack Mule"),
			["Chance"] = 2
		},
		{
			["Type"] = "GiveItem",
			["RewardType"] = "Egg",
			["Name"] = "Gem Egg",
			["Quantity"] = 3,
			["Reward"] = v4.Egg:Use("Gem Egg", 3),
			["Chance"] = 1
		},
		{
			["Type"] = "GiveItem",
			["RewardType"] = "Seed Pack",
			["Name"] = "Gem Chest",
			["Quantity"] = 3,
			["Reward"] = v4.SeedPack:Use("Gem Chest", 3),
			["Chance"] = 1
		},
		{
			["Type"] = "GiveItem",
			["RewardType"] = "Seed",
			["Name"] = "Coinfruit",
			["Quantity"] = 1,
			["Reward"] = v4.Seed:Use("Coinfruit", 1),
			["Chance"] = 0.5
		},
		{
			["Type"] = "GiveItem",
			["RewardType"] = "Pet",
			["Name"] = "Sheckling",
			["Quantity"] = 1,
			["Reward"] = v4.Pet:Use("Sheckling"),
			["Chance"] = 0.5
		}
	},
	[25] = {
		{
			["Type"] = "GiveItem",
			["RewardType"] = "Seed Pack",
			["Name"] = "Gem Chest",
			["Quantity"] = 2,
			["Reward"] = v4.SeedPack:Use("Gem Chest", 2),
			["Chance"] = 3
		},
		{
			["Type"] = "GiveItem",
			["RewardType"] = "Egg",
			["Name"] = "Gem Egg",
			["Quantity"] = 2,
			["Reward"] = v4.Egg:Use("Gem Egg", 2),
			["Chance"] = 3
		},
		{
			["Type"] = "GiveItem",
			["RewardType"] = "Gear",
			["Name"] = "Silver Lollipop",
			["Quantity"] = 1,
			["Reward"] = v4.Gear:Use("Silver Lollipop", 1),
			["Chance"] = 2.9
		},
		{
			["Type"] = "GiveItem",
			["RewardType"] = "Egg",
			["Name"] = "Gem Egg",
			["Quantity"] = 3,
			["Reward"] = v4.Egg:Use("Gem Egg", 3),
			["Chance"] = 1.5
		},
		{
			["Type"] = "GiveItem",
			["RewardType"] = "Seed Pack",
			["Name"] = "Gem Chest",
			["Quantity"] = 3,
			["Reward"] = v4.SeedPack:Use("Gem Chest", 3),
			["Chance"] = 1.5
		},
		{
			["Type"] = "GiveItem",
			["RewardType"] = "Pet",
			["Name"] = "Sheckling",
			["Quantity"] = 1,
			["Reward"] = v4.Pet:Use("Sheckling"),
			["Chance"] = 1
		},
		{
			["Type"] = "GiveItem",
			["RewardType"] = "Seed",
			["Name"] = "Coinfruit",
			["Quantity"] = 1,
			["Reward"] = v4.Seed:Use("Coinfruit", 1),
			["Chance"] = 1
		},
		{
			["Type"] = "GiveItem",
			["RewardType"] = "Pet",
			["Name"] = "Messenger Pigeon",
			["Quantity"] = 1,
			["Reward"] = v4.Pet:Use("Messenger Pigeon"),
			["Chance"] = 0.5
		},
		{
			["Type"] = "GiveItem",
			["RewardType"] = "Seed",
			["Name"] = "Sherrybloom",
			["Quantity"] = 1,
			["Reward"] = v4.Seed:Use("Sherrybloom", 1),
			["Chance"] = 0.5
		}
	},
	[35] = {
		{
			["Type"] = "GiveItem",
			["RewardType"] = "Egg",
			["Name"] = "Gem Egg",
			["Quantity"] = 3,
			["Reward"] = v4.Egg:Use("Gem Egg", 3),
			["Chance"] = 3
		},
		{
			["Type"] = "GiveItem",
			["RewardType"] = "Seed Pack",
			["Name"] = "Gem Chest",
			["Quantity"] = 3,
			["Reward"] = v4.SeedPack:Use("Gem Chest", 3),
			["Chance"] = 3
		},
		{
			["Type"] = "GiveItem",
			["RewardType"] = "Gear",
			["Name"] = "Silver Lollipop",
			["Quantity"] = 1,
			["Reward"] = v4.Gear:Use("Silver Lollipop", 1),
			["Chance"] = 2.9
		},
		{
			["Type"] = "GiveItem",
			["RewardType"] = "Pet",
			["Name"] = "Sheckling",
			["Quantity"] = 1,
			["Reward"] = v4.Pet:Use("Sheckling"),
			["Chance"] = 2
		},
		{
			["Type"] = "GiveItem",
			["RewardType"] = "Seed",
			["Name"] = "Coinfruit",
			["Quantity"] = 1,
			["Reward"] = v4.Seed:Use("Coinfruit", 1),
			["Chance"] = 2
		},
		{
			["Type"] = "GiveItem",
			["RewardType"] = "Pet",
			["Name"] = "Messenger Pigeon",
			["Quantity"] = 1,
			["Reward"] = v4.Pet:Use("Messenger Pigeon"),
			["Chance"] = 1
		},
		{
			["Type"] = "GiveItem",
			["RewardType"] = "Seed",
			["Name"] = "Sherrybloom",
			["Quantity"] = 1,
			["Reward"] = v4.Seed:Use("Sherrybloom", 1),
			["Chance"] = 1
		},
		{
			["Type"] = "GiveItem",
			["RewardType"] = "Pet",
			["Name"] = "Camel",
			["Quantity"] = 1,
			["Reward"] = v4.Pet:Use("Camel"),
			["Chance"] = 0.5
		},
		{
			["Type"] = "GiveItem",
			["RewardType"] = "Seed",
			["Name"] = "Pinkside Dandelion",
			["Quantity"] = 1,
			["Reward"] = v4.Seed:Use("Pinkside Dandelion", 1),
			["Chance"] = 0.5
		}
	},
	[50] = {
		{
			["Type"] = "GiveItem",
			["RewardType"] = "Egg",
			["Name"] = "Gem Egg",
			["Quantity"] = 3,
			["Reward"] = v4.Egg:Use("Gem Egg", 3),
			["Chance"] = 4
		},
		{
			["Type"] = "GiveItem",
			["RewardType"] = "Seed Pack",
			["Name"] = "Gem Chest",
			["Quantity"] = 3,
			["Reward"] = v4.SeedPack:Use("Gem Chest", 3),
			["Chance"] = 4
		},
		{
			["Type"] = "GiveItem",
			["RewardType"] = "Gear",
			["Name"] = "Silver Lollipop",
			["Quantity"] = 1,
			["Reward"] = v4.Gear:Use("Silver Lollipop", 1),
			["Chance"] = 2.5
		},
		{
			["Type"] = "GiveItem",
			["RewardType"] = "Pet",
			["Name"] = "Messenger Pigeon",
			["Quantity"] = 1,
			["Reward"] = v4.Pet:Use("Messenger Pigeon"),
			["Chance"] = 2
		},
		{
			["Type"] = "GiveItem",
			["RewardType"] = "Seed",
			["Name"] = "Sherrybloom",
			["Quantity"] = 1,
			["Reward"] = v4.Seed:Use("Sherrybloom", 1),
			["Chance"] = 2
		},
		{
			["Type"] = "GiveItem",
			["RewardType"] = "Pet",
			["Name"] = "Camel",
			["Quantity"] = 1,
			["Reward"] = v4.Pet:Use("Camel"),
			["Chance"] = 1
		},
		{
			["Type"] = "GiveItem",
			["RewardType"] = "Seed",
			["Name"] = "Pinkside Dandelion",
			["Quantity"] = 1,
			["Reward"] = v4.Seed:Use("Pinkside Dandelion", 1),
			["Chance"] = 1
		},
		{
			["Type"] = "GiveItem",
			["RewardType"] = "Gear",
			["Name"] = "Booth Sign",
			["Quantity"] = 1,
			["Reward"] = v4.Gear:Use("Booth Sign", 1),
			["Chance"] = 1
		},
		{
			["Type"] = "GiveItem",
			["RewardType"] = "Gear",
			["Name"] = "Gold Lollipop",
			["Quantity"] = 1,
			["Reward"] = v4.Gear:Use("Gold Lollipop", 1),
			["Chance"] = 0.25
		}
	}
}
local v_u_7 = {
	[1] = {
		{
			["Type"] = "GiveItem",
			["RewardType"] = "Seed",
			["Name"] = "Coinfruit",
			["Quantity"] = 1,
			["Reward"] = v4.Seed:Use("Coinfruit", 1),
			["Chance"] = 8
		},
		{
			["Type"] = "GiveItem",
			["RewardType"] = "Pet",
			["Name"] = "Sheckling",
			["Quantity"] = 1,
			["Reward"] = v4.Pet:Use("Sheckling"),
			["Chance"] = 8
		}
	},
	[3] = {
		{
			["Type"] = "GiveItem",
			["RewardType"] = "Seed",
			["Name"] = "Coinfruit",
			["Quantity"] = 1,
			["Reward"] = v4.Seed:Use("Coinfruit", 1),
			["Chance"] = 8
		},
		{
			["Type"] = "GiveItem",
			["RewardType"] = "Pet",
			["Name"] = "Sheckling",
			["Quantity"] = 1,
			["Reward"] = v4.Pet:Use("Sheckling"),
			["Chance"] = 8
		},
		{
			["Type"] = "GiveItem",
			["RewardType"] = "Seed Pack",
			["Name"] = "Gem Chest",
			["Quantity"] = 1,
			["Reward"] = v4.SeedPack:Use("Gem Chest", 1),
			["Chance"] = 1
		},
		{
			["Type"] = "GiveItem",
			["RewardType"] = "Egg",
			["Name"] = "Gem Egg",
			["Quantity"] = 1,
			["Reward"] = v4.Egg:Use("Gem Egg", 1),
			["Chance"] = 1
		}
	},
	[5] = {
		{
			["Type"] = "GiveItem",
			["RewardType"] = "Seed",
			["Name"] = "Coinfruit",
			["Quantity"] = 1,
			["Reward"] = v4.Seed:Use("Coinfruit", 1),
			["Chance"] = 8
		},
		{
			["Type"] = "GiveItem",
			["RewardType"] = "Pet",
			["Name"] = "Sheckling",
			["Quantity"] = 1,
			["Reward"] = v4.Pet:Use("Sheckling"),
			["Chance"] = 8
		},
		{
			["Type"] = "GiveItem",
			["RewardType"] = "Seed Pack",
			["Name"] = "Gem Chest",
			["Quantity"] = 1,
			["Reward"] = v4.SeedPack:Use("Gem Chest", 1),
			["Chance"] = 2
		},
		{
			["Type"] = "GiveItem",
			["RewardType"] = "Egg",
			["Name"] = "Gem Egg",
			["Quantity"] = 1,
			["Reward"] = v4.Egg:Use("Gem Egg", 1),
			["Chance"] = 2
		},
		{
			["Type"] = "GiveItem",
			["RewardType"] = "Pet",
			["Name"] = "Messenger Pigeon",
			["Quantity"] = 1,
			["Reward"] = v4.Pet:Use("Messenger Pigeon"),
			["Chance"] = 1
		}
	},
	[7] = {
		{
			["Type"] = "GiveItem",
			["RewardType"] = "Seed",
			["Name"] = "Coinfruit",
			["Quantity"] = 2,
			["Reward"] = v4.Seed:Use("Coinfruit", 2),
			["Chance"] = 8
		},
		{
			["Type"] = "GiveItem",
			["RewardType"] = "Pet",
			["Name"] = "Sheckling",
			["Quantity"] = 1,
			["Reward"] = v4.Pet:Use("Sheckling"),
			["Chance"] = 8
		},
		{
			["Type"] = "GiveItem",
			["RewardType"] = "Seed Pack",
			["Name"] = "Gem Chest",
			["Quantity"] = 1,
			["Reward"] = v4.SeedPack:Use("Gem Chest", 1),
			["Chance"] = 3
		},
		{
			["Type"] = "GiveItem",
			["RewardType"] = "Egg",
			["Name"] = "Gem Egg",
			["Quantity"] = 1,
			["Reward"] = v4.Egg:Use("Gem Egg", 1),
			["Chance"] = 3
		},
		{
			["Type"] = "GiveItem",
			["RewardType"] = "Pet",
			["Name"] = "Messenger Pigeon",
			["Quantity"] = 1,
			["Reward"] = v4.Pet:Use("Messenger Pigeon"),
			["Chance"] = 2
		},
		{
			["Type"] = "GiveItem",
			["RewardType"] = "Seed",
			["Name"] = "Sherrybloom",
			["Quantity"] = 1,
			["Reward"] = v4.Seed:Use("Sherrybloom", 1),
			["Chance"] = 1
		}
	},
	[9] = {
		{
			["Type"] = "GiveItem",
			["RewardType"] = "Seed Pack",
			["Name"] = "Gem Chest",
			["Quantity"] = 1,
			["Reward"] = v4.SeedPack:Use("Gem Chest", 1),
			["Chance"] = 10
		},
		{
			["Type"] = "GiveItem",
			["RewardType"] = "Egg",
			["Name"] = "Gem Egg",
			["Quantity"] = 1,
			["Reward"] = v4.Egg:Use("Gem Egg", 1),
			["Chance"] = 10
		},
		{
			["Type"] = "GiveItem",
			["RewardType"] = "Seed Pack",
			["Name"] = "Gem Chest",
			["Quantity"] = 3,
			["Reward"] = v4.SeedPack:Use("Gem Chest", 3),
			["Chance"] = 0.5
		},
		{
			["Type"] = "GiveItem",
			["RewardType"] = "Egg",
			["Name"] = "Gem Egg",
			["Quantity"] = 3,
			["Reward"] = v4.Egg:Use("Gem Egg", 3),
			["Chance"] = 0.5
		},
		{
			["Type"] = "GiveItem",
			["RewardType"] = "Pet",
			["Name"] = "Messenger Pigeon",
			["Quantity"] = 1,
			["Reward"] = v4.Pet:Use("Messenger Pigeon"),
			["Chance"] = 3
		},
		{
			["Type"] = "GiveItem",
			["RewardType"] = "Seed",
			["Name"] = "Sherrybloom",
			["Quantity"] = 1,
			["Reward"] = v4.Seed:Use("Sherrybloom", 1),
			["Chance"] = 2
		}
	},
	[12] = {
		{
			["Type"] = "GiveItem",
			["RewardType"] = "Seed Pack",
			["Name"] = "Gem Chest",
			["Quantity"] = 1,
			["Reward"] = v4.SeedPack:Use("Gem Chest", 1),
			["Chance"] = 10
		},
		{
			["Type"] = "GiveItem",
			["RewardType"] = "Egg",
			["Name"] = "Gem Egg",
			["Quantity"] = 1,
			["Reward"] = v4.Egg:Use("Gem Egg", 1),
			["Chance"] = 10
		},
		{
			["Type"] = "GiveItem",
			["RewardType"] = "Seed Pack",
			["Name"] = "Gem Chest",
			["Quantity"] = 3,
			["Reward"] = v4.SeedPack:Use("Gem Chest", 3),
			["Chance"] = 1.5
		},
		{
			["Type"] = "GiveItem",
			["RewardType"] = "Egg",
			["Name"] = "Gem Egg",
			["Quantity"] = 3,
			["Reward"] = v4.Egg:Use("Gem Egg", 3),
			["Chance"] = 1.5
		},
		{
			["Type"] = "GiveItem",
			["RewardType"] = "Seed",
			["Name"] = "Sherrybloom",
			["Quantity"] = 2,
			["Reward"] = v4.Seed:Use("Sherrybloom", 2),
			["Chance"] = 3
		},
		{
			["Type"] = "GiveItem",
			["RewardType"] = "Pet",
			["Name"] = "Camel",
			["Quantity"] = 1,
			["Reward"] = v4.Pet:Use("Camel", 1),
			["Chance"] = 1
		}
	},
	[15] = {
		{
			["Type"] = "GiveItem",
			["RewardType"] = "Seed Pack",
			["Name"] = "Gem Chest",
			["Quantity"] = 1,
			["Reward"] = v4.SeedPack:Use("Gem Chest", 1),
			["Chance"] = 10
		},
		{
			["Type"] = "GiveItem",
			["RewardType"] = "Egg",
			["Name"] = "Gem Egg",
			["Quantity"] = 1,
			["Reward"] = v4.Egg:Use("Gem Egg", 1),
			["Chance"] = 10
		},
		{
			["Type"] = "GiveItem",
			["RewardType"] = "Seed Pack",
			["Name"] = "Gem Chest",
			["Quantity"] = 3,
			["Reward"] = v4.SeedPack:Use("Gem Chest", 3),
			["Chance"] = 3
		},
		{
			["Type"] = "GiveItem",
			["RewardType"] = "Egg",
			["Name"] = "Gem Egg",
			["Quantity"] = 3,
			["Reward"] = v4.Egg:Use("Gem Egg", 3),
			["Chance"] = 3
		},
		{
			["Type"] = "GiveItem",
			["RewardType"] = "Pet",
			["Name"] = "Camel",
			["Quantity"] = 1,
			["Reward"] = v4.Pet:Use("Camel", 1),
			["Chance"] = 1
		},
		{
			["Type"] = "GiveItem",
			["RewardType"] = "Seed",
			["Name"] = "Pinkside Dandelion",
			["Quantity"] = 1,
			["Reward"] = v4.Seed:Use("Pinkside Dandelion", 1),
			["Chance"] = 0.5
		}
	}
}
local v_u_8 = {
	{
		{
			["PlantType"] = "Carrot",
			["Amount"] = 30
		},
		{
			["PlantType"] = "Strawberry",
			["Amount"] = 30
		},
		{
			["PlantType"] = "Blueberry",
			["Amount"] = 25
		},
		{
			["PlantType"] = "Buttercup",
			["Amount"] = 20
		},
		{
			["PlantType"] = "Tomato",
			["Amount"] = 20
		},
		{
			["PlantType"] = "Corn",
			["Amount"] = 5
		}
	},
	{
		{
			["PlantType"] = "Carrot",
			["Amount"] = 40
		},
		{
			["PlantType"] = "Strawberry",
			["Amount"] = 40
		},
		{
			["PlantType"] = "Blueberry",
			["Amount"] = 35
		},
		{
			["PlantType"] = "Buttercup",
			["Amount"] = 26
		},
		{
			["PlantType"] = "Tomato",
			["Amount"] = 28
		},
		{
			["PlantType"] = "Corn",
			["Amount"] = 10
		}
	},
	{
		{
			["PlantType"] = "Carrot",
			["Amount"] = 50
		},
		{
			["PlantType"] = "Strawberry",
			["Amount"] = 50
		},
		{
			["PlantType"] = "Blueberry",
			["Amount"] = 45
		},
		{
			["PlantType"] = "Buttercup",
			["Amount"] = 32
		},
		{
			["PlantType"] = "Tomato",
			["Amount"] = 36
		},
		{
			["PlantType"] = "Corn",
			["Amount"] = 15
		}
	},
	{
		{
			["PlantType"] = "Carrot",
			["Amount"] = 60
		},
		{
			["PlantType"] = "Strawberry",
			["Amount"] = 60
		},
		{
			["PlantType"] = "Blueberry",
			["Amount"] = 55
		},
		{
			["PlantType"] = "Buttercup",
			["Amount"] = 38
		},
		{
			["PlantType"] = "Tomato",
			["Amount"] = 44
		},
		{
			["PlantType"] = "Corn",
			["Amount"] = 20
		}
	},
	{
		{
			["PlantType"] = "Carrot",
			["Amount"] = 70
		},
		{
			["PlantType"] = "Strawberry",
			["Amount"] = 70
		},
		{
			["PlantType"] = "Blueberry",
			["Amount"] = 65
		},
		{
			["PlantType"] = "Buttercup",
			["Amount"] = 44
		},
		{
			["PlantType"] = "Tomato",
			["Amount"] = 52
		},
		{
			["PlantType"] = "Corn",
			["Amount"] = 25
		}
	},
	{
		{
			["PlantType"] = "Carrot",
			["Amount"] = 80
		},
		{
			["PlantType"] = "Strawberry",
			["Amount"] = 80
		},
		{
			["PlantType"] = "Blueberry",
			["Amount"] = 75
		},
		{
			["PlantType"] = "Buttercup",
			["Amount"] = 50
		},
		{
			["PlantType"] = "Tomato",
			["Amount"] = 60
		},
		{
			["PlantType"] = "Corn",
			["Amount"] = 30
		}
	},
	{
		{
			["PlantType"] = "Carrot",
			["Amount"] = 90
		},
		{
			["PlantType"] = "Strawberry",
			["Amount"] = 90
		},
		{
			["PlantType"] = "Blueberry",
			["Amount"] = 85
		},
		{
			["PlantType"] = "Buttercup",
			["Amount"] = 56
		},
		{
			["PlantType"] = "Tomato",
			["Amount"] = 68
		},
		{
			["PlantType"] = "Corn",
			["Amount"] = 35
		}
	},
	{
		{
			["PlantType"] = "Carrot",
			["Amount"] = 100
		},
		{
			["PlantType"] = "Strawberry",
			["Amount"] = 100
		},
		{
			["PlantType"] = "Blueberry",
			["Amount"] = 95
		},
		{
			["PlantType"] = "Buttercup",
			["Amount"] = 62
		},
		{
			["PlantType"] = "Tomato",
			["Amount"] = 76
		},
		{
			["PlantType"] = "Corn",
			["Amount"] = 40
		}
	},
	{
		{
			["PlantType"] = "Carrot",
			["Amount"] = 110
		},
		{
			["PlantType"] = "Strawberry",
			["Amount"] = 110
		},
		{
			["PlantType"] = "Blueberry",
			["Amount"] = 105
		},
		{
			["PlantType"] = "Buttercup",
			["Amount"] = 68
		},
		{
			["PlantType"] = "Tomato",
			["Amount"] = 84
		},
		{
			["PlantType"] = "Corn",
			["Amount"] = 45
		}
	},
	{
		{
			["PlantType"] = "Carrot",
			["Amount"] = 120
		},
		{
			["PlantType"] = "Strawberry",
			["Amount"] = 120
		},
		{
			["PlantType"] = "Blueberry",
			["Amount"] = 115
		},
		{
			["PlantType"] = "Buttercup",
			["Amount"] = 74
		},
		{
			["PlantType"] = "Tomato",
			["Amount"] = 92
		},
		{
			["PlantType"] = "Corn",
			["Amount"] = 50
		}
	},
	{
		{
			["PlantType"] = "Carrot",
			["Amount"] = 130
		},
		{
			["PlantType"] = "Strawberry",
			["Amount"] = 130
		},
		{
			["PlantType"] = "Blueberry",
			["Amount"] = 125
		},
		{
			["PlantType"] = "Buttercup",
			["Amount"] = 80
		},
		{
			["PlantType"] = "Tomato",
			["Amount"] = 100
		},
		{
			["PlantType"] = "Corn",
			["Amount"] = 55
		}
	},
	{
		{
			["PlantType"] = "Carrot",
			["Amount"] = 140
		},
		{
			["PlantType"] = "Strawberry",
			["Amount"] = 140
		},
		{
			["PlantType"] = "Blueberry",
			["Amount"] = 135
		},
		{
			["PlantType"] = "Buttercup",
			["Amount"] = 86
		},
		{
			["PlantType"] = "Tomato",
			["Amount"] = 108
		},
		{
			["PlantType"] = "Corn",
			["Amount"] = 60
		}
	}
}
local v9 = {
	["RewardsData"] = v_u_5,
	["PartTwoRewardsData"] = v_u_6,
	["BargainBillRewardData"] = v_u_7
}
local function v_u_14(p10)
	-- upvalues: (copy) v_u_14
	local v11 = {}
	for v12, v13 in pairs(p10) do
		if type(v13) == "table" then
			v11[v12] = v_u_14(v13)
		else
			v11[v12] = v13
		end
	end
	return v11
end
function v9.PickRandomReward(_, p15, p16, p17)
	-- upvalues: (copy) v_u_5, (copy) v_u_14, (copy) v_u_3, (copy) v_u_6
	local v18 = Random.new(p16)
	local v19 = math.max(1, p15)
	if v19 <= 12 then
		local v20 = v_u_14(v_u_5[v19])
		if p17 then
			for v21, v22 in v20 do
				if v22.Name == "Booth Sign" then
					table.remove(v20, v21)
					break
				end
			end
		end
		return v_u_3.One(v20, v18)
	end
	if v19 <= 16 then
		local v23 = v_u_14(v_u_5[12])
		if p17 then
			for v24, v25 in v23 do
				if v25.Name == "Booth Sign" then
					table.remove(v23, v24)
					break
				end
			end
		end
		return v_u_3.One(v23, v18)
	end
	local v26 = nil
	for v27 in v_u_6 do
		if v27 <= v19 and (not v26 or v26 < v27) then
			v26 = v27
		end
	end
	local v28 = v_u_14(v_u_6[v26 or 17])
	if p17 then
		for v29, v30 in v28 do
			if v30.Name == "Booth Sign" then
				table.remove(v28, v29)
				break
			end
		end
	end
	return v_u_3.One(v28, v18)
end
function v9.PickBargainBillReward(_, p31)
	-- upvalues: (copy) v_u_7, (copy) v_u_3
	local v32 = nil
	for v33 in v_u_7 do
		if v33 <= p31 and (not v32 or v32 < v33) then
			v32 = v33
		end
	end
	if v32 then
		return v_u_3.One(v_u_7[v32])
	else
		return nil
	end
end
function v9.GetSubmissionRequirements(_, p34, p35)
	-- upvalues: (copy) v_u_5, (copy) v_u_3, (copy) v_u_8
	local v36 = Random.new(p35)
	local v37 = math.max(1, p34)
	local v38 = math.min(v37, 12)
	local v39 = not v_u_5[v38] and 1 or v38
	return v_u_3.One(v_u_8[v39], v36)
end
return v9