local v1 = {}
local v2 = {
	["Description"] = "All plants within <Range> studs grow <Multiplier>x faster!"
}
local v3 = {
	["Range"] = {
		["Base"] = 10,
		["Scale"] = 0.1
	},
	["Multiplier"] = {
		["Base"] = 1.25,
		["Scale"] = 0.0125
	}
}
v2.States = v3
v1["Milk of the Land"] = v2
local v4 = {
	["Description"] = "<Chance>% chance harvested fruit duplicate! Rarer crops have lower chance to duplicate."
}
local v5 = {
	["Chance"] = {
		["Max"] = 30,
		["Base"] = 10,
		["Scale"] = 0.1
	}
}
v4.States = v5
v1["For the Blue Colony"] = v4
local v6 = {
	["Description"] = "<Chance>% chance harvested fruit duplicate! Rarer crops have lower chance to duplicate."
}
local v7 = {
	["Chance"] = {
		["Max"] = 30,
		["Base"] = 5,
		["Scale"] = 0.1
	}
}
v6.States = v7
v1["For the Red Colony"] = v6
local v8 = {
	["Description"] = "<Chance>% extra chance for Candy type fruit to duplicate!"
}
local v9 = {
	["Chance"] = {
		["Max"] = 20,
		["Base"] = 5,
		["Scale"] = 0.15
	}
}
v8.States = v9
v1["Candy Harvester"] = v8
local v10 = {
	["Description"] = "<Chance>% extra chance harvested plants drop seeds. Rarer plants have lower chance to duplicate."
}
local v11 = {
	["Chance"] = {
		["Max"] = 10,
		["Base"] = 5,
		["Scale"] = 0.05
	}
}
v10.States = v11
v1["Slow and Steady"] = v10
local v12 = {
	["Description"] = "Every <Cooldown>s, <Chance>% chance to dig up a random seed!"
}
local v13 = {
	["Cooldown"] = {
		["Min"] = 5,
		["Base"] = 60,
		["Scale"] = -1
	},
	["Chance"] = {
		["Base"] = 5,
		["Scale"] = 0.05
	}
}
v12.States = v13
v1["Digging Buddy"] = v12
local v14 = {
	["Description"] = "Every <Cooldown>s, <Chance>% chance to dig up a random seed!"
}
local v15 = {
	["Cooldown"] = {
		["Min"] = 5,
		["Base"] = 60,
		["Scale"] = -1
	},
	["Chance"] = {
		["Base"] = 10,
		["Scale"] = 0.1
	}
}
v14.States = v15
v1["Digging Friend"] = v14
local v16 = {
	["Description"] = "Every <Cooldown>s, eats a carrot for <Multiplier>x value bonus!"
}
local v17 = {
	["Cooldown"] = {
		["Min"] = 5,
		["Base"] = 45,
		["Scale"] = -1
	},
	["Multiplier"] = {
		["Base"] = 1.5,
		["Scale"] = 0.015
	}
}
v16.States = v17
v1["Carrot Chomper"] = v16
local v18 = {
	["Description"] = "Every <Cooldown>s, eats a carrot for <Multiplier>x value bonus!"
}
local v19 = {
	["Cooldown"] = {
		["Min"] = 5,
		["Base"] = 40,
		["Scale"] = -1
	},
	["Multiplier"] = {
		["Base"] = 3,
		["Scale"] = 0.03
	}
}
v18.States = v19
v1["Carrot Devourer"] = v18
local v20 = {
	["Description"] = "Every <Cooldown>s, eats a buttercup and drops two seeds!"
}
local v21 = {
	["Cooldown"] = {
		["Min"] = 5,
		["Base"] = 180,
		["Scale"] = -0.5
	}
}
v20.States = v21
v1["Buttercup Muncher"] = v20
local v22 = {
	["Description"] = "Every <Cooldown>s, eats a buttercup and drops three seeds!"
}
local v23 = {
	["Cooldown"] = {
		["Min"] = 5,
		["Base"] = 45,
		["Scale"] = -0.5
	}
}
v22.States = v23
v1["Rainbow Buttercup Muncher"] = v22
local v24 = {
	["Description"] = "Every <Cooldown>s, naps for <Duration>s. New fruit within <Range> studs will be <Multiplier>x larger!"
}
local v25 = {
	["Cooldown"] = {
		["Min"] = 5,
		["Base"] = 80,
		["Scale"] = -1
	},
	["Duration"] = {
		["Max"] = 20,
		["Base"] = 10,
		["Scale"] = 0.1
	},
	["Range"] = {
		["Max"] = 20,
		["Base"] = 10,
		["Scale"] = 0.1
	},
	["Multiplier"] = {
		["Max"] = 4,
		["Base"] = 1.25,
		["Scale"] = 0.0025
	}
}
v24.States = v25
v1["Cat Nap"] = v24
local v26 = {
	["Description"] = "Every <Cooldown>s, naps for <Duration>s. New fruit within <Range> studs will be <Multiplier>x larger!"
}
local v27 = {
	["Cooldown"] = {
		["Min"] = 5,
		["Base"] = 90,
		["Scale"] = -1
	},
	["Duration"] = {
		["Max"] = 30,
		["Base"] = 15,
		["Scale"] = 0.15
	},
	["Range"] = {
		["Max"] = 30,
		["Base"] = 15,
		["Scale"] = 0.15
	},
	["Multiplier"] = {
		["Max"] = 5,
		["Base"] = 1.5,
		["Scale"] = 0.01
	}
}
v26.States = v27
v1["Lazy Nap"] = v26
local v28 = {
	["Description"] = "<Chance>% chance berry fruit stays after collecting! Rarer plants haves have rarer chance to replant"
}
local v29 = {
	["Chance"] = {
		["Max"] = 5,
		["Base"] = 2.5,
		["Scale"] = 0.025
	}
}
v28.States = v29
v1.Forester = v28
local v30 = {
	["Description"] = "<Chance>% chance berry fruit stays after collecting! Rarer plants haves have rarer chance to replant"
}
local v31 = {
	["Chance"] = {
		["Max"] = 10,
		["Base"] = 5,
		["Scale"] = 0.05
	}
}
v30.States = v31
v1["Spotted Forester"] = v30
local v32 = {
	["Description"] = "Every <Cooldown>s, sprays water on a nearby plant."
}
local v33 = {
	["Cooldown"] = {
		["Min"] = 5,
		["Base"] = 30,
		["Scale"] = -1
	}
}
v32.States = v33
v1["Water Spray"] = v32
local v34 = {
	["Description"] = "Increases egg hatch speed by <Multiplier>%!"
}
local v35 = {
	["Multiplier"] = {
		["Max"] = 35,
		["Base"] = 10,
		["Scale"] = 0.1
	}
}
v34.States = v35
v1.Eggcelerator = v34
local v36 = {
	["Description"] = "Increases egg hatch speed by <Multiplier>%!"
}
local v37 = {
	["Multiplier"] = {
		["Max"] = 65,
		["Base"] = 20,
		["Scale"] = 0.2
	}
}
v36.States = v37
v1["Better Eggcelerator"] = v36
local v38 = {
	["Description"] = "Every <Cooldown>s, emits an aura for <Duration>s granting <Multiplier>x chance for new fruit to grow as variants within <Range> studs!"
}
local v39 = {
	["Cooldown"] = {
		["Min"] = 5,
		["Base"] = 120,
		["Scale"] = -1
	},
	["Duration"] = {
		["Base"] = 15,
		["Scale"] = 0.15
	},
	["Range"] = {
		["Base"] = 15,
		["Scale"] = 0.15
	},
	["Multiplier"] = {
		["Base"] = 2,
		["Scale"] = 0.01
	}
}
v38.States = v39
v1["Fertilizer Frenzy"] = v38
local v40 = {
	["Description"] = "All Sprinklers last <Multiplier>% longer!"
}
local v41 = {
	["Range"] = {
		["Base"] = 35,
		["Scale"] = 0.5
	},
	["Multiplier"] = {
		["Base"] = 20,
		["Scale"] = 0.2
	}
}
v40.States = v41
v1["Turtle Tinkerer"] = v40
local v42 = {
	["Description"] = "<Chance>% chance to refund fruit back to your inventory. Rarer plants have lower chance to refund!"
}
local v43 = {
	["Chance"] = {
		["Max"] = 8,
		["Base"] = 2.5,
		["Scale"] = 0.025
	}
}
v42.States = v43
v1["Cheeky Refund"] = v42
local v44 = {
	["Description"] = "<Chance>% chance to refund fruit back to your inventory. Rarer plants have lower chance to refund!"
}
local v45 = {
	["Chance"] = {
		["Max"] = 20,
		["Base"] = 7.5,
		["Scale"] = 0.075
	}
}
v44.States = v45
v1["Premium Cheeky Refund"] = v44
local v46 = {
	["Description"] = " "
}
local v47 = {
	["Cooldown"] = {
		["Min"] = 8,
		["Base"] = 8,
		["Scale"] = 0
	}
}
v46.States = v47
v1["Movement Variation"] = v46
local v48 = {
	["Description"] = "Every <Cooldown>m, turns one random fruit gold!"
}
local v49 = {
	["Cooldown"] = {
		["Min"] = 60,
		["Base"] = 300,
		["Scale"] = -3,
		["Formatter"] = "ColonTime"
	}
}
v48.States = v49
v1.Transmutation = v48
local v50 = {
	["Description"] = "Every <Cooldown>s, <Chance>% chance a nearby fruit becomes Chilled or Frozen!"
}
local v51 = {
	["Cooldown"] = {
		["Min"] = 10,
		["Base"] = 80,
		["Scale"] = -1
	},
	["Chance"] = {
		["Base"] = 10,
		["Scale"] = 0.1
	}
}
v50.States = v51
v1["Polar Express"] = v50
local v52 = {
	["Description"] = "Every <Cooldown>m, eats bamboo for <Multiplier>x value bonus!"
}
local v53 = {
	["Cooldown"] = {
		["Min"] = 60,
		["Base"] = 180,
		["Scale"] = -1,
		["Formatter"] = "ColonTime"
	},
	["Multiplier"] = {
		["Base"] = 1.5,
		["Scale"] = 0.015
	}
}
v52.States = v53
v1.Bamboozle = v52
local v54 = {
	["Description"] = "Every <Cooldown>, applies Heartstruck mutation to a random Bamboo!"
}
local v55 = {
	["Cooldown"] = {
		["Min"] = 60,
		["Base"] = 180,
		["Scale"] = -1.5,
		["Formatter"] = "ColonTime"
	}
}
v54.States = v55
v1.Loveboo = v54
local v56 = {
	["Description"] = "Passive: All leafy plants grow <Multiplier>x faster!"
}
local v57 = {
	["Range"] = {
		["Base"] = 25,
		["Scale"] = 0
	},
	["Multiplier"] = {
		["Base"] = 1.45,
		["Scale"] = 0.15
	}
}
v56.States = v57
v1["Leaf Lover"] = v56
local v58 = {
	["Description"] = "Every <Cooldown>s, prays for <Duration>s granting <Multiplier>x variant chance within <Range> studs!"
}
local v59 = {
	["Cooldown"] = {
		["Min"] = 5,
		["Base"] = 80,
		["Scale"] = -1
	},
	["Duration"] = {
		["Base"] = 10,
		["Scale"] = 0.1
	},
	["Range"] = {
		["Base"] = 10,
		["Scale"] = 0.1
	},
	["Multiplier"] = {
		["Base"] = 1.5,
		["Scale"] = 0.005
	}
}
v58.States = v59
v1["Zen Zone"] = v58
local v60 = {
	["Description"] = "Grants prickly plants in <Range> studs a <Multiplier>x size bonus!"
}
local v61 = {
	["Multiplier"] = {
		["Max"] = 2.2,
		["Base"] = 1.5,
		["Scale"] = 0.015
	},
	["Range"] = {
		["Max"] = 65,
		["Base"] = 30,
		["Scale"] = 0.2
	}
}
v60.States = v61
v1["Prickly Lover"] = v60
local v62 = {
	["Description"] = "Every <Cooldown>s, goes to the egg with the highest hatch time, and reduces its hatch time by <Amount>s!"
}
local v63 = {
	["Cooldown"] = {
		["Min"] = 10,
		["Base"] = 60,
		["Scale"] = -1
	},
	["Amount"] = {
		["Max"] = 60,
		["Base"] = 25,
		["Scale"] = 0.25
	}
}
v62.States = v63
v1["Nocturnal Nursery"] = v62
local v64 = {
	["Description"] = "Every <Cooldown>s, digs down underground to find treasure. Can dig up gear or sheckles!"
}
local v65 = {
	["Cooldown"] = {
		["Min"] = 10,
		["Base"] = 80,
		["Scale"] = -1
	}
}
v64.States = v65
v1["Treasure Hunter"] = v64
local v66 = {
	["Description"] = "Every <Cooldown>m, croaks and a random nearby plant will advance growth by 24 hours!"
}
local v67 = {
	["Cooldown"] = {
		["Min"] = 15,
		["Base"] = 604.5,
		["Scale"] = -6,
		["Formatter"] = "ColonTime"
	}
}
v66.States = v67
v1.Croak = v66
local v68 = {
	["Description"] = "Every <Cooldown>m, croaks and a random nearby plant will advance growth by 24 hours!"
}
local v69 = {
	["Cooldown"] = {
		["Min"] = 15,
		["Base"] = 303,
		["Scale"] = -6,
		["Formatter"] = "ColonTime"
	}
}
v68.States = v69
v1["Echo Croak"] = v68
local v70 = {
	["Description"] = "All active pets gain an additional <Chance> XP/s!"
}
local v71 = {
	["Chance"] = {
		["Base"] = 0.2,
		["Scale"] = 0.04
	}
}
v70.States = v71
v1["Prince of the Night"] = v70
local v72 = {
	["Description"] = "All active pets gain an additional <Chance> XP/s!"
}
local v73 = {
	["Chance"] = {
		["Base"] = 0.2,
		["Scale"] = 0.04
	}
}
v72.States = v73
v1["King of the Night"] = v72
local v74 = {
	["Description"] = "All active pets gain an additional <Chance> XP/s!"
}
local v75 = {
	["Chance"] = {
		["Base"] = 0.1,
		["Scale"] = 0.07
	}
}
v74.States = v75
v1["Big Eyes"] = v74
local v76 = {
	["Description"] = "All active pets gain an additional <Chance> XP/s!"
}
local v77 = {
	["Chance"] = {
		["Base"] = 0.2,
		["Scale"] = 0.14
	}
}
v76.States = v77
v1["Rainbow Big Eyes"] = v76
local v78 = {
	["Description"] = "Every <Cooldown>m, goes to another player\'s plot and steals a random crop and gives it to you!"
}
local v79 = {
	["Cooldown"] = {
		["Min"] = 15,
		["Base"] = 904.5,
		["Scale"] = -4,
		["Formatter"] = "ColonTime"
	}
}
v78.States = v79
v1.Rascal = v78
local v80 = {
	["Description"] = "Every <Cooldown>m, gains additional <Amount> bonus experience!"
}
local v81 = {
	["Cooldown"] = {
		["Min"] = 15,
		["Base"] = 603,
		["Scale"] = -8,
		["Formatter"] = "ColonTime"
	},
	["Amount"] = {
		["Base"] = 500,
		["Scale"] = 8
	}
}
v80.States = v81
v1["Whisker Wisdom"] = v80
local v82 = {
	["Description"] = "Grants additional <Chance>% increase to player movement speed!"
}
local v83 = {
	["Chance"] = {
		["Base"] = 12,
		["Scale"] = 0.1
	}
}
v82.States = v83
v1.Scamper = v82
local v84 = {
	["Description"] = "<Chance>% chance to not consume a use when using the Reclaimer!"
}
local v85 = {
	["Chance"] = {
		["Max"] = 30,
		["Base"] = 10,
		["Scale"] = 0.3
	}
}
v84.States = v85
v1["Seed Stash"] = v84
local v86 = {
	["Description"] = "Gains an additional <Amount> xp per second!"
}
local v87 = {
	["Amount"] = {
		["Max"] = 20,
		["Base"] = 3,
		["Scale"] = 0.3
	}
}
v86.States = v87
v1["Nutty Apology"] = v86
local v88 = {
	["Description"] = "Every <Cooldown>m, gains additional <Amount> bonus experience!"
}
local v89 = {
	["Cooldown"] = {
		["Min"] = 15,
		["Base"] = 503,
		["Scale"] = -7,
		["Formatter"] = "ColonTime"
	},
	["Amount"] = {
		["Base"] = 750,
		["Scale"] = 11
	}
}
v88.States = v89
v1["Whiskier Wisdom"] = v88
local v90 = {
	["Description"] = "Grants additional <Chance>% increase to player jump height!"
}
local v91 = {
	["Chance"] = {
		["Base"] = 12,
		["Scale"] = 0.1
	}
}
v90.States = v91
v1["Cheese Hop"] = v90
local v92 = {
	["Description"] = "<Chance>% extra chance for Fruit type crops to duplicate!"
}
local v93 = {
	["Chance"] = {
		["Max"] = 25,
		["Base"] = 5,
		["Scale"] = 0.1
	}
}
v92.States = v93
v1["Fruit Harvester"] = v92
local v94 = {
	["Description"] = "Every <Cooldown>m, goes to another player\'s random crop tries to get a seed from it and gives it to you. If it succeeds it will try to steal again. Rarer seeds have less chance to succeed stealing!"
}
local v95 = {
	["Cooldown"] = {
		["Min"] = 15,
		["Base"] = 443,
		["Scale"] = -5,
		["Formatter"] = "ColonTime"
	}
}
v94.States = v95
v1.Scoundrel = v94
local v96 = {
	["Description"] = "Every <Cooldown>m, <Chance>% chance a nearby fruit becomes Zombified!"
}
local v97 = {
	["Cooldown"] = {
		["Min"] = 15,
		["Base"] = 1600,
		["Scale"] = -18,
		["Formatter"] = "ColonTime"
	},
	["Chance"] = {
		["Base"] = 20,
		["Scale"] = 0.2
	}
}
v96.States = v97
v1.Zombify = v96
local v98 = {
	["Description"] = "Every <Cooldown>s, goes to the egg with the highest hatch time, and reduces its hatch time by <Amount>s!"
}
local v99 = {
	["Cooldown"] = {
		["Min"] = 10,
		["Base"] = 60,
		["Scale"] = -1
	},
	["Amount"] = {
		["Max"] = 100,
		["Base"] = 45,
		["Scale"] = 0.45
	}
}
v98.States = v99
v1["Crimson Cradle"] = v98
local v100 = {
	["Description"] = "All active pets gain an additional <Chance> XP/s!"
}
local v101 = {
	["Chance"] = {
		["Base"] = 0.5,
		["Scale"] = 0.08
	}
}
v100.States = v101
v1["Monarch of Midnight"] = v100
local v102 = {
	["Description"] = "Grants prickly plants in <Range> studs a <Multiplier>x size bonus!"
}
local v103 = {
	["Multiplier"] = {
		["Max"] = 3.2,
		["Base"] = 2,
		["Scale"] = 0.02
	},
	["Range"] = {
		["Max"] = 75,
		["Base"] = 30,
		["Scale"] = 0.2
	}
}
v102.States = v103
v1["Sanguine Spike"] = v102
local v104 = {
	["Description"] = "Grants prickly plants in <Range> studs a <Multiplier>x variant chance bonus!"
}
local v105 = {
	["Multiplier"] = {
		["Max"] = 2.2,
		["Base"] = 1.15,
		["Scale"] = 0.0115
	},
	["Range"] = {
		["Max"] = 88,
		["Base"] = 22,
		["Scale"] = 0.2
	}
}
v104.States = v105
v1["Prickly Blessing"] = v104
local v106 = {
	["Description"] = "Every <Cooldown>s, naps for <Duration>s. New fruit within <Range> studs will be <Multiplier>x larger!"
}
local v107 = {
	["Cooldown"] = {
		["Min"] = 15,
		["Base"] = 70,
		["Scale"] = -1
	},
	["Duration"] = {
		["Max"] = 40,
		["Base"] = 20,
		["Scale"] = 0.2
	},
	["Range"] = {
		["Max"] = 40,
		["Base"] = 20,
		["Scale"] = 0.2
	},
	["Multiplier"] = {
		["Max"] = 8,
		["Base"] = 1.5,
		["Scale"] = 0.02
	}
}
v106.States = v107
v1["Moon Nap"] = v106
local v108 = {
	["Description"] = "<Chance>% chance Night type fruit stays after harvest!"
}
local v109 = {
	["Chance"] = {
		["Max"] = 20,
		["Base"] = 6,
		["Scale"] = 0.6
	}
}
v108.States = v109
v1["Moon Harvest"] = v108
local v110 = {
	["Description"] = "Every <Cooldown>m, flies to a nearby fruit and pollinates it, applying Pollinated mutation!"
}
local v111 = {
	["Cooldown"] = {
		["Min"] = 60,
		["Base"] = 1510,
		["Scale"] = -16,
		["Formatter"] = "ColonTime"
	}
}
v110.States = v111
v1.Pollinator = v110
local v112 = {
	["Description"] = "Every <Cooldown>m, flies to a nearby fruit and pollinates it, applying Pollinated mutation!"
}
local v113 = {
	["Cooldown"] = {
		["Min"] = 60,
		["Base"] = 1210,
		["Scale"] = -12,
		["Formatter"] = "ColonTime"
	}
}
v112.States = v113
v1["Beeter Pollinator"] = v112
local v114 = {
	["Description"] = "<Chance>% chance Flower type fruit stays after harvest!"
}
local v115 = {
	["Chance"] = {
		["Max"] = 5,
		["Base"] = 1,
		["Scale"] = 0.1
	}
}
v114.States = v115
v1["Flower Harvest"] = v114
local v116 = {
	["Description"] = "Every <Cooldown>m, goes to a nearby fruit and tries to pollinate it, but its not a bee so it fails and turns it to Honey Glazed instead :("
}
local v117 = {
	["Cooldown"] = {
		["Min"] = 60,
		["Base"] = 1510,
		["Scale"] = -16,
		["Formatter"] = "ColonTime"
	}
}
v116.States = v117
v1["Wanna-Bee"] = v116
local v118 = {
	["Description"] = "Every <Cooldown>m, a nearby fruit gets magically pollinated, applying Pollinated mutation!"
}
local v119 = {
	["Cooldown"] = {
		["Min"] = 60,
		["Base"] = 1220,
		["Scale"] = -16,
		["Formatter"] = "ColonTime"
	}
}
v118.States = v119
v1["Queen Pollinator"] = v118
local v120 = {
	["Description"] = "Every <Cooldown>m, the pet with the highest cooldown refreshes its ability!"
}
local v121 = {
	["Cooldown"] = {
		["Min"] = 60,
		["Base"] = 1328,
		["Scale"] = -16,
		["Formatter"] = "ColonTime"
	}
}
v120.States = v121
v1["For the Queen"] = v120
local v122 = {
	["Description"] = "Every <Cooldown>m, flies to a nearby fruit and pollinates it, applying Pollinated mutation!"
}
local v123 = {
	["Cooldown"] = {
		["Min"] = 60,
		["Base"] = 1800,
		["Scale"] = -18,
		["Formatter"] = "ColonTime"
	}
}
v122.States = v123
v1["Wasp Pollinator"] = v122
local v124 = {
	["Description"] = "Every <Cooldown>m, stings a random pet and advances its ability cooldown by <Amount>s!"
}
local v125 = {
	["Cooldown"] = {
		["Min"] = 60,
		["Base"] = 602,
		["Scale"] = -6,
		["Formatter"] = "ColonTime"
	},
	["Amount"] = {
		["Base"] = 60,
		["Scale"] = 0.6
	}
}
v124.States = v125
v1.Stinger = v124
local v126 = {
	["Description"] = "Every <Cooldown>m, stings a random pet and advances its ability cooldown by <Amount>s!"
}
local v127 = {
	["Cooldown"] = {
		["Min"] = 60,
		["Base"] = 302,
		["Scale"] = -3,
		["Formatter"] = "ColonTime"
	},
	["Amount"] = {
		["Base"] = 80,
		["Scale"] = 0.8
	}
}
v126.States = v127
v1["Tarantula Stinger"] = v126
local v128 = {
	["Description"] = "Every <Cooldown>m, sings to a random pet and restores its hunger to 100%!"
}
local v129 = {
	["Cooldown"] = {
		["Min"] = 15,
		["Base"] = 763,
		["Scale"] = -7,
		["Formatter"] = "ColonTime"
	}
}
v128.States = v129
v1.Silksong = v128
local v130 = {
	["Description"] = "Every <Cooldown>m, flies to a nearby fruit with 5+ mutations, removes all mutations from it and turns it Rainbow! Ignores favorited fruit."
}
local v131 = {
	["Cooldown"] = {
		["Min"] = 15,
		["Base"] = 1808,
		["Scale"] = -18,
		["Formatter"] = "ColonTime"
	}
}
v130.States = v131
v1["Rainbow Flutter"] = v130
local v132 = {
	["Description"] = "Every <Cooldown>m, <Chance>% chance a nearby fruit becomes Disco!"
}
local v133 = {
	["Cooldown"] = {
		["Min"] = 15,
		["Base"] = 906,
		["Scale"] = -12,
		["Formatter"] = "ColonTime"
	},
	["Chance"] = {
		["Base"] = 14,
		["Scale"] = 1
	}
}
v132.States = v133
v1["Disco Disco"] = v132
local v134 = {
	["Description"] = "Every <Cooldown>m, <Chance>% chance to cook a nearby fruit. Usually Burnt, but occasionally Cooked!"
}
local v135 = {
	["Cooldown"] = {
		["Min"] = 15,
		["Base"] = 806,
		["Scale"] = -12,
		["Formatter"] = "ColonTime"
	},
	["Chance"] = {
		["Base"] = 15,
		["Scale"] = 0.25
	}
}
v134.States = v135
v1["Let Him Cook"] = v134
local v136 = {
	["Description"] = "All active pets gain an additional <Chance> XP/s! Also very tasty!"
}
local v137 = {
	["Chance"] = {
		["Base"] = 0.15,
		["Scale"] = 0.03
	}
}
v136.States = v137
v1["King of the Grill"] = v136
local v138 = {
	["Description"] = "Increases player backpack size by <Chance>!"
}
local v139 = {
	["Chance"] = {
		["Base"] = 30,
		["Scale"] = 1
	}
}
v138.States = v139
v1["Pack Bee"] = v138
local v140 = {
	["Description"] = "Gains an additional <Amount> xp per second!"
}
local v141 = {
	["Amount"] = {
		["Max"] = 25,
		["Base"] = 5,
		["Scale"] = 0.5
	}
}
v140.States = v141
v1["You\'re a Star"] = v140
local v142 = {
	["Description"] = "Every <Cooldown>m goes to another random player and pinches them for their money and grants you <Amount> - <AmountHigh> sheckles. Pinched player does not lose sheckles."
}
local v143 = {
	["Cooldown"] = {
		["Min"] = 15,
		["Base"] = 378,
		["Scale"] = -4,
		["Formatter"] = "ColonTime"
	},
	["Amount"] = {
		["Base"] = 225,
		["Scale"] = 25
	},
	["AmountHigh"] = {
		["Base"] = 425,
		["Scale"] = 25
	}
}
v142.States = v143
v1["Pinch Pocket"] = v142
local v144 = {
	["Description"] = "When you get a Lucky Harvest: There is a <Chance>% chance to get an extra seed! (stacked chance capped at 12%)"
}
local v145 = {
	["Chance"] = {
		["Max"] = 6,
		["Base"] = 3,
		["Scale"] = 0.3
	}
}
v144.States = v145
v1.Scavenger = v144
local v146 = {
	["Description"] = "When you get a Lucky Harvest: There is a <Chance>% chance to get triple seeds! (stacked chance capped at 12%)"
}
local v147 = {
	["Chance"] = {
		["Max"] = 6,
		["Base"] = 2,
		["Scale"] = 0.25
	}
}
v146.States = v147
v1["Cuckoo Luck"] = v146
local v148 = {
	["Description"] = "When you get a Lucky Harvest: There is a <Chance>% chance to get x4 seeds! (stacked chance capped at 12%)"
}
local v149 = {
	["Chance"] = {
		["Max"] = 6,
		["Base"] = 2,
		["Scale"] = 0.25
	}
}
v148.States = v149
v1["Rainbow Cuckoo Luck"] = v148
local v150 = {
	["Description"] = "Grants all tropical plants within <Range> studs, a <Multiplier>x size bonus!"
}
local v151 = {
	["Multiplier"] = {
		["Max"] = 2.1,
		["Base"] = 1.2,
		["Scale"] = 0.05
	},
	["Range"] = {
		["Max"] = 60,
		["Base"] = 25,
		["Scale"] = 0.25
	}
}
v150.States = v151
v1["Tropical Lover"] = v150
local v152 = {
	["Description"] = "Grants all tropical plants within <Range> studs, a <Multiplier>x variant chance bonus!"
}
local v153 = {
	["Multiplier"] = {
		["Max"] = 8,
		["Base"] = 1.15,
		["Scale"] = 0.1
	},
	["Range"] = {
		["Max"] = 60,
		["Base"] = 25,
		["Scale"] = 0.25
	}
}
v152.States = v153
v1["Tropical Blessing"] = v152
local v154 = {
	["Description"] = "Every <Cooldown>m, stands on one leg for <Duration>s. All plants and fruits within <Range> studs will grow <Multiplier>x faster!"
}
local v155 = {
	["Cooldown"] = {
		["Min"] = 15,
		["Base"] = 240,
		["Scale"] = -2,
		["Formatter"] = "ColonTime"
	},
	["Duration"] = {
		["Base"] = 15,
		["Scale"] = 0.5
	},
	["Range"] = {
		["Base"] = 13,
		["Scale"] = 0.3
	},
	["Multiplier"] = {
		["Base"] = 15,
		["Scale"] = 0.25
	}
}
v154.States = v155
v1.Flamboyance = v154
local v156 = {
	["Description"] = "Every <Cooldown>m, shares its wisdom with a random pet, granting <Amount> bonus experience!"
}
local v157 = {
	["Cooldown"] = {
		["Min"] = 20,
		["Base"] = 720,
		["Scale"] = -6.5,
		["Formatter"] = "ColonTime"
	},
	["Amount"] = {
		["Max"] = 2800,
		["Base"] = 990,
		["Scale"] = 14
	}
}
v156.States = v157
v1["Shell Share"] = v156
local v158 = {
	["Description"] = "Every <Cooldown>s, splashes water at a nearby fruit and it has a <Chance>% chance to become Wet!"
}
local v159 = {
	["Cooldown"] = {
		["Min"] = 15,
		["Base"] = 164,
		["Scale"] = -3
	},
	["Chance"] = {
		["Base"] = 12,
		["Scale"] = 0.2
	}
}
v158.States = v159
v1["Water Splash"] = v158
local v160 = {
	["Description"] = "Selling pets have a <Chance>% chance to get the pet back as its egg equivalent! Cannot get Premium/Exotic/Rainbow Eggs back. This bonus is capped at 50% per pet sold."
}
local v161 = {
	["Chance"] = {
		["Max"] = 50,
		["Base"] = 1,
		["Scale"] = 0.05
	}
}
v160.States = v161
v1["Seal the Deal"] = v160
local v162 = {
	["Description"] = "When crafting, each material used in the recipe has a <Chance>% chance to not get consumed!"
}
local v163 = {
	["Chance"] = {
		["Max"] = 7,
		["Base"] = 3,
		["Scale"] = 0.33
	}
}
v162.States = v163
v1["Helping Hands"] = v162
local v164 = {
	["Description"] = "Pets hatched from eggs have a bonus 1 - <Chance> age to their age value!"
}
local v165 = {
	["Chance"] = {
		["Max"] = 10,
		["Base"] = 4.5,
		["Scale"] = 0.5
	}
}
v164.States = v165
v1.Eggsperience = v164
local v166 = {
	["Description"] = "Pets hatched from eggs have a bonus 1 - <Chance> age to their age value!"
}
local v167 = {
	["Chance"] = {
		["Max"] = 15,
		["Base"] = 3,
		["Scale"] = 0.1
	}
}
v166.States = v167
v1["Dark Chirp"] = v166
local v168 = {
	["Description"] = "Pets hatched from eggs have a bonus 1 - <Chance> age to their age value!"
}
local v169 = {
	["Chance"] = {
		["Max"] = 17,
		["Base"] = 4,
		["Scale"] = 0.125
	}
}
v168.States = v169
v1["Rainbow Dark Chirp"] = v168
local v170 = {
	["Description"] = "Every <Cooldown>m, fans its feathers and all active pets within <Range> studs will advance cooldown for their abilities by <Amount>s!"
}
local v171 = {
	["Cooldown"] = {
		["Min"] = 15,
		["Base"] = 606,
		["Scale"] = -6,
		["Formatter"] = "ColonTime"
	},
	["Amount"] = {
		["Max"] = 150,
		["Base"] = 65,
		["Scale"] = 0.6
	},
	["Range"] = {
		["Max"] = 60,
		["Base"] = 20,
		["Scale"] = 0.2
	}
}
v170.States = v171
v1["Utter Beauty"] = v170
local v172 = {
	["Description"] = "All pets within <Range> studs won\'t lose hunger and will gain <Amount> XP every second!"
}
local v173 = {
	["Amount"] = {
		["Max"] = 30,
		["Base"] = 3,
		["Scale"] = 0.3
	},
	["Range"] = {
		["Max"] = 40,
		["Base"] = 14.5,
		["Scale"] = 0.25
	}
}
v172.States = v173
v1["Chill Zone"] = v172
local v174 = {
	["Description"] = "Every <Cooldown>m, <Chance>% chance to mutate a nearby fruit, applying the Verdant mutation!"
}
local v175 = {
	["Cooldown"] = {
		["Min"] = 15,
		["Base"] = 524,
		["Scale"] = -5,
		["Formatter"] = "ColonTime"
	},
	["Chance"] = {
		["Base"] = 15,
		["Scale"] = 0.5
	}
}
v174.States = v175
v1["Verdant Bird"] = v174
local v176 = {
	["Description"] = "Every <Cooldown>m, mimics and copies an ability from another pet and performs its ability!"
}
local v177 = {
	["Cooldown"] = {
		["Min"] = 15,
		["Base"] = 1212,
		["Scale"] = -12,
		["Formatter"] = "ColonTime"
	}
}
v176.States = v177
v1.Mimicry = v176
local v178 = {
	["Description"] = "Buying from the seed/gear shop has a <Chance>% chance to duplicate the bought item! (Max 50%)"
}
local v179 = {
	["Chance"] = {
		["Max"] = 6,
		["Base"] = 1,
		["Scale"] = 0.25
	}
}
v178.States = v179
v1["Coiled Commerce"] = v178
local v180 = {
	["Description"] = "Every <Cooldown>m goes to another pet and does a lookout. That pet advances cooldown by <Amount>s! Has a <Chance>% chance to do it again after each lookout."
}
local v181 = {
	["Cooldown"] = {
		["Min"] = 15,
		["Base"] = 444,
		["Scale"] = -4.4,
		["Formatter"] = "ColonTime"
	},
	["Amount"] = {
		["Base"] = 20,
		["Scale"] = 0.5
	},
	["Chance"] = {
		["Max"] = 100,
		["Base"] = 15,
		["Scale"] = 0.25
	}
}
v180.States = v181
v1.Lookout = v180
local v182 = {
	["Description"] = "<Chance>% chance Summer type fruit stays after collecting! Rarer plants haves have rarer chance to replant"
}
local v183 = {
	["Chance"] = {
		["Max"] = 13,
		["Base"] = 6,
		["Scale"] = 0.2
	}
}
v182.States = v183
v1["Summer Regeneration"] = v182
local v184 = {
	["Description"] = "Every <Cooldown>m, <Chance>% chance to mutate a nearby fruit, applying the Cloudtouched mutation!"
}
local v185 = {
	["Cooldown"] = {
		["Min"] = 15,
		["Base"] = 486,
		["Scale"] = -4,
		["Formatter"] = "ColonTime"
	},
	["Chance"] = {
		["Base"] = 15,
		["Scale"] = 0.5
	}
}
v184.States = v185
v1["Cloudtouched Bird"] = v184
local v186 = {
	["Description"] = "Every <Cooldown>m, goes to another player\'s random fruit, has a <Chance>% chance to copy a random mutation and apply it to a random fruit you own!"
}
local v187 = {
	["Cooldown"] = {
		["Min"] = 15,
		["Base"] = 1110,
		["Scale"] = -15,
		["Formatter"] = "ColonTime"
	},
	["Chance"] = {
		["Max"] = 36,
		["Base"] = 18,
		["Scale"] = 0.18
	}
}
v186.States = v187
v1.Sly = v186
local v188 = {
	["Description"] = "Every <Cooldown>m, runs in a hamster wheel and boosts crafting speed by <Amount>% for <Duration>s!"
}
local v189 = {
	["Cooldown"] = {
		["Min"] = 15,
		["Base"] = 188,
		["Scale"] = -1.5,
		["Formatter"] = "ColonTime"
	},
	["Amount"] = {
		["Base"] = 30,
		["Scale"] = 0.3
	},
	["Duration"] = {
		["Base"] = 18,
		["Scale"] = 0.5
	}
}
v188.States = v189
v1["Hamster Wheel"] = v188
local v190 = {
	["Description"] = "Crafting speed is increased by <Chance>%!"
}
local v191 = {
	["Chance"] = {
		["Max"] = 25,
		["Base"] = 15,
		["Scale"] = 0.5
	}
}
v190.States = v191
v1.Hamster = v190
local v192 = {
	["Description"] = "Every <Cooldown>m, takes flight and spreads its wings. All eggs advanced their hatch time by <Amount>s! There\'s a <Chance>% chance for the time advance to be multiplied by <Multiplier>."
}
local v193 = {
	["Cooldown"] = {
		["Min"] = 424,
		["Base"] = 424,
		["Scale"] = 0,
		["Formatter"] = "ColonTime"
	},
	["Amount"] = {
		["Max"] = 70.4,
		["Base"] = 70.4,
		["Scale"] = 0
	},
	["Chance"] = {
		["Max"] = 70.4,
		["Base"] = 70.4,
		["Scale"] = 0
	},
	["Multiplier"] = {
		["Base"] = 1.8,
		["Scale"] = 0.18
	}
}
v192.States = v193
v1["Wings of Freedom"] = v192
local v194 = {
	["Description"] = "Every <Cooldown>m, can use its cuteness to hatch eggs faster. All eggs advanced their hatch time by <Amount>s! There\'s a <Chance>% chance for the time advance to be multiplied by <Multiplier>."
}
local v195 = {
	["Cooldown"] = {
		["Min"] = 300,
		["Base"] = 300,
		["Scale"] = 0,
		["Formatter"] = "ColonTime"
	},
	["Amount"] = {
		["Max"] = 150,
		["Base"] = 150,
		["Scale"] = 0
	},
	["Chance"] = {
		["Max"] = 30,
		["Base"] = 30,
		["Scale"] = 0
	},
	["Multiplier"] = {
		["Base"] = 2.5,
		["Scale"] = 0.15
	}
}
v194.States = v195
v1.Birbegg = v194
local v196 = {
	["Description"] = "Every <Cooldown>m, can use its cuteness to hatch eggs faster. All eggs advanced their hatch time by <Amount>s! There\'s a <Chance>% chance for the time advance to be multiplied by <Multiplier>."
}
local v197 = {
	["Cooldown"] = {
		["Min"] = 150,
		["Base"] = 150,
		["Scale"] = 0,
		["Formatter"] = "ColonTime"
	},
	["Amount"] = {
		["Max"] = 300,
		["Base"] = 300,
		["Scale"] = 0
	},
	["Chance"] = {
		["Max"] = 50,
		["Base"] = 50,
		["Scale"] = 0
	},
	["Multiplier"] = {
		["Base"] = 5,
		["Scale"] = 0.25
	}
}
v196.States = v197
v1["Rainbow Birbegg"] = v196
local v198 = {
	["Description"] = "Every <Cooldown>, has a <Chance>% chance to apply the goldsparkle mutation to a nearby fruit!"
}
local v199 = {
	["Cooldown"] = {
		["Min"] = 1000,
		["Base"] = 3000,
		["Scale"] = -7.5,
		["Formatter"] = "ColonTime"
	},
	["Chance"] = {
		["Min"] = 5,
		["Base"] = 15,
		["Scale"] = 0.5
	}
}
v198.States = v199
v1["Sparkle Squack"] = v198
local v200 = {
	["Description"] = "Every <Cooldown>, has a <Chance>% chance to apply the goldsparkle mutation to a nearby fruit!"
}
local v201 = {
	["Cooldown"] = {
		["Min"] = 500,
		["Base"] = 1500,
		["Scale"] = -15,
		["Formatter"] = "ColonTime"
	},
	["Chance"] = {
		["Min"] = 10,
		["Base"] = 35,
		["Scale"] = 1.5
	}
}
v200.States = v201
v1["Rainbow Sparkle Squack"] = v200
local v202 = {
	["Description"] = "<Chance>% chance fruit gets Amber mutation after collecting! Rarer plants have lesser chance to mutate."
}
local v203 = {
	["Chance"] = {
		["Base"] = 2,
		["Scale"] = 0.2
	}
}
v202.States = v203
v1["Clever Claws"] = v202
local v204 = {
	["Description"] = "Grants additional <Chance>% increase to player movement speed!"
}
local v205 = {
	["Chance"] = {
		["Base"] = 14,
		["Scale"] = 0.25
	}
}
v204.States = v205
v1["Raptor Dance"] = v204
local v206 = {
	["Description"] = "Every <Cooldown>m, rams into <Amount> random plants and advance their growth by <GrowthAmount>m! Has a <Chance>% chance to do it again each time."
}
local v207 = {
	["Cooldown"] = {
		["Min"] = 213,
		["Base"] = 213,
		["Scale"] = 0,
		["Formatter"] = "ColonTime"
	},
	["Amount"] = {
		["Max"] = 3,
		["Base"] = 3,
		["Scale"] = 0
	},
	["GrowthAmount"] = {
		["Max"] = 2013,
		["Base"] = 2013,
		["Scale"] = 0,
		["Formatter"] = "ColonTime"
	},
	["Chance"] = {
		["Max"] = 30,
		["Base"] = 15,
		["Scale"] = 0.15
	}
}
v206.States = v207
v1["Tri-Horn"] = v206
local v208 = {
	["Description"] = "<Chance>% chance harvested fruit duplicates! Rarer crops have lower chance to duplicate."
}
local v209 = {
	["Chance"] = {
		["Max"] = 28,
		["Base"] = 8,
		["Scale"] = 0.15
	}
}
v208.States = v209
v1["Prehistoric Doubling"] = v208
local v210 = {
	["Description"] = "<Chance>% extra chance for Prehistoric type fruit to duplicate!"
}
local v211 = {
	["Chance"] = {
		["Max"] = 25,
		["Base"] = 5,
		["Scale"] = 0.1
	}
}
v210.States = v211
v1["Prehistoric Harvester"] = v210
local v212 = {
	["Description"] = "Grants additional <Chance>% increase to player jump height!"
}
local v213 = {
	["Chance"] = {
		["Base"] = 14,
		["Scale"] = 0.25
	}
}
v212.States = v213
v1["Air Time"] = v212
local v214 = {
	["Description"] = "Pets hatched from eggs have a <Chance>% increase in base size and weight! This size bonus is capped at 30% per egg and does not apply to Brontosauruses."
}
local v215 = {
	["Chance"] = {
		["Max"] = 30,
		["Base"] = 5.25,
		["Scale"] = 0.1
	}
}
v214.States = v215
v1["Giant Incubator"] = v214
local v216 = {
	["Description"] = "Every <Cooldown>m, flaps its wings and sends out ripples of wind, causing <Amount> random fruit to get Windstruck, with a <Chance>% chance for Twisted to be applied as well!"
}
local v217 = {
	["Cooldown"] = {
		["Min"] = 15,
		["Base"] = 666,
		["Scale"] = -6,
		["Formatter"] = "ColonTime"
	},
	["Amount"] = {
		["Base"] = 3,
		["Scale"] = 0.15
	},
	["Chance"] = {
		["Base"] = 18.2,
		["Scale"] = 0.25
	}
}
v216.States = v217
v1["Sky Reptile"] = v216
local v218 = {
	["Description"] = "Every <Cooldown>m, devours a random mutation from your garden, then roars, spreading that mutation to <Amount> other random fruits in your garden!"
}
local v219 = {
	["Cooldown"] = {
		["Min"] = 15,
		["Base"] = 1224,
		["Scale"] = -12,
		["Formatter"] = "ColonTime"
	},
	["Amount"] = {
		["Base"] = 3,
		["Scale"] = 0.2
	}
}
v218.States = v219
v1["Apex Predator"] = v218
local v220 = {
	["Description"] = "Every <Cooldown>s, goes to the cosmetic crate with the highest open time, and reduces its open time by <Amount>s! There is a <Chance>% chance for open time reduction to be multiplied by <Multiplier>x"
}
local v221 = {
	["Cooldown"] = {
		["Min"] = 10,
		["Base"] = 82,
		["Scale"] = -1.8
	},
	["Amount"] = {
		["Base"] = 80,
		["Scale"] = 0.65
	},
	["Chance"] = {
		["Base"] = 25.5,
		["Scale"] = 0.25
	},
	["Multiplier"] = {
		["Base"] = 1.5,
		["Scale"] = 0.2
	}
}
v220.States = v221
v1["Crowbar Head"] = v220
local v222 = {
	["Description"] = "All active Dinosaur type pets gain an additional <Chance> XP/s!"
}
local v223 = {
	["Chance"] = {
		["Base"] = 0.6,
		["Scale"] = 0.06
	}
}
v222.States = v223
v1["Dino Herd"] = v222
local v224 = {
	["Description"] = "Grants a <Chance>% chance to duplicate a crafted item!"
}
local v225 = {
	["Chance"] = {
		["Max"] = 25,
		["Base"] = 6,
		["Scale"] = 0.3
	}
}
v224.States = v225
v1["Crafty Dome"] = v224
local v226 = {
	["Description"] = "Every <Cooldown>m opens its frills and spits out venom! The venom spreads to <Number> other random pets, advancing cooldown by <AmountCD> OR granting <AmountXP> xp!"
}
local v227 = {
	["Cooldown"] = {
		["Min"] = 60,
		["Base"] = 846,
		["Scale"] = -8.4,
		["Formatter"] = "ColonTime"
	},
	["Number"] = {
		["Max"] = 5,
		["Base"] = 3,
		["Scale"] = 0.2
	},
	["AmountCD"] = {
		["Max"] = 100,
		["Base"] = 40,
		["Scale"] = 0.25
	},
	["AmountXP"] = {
		["Max"] = 2500,
		["Base"] = 500,
		["Scale"] = 40
	}
}
v226.States = v227
v1["Frilled Reptile"] = v226
local v228 = {
	["Description"] = "When another player steals fruit from you, grants a <Chance>% chance you get the stolen fruit as well!"
}
local v229 = {
	["Chance"] = {
		["Max"] = 35,
		["Base"] = 18.7,
		["Scale"] = 0.25
	}
}
v228.States = v229
v1["Armored Defender"] = v228
local v230 = {
	["Description"] = "Every <Cooldown>m, devours a random mutation from <Amount> fruits in your garden each, then roars, spreading those mutations to 1 random fruit in your garden! Prioritizes applying mutations to a favorited fruit."
}
local v231 = {
	["Cooldown"] = {
		["Min"] = 30,
		["Base"] = 1224,
		["Scale"] = -12,
		["Formatter"] = "ColonTime"
	},
	["Amount"] = {
		["Base"] = 3,
		["Scale"] = 0.2
	}
}
v230.States = v231
v1["Food Chain"] = v230
local v232 = {
	["Description"] = "Every <Cooldown>s, goes to the cosmetic crate with the highest open time, and reduces its open time by <Amount>s! There is a <Chance>% chance for open time reduction to be multiplied by <Multiplier>x"
}
local v233 = {
	["Cooldown"] = {
		["Min"] = 10,
		["Base"] = 41,
		["Scale"] = -0.9
	},
	["Amount"] = {
		["Base"] = 160,
		["Scale"] = 1.3
	},
	["Chance"] = {
		["Base"] = 51,
		["Scale"] = 0.5
	},
	["Multiplier"] = {
		["Base"] = 3,
		["Scale"] = 0.4
	}
}
v232.States = v233
v1["Rainbow Crowbar Head"] = v232
local v234 = {
	["Description"] = "All active Dinosaur type pets gain an additional <Chance> XP/s!"
}
local v235 = {
	["Chance"] = {
		["Base"] = 1.2,
		["Scale"] = 0.12
	}
}
v234.States = v235
v1["Rainbow Dino Herd"] = v234
local v236 = {
	["Description"] = "Grants a <Chance>% chance to duplicate a crafted item!"
}
local v237 = {
	["Chance"] = {
		["Max"] = 50,
		["Base"] = 12,
		["Scale"] = 0.6
	}
}
v236.States = v237
v1["Rainbow Crafty Dome"] = v236
local v238 = {
	["Description"] = "Every <Cooldown>m opens its frills and spits out venom! The venom spreads to <Number> other random pets, advancing cooldown by <AmountCD> OR granting <AmountXP> xp!"
}
local v239 = {
	["Cooldown"] = {
		["Min"] = 60,
		["Base"] = 643,
		["Scale"] = -6.4,
		["Formatter"] = "ColonTime"
	},
	["Number"] = {
		["Max"] = 12,
		["Base"] = 3,
		["Scale"] = 0.2
	},
	["AmountCD"] = {
		["Max"] = 160,
		["Base"] = 80,
		["Scale"] = 1
	},
	["AmountXP"] = {
		["Max"] = 6000,
		["Base"] = 1000,
		["Scale"] = 80
	}
}
v238.States = v239
v1["Rainbow Frilled Reptile"] = v238
local v240 = {
	["Description"] = "When another player steals fruit from you, grants a <Chance>% chance you get the stolen fruit as well!"
}
local v241 = {
	["Chance"] = {
		["Max"] = 60,
		["Base"] = 31.4,
		["Scale"] = 0.5
	}
}
v240.States = v241
v1["Rainbow Armored Defender"] = v240
local v242 = {
	["Description"] = "Every <Cooldown>m, devours a random mutation from <Amount> fruits in your garden each, then roars, spreading those mutations to 1 random fruit in your garden! Prioritizes applying mutations to a favorited fruit."
}
local v243 = {
	["Cooldown"] = {
		["Min"] = 30,
		["Base"] = 912,
		["Scale"] = -12,
		["Formatter"] = "ColonTime"
	},
	["Amount"] = {
		["Max"] = 20,
		["Base"] = 6,
		["Scale"] = 0.4
	}
}
v242.States = v243
v1["Rainbow Food Chain"] = v242
local v244 = {
	["Description"] = "Every <Cooldown>s, <Chance>% chance to dig up a random seed!"
}
local v245 = {
	["Cooldown"] = {
		["Min"] = 5,
		["Base"] = 60,
		["Scale"] = -1
	},
	["Chance"] = {
		["Base"] = 15,
		["Scale"] = 0.05
	}
}
v244.States = v245
v1["Man\'s Best Tomodachi"] = v244
local v246 = {
	["Description"] = "As long as you have a Hot Spring cosmetic in your garden: The pet bathes in it to relax."
}
local v247 = {
	["Boost"] = {
		["Max"] = 0,
		["Base"] = 0,
		["Scale"] = 0
	}
}
v246.States = v247
v1["Bathe Time"] = v246
local v248 = {
	["Description"] = "Every <Cooldown>m, causes mischief, doing random different actions in your garden!"
}
local v249 = {
	["Cooldown"] = {
		["Min"] = 80,
		["Base"] = 640,
		["Scale"] = -3.6,
		["Formatter"] = "ColonTime"
	}
}
v248.States = v249
v1.Mischief = v248
local v250 = {
	["Description"] = "Every <Cooldown>m, meditates for <Duration>s, nearby fruits in a <Range> studs have a <Chance>% chance every second to mutate into Tranquil!"
}
local v251 = {
	["Cooldown"] = {
		["Min"] = 60,
		["Base"] = 627,
		["Scale"] = -1,
		["Formatter"] = "ColonTime"
	},
	["Duration"] = {
		["Base"] = 10,
		["Scale"] = 0.1
	},
	["Range"] = {
		["Base"] = 15,
		["Scale"] = 0.1
	},
	["Chance"] = {
		["Base"] = 5,
		["Scale"] = 0.05
	}
}
v250.States = v251
v1["Balance and Harmony"] = v250
local v252 = {
	["Description"] = "Every <Cooldown>m, sprays water on all fruits within <Range> studs, applying Wet mutation. Has a <Chance>% to replace Wet mutations already on fruit with Bloodlit mutation!"
}
local v253 = {
	["Cooldown"] = {
		["Min"] = 60,
		["Base"] = 514,
		["Scale"] = -4,
		["Formatter"] = "ColonTime"
	},
	["Range"] = {
		["Max"] = 50,
		["Base"] = 20,
		["Scale"] = 0.2
	},
	["Chance"] = {
		["Max"] = 30,
		["Base"] = 10,
		["Scale"] = 0.1
	}
}
v252.States = v253
v1["Water Spirit"] = v252
local v254 = {
	["Description"] = "Every <Cooldown>m, goes to another player\'s crop, mutates it with <font color=\"rgb(255, 80, 65)\">Chakra</font> then steals and gives it to you! Very rare chance to mutate with <font color=\"rgb(255, 0, 0)\">Foxfire Chakra</font> mutation instead!"
}
local v255 = {
	["Cooldown"] = {
		["Min"] = 60,
		["Base"] = 1344.5,
		["Scale"] = -6,
		["Formatter"] = "ColonTime"
	}
}
v254.States = v255
v1["Nine-Tailed Myth"] = v254
local v256 = {
	["Description"] = "Every <Cooldown>m, goes to another player\'s crop, mutates it with <font color=\"rgb(255, 80, 65)\">Cute</font> then steals and gives it to you! Very rare chance to mutate with <font color=\"rgb(255, 0, 0)\">Heartbound</font> mutation instead!"
}
local v257 = {
	["Cooldown"] = {
		["Min"] = 60,
		["Base"] = 3000,
		["Scale"] = -6,
		["Formatter"] = "ColonTime"
	}
}
v256.States = v257
v1["Tough Love"] = v256
local v258 = {
	["Description"] = "When hatching eggs there is a <Chance>% chance to get the egg back! Cannot recover Premium/Exotic/Rainbow Eggs. This bonus is capped at 50% per egg hatched."
}
local v259 = {
	["Chance"] = {
		["Max"] = 50,
		["Base"] = 1,
		["Scale"] = 0.22
	}
}
v258.States = v259
v1["Fish of Fortune"] = v258
local v260 = {
	["Description"] = "Every <Cooldown>s, runs to the Gear Shop or Seed Shop (whichever is farther) and does a touchdown which awards you with 870 Sheckles or <Chance>% chance for a Watering Can instead!"
}
local v261 = {
	["Cooldown"] = {
		["Min"] = 87,
		["Base"] = 87,
		["Scale"] = 0
	},
	["Chance"] = {
		["Max"] = 35,
		["Base"] = 20,
		["Scale"] = 0.33
	}
}
v260.States = v261
v1.Touchdown = v260
local v262 = {
	["Description"] = "Every <Cooldown>m, waves and invites good fortune that grants <Chance>% chance to refund fruit back to your inventory for <Duration>s! Rarer fruit have rarer chance to refund."
}
local v263 = {
	["Cooldown"] = {
		["Min"] = 30,
		["Base"] = 143,
		["Scale"] = -0.6,
		["Formatter"] = "ColonTime"
	},
	["Chance"] = {
		["Max"] = 20,
		["Base"] = 8,
		["Scale"] = 0.15
	},
	["Duration"] = {
		["Max"] = 22,
		["Base"] = 10,
		["Scale"] = 0.25
	}
}
v262.States = v263
v1["Fortune Cat"] = v262
local v264 = {
	["Description"] = "<Chance>% chance Zen type fruit gets Tranquil mutation after collecting!"
}
local v265 = {
	["Chance"] = {
		["Max"] = 12,
		["Base"] = 6,
		["Scale"] = 0.33
	}
}
v264.States = v265
v1["Tree Spirit"] = v264
local v266 = {
	["Description"] = "<Chance>% chance Zen type fruit gets Corrupt mutation after collecting!"
}
local v267 = {
	["Chance"] = {
		["Max"] = 12,
		["Base"] = 6,
		["Scale"] = 0.33
	}
}
v266.States = v267
v1["Corrupted Tree Spirit"] = v266
local v268 = {
	["Description"] = "Every <Cooldown>m, devours a fruit with Shocked mutation for 1.5x sheckle value to Summon a chain of lightning to mutate <Amount> fruits with Static! During a Thunderstorm: <Chance>% chance for Shocked instead!"
}
local v269 = {
	["Cooldown"] = {
		["Min"] = 60,
		["Base"] = 622,
		["Scale"] = -2.6,
		["Formatter"] = "ColonTime"
	},
	["Amount"] = {
		["Max"] = 9,
		["Base"] = 4,
		["Scale"] = 0.15
	},
	["Chance"] = {
		["Max"] = 35,
		["Base"] = 20,
		["Scale"] = 0.15
	}
}
v268.States = v269
v1["Lightning Beast"] = v268
local v270 = {
	["Description"] = "Every <Cooldown>m, launches cursed energy at 9 different fruits. Each fruit has <Chance>% to mutate with <font color=\"rgb(0, 85, 255)\">Corrupt Chakra</font> with a very rare chance for <font color=\"rgb(0, 0, 255)\">Corrupt Foxfire Chakra</font> instead!"
}
local v271 = {
	["Cooldown"] = {
		["Min"] = 60,
		["Base"] = 1260,
		["Scale"] = -3.6,
		["Formatter"] = "ColonTime"
	},
	["Chance"] = {
		["Max"] = 40,
		["Base"] = 20,
		["Scale"] = 0.2
	}
}
v270.States = v271
v1["Nine-Tailed Curse"] = v270
local v272 = {
	["Description"] = "Every <Cooldown>m, waves and invites good fortune that grants <Chance>% chance to refund fruit back to your inventory for <Duration>s! Rarer fruit have rarer chance to refund."
}
local v273 = {
	["Cooldown"] = {
		["Min"] = 15,
		["Base"] = 72,
		["Scale"] = -0.6,
		["Formatter"] = "ColonTime"
	},
	["Chance"] = {
		["Max"] = 30,
		["Base"] = 15,
		["Scale"] = 0.3
	},
	["Duration"] = {
		["Max"] = 42,
		["Base"] = 20,
		["Scale"] = 0.25
	}
}
v272.States = v273
v1["Rainbow Fortune Cat"] = v272
local v274 = {
	["Description"] = "<Chance>% chance Zen type fruit gets Tranquil mutation after collecting!"
}
local v275 = {
	["Chance"] = {
		["Max"] = 16,
		["Base"] = 8,
		["Scale"] = 0.4
	}
}
v274.States = v275
v1["Rainbow Tree Spirit"] = v274
local v276 = {
	["Description"] = "Every <Cooldown>m, launches cursed energy at 9 different fruits. Each fruit has <Chance>% to mutate with <font color=\"rgb(0, 85, 255)\">Corrupt Chakra</font> with a very rare chance for <font color=\"rgb(0, 0, 255)\">Corrupt Foxfire Chakra</font> instead!"
}
local v277 = {
	["Cooldown"] = {
		["Min"] = 30,
		["Base"] = 630,
		["Scale"] = -3.6,
		["Formatter"] = "ColonTime"
	},
	["Chance"] = {
		["Max"] = 50,
		["Base"] = 25,
		["Scale"] = 0.2
	}
}
v276.States = v277
v1["Rainbow Nine-Tailed Curse"] = v276
local v278 = {
	["Description"] = "Every <Cooldown>s, eats a carrot for <Multiplier>x value bonus!"
}
local v279 = {
	["Cooldown"] = {
		["Min"] = 5,
		["Base"] = 45,
		["Scale"] = -1
	},
	["Multiplier"] = {
		["Base"] = 5,
		["Scale"] = 0.05
	}
}
v278.States = v279
v1["Bagel and Carrots"] = v278
local v280 = {
	["Description"] = "Every <Cooldown>s, digs down underground to find treasure. Can dig up gear or sheckles!"
}
local v281 = {
	["Cooldown"] = {
		["Min"] = 10,
		["Base"] = 80,
		["Scale"] = -1
	}
}
v280.States = v281
v1["Pancake Hunter"] = v280
local v282 = {
	["Description"] = "Every <Cooldown>s, <Chance>% chance a nearby fruit becomes Chilled or Frozen"
}
local v283 = {
	["Cooldown"] = {
		["Min"] = 10,
		["Base"] = 80,
		["Scale"] = -1
	},
	["Chance"] = {
		["Base"] = 15,
		["Scale"] = 0.15
	}
}
v282.States = v283
v1["Sushi Express"] = v282
local v284 = {
	["Description"] = "Every <Cooldown>m, flings sushi towards a random pet and feeds it for <Amount>% of its hunger"
}
local v285 = {
	["Cooldown"] = {
		["Min"] = 60,
		["Base"] = 670,
		["Scale"] = -3.5,
		["Formatter"] = "ColonTime"
	},
	["Amount"] = {
		["Max"] = 0.5,
		["Base"] = 0.01,
		["Scale"] = 0.001,
		["Formatter"] = "Percentage"
	}
}
v284.States = v285
v1["Sushi Time"] = v284
local v286 = {
	["Description"] = "Every <Cooldown>m, goes to a nearby fruit and does-a-cooking! Applying Pasta, Sauce or Meatball mutation!"
}
local v287 = {
	["Cooldown"] = {
		["Min"] = 200,
		["Base"] = 845,
		["Scale"] = -7.5,
		["Formatter"] = "ColonTime"
	}
}
v286.States = v287
v1["Al dente"] = v286
local v288 = {
	["Description"] = "Every <Cooldown>m, increases a random pet\'s level by 1! Ability cannot be mimicked or refreshed."
}
local v289 = {
	["Cooldown"] = {
		["Min"] = 1200,
		["Base"] = 3632,
		["Scale"] = -36,
		["Formatter"] = "ColonTime"
	}
}
v288.States = v289
v1["Friendly Frier"] = v288
local v290 = {
	["Description"] = "All active Food type pets gain an additional <Chance> XP/s!"
}
local v291 = {
	["Chance"] = {
		["Base"] = 0.75,
		["Scale"] = 0.15
	}
}
v290.States = v291
v1["Mochi Marathon"] = v290
local v292 = {
	["Description"] = "Every <Cooldown>m, <Chance>% chance a nearby fruit gets the Oil mutation!"
}
local v293 = {
	["Cooldown"] = {
		["Min"] = 15,
		["Base"] = 906,
		["Scale"] = -12,
		["Formatter"] = "ColonTime"
	},
	["Chance"] = {
		["Max"] = 30,
		["Base"] = 14,
		["Scale"] = 0.25
	}
}
v292.States = v293
v1["OIL OR BOIL"] = v292
local v294 = {
	["Description"] = "Every <Cooldown>s, emits an aura for <Duration>s granting <Multiplier>x chance for new fruit to grow as variants within <Range> studs!"
}
local v295 = {
	["Cooldown"] = {
		["Min"] = 5,
		["Base"] = 120,
		["Scale"] = -1
	},
	["Duration"] = {
		["Base"] = 15,
		["Scale"] = 0.15
	},
	["Range"] = {
		["Base"] = 15,
		["Scale"] = 0.15
	},
	["Multiplier"] = {
		["Base"] = 2,
		["Scale"] = 0.01
	}
}
v294.States = v295
v1["Bacon Frenzy"] = v294
local v296 = {
	["Description"] = "Every <Cooldown>m, drops a <Radius> stud mustard or ketchup puddle that lasts <Duration> seconds. Pets on mustard have their cooldowns tick by <Amount> faster and pets on ketchup gain <Multiplier>% more experience!"
}
local v297 = {
	["Cooldown"] = {
		["Min"] = 80,
		["Base"] = 240,
		["Scale"] = -1.5,
		["Formatter"] = "ColonTime"
	},
	["Multiplier"] = {
		["Max"] = 0.4,
		["Base"] = 0.2,
		["Scale"] = 0.01,
		["Formatter"] = "Percentage"
	},
	["Amount"] = {
		["Max"] = 0.5,
		["Base"] = 0.06,
		["Scale"] = 0.05
	},
	["Duration"] = {
		["Max"] = 45,
		["Base"] = 30,
		["Scale"] = 0.15
	},
	["Radius"] = {
		["Max"] = 16,
		["Base"] = 8,
		["Scale"] = 0.08
	}
}
v296.States = v297
v1["Loaded Dog"] = v296
local v298 = {
	["Description"] = "Every <Cooldown>m, <Chance>% chance a nearby fruit becomes Molten!"
}
local v299 = {
	["Cooldown"] = {
		["Min"] = 300,
		["Base"] = 900,
		["Scale"] = -4.5,
		["Formatter"] = "ColonTime"
	},
	["Chance"] = {
		["Base"] = 20,
		["Scale"] = 0.1
	}
}
v298.States = v299
v1["Molten Boiling Point"] = v298
local v300 = {
	["Description"] = "Every <Cooldown>m, <Chance>% chance a nearby fruit becomes Meteoric!"
}
local v301 = {
	["Cooldown"] = {
		["Min"] = 500,
		["Base"] = 1800,
		["Scale"] = -8.5,
		["Formatter"] = "ColonTime"
	},
	["Chance"] = {
		["Base"] = 10,
		["Scale"] = 0.1
	}
}
v300.States = v301
v1["Meteoric Boiling Point"] = v300
local v302 = {
	["Description"] = "Every <Cooldown>s, emits an aura for <Duration>s granting <Multiplier>x chance for new fruit to grow as variants within <Range> studs!"
}
local v303 = {
	["Cooldown"] = {
		["Min"] = 5,
		["Base"] = 80,
		["Scale"] = -1
	},
	["Duration"] = {
		["Base"] = 30,
		["Scale"] = 0.15
	},
	["Range"] = {
		["Base"] = 30,
		["Scale"] = 0.15
	},
	["Multiplier"] = {
		["Base"] = 3,
		["Scale"] = 0.01
	}
}
v302.States = v303
v1["Rainbow Bacon Frenzy"] = v302
local v304 = {
	["Description"] = "Every <Cooldown>m, drops a <Radius> stud mustard or ketchup puddle that lasts <Duration> seconds. Pets on mustard have their cooldowns tick by <Amount> faster and pets on ketchup gain <Multiplier>% more experience!"
}
local v305 = {
	["Cooldown"] = {
		["Min"] = 60,
		["Base"] = 200,
		["Scale"] = -1.5,
		["Formatter"] = "ColonTime"
	},
	["Multiplier"] = {
		["Max"] = 0.4,
		["Base"] = 0.3,
		["Scale"] = 0.01,
		["Formatter"] = "Percentage"
	},
	["Amount"] = {
		["Max"] = 0.75,
		["Base"] = 0.09,
		["Scale"] = 0.075
	},
	["Duration"] = {
		["Max"] = 60,
		["Base"] = 45,
		["Scale"] = 0.15
	},
	["Radius"] = {
		["Max"] = 32,
		["Base"] = 16,
		["Scale"] = 0.08
	}
}
v304.States = v305
v1["Rainbow Loaded Dog"] = v304
local v306 = {
	["Description"] = "Every <Cooldown>m, <Chance>% chance a nearby fruit becomes Molten!"
}
local v307 = {
	["Cooldown"] = {
		["Min"] = 200,
		["Base"] = 700,
		["Scale"] = -4.5,
		["Formatter"] = "ColonTime"
	},
	["Chance"] = {
		["Base"] = 40,
		["Scale"] = 0.2
	}
}
v306.States = v307
v1["Rainbow Molten Boiling Point"] = v306
local v308 = {
	["Description"] = "Every <Cooldown>m, <Chance>% chance a nearby fruit becomes Meteoric!"
}
local v309 = {
	["Cooldown"] = {
		["Min"] = 400,
		["Base"] = 1400,
		["Scale"] = -8.5,
		["Formatter"] = "ColonTime"
	},
	["Chance"] = {
		["Base"] = 20,
		["Scale"] = 0.2
	}
}
v308.States = v309
v1["Rainbow Meteoric Boiling Point"] = v308
local v310 = {
	["Description"] = "As long as you have a Cooking Pot cosmetic or Cooking Cauldron cosmetic in your garden: The Gorilla cooks in it and grants <Boost>% to duplicate food on cook!"
}
local v311 = {
	["Boost"] = {
		["Max"] = 10,
		["Base"] = 5,
		["Scale"] = 0.1
	}
}
v310.States = v311
v1["King Cook"] = v310
v1["Trade-In"] = {
	["Description"] = "When selling this pet: Has a small chance to get a Beanstalk seed!",
	["States"] = {}
}
local v312 = {
	["Description"] = "Every <Cooldown>s, thumps its feet and has a <Chance>% chance to mutate a nearby fruit, applying the Sandy mutation!"
}
local v313 = {
	["Cooldown"] = {
		["Min"] = 50,
		["Base"] = 100,
		["Scale"] = -0.25
	},
	["Chance"] = {
		["Base"] = 15,
		["Scale"] = 0.25
	}
}
v312.States = v313
v1.Thumper = v312
local v314 = {
	["Description"] = "Every <Cooldown>m, swaps mutations between two different random fruits! Ignores favorited fruit."
}
local v315 = {
	["Cooldown"] = {
		["Min"] = 300,
		["Base"] = 552,
		["Scale"] = -1,
		["Formatter"] = "ColonTime"
	}
}
v314.States = v315
v1.Sprout = v314
local v316 = {
	["Description"] = "Every <Cooldown>m goes to the mutation machine and tinkers with it and advances its time by <Amount>s!"
}
local v317 = {
	["Cooldown"] = {
		["Min"] = 200,
		["Base"] = 400,
		["Scale"] = -1,
		["Formatter"] = "ColonTime"
	},
	["Amount"] = {
		["Max"] = 80,
		["Base"] = 40,
		["Scale"] = 0.5
	}
}
v316.States = v317
v1["Tech Savvy"] = v316
local v318 = {
	["Description"] = "Every <Cooldown>m, lays a Golden Egg plant that starts with the Fortune mutation. It can be harvested and mutates like other plants. Selling it may apply Fortune mutation to a fruit in your garden!"
}
local v319 = {
	["Cooldown"] = {
		["Min"] = 300,
		["Base"] = 788,
		["Scale"] = -1.5,
		["Formatter"] = "ColonTime"
	}
}
v318.States = v319
v1["Golden Laying"] = v318
local v320 = {
	["Description"] = "Every <Cooldown>m, spreads its roots and all fruit within <Range> studs have a <Chance>% to get the Bloom mutation!"
}
local v321 = {
	["Cooldown"] = {
		["Min"] = 600,
		["Base"] = 1330,
		["Scale"] = -6,
		["Formatter"] = "ColonTime"
	},
	["Chance"] = {
		["Max"] = 30,
		["Base"] = 15,
		["Scale"] = 0.15
	},
	["Range"] = {
		["Max"] = 60,
		["Base"] = 30,
		["Scale"] = 0.3
	}
}
v320.States = v321
v1.Overgrowth = v320
local v322 = {
	["Description"] = "Every <Cooldown>m, flies to a nearby fruit and Plasmafies it, applying Plasma mutation!"
}
local v323 = {
	["Cooldown"] = {
		["Min"] = 200,
		["Base"] = 1500,
		["Scale"] = -6.6,
		["Formatter"] = "ColonTime"
	}
}
v322.States = v323
v1["Peach Pollinator"] = v322
local v324 = {
	["Description"] = "Every <Cooldown>m, stings a random pet and advances its ability cooldown by <Amount>s!"
}
local v325 = {
	["Cooldown"] = {
		["Min"] = 300,
		["Base"] = 602,
		["Scale"] = -3.5,
		["Formatter"] = "ColonTime"
	},
	["Amount"] = {
		["Max"] = 120,
		["Base"] = 60,
		["Scale"] = 0.6
	}
}
v324.States = v325
v1["Peach Stinger"] = v324
local v326 = {
	["Description"] = "Fruits that have apple in the name have a <Chance>% chance to duplicate when collected"
}
local v327 = {
	["Chance"] = {
		["Max"] = 8,
		["Base"] = 4,
		["Scale"] = 0.025
	}
}
v326.States = v327
v1["Apple Harvester"] = v326
local v328 = {
	["Description"] = "Harvesting Sugar Apple crops have a <Chance>% to apply Warped mutation to a random fruit in your garden!"
}
local v329 = {
	["Chance"] = {
		["Max"] = 4,
		["Base"] = 2,
		["Scale"] = 0.05
	}
}
v328.States = v329
v1["Sugar Warp"] = v328
local v330 = {
	["Description"] = "Every <Cooldown>m, roars whilst applying the Brainrot mutation to a random fruit!"
}
local v331 = {
	["Cooldown"] = {
		["Min"] = 300,
		["Max"] = 300,
		["Base"] = 912,
		["Scale"] = -3.5,
		["Formatter"] = "ColonTime"
	}
}
v330.States = v331
v1["Brain-Roar"] = v330
local v332 = {
	["Description"] = "Every <Cooldown>m, roars and infuses a random pet with citrus, granting <Amount> bonus experience!"
}
local v333 = {
	["Cooldown"] = {
		["Min"] = 200,
		["Base"] = 600,
		["Scale"] = -2.5,
		["Formatter"] = "ColonTime"
	},
	["Amount"] = {
		["Max"] = 2500,
		["Base"] = 1500,
		["Scale"] = 15
	}
}
v332.States = v333
v1["Citrus Roar"] = v332
local v334 = {
	["Description"] = "Every <Cooldown>m, sacrifices a random Beanstalk fruit in your garden to instantly grow a random plant with <Multiplier>x fruit size bonus! Ability cannot be mimicked or refreshed."
}
local v335 = {
	["Cooldown"] = {
		["Min"] = 870,
		["Base"] = 1800,
		["Scale"] = -9,
		["Formatter"] = "ColonTime"
	},
	["Multiplier"] = {
		["Max"] = 10,
		["Base"] = 5,
		["Scale"] = 0.1
	}
}
v334.States = v335
v1["Bean for the Bean God"] = v334
local v336 = {
	["Description"] = "<Chance>% chance berry fruit stays after collecting! Rarer plants have a rarer chance to replant"
}
local v337 = {
	["Chance"] = {
		["Max"] = 5,
		["Base"] = 2.5,
		["Scale"] = 0.025
	}
}
v336.States = v337
v1["Elk Forester"] = v336
local v338 = {
	["Description"] = "Harvesting Mandrake crops have a <Chance>% to apply Rot mutation to a random fruit in your garden!"
}
local v339 = {
	["Chance"] = {
		["Max"] = 7,
		["Base"] = 3.5,
		["Scale"] = 0.05
	}
}
v338.States = v339
v1["Mandrake Essence"] = v338
local v340 = {
	["Description"] = "Every <Cooldown>m, flaunts its wings and releases a Cyclone. Pets struck have cooldown advanced by <CooldownAmount>s and fruits struck have a <Chance>% to get the Cyclonic mutation!"
}
local v341 = {
	["Cooldown"] = {
		["Min"] = 300,
		["Base"] = 935,
		["Scale"] = -2,
		["Formatter"] = "ColonTime"
	},
	["CycloneAmount"] = {
		["Max"] = 1,
		["Base"] = 1,
		["Scale"] = 0
	},
	["CooldownAmount"] = {
		["Max"] = 125,
		["Base"] = 65,
		["Scale"] = 1
	},
	["Chance"] = {
		["Max"] = 30,
		["Base"] = 10,
		["Scale"] = 0.15
	}
}
v340.States = v341
v1["Glorious Wings"] = v340
local v342 = {
	["Description"] = "Every <Cooldown>m, has a <Chance>% chance to mutate a random fruit with the Gnomed mutation. Gains additional <Amount>% chance for every Gnome cosmetic in your garden."
}
local v343 = {
	["Cooldown"] = {
		["Min"] = 200,
		["Base"] = 600,
		["Scale"] = -1.5,
		["Formatter"] = "ColonTime"
	},
	["Chance"] = {
		["Max"] = 3,
		["Base"] = 1,
		["Scale"] = 0.025
	},
	["Amount"] = {
		["Max"] = 3,
		["Base"] = 1,
		["Scale"] = 0.025
	}
}
v342.States = v343
v1["Gnome Collector"] = v342
local v344 = {
	["Description"] = "<Chance>% chance berry fruit stays after collecting! Rarer plants haves have rarer chance to replant"
}
local v345 = {
	["Chance"] = {
		["Max"] = 10,
		["Base"] = 5,
		["Scale"] = 0.05
	}
}
v344.States = v345
v1["Rainbow Elk Forester"] = v344
local v346 = {
	["Description"] = "Harvesting Mandrake crops have a <Chance>% to apply Rot mutation to a random fruit in your garden!"
}
local v347 = {
	["Chance"] = {
		["Max"] = 14,
		["Base"] = 7,
		["Scale"] = 0.15
	}
}
v346.States = v347
v1["Rainbow Mandrake Essence"] = v346
local v348 = {
	["Description"] = "Every <Cooldown>m, flaunts its wings and releases 2 Cyclones. Pets struck have cooldown advanced by <CooldownAmount>s and fruits struck have a <Chance>% to get the Cyclonic mutation!"
}
local v349 = {
	["Cooldown"] = {
		["Min"] = 150,
		["Base"] = 615,
		["Scale"] = -2,
		["Formatter"] = "ColonTime"
	},
	["CycloneAmount"] = {
		["Max"] = 2,
		["Base"] = 2,
		["Scale"] = 0
	},
	["CooldownAmount"] = {
		["Max"] = 200,
		["Base"] = 100,
		["Scale"] = 1.5
	},
	["Chance"] = {
		["Max"] = 50,
		["Base"] = 18,
		["Scale"] = 0.18
	}
}
v348.States = v349
v1["Rainbow Glorious Wings"] = v348
local v350 = {
	["Description"] = "All flower type plants grow <Multiplier>x faster!"
}
local v351 = {
	["Range"] = {
		["Max"] = 30,
		["Base"] = 30,
		["Scale"] = 0
	},
	["Multiplier"] = {
		["Max"] = 4,
		["Base"] = 1.45,
		["Scale"] = 0.05
	}
}
v350.States = v351
v1["Flower Fortune"] = v350
local v352 = {
	["Description"] = "Every <Cooldown>m, spreads pixie dust for <Duration>s. All plants within <Range> studs will advance growth an extra 30 seconds every second! Also makes nearby players levitate!"
}
local v353 = {
	["Cooldown"] = {
		["Min"] = 100,
		["Base"] = 222,
		["Scale"] = -2.4,
		["Formatter"] = "ColonTime"
	},
	["Duration"] = {
		["Max"] = 30,
		["Base"] = 15,
		["Scale"] = 0.05
	},
	["Range"] = {
		["Max"] = 30,
		["Base"] = 15,
		["Scale"] = 0.25
	}
}
v352.States = v353
v1["Pixie Dust"] = v352
local v354 = {
	["Description"] = "Every 6:66m, the Imp will playfully invite you to chase it. Catching the Imp will grant a random reward! The Imp has a <Chance>% to play again on successful chase!"
}
local v355 = {
	["Cooldown"] = {
		["Max"] = 426,
		["Min"] = 426,
		["Base"] = 426,
		["Scale"] = 0,
		["Formatter"] = "ColonTime"
	},
	["Chance"] = {
		["Max"] = 30,
		["Base"] = 15,
		["Scale"] = 0.05
	}
}
v354.States = v355
v1.Scamp = v354
local v356 = {
	["Description"] = "Every <Cooldown>m, flies to a nearby fruit and enchants it, applying Glimmering mutation!"
}
local v357 = {
	["Cooldown"] = {
		["Min"] = 60,
		["Base"] = 220,
		["Scale"] = -1,
		["Formatter"] = "ColonTime"
	}
}
v356.States = v357
v1.Glimmer = v356
local v358 = {
	["Description"] = "Every <Cooldown>m, screeches and all fruits within <Range> studs have a <Chance>% chance to turn Silver; <GoldChance>% chance to turn Gold!"
}
local v359 = {
	["Cooldown"] = {
		["Min"] = 400,
		["Base"] = 1000,
		["Scale"] = -5,
		["Formatter"] = "ColonTime"
	},
	["Range"] = {
		["Max"] = 40,
		["Base"] = 20,
		["Scale"] = 0.25
	},
	["Chance"] = {
		["Max"] = 40,
		["Base"] = 20,
		["Scale"] = 0.05
	},
	["GoldChance"] = {
		["Max"] = 3,
		["Base"] = 1,
		["Scale"] = 0.01
	}
}
v358.States = v359
v1["Silver Screech"] = v358
local v360 = {
	["Description"] = "Every <Cooldown>m, spits at <Amount> different fruit/eggs/pets. Fruits get Toxic mutation, eggs advance by <AmountEgg> seconds, pets gain <AmountXP> XP."
}
local v361 = {
	["Cooldown"] = {
		["Min"] = 180,
		["Base"] = 625,
		["Scale"] = -3.5,
		["Formatter"] = "ColonTime"
	},
	["Amount"] = {
		["Max"] = 10,
		["Base"] = 5,
		["Scale"] = 0.1
	},
	["AmountEgg"] = {
		["Max"] = 150,
		["Base"] = 80,
		["Scale"] = 0.5
	},
	["AmountXP"] = {
		["Max"] = 1500,
		["Base"] = 800,
		["Scale"] = 2.5
	}
}
v360.States = v361
v1["Venom Spit"] = v360
local v362 = {
	["Description"] = "All Magical type plants grow <Multiplier>x faster"
}
local v363 = {
	["Range"] = {
		["Max"] = 30,
		["Base"] = 30,
		["Scale"] = 0
	},
	["Multiplier"] = {
		["Max"] = 4,
		["Base"] = 1.5,
		["Scale"] = 0.05
	}
}
v362.States = v363
v1["Magical Friend"] = v362
local v364 = {
	["Description"] = "All nearby plants within <Range> studs will have increased <Multiplier>x size bonus for every Fungus type plant planted in your garden! (Max 300)."
}
local v365 = {
	["Range"] = {
		["Max"] = 40,
		["Base"] = 14.75,
		["Scale"] = 0.25
	},
	["Multiplier"] = {
		["Max"] = 0.01,
		["Base"] = 0.004,
		["Scale"] = 0.001,
		["Formatter"] = "NoPrecision"
	}
}
v364.States = v365
v1["Mushroom Madness"] = v364
local v366 = {
	["Description"] = "Pets taken from the pet mutation machine have a bonus 1 - <Chance> age to their age value!"
}
local v367 = {
	["Chance"] = {
		["Max"] = 9,
		["Base"] = 4.8,
		["Scale"] = 0.1
	}
}
v366.States = v367
v1["Bird of Rebirth"] = v366
local v368 = {
	["Description"] = ""
}
local v369 = {
	["Chance"] = {
		["Max"] = 1,
		["Base"] = 1,
		["Scale"] = 0
	}
}
v368.States = v369
v1["Bird of Rebirth Min"] = v368
local v370 = {
	["Description"] = "Every <Cooldown>m, travels between <Amount> random fruit in your garden which get the Flaming mutation! Fruits passed have <Chance>% chance to mutated as well!"
}
local v371 = {
	["Cooldown"] = {
		["Min"] = 60,
		["Base"] = 460,
		["Scale"] = -2.5,
		["Formatter"] = "ColonTime"
	},
	["Chance"] = {
		["Max"] = 40,
		["Base"] = 20,
		["Scale"] = 0.2
	},
	["Amount"] = {
		["Max"] = 8,
		["Base"] = 4,
		["Scale"] = 0.1
	}
}
v370.States = v371
v1.Icarus = v370
local v372 = {
	["Description"] = "As long as you have a Wisp Well cosmetic in your garden: The Wisp will go to it to grant all other pets an additional bonus <Amount> xp per second"
}
local v373 = {
	["Amount"] = {
		["Max"] = 6.5,
		["Base"] = 0.64,
		["Scale"] = 0.1
	}
}
v372.States = v373
v1["Will-o-the-Wisp"] = v372
local v374 = {
	["Description"] = "Goes to any active Cooking Kit and breathes fire on it, helping the cooking process and boosting cooking speed by <Amount>%!"
}
local v375 = {
	["Amount"] = {
		["Max"] = 0.2,
		["Base"] = 0.1,
		["Scale"] = 0.01,
		["Formatter"] = "Percentage"
	}
}
v374.States = v375
v1.Flambe = v374
local v376 = {
	["Description"] = "Every <Cooldown>m, flies to a nearby fruit and enchants it, applying Luminous mutation!"
}
local v377 = {
	["Cooldown"] = {
		["Min"] = 120,
		["Base"] = 920,
		["Scale"] = -3.5,
		["Formatter"] = "ColonTime"
	}
}
v376.States = v377
v1.Illuminate = v376
local v378 = {
	["Description"] = "All Magical type plants grow <Multiplier>x faster"
}
local v379 = {
	["Range"] = {
		["Max"] = 60,
		["Base"] = 45,
		["Scale"] = 0
	},
	["Multiplier"] = {
		["Max"] = 6.5,
		["Base"] = 2,
		["Scale"] = 0.1
	}
}
v378.States = v379
v1["Rainbow Magical Friend"] = v378
local v380 = {
	["Description"] = "All nearby plants within <Range> studs will have increased <Multiplier>x size bonus for every Fungus type plant planted in your garden! (Max 300)."
}
local v381 = {
	["Range"] = {
		["Max"] = 60,
		["Base"] = 14.75,
		["Scale"] = 0.35
	},
	["Multiplier"] = {
		["Max"] = 0.01,
		["Base"] = 0.004,
		["Scale"] = 0.001,
		["Formatter"] = "NoPrecision"
	}
}
v380.States = v381
v1["Rainbow Mushroom Madness"] = v380
local v382 = {
	["Description"] = "Pets taken from the pet mutation machine have a bonus 2 - <Chance> age to their age value!"
}
local v383 = {
	["Chance"] = {
		["Max"] = 13,
		["Base"] = 5.8,
		["Scale"] = 0.1
	}
}
v382.States = v383
v1["Rainbow Bird of Rebirth"] = v382
local v384 = {
	["Description"] = ""
}
local v385 = {
	["Chance"] = {
		["Max"] = 2,
		["Base"] = 2,
		["Scale"] = 0
	}
}
v384.States = v385
v1["Rainbow Bird of Rebirth Min"] = v384
local v386 = {
	["Description"] = "Every <Cooldown>m, travels between <Amount> random fruit in your garden which get the Flaming mutation! Fruits passed have <Chance>% chance to mutated as well!"
}
local v387 = {
	["Cooldown"] = {
		["Min"] = 30,
		["Base"] = 230,
		["Scale"] = -1.5,
		["Formatter"] = "ColonTime"
	},
	["Chance"] = {
		["Max"] = 60,
		["Base"] = 30,
		["Scale"] = 0.3
	},
	["Amount"] = {
		["Max"] = 11,
		["Base"] = 6,
		["Scale"] = 0.2
	}
}
v386.States = v387
v1["Rainbow Icarus"] = v386
local v388 = {
	["Description"] = "Grants <Chance>% decreased player size!"
}
local v389 = {
	["Chance"] = {
		["Max"] = 20,
		["Base"] = 10,
		["Scale"] = 0.1
	}
}
v388.States = v389
v1["Tiny Bird"] = v388
local v390 = {
	["Description"] = "Every <Cooldown>m, digs around for <Duration>s, displacing the ground. Nearby fruits within <Range> studs have a <Chance>% chance every second to get Cracked mutation!"
}
local v391 = {
	["Cooldown"] = {
		["Min"] = 80,
		["Base"] = 312,
		["Scale"] = -3,
		["Formatter"] = "ColonTime"
	},
	["Duration"] = {
		["Max"] = 20,
		["Base"] = 10,
		["Scale"] = 0.1
	},
	["Range"] = {
		["Max"] = 40,
		["Base"] = 20,
		["Scale"] = 0.25
	},
	["Chance"] = {
		["Max"] = 20,
		["Base"] = 10,
		["Scale"] = 0.1
	}
}
v390.States = v391
v1["Earthquake Excavator"] = v390
local v392 = {
	["Description"] = "Every <Cooldown>m, <Chance>% chance a nearby fruit gets the Fall mutation!"
}
local v393 = {
	["Cooldown"] = {
		["Min"] = 30,
		["Base"] = 240,
		["Scale"] = -2,
		["Formatter"] = "ColonTime"
	},
	["Chance"] = {
		["Max"] = 30,
		["Base"] = 10,
		["Scale"] = 0.1
	}
}
v392.States = v393
v1["Fall Express"] = v392
local v394 = {
	["Description"] = "Grants <Chance>% increased player size!"
}
local v395 = {
	["Chance"] = {
		["Max"] = 16,
		["Base"] = 8,
		["Scale"] = 0.1
	}
}
v394.States = v395
v1["Mighty Bear"] = v394
local v396 = {
	["Description"] = "Pets bought directly from shops have a bonus 0.1 - <Chance> KG to their base weight! (Max 3 KG)."
}
local v397 = {
	["Chance"] = {
		["Max"] = 0.4,
		["Base"] = 0.18,
		["Scale"] = 0.02
	}
}
v396.States = v397
v1["Wise Shopper"] = v396
local v398 = {
	["Description"] = "All active Fall type pets gain an additional <Chance> XP/s!"
}
local v399 = {
	["Chance"] = {
		["Max"] = 2,
		["Base"] = 0.6,
		["Scale"] = 0.06
	}
}
v398.States = v399
v1["Prince of Fall"] = v398
local v400 = {
	["Description"] = "Every <Cooldown>m, goes to another player\'s pet and befriends it and performs its ability!"
}
local v401 = {
	["Cooldown"] = {
		["Min"] = 750,
		["Base"] = 1500,
		["Scale"] = -7.5,
		["Formatter"] = "ColonTime"
	}
}
v400.States = v401
v1["Swan Song"] = v400
local v402 = {
	["Description"] = "Every <Cooldown>m, graces a fruit with Graceful mutation!"
}
local v403 = {
	["Cooldown"] = {
		["Min"] = 120,
		["Base"] = 360,
		["Scale"] = -2,
		["Formatter"] = "ColonTime"
	}
}
v402.States = v403
v1["Bird of Grace"] = v402
local v404 = {
	["Description"] = "Grants <Chance>% decreased player size!"
}
local v405 = {
	["Chance"] = {
		["Max"] = 40,
		["Base"] = 20,
		["Scale"] = 0.2
	}
}
v404.States = v405
v1["Giant Tiny Bird"] = v404
local v406 = {
	["Description"] = "Every <Cooldown>m, digs around for <Duration>s, displacing the ground. Nearby fruits within <Range> studs have a <Chance>% chance every second to get Cracked mutation!"
}
local v407 = {
	["Cooldown"] = {
		["Min"] = 40,
		["Base"] = 150,
		["Scale"] = -3,
		["Formatter"] = "ColonTime"
	},
	["Duration"] = {
		["Max"] = 40,
		["Base"] = 20,
		["Scale"] = 0.2
	},
	["Range"] = {
		["Max"] = 80,
		["Base"] = 40,
		["Scale"] = 0.5
	},
	["Chance"] = {
		["Max"] = 20,
		["Base"] = 10,
		["Scale"] = 0.2
	}
}
v406.States = v407
v1["Giant Earthquake Excavator"] = v406
local v408 = {
	["Description"] = "Every <Cooldown>m, <Chance>% chance a nearby fruit gets the Fall mutation!"
}
local v409 = {
	["Cooldown"] = {
		["Min"] = 30,
		["Base"] = 140,
		["Scale"] = -2,
		["Formatter"] = "ColonTime"
	},
	["Chance"] = {
		["Max"] = 45,
		["Base"] = 20,
		["Scale"] = 0.2
	}
}
v408.States = v409
v1["Giant Fall Express"] = v408
local v410 = {
	["Description"] = "Grants <Chance>% increased player size!"
}
local v411 = {
	["Chance"] = {
		["Max"] = 32,
		["Base"] = 16,
		["Scale"] = 0.2
	}
}
v410.States = v411
v1["Giant Mighty Bear"] = v410
local v412 = {
	["Description"] = "Pets bought directly from shops have a bonus 0.1 - <Chance> KG to their base weight! (Max 3 KG)."
}
local v413 = {
	["Chance"] = {
		["Max"] = 0.8,
		["Base"] = 0.36,
		["Scale"] = 0.04
	}
}
v412.States = v413
v1["Giant Wise Shopper"] = v412
local v414 = {
	["Description"] = "All active Fall type pets gain an additional <Chance> XP/s!"
}
local v415 = {
	["Chance"] = {
		["Max"] = 4,
		["Base"] = 1.2,
		["Scale"] = 0.12
	}
}
v414.States = v415
v1["Giant Prince of Fall"] = v414
local v416 = {
	["Description"] = "Every <Cooldown>m, goes to another player\'s pet and befriends it and performs its ability!"
}
local v417 = {
	["Cooldown"] = {
		["Min"] = 300,
		["Base"] = 790,
		["Scale"] = -4.5,
		["Formatter"] = "ColonTime"
	}
}
v416.States = v417
v1["Giant Swan Song"] = v416
local v418 = {
	["Description"] = "Every <Cooldown>m, graces a fruit with Graceful mutation!"
}
local v419 = {
	["Cooldown"] = {
		["Min"] = 65,
		["Base"] = 150,
		["Scale"] = -3.5,
		["Formatter"] = "ColonTime"
	}
}
v418.States = v419
v1["Giant Bird of Grace"] = v418
local v420 = {
	["Description"] = "When Fall type pets finish their abilities, they start their cooldown with <Chance> seconds less!"
}
local v421 = {
	["Chance"] = {
		["Max"] = 30,
		["Base"] = 14,
		["Scale"] = 0.4
	}
}
v420.States = v421
v1["Squirrel Support"] = v420
local v422 = {
	["Description"] = "<Chance>% Chance to not consume a use when using a Harvest Tool!"
}
local v423 = {
	["Chance"] = {
		["Max"] = 12,
		["Base"] = 6,
		["Scale"] = 0.25
	}
}
v422.States = v423
v1["Harvest Stash"] = v422
local v424 = {
	["Description"] = "Every <Cooldown>m, burrows down in the ground and hides in a random mound! Finding the Marmot will grant a Fall related reward! Has a <Chance>% to burrow again!"
}
local v425 = {
	["Cooldown"] = {
		["Min"] = 120,
		["Base"] = 540,
		["Scale"] = -3.5,
		["Formatter"] = "ColonTime"
	},
	["Chance"] = {
		["Max"] = 30,
		["Base"] = 15,
		["Scale"] = 0.05
	}
}
v424.States = v425
v1["Whack-A-Marmot"] = v424
local v426 = {
	["Description"] = "Every <Cooldown>m, glides from 3 different mutated fruits. Copies 1 mutation from each fruit and applies it to the next! Ignores favorited fruit."
}
local v427 = {
	["Cooldown"] = {
		["Min"] = 720,
		["Base"] = 1200,
		["Scale"] = -4.5,
		["Formatter"] = "ColonTime"
	}
}
v426.States = v427
v1["Sugar Gliding"] = v426
local v428 = {
	["Description"] = "Every <Cooldown>m, has <Chance>% chance to apply the Voidtouched mutation!"
}
local v429 = {
	["Cooldown"] = {
		["Min"] = 540,
		["Base"] = 1080,
		["Scale"] = -4.5,
		["Formatter"] = "ColonTime"
	},
	["Chance"] = {
		["Max"] = 25,
		["Base"] = 15,
		["Scale"] = 0.3
	}
}
v428.States = v429
v1["A Space Odd-Nut-sy"] = v428
local v430 = {
	["Description"] = "For every other Salmon in your garden gains an aditional <Chance> XP per second!"
}
local v431 = {
	["Chance"] = {
		["Max"] = 8,
		["Base"] = 4,
		["Scale"] = 0.04
	}
}
v430.States = v431
v1["Salmon School"] = v430
local v432 = {
	["Description"] = "Every <Cooldown>m, goes to a Woody type plant and pecks at it for <Duration> seconds, which grants <Chance>% chance for Woody type fruit to duplicate! Rarer crops have lower chance to duplicate."
}
local v433 = {
	["Cooldown"] = {
		["Min"] = 60,
		["Base"] = 120,
		["Scale"] = -0.5,
		["Formatter"] = "ColonTime"
	},
	["Chance"] = {
		["Max"] = 12,
		["Base"] = 6,
		["Scale"] = 0.04
	},
	["Duration"] = {
		["Base"] = 30,
		["Scale"] = 0.5
	}
}
v432.States = v433
v1.Woodpecking = v432
local v434 = {
	["Description"] = "Flies south for the winter every half hour in a day, leaving you with a random reward before returning to your inventory."
}
local v435 = {
	["Chance"] = {
		["Max"] = 30,
		["Base"] = 14.85,
		["Scale"] = 0.15
	}
}
v434.States = v435
v1.Southbound = v434
local v436 = {
	["Description"] = "Every <Cooldown>m, goes to the Gear, Seed or Pet Shop and restocks 1 random stock. Rarer items have rarer chance to stock. Ability cannot be mimicked or refreshed."
}
local v437 = {
	["Cooldown"] = {
		["Min"] = 300,
		["Base"] = 720,
		["Scale"] = -6.7,
		["Formatter"] = "ColonTime"
	}
}
v436.States = v437
v1["Adorable Haggler"] = v436
local v438 = {
	["Description"] = "Every <Cooldown> minutes, advances the growth of a random plant by 15 minutes."
}
local v439 = {
	["Cooldown"] = {
		["Min"] = 30,
		["Base"] = 188,
		["Scale"] = -1.8,
		["Formatter"] = "ColonTime"
	}
}
v438.States = v439
v1["Mini Croak"] = v438
local v440 = {
	["Description"] = "Every <Cooldown>s, converts a random single-harvest plant into its seed equivalent. Ignores favorited plants"
}
local v441 = {
	["Cooldown"] = {
		["Min"] = 15,
		["Base"] = 60,
		["Scale"] = -0.6
	}
}
v440.States = v441
v1["Seed Disperser"] = v440
local v442 = {
	["Description"] = "Every <Cooldown>s, goes to a random fruit with Frozen mutation and melts it back to Chilled or Wet. Ignores favorited fruit."
}
local v443 = {
	["Cooldown"] = {
		["Min"] = 30,
		["Base"] = 80,
		["Scale"] = -0.8
	}
}
v442.States = v443
v1["Sun Basking"] = v442
local v444 = {
	["Description"] = "Every <Cooldown>m, grabs a random fruit from your garden and goes to the sell stall and sells it for you. There is a <Chance>% chance the fruit does not get collected."
}
local v445 = {
	["Cooldown"] = {
		["Min"] = 15,
		["Base"] = 120,
		["Scale"] = -1.2,
		["Formatter"] = "ColonTime"
	},
	["Chance"] = {
		["Chance"] = 12,
		["Base"] = 6,
		["Scale"] = 0.5
	}
}
v444.States = v445
v1["Primate Profit"] = v444
local v446 = {
	["Description"] = "Every <Cooldown>m, the Tiger roars, calls all pets in your garden to move toward it. <Amount> total XP is shared across each pet (max 800 XP per pet)."
}
local v447 = {
	["Cooldown"] = {
		["Min"] = 200,
		["Base"] = 780,
		["Scale"] = -5,
		["Formatter"] = "ColonTime"
	},
	["Amount"] = {
		["Max"] = 10000,
		["Base"] = 5000,
		["Scale"] = 50
	}
}
v446.States = v447
v1["Tiger Call"] = v446
local v448 = {
	["Description"] = "Every <Cooldown>m, roars and <Amount> random mutations from your garden will be replaced with another random mutation. Ignores favorited fruit."
}
local v449 = {
	["Cooldown"] = {
		["Min"] = 140,
		["Base"] = 362,
		["Scale"] = -3.6,
		["Formatter"] = "ColonTime"
	},
	["Amount"] = {
		["Max"] = 6,
		["Base"] = 3,
		["Scale"] = 0.3
	}
}
v448.States = v449
v1["King of the Jungle"] = v448
local v450 = {
	["Description"] = "All Berry type plants grow <Multiplier>x faster"
}
local v451 = {
	["Range"] = {
		["Max"] = 30,
		["Base"] = 30,
		["Scale"] = 0
	},
	["Multiplier"] = {
		["Max"] = 4,
		["Base"] = 1.5,
		["Scale"] = 0.05
	}
}
v450.States = v451
v1["Berry Friend"] = v450
local v452 = {
	["Description"] = "Every <Cooldown>m, turns one random fruit Silver!"
}
local v453 = {
	["Cooldown"] = {
		["Min"] = 90,
		["Base"] = 484,
		["Scale"] = -4,
		["Formatter"] = "ColonTime"
	}
}
v452.States = v453
v1["Silver Transmutation"] = v452
local v454 = {
	["Description"] = "Every <Cooldown>m, <Chance>% chance a nearby fruit becomes Shocked!"
}
local v455 = {
	["Cooldown"] = {
		["Min"] = 110,
		["Base"] = 545,
		["Scale"] = -5,
		["Formatter"] = "ColonTime"
	},
	["Chance"] = {
		["Max"] = 20,
		["Base"] = 10.25,
		["Scale"] = 0.1
	}
}
v454.States = v455
v1["Lightning Bug"] = v454
local v456 = {
	["Description"] = "When selling fruits with Azure mutation: There is a <Chance>% chance a random mutation from that fruit will be applied to a fruit in your garden!"
}
local v457 = {
	["Chance"] = {
		["Max"] = 12,
		["Base"] = 6,
		["Scale"] = 0.1
	}
}
v456.States = v457
v1["Water Diety"] = v456
local v458 = {
	["Description"] = "Every <Cooldown>m, <Chance>% chance a nearby fruit becomes Azure!"
}
local v459 = {
	["Cooldown"] = {
		["Min"] = 110,
		["Base"] = 545,
		["Scale"] = -3.5,
		["Formatter"] = "ColonTime"
	},
	["Chance"] = {
		["Max"] = 24,
		["Base"] = 12,
		["Scale"] = 0.12
	}
}
v458.States = v459
v1["Azure Surge"] = v458
local v460 = {
	["Description"] = "All Berry type plants grow <Multiplier>x faster"
}
local v461 = {
	["Range"] = {
		["Max"] = 45,
		["Base"] = 45,
		["Scale"] = 0
	},
	["Multiplier"] = {
		["Max"] = 6,
		["Base"] = 2.5,
		["Scale"] = 0.08
	}
}
v460.States = v461
v1["Rainbow Berry Friend"] = v460
local v462 = {
	["Description"] = "Every <Cooldown>m, turns one random fruit Silver!"
}
local v463 = {
	["Cooldown"] = {
		["Min"] = 45,
		["Base"] = 244,
		["Scale"] = -2,
		["Formatter"] = "ColonTime"
	}
}
v462.States = v463
v1["GIANT Silver Transmutation"] = v462
local v464 = {
	["Description"] = "Every <Cooldown>s, <Chance>% chance a nearby fruit becomes Shocked!"
}
local v465 = {
	["Cooldown"] = {
		["Min"] = 75,
		["Base"] = 225,
		["Scale"] = -2
	},
	["Chance"] = {
		["Max"] = 40,
		["Base"] = 20.25,
		["Scale"] = 0.1
	}
}
v464.States = v465
v1["GIANT Lightning Bug"] = v464
local v466 = {
	["Description"] = "When selling fruits with Azure mutation: There is a <Chance>% chance a random mutation from that fruit will be applied to a fruit in your garden!"
}
local v467 = {
	["Chance"] = {
		["Max"] = 24,
		["Base"] = 12,
		["Scale"] = 0.12
	}
}
v466.States = v467
v1["Rainbow Water Diety"] = v466
local v468 = {
	["Description"] = "Every <Cooldown>m, <Chance>% chance a nearby fruit becomes Azure!"
}
local v469 = {
	["Cooldown"] = {
		["Min"] = 75,
		["Base"] = 225,
		["Scale"] = -2.5,
		["Formatter"] = "ColonTime"
	},
	["Chance"] = {
		["Max"] = 48,
		["Base"] = 24,
		["Scale"] = 0.24
	}
}
v468.States = v469
__set_list(v468, 1, {""})
v1["Rainbow Azure Surge"] = v468
local v470 = {
	["Description"] = "Every <font color=\'#FFD700\'><Cooldown></font>m, eats a fruit in your garden and gains <font color=\'#FFD700\'><Amount></font> KG weight! <font color=\'#AAAAAA\'>(Ignores favorited or single-harvest fruits)</font>\n\nAfter eating, an <font color=\'#FFD700\'>Acorn</font> will spawn somewhere!. Collecting it grants a random reward!"
}
local v471 = {
	["Cooldown"] = {
		["Min"] = 35,
		["Base"] = 120,
		["Scale"] = -1.5,
		["Formatter"] = "ColonTime"
	},
	["Amount"] = {
		["Max"] = 0.06,
		["Base"] = 0.009,
		["Scale"] = 0.001,
		["Formatter"] = "NoPrecision"
	}
}
v470.States = v471
v1["Chubby Chipmunk"] = v470
local v472 = {
	["Description"] = "When fed, has a <font color=\'#FFD700\'><Chance></font>% chance to gain <font color=\'#FFD700\'><Amount></font> KG weight! Each mutation on the fed fruit grants an additional <font color=\'#FFD700\'><MutationChance></font>% chance to gain <font color=\'#FFD700\'><MutationAmount></font> KG!"
}
local v473 = {
	["Chance"] = {
		["Max"] = 30,
		["Base"] = 15,
		["Scale"] = 0.1
	},
	["Amount"] = {
		["Max"] = 0.05,
		["Base"] = 0.009,
		["Scale"] = 0.001,
		["Formatter"] = "NoPrecision"
	},
	["MutationChance"] = {
		["Max"] = 8,
		["Base"] = 3,
		["Scale"] = 0.3
	},
	["MutationAmount"] = {
		["Max"] = 0.03,
		["Base"] = 0.009,
		["Scale"] = 0.001,
		["Formatter"] = "NoPrecision"
	}
}
v472.States = v473
v1.Chunkmunk = v472
local v474 = {
	["Description"] = "All Nut type plants grow <Multiplier>x faster"
}
local v475 = {
	["Range"] = {
		["Max"] = 30,
		["Base"] = 30,
		["Scale"] = 0
	},
	["Multiplier"] = {
		["Max"] = 4,
		["Base"] = 1.5,
		["Scale"] = 0.05
	}
}
v474.States = v475
v1.Nuturalist = v474
local v476 = {
	["Description"] = "Every <Cooldown>m, performs a song for <Duration>s and all other pets in your garden restore <Amount>% hunger per second!"
}
local v477 = {
	["Cooldown"] = {
		["Min"] = 200,
		["Base"] = 720,
		["Scale"] = -3.5,
		["Formatter"] = "ColonTime"
	},
	["Duration"] = {
		["Max"] = 25,
		["Base"] = 8,
		["Scale"] = 0.4
	},
	["Amount"] = {
		["Max"] = 0.03,
		["Base"] = 0.01,
		["Scale"] = 0.004,
		["Formatter"] = "Percentage"
	}
}
v476.States = v477
v1["Chip-Hop"] = v476
local v478 = {
	["Description"] = "Every <Cooldown>m, goes to another pet, rolls around in dust and makes that pet perform its ability <Amount> times in a row!"
}
local v479 = {
	["Cooldown"] = {
		["Min"] = 1000,
		["Base"] = 2400,
		["Scale"] = -12,
		["Formatter"] = "ColonTime"
	},
	["Amount"] = {
		["Max"] = 6,
		["Base"] = 3,
		["Scale"] = 0.02
	}
}
v478.States = v479
v1["Dust Bath"] = v478
local v480 = {
	["Description"] = "All Nut type plants grow <Multiplier>x faster"
}
local v481 = {
	["Range"] = {
		["Max"] = 45,
		["Base"] = 45,
		["Scale"] = 0
	},
	["Multiplier"] = {
		["Max"] = 6,
		["Base"] = 2.5,
		["Scale"] = 0.05
	}
}
v480.States = v481
v1["Rainbow Nuturalist"] = v480
local v482 = {
	["Description"] = "Every <Cooldown>m, performs a song for <Duration>s and all other pets in your garden restore <Amount>% hunger per second!"
}
local v483 = {
	["Cooldown"] = {
		["Min"] = 100,
		["Base"] = 520,
		["Scale"] = -3.5,
		["Formatter"] = "ColonTime"
	},
	["Duration"] = {
		["Max"] = 32,
		["Base"] = 16,
		["Scale"] = 0.6
	},
	["Amount"] = {
		["Max"] = 0.04,
		["Base"] = 0.02,
		["Scale"] = 0.008,
		["Formatter"] = "Percentage"
	}
}
v482.States = v483
v1["Rainbow Chip-Hop"] = v482
local v484 = {
	["Description"] = "Every <Cooldown>m, goes to another pet, rolls around in dust and makes that pet perform its ability <Amount> times in a row!"
}
local v485 = {
	["Cooldown"] = {
		["Min"] = 1000,
		["Base"] = 1820,
		["Scale"] = -6,
		["Formatter"] = "ColonTime"
	},
	["Amount"] = {
		["Max"] = 8,
		["Base"] = 4,
		["Scale"] = 0.04
	}
}
v484.States = v485
v1["Rainbow Dust Bath"] = v484
local v486 = {
	["Description"] = "Every <Cooldown>m, consumes a random fruit in your garden and converts it into a Fissure Berry seed! Ignores favorited fruit!"
}
local v487 = {
	["Cooldown"] = {
		["Min"] = 60,
		["Base"] = 300,
		["Scale"] = -3,
		["Formatter"] = "ColonTime"
	}
}
v486.States = v487
v1["Hyrax Harvest"] = v486
local v488 = {
	["Description"] = "Every <Cooldown>m, has <Chance>% chance to apply the Jackpot mutation!"
}
local v489 = {
	["Cooldown"] = {
		["Min"] = 60,
		["Base"] = 420,
		["Scale"] = -2.5,
		["Formatter"] = "ColonTime"
	},
	["Chance"] = {
		["Max"] = 34,
		["Base"] = 17,
		["Scale"] = 0.17
	}
}
v488.States = v489
v1["CHA-CHING"] = v488
local v490 = {
	["Description"] = "Grants Spooky plants in <Range> studs a <Multiplier>x variant chance bonus!"
}
local v491 = {
	["Multiplier"] = {
		["Max"] = 1.5,
		["Base"] = 0.6,
		["Scale"] = 0.05
	},
	["Range"] = {
		["Max"] = 60,
		["Base"] = 32,
		["Scale"] = 0.25
	}
}
v490.States = v491
v1["Spooky Bat"] = v490
local v492 = {
	["Description"] = "Every <Cooldown>s, <Chance>% chance to dig up a random seed! Can dig up a seed exclusive to the Bone Dog!"
}
local v493 = {
	["Cooldown"] = {
		["Min"] = 5,
		["Base"] = 80,
		["Scale"] = -1
	},
	["Chance"] = {
		["Base"] = 15,
		["Scale"] = 0.05
	}
}
v492.States = v493
v1.Gravedigger = v492
local v494 = {
	["Description"] = "Every <Cooldown>m, weaves a <Range> stud web that lasts for <Duration>s. Pets on the web advance cooldown an extra <AmountPet>s every second & plants grow an additional <AmountPlant>s every second!"
}
local v495 = {
	["Cooldown"] = {
		["Min"] = 200,
		["Base"] = 488,
		["Scale"] = -4.8,
		["Formatter"] = "ColonTime"
	},
	["Range"] = {
		["Max"] = 36,
		["Base"] = 18,
		["Scale"] = 0.18
	},
	["Duration"] = {
		["Max"] = 20,
		["Base"] = 10,
		["Scale"] = 0.1
	},
	["AmountPet"] = {
		["Max"] = 1.5,
		["Base"] = 1,
		["Scale"] = 0.01
	},
	["AmountPlant"] = {
		["Max"] = 30,
		["Base"] = 15,
		["Scale"] = 0.15
	}
}
v494.States = v495
v1["Web Weave"] = v494
local v496 = {
	["Description"] = "Every <Cooldown>m, goes to a Witch\'s Cauldron cosmetic and naps near it for <Duration>s. New fruit within <Range> studs will be <Multiplier>x larger"
}
local v497 = {
	["Cooldown"] = {
		["Min"] = 120,
		["Base"] = 244,
		["Scale"] = -2,
		["Formatter"] = "ColonTime"
	},
	["Range"] = {
		["Max"] = 20,
		["Base"] = 10,
		["Scale"] = 0.1
	},
	["Duration"] = {
		["Max"] = 28,
		["Base"] = 14.5,
		["Scale"] = 0.15
	},
	["Multiplier"] = {
		["Max"] = 2,
		["Base"] = 1,
		["Scale"] = 0.1
	}
}
v496.States = v497
v1["Witch\'s Nap"] = v496
local v498 = {
	["Description"] = "Every <font color=\'#FFD700\'><Cooldown></font>m, haunts a random level <font color=\'#FFD700\'><Level></font> pet without a mutation, resetting it to <font color=\'#FF5555\'>level 1</font> and bestowing one of four chaotic mutations:\n\n<font color=\'#8C2DAF\'>Dreadbound</font>, <font color=\'#FF5528\'>Soulflame</font>, or <font color=\'#5AC8FF\'>Spectral</font> \226\128\148 with a rare <font color=\'#FF0064\'><Chance>%</font> chance for <font color=\'#FF0064\'>Nightmare</font>!"
}
local v499 = {
	["Cooldown"] = {
		["Min"] = 1000,
		["Base"] = 2444,
		["Scale"] = -24,
		["Formatter"] = "ColonTime"
	},
	["Level"] = {
		["Min"] = 30,
		["Base"] = 50.5,
		["Scale"] = -0.5
	},
	["Chance"] = {
		["Max"] = 12,
		["Base"] = 6,
		["Scale"] = 0.1
	}
}
v498.States = v499
v1["The Reins of Ruin"] = v498
local v500 = {
	["Description"] = "Grants Spooky plants in <Range> studs a <Multiplier>x variant chance bonus!"
}
local v501 = {
	["Multiplier"] = {
		["Max"] = 3.4,
		["Base"] = 1.2,
		["Scale"] = 0.05
	},
	["Range"] = {
		["Max"] = 100,
		["Base"] = 50,
		["Scale"] = 0.25
	}
}
v500.States = v501
v1["Ghostly Spooky Bat"] = v500
local v502 = {
	["Description"] = "Every <Cooldown>s, <Chance>% chance to dig up a random seed!"
}
local v503 = {
	["Cooldown"] = {
		["Min"] = 5,
		["Base"] = 40,
		["Scale"] = -1
	},
	["Chance"] = {
		["Base"] = 30,
		["Scale"] = 0.05
	}
}
v502.States = v503
v1["Ghostly Gravedigger"] = v502
local v504 = {
	["Description"] = "Every <Cooldown>m, weaves a <Range> stud web that lasts for <Duration>s. Pets on the web advance cooldown an extra <AmountPet>s every second & plants grow an additional <AmountPlant>s every second!"
}
local v505 = {
	["Cooldown"] = {
		["Min"] = 100,
		["Base"] = 244,
		["Scale"] = -2.8,
		["Formatter"] = "ColonTime"
	},
	["Range"] = {
		["Max"] = 40,
		["Base"] = 40,
		["Scale"] = 0.18
	},
	["Duration"] = {
		["Max"] = 40,
		["Base"] = 20,
		["Scale"] = 0.1
	},
	["AmountPet"] = {
		["Max"] = 2.5,
		["Base"] = 2,
		["Scale"] = 0.01
	},
	["AmountPlant"] = {
		["Max"] = 60,
		["Base"] = 30,
		["Scale"] = 0.15
	}
}
v504.States = v505
v1["Ghostly Web Weave"] = v504
local v506 = {
	["Description"] = "Every <Cooldown>m, goes to a Witch\'s Cauldron cosmetic and naps near it for <Duration>s. New fruit within <Range> studs will be <Multiplier>x larger"
}
local v507 = {
	["Cooldown"] = {
		["Min"] = 70,
		["Base"] = 111,
		["Scale"] = -2,
		["Formatter"] = "ColonTime"
	},
	["Range"] = {
		["Max"] = 40,
		["Base"] = 20,
		["Scale"] = 0.1
	},
	["Duration"] = {
		["Max"] = 60,
		["Base"] = 29.5,
		["Scale"] = 0.15
	},
	["Multiplier"] = {
		["Max"] = 3.5,
		["Base"] = 2,
		["Scale"] = 0.1
	}
}
v506.States = v507
v1["Ghostly Witch\'s Nap"] = v506
local v508 = {
	["Description"] = "Every <font color=\'#FFD700\'><Cooldown></font>m, haunts a random level <font color=\'#FFD700\'><Level></font> pet without a mutation, resetting it to <font color=\'#FF5555\'>level 1</font> and bestowing one of four chaotic mutations:\n\n<font color=\'#8C2DAF\'>Dreadbound</font>, <font color=\'#FF5528\'>Soulflame</font>, or <font color=\'#5AC8FF\'>Spectral</font> \226\128\148 with a rare <font color=\'#FF0064\'><Chance>%</font> chance for <font color=\'#FF0064\'>Nightmare</font>!"
}
local v509 = {
	["Cooldown"] = {
		["Min"] = 500,
		["Base"] = 1222,
		["Scale"] = -12,
		["Formatter"] = "ColonTime"
	},
	["Level"] = {
		["Min"] = 20,
		["Base"] = 30.5,
		["Scale"] = -0.5
	},
	["Chance"] = {
		["Max"] = 24,
		["Base"] = 12,
		["Scale"] = 0.2
	}
}
v508.States = v509
v1["The Ghostly Reins of Ruin"] = v508
local v510 = {
	["Description"] = "Every <Cooldown>m, converts a pumpkin into a random Jack-O-Lantern cosmetic! Collect all 5 variants!"
}
local v511 = {
	["Cooldown"] = {
		["Min"] = 60,
		["Base"] = 422,
		["Scale"] = -4.2,
		["Formatter"] = "ColonTime"
	}
}
v510.States = v511
v1["Pumpkin Carver"] = v510
local v512 = {
	["Description"] = "BOO! Every <Cooldown>m, goes to a nearby fruit and scares it! Applies the Spooky mutation!"
}
local v513 = {
	["Cooldown"] = {
		["Min"] = 120,
		["Base"] = 1111,
		["Scale"] = -8,
		["Formatter"] = "ColonTime"
	}
}
v512.States = v513
v1["Boo!"] = v512
local v514 = {
	["Description"] = "Every <Cooldown>m, howls: Fruits in <Range> studs have a <Chance>% get Moonlit mutation and turns you into a Werewolf for <Duration>s! Granting bonus <MovementSpeed>% movement speed & <JumpHeight>%jump height!"
}
local v515 = {
	["Cooldown"] = {
		["Min"] = 120,
		["Base"] = 244,
		["Scale"] = -2,
		["Formatter"] = "ColonTime"
	},
	["Range"] = {
		["Max"] = 40,
		["Base"] = 20,
		["Scale"] = 0.2
	},
	["Chance"] = {
		["Max"] = 30,
		["Base"] = 15,
		["Scale"] = 0.15
	},
	["Duration"] = {
		["Max"] = 70,
		["Base"] = 35,
		["Scale"] = 0.3
	},
	["MovementSpeed"] = {
		["Max"] = 80,
		["Base"] = 40.4,
		["Scale"] = 0.4
	},
	["JumpHeight"] = {
		["Max"] = 160,
		["Base"] = 80.4,
		["Scale"] = 0.8
	}
}
v514.States = v515
v1["Wolf Howl"] = v514
local v516 = {
	["Description"] = "Every <Cooldown>m, sacrifices 4 fruit in your garden to apply a medium Passive boost or medium XP Boost to a random pet in your garden!"
}
local v517 = {
	["Cooldown"] = {
		["Min"] = 720,
		["Base"] = 1320,
		["Scale"] = -6.5,
		["Formatter"] = "ColonTime"
	}
}
v516.States = v517
v1["Reap What You Sow"] = v516
local v518 = {
	["Description"] = "Spooky type plants within <Range> studs have <Multiplier>x increased growth speed!"
}
local v519 = {
	["Multiplier"] = {
		["Max"] = 3,
		["Base"] = 1.4,
		["Scale"] = 0.1
	},
	["Range"] = {
		["Max"] = 60,
		["Base"] = 32,
		["Scale"] = 0.25
	}
}
v518.States = v519
v1["Spooky Crow"] = v518
local v520 = {
	["Description"] = "Every <Cooldown>m, goes to a random player and rams them, knocking and launching them away!"
}
local v521 = {
	["Cooldown"] = {
		["Min"] = 261,
		["Base"] = 522,
		["Scale"] = -3.2,
		["Formatter"] = "ColonTime"
	}
}
v520.States = v521
v1.Ram = v520
local v522 = {
	["Description"] = "Every <Cooldown>m, goes to another random player and carries them and brings them to you! Player can jump to be released!"
}
local v523 = {
	["Cooldown"] = {
		["Min"] = 300,
		["Base"] = 612,
		["Scale"] = -6,
		["Formatter"] = "ColonTime"
	}
}
v522.States = v523
v1.Looter = v522
local v524 = {
	["Description"] = "Every <Cooldown>m, spreads its roots and nearest <MaxAmount> fruit within <Range> studs have a <Chance>% to get the Blight mutation! "
}
local v525 = {
	["Cooldown"] = {
		["Min"] = 600,
		["Base"] = 1330,
		["Scale"] = -6,
		["Formatter"] = "ColonTime"
	},
	["Chance"] = {
		["Max"] = 30,
		["Base"] = 15,
		["Scale"] = 0.15
	},
	["Range"] = {
		["Max"] = 60,
		["Base"] = 30,
		["Scale"] = 0.3
	},
	["MaxAmount"] = {
		["Max"] = 260,
		["Base"] = 130,
		["Scale"] = 0.1
	}
}
v524.States = v525
v1["Dark Overgrowth"] = v524
local v526 = {
	["Description"] = "You must plant 5 single-harvest plants in a Hex Circle cosmetic and every <Cooldown>m: The Hex Serpent will perform a ritual, consuming the plants, granting random rewards! The rarer plants and better variants grants better effects!"
}
local v527 = {
	["Cooldown"] = {
		["Min"] = 240,
		["Base"] = 720,
		["Scale"] = -3.5,
		["Formatter"] = "ColonTime"
	}
}
v526.States = v527
v1["Hex Magic"] = v526
local v528 = {
	["Description"] = "Every <Cooldown>m, spreads its roots and nearest <MaxAmount> fruit within <Range> studs have a <Chance>% to get the Blight!"
}
local v529 = {
	["Cooldown"] = {
		["Min"] = 300,
		["Base"] = 665,
		["Scale"] = -3.5,
		["Formatter"] = "ColonTime"
	},
	["Chance"] = {
		["Max"] = 60,
		["Base"] = 30,
		["Scale"] = 0.3
	},
	["Range"] = {
		["Max"] = 90,
		["Base"] = 45,
		["Scale"] = 0.45
	},
	["MaxAmount"] = {
		["Max"] = 520,
		["Base"] = 260,
		["Scale"] = 0.2
	}
}
v528.States = v529
v1["Ghostly Overgrowth"] = v528
local v530 = {
	["Description"] = "Spooky type plants within <Range> studs have <Multiplier>x increased growth size!"
}
local v531 = {
	["Range"] = {
		["Max"] = 60,
		["Base"] = 32,
		["Scale"] = 0.25
	},
	["Multiplier"] = {
		["Max"] = 0.64,
		["Base"] = 0.32,
		["Scale"] = 0.05
	}
}
v530.States = v531
v1["Spooky Scarab"] = v530
local v532 = {
	["Description"] = "Every <Cooldown>m, digs down and hides in a random Tombstone. Going to the tombstone awards a random Graveyard cosmetic!"
}
local v533 = {
	["Cooldown"] = {
		["Min"] = 110,
		["Base"] = 320,
		["Scale"] = -3,
		["Formatter"] = "ColonTime"
	}
}
v532.States = v533
v1["Tomb Raid"] = v532
local v534 = {
	["Description"] = "As long as you have a Sarcophagus cosmetic in your garden: Pets you get from chest have a bonus 0.1 - <Amount> KG to their base weight! (Max 3.5 KG)."
}
local v535 = {
	["Amount"] = {
		["Max"] = 0.5,
		["Base"] = 0.28,
		["Scale"] = 0.02
	}
}
v534.States = v535
v1["King\'s Sarcophagus"] = v534
local v536 = {
	["Description"] = "Every <Cooldown>m goes to a Sarcophagus cosmetic in your garden and applies Gold to the nearest plant in <Range> studs for <Duration>s! Target plant cant exceed <MaxDuration>s of being gold."
}
local v537 = {
	["Cooldown"] = {
		["Min"] = 600,
		["Base"] = 1333,
		["Scale"] = -7,
		["Formatter"] = "ColonTime"
	},
	["Range"] = {
		["Max"] = 70,
		["Base"] = 35,
		["Scale"] = 0.25
	},
	["Duration"] = {
		["Max"] = 60,
		["Base"] = 29,
		["Scale"] = 1
	},
	["MaxDuration"] = {
		["Min"] = 300,
		["Max"] = 300,
		["Base"] = 300,
		["Scale"] = 0
	}
}
v536.States = v537
v1["Treasures of the King"] = v536
local v538 = {
	["Description"] = "Spooky type plants within <Range> studs have <Multiplier>x increased growth size!"
}
local v539 = {
	["Range"] = {
		["Max"] = 90,
		["Base"] = 45,
		["Scale"] = 0.25
	},
	["Multiplier"] = {
		["Max"] = 1,
		["Base"] = 0.52,
		["Scale"] = 0.05
	}
}
v538.States = v539
v1["Ghostly Spooky Scarab"] = v538
local v540 = {
	["Description"] = "Every <Cooldown>m, digs down and hides in a random Tombstone. Going to the tombstone awards a random Graveyard cosmetic!"
}
local v541 = {
	["Cooldown"] = {
		["Min"] = 80,
		["Base"] = 160,
		["Scale"] = -2,
		["Formatter"] = "ColonTime"
	}
}
v540.States = v541
v1["Ghostly Tomb Raid"] = v540
local v542 = {
	["Description"] = "As long as you have a Sarcophagus cosmetic in your garden: Pets you get from chest have a bonus 0.1 - <Amount> KG to their base weight! (Max 3.5 KG)."
}
local v543 = {
	["Amount"] = {
		["Max"] = 0.6,
		["Base"] = 0.38,
		["Scale"] = 0.04
	}
}
v542.States = v543
v1["Ghostly King\'s Sarcophagus"] = v542
local v544 = {
	["Description"] = "Every <Cooldown>m goes to a Sarcophagus cosmetic in your garden and applies Gold to the nearest plant in <Range> studs for <Duration>s! Target plant cant exceed <MaxDuration>s of being gold."
}
local v545 = {
	["Cooldown"] = {
		["Min"] = 333,
		["Base"] = 666,
		["Scale"] = -3.5,
		["Formatter"] = "ColonTime"
	},
	["Range"] = {
		["Max"] = 90,
		["Base"] = 45,
		["Scale"] = 0.25
	},
	["Duration"] = {
		["Max"] = 88,
		["Base"] = 44,
		["Scale"] = 2
	},
	["MaxDuration"] = {
		["Min"] = 300,
		["Max"] = 300,
		["Base"] = 300,
		["Scale"] = 0
	}
}
v544.States = v545
v1["Ghostly Treasures of the King"] = v544
local v546 = {
	["Description"] = "Spooky type plants within <Range> studs have increased <VariantMultiplier>x variant chance, <GrowthMultiplier>x growth speed and <SizeMultiplier>x size bonus!"
}
local v547 = {
	["VariantMultiplier"] = {
		["Max"] = 1.5,
		["Base"] = 0.6,
		["Scale"] = 0.05
	},
	["GrowthMultiplier"] = {
		["Max"] = 3,
		["Base"] = 1.4,
		["Scale"] = 0.1
	},
	["SizeMultiplier"] = {
		["Max"] = 1,
		["Base"] = 0.42,
		["Scale"] = 0.05
	},
	["Range"] = {
		["Max"] = 60,
		["Base"] = 32,
		["Scale"] = 0.25
	}
}
v546.States = v547
v1["Spooky Lich"] = v546
local v548 = {
	["Description"] = "All active Halloween type pets gain an additional <Chance> XP/s!"
}
local v549 = {
	["Chance"] = {
		["Max"] = 4,
		["Base"] = 1.4,
		["Scale"] = 0.05
	}
}
v548.States = v549
v1["Dread Lord"] = v548
local v550 = {
	["Description"] = ""
}
local v551 = {
	["Multiplier"] = {
		["Max"] = 1.5,
		["Base"] = 0.6,
		["Scale"] = 0.05
	},
	["Range"] = {
		["Max"] = 60,
		["Base"] = 32,
		["Scale"] = 0.25
	}
}
v550.States = v551
v1["Lich Blessing"] = v550
local v552 = {
	["Description"] = ""
}
local v553 = {
	["Multiplier"] = {
		["Max"] = 3,
		["Base"] = 1.4,
		["Scale"] = 0.1
	},
	["Range"] = {
		["Max"] = 60,
		["Base"] = 32,
		["Scale"] = 0.25
	}
}
v552.States = v553
v1["Lich Tempo"] = v552
local v554 = {
	["Description"] = ""
}
local v555 = {
	["Multiplier"] = {
		["Max"] = 1,
		["Base"] = 0.42,
		["Scale"] = 0.05
	},
	["Range"] = {
		["Base"] = 30,
		["Scale"] = 0.25
	}
}
v554.States = v555
v1["Lich Power"] = v554
local v556 = {
	["Description"] = "Every <Cooldown>m, haunts a random fruit and has <Chance>% chance to mutate it with Vamp, or rare chance for Spooky or even rarer chance for Ghostly instead!"
}
local v557 = {
	["Cooldown"] = {
		["Min"] = 200,
		["Base"] = 812,
		["Scale"] = -4.5,
		["Formatter"] = "ColonTime"
	},
	["Chance"] = {
		["Max"] = 50,
		["Base"] = 24.75,
		["Scale"] = 0.25
	}
}
v556.States = v557
v1.Haunt = v556
local v558 = {
	["Description"] = "Every <Cooldown>m, goes to nearby fruit and dances, applying Leeched mutation!"
}
local v559 = {
	["Cooldown"] = {
		["Min"] = 140,
		["Base"] = 600,
		["Scale"] = -6.5,
		["Formatter"] = "ColonTime"
	}
}
v558.States = v559
v1["Vampire Doggy"] = v558
local v560 = {
	["Description"] = "Every <Cooldown>s, polishes a nearby fruit and it has a <Chance>% chance to become Glossy!"
}
local v561 = {
	["Cooldown"] = {
		["Min"] = 60,
		["Base"] = 264,
		["Scale"] = -4
	},
	["Chance"] = {
		["Base"] = 15,
		["Scale"] = 0.15
	}
}
v560.States = v561
v1["Gloss Animal"] = v560
local v562 = {
	["Description"] = "Every <Cooldown>m, rolls into a ball and transforms you into a armadillo ball for <Duration>s!"
}
local v563 = {
	["Cooldown"] = {
		["Min"] = 240,
		["Base"] = 480,
		["Scale"] = -4,
		["Formatter"] = "ColonTime"
	},
	["Duration"] = {
		["Max"] = 60,
		["Base"] = 30,
		["Scale"] = 0.3
	}
}
v562.States = v563
v1["Armadillo Roll"] = v562
local v564 = {
	["Description"] = "Every <Cooldown>m, initiates a battle with another player\'s Beetle. If your beetle wins you get a reward! The higher level and heavier the beetle the more likely it is to win!"
}
local v565 = {
	["Cooldown"] = {
		["Min"] = 80,
		["Base"] = 360,
		["Scale"] = -2,
		["Formatter"] = "ColonTime"
	}
}
v564.States = v565
v1["Beetle Duel"] = v564
local v566 = {
	["Description"] = "Every <Cooldown>m, punches different things in your garden for different effects!"
}
local v567 = {
	["Cooldown"] = {
		["Min"] = 333,
		["Base"] = 888,
		["Scale"] = -6,
		["Formatter"] = "ColonTime"
	}
}
v566.States = v567
v1["Shrimpunch!!!"] = v566
local v568 = {
	["Description"] = "Every <Cooldown>m, ages itself up by 1, hatches an egg and applies Terran mutation. Cannot be mimicked or refreshed!"
}
local v569 = {
	["Cooldown"] = {
		["Min"] = 1250,
		["Base"] = 2500,
		["Scale"] = -10,
		["Formatter"] = "ColonTime"
	}
}
v568.States = v569
v1["Three-Headed"] = v568
local v570 = {
	["Description"] = "When selling fruits with Terran mutation: There is a <Chance>% chance a random mutation from that fruit will be applied to a fruit in your garden!"
}
local v571 = {
	["Chance"] = {
		["Max"] = 12,
		["Base"] = 6,
		["Scale"] = 0.1
	}
}
v570.States = v571
v1["Earth Diety"] = v570
local v572 = {
	["Description"] = "When Safari type pets finish their abilities, they start their cooldown with <Chance> seconds less!"
}
local v573 = {
	["Chance"] = {
		["Max"] = 30,
		["Base"] = 14,
		["Scale"] = 0.4
	}
}
v572.States = v573
v1["Safari Support"] = v572
local v574 = {
	["Description"] = "Every 30m on the clock, All Zebras stampede back and forth from the Seed Shop to Gear Shop or vice-versa, and grants you a random reward! Has <Chance>% chance to trigger again on each stampede!"
}
local v575 = {
	["Chance"] = {
		["Max"] = 20,
		["Base"] = 10,
		["Scale"] = 0.1
	}
}
v574.States = v575
v1["Zebra Stampede"] = v574
local v576 = {
	["Description"] = "Every <Cooldown>m, eats fruit that are atleast 10 studs high for <Multiplier>x sell value. The plant the fruit came from advances growth by <Amount>m! Also applies Arid mutation to all other fruits on that plant."
}
local v577 = {
	["Cooldown"] = {
		["Min"] = 333,
		["Base"] = 888,
		["Scale"] = -4.4,
		["Formatter"] = "ColonTime"
	},
	["Multiplier"] = {
		["Max"] = 3,
		["Base"] = 1.45,
		["Scale"] = 0.05
	},
	["Amount"] = {
		["Max"] = 7200,
		["Base"] = 3990,
		["Scale"] = 30,
		["Formatter"] = "ColonTime"
	}
}
v576.States = v577
v1["Great Grazer"] = v576
local v578 = {
	["Description"] = "Every <Cooldown>m, charges into a random egg or random fruit in your garden: Rammed eggs have hatch time halved, rammed fruits get Mirage mutation! Cannot be mimicked or refreshed."
}
local v579 = {
	["Cooldown"] = {
		["Min"] = 444,
		["Base"] = 888,
		["Scale"] = -8,
		["Formatter"] = "ColonTime"
	}
}
v578.States = v579
v1["Rhino Ram"] = v578
local v580 = {
	["Description"] = "Every <Cooldown>m, blesses an age <Age> pet, resetting its age back to 1, increasing its base weight by 0.1 KG if its base weight is less than <Max> KG! Cannot bless other Elephants. Cannot be mimicked or refreshed."
}
local v581 = {
	["Cooldown"] = {
		["Min"] = 400,
		["Base"] = 1388,
		["Scale"] = -13,
		["Formatter"] = "ColonTime"
	},
	["Age"] = {
		["Min"] = 50,
		["Base"] = 50.25,
		["Scale"] = -0.25
	},
	["Max"] = {
		["Max"] = 3.5,
		["Base"] = 2,
		["Scale"] = 0.05
	}
}
v580.States = v581
v1["Jumbo Blessing"] = v580
local v582 = {
	["Description"] = "Every <Cooldown>m, rolls into a ball and transforms you into a armadillo ball for <Duration>s!"
}
local v583 = {
	["Cooldown"] = {
		["Min"] = 120,
		["Base"] = 240,
		["Scale"] = -4,
		["Formatter"] = "ColonTime"
	},
	["Duration"] = {
		["Max"] = 90,
		["Base"] = 45,
		["Scale"] = 0.45
	}
}
v582.States = v583
v1["GIANT Armadillo Roll"] = v582
local v584 = {
	["Description"] = "Every <Cooldown>m, initiates a battle with another player\'s Beetle. If your beetle wins you get a reward! The higher level and heavier the beetle the more likely it is to win!"
}
local v585 = {
	["Cooldown"] = {
		["Min"] = 40,
		["Base"] = 260,
		["Scale"] = -2,
		["Formatter"] = "ColonTime"
	}
}
v584.States = v585
v1["Rainbow Beetle Duel"] = v584
local v586 = {
	["Description"] = "Every <Cooldown>m, punches different things in your garden for different effects!"
}
local v587 = {
	["Cooldown"] = {
		["Min"] = 222,
		["Base"] = 444,
		["Scale"] = -4,
		["Formatter"] = "ColonTime"
	}
}
v586.States = v587
v1["GIANT Shrimpunch!!!"] = v586
local v588 = {
	["Description"] = "Every <Cooldown>m, ages itself up by 1, hatches an egg and applies Terran mutation. Cannot be mimicked or refreshed!"
}
local v589 = {
	["Cooldown"] = {
		["Min"] = 800,
		["Base"] = 1500,
		["Scale"] = -10,
		["Formatter"] = "ColonTime"
	}
}
v588.States = v589
v1["Rainbow Three-Headed"] = v588
local v590 = {
	["Description"] = "When selling fruits with Terran mutation: There is a <Chance>% chance a random mutation from that fruit will be applied to a fruit in your garden!"
}
local v591 = {
	["Chance"] = {
		["Max"] = 24,
		["Base"] = 12,
		["Scale"] = 0.2
	}
}
v590.States = v591
v1["Rainbow Earth Diety"] = v590
local v592 = {
	["Description"] = "When Safari type pets finish their abilities, they start their cooldown with <Chance> seconds less!"
}
local v593 = {
	["Chance"] = {
		["Max"] = 50,
		["Base"] = 24,
		["Scale"] = 0.5
	}
}
v592.States = v593
v1["Rainbow Safari Support"] = v592
local v594 = {
	["Description"] = "Every 30m on the clock, All Zebras stampede back and forth from the Seed Shop to Gear Shop or vice-versa, and grants you a random reward! Has <Chance>% chance to trigger again on each stampede!"
}
local v595 = {
	["Chance"] = {
		["Max"] = 40,
		["Base"] = 20,
		["Scale"] = 0.2
	}
}
v594.States = v595
v1["Rainbow Zebra Stampede"] = v594
local v596 = {
	["Description"] = "Every <Cooldown>m, eats fruit that are atleast 10 studs high for <Multiplier>x sell value. The plant the fruit came from advances growth by <Amount>m! Also applies Arid mutation to all other fruits on that plant."
}
local v597 = {
	["Cooldown"] = {
		["Min"] = 222,
		["Base"] = 444,
		["Scale"] = -2.2,
		["Formatter"] = "ColonTime"
	},
	["Multiplier"] = {
		["Max"] = 4,
		["Base"] = 2,
		["Scale"] = 0.1
	},
	["Amount"] = {
		["Max"] = 9200,
		["Base"] = 4990,
		["Scale"] = 40,
		["Formatter"] = "ColonTime"
	}
}
v596.States = v597
v1["Rainbow Great Grazer"] = v596
local v598 = {
	["Description"] = "Every <Cooldown>m, charges into a random egg or random fruit in your garden: Rammed eggs have hatch time halved, rammed fruits get Mirage mutation! Cannot be mimicked or refreshed."
}
local v599 = {
	["Cooldown"] = {
		["Min"] = 333,
		["Base"] = 666,
		["Scale"] = -6,
		["Formatter"] = "ColonTime"
	}
}
v598.States = v599
v1["Rainbow Rhino Ram"] = v598
local v600 = {
	["Description"] = "Every <Cooldown>m, blesses an age <Age> pet, resetting its age back to 1, increasing its base weight by 0.1 KG if its base weight is less than <Max> KG! Cannot bless other Elephants. Cannot be mimicked or refreshed."
}
local v601 = {
	["Cooldown"] = {
		["Min"] = 450,
		["Base"] = 900,
		["Scale"] = -9,
		["Formatter"] = "ColonTime"
	},
	["Age"] = {
		["Min"] = 40,
		["Base"] = 40.25,
		["Scale"] = -0.25
	},
	["Max"] = {
		["Max"] = 5.5,
		["Base"] = 3,
		["Scale"] = 0.05
	}
}
v600.States = v601
v1["Rainbow Jumbo Blessing"] = v600
local v602 = {
	["Description"] = "Safari type plants within <Range> studs have <Multiplier>x increased variant chance!"
}
local v603 = {
	["Multiplier"] = {
		["Max"] = 1.4,
		["Base"] = 0.6,
		["Scale"] = 0.05
	},
	["Range"] = {
		["Max"] = 60,
		["Base"] = 29,
		["Scale"] = 0.25
	}
}
v602.States = v603
v1["Gecko Gold"] = v602
local v604 = {
	["Description"] = "Gains an additional <Amount> XP/s for every Hyena in your garden! Requires another non-Hyena pet equipped to activate this effect."
}
local v605 = {
	["Amount"] = {
		["Max"] = 8,
		["Base"] = 4,
		["Scale"] = 0.04
	}
}
v604.States = v605
v1["Pack Hunting"] = v604
local v606 = {
	["Description"] = "<Chance>% chance harvested fruit duplicates! Rarer crops have lower chance to duplicate."
}
local v607 = {
	["Chance"] = {
		["Max"] = 20,
		["Base"] = 10,
		["Scale"] = 0.15
	}
}
v606.States = v607
v1["Safari Renewal"] = v606
local v608 = {
	["Description"] = "<Chance>% extra chance for Safari type fruit to duplicate!"
}
local v609 = {
	["Chance"] = {
		["Max"] = 15,
		["Base"] = 5,
		["Scale"] = 0.1
	}
}
v608.States = v609
v1["Safari Harvester"] = v608
local v610 = {
	["Description"] = "Every <Cooldown>m, eats a Watermelon for <Multiplier>x value bonus and has a <Chance>% to recover the Watermelon seed!"
}
local v611 = {
	["Cooldown"] = {
		["Min"] = 60,
		["Base"] = 200,
		["Scale"] = -1,
		["Formatter"] = "ColonTime"
	},
	["Multiplier"] = {
		["Max"] = 8,
		["Base"] = 2,
		["Scale"] = 0.02
	},
	["Chance"] = {
		["Max"] = 60,
		["Base"] = 30,
		["Scale"] = 0.3
	}
}
v610.States = v611
v1["Watermelon Chomper"] = v610
local v612 = {
	["Description"] = "Every <Cooldown>m, goes to a nearby fruit and applies Monsoon mutation!"
}
local v613 = {
	["Cooldown"] = {
		["Min"] = 222,
		["Base"] = 1111,
		["Scale"] = -11,
		["Formatter"] = "ColonTime"
	}
}
v612.States = v613
v1["Monsoon Beast"] = v612
local v614 = {
	["Description"] = "Every <Cooldown>m, bites on to a random Plant or Pet for <Duration>s and performs a roll. Plants grow an additional <AmountPlant>s/s and Pets get additional <AmountXP> XP/s"
}
local v615 = {
	["Cooldown"] = {
		["Min"] = 600,
		["Base"] = 1200,
		["Scale"] = -6.6,
		["Formatter"] = "ColonTime"
	},
	["Duration"] = {
		["Max"] = 50,
		["Base"] = 30,
		["Scale"] = 0.1
	},
	["AmountPlant"] = {
		["Max"] = 90,
		["Base"] = 45,
		["Scale"] = 0.1
	},
	["AmountXP"] = {
		["Max"] = 65,
		["Base"] = 35,
		["Scale"] = 0.1
	}
}
v614.States = v615
v1["Croc Roll"] = v614
local v616 = {
	["Description"] = "Every <Cooldown>m, roars, calls pets in your garden to move toward it. <Amount> total cooldown advancement is shared across each pet (max <MaxAmount>s per pet)."
}
local v617 = {
	["Cooldown"] = {
		["Min"] = 200,
		["Base"] = 800,
		["Scale"] = -5,
		["Formatter"] = "ColonTime"
	},
	["Amount"] = {
		["Max"] = 800,
		["Base"] = 400,
		["Scale"] = 4
	},
	["MaxAmount"] = {
		["Max"] = 120,
		["Base"] = 60,
		["Scale"] = 0.6
	}
}
v616.States = v617
v1["Lion Call"] = v616
local v618 = {
	["Description"] = "Every <Cooldown>m, roars and mutates fruit up to the number of Safari type pets you have in your garden with a random Safari Mutation!"
}
local v619 = {
	["Cooldown"] = {
		["Min"] = 400,
		["Base"] = 1400,
		["Scale"] = -14,
		["Formatter"] = "ColonTime"
	}
}
v618.States = v619
v1["King of the Safari"] = v618
local v620 = {
	["Description"] = "When triggering a Lucky Harvest: <Chance>% you get a Cleansing Pet Shard! (Max 50%)"
}
local v621 = {
	["Chance"] = {
		["Max"] = 14,
		["Base"] = 7,
		["Scale"] = 0.07
	}
}
v620.States = v621
v1["Shard and Steady"] = v620
local v622 = {
	["Description"] = "Every <Cooldown>m, goes to a random fruit and converts it into a random Gem-themed cosmetic!"
}
local v623 = {
	["Cooldown"] = {
		["Min"] = 80,
		["Base"] = 422,
		["Scale"] = -4.2,
		["Formatter"] = "ColonTime"
	}
}
v622.States = v623
v1["Gem Carver"] = v622
local v624 = {
	["Description"] = "Every <Cooldown>m, <Chance>% chance to mutate a nearby fruit, applying the Crystalized mutation!"
}
local v625 = {
	["Cooldown"] = {
		["Min"] = 14,
		["Base"] = 486,
		["Scale"] = -4,
		["Formatter"] = "ColonTime"
	},
	["Chance"] = {
		["Base"] = 15,
		["Scale"] = 0.5
	}
}
v624.States = v625
v1["Crystalized Bird"] = v624
local v626 = {
	["Description"] = "When harvesting a fruit with 12 or more mutations: <Chance>% chance for random pet to age up by 1! (Max 30%)"
}
local v627 = {
	["Chance"] = {
		["Max"] = 6,
		["Base"] = 3,
		["Scale"] = 0.1
	}
}
v626.States = v627
v1["12 Carats"] = v626
v1["Ruby Ink"] = {
	["Description"] = "Continously copies a random pet\'s passive (non-cooldown based).",
	["States"] = {}
}
local v628 = {
	["Description"] = "Every <Cooldown>m, eats from and reduces a random pet\'s level by 1"
}
local v629 = {
	["Cooldown"] = {
		["Min"] = 300,
		["Base"] = 700,
		["Scale"] = -4.8,
		["Formatter"] = "ColonTime"
	}
}
v628.States = v629
v1["Level Eater"] = v628
local v630 = {
	["Description"] = "Every <Cooldown>m, converts an Advanced Sprinkler into a Geode Sprinkler which applies Geode mutation!"
}
local v631 = {
	["Cooldown"] = {
		["Min"] = 30,
		["Base"] = 352,
		["Scale"] = -3.5,
		["Formatter"] = "ColonTime"
	}
}
v630.States = v631
v1["Geode Sprinkler"] = v630
local v632 = {
	["Description"] = "Every <Cooldown>s, eats a random fruit in your garden and all fruits within a <Range> stud range has a <Chance>% chance to mutate with the Webbed Mutation!"
}
local v633 = {
	["Cooldown"] = {
		["Min"] = 150,
		["Base"] = 300,
		["Scale"] = -3
	},
	["Chance"] = {
		["Max"] = 16,
		["Base"] = 8,
		["Scale"] = 0.1
	},
	["Range"] = {
		["Max"] = 50,
		["Base"] = 25,
		["Scale"] = 0.25
	}
}
v632.States = v633
v1["Web Supply"] = v632
local v634 = {
	["Description"] = "Every 5 minutes on the clock has a <Chance>% chance to grant a dig!"
}
local v635 = {
	["Chance"] = {
		["Max"] = 5,
		["Base"] = 2,
		["Scale"] = 0.05
	}
}
v634.States = v635
v1.Miner = v634
local v636 = {
	["Description"] = "Every <Cooldown>m, <Chance>% chance to dig up coal!"
}
local v637 = {
	["Cooldown"] = {
		["Min"] = 150,
		["Base"] = 303,
		["Scale"] = -3,
		["Formatter"] = "ColonTime"
	},
	["Chance"] = {
		["Max"] = 20,
		["Base"] = 10,
		["Scale"] = 0.05
	}
}
v636.States = v637
v1["Smithing Digging"] = v636
local v638 = {
	["Description"] = "Every <Cooldown>m, turns you into a cheetah for <Duration>s. Harvested fruit during this time have a <Chance>% chance to get the Wildfast mutation!"
}
local v639 = {
	["Cooldown"] = {
		["Min"] = 200,
		["Base"] = 480,
		["Scale"] = -4,
		["Formatter"] = "ColonTime"
	},
	["Duration"] = {
		["Max"] = 60,
		["Base"] = 30,
		["Scale"] = 0.3
	},
	["Chance"] = {
		["Max"] = 30,
		["Base"] = 15,
		["Scale"] = 0.15
	}
}
v638.States = v639
v1["Master of Faster"] = v638
local v640 = {
	["Description"] = "All nearby plants within <Range> studs will gain additional <Multiplier> SEC/s growth speed for every Silver Ingot Cosmetic in your garden!"
}
local v641 = {
	["Range"] = {
		["Max"] = 40,
		["Base"] = 20,
		["Scale"] = 0.1
	},
	["Multiplier"] = {
		["Max"] = 0.1,
		["Base"] = 0.05,
		["Scale"] = 0.01,
		["Formatter"] = "NoPrecision"
	}
}
v640.States = v641
v1["Silver Hoarder"] = v640
local v642 = {
	["Description"] = "All nearby pets within <Range> studs will gain additional <Multiplier> XP/s for every Gold Ingot Cosmetic in your garden!"
}
local v643 = {
	["Range"] = {
		["Max"] = 60,
		["Base"] = 30,
		["Scale"] = 0.15
	},
	["Multiplier"] = {
		["Max"] = 0.2,
		["Base"] = 0.1,
		["Scale"] = 0.01,
		["Formatter"] = "NoPrecision"
	}
}
v642.States = v643
v1["Gold Hoarder"] = v642
local v644 = {
	["Description"] = "When using watering cans, there is a <Chance>% chance it is not consumed!"
}
local v645 = {
	["Chance"] = {
		["Max"] = 12,
		["Base"] = 6,
		["Scale"] = 0.45
	}
}
v644.States = v645
v1["Water Reserve"] = v644
local v646 = {
	["Description"] = "When selling silver fruit, it has a <Chance>% chance to grant a random reward! (Max 30%)"
}
local v647 = {
	["Chance"] = {
		["Max"] = 14,
		["Base"] = 7,
		["Scale"] = 0.07
	}
}
v646.States = v647
v1["Shiny Eye"] = v646
local v648 = {
	["Description"] = "Every <Cooldown>m, consumes all fruit on a plant (atleast 3) that is Divine rarity and above: Grants a random egg from the egg shop! Ignores plants with favorited fruit."
}
local v649 = {
	["Cooldown"] = {
		["Min"] = 1400,
		["Base"] = 2405,
		["Scale"] = -12,
		["Formatter"] = "ColonTime"
	}
}
v648.States = v649
v1["Egg Stash"] = v648
local v650 = {
	["Description"] = "When using watering cans, there is a <Chance>% chance it is not consumed!"
}
local v651 = {
	["Chance"] = {
		["Max"] = 24,
		["Base"] = 12,
		["Scale"] = 0.45
	}
}
v650.States = v651
v1["Rainbow Water Reserve"] = v650
local v652 = {
	["Description"] = "When selling silver fruit, it has a <Chance>% chance to grant a random reward! (Max 30%)"
}
local v653 = {
	["Chance"] = {
		["Max"] = 21,
		["Base"] = 14,
		["Scale"] = 0.07
	}
}
v652.States = v653
v1["Rainbow Shiny Eye"] = v652
local v654 = {
	["Description"] = "Every <Cooldown>m, consumes all fruit on a plant (atleast 3) that is Divine rarity and above: Grants a random egg from the egg shop! Ignores plants with favorited fruit."
}
local v655 = {
	["Cooldown"] = {
		["Min"] = 1000,
		["Base"] = 2000,
		["Scale"] = -10,
		["Formatter"] = "ColonTime"
	}
}
v654.States = v655
v1["Rainbow Egg Stash"] = v654
local v656 = {
	["Description"] = "Crafted pets have a bonus 0.1 - <Chance> KG to their base weight! (Max 3 KG)."
}
local v657 = {
	["Chance"] = {
		["Max"] = 0.4,
		["Base"] = 0.18,
		["Scale"] = 0.02
	}
}
v656.States = v657
v1["Supply Line"] = v656
local v658 = {
	["Description"] = "Every <Cooldown>m, roars and <Amount> total cooldown advancement is shared across each pet (max <MaxAmount>s per pet)."
}
local v659 = {
	["Cooldown"] = {
		["Min"] = 200,
		["Base"] = 800,
		["Scale"] = -5,
		["Formatter"] = "ColonTime"
	},
	["Amount"] = {
		["Max"] = 1600,
		["Base"] = 800,
		["Scale"] = 8
	},
	["MaxAmount"] = {
		["Max"] = 160,
		["Base"] = 80,
		["Scale"] = 0.8
	}
}
v658.States = v659
v1["Chimera Call"] = v658
local v660 = {
	["Description"] = "Every <Cooldown>m, rams a random player, knocking them away but gives them a Common Egg!"
}
local v661 = {
	["Cooldown"] = {
		["Min"] = 211,
		["Base"] = 522,
		["Scale"] = -5.2,
		["Formatter"] = "ColonTime"
	}
}
v660.States = v661
v1["Chimera Ram"] = v660
local v662 = {
	["Description"] = "Buying from the seed/gear shop has a <Chance>% chance to duplicate the bought item! (Max 50%)"
}
local v663 = {
	["Chance"] = {
		["Max"] = 8,
		["Base"] = 2,
		["Scale"] = 0.45
	}
}
v662.States = v663
v1["Chimera Commerce"] = v662
local v664 = {
	["Description"] = "Grants <Amount> Sheckles per second!"
}
local v665 = {
	["Amount"] = {
		["Max"] = 2,
		["Base"] = 1,
		["Scale"] = 0.1
	}
}
v664.States = v665
v1.Shecklenator = v664
local v666 = {
	["Description"] = "Every <Cooldown>m, goes to a Coinfruit plant and sacrifices itself to mutates all fruits on the Coinfruit with Coin mutation! (This deletes the Sheckling). Cannot be mimicked."
}
local v667 = {
	["Cooldown"] = {
		["Min"] = 120,
		["Base"] = 360,
		["Scale"] = -3.6,
		["Formatter"] = "ColonTime"
	}
}
v666.States = v667
v1["Coinfruit Lover"] = v666
local v668 = {
	["Description"] = "Every <Cooldown>m, grabs a random mutation from a random fruit in your garden and delivers it to another player\'s fruit! Ignores favorited fruit."
}
local v669 = {
	["Cooldown"] = {
		["Min"] = 120,
		["Base"] = 244.4,
		["Scale"] = -4.4,
		["Formatter"] = "ColonTime"
	}
}
v668.States = v669
v1["Mutation Messenger"] = v668
local v670 = {
	["Description"] = "Every <Cooldown>m, gathers <Amount> Prickly type fruit, forms a caravan with all other camels to travel around the map. Drops one package per fruit along its path. Collect packages for random rewards! Rarer fruit/better variant/more camels gives better rewards."
}
local v671 = {
	["Cooldown"] = {
		["Min"] = 300,
		["Base"] = 606,
		["Scale"] = -6,
		["Formatter"] = "ColonTime"
	},
	["Amount"] = {
		["Max"] = 10,
		["Base"] = 5,
		["Scale"] = 0.15
	}
}
v670.States = v671
v1["Camel Caravan"] = v670
local v672 = {
	["Description"] = "Every <Cooldown>m, grants <MinAmount> - <MaxAmount> Snowballs!"
}
local v673 = {
	["Cooldown"] = {
		["Min"] = 30,
		["Base"] = 180,
		["Scale"] = -1.8,
		["Formatter"] = "ColonTime"
	},
	["MinAmount"] = {
		["Max"] = 6,
		["Base"] = 3,
		["Scale"] = 0.25
	},
	["MaxAmount"] = {
		["Max"] = 12,
		["Base"] = 6,
		["Scale"] = 0.25
	}
}
v672.States = v673
v1["Snow-munition"] = v672
local v674 = {
	["Description"] = "Every <Cooldown>m, consumes Fruits with any Cold type mutations and grants a Snow-Fort based cosmetic reward! Ignores favorited fruit."
}
local v675 = {
	["Cooldown"] = {
		["Min"] = 120,
		["Base"] = 240,
		["Scale"] = -2,
		["Formatter"] = "ColonTime"
	}
}
v674.States = v675
v1["Icy Fortifications"] = v674
local v676 = {
	["Description"] = "Every <Cooldown>m, steals 24 random unique fruit from your garden and restocks the seed shop! Ignores favorited fruit. Cannot be mimicked or refreshed."
}
local v677 = {
	["Cooldown"] = {
		["Min"] = 700,
		["Base"] = 1454,
		["Scale"] = -14,
		["Formatter"] = "ColonTime"
	}
}
v676.States = v677
v1["Arctic Scoundrel"] = v676
local v678 = {
	["Description"] = "Every <Cooldown>m, converts all Frozen mutation within <Range> studs to Glacial mutation. For every mutation converted: <XPAmount> XP is added to all other pets in your garden. (Max 10,000 XP) Ignores favorited fruit"
}
local v679 = {
	["Cooldown"] = {
		["Min"] = 270,
		["Base"] = 540,
		["Scale"] = -6,
		["Formatter"] = "ColonTime"
	},
	["Range"] = {
		["Max"] = 60,
		["Base"] = 30,
		["Scale"] = 0.3
	},
	["XPAmount"] = {
		["Max"] = 1000,
		["Base"] = 500,
		["Scale"] = 50
	}
}
v678.States = v679
v1["Glacial Dragon"] = v678
local v680 = {
	["Description"] = "When selling Fruits with Glacial Mutation, <Chance>% chance a random mutation from that fruit will be applied to the fruits in your garden!"
}
local v681 = {
	["Chance"] = {
		["Max"] = 12,
		["Base"] = 6,
		["Scale"] = 0.1
	}
}
v680.States = v681
v1["Frost Diety"] = v680
local v682 = {
	["Description"] = "Every <Cooldown>m, grants <MinAmount> - <MaxAmount> Snowballs!"
}
local v683 = {
	["Cooldown"] = {
		["Min"] = 30,
		["Base"] = 90,
		["Scale"] = -1.8,
		["Formatter"] = "ColonTime"
	},
	["MinAmount"] = {
		["Max"] = 10,
		["Base"] = 5,
		["Scale"] = 0.25
	},
	["MaxAmount"] = {
		["Max"] = 16,
		["Base"] = 8,
		["Scale"] = 0.25
	}
}
v682.States = v683
v1["GIANT Snow-munition"] = v682
local v684 = {
	["Description"] = "Every <Cooldown>m, consumes Fruits with any Cold type mutations and grants a Snow-Fort based cosmetic reward! Ignores favorited fruit."
}
local v685 = {
	["Cooldown"] = {
		["Min"] = 60,
		["Base"] = 120,
		["Scale"] = -2,
		["Formatter"] = "ColonTime"
	}
}
v684.States = v685
v1["GIANT Icy Fortifications"] = v684
local v686 = {
	["Description"] = "Every <Cooldown>m, steals 24 random unique fruit from your garden and refreshes the seed shop! Ignores favorited fruit. Cannot be mimicked or refreshed."
}
local v687 = {
	["Cooldown"] = {
		["Min"] = 400,
		["Base"] = 800,
		["Scale"] = -14,
		["Formatter"] = "ColonTime"
	}
}
v686.States = v687
v1["Rainbow Arctic Scoundrel"] = v686
local v688 = {
	["Description"] = "Every <Cooldown>m, converts all Frozen mutation within <Range> studs to Glacial mutation. For every mutation converted: <XPAmount> XP is added to all other pets in your garden. (Max 10,000 XP) Ignores favorited fruit"
}
local v689 = {
	["Cooldown"] = {
		["Min"] = 120,
		["Base"] = 270,
		["Scale"] = -6,
		["Formatter"] = "ColonTime"
	},
	["Range"] = {
		["Max"] = 90,
		["Base"] = 45,
		["Scale"] = 0.3
	},
	["XPAmount"] = {
		["Max"] = 2000,
		["Base"] = 1000,
		["Scale"] = 50
	}
}
v688.States = v689
v1["Rainbow Glacial Dragon"] = v688
local v690 = {
	["Description"] = "When selling Fruits with Glacial Mutation, <Chance>% chance a random mutation from that fruit will be applied to the fruits in your garden!"
}
local v691 = {
	["Chance"] = {
		["Max"] = 24,
		["Base"] = 12,
		["Scale"] = 0.1
	}
}
v690.States = v691
v1["Rainbow Frost Diety"] = v690
local v692 = {
	["Description"] = "Every <Cooldown>m, converts an apple into a random gift cosmetic! Collect all 6 variants!"
}
local v693 = {
	["Cooldown"] = {
		["Min"] = 120,
		["Base"] = 420,
		["Scale"] = -4.2,
		["Formatter"] = "ColonTime"
	}
}
v692.States = v693
v1["Gift Wrat"] = v692
local v694 = {
	["Description"] = "Every <Cooldown>m, turns you into a belly sliding penguin for <Duration>s! Also belly slides to <Amount> random fruit in your garden and applies the Arctic mutation!"
}
local v695 = {
	["Cooldown"] = {
		["Min"] = 300,
		["Base"] = 727,
		["Scale"] = -7.2,
		["Formatter"] = "ColonTime"
	},
	["Duration"] = {
		["Max"] = 60,
		["Base"] = 29.7,
		["Scale"] = 1
	},
	["Amount"] = {
		["Max"] = 12,
		["Base"] = 3,
		["Scale"] = 0.3
	}
}
v694.States = v695
v1["Belly Slide"] = v694
local v696 = {
	["Description"] = "Every <Cooldown>m, eats a Carrot for <Multiplier>x sheckles value and grants all Bunnies in your garden <MinXP> - <MaxXP> XP!"
}
local v697 = {
	["Cooldown"] = {
		["Min"] = 140,
		["Base"] = 720,
		["Scale"] = -4.2,
		["Formatter"] = "ColonTime"
	},
	["Multiplier"] = {
		["Base"] = 1.5,
		["Scale"] = 0.015
	},
	["MinXP"] = {
		["Max"] = 2000,
		["Base"] = 1000,
		["Scale"] = 10
	},
	["MaxXP"] = {
		["Max"] = 4000,
		["Base"] = 2000,
		["Scale"] = 10
	}
}
v696.States = v697
v1["Christmas Carrot"] = v696
local v698 = {
	["Description"] = "Christmas type plants within <Range> studs have <Multiplier>x increased size multiplier!"
}
local v699 = {
	["Multiplier"] = {
		["Max"] = 0.7,
		["Base"] = 0.35,
		["Scale"] = 0.035
	},
	["Range"] = {
		["Max"] = 30,
		["Base"] = 15,
		["Scale"] = 0.15
	}
}
v698.States = v699
v1["Christmas Hen"] = v698
local v700 = {
	["Description"] = "Every <Cooldown>m, grabs fruits with Cold type mutations to reduce a random pot\'s cooking time by <Amount>s!"
}
local v701 = {
	["Cooldown"] = {
		["Min"] = 120,
		["Base"] = 300,
		["Scale"] = -3,
		["Formatter"] = "ColonTime"
	},
	["Amount"] = {
		["Max"] = 160,
		["Base"] = 80,
		["Scale"] = 1
	}
}
v700.States = v701
v1["Cold Belly"] = v700
local v702 = {
	["Description"] = "Every <Cooldown>m, croaks at the nearest plant, advancing growth by <Time>m for each Christmas type pet in your garden, then all fruits on that plant will get the Chilled mutation!"
}
local v703 = {
	["Cooldown"] = {
		["Min"] = 200,
		["Base"] = 909,
		["Scale"] = -9,
		["Formatter"] = "ColonTime"
	},
	["Time"] = {
		["Max"] = 1800,
		["Base"] = 891,
		["Scale"] = 9,
		["Formatter"] = "ColonTime"
	}
}
v702.States = v703
v1["Jolly Croak"] = v702
local v704 = {
	["Description"] = "Every <Cooldown>m, consumes a percentage of your sheckles to punish the nearest player to you! Greater punishments are rarer and consume more sheckles."
}
local v705 = {
	["Cooldown"] = {
		["Min"] = 300,
		["Base"] = 600,
		["Scale"] = -6,
		["Formatter"] = "ColonTime"
	}
}
v704.States = v705
v1["Coal Sack"] = v704
local v706 = {
	["Description"] = "Every <Cooldown>m, eats a Carrot for <Multiplier>x sheckles value and grants all Bunnies in your garden <MinXP> - <MaxXP> XP!"
}
local v707 = {
	["Cooldown"] = {
		["Min"] = 120,
		["Base"] = 360,
		["Scale"] = -4.2,
		["Formatter"] = "ColonTime"
	},
	["Multiplier"] = {
		["Base"] = 1.5,
		["Scale"] = 0.015
	},
	["MinXP"] = {
		["Max"] = 4000,
		["Base"] = 2000,
		["Scale"] = 10
	},
	["MaxXP"] = {
		["Max"] = 8000,
		["Base"] = 4000,
		["Scale"] = 10
	}
}
v706.States = v707
v1["Rainbow Christmas Carrot"] = v706
local v708 = {
	["Description"] = "Christmas type plants within <Range> studs have <Multiplier>x increased size multiplier!"
}
local v709 = {
	["Multiplier"] = {
		["Max"] = 0.7,
		["Base"] = 0.35,
		["Scale"] = 0.035
	},
	["Range"] = {
		["Max"] = 40,
		["Base"] = 20,
		["Scale"] = 0.2
	}
}
v708.States = v709
v1["Rainbow Christmas Hen"] = v708
local v710 = {
	["Description"] = "Every <Cooldown>s, grabs fruits with Cold type mutations to reduce a random pot\'s cooking time by <Amount>s!"
}
local v711 = {
	["Cooldown"] = {
		["Min"] = 75,
		["Base"] = 150,
		["Scale"] = -1.5,
		["Formatter"] = "ColonTime"
	},
	["Amount"] = {
		["Max"] = 240,
		["Base"] = 120,
		["Scale"] = 1
	}
}
v710.States = v711
v1["Rainbow Cold Belly"] = v710
local v712 = {
	["Description"] = "Every <Cooldown>m, croaks at the nearest plant, advancing growth by <Time>m for each Christmas type pet in your garden, then all fruits on that plant will get the Chilled mutation!"
}
local v713 = {
	["Cooldown"] = {
		["Min"] = 100,
		["Base"] = 606,
		["Scale"] = -6,
		["Formatter"] = "ColonTime"
	},
	["Time"] = {
		["Max"] = 2000,
		["Base"] = 1300,
		["Scale"] = 9,
		["Formatter"] = "ColonTime"
	}
}
v712.States = v713
v1["Rainbow Jolly Croak"] = v712
local v714 = {
	["Description"] = "Every <Cooldown>m, consumes a percentage of your sheckles to punish the nearest player to you! Greater punishments are rarer and consume more sheckles."
}
local v715 = {
	["Cooldown"] = {
		["Min"] = 240,
		["Base"] = 480,
		["Scale"] = -6,
		["Formatter"] = "ColonTime"
	}
}
v714.States = v715
v1["Rainbow Coal Sack"] = v714
local v716 = {
	["Description"] = "Christmas plants within <Range> studs have <Multiplier>x increased growth speed chance!"
}
local v717 = {
	["Multiplier"] = {
		["Max"] = 0.6,
		["Base"] = 0.3,
		["Scale"] = 0.03
	},
	["Range"] = {
		["Max"] = 30,
		["Base"] = 15,
		["Scale"] = 0.15
	}
}
v716.States = v717
v1["Christmas Dove"] = v716
local v718 = {
	["Description"] = "Gains an additional <Amount> XP/s for every other Reindeer in your garden!"
}
local v719 = {
	["Amount"] = {
		["Max"] = 12,
		["Base"] = 6,
		["Scale"] = 0.06
	}
}
v718.States = v719
v1["Sleigh Synergy"] = v718
local v720 = {
	["Description"] = "Every <Cooldown>m, has <Chance>% chance to apply the Snowy mutation to a nearby fruit!"
}
local v721 = {
	["Cooldown"] = {
		["Min"] = 150,
		["Base"] = 303,
		["Scale"] = -3,
		["Formatter"] = "ColonTime"
	},
	["Chance"] = {
		["Max"] = 28,
		["Base"] = 14,
		["Scale"] = 0.14
	}
}
v720.States = v721
v1["Beast of Snow"] = v720
local v722 = {
	["Description"] = "Every <Cooldown>m, cracks open a random Nutty type fruit and grants a random Christmas related reward! Ignores favorited fruit."
}
local v723 = {
	["Cooldown"] = {
		["Min"] = 360,
		["Base"] = 720,
		["Scale"] = -4.2,
		["Formatter"] = "ColonTime"
	}
}
v722.States = v723
v1.Nutcracker = v722
local v724 = {
	["Description"] = "Every <Cooldown>m devours a fruit with atleast 16 mutations to summon the Yeti Night weather! Ignores favorited fruit!"
}
local v725 = {
	["Cooldown"] = {
		["Min"] = 400,
		["Base"] = 909,
		["Scale"] = -9,
		["Formatter"] = "ColonTime"
	}
}
v724.States = v725
v1["Yeti Night"] = v724
local v726 = {
	["Description"] = "Grants a <font color=\'#FFD700\'><Chance>%</font> chance for the pet mutation acquired from Pet Mutation Machine to become one of four Ice Golem\226\128\147exclusive mutations:\n\n<font color=\'#00C800\'>Christmas Rally</font>, <font color=\'#FF0000\'>Jolly Decorator</font>, <font color=\'#FFD700\'>Merry Nursery</font>, with a rare chance for <font color=\'#5AC8FF\'>Giant Golem</font>!"
}
local v727 = {
	["Chance"] = {
		["Max"] = 10,
		["Base"] = 4,
		["Scale"] = 0.4
	}
}
v726.States = v727
v1["Cold Gears"] = v726
local v728 = {
	["Description"] = "Christmas plants within <Range> studs have <Multiplier>x increased growth speed chance!"
}
local v729 = {
	["Multiplier"] = {
		["Max"] = 1.2,
		["Base"] = 0.6,
		["Scale"] = 0.06
	},
	["Range"] = {
		["Max"] = 50,
		["Base"] = 25,
		["Scale"] = 0.15
	}
}
v728.States = v729
v1["Festive Christmas Dove"] = v728
local v730 = {
	["Description"] = "Gains an additional <Amount> XP/s for every other Reindeer in your garden!"
}
local v731 = {
	["Amount"] = {
		["Max"] = 16,
		["Base"] = 8,
		["Scale"] = 0.08
	}
}
v730.States = v731
v1["Festive Sleigh Synergy"] = v730
local v732 = {
	["Description"] = "Every <Cooldown>m, has <Chance>% chance to apply the Snowy mutation to a nearby fruit!"
}
local v733 = {
	["Cooldown"] = {
		["Min"] = 80,
		["Base"] = 151.5,
		["Scale"] = -1.5,
		["Formatter"] = "ColonTime"
	},
	["Chance"] = {
		["Max"] = 40,
		["Base"] = 20,
		["Scale"] = 0.2
	}
}
v732.States = v733
v1["Festive Beast of Snow"] = v732
local v734 = {
	["Description"] = "Every <Cooldown>m, cracks open a random Nutty type fruit and grants a random Christmas related reward! Ignores favorited fruit."
}
local v735 = {
	["Cooldown"] = {
		["Min"] = 120,
		["Base"] = 360,
		["Scale"] = -3.6,
		["Formatter"] = "ColonTime"
	}
}
v734.States = v735
v1["Festive Nutcracker"] = v734
local v736 = {
	["Description"] = "Every <Cooldown>m devours a fruit with atleast 16 mutations to summon the Yeti Night weather! Ignores favorited fruit!"
}
local v737 = {
	["Cooldown"] = {
		["Min"] = 300,
		["Base"] = 600,
		["Scale"] = -6,
		["Formatter"] = "ColonTime"
	}
}
v736.States = v737
v1["Festive Yeti Night"] = v736
local v738 = {
	["Description"] = "Grants a <font color=\'#FFD700\'><Chance>%</font> chance for the pet mutation acquired from Pet Mutation Machine to become one of four Ice Golem\226\128\147exclusive mutations:\n\n<font color=\'#00C800\'>Christmas Rally</font>, <font color=\'#FF0000\'>Jolly Decorator</font>, <font color=\'#FFD700\'>Merry Nursery</font>, with a rare chance for <font color=\'#5AC8FF\'>Giant Golem</font>!"
}
local v739 = {
	["Chance"] = {
		["Max"] = 16,
		["Base"] = 8,
		["Scale"] = 0.8
	}
}
v738.States = v739
v1["Festive Cold Gears"] = v738
local v740 = {
	["Description"] = "Every <Cooldown>m, initiates a battle with another player\'s Beetle. If your beetle wins you get a reward! The higher level and heavier the beetle the more likely it is to win! Pine Beetles can give a beetle reward exclusive to it."
}
local v741 = {
	["Cooldown"] = {
		["Min"] = 80,
		["Base"] = 360,
		["Scale"] = -2,
		["Formatter"] = "ColonTime"
	}
}
v740.States = v741
v1["Pine Beetle Duel"] = v740
local v742 = {
	["Description"] = "Every <Cooldown>m, goes to a Hot Chocolate Mug cosmetic and naps near it for <Duration>s. New fruit within <Range> studs will be <Multiplier>x larger"
}
local v743 = {
	["Cooldown"] = {
		["Min"] = 120,
		["Base"] = 244,
		["Scale"] = -2,
		["Formatter"] = "ColonTime"
	},
	["Range"] = {
		["Max"] = 30,
		["Base"] = 15,
		["Scale"] = 0.15
	},
	["Duration"] = {
		["Max"] = 28,
		["Base"] = 14.5,
		["Scale"] = 0.15
	},
	["Multiplier"] = {
		["Max"] = 2,
		["Base"] = 1,
		["Scale"] = 0.1
	}
}
v742.States = v743
v1["Cocoa Nap"] = v742
local v744 = {
	["Description"] = "Every <Cooldown>m, has a <Chance>% chance to mutate a random fruit with the Eggnog mutation. Gains additional <Amount>% chance for every Egg in your garden."
}
local v745 = {
	["Cooldown"] = {
		["Min"] = 150,
		["Base"] = 303,
		["Scale"] = -3,
		["Formatter"] = "ColonTime"
	},
	["Chance"] = {
		["Max"] = 6,
		["Base"] = 3,
		["Scale"] = 0.03
	},
	["Amount"] = {
		["Max"] = 4,
		["Base"] = 2,
		["Scale"] = 0.02
	}
}
v744.States = v745
v1.Eggnoginator = v744
local v746 = {
	["Description"] = "Every <Cooldown>m, grants <Amount>XP to a random non-Reindeer Pet in your garden for every Reindeer in your garden!"
}
local v747 = {
	["Cooldown"] = {
		["Min"] = 150,
		["Base"] = 300,
		["Scale"] = -3,
		["Formatter"] = "ColonTime"
	},
	["Amount"] = {
		["Max"] = 4000,
		["Base"] = 2000,
		["Scale"] = 20
	}
}
v746.States = v747
v1["Red-Nosed Reindeer"] = v746
local v748 = {
	["Description"] = "Every <Cooldown>m, mutates fruit up to the number of Reindeer in your garden with Ornamented mutation!"
}
local v749 = {
	["Cooldown"] = {
		["Min"] = 400,
		["Base"] = 913,
		["Scale"] = -9,
		["Formatter"] = "ColonTime"
	}
}
v748.States = v749
v1["Shiny Nose"] = v748
local v750 = {
	["Description"] = "Grants Christmas plants in <Range> studs a <Multiplier>x variant chance bonus!"
}
local v751 = {
	["Multiplier"] = {
		["Max"] = 0.8,
		["Base"] = 0.4,
		["Scale"] = 0.04
	},
	["Range"] = {
		["Max"] = 40,
		["Base"] = 20,
		["Scale"] = 0.2
	}
}
v750.States = v751
v1["Christmas Partridge"] = v750
local v752 = {
	["Description"] = "Every <Cooldown>m, spawns a gift randomly somewhere! Finding the Gift will grant a Christmas related reward!"
}
local v753 = {
	["Cooldown"] = {
		["Min"] = 120,
		["Base"] = 540,
		["Scale"] = -5.4,
		["Formatter"] = "ColonTime"
	}
}
v752.States = v753
v1["Merry Beary"] = v752
local v754 = {
	["Description"] = "When Christmas type pets finish their abilities, they start their cooldown with <Chance> seconds less!"
}
local v755 = {
	["Chance"] = {
		["Max"] = 30,
		["Base"] = 15,
		["Scale"] = 0.4
	}
}
v754.States = v755
v1["Christmas Support"] = v754
local v756 = {
	["Description"] = "Every <Cooldown>m, eats a fruit with a Cold type mutation and all nearby plants within <Range> studs advance growth by <Amount>m! Ignores favorited fruit."
}
local v757 = {
	["Cooldown"] = {
		["Min"] = 120,
		["Base"] = 240,
		["Scale"] = -2.4,
		["Formatter"] = "ColonTime"
	},
	["Range"] = {
		["Max"] = 60,
		["Base"] = 30,
		["Scale"] = 0.3
	},
	["Amount"] = {
		["Max"] = 360,
		["Base"] = 180,
		["Scale"] = 1.8,
		["Formatter"] = "ColonTime"
	}
}
v756.States = v757
v1["Moose Call"] = v756
local v758 = {
	["Description"] = "Every <Cooldown>m, has a <Chance>% chance to apply the Subzero Mutation!"
}
local v759 = {
	["Cooldown"] = {
		["Min"] = 30,
		["Base"] = 303,
		["Scale"] = -3,
		["Formatter"] = "ColonTime"
	},
	["Chance"] = {
		["Max"] = 24,
		["Base"] = 12,
		["Scale"] = 0.12
	}
}
v758.States = v759
v1["FREEZE!"] = v758
local v760 = {
	["Description"] = "Loses 0.25% Hunger per second. At 30%+ Hunger, all other pets gain +<Amount> XP/s. At 60%+ Hunger, all other pets stop losing Hunger. At 90%+ Hunger, both bonuses are active simultaneously."
}
local v761 = {
	["Amount"] = {
		["Max"] = 60,
		["Base"] = 30,
		["Scale"] = 0.3
	}
}
v760.States = v761
v1["Gnawing Hunger"] = v760
local v762 = {
	["Description"] = "Grants Christmas plants in <Range> studs a <Multiplier>x variant chance bonus!"
}
local v763 = {
	["Multiplier"] = {
		["Max"] = 1,
		["Base"] = 0.5,
		["Scale"] = 0.05
	},
	["Range"] = {
		["Max"] = 60,
		["Base"] = 30,
		["Scale"] = 0.3
	}
}
v762.States = v763
v1["Festive Christmas Partridge"] = v762
local v764 = {
	["Description"] = "Every <Cooldown>m, spawns a gift randomly somewhere! Finding the Gift will grant a Christmas related reward!"
}
local v765 = {
	["Cooldown"] = {
		["Min"] = 100,
		["Base"] = 300,
		["Scale"] = -4,
		["Formatter"] = "ColonTime"
	}
}
v764.States = v765
v1["Festive Merry Beary"] = v764
local v766 = {
	["Description"] = "When Christmas type pets finish their abilities, they start their cooldown with <Chance> seconds less!"
}
local v767 = {
	["Chance"] = {
		["Max"] = 60,
		["Base"] = 30,
		["Scale"] = 0.3
	}
}
v766.States = v767
v1["Festive Christmas Support"] = v766
local v768 = {
	["Description"] = "Every <Cooldown>m, eats a fruit with a Cold type mutation and all nearby plants within <Range> studs advance growth by <Amount>m! Ignores favorited fruit."
}
local v769 = {
	["Cooldown"] = {
		["Min"] = 100,
		["Base"] = 200,
		["Scale"] = -2,
		["Formatter"] = "ColonTime"
	},
	["Range"] = {
		["Max"] = 80,
		["Base"] = 40,
		["Scale"] = 0.4
	},
	["Amount"] = {
		["Max"] = 400,
		["Base"] = 200,
		["Scale"] = 2,
		["Formatter"] = "ColonTime"
	}
}
v768.States = v769
v1["Festive Moose Call"] = v768
local v770 = {
	["Description"] = "Every <Cooldown>m, has a <Chance>% chance to apply the Subzero Mutation!"
}
local v771 = {
	["Cooldown"] = {
		["Min"] = 15,
		["Base"] = 170,
		["Scale"] = -3,
		["Formatter"] = "ColonTime"
	},
	["Chance"] = {
		["Max"] = 48,
		["Base"] = 24,
		["Scale"] = 0.24
	}
}
v770.States = v771
v1["Festive FREEZE!"] = v770
local v772 = {
	["Description"] = "Loses 0.25% Hunger per second. At 30%+ Hunger, all other pets gain +<Amount> XP/s. At 60%+ Hunger, all other pets stop losing Hunger. At 90%+ Hunger, both bonuses are active simultaneously."
}
local v773 = {
	["Amount"] = {
		["Max"] = 100,
		["Base"] = 50,
		["Scale"] = 0.5
	}
}
v772.States = v773
v1["Festive Gnawing Hunger"] = v772
local v774 = {
	["Description"] = "Every <Cooldown>m, <Chance>% chance a nearby fruit becomes Sandy or Snowy!"
}
local v775 = {
	["Cooldown"] = {
		["Min"] = 30,
		["Base"] = 120,
		["Scale"] = -1.2,
		["Formatter"] = "ColonTime"
	},
	["Chance"] = {
		["Max"] = 20,
		["Base"] = 10,
		["Scale"] = 0.1
	}
}
v774.States = v775
v1["Yellow Christmas"] = v774
local v776 = {
	["Description"] = "Christmas type plants within <Range> studs have increased <VariantMultiplier>x variant chance, <GrowthMultiplier>x growth speed and <SizeMultiplier>x size bonus!"
}
local v777 = {
	["VariantMultiplier"] = {
		["Max"] = 1.5,
		["Base"] = 0.6,
		["Scale"] = 0.05
	},
	["GrowthMultiplier"] = {
		["Max"] = 3,
		["Base"] = 1.4,
		["Scale"] = 0.1
	},
	["SizeMultiplier"] = {
		["Max"] = 1,
		["Base"] = 0.42,
		["Scale"] = 0.05
	},
	["Range"] = {
		["Max"] = 60,
		["Base"] = 32,
		["Scale"] = 0.25
	}
}
v776.States = v777
v1["The Christmas Spirit"] = v776
local v778 = {
	["Description"] = "Every <Cooldown>m, <Amount> random fruit have a <Chance>% chance to get the Festive mutation!"
}
local v779 = {
	["Cooldown"] = {
		["Min"] = 450,
		["Base"] = 909,
		["Scale"] = -9,
		["Formatter"] = "ColonTime"
	},
	["Chance"] = {
		["Max"] = 20,
		["Base"] = 10,
		["Scale"] = 0.2
	},
	["Amount"] = {
		["Max"] = 8,
		["Base"] = 4,
		["Scale"] = 0.04
	}
}
v778.States = v779
v1["The Christmas Cheer"] = v778
local v780 = {
	["Description"] = "All active Christmas type pets gain an additional <Chance> XP/s!"
}
local v781 = {
	["Chance"] = {
		["Max"] = 4,
		["Base"] = 1.4,
		["Scale"] = 0.05
	}
}
v780.States = v781
v1["The Christmas Rally"] = v780
local v782 = {
	["Description"] = ""
}
local v783 = {
	["Multiplier"] = {
		["Max"] = 1,
		["Base"] = 0.42,
		["Scale"] = 0.05
	},
	["Range"] = {
		["Max"] = 60,
		["Base"] = 32,
		["Scale"] = 0.25
	}
}
v782.States = v783
v1["Christmas Power"] = v782
local v784 = {
	["Description"] = ""
}
local v785 = {
	["Multiplier"] = {
		["Max"] = 3,
		["Base"] = 1.4,
		["Scale"] = 0.1
	},
	["Range"] = {
		["Max"] = 60,
		["Base"] = 32,
		["Scale"] = 0.25
	}
}
v784.States = v785
v1["Christmas Tempo"] = v784
local v786 = {
	["Description"] = ""
}
local v787 = {
	["Multiplier"] = {
		["Max"] = 1.5,
		["Base"] = 0.6,
		["Scale"] = 0.05
	},
	["Range"] = {
		["Max"] = 60,
		["Base"] = 32,
		["Scale"] = 0.25
	}
}
v786.States = v787
v1["Christmas Blessing"] = v786
local v788 = {
	["Description"] = "Every <Cooldown>m flies around and launches fireworks everywhere to celebrate the new year!"
}
local v789 = {
	["Cooldown"] = {
		["Min"] = 60,
		["Base"] = 120,
		["Scale"] = -1.2,
		["Formatter"] = "ColonTime"
	}
}
v788.States = v789
v1["New Year\'s Bird"] = v788
local v790 = {
	["Description"] = "Every <Cooldown>m, grants <MinAmount> - <MaxAmount> Fireworks!"
}
local v791 = {
	["Cooldown"] = {
		["Min"] = 60,
		["Base"] = 180,
		["Scale"] = -1.8,
		["Formatter"] = "ColonTime"
	},
	["MinAmount"] = {
		["Max"] = 6,
		["Base"] = 3,
		["Scale"] = 0.05
	},
	["MaxAmount"] = {
		["Max"] = 10,
		["Base"] = 5,
		["Scale"] = 0.05
	}
}
v790.States = v791
v1["Firework Fairy"] = v790
local v792 = {
	["Description"] = "Every <Cooldown>m, <Chance>% chance to dig up a random New Year cosmetic!"
}
local v793 = {
	["Cooldown"] = {
		["Min"] = 100,
		["Base"] = 200,
		["Scale"] = -2,
		["Formatter"] = "ColonTime"
	},
	["Chance"] = {
		["Max"] = 20,
		["Base"] = 10,
		["Scale"] = 0.1
	}
}
v792.States = v793
v1["Celebration\'s Best Friend"] = v792
local v794 = {
	["Description"] = "Every <Cooldown>m, grabs a random crop from your garden and brings it to 1 of 4 different things for different bonuses! (Ignores favorited)"
}
local v795 = {
	["Cooldown"] = {
		["Min"] = 240,
		["Base"] = 480,
		["Scale"] = -4.2,
		["Formatter"] = "ColonTime"
	},
	["EggAdvancementAmount"] = {
		["Max"] = 200,
		["Base"] = 100,
		["Scale"] = 1
	},
	["GearMaxAmount"] = {
		["Max"] = 6,
		["Base"] = 3,
		["Scale"] = 0.03
	},
	["PetXPAmount"] = {
		["Max"] = 2000,
		["Base"] = 1000,
		["Scale"] = 10
	}
}
v794.States = v795
v1["Primate Productivity"] = v794
local v796 = {
	["Description"] = "Every <Cooldown>m consumes the energy of 5 random moonlit fruits (Ignores favorited), howls and calls forth <AmountMin> - <AmountMax> shooting stars to fall on your garden which mutate fruits into Celestial!"
}
local v797 = {
	["Cooldown"] = {
		["Min"] = 540,
		["Base"] = 1040,
		["Scale"] = -10.4,
		["Formatter"] = "ColonTime"
	},
	["AmountMin"] = {
		["Max"] = 4,
		["Base"] = 2,
		["Scale"] = 0.04
	},
	["AmountMax"] = {
		["Max"] = 8,
		["Base"] = 4,
		["Scale"] = 0.04
	}
}
v796.States = v797
v1["Celestial Howl"] = v796
local v798 = {
	["Description"] = "Every <Cooldown>m breathes fireworks on <AmountMin> - <AmountMax> random fruits in your garden and mutates them with Firework mutation!"
}
local v799 = {
	["Cooldown"] = {
		["Min"] = 540,
		["Base"] = 1080,
		["Scale"] = -10.8,
		["Formatter"] = "ColonTime"
	},
	["AmountMin"] = {
		["Max"] = 20,
		["Base"] = 20,
		["Scale"] = 0
	},
	["AmountMax"] = {
		["Max"] = 26,
		["Base"] = 26,
		["Scale"] = 0
	}
}
v798.States = v799
v1["Breath of Fireworks"] = v798
local v800 = {
	["Description"] = "Every <Cooldown>m, consumes <Amount> fruit with the Firework mutation to give you the Dragon\'s Firework Gear which has positive bonuses when used! Cannot be mimicked or refreshed."
}
local v801 = {
	["Cooldown"] = {
		["Min"] = 400,
		["Base"] = 720,
		["Scale"] = -7.2,
		["Formatter"] = "ColonTime"
	},
	["Amount"] = {
		["Max"] = 100,
		["Min"] = 100,
		["Base"] = 100,
		["Scale"] = 0
	}
}
v800.States = v801
v1.Resolution = v800
local v802 = {
	["Description"] = "Every <Cooldown>m flies around and launches fireworks everywhere to celebrate the new year!"
}
local v803 = {
	["Cooldown"] = {
		["Min"] = 30,
		["Base"] = 60,
		["Scale"] = -0.6,
		["Formatter"] = "ColonTime"
	}
}
v802.States = v803
v1["Rainbow New Year\'s Bird"] = v802
local v804 = {
	["Description"] = "Every <Cooldown>m, grants <MinAmount> - <MaxAmount> Fireworks!"
}
local v805 = {
	["Cooldown"] = {
		["Min"] = 50,
		["Base"] = 100,
		["Scale"] = -1,
		["Formatter"] = "ColonTime"
	},
	["MinAmount"] = {
		["Max"] = 10,
		["Base"] = 5,
		["Scale"] = 0.08
	},
	["MaxAmount"] = {
		["Max"] = 16,
		["Base"] = 8,
		["Scale"] = 0.08
	}
}
v804.States = v805
v1["Rainbow Firework Fairy"] = v804
local v806 = {
	["Description"] = "Every <Cooldown>m, <Chance>% chance to dig up a random New Year cosmetic!"
}
local v807 = {
	["Cooldown"] = {
		["Min"] = 50,
		["Base"] = 100,
		["Scale"] = -1
	},
	["Chance"] = {
		["Max"] = 40,
		["Base"] = 20,
		["Scale"] = 0.2
	}
}
v806.States = v807
v1["Rainbow Celebration\'s Best Friend"] = v806
local v808 = {
	["Description"] = "Every <Cooldown>m, grabs a random crop from your garden and brings it to 1 of 4 different things for different bonuses! (Ignores favorited)"
}
local v809 = {
	["Cooldown"] = {
		["Min"] = 120,
		["Base"] = 240,
		["Scale"] = -2.4,
		["Formatter"] = "ColonTime"
	},
	["EggAdvancementAmount"] = {
		["Max"] = 300,
		["Base"] = 150,
		["Scale"] = 1.5
	},
	["GearMaxAmount"] = {
		["Max"] = 10,
		["Base"] = 5,
		["Scale"] = 0.05
	},
	["PetXPAmount"] = {
		["Max"] = 3000,
		["Base"] = 1500,
		["Scale"] = 15
	}
}
v808.States = v809
v1["Rainbow Primate Productivity"] = v808
local v810 = {
	["Description"] = "Every <Cooldown>m consumes the energy of 5 random moonlit fruits (Ignores favorited), howls and calls forth <AmountMin> - <AmountMax> shooting stars to fall on your garden which mutate fruits into Celestial!"
}
local v811 = {
	["Cooldown"] = {
		["Min"] = 200,
		["Base"] = 520,
		["Scale"] = -5.2,
		["Formatter"] = "ColonTime"
	},
	["AmountMin"] = {
		["Max"] = 8,
		["Base"] = 4,
		["Scale"] = 0.04
	},
	["AmountMax"] = {
		["Max"] = 16,
		["Base"] = 8,
		["Scale"] = 0.04
	}
}
v810.States = v811
v1["Rainbow Celestial Howl"] = v810
local v812 = {
	["Description"] = "Every <Cooldown>m breathes fireworks on <AmountMin> - <AmountMax> random fruits in your garden and mutates them with Firework mutation!"
}
local v813 = {
	["Cooldown"] = {
		["Min"] = 300,
		["Base"] = 600,
		["Scale"] = -6.8,
		["Formatter"] = "ColonTime"
	},
	["AmountMin"] = {
		["Max"] = 20,
		["Base"] = 20,
		["Scale"] = 0
	},
	["AmountMax"] = {
		["Max"] = 26,
		["Base"] = 26,
		["Scale"] = 0
	}
}
v812.States = v813
v1["Rainbow Breath of Fireworks"] = v812
local v814 = {
	["Description"] = "Every <Cooldown>m, consumes <Amount> fruit with the Firework mutation to give you the Dragon\'s Firework Gear which has positive bonuses when used! Cannot be mimicked or refreshed."
}
local v815 = {
	["Cooldown"] = {
		["Min"] = 200,
		["Base"] = 400,
		["Scale"] = -4,
		["Formatter"] = "ColonTime"
	},
	["Amount"] = {
		["Max"] = 80,
		["Min"] = 80,
		["Base"] = 80,
		["Scale"] = 0
	}
}
v814.States = v815
v1["Rainbow Resolution"] = v814
local v816 = {
	["Description"] = "Grants <Chance>% increased movement speed!"
}
local v817 = {
	["Chance"] = {
		["Max"] = 48,
		["Base"] = 24,
		["Scale"] = 0.24
	}
}
v816.States = v817
v1.Unicycling = v816
local v818 = {
	["Description"] = "Every <Cooldown>m, plays ball with you. Every time you succesfully recieve the ball a random plant in your garden grows by <AmountGrowth>s or a random pet gets <AmountXP> XP! (Max 15)"
}
local v819 = {
	["Cooldown"] = {
		["Min"] = 300,
		["Base"] = 600,
		["Scale"] = -6,
		["Formatter"] = "ColonTime"
	},
	["AmountGrowth"] = {
		["Max"] = 120,
		["Base"] = 60,
		["Scale"] = 0.6
	},
	["AmountXP"] = {
		["Max"] = 100,
		["Base"] = 50,
		["Scale"] = 0.5
	}
}
v818.States = v819
v1["Play Ball"] = v818
local v820 = {
	["Description"] = "Every <Cooldown>m, goes to a random fruit in your garden and does a trick on it, applying the Whimsical mutation!"
}
local v821 = {
	["Cooldown"] = {
		["Min"] = 200,
		["Base"] = 1200,
		["Scale"] = -12,
		["Formatter"] = "ColonTime"
	}
}
v820.States = v821
v1["One Bear Act"] = v820
v1["Pony Parade"] = {
	["Description"] = "Every 30m on the clock, All your Ponies form a line and Parade towards the Gear Shop, Egg Shop or Seed Shop and has a chance to restock 1 random item for every pony in the parade.",
	["States"] = {}
}
local v822 = {
	["Description"] = "When a pet finishes their ability: There is a <Chance>% chance the ability is activated again. You cannot have two pets of the same type for this passive to activate. (Except Carnival Elephants)"
}
local v823 = {
	["Chance"] = {
		["Max"] = 6,
		["Base"] = 3,
		["Scale"] = 0.03
	}
}
v822.States = v823
v1["The Show Must Go On"] = v822
local v824 = {
	["Description"] = "Grants <Chance>% increased movement speed!"
}
local v825 = {
	["Chance"] = {
		["Max"] = 64,
		["Base"] = 32,
		["Scale"] = 0.32
	}
}
v824.States = v825
v1["Rainbow Unicycling"] = v824
local v826 = {
	["Description"] = "Every <Cooldown>m, plays ball with you. Every time you succesfully recieve the ball a random plant in your garden grows by <AmountGrowth>s or a random pet gets <AmountXP> XP! (Max 15)"
}
local v827 = {
	["Cooldown"] = {
		["Min"] = 250,
		["Base"] = 500,
		["Scale"] = -5,
		["Formatter"] = "ColonTime"
	},
	["AmountGrowth"] = {
		["Max"] = 240,
		["Base"] = 120,
		["Scale"] = 0.6
	},
	["AmountXP"] = {
		["Max"] = 200,
		["Base"] = 100,
		["Scale"] = 0.5
	}
}
v826.States = v827
v1["Rainbow Play Ball"] = v826
local v828 = {
	["Description"] = "Every <Cooldown>m, goes to a random fruit in your garden and does a trick on it, applying the Whimsical mutation!"
}
local v829 = {
	["Cooldown"] = {
		["Min"] = 100,
		["Base"] = 600,
		["Scale"] = -6,
		["Formatter"] = "ColonTime"
	}
}
v828.States = v829
v1["Rainbow One Bear Act"] = v828
v1["Rainbow Pony Parade"] = {
	["Description"] = "Every 30m on the clock, All your Ponies form a line and Parade towards the Gear Shop, Egg Shop or Seed Shop and has a chance to restock 1 random item for every pony in the parade.",
	["States"] = {}
}
local v830 = {
	["Description"] = "When a pet finishes their ability: There is a <Chance>% chance the ability is activated again. You cannot have two pets of the same type for this passive to activate. (Except Carnival Elephants)"
}
local v831 = {
	["Chance"] = {
		["Max"] = 10,
		["Base"] = 5,
		["Scale"] = 0.05
	}
}
v830.States = v831
v1["Rainbow The Show Must Go On"] = v830
local v832 = {
	["Description"] = "Every <Cooldown>m, rams a random player, knocking them away with a <Chance>% chance to give them a random single harvest seed from the seed shop. Rarer seeds have rarer chance."
}
local v833 = {
	["Cooldown"] = {
		["Min"] = 100,
		["Base"] = 360,
		["Scale"] = -3.6,
		["Formatter"] = "ColonTime"
	},
	["Chance"] = {
		["Max"] = 40,
		["Base"] = 30,
		["Scale"] = 0.3
	}
}
v832.States = v833
v1["Angora Ram"] = v832
local v834 = {
	["Description"] = "<Chance>% extra chance harvested plants drop seeds. Rarer plants have lower chance to duplicate."
}
local v835 = {
	["Chance"] = {
		["Max"] = 30,
		["Base"] = 15,
		["Scale"] = 0.05
	}
}
v834.States = v835
v1["Fat Snake"] = v834
local v836 = {
	["Description"] = "Every <Cooldown>m, converts a Buttercup into a random mechanical themed cosmetic! Collect all 5!"
}
local v837 = {
	["Cooldown"] = {
		["Min"] = 120,
		["Base"] = 420,
		["Scale"] = -4.2,
		["Formatter"] = "ColonTime"
	}
}
v836.States = v837
v1["Mechanical Rodent"] = v836
local v838 = {
	["Description"] = "Every <Cooldown>m, <Chance>% chance for a nearby fruit to become Burnt or Flaming!"
}
local v839 = {
	["Cooldown"] = {
		["Min"] = 15,
		["Base"] = 404,
		["Scale"] = -4,
		["Formatter"] = "ColonTime"
	},
	["Chance"] = {
		["Base"] = 15,
		["Scale"] = 0.15
	}
}
v838.States = v839
v1["Hot Honey"] = v838
local v840 = {
	["Description"] = "Every <Cooldown>m, initiates a battle with another player\'s Beetle. If your beetle wins you get a reward! The higher level and heavier the beetle the more likely it is to win! Champion Beetles can reward Beetle Medals which when used on a pet gains XP based on number of Beetle Trophies you have in your garden!"
}
local v841 = {
	["Cooldown"] = {
		["Min"] = 80,
		["Base"] = 360,
		["Scale"] = -2,
		["Formatter"] = "ColonTime"
	}
}
v840.States = v841
v1["Champion Beetle Duel"] = v840
local v842 = {
	["Description"] = "Every <Cooldown>s, naps for <Duration>s. New fruit within <Range> studs will be <Multiplier>x larger and have a <Chance>% chance to be mutated with Sleepy mutation!"
}
local v843 = {
	["Cooldown"] = {
		["Min"] = 100,
		["Base"] = 202,
		["Scale"] = -2
	},
	["Duration"] = {
		["Max"] = 30,
		["Base"] = 15,
		["Scale"] = 0.15
	},
	["Range"] = {
		["Max"] = 40,
		["Base"] = 20,
		["Scale"] = 0.2
	},
	["Multiplier"] = {
		["Max"] = 5,
		["Base"] = 1.5,
		["Scale"] = 0.15
	},
	["Chance"] = {
		["Max"] = 16,
		["Base"] = 8,
		["Scale"] = 0.08
	}
}
v842.States = v843
v1["Calico Nap"] = v842
local v844 = {
	["Description"] = "Every <Cooldown>s, <Chance>% chance to dig up a random seed! The dug up seed has a <GoldChance>% to be a Gold seed instead!"
}
local v845 = {
	["Cooldown"] = {
		["Min"] = 100,
		["Base"] = 200,
		["Scale"] = -2
	},
	["Chance"] = {
		["Max"] = 24,
		["Base"] = 12,
		["Scale"] = 0.12
	},
	["GoldChance"] = {
		["Max"] = 8,
		["Base"] = 4,
		["Scale"] = 0.04
	}
}
v844.States = v845
v1["Digging K9"] = v844
local v846 = {
	["Description"] = "Every <Cooldown>m, goes to a random shop and steals an item that is in stock and gives it to you! Rarer items have rarer chance to be stolen."
}
local v847 = {
	["Cooldown"] = {
		["Min"] = 180,
		["Base"] = 360,
		["Scale"] = -3.6,
		["Formatter"] = "ColonTime"
	}
}
v846.States = v847
v1["Garden Looter"] = v846
local v848 = {
	["Description"] = "Every <Cooldown>m, <Chance>% chance to mutate a nearby fruit, applying the Opulent mutation!"
}
local v849 = {
	["Cooldown"] = {
		["Min"] = 15,
		["Base"] = 486,
		["Scale"] = -4,
		["Formatter"] = "ColonTime"
	},
	["Chance"] = {
		["Base"] = 15,
		["Scale"] = 0.5
	}
}
v848.States = v849
v1["Opulent Bird"] = v848
local v850 = {
	["Description"] = "Every <Cooldown>m, fans its feathers and all active pets within <Range> studs will advance cooldown for their abilities by <Amount>s and gain XP equal to half that amount!"
}
local v851 = {
	["Cooldown"] = {
		["Min"] = 30,
		["Base"] = 606,
		["Scale"] = -6,
		["Formatter"] = "ColonTime"
	},
	["Amount"] = {
		["Max"] = 150,
		["Base"] = 65,
		["Scale"] = 0.6
	},
	["Range"] = {
		["Max"] = 60,
		["Base"] = 20,
		["Scale"] = 0.2
	}
}
v850.States = v851
v1["Pure Beauty"] = v850
local v852 = {
	["Description"] = "Every <Cooldown>m, roars and mutates fruit up to the number of Safari type pets you have in your garden with a random Safari Mutation!"
}
local v853 = {
	["Cooldown"] = {
		["Min"] = 400,
		["Base"] = 1400,
		["Scale"] = -14,
		["Formatter"] = "ColonTime"
	}
}
v852.States = v853
v1["Queen of the Safari"] = v852
local v854 = {
	["Description"] = "Every <Cooldown>m, turns one random fruit diamond!"
}
local v855 = {
	["Cooldown"] = {
		["Min"] = 150,
		["Base"] = 303,
		["Scale"] = -3,
		["Formatter"] = "ColonTime"
	}
}
v854.States = v855
v1["Diamond Transmutation"] = v854
local v856 = {
	["Description"] = "Every <Cooldown>m, stings a pet with the highest cooldown and refreshes its ability! There is a <Chance>% chance for the stung pet to get the Venom Pet Mutation!"
}
local v857 = {
	["Cooldown"] = {
		["Min"] = 450,
		["Base"] = 909,
		["Scale"] = -9,
		["Formatter"] = "ColonTime"
	},
	["Chance"] = {
		["Max"] = 10,
		["Base"] = 5,
		["Scale"] = 0.05
	}
}
v856.States = v857
v1["Scorpion Sting"] = v856
local v858 = {
	["Description"] = "Every <Cooldown>m, eats a fruit that is atleast <FruitWeight>kg and summons the Whale Waters weather! Ignores favorited fruit."
}
local v859 = {
	["Cooldown"] = {
		["Min"] = 600,
		["Base"] = 1818,
		["Scale"] = -18,
		["Formatter"] = "ColonTime"
	},
	["FruitWeight"] = {
		["Min"] = 0,
		["Base"] = 50,
		["Scale"] = 0
	}
}
v858.States = v859
v1["Whale Waters"] = v858
local v860 = {
	["Description"] = "Every <Cooldown>m, converts all Windstruck mutation fruit within <Range> studs to Gale mutation. For every mutation converted: <Amount>s cooldown is advanced for all other pets in your garden. (Max 10 minutes)"
}
local v861 = {
	["Cooldown"] = {
		["Min"] = 270,
		["Base"] = 540,
		["Scale"] = -6,
		["Formatter"] = "ColonTime"
	},
	["Range"] = {
		["Max"] = 60,
		["Base"] = 30,
		["Scale"] = 0.3
	},
	["Amount"] = {
		["Max"] = 60,
		["Base"] = 5,
		["Scale"] = 2
	}
}
v860.States = v861
v1["Gale Wyvern"] = v860
local v862 = {
	["Description"] = "When selling Fruits with Gale Mutation, <Chance>% chance a random mutation from that fruit will be applied to the fruits in your garden!"
}
local v863 = {
	["Chance"] = {
		["Max"] = 12,
		["Base"] = 6,
		["Scale"] = 0.1
	}
}
v862.States = v863
v1["Wind Diety"] = v862
local v864 = {
	["Description"] = "Every <Cooldown>m, harvests a crop and gives it to you! <Chance>% chance the crop stays when harvested."
}
local v865 = {
	["Cooldown"] = {
		["Min"] = 120,
		["Base"] = 242.4,
		["Scale"] = -2.4,
		["Formatter"] = "ColonTime"
	},
	["Chance"] = {
		["Max"] = 60,
		["Base"] = 30,
		["Scale"] = 0.3
	}
}
v864.States = v865
v1["Honest Labor"] = v864
local v866 = {
	["Description"] = "Every <Cooldown>m, stings a random pet and advances its ability cooldown by <Amount>s! Extra <AmountBonus>s cooldown advanced for every other Firemite in your garden!"
}
local v867 = {
	["Cooldown"] = {
		["Min"] = 60,
		["Base"] = 602,
		["Scale"] = -6,
		["Formatter"] = "ColonTime"
	},
	["Amount"] = {
		["Max"] = 80,
		["Base"] = 40,
		["Scale"] = 0.4
	},
	["AmountBonus"] = {
		["Max"] = 40,
		["Base"] = 20,
		["Scale"] = 0.2
	}
}
v866.States = v867
v1["Light Up"] = v866
local v868 = {
	["Description"] = "Every <Cooldown>m, consumes Fruits with Ash and/or Burnt mutation and grants an Ash-Castle based cosmetic reward! Ignores favorited fruit."
}
local v869 = {
	["Cooldown"] = {
		["Min"] = 150,
		["Base"] = 300,
		["Scale"] = -3,
		["Formatter"] = "ColonTime"
	}
}
v868.States = v869
v1["Ashened Furnishing"] = v868
local v870 = {
	["Description"] = "Every <Cooldown>m, applies Ash mutation to a random fruit!"
}
local v871 = {
	["Cooldown"] = {
		["Min"] = 400,
		["Base"] = 800,
		["Scale"] = -4,
		["Formatter"] = "ColonTime"
	}
}
v870.States = v871
v1["Hound of Ash"] = v870
local v872 = {
	["Description"] = "Every <Cooldown>m, applies Haze mutation to a random fruit!"
}
local v873 = {
	["Cooldown"] = {
		["Min"] = 500,
		["Base"] = 1000,
		["Scale"] = -5,
		["Formatter"] = "ColonTime"
	}
}
v872.States = v873
v1["Hound of Haze"] = v872
local v874 = {
	["Description"] = "Every <Cooldown>m, devours a fruit with Ash, Haze, Burnt & Flaming mutations, applying Smoldering mutation to another fruit, also has a <Chance>% chance to increase the level of pet in your garden."
}
local v875 = {
	["Cooldown"] = {
		["Min"] = 1100,
		["Base"] = 2200,
		["Scale"] = -12,
		["Formatter"] = "ColonTime"
	},
	["Chance"] = {
		["Max"] = 6,
		["Base"] = 3,
		["Scale"] = 0.3
	}
}
v874.States = v875
v1["Trial by Fire"] = v874
local v876 = {
	["Description"] = "When selling Fruits with Smoldering Mutation, <Chance>% chance a random mutation from that fruit will be applied to the fruits in your garden!"
}
local v877 = {
	["Chance"] = {
		["Max"] = 12,
		["Base"] = 6,
		["Scale"] = 0.1
	}
}
v876.States = v877
v1["Flame Diety"] = v876
local v878 = {
	["Description"] = "Every <Cooldown>m, stings a random pet and advances its ability cooldown by <Amount>s! Extra <AmountBonus>s cooldown advanced for every other Firemite in your garden!"
}
local v879 = {
	["Cooldown"] = {
		["Min"] = 50,
		["Base"] = 502,
		["Scale"] = -6,
		["Formatter"] = "ColonTime"
	},
	["Amount"] = {
		["Max"] = 100,
		["Base"] = 50,
		["Scale"] = 0.4
	},
	["AmountBonus"] = {
		["Max"] = 50,
		["Base"] = 30,
		["Scale"] = 0.3
	}
}
v878.States = v879
v1["GIANT Light Up"] = v878
local v880 = {
	["Description"] = "Every <Cooldown>m, consumes Fruits with Ash and/or Burnt mutation and grants an Ash-Castle based cosmetic reward! Ignores favorited fruit."
}
local v881 = {
	["Cooldown"] = {
		["Min"] = 100,
		["Base"] = 200,
		["Scale"] = -3,
		["Formatter"] = "ColonTime"
	}
}
v880.States = v881
v1["GIANT Ashened Furnishing"] = v880
local v882 = {
	["Description"] = "Every <Cooldown>m, applies Ash mutation to a random fruit!"
}
local v883 = {
	["Cooldown"] = {
		["Min"] = 300,
		["Base"] = 600,
		["Scale"] = -4,
		["Formatter"] = "ColonTime"
	}
}
v882.States = v883
v1["Rainbow Hound of Ash"] = v882
local v884 = {
	["Description"] = "Every <Cooldown>m, applies Haze mutation to a random fruit!"
}
local v885 = {
	["Cooldown"] = {
		["Min"] = 400,
		["Base"] = 800,
		["Scale"] = -5,
		["Formatter"] = "ColonTime"
	}
}
v884.States = v885
v1["Rainbow Hound of Haze"] = v884
local v886 = {
	["Description"] = "Every <Cooldown>m, devours a fruit with Ash, Haze, Burnt & Flaming mutations, applying Smoldering mutation to another fruit, also has a <Chance>% chance to increase the level of pet in your garden."
}
local v887 = {
	["Cooldown"] = {
		["Min"] = 900,
		["Base"] = 1800,
		["Scale"] = -12,
		["Formatter"] = "ColonTime"
	},
	["Chance"] = {
		["Max"] = 8,
		["Base"] = 4,
		["Scale"] = 0.3
	}
}
v886.States = v887
v1["Rainbow Trial by Fire"] = v886
local v888 = {
	["Description"] = "When selling Fruits with Smoldering Mutation, <Chance>% chance a random mutation from that fruit will be applied to the fruits in your garden!"
}
local v889 = {
	["Chance"] = {
		["Max"] = 16,
		["Base"] = 8,
		["Scale"] = 0.1
	}
}
v888.States = v889
v1["Rainbow Flame Diety"] = v888
local v890 = {
	["Description"] = "Every <Cooldown>m, Eats any Carrot plant with Choc mutation and spreads it to two other random fruits in your garden. Ignores favorited fruit."
}
local v891 = {
	["Cooldown"] = {
		["Min"] = 240,
		["Base"] = 480,
		["Scale"] = -4.8,
		["Formatter"] = "ColonTime"
	}
}
v890.States = v891
v1["Choc Chomper"] = v890
local v892 = {
	["Description"] = "Every <Cooldown>m, goes to a random un-hatched egg, and reduces its hatch time by <Amount>s! Bonus <AmountBonus>s for every other Easter Egg Chick in your garden!"
}
local v893 = {
	["Cooldown"] = {
		["Min"] = 100,
		["Base"] = 180,
		["Scale"] = -1.8,
		["Formatter"] = "ColonTime"
	},
	["Amount"] = {
		["Max"] = 60,
		["Base"] = 25,
		["Scale"] = 0.25
	},
	["AmountBonus"] = {
		["Max"] = 40,
		["Base"] = 20,
		["Scale"] = 0.2
	}
}
v892.States = v893
v1["Easter Eggcelerator"] = v892
local v894 = {
	["Description"] = "Every <Cooldown>m, grants another pet in your garden either <XPAmount> XP OR advances its ability cooldown by <CDAmount>s! Marshmallow Lamb gains whichever bonus was not given."
}
local v895 = {
	["Cooldown"] = {
		["Min"] = 360,
		["Base"] = 720,
		["Scale"] = -7,
		["Formatter"] = "ColonTime"
	},
	["XPAmount"] = {
		["Max"] = 800,
		["Base"] = 400,
		["Scale"] = 20
	},
	["CDAmount"] = {
		["Max"] = 160,
		["Base"] = 80,
		["Scale"] = 0.8
	}
}
v894.States = v895
v1["The Smore You Know"] = v894
local v896 = {
	["Description"] = "Every <Cooldown>m hides an Easter Egg reward in a random spot. Finding the Easter Egg grants great rewards/very positive effects!"
}
local v897 = {
	["Cooldown"] = {
		["Min"] = 722,
		["Base"] = 1444,
		["Scale"] = -14,
		["Formatter"] = "ColonTime"
	}
}
v896.States = v897
v1["Egg Hunt"] = v896
local v898 = {
	["Description"] = "Every <Cooldown>m, Eats any Carrot plant with Choc mutation and spreads it to two other random fruits in your garden. Ignores favorited fruit."
}
local v899 = {
	["Cooldown"] = {
		["Min"] = 150,
		["Base"] = 300,
		["Scale"] = -4.8,
		["Formatter"] = "ColonTime"
	}
}
v898.States = v899
v1["Gilded Choc Choc Chomper"] = v898
local v900 = {
	["Description"] = "Every <Cooldown>m, goes to a random un-hatched egg, and reduces its hatch time by <Amount>s! Bonus <AmountBonus>s for every other Easter Egg Chick in your garden!"
}
local v901 = {
	["Cooldown"] = {
		["Min"] = 60,
		["Base"] = 110,
		["Scale"] = -1.8,
		["Formatter"] = "ColonTime"
	},
	["Amount"] = {
		["Max"] = 70,
		["Base"] = 35,
		["Scale"] = 0.25
	},
	["AmountBonus"] = {
		["Max"] = 50,
		["Base"] = 25,
		["Scale"] = 0.2
	}
}
v900.States = v901
v1["Gilded Choc Easter Eggcelerator"] = v900
local v902 = {
	["Description"] = "Every <Cooldown>m, grants another pet in your garden either <XPAmount> XP OR advances its ability cooldown by <CDAmount>s! Marshmallow Lamb gains whichever bonus was not given."
}
local v903 = {
	["Cooldown"] = {
		["Min"] = 260,
		["Base"] = 520,
		["Scale"] = -7,
		["Formatter"] = "ColonTime"
	},
	["XPAmount"] = {
		["Max"] = 1000,
		["Base"] = 500,
		["Scale"] = 20
	},
	["CDAmount"] = {
		["Max"] = 160,
		["Base"] = 100,
		["Scale"] = 0.8
	}
}
v902.States = v903
v1["Gilded Choc The Smore You Know"] = v902
local v904 = {
	["Description"] = "Every <Cooldown>m hides an Easter Egg reward in a random spot. Finding the Easter Egg grants great rewards/very positive effects!"
}
local v905 = {
	["Cooldown"] = {
		["Min"] = 500,
		["Base"] = 1000,
		["Scale"] = -14,
		["Formatter"] = "ColonTime"
	}
}
v904.States = v905
v1["Gilded Choc Egg Hunt"] = v904
local v906 = {
	["Description"] = "Every <Cooldown>s, <Chance>% chance a nearby fruit gets the Gummy mutation!"
}
local v907 = {
	["Cooldown"] = {
		["Min"] = 60,
		["Base"] = 120,
		["Scale"] = -1
	},
	["Chance"] = {
		["Max"] = 20,
		["Base"] = 10,
		["Scale"] = 0.1
	}
}
v906.States = v907
v1["Gummy Express"] = v906
local v908 = {
	["Description"] = "All active Easter type pets gain an additional <Chance> XP/s!"
}
local v909 = {
	["Chance"] = {
		["Base"] = 0.6,
		["Scale"] = 0.06
	}
}
v908.States = v909
v1["Hootsie Experience"] = v908
local v910 = {
	["Description"] = "All active pets gain an additional <Chance> XP/s!"
}
local v911 = {
	["Chance"] = {
		["Base"] = 0.6,
		["Scale"] = 0.06
	}
}
v910.States = v911
v1["Hootsie Effect"] = v910
local v912 = {
	["Description"] = "Every <Cooldown>m, goes to a Woody type fruit in your garden to convert it into a random wooden-based building cosmetic! Ignores favorited fruit."
}
local v913 = {
	["Cooldown"] = {
		["Min"] = 240,
		["Base"] = 480,
		["Scale"] = -4,
		["Formatter"] = "ColonTime"
	}
}
v912.States = v913
v1["The Wood Works"] = v912
local v914 = {
	["Description"] = "Every <Cooldown>m, grabs a random fruit in your garden and delivers it to another player\'s pet: to give <XPAmount>XP, or a Small Passive Boost! Ignores favorited fruit."
}
local v915 = {
	["Cooldown"] = {
		["Min"] = 300,
		["Base"] = 600,
		["Scale"] = -6,
		["Formatter"] = "ColonTime"
	},
	["XPAmount"] = {
		["Max"] = 1000,
		["Base"] = 500,
		["Scale"] = 25
	}
}
v914.States = v915
v1["Stork Delivery"] = v914
local v916 = {
	["Description"] = "Every <Cooldown>m, prays for <Duration>s & each second a fruit within <Range> studs has a <Chance>% chance to gain the Floral mutation. Fruit with Floral turn Gold, and Gold fruit with Floral convert to Rainbow!"
}
local v917 = {
	["Cooldown"] = {
		["Min"] = 390,
		["Base"] = 780,
		["Scale"] = -7.8,
		["Formatter"] = "ColonTime"
	},
	["Duration"] = {
		["Max"] = 20,
		["Base"] = 10,
		["Scale"] = 0.1
	},
	["Range"] = {
		["Max"] = 30,
		["Base"] = 15,
		["Scale"] = 0.15
	},
	["Chance"] = {
		["Max"] = 6,
		["Base"] = 3,
		["Scale"] = 0.03
	}
}
v916.States = v917
v1["Orchid Zone"] = v916
local v918 = {
	["Description"] = "Every <Cooldown>m, has <Chance>% chance to apply the Candy mutation!"
}
local v919 = {
	["Cooldown"] = {
		["Min"] = 540,
		["Base"] = 1080,
		["Scale"] = -4.5,
		["Formatter"] = "ColonTime"
	},
	["Chance"] = {
		["Max"] = 25,
		["Base"] = 15,
		["Scale"] = 0.3
	}
}
v918.States = v919
v1["Candy Craze"] = v918
local v920 = {
	["Description"] = "Every <Cooldown>m, <Chance>% chance for a nearby fruit to get the Bloom mutation!"
}
local v921 = {
	["Cooldown"] = {
		["Min"] = 202,
		["Base"] = 404,
		["Scale"] = -4,
		["Formatter"] = "ColonTime"
	},
	["Chance"] = {
		["Max"] = 30,
		["Base"] = 15,
		["Scale"] = 0.15
	}
}
v920.States = v921
v1["Bloom Bee"] = v920
local v922 = {
	["Description"] = "Every <Cooldown>m, hops in place: gaining <XPAmount> XP and advances growth for a random plant in your garden by <AdvancementAmount>m! The Jerboa has a <Chance>% chance to do it again each hop."
}
local v923 = {
	["Cooldown"] = {
		["Min"] = 225,
		["Base"] = 450,
		["Scale"] = -4,
		["Formatter"] = "ColonTime"
	},
	["XPAmount"] = {
		["Max"] = 600,
		["Base"] = 300,
		["Scale"] = 3
	},
	["AdvancementAmount"] = {
		["Max"] = 600,
		["Base"] = 300,
		["Scale"] = 3,
		["Formatter"] = "ColonTime"
	},
	["Chance"] = {
		["Max"] = 20,
		["Base"] = 10,
		["Scale"] = 0.1
	}
}
v922.States = v923
v1["Hop Streak"] = v922
local v924 = {
	["Description"] = "Every <Cooldown>m, eats fruit with atleast 4 mutations (Ignores favorited). Fruits and pets within <Range> studs get Bonuses: Fruits have a <Chance>% chance to get the Lush mutation & pets have a chance <Chance>% to gain <XPAmount>XP!"
}
local v925 = {
	["Cooldown"] = {
		["Min"] = 480,
		["Base"] = 960,
		["Scale"] = -9.6,
		["Formatter"] = "ColonTime"
	},
	["Range"] = {
		["Max"] = 50,
		["Base"] = 25,
		["Scale"] = 0.25
	},
	["Chance"] = {
		["Max"] = 40,
		["Base"] = 20,
		["Scale"] = 0.2
	},
	["XPAmount"] = {
		["Max"] = 2400,
		["Base"] = 1200,
		["Scale"] = 12
	}
}
v924.States = v925
v1["Spring Grazer"] = v924
local v926 = {
	["Description"] = "Every <Cooldown>m, blesses all pets in your garden, granting <XPAmount>XP each! There is a <Chance>% chance for one of the blessed pet to get the Everchanted Pet Mutation!"
}
local v927 = {
	["Cooldown"] = {
		["Min"] = 750,
		["Base"] = 1500,
		["Scale"] = -15,
		["Formatter"] = "ColonTime"
	},
	["XPAmount"] = {
		["Max"] = 22000,
		["Base"] = 11000,
		["Scale"] = 80
	},
	["Chance"] = {
		["Max"] = 3,
		["Base"] = 1.5,
		["Scale"] = 0.015
	}
}
v926.States = v927
v1["Everchanting Spring"] = v926
local v928 = {
	["Description"] = "Every <Cooldown>m, <Chance>% chance for a nearby fruit to get the Bloom mutation!"
}
local v929 = {
	["Cooldown"] = {
		["Min"] = 150,
		["Base"] = 303,
		["Scale"] = -4,
		["Formatter"] = "ColonTime"
	},
	["Chance"] = {
		["Max"] = 40,
		["Base"] = 20,
		["Scale"] = 0.15
	}
}
v928.States = v929
v1["Gilded Choc Bloom Bee"] = v928
local v930 = {
	["Description"] = "Every <Cooldown>m, hops in place: gaining <XPAmount> XP and advances growth for a random plant in your garden by <AdvancementAmount>m! The Jerboa has a <Chance>% chance to do it again each hop."
}
local v931 = {
	["Cooldown"] = {
		["Min"] = 175,
		["Base"] = 350,
		["Scale"] = -4,
		["Formatter"] = "ColonTime"
	},
	["XPAmount"] = {
		["Max"] = 800,
		["Base"] = 400,
		["Scale"] = 3
	},
	["AdvancementAmount"] = {
		["Max"] = 800,
		["Base"] = 400,
		["Scale"] = 3,
		["Formatter"] = "ColonTime"
	},
	["Chance"] = {
		["Max"] = 30,
		["Base"] = 15,
		["Scale"] = 0.1
	}
}
v930.States = v931
v1["Gilded Choc Hop Streak"] = v930
local v932 = {
	["Description"] = "Every <Cooldown>m, eats fruit with atleast 4 mutations (Ignores favorited). Fruits and pets within <Range> studs get Bonuses: Fruits have a <Chance>% chance to get the Lush mutation & pets have a chance <Chance>% to gain <XPAmount>XP!"
}
local v933 = {
	["Cooldown"] = {
		["Min"] = 380,
		["Base"] = 760,
		["Scale"] = -9.6,
		["Formatter"] = "ColonTime"
	},
	["Range"] = {
		["Max"] = 60,
		["Base"] = 30,
		["Scale"] = 0.25
	},
	["Chance"] = {
		["Max"] = 25,
		["Base"] = 25,
		["Scale"] = 0.2
	},
	["XPAmount"] = {
		["Max"] = 3000,
		["Base"] = 1500,
		["Scale"] = 12
	}
}
v932.States = v933
v1["Gilded Choc Spring Grazer"] = v932
local v934 = {
	["Description"] = "Every <Cooldown>m, blesses all pets in your garden, granting <XPAmount>XP each! There is a <Chance>% chance for one of the blessed pet to get the Everchanted Pet Mutation!"
}
local v935 = {
	["Cooldown"] = {
		["Min"] = 600,
		["Base"] = 1200,
		["Scale"] = -15,
		["Formatter"] = "ColonTime"
	},
	["XPAmount"] = {
		["Max"] = 300000,
		["Base"] = 15000,
		["Scale"] = 80
	},
	["Chance"] = {
		["Max"] = 5,
		["Base"] = 2.5,
		["Scale"] = 0.015
	}
}
v934.States = v935
v1["Gilded Choc Everchanting Spring"] = v934
local v936 = {
	["Description"] = "<Chance>% chance fruit gets Plasma mutation after collecting!"
}
local v937 = {
	["Chance"] = {
		["Base"] = 10,
		["Scale"] = 0.2
	}
}
v936.States = v937
v1["Radioactive Lizard"] = v936
local v938 = {
	["Description"] = "Every <Cooldown>s, <Chance>% chance nearby fruit becomes Burnt!"
}
local v939 = {
	["Cooldown"] = {
		["Min"] = 5,
		["Base"] = 80,
		["Scale"] = -1
	},
	["Chance"] = {
		["Base"] = 20,
		["Scale"] = 0.2
	}
}
v938.States = v939
v1["Scorched Soil"] = v938
local v940 = {
	["Description"] = "<Chance>% chance harvested fruit becomes Gold on h\tarvest! Rarer crops have less chance to turn gold!"
}
local v941 = {
	["Chance"] = {
		["Max"] = 35,
		["Base"] = 1,
		["Scale"] = 0.1
	}
}
v940.States = v941
v1["Golden Harvest"] = v940
local v942 = {
	["Description"] = "Every <Cooldown>m, lays a random pet egg from the pet egg shop. Will not lay eggs if you have no free egg equip slot"
}
local v943 = {
	["Cooldown"] = {
		["Min"] = 15,
		["Base"] = 15,
		["Scale"] = -18,
		["Formatter"] = "ColonTime"
	}
}
v942.States = v943
v1["Egg Laying"] = v942
local v944 = {
	["Description"] = "Each time you feed a pet, <Chance>% of the hunger points restored are also awarded as experience for that pet! (Only the hunger that is successfully restored counts toward XP)."
}
local v945 = {
	["Chance"] = {
		["Max"] = 50,
		["Base"] = 14.65,
		["Scale"] = 0.35
	}
}
v944.States = v945
v1["Helpy Herbivore"] = v944
local v946 = {
	["Description"] = "Every <Cooldown>m, eats a random fruit in your garden, and has a <Chance>% chance to spit out a Horsetail seed! Ignores favorited fruit."
}
local v947 = {
	["Cooldown"] = {
		["Min"] = 10,
		["Base"] = 82,
		["Scale"] = -1.8
	},
	["Chance"] = {
		["Base"] = 40,
		["Scale"] = 0.8
	}
}
v946.States = v947
v1["Horsetail Herbivore"] = v946
local v948 = {
	["Description"] = "Every <Cooldown>m, has <Chance>% chance to apply the Jackpot mutation!"
}
local v949 = {
	["Cooldown"] = {
		["Min"] = 30,
		["Base"] = 220,
		["Scale"] = -1.5,
		["Formatter"] = "ColonTime"
	},
	["Chance"] = {
		["Max"] = 60,
		["Base"] = 30,
		["Scale"] = 0.3
	}
}
v948.States = v949
v1["RAINBOW CHA-CHING"] = v948
local v950 = {
	["Description"] = "<font color=\"rgb(255, 255, 100)\">SHOCKED: During a Thunderstorm: Every <Cooldown>s, has a <Chance>% chance to attract lightning, shocking nearby fruits!</font>"
}
local v951 = {
	["Cooldown"] = {
		["Min"] = 45,
		["Base"] = 60,
		["Scale"] = -0.6
	},
	["Chance"] = {
		["Max"] = 30,
		["Base"] = 25,
		["Scale"] = 0.02
	}
}
v950.States = v951
v1["Shocked Pet Mutation"] = v950
local v952 = {
	["Description"] = "<font color=\"rgb(108, 184, 255)\">FROZEN: Every <Cooldown>m, <Chance>% chance a nearby fruit becomes Frozen!</font>"
}
local v953 = {
	["Cooldown"] = {
		["Min"] = 30,
		["Base"] = 300,
		["Scale"] = -3,
		["Formatter"] = "ColonTime"
	},
	["Chance"] = {
		["Max"] = 30,
		["Base"] = 20,
		["Scale"] = 0.03
	}
}
v952.States = v953
v1["Frozen Pet Mutation"] = v952
local v954 = {
	["Description"] = "<font color=\"rgb(162, 185, 209)\">WINDY: Every <Cooldown>m, <Chance>% chance a nearby fruit becomes Windstruck!</font>"
}
local v955 = {
	["Cooldown"] = {
		["Min"] = 30,
		["Base"] = 300,
		["Scale"] = -3,
		["Formatter"] = "ColonTime"
	},
	["Chance"] = {
		["Max"] = 30,
		["Base"] = 20,
		["Scale"] = 0.03
	}
}
v954.States = v955
v1["Windy Pet Mutation"] = v954
local v956 = {
	["Description"] = "<font color=\"rgb(206, 206, 206)\">IRONSKIN: When another player steals fruit from you, grants a <Chance>% chance you get the stolen fruit as well!</font>"
}
local v957 = {
	["Chance"] = {
		["Max"] = 45,
		["Base"] = 35,
		["Scale"] = 0.2
	}
}
v956.States = v957
v1["IronSkin Pet Mutation"] = v956
local v958 = {
	["Description"] = "<font color=\"rgb(248, 108, 38)\">RADIANT: Every <Cooldown>m, emits sunshine at a random nearby plant and advances their growth by 24 hours!</font>"
}
local v959 = {
	["Cooldown"] = {
		["Min"] = 1200,
		["Base"] = 1800,
		["Scale"] = -9,
		["Formatter"] = "ColonTime"
	}
}
v958.States = v959
v1["Radiant Pet Mutation"] = v958
local v960 = {
	["Description"] = "<font color=\"rgb(247, 245, 184)\">ASCENDED: Every <Cooldown>m, a nearby fruit ascends to a higher realm, with a <Chance>% chance to apply the Dawnbound mutation!</font>"
}
local v961 = {
	["Cooldown"] = {
		["Min"] = 18000,
		["Base"] = 21621,
		["Scale"] = -21,
		["Formatter"] = "ColonTime"
	},
	["Chance"] = {
		["Max"] = 90,
		["Base"] = 75,
		["Scale"] = 0.03
	}
}
v960.States = v961
v1["Ascended Pet Mutation"] = v960
local v962 = {
	["Description"] = "<font color=\"rgb(173, 216, 230)\">TINY: Pet is very tiny! Has 20% slower hunger rate.</font>"
}
local v963 = {
	["Amount"] = {
		["Base"] = -0.2,
		["Scale"] = 0
	}
}
v962.States = v963
v1["Tiny Pet Mutation"] = v962
local v964 = {
	["Description"] = "<font color=\"rgb(173, 216, 230)\">TINY: Gains an additional <Amount> xp per second!</font>"
}
local v965 = {
	["Amount"] = {
		["Max"] = 30,
		["Base"] = 5,
		["Scale"] = 0.15
	}
}
v964.States = v965
v1["Tiny Pet Mutation Bonus"] = v964
local v966 = {
	["Description"] = "<font color=\"rgb(255, 90, 90)\">MEGA: Pet is gigantic! Has 20% faster hunger rate.</font>"
}
local v967 = {
	["Amount"] = {
		["Base"] = 0.2,
		["Scale"] = 0
	}
}
v966.States = v967
v1["Mega Pet Mutation"] = v966
local v968 = {
	["Description"] = "<font color=\"rgb(255, 90, 90)\">MEGA: Gains an additional <Amount> xp per second!</font>"
}
local v969 = {
	["Amount"] = {
		["Max"] = 40,
		["Base"] = 10,
		["Scale"] = 0.15
	}
}
v968.States = v969
v1["Mega Pet Mutation Bonus"] = v968
v1["Golden Pet Mutation"] = {
	["Description"] = "<font color=\"rgb(255, 225, 0)\">GOLDEN: Provides a big increase to the pet\'s passive!</font>",
	["States"] = {}
}
v1["Silver Pet Mutation"] = {
	["Description"] = "<font color=\"rgb(222, 222, 222)\">SILVER: Provides a small increase to the pet\'s passive!</font>",
	["States"] = {},
	""
}
v1["Rainbow Pet Mutation"] = {
	["Description"] = "<font color=\"rgb(255, 0, 0)\">R</font><font color=\"rgb(255, 127, 0)\">A</font><font color=\"rgb(255, 255, 0)\">I</font><font color=\"rgb(0, 255, 0)\">N</font><font color=\"rgb(0, 0, 255)\">B</font><font color=\"rgb(75, 0, 130)\">O</font><font color=\"rgb(148, 0, 211)\">W</font><font color=\"rgb(4, 175, 236)\">: Provides a bigger increase to the pet\'s passive!</font>",
	["States"] = {}
}
v1["Shiny Pet Mutation"] = {
	["Description"] = "<font color=\"rgb(145, 207, 221)\">SHINY: Provides an additional 15% boost to the pet\'s xp per second!</font>",
	["States"] = {}
}
v1["Inverted Pet Mutation"] = {
	["Description"] = "<font color=\"rgb(128, 128, 128)\">INVERTED: Provides an additional 30% boost to the pet\'s xp per second!</font>",
	["States"] = {}
}
local v970 = {
	["Description"] = "<font color=\"rgb(247, 245, 184)\">TRANQUIL: Every <Cooldown>m, a nearby fruit finds inner peace, with a <Chance>% chance to apply the Tranquil mutation!</font>"
}
local v971 = {
	["Cooldown"] = {
		["Min"] = 1000,
		["Base"] = 1500,
		["Scale"] = -3,
		["Formatter"] = "ColonTime"
	},
	["Chance"] = {
		["Max"] = 30,
		["Base"] = 20,
		["Scale"] = 0.03
	}
}
v970.States = v971
v1["Tranquil Pet Mutation"] = v970
local v972 = {
	["Description"] = "<font color=\"rgb(49, 255, 63)\">ALIENATED: SMALL boost to passive but drains <Amount>% xp per second!</font>"
}
local v973 = {
	["Amount"] = {
		["Max"] = 0.07,
		["Base"] = 0.07,
		["Min"] = 0.07,
		["Scale"] = 0
	}
}
v972.States = v973
v1["Alienated Pet Mutation"] = v972
local v974 = {
	["Description"] = "<font color=\"rgb(11, 163, 0)\">UFO: MEDIUM boost to passive but drains <Amount>% xp per second!</font>"
}
local v975 = {
	["Amount"] = {
		["Max"] = 0.04,
		["Base"] = 0.04,
		["Min"] = 0.04,
		["Scale"] = 0
	}
}
v974.States = v975
v1["UFO Pet Mutation"] = v974
local v976 = {
	["Description"] = "<font color=\"rgb(176, 23, 26)\">Corrupted: Every <Cooldown>m, a nearby fruit embraces the corruption, with a <Chance>% chance to apply the Corrupted mutation!</font>"
}
local v977 = {
	["Cooldown"] = {
		["Min"] = 1000,
		["Base"] = 1500,
		["Scale"] = -3,
		["Formatter"] = "ColonTime"
	},
	["Chance"] = {
		["Max"] = 30,
		["Base"] = 20,
		["Scale"] = 0.03
	}
}
v976.States = v977
v1["Corrupted Pet Mutation"] = v976
local v978 = {
	["Description"] = "<font color=\"rgb(209, 139, 0)\">Fried: Every <Cooldown>m, a nearby fruit is sizzled up, with a <Chance>% chance to apply the Fried mutation!</font>"
}
local v979 = {
	["Cooldown"] = {
		["Min"] = 500,
		["Base"] = 1000,
		["Scale"] = -3,
		["Formatter"] = "ColonTime"
	},
	["Chance"] = {
		["Max"] = 60,
		["Base"] = 40,
		["Scale"] = 0.1
	}
}
v978.States = v979
v1["Fried Pet Mutation"] = v978
local v980 = {
	["Description"] = "<font color=\"rgb(162, 145, 57)\">AROMATIC: Every <Cooldown>m, a nearby fruit is infused with a pungent aroma, with a <Chance>% chance to apply the Aromatic mutation!</font>"
}
local v981 = {
	["Cooldown"] = {
		["Min"] = 1000,
		["Base"] = 1500,
		["Scale"] = -3,
		["Formatter"] = "ColonTime"
	},
	["Chance"] = {
		["Max"] = 30,
		["Base"] = 20,
		["Scale"] = 0.03
	}
}
v980.States = v981
v1["Aromatic Pet Mutation"] = v980
local v982 = {
	["Description"] = "<font color=\"rgb(102, 153, 51)\">GIANT BEAN: Pet is a GIANT BEAN! Has 15% faster hunger rate.</font>"
}
local v983 = {
	["Amount"] = {
		["Base"] = 0.15,
		["Scale"] = 0
	}
}
v982.States = v983
v1["GiantBean Pet Mutation"] = v982
local v984 = {
	["Description"] = "<font color=\"rgb(102, 153, 51)\">Gains an additional <Amount>xp/s for each Beanstalk planted in your garden!</font>"
}
local v985 = {
	["Amount"] = {
		["Max"] = 0.5,
		["Base"] = 0.1,
		["Scale"] = 0.005
	}
}
v984.States = v985
v1["GiantBean Pet Mutation Bonus"] = v984
local v986 = {
	["Description"] = "<font color=\"rgb(246, 142, 255)\">Glimmering: Every <Cooldown>m, a nearby fruit is sprinkled with fairy dust, with a <Chance>% chance to apply the Glimmering mutation!</font>"
}
local v987 = {
	["Cooldown"] = {
		["Min"] = 800,
		["Base"] = 1500,
		["Scale"] = -3,
		["Formatter"] = "ColonTime"
	},
	["Chance"] = {
		["Max"] = 30,
		["Base"] = 20,
		["Scale"] = 0.03
	}
}
v986.States = v987
v1["Glimmering Pet Mutation"] = v986
local v988 = {
	["Description"] = "<font color=\"rgb(85, 170, 255)\">Luminous: Every <Cooldown>m, a nearby fruit is imbued with fairy power, with a <Chance>% chance to apply the Luminous mutation!</font>"
}
local v989 = {
	["Cooldown"] = {
		["Min"] = 1000,
		["Base"] = 2000,
		["Scale"] = -4,
		["Formatter"] = "ColonTime"
	},
	["Chance"] = {
		["Max"] = 30,
		["Base"] = 20,
		["Scale"] = 0.03
	}
}
v988.States = v989
v1["Luminous Pet Mutation"] = v988
local v990 = {
	["Description"] = "<font color=\"rgb(161, 117, 29)\">Nutty: Every <Cooldown> minutes, the pet\226\128\153s next ability use has a <Chance>% chance to activate twice. Otherwise, this pet loses a level.</font>"
}
local v991 = {
	["Cooldown"] = {
		["Min"] = 120,
		["Base"] = 1200,
		["Scale"] = -12,
		["Formatter"] = "ColonTime"
	},
	["Chance"] = {
		["Max"] = 40,
		["Base"] = 20,
		["Scale"] = 0.1
	}
}
v990.States = v991
v1["Nutty Pet Mutation"] = v990
local v992 = {
	["Description"] = "<font color=\"rgb(140, 45, 175)\">DREADBOUND: Gains an additional <Amount> xp per second!</font>"
}
local v993 = {
	["Amount"] = {
		["Max"] = 30,
		["Base"] = 6.5,
		["Scale"] = 0.15
	}
}
v992.States = v993
v1["Dreadbound Pet Mutation"] = v992
local v994 = {
	["Description"] = "<font color=\"rgb(255, 85, 40)\">SOULFLAME: Provides an additional 60% boost to the pet\'s xp per second. Every <Cooldown>m, a nearby fruit has a <Chance>% chance to get mutated with Burnt - lower chance for Flaming!</font>"
}
local v995 = {
	["Cooldown"] = {
		["Min"] = 300,
		["Base"] = 912,
		["Scale"] = -4.5,
		["Formatter"] = "ColonTime"
	},
	["Chance"] = {
		["Max"] = 30,
		["Base"] = 20,
		["Scale"] = 0.03
	}
}
v994.States = v995
v1["Soulflame Pet Mutation"] = v994
v1["Spectral Pet Mutation"] = {
	["Description"] = "<font color=\"rgb(90, 200, 255)\">SPECTRAL: Provides a small increase to the pet\'s passive!</font>",
	["States"] = {}
}
v1["Nightmare Pet Mutation"] = {
	["Description"] = "<font color=\"rgb(255, 0, 128)\">N</font><font color=\"rgb(170, 0, 85)\">I</font><font color=\"rgb(255, 0, 128)\">G</font><font color=\"rgb(170, 0, 85)\">H</font><font color=\"rgb(255, 0, 128)\">T</font><font color=\"rgb(170, 0, 85)\">M</font><font color=\"rgb(255, 0, 128)\">A</font><font color=\"rgb(170, 0, 85)\">R</font><font color=\"rgb(255, 0, 128)\">E</font><font color=\"rgb(255, 0, 128)\">: Provides a bigger increase to the pet\'s passive and is slightly bigger!</font>",
	["States"] = {}
}
v1["Tethered Pet Mutation"] = {
	["Description"] = "<font color=\"rgb(210, 171, 136)\">TETHERED: Constantly wanders around the player!</font>",
	["States"] = {}
}
local v996 = {
	["Description"] = "<font color=\"rgb(165, 105, 255)\">AURORA: Every <Cooldown>m, <Chance>% chance a nearby fruit becomes Aurora!</font>"
}
local v997 = {
	["Cooldown"] = {
		["Min"] = 1000,
		["Base"] = 2525,
		["Scale"] = -25,
		["Formatter"] = "ColonTime"
	},
	["Chance"] = {
		["Max"] = 50,
		["Base"] = 30,
		["Scale"] = 0.3
	}
}
v996.States = v997
v1["Aurora Pet Mutation"] = v996
v1["JUMBO Pet Mutation"] = {
	["Description"] = "<font color=\"rgb(255, 170, 0)\">JUMBO:</font> Pet is Jumbo and gains <font color=\"rgb(255, 255, 0)\">+50% XP BOOST!</font>",
	["States"] = {}
}
local v998 = {
	["Description"] = "<font color=\"rgb(255, 170, 0)\">JUMBO:</font> All nearby plants within <font color=\"rgb(170, 255, 255)\"><Range></font> studs will have an increased <font color=\"rgb(170, 255, 255)\"><Multiplier>x</font> size bonus for every Safari-type plant planted in your garden! <font color=\"rgb(255, 255, 255)\">(Max 300)</font>"
}
local v999 = {
	["Range"] = {
		["Max"] = 35,
		["Base"] = 14.75,
		["Scale"] = 0.25
	},
	["Multiplier"] = {
		["Max"] = 0.01,
		["Base"] = 0.004,
		["Scale"] = 0.001,
		["Formatter"] = "NoPrecision"
	}
}
v998.States = v999
v1["JUMBO Pet Mutation Bonus"] = v998
local v1000 = {
	["Description"] = "<font color=\"rgb(255, 170, 0)\">OXPECKER:</font> When Safari type pets finish their abilities, they start their cooldown with <Chance> seconds less! Gains <font color=\"rgb(255, 170, 0)\">tiny</font> increase to passives!"
}
local v1001 = {
	["Chance"] = {
		["Max"] = 7.5,
		["Base"] = 3.5,
		["Scale"] = 0.1
	}
}
v1000.States = v1001
v1["Oxpecker Pet Mutation"] = v1000
local v1002 = {
	["Description"] = "<font color=\"rgb(255, 215, 0)\">GIRAFFE:</font> Every <Cooldown>m, eats fruit that are atleast 10 studs high for <Multiplier>x sell value. The plant the fruit came from advances growth by <Amount>m! Also applies Arid mutation to all other fruits on that plant. Gains <font color=\"rgb(255, 215, 0)\">small</font> increase to passives!"
}
local v1003 = {
	["Cooldown"] = {
		["Min"] = 583,
		["Base"] = 1554,
		["Scale"] = -1.1,
		["Formatter"] = "ColonTime"
	},
	["Multiplier"] = {
		["Max"] = 0.75,
		["Base"] = 0.36,
		["Scale"] = 0.01
	},
	["Amount"] = {
		["Max"] = 1800,
		["Base"] = 997,
		["Scale"] = 7.5,
		["Formatter"] = "ColonTime"
	}
}
v1002.States = v1003
v1["Giraffe Pet Mutation"] = v1002
local v1004 = {
	["Description"] = "<font color=\"rgb(211, 211, 211)\">RHINO:</font> Every <Cooldown>m, charges into a random egg or random fruit in your garden: Rammed eggs have hatch time halved, rammed fruits get Mirage mutation! Cannot be mimicked or refreshed. Gains <font color=\"rgb(211, 211, 211)\">medium</font> increase to passives!"
}
local v1005 = {
	["Cooldown"] = {
		["Min"] = 777,
		["Base"] = 1554,
		["Scale"] = -2,
		["Formatter"] = "ColonTime"
	}
}
v1004.States = v1005
v1["Rhino Pet Mutation"] = v1004
local v1006 = {
	["Description"] = "<font color=\"rgb(0, 200, 120)\">CROCODILE:</font> Every <Cooldown>m, bites on to a random Plant or Pet for <Duration>s and performs a roll. Plants grow an additional <AmountPlant>s/s and Pets get additional <AmountXP> XP/s. Gains <font color=\"rgb(0, 200, 120)\">sizable</font> increase to passives!"
}
local v1007 = {
	["Cooldown"] = {
		["Min"] = 1050,
		["Base"] = 2100,
		["Scale"] = -1.65,
		["Formatter"] = "ColonTime"
	},
	["Duration"] = {
		["Max"] = 12.5,
		["Base"] = 7.5,
		["Scale"] = 0.025
	},
	["AmountPlant"] = {
		["Max"] = 22.5,
		["Base"] = 11.25,
		["Scale"] = 0.025
	},
	["AmountXP"] = {
		["Max"] = 16.25,
		["Base"] = 8.75,
		["Scale"] = 0.025
	}
}
v1006.States = v1007
v1["Crocodile Pet Mutation"] = v1006
local v1008 = {
	["Description"] = "<font color=\"rgb(255, 255, 102)\">LION:</font> Every <Cooldown>m, roars and calls all pets in your garden to move toward it. <Amount> total cooldown advancement is shared across each pet (max <MaxAmount> seconds per pet). Gains <font color=\"rgb(255, 255, 102)\">big</font> increase to passives!"
}
local v1009 = {
	["Cooldown"] = {
		["Min"] = 350,
		["Base"] = 1400,
		["Scale"] = -1.25,
		["Formatter"] = "ColonTime"
	},
	["Amount"] = {
		["Max"] = 200,
		["Base"] = 100,
		["Scale"] = 1
	},
	["MaxAmount"] = {
		["Max"] = 30,
		["Base"] = 15,
		["Scale"] = 0.15
	}
}
v1008.States = v1009
v1["Lion Pet Mutation"] = v1008
local v1010 = {
	["Description"] = "<font color=\"rgb(255, 215, 0)\">FORGER:</font> Every <Cooldown>m goes to an active crafting table and advances its crafting time by <Amount>s!"
}
local v1011 = {
	["Cooldown"] = {
		["Min"] = 400,
		["Base"] = 800,
		["Scale"] = -4,
		["Formatter"] = "ColonTime"
	},
	["Amount"] = {
		["Max"] = 80,
		["Base"] = 40,
		["Scale"] = 0.4
	}
}
v1010.States = v1011
v1["Forger Pet Mutation"] = v1010
v1["HyperHunger Pet Mutation"] = {
	["Description"] = "<font color=\"rgb(255, 255, 0)\">HYPER HUNGER:</font> BIG boost to passive but hunger drains SUPER DUPER FAST! Boost is disabled when hunger is less than 25%",
	["States"] = {}
}
local v1012 = {
	["Description"] = "<font color=\"rgb(85, 85, 255)\">NOCTURNAL:</font> Every <Cooldown>m, a random fruit gets advanced by 12h! Cooldown ticks down twice as fast during the night!"
}
local v1013 = {
	["Cooldown"] = {
		["Min"] = 700,
		["Base"] = 1414,
		["Scale"] = -14,
		["Formatter"] = "ColonTime"
	}
}
v1012.States = v1013
v1["Nocturnal Pet Mutation"] = v1012
local v1014 = {
	["Description"] = "<font color=\"rgb(255, 0, 0)\">P</font><font color=\"rgb(255, 255, 255)\">E</font><font color=\"rgb(255, 0, 0)\">P</font><font color=\"rgb(255, 255, 255)\">P</font><font color=\"rgb(255, 0, 0)\">E</font><font color=\"rgb(255, 255, 255)\">R</font><font color=\"rgb(255, 0, 0)\">M</font><font color=\"rgb(255, 255, 255)\">I</font><font color=\"rgb(255, 0, 0)\">N</font><font color=\"rgb(255, 255, 255)\">T</font><font color=\"rgb(255, 0, 0)\">:</font> Every <Cooldown>m, sacrifices 12 random Christmas-type fruit in your garden to instantly activate this pet\'s ability!"
}
local v1015 = {
	["Cooldown"] = {
		["Min"] = 500,
		["Base"] = 966,
		["Scale"] = -6,
		["Formatter"] = "ColonTime"
	}
}
v1014.States = v1015
v1["Peppermint Pet Mutation"] = v1014
local v1016 = {
	["Description"] = "<font color=\"rgb(0, 200, 0)\">CHRISTMAS RALLY:</font> All Christmas-themed pets gain an additional <font color=\"rgb(255,215,0)\"><Chance></font>XP per second!"
}
local v1017 = {
	["Chance"] = {
		["Max"] = 7.5,
		["Base"] = 3.5,
		["Scale"] = 0.1
	}
}
v1016.States = v1017
v1["Christmas Rally Pet Mutation"] = v1016
local v1018 = {
	["Description"] = "<font color=\"rgb(255,0,0)\">J</font><font color=\"rgb(0,200,0)\">O</font><font color=\"rgb(255,0,0)\">L</font><font color=\"rgb(0,200,0)\">L</font><font color=\"rgb(255,0,0)\">Y</font> <font color=\"rgb(0,200,0)\">D</font><font color=\"rgb(255,0,0)\">E</font><font color=\"rgb(0,200,0)\">C</font><font color=\"rgb(255,0,0)\">O</font><font color=\"rgb(0,200,0)\">R</font><font color=\"rgb(255,0,0)\">A</font><font color=\"rgb(0,200,0)\">T</font><font color=\"rgb(255,0,0)\">O</font><font color=\"rgb(0,200,0)\">R</font><font color=\"rgb(255,0,0)\">:</font> Every <font color=\"rgb(255,215,0)\"><Cooldown></font>m, applies Ornamented mutation to a random fruit!"
}
local v1019 = {
	["Cooldown"] = {
		["Min"] = 250,
		["Base"] = 505,
		["Scale"] = -5,
		["Formatter"] = "ColonTime"
	}
}
v1018.States = v1019
v1["Jolly Decorator Pet Mutation"] = v1018
local v1020 = {
	["Description"] = "<font color=\"rgb(255,215,0)\">MERRY NURSERY:</font> Every <font color=\"rgb(255,215,0)\"><Cooldown></font>s, goes to the unhatched egg with the highest hatch time and reduces it by <font color=\"rgb(255,215,0)\"><Amount></font>s with a bonus <font color=\"rgb(255,215,0)\"><AmountBonus></font>s for every Christmas-type plant in your garden!"
}
local v1021 = {
	["Cooldown"] = {
		["Min"] = 20,
		["Base"] = 80,
		["Scale"] = -0.8
	},
	["Amount"] = {
		["Max"] = 60,
		["Base"] = 25,
		["Scale"] = 0.25
	},
	["AmountBonus"] = {
		["Max"] = 0.2,
		["Base"] = 0.1,
		["Scale"] = 0.01,
		["Formatter"] = "NoPrecision"
	}
}
v1020.States = v1021
v1["Merry Nursery Pet Mutation"] = v1020
local v1022 = {
	["Description"] = "<font color=\"rgb(50,120,255)\">GIANT</font> <font color=\"rgb(120,180,255)\">GOLEM:</font> Pet is a giant golem! Has a big increase to passive, slightly bigger & gains bonus <font color=\"rgb(255,215,0)\"><Amount></font>XP/s for every Christmas-type plant in your garden!"
}
local v1023 = {
	["Amount"] = {
		["Max"] = 0.15,
		["Base"] = 0.15,
		["Scale"] = 0,
		["Formatter"] = "NoPrecision"
	}
}
v1022.States = v1023
v1["Giant Golem Pet Mutation"] = v1022
local v1024 = {
	["Description"] = "<font color=\"rgb(217, 244, 255)\">SPIRIT SPARKLE:</font> Every <Cooldown>m, your pet either ages up once, or ages down once."
}
local v1025 = {
	["Cooldown"] = {
		["Min"] = 1200,
		["Base"] = 1500,
		["Scale"] = -8,
		["Formatter"] = "ColonTime"
	}
}
v1024.States = v1025
v1["Spirit Sparkle Pet Mutation"] = v1024
local v1026 = {
	["Description"] = "<font color=\"rgb(255, 128, 0)\">FIERY:</font> Every <Cooldown>m, consumes a random fruit to mutate fruits around it with the Fiery mutation!"
}
local v1027 = {
	["Cooldown"] = {
		["Min"] = 300,
		["Base"] = 600,
		["Scale"] = -2,
		["Formatter"] = "ColonTime"
	}
}
v1026.States = v1027
v1["Fiery Pet Mutation"] = v1026
local v1028 = {
	["Description"] = "<font color=\"rgb(149, 0, 255)\">VENOM: BIG boost to passive but drains <Amount>% xp per second!</font>"
}
local v1029 = {
	["Amount"] = {
		["Max"] = 0.02,
		["Base"] = 0.02,
		["Min"] = 0.02,
		["Scale"] = 0
	}
}
v1028.States = v1029
v1["Venom Pet Mutation"] = v1028
local v1030 = {
	["Description"] = "<font color=\"rgb(105, 158, 255)\">B</font><font color=\"rgb(236, 128, 255)\">L</font><font color=\"rgb(255, 129, 211)\">O</font><font color=\"rgb(105, 158, 255)\">S</font><font color=\"rgb(236, 128, 255)\">S</font><font color=\"rgb(255, 129, 211)\">O</font><font color=\"rgb(105, 158, 255)\">M</font><font color=\"rgb(236, 128, 255)\">I</font><font color=\"rgb(255, 129, 211)\">N</font><font color=\"rgb(105, 158, 255)\">G</font><font color=\"rgb(255, 129, 211)\">: Provides a bigger increase to the pet\'s passive and gains an additional <Amount> XP per second!</font>"
}
local v1031 = {
	["Amount"] = {
		["Max"] = 25,
		["Base"] = 7,
		["Scale"] = 0.15
	}
}
v1030.States = v1031
v1["Blossoming Pet Mutation"] = v1030
v1["Everchanted Pet Mutation"] = {
	["Description"] = "<font color=\"rgb(255, 215, 0)\">E</font><font color=\"rgb(0, 255, 127)\">V</font><font color=\"rgb(255, 215, 0)\">E</font><font color=\"rgb(0, 255, 127)\">R</font><font color=\"rgb(255, 215, 0)\">C</font><font color=\"rgb(0, 255, 127)\">H</font><font color=\"rgb(255, 215, 0)\">A</font><font color=\"rgb(0, 255, 127)\">N</font><font color=\"rgb(255, 215, 0)\">T</font><font color=\"rgb(0, 255, 127)\">E</font><font color=\"rgb(255, 215, 0)\">D</font><font color=\"rgb(0, 255, 127)\">:</font> BIG boost to passive!",
	["States"] = {}
}
local v1032 = {
	["Description"] = "<font color=\"rgb(255, 215, 0)\">E</font><font color=\"rgb(0, 255, 127)\">V</font><font color=\"rgb(255, 215, 0)\">E</font><font color=\"rgb(0, 255, 127)\">R</font><font color=\"rgb(255, 215, 0)\">C</font><font color=\"rgb(0, 255, 127)\">H</font><font color=\"rgb(255, 215, 0)\">A</font><font color=\"rgb(0, 255, 127)\">N</font><font color=\"rgb(255, 215, 0)\">T</font><font color=\"rgb(0, 255, 127)\">E</font><font color=\"rgb(255, 215, 0)\">D</font><font color=\"rgb(0, 255, 127)\">:</font> Every <Cooldown>m, consumes a fruit (ignores favorited) with 7+ mutations and applies Medium Passive Boost to a random pet in your garden!"
}
local v1033 = {
	["Cooldown"] = {
		["Min"] = 500,
		["Base"] = 1000,
		["Scale"] = -5,
		["Formatter"] = "ColonTime"
	}
}
v1032.States = v1033
v1["Everchanted Pet Mutation Bonus"] = v1032
return v1