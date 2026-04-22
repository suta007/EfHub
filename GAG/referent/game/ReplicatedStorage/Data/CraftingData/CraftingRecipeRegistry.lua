local v1 = game:GetService("ReplicatedStorage")
require(v1.Data.CraftingData.CraftingTypeRegistry)
local v2 = {}
local v3 = {}
local v4 = {}
local v5 = {
	["ItemType"] = "Sprinkler",
	["ItemData"] = {
		["ItemName"] = "Basic Sprinkler",
		["AcceptAllTypes"] = false
	}
}
v4[1] = v5
local v6 = {
	["ItemType"] = "Sprinkler",
	["ItemData"] = {
		["ItemName"] = "Advanced Sprinkler",
		["AcceptAllTypes"] = false
	}
}
v4[2] = v6
local v7 = {
	["ItemType"] = "Sprinkler",
	["ItemData"] = {
		["ItemName"] = "Godly Sprinkler",
		["AcceptAllTypes"] = false
	}
}
v4[3] = v7
v3.Inputs = v4
local v8 = {}
local v9 = {
	["ItemType"] = "Gear",
	["ItemData"] = {
		["ItemName"] = "Lightning Rod",
		["Quantity"] = 1
	}
}
v8[1] = v9
v3.Outputs = v8
v3.TimeToCraft = 2700
v3.PurchaseID = 3265946758
v3.RobuxPrice = 179
v3.LayoutOrder = 5
v3.MachineTypes = { "GearEventWorkbench" }
v3.Cost = {
	["CurrencyType"] = "Sheckles",
	["Amount"] = 500000
}
v2["Lightning Rod"] = v3
local v10 = {}
local v11 = {}
local v12 = {
	["ItemType"] = "Sprinkler",
	["ItemData"] = {
		["ItemName"] = "Basic Sprinkler",
		["AcceptAllTypes"] = false
	}
}
v11[1] = v12
local v13 = {
	["ItemType"] = "Sprinkler",
	["ItemData"] = {
		["ItemName"] = "Advanced Sprinkler",
		["AcceptAllTypes"] = false
	}
}
v11[2] = v13
local v14 = {
	["ItemType"] = "Sprinkler",
	["ItemData"] = {
		["ItemName"] = "Godly Sprinkler",
		["AcceptAllTypes"] = false
	}
}
v11[3] = v14
v10.Inputs = v11
local v15 = {}
local v16 = {
	["ItemType"] = "Gear",
	["ItemData"] = {
		["ItemName"] = "Tanning Mirror",
		["Quantity"] = 1
	}
}
v15[1] = v16
v10.Outputs = v15
v10.TimeToCraft = 2700
v10.PurchaseID = 3311159836
v10.RobuxPrice = 219
v10.LayoutOrder = 6
v10.MachineTypes = { "GearEventWorkbench" }
v10.Cost = {
	["CurrencyType"] = "Sheckles",
	["Amount"] = 500000
}
v2["Tanning Mirror"] = v10
local v17 = {}
local v18 = {}
local v19 = {
	["ItemType"] = "PetEgg",
	["ItemData"] = {
		["ItemName"] = "Common Egg",
		["AcceptAllTypes"] = false
	}
}
v18[1] = v19
local v20 = {
	["ItemType"] = "Harvest Tool",
	["ItemData"] = {
		["ItemName"] = "Harvest Tool",
		["AcceptAllTypes"] = false
	}
}
v18[2] = v20
v17.Inputs = v18
local v21 = {}
local v22 = {
	["ItemType"] = "Gear",
	["ItemData"] = {
		["ItemName"] = "Reclaimer",
		["Quantity"] = 3
	}
}
v21[1] = v22
v17.Outputs = v21
v17.TimeToCraft = 1500
v17.PurchaseID = 3309686533
v17.RobuxPrice = 199
v17.LayoutOrder = 8
v17.MachineTypes = { "GearEventWorkbench" }
v17.Cost = {
	["CurrencyType"] = "Sheckles",
	["Amount"] = 500000
}
v2.Reclaimer = v17
local v23 = {}
local v24 = {}
local v25 = {
	["ItemType"] = "Recall Wrench",
	["ItemData"] = {
		["ItemName"] = "Recall Wrench",
		["AcceptAllTypes"] = false
	}
}
v24[1] = v25
local v26 = {
	["ItemType"] = "Holdable",
	["ItemData"] = {
		["ItemName"] = "Apple",
		["AcceptAllTypes"] = false
	}
}
v24[2] = v26
v23.Inputs = v24
local v27 = {}
local v28 = {
	["ItemType"] = "Gear",
	["ItemData"] = {
		["ItemName"] = "Event Lantern",
		["Quantity"] = 30
	}
}
v27[1] = v28
v23.Outputs = v27
v23.TimeToCraft = 10
v23.PurchaseID = 3388358462
v23.RobuxPrice = 39
v23.LayoutOrder = 10
v23.MachineTypes = { "GearEventWorkbench" }
v23.Cost = {
	["CurrencyType"] = "Sheckles",
	["Amount"] = 350000
}
v2["Event Lantern"] = v23
local v29 = {}
local v30 = {}
local v31 = {
	["ItemType"] = "SprayBottle",
	["ItemData"] = {
		["ItemName"] = "Cleaning Spray",
		["AcceptAllTypes"] = false
	}
}
v30[1] = v31
local v32 = {
	["ItemType"] = "Seed",
	["ItemData"] = {
		["ItemName"] = "Orange Tulip",
		["AcceptAllTypes"] = false
	}
}
v30[2] = v32
local v33 = {
	["ItemType"] = "Seed",
	["ItemData"] = {
		["ItemName"] = "Daffodil",
		["AcceptAllTypes"] = false
	}
}
v30[3] = v33
local v34 = {
	["ItemType"] = "Holdable",
	["ItemData"] = {
		["ItemName"] = "Mango",
		["AcceptAllTypes"] = false
	}
}
v30[4] = v34
v29.Inputs = v30
local v35 = {}
local v36 = {
	["ItemType"] = "Gear",
	["ItemData"] = {
		["ItemName"] = "Mutation Spray Glimmering",
		["Quantity"] = 1
	}
}
v35[1] = v36
v29.Outputs = v35
v29.TimeToCraft = 900
v29.PurchaseID = 3388357651
v29.RobuxPrice = 159
v29.LayoutOrder = 12
v29.DisplayInCrafting = false
v29.MachineTypes = { "GearEventWorkbench" }
v29.Cost = {
	["CurrencyType"] = "Sheckles",
	["Amount"] = 1000000
}
v2["Mutation Spray Glimmering"] = v29
local v37 = {}
local v38 = {}
local v39 = {
	["ItemType"] = "PetEgg",
	["ItemData"] = {
		["ItemName"] = "Common Egg",
		["AcceptAllTypes"] = false
	}
}
v38[1] = v39
local v40 = {
	["ItemType"] = "Food",
	["ItemData"] = {
		["ItemName"] = "Corndog",
		["Quantity"] = 1
	}
}
v38[2] = v40
local v41 = {
	["ItemType"] = "PetBoost",
	["ItemData"] = {
		["ItemName"] = "Small Treat",
		["AcceptAllTypes"] = false
	}
}
v38[3] = v41
local v42 = {
	["ItemType"] = "PetBoost",
	["ItemData"] = {
		["ItemName"] = "Small Toy",
		["AcceptAllTypes"] = false
	}
}
v38[4] = v42
v37.Inputs = v38
local v43 = {}
local v44 = {
	["ItemType"] = "Gear",
	["ItemData"] = {
		["ItemName"] = "Pet Pouch",
		["Quantity"] = 1
	}
}
v43[1] = v44
v37.Outputs = v43
v37.TimeToCraft = 1800
v37.PurchaseID = 3369521127
v37.RobuxPrice = 89
v37.LayoutOrder = 118
v37.MachineTypes = { "GearEventWorkbench" }
v37.Cost = {
	["CurrencyType"] = "Sheckles",
	["Amount"] = 50000000
}
v2["Pet Pouch"] = v37
local v45 = {}
local v46 = {}
local v47 = {
	["ItemType"] = "PetEgg",
	["ItemData"] = {
		["ItemName"] = "Common Egg",
		["AcceptAllTypes"] = false
	}
}
v46[1] = v47
local v48 = {
	["ItemType"] = "Seed",
	["ItemData"] = {
		["ItemName"] = "Coconut",
		["AcceptAllTypes"] = false
	}
}
v46[2] = v48
local v49 = {
	["ItemType"] = "Holdable",
	["ItemData"] = {
		["ItemName"] = "Coconut",
		["AcceptAllTypes"] = false
	}
}
v46[3] = v49
v45.Inputs = v46
local v50 = {}
local v51 = {
	["ItemType"] = "Gear",
	["ItemData"] = {
		["ItemName"] = "Small Toy",
		["Quantity"] = 3
	}
}
v50[1] = v51
v45.Outputs = v50
v45.TimeToCraft = 600
v45.PurchaseID = 3329526448
v45.RobuxPrice = 139
v45.LayoutOrder = 113
v45.MachineTypes = { "GearEventWorkbench" }
v45.Cost = {
	["CurrencyType"] = "Sheckles",
	["Amount"] = 1000000
}
v2["Small Toy"] = v45
local v52 = {}
local v53 = {}
local v54 = {
	["ItemType"] = "PetEgg",
	["ItemData"] = {
		["ItemName"] = "Common Egg",
		["AcceptAllTypes"] = false
	}
}
v53[1] = v54
local v55 = {
	["ItemType"] = "Seed",
	["ItemData"] = {
		["ItemName"] = "Dragon Fruit",
		["AcceptAllTypes"] = false
	}
}
v53[2] = v55
local v56 = {
	["ItemType"] = "Holdable",
	["ItemData"] = {
		["ItemName"] = "Blueberry",
		["AcceptAllTypes"] = false
	}
}
v53[3] = v56
v52.Inputs = v53
local v57 = {}
local v58 = {
	["ItemType"] = "Gear",
	["ItemData"] = {
		["ItemName"] = "Small Treat",
		["Quantity"] = 3
	}
}
v57[1] = v58
v52.Outputs = v57
v52.TimeToCraft = 600
v52.PurchaseID = 3329527534
v52.RobuxPrice = 89
v52.LayoutOrder = 115
v52.MachineTypes = { "GearEventWorkbench" }
v52.Cost = {
	["CurrencyType"] = "Sheckles",
	["Amount"] = 1000000
}
v2["Small Treat"] = v52
local v59 = {}
local v60 = {}
local v61 = {
	["ItemType"] = "Holdable",
	["ItemData"] = {
		["ItemName"] = "Coconut",
		["AcceptAllTypes"] = false
	}
}
v60[1] = v61
local v62 = {
	["ItemType"] = "Holdable",
	["ItemData"] = {
		["ItemName"] = "Dragon Fruit",
		["AcceptAllTypes"] = false
	}
}
v60[2] = v62
local v63 = {
	["ItemType"] = "Holdable",
	["ItemData"] = {
		["ItemName"] = "Mango",
		["AcceptAllTypes"] = false
	}
}
v60[3] = v63
local v64 = {
	["ItemType"] = "Sprinkler",
	["ItemData"] = {
		["ItemName"] = "Godly Sprinkler",
		["AcceptAllTypes"] = false
	}
}
v60[4] = v64
v59.Inputs = v60
local v65 = {}
local v66 = {
	["ItemType"] = "Gear",
	["ItemData"] = {
		["ItemName"] = "Tropical Mist Sprinkler",
		["Quantity"] = 1
	}
}
v65[1] = v66
v59.Outputs = v65
v59.TimeToCraft = 3600
v59.PurchaseID = 3306484251
v59.RobuxPrice = 229
v59.LayoutOrder = 10
v59.MachineTypes = { "GearEventWorkbench" }
v59.DisplayInCrafting = false
v2["Tropical Mist Sprinkler"] = v59
local v67 = {}
local v68 = {}
local v69 = {
	["ItemType"] = "Holdable",
	["ItemData"] = {
		["ItemName"] = "Grape",
		["AcceptAllTypes"] = false
	}
}
v68[1] = v69
local v70 = {
	["ItemType"] = "Holdable",
	["ItemData"] = {
		["ItemName"] = "Blueberry",
		["AcceptAllTypes"] = false
	}
}
v68[2] = v70
local v71 = {
	["ItemType"] = "Holdable",
	["ItemData"] = {
		["ItemName"] = "Strawberry",
		["AcceptAllTypes"] = false
	}
}
v68[3] = v71
local v72 = {
	["ItemType"] = "Sprinkler",
	["ItemData"] = {
		["ItemName"] = "Godly Sprinkler",
		["AcceptAllTypes"] = false
	}
}
v68[4] = v72
v67.Inputs = v68
local v73 = {}
local v74 = {
	["ItemType"] = "Gear",
	["ItemData"] = {
		["ItemName"] = "Berry Blusher Sprinkler",
		["Quantity"] = 1
	}
}
v73[1] = v74
v67.Outputs = v73
v67.TimeToCraft = 3600
v67.PurchaseID = 3306484242
v67.RobuxPrice = 229
v67.LayoutOrder = 20
v67.MachineTypes = { "GearEventWorkbench" }
v67.DisplayInCrafting = false
v2["Berry Blusher Sprinkler"] = v67
local v75 = {}
local v76 = {}
local v77 = {
	["ItemType"] = "Holdable",
	["ItemData"] = {
		["ItemName"] = "Pepper",
		["AcceptAllTypes"] = false
	}
}
v76[1] = v77
local v78 = {
	["ItemType"] = "Holdable",
	["ItemData"] = {
		["ItemName"] = "Ember Lily",
		["AcceptAllTypes"] = false
	}
}
v76[2] = v78
local v79 = {
	["ItemType"] = "Holdable",
	["ItemData"] = {
		["ItemName"] = "Cacao",
		["AcceptAllTypes"] = false
	}
}
v76[3] = v79
local v80 = {
	["ItemType"] = "Sprinkler",
	["ItemData"] = {
		["ItemName"] = "Master Sprinkler",
		["AcceptAllTypes"] = false
	}
}
v76[4] = v80
v75.Inputs = v76
local v81 = {}
local v82 = {
	["ItemType"] = "Gear",
	["ItemData"] = {
		["ItemName"] = "Spice Spritzer Sprinkler",
		["Quantity"] = 1
	}
}
v81[1] = v82
v75.Outputs = v81
v75.TimeToCraft = 3600
v75.PurchaseID = 3306484232
v75.RobuxPrice = 229
v75.LayoutOrder = 30
v75.MachineTypes = { "GearEventWorkbench" }
v75.DisplayInCrafting = false
v2["Spice Spritzer Sprinkler"] = v75
local v83 = {}
local v84 = {}
local v85 = {
	["ItemType"] = "Holdable",
	["ItemData"] = {
		["ItemName"] = "Watermelon",
		["AcceptAllTypes"] = false
	}
}
v84[1] = v85
local v86 = {
	["ItemType"] = "Holdable",
	["ItemData"] = {
		["ItemName"] = "Watermelon",
		["AcceptAllTypes"] = false
	}
}
v84[2] = v86
local v87 = {
	["ItemType"] = "Holdable",
	["ItemData"] = {
		["ItemName"] = "Watermelon",
		["AcceptAllTypes"] = false
	}
}
v84[3] = v87
local v88 = {
	["ItemType"] = "Sprinkler",
	["ItemData"] = {
		["ItemName"] = "Master Sprinkler",
		["AcceptAllTypes"] = false
	}
}
v84[4] = v88
v83.Inputs = v84
local v89 = {}
local v90 = {
	["ItemType"] = "Gear",
	["ItemData"] = {
		["ItemName"] = "Sweet Soaker Sprinkler",
		["Quantity"] = 1
	}
}
v89[1] = v90
v83.Outputs = v89
v83.TimeToCraft = 3600
v83.PurchaseID = 3306484252
v83.RobuxPrice = 229
v83.LayoutOrder = 40
v83.MachineTypes = { "GearEventWorkbench" }
v83.DisplayInCrafting = false
v2["Sweet Soaker Sprinkler"] = v83
local v91 = {}
local v92 = {}
local v93 = {
	["ItemType"] = "Holdable",
	["ItemData"] = {
		["ItemName"] = "Orange Tulip",
		["AcceptAllTypes"] = false
	}
}
v92[1] = v93
local v94 = {
	["ItemType"] = "Holdable",
	["ItemData"] = {
		["ItemName"] = "Daffodil",
		["AcceptAllTypes"] = false
	}
}
v92[2] = v94
local v95 = {
	["ItemType"] = "Sprinkler",
	["ItemData"] = {
		["ItemName"] = "Advanced Sprinkler",
		["AcceptAllTypes"] = false
	}
}
v92[3] = v95
local v96 = {
	["ItemType"] = "Sprinkler",
	["ItemData"] = {
		["ItemName"] = "Basic Sprinkler",
		["AcceptAllTypes"] = false
	}
}
v92[4] = v96
v91.Inputs = v92
local v97 = {}
local v98 = {
	["ItemType"] = "Gear",
	["ItemData"] = {
		["ItemName"] = "Flower Froster Sprinkler",
		["Quantity"] = 1
	}
}
v97[1] = v98
v91.Outputs = v97
v91.TimeToCraft = 3600
v91.PurchaseID = 3306484243
v91.RobuxPrice = 229
v91.LayoutOrder = 50
v91.MachineTypes = { "GearEventWorkbench" }
v91.DisplayInCrafting = false
v2["Flower Froster Sprinkler"] = v91
local v99 = {}
local v100 = {}
local v101 = {
	["ItemType"] = "Holdable",
	["ItemData"] = {
		["ItemName"] = "Bamboo",
		["AcceptAllTypes"] = false
	}
}
v100[1] = v101
local v102 = {
	["ItemType"] = "Holdable",
	["ItemData"] = {
		["ItemName"] = "Beanstalk",
		["AcceptAllTypes"] = false
	}
}
v100[2] = v102
local v103 = {
	["ItemType"] = "Holdable",
	["ItemData"] = {
		["ItemName"] = "Mushroom",
		["AcceptAllTypes"] = false
	}
}
v100[3] = v103
local v104 = {
	["ItemType"] = "Sprinkler",
	["ItemData"] = {
		["ItemName"] = "Advanced Sprinkler",
		["AcceptAllTypes"] = false
	}
}
v100[4] = v104
v99.Inputs = v100
local v105 = {}
local v106 = {
	["ItemType"] = "Gear",
	["ItemData"] = {
		["ItemName"] = "Stalk Sprout Sprinkler",
		["Quantity"] = 1
	}
}
v105[1] = v106
v99.Outputs = v105
v99.TimeToCraft = 3600
v99.PurchaseID = 3306484241
v99.RobuxPrice = 229
v99.LayoutOrder = 60
v99.MachineTypes = { "GearEventWorkbench" }
v99.DisplayInCrafting = false
v2["Stalk Sprout Sprinkler"] = v99
local v107 = {}
local v108 = {}
local v109 = {
	["ItemType"] = "SprayBottle",
	["ItemData"] = {
		["ItemName"] = "Cleaning Spray",
		["AcceptAllTypes"] = false
	}
}
v108[1] = v109
local v110 = {
	["ItemType"] = "Holdable",
	["ItemData"] = {
		["ItemName"] = "Cacao",
		["AcceptAllTypes"] = false
	}
}
v108[2] = v110
v107.Inputs = v108
local v111 = {}
local v112 = {
	["ItemType"] = "Gear",
	["ItemData"] = {
		["ItemName"] = "Mutation Spray Choc",
		["Quantity"] = 1
	}
}
v111[1] = v112
v107.Outputs = v111
v107.TimeToCraft = 720
v107.PurchaseID = 3306484247
v107.RobuxPrice = 179
v107.LayoutOrder = 70
v107.MachineTypes = { "GearEventWorkbench" }
v107.Cost = {
	["CurrencyType"] = "Sheckles",
	["Amount"] = 200000
}
v107.DisplayInCrafting = false
v2["Mutation Spray Choc"] = v107
local v113 = {}
local v114 = {}
local v115 = {
	["ItemType"] = "SprayBottle",
	["ItemData"] = {
		["ItemName"] = "Cleaning Spray",
		["AcceptAllTypes"] = false
	}
}
v114[1] = v115
local v116 = {
	["ItemType"] = "Sprinkler",
	["ItemData"] = {
		["ItemName"] = "Godly Sprinkler",
		["AcceptAllTypes"] = false
	}
}
v114[2] = v116
v113.Inputs = v114
local v117 = {}
local v118 = {
	["ItemType"] = "Gear",
	["ItemData"] = {
		["ItemName"] = "Mutation Spray Chilled",
		["Quantity"] = 1
	}
}
v117[1] = v118
v113.Outputs = v117
v113.TimeToCraft = 300
v113.PurchaseID = 3317772898
v113.RobuxPrice = 189
v113.LayoutOrder = 80
v113.DisplayInCrafting = false
v113.MachineTypes = { "GearEventWorkbench" }
v113.Cost = {
	["CurrencyType"] = "Sheckles",
	["Amount"] = 500000
}
v2["Mutation Spray Chilled"] = v113
local v119 = {}
local v120 = {}
local v121 = {
	["ItemType"] = "SprayBottle",
	["ItemData"] = {
		["ItemName"] = "Cleaning Spray",
		["AcceptAllTypes"] = false
	}
}
v120[1] = v121
local v122 = {
	["ItemType"] = "Holdable",
	["ItemData"] = {
		["ItemName"] = "Bee Balm",
		["AcceptAllTypes"] = false
	}
}
v120[2] = v122
v119.Inputs = v120
local v123 = {}
local v124 = {
	["ItemType"] = "Gear",
	["ItemData"] = {
		["ItemName"] = "Mutation Spray Pollinated",
		["Quantity"] = 1
	}
}
v123[1] = v124
v119.Outputs = v123
v119.TimeToCraft = 300
v119.PurchaseID = 3306484250
v119.RobuxPrice = 179
v119.LayoutOrder = 80
v119.MachineTypes = { "GearEventWorkbench" }
v119.Cost = {
	["CurrencyType"] = "Honey",
	["Amount"] = 25
}
v119.DisplayInCrafting = false
v2["Mutation Spray Pollinated"] = v119
local v125 = {}
local v126 = {}
local v127 = {
	["ItemType"] = "SprayBottle",
	["ItemData"] = {
		["ItemName"] = "Cleaning Spray",
		["AcceptAllTypes"] = false
	}
}
v126[1] = v127
local v128 = {
	["ItemType"] = "Lightning Rod",
	["ItemData"] = {
		["ItemName"] = "Lightning Rod",
		["AcceptAllTypes"] = false
	}
}
v126[2] = v128
v125.Inputs = v126
local v129 = {}
local v130 = {
	["ItemType"] = "Gear",
	["ItemData"] = {
		["ItemName"] = "Mutation Spray Shocked",
		["Quantity"] = 1
	}
}
v129[1] = v130
v125.Outputs = v129
v125.TimeToCraft = 1800
v125.PurchaseID = 3306484253
v125.RobuxPrice = 199
v125.LayoutOrder = 90
v125.MachineTypes = { "GearEventWorkbench" }
v125.Cost = {
	["CurrencyType"] = "Sheckles",
	["Amount"] = 1000000
}
v125.DisplayInCrafting = false
v2["Mutation Spray Shocked"] = v125
local v131 = {}
local v132 = {}
local v133 = {
	["ItemType"] = "CosmeticCrate",
	["ItemData"] = {
		["ItemName"] = "Bee Crate",
		["AcceptAllTypes"] = false
	}
}
v132[1] = v133
v131.Inputs = v132
local v134 = {}
local v135 = {
	["ItemType"] = "CosmeticCrate",
	["ItemData"] = {
		["ItemName"] = "Honey Crafters Crate",
		["Quantity"] = 1
	}
}
v134[1] = v135
v131.Outputs = v134
v131.TimeToCraft = 1800
v131.PurchaseID = 3306484248
v131.RobuxPrice = 179
v131.LayoutOrder = 100
v131.MachineTypes = { "GearEventWorkbench" }
v131.Cost = {
	["CurrencyType"] = "Honey",
	["Amount"] = 12
}
v131.DisplayInCrafting = false
v2["Honey Crafters Crate"] = v131
local v136 = {}
local v137 = {}
local v138 = {
	["ItemType"] = "PetEgg",
	["ItemData"] = {
		["ItemName"] = "Bee Egg",
		["AcceptAllTypes"] = false
	}
}
v137[1] = v138
v136.Inputs = v137
local v139 = {}
local v140 = {
	["ItemType"] = "PetEgg",
	["ItemData"] = {
		["ItemName"] = "Anti Bee Egg",
		["Quantity"] = 1
	}
}
v139[1] = v140
v136.Outputs = v139
v136.TimeToCraft = 7200
v136.PurchaseID = 3306484244
v136.RobuxPrice = 149
v136.LayoutOrder = 110
v136.MachineTypes = { "GearEventWorkbench" }
v136.Cost = {
	["CurrencyType"] = "Honey",
	["Amount"] = 25
}
v2["Anti Bee Egg"] = v136
local v141 = {}
local v142 = {}
local v143 = {
	["ItemType"] = "PetEgg",
	["ItemData"] = {
		["ItemName"] = "Anti Bee Egg",
		["AcceptAllTypes"] = false
	}
}
v142[1] = v143
local v144 = {
	["ItemType"] = "Holdable",
	["ItemData"] = {
		["ItemName"] = "Legacy Sunflower",
		["AcceptAllTypes"] = false
	}
}
v142[2] = v144
local v145 = {
	["ItemType"] = "Holdable",
	["ItemData"] = {
		["ItemName"] = "Purple Dahlia",
		["AcceptAllTypes"] = false
	}
}
v142[3] = v145
v141.Inputs = v142
local v146 = {}
local v147 = {
	["ItemType"] = "Pet",
	["ItemData"] = {
		["ItemName"] = "Pack Bee",
		["Quantity"] = 1
	}
}
v146[1] = v147
v141.Outputs = v146
v141.TimeToCraft = 14400
v141.PurchaseID = 3306484257
v141.RobuxPrice = 799
v141.LayoutOrder = 120
v141.MachineTypes = { "GearEventWorkbench" }
v141.Cost = {
	["CurrencyType"] = "Honey",
	["Amount"] = 250
}
v2["Pack Bee"] = v141
local v148 = {}
local v149 = {}
local v150 = {
	["ItemType"] = "Holdable",
	["ItemData"] = {
		["ItemName"] = "Sugar Apple",
		["AcceptAllTypes"] = false
	}
}
v149[1] = v150
local v151 = {
	["ItemType"] = "Seed",
	["ItemData"] = {
		["ItemName"] = "Buttercup",
		["AcceptAllTypes"] = false
	}
}
v149[2] = v151
local v152 = {
	["ItemType"] = "Sprinkler",
	["ItemData"] = {
		["ItemName"] = "Basic Sprinkler",
		["AcceptAllTypes"] = false
	}
}
v149[3] = v152
v148.Inputs = v149
local v153 = {}
local v154 = {
	["ItemType"] = "Cosmetic",
	["ItemData"] = {
		["ItemName"] = "Silver Ingot",
		["Quantity"] = 1
	}
}
v153[1] = v154
v148.Outputs = v153
v148.TimeToCraft = 60
v148.PurchaseID = 3460380386
v148.RobuxPrice = 29
v148.LayoutOrder = 130
v148.MachineTypes = { "GearEventWorkbench" }
v148.Cost = {
	["CurrencyType"] = "Sheckles",
	["Amount"] = 150000
}
v2["Silver Ingot"] = v148
local v155 = {}
local v156 = {}
local v157 = {
	["ItemType"] = "Holdable",
	["ItemData"] = {
		["ItemName"] = "Giant Pinecone",
		["AcceptAllTypes"] = false
	}
}
v156[1] = v157
local v158 = {
	["ItemType"] = "Seed",
	["ItemData"] = {
		["ItemName"] = "Daffodil",
		["AcceptAllTypes"] = false
	}
}
v156[2] = v158
local v159 = {
	["ItemType"] = "Sprinkler",
	["ItemData"] = {
		["ItemName"] = "Advanced Sprinkler",
		["AcceptAllTypes"] = false
	}
}
v156[3] = v159
v155.Inputs = v156
local v160 = {}
local v161 = {
	["ItemType"] = "Cosmetic",
	["ItemData"] = {
		["ItemName"] = "Gold Ingot",
		["Quantity"] = 1
	}
}
v160[1] = v161
v155.Outputs = v160
v155.TimeToCraft = 60
v155.PurchaseID = 3460381002
v155.RobuxPrice = 33
v155.LayoutOrder = 140
v155.MachineTypes = { "GearEventWorkbench" }
v155.Cost = {
	["CurrencyType"] = "Sheckles",
	["Amount"] = 300000
}
v2["Gold Ingot"] = v155
local v162 = {}
local v163 = {}
local v164 = {
	["ItemType"] = "Pet",
	["ItemData"] = {
		["ItemName"] = "Pig",
		["AcceptAllTypes"] = false
	}
}
v163[1] = v164
local v165 = {
	["ItemType"] = "Food",
	["ItemData"] = {
		["ItemName"] = "Sushi",
		["Quantity"] = 1
	}
}
v163[2] = v165
local v166 = {
	["ItemType"] = "Lightning Rod",
	["ItemData"] = {
		["ItemName"] = "Lightning Rod",
		["AcceptAllTypes"] = false
	}
}
v163[3] = v166
local v167 = {
	["ItemType"] = "PetBoost",
	["ItemData"] = {
		["ItemName"] = "Medium Toy",
		["AcceptAllTypes"] = false
	}
}
v163[4] = v167
v162.Inputs = v163
local v168 = {}
local v169 = {
	["ItemType"] = "Pet",
	["ItemData"] = {
		["ItemName"] = "Silver Piggy",
		["Quantity"] = 1
	}
}
v168[1] = v169
v162.Outputs = v168
v162.TimeToCraft = 1800
v162.PurchaseID = 3460381175
v162.RobuxPrice = 419
v162.LayoutOrder = 150
v162.MachineTypes = { "GearEventWorkbench" }
v162.Cost = {
	["CurrencyType"] = "Sheckles",
	["Amount"] = 150000000
}
v2["Silver Piggy"] = v162
local v170 = {}
local v171 = {}
local v172 = {
	["ItemType"] = "Pet",
	["ItemData"] = {
		["ItemName"] = "Silver Piggy",
		["AcceptAllTypes"] = false
	}
}
v171[1] = v172
local v173 = {
	["ItemType"] = "Food",
	["ItemData"] = {
		["ItemName"] = "Pizza",
		["Quantity"] = 1
	}
}
v171[2] = v173
local v174 = {
	["ItemType"] = "Tanning Mirror",
	["ItemData"] = {
		["ItemName"] = "Tanning Mirror",
		["AcceptAllTypes"] = false
	}
}
v171[3] = v174
local v175 = {
	["ItemType"] = "PetBoost",
	["ItemData"] = {
		["ItemName"] = "Medium Treat",
		["AcceptAllTypes"] = false
	}
}
v171[4] = v175
v170.Inputs = v171
local v176 = {}
local v177 = {
	["ItemType"] = "Pet",
	["ItemData"] = {
		["ItemName"] = "Golden Piggy",
		["Quantity"] = 1
	}
}
v176[1] = v177
v170.Outputs = v176
v170.TimeToCraft = 2700
v170.PurchaseID = 3460381429
v170.RobuxPrice = 459
v170.LayoutOrder = 160
v170.MachineTypes = { "GearEventWorkbench" }
v170.Cost = {
	["CurrencyType"] = "Sheckles",
	["Amount"] = 300000000
}
v2["Golden Piggy"] = v170
local v178 = {}
local v179 = {}
local v180 = {
	["ItemType"] = "PetEgg",
	["ItemData"] = {
		["ItemName"] = "Mythical Egg",
		["AcceptAllTypes"] = false
	}
}
v179[1] = v180
local v181 = {
	["ItemType"] = "PetEgg",
	["ItemData"] = {
		["ItemName"] = "Bug Egg",
		["AcceptAllTypes"] = false
	}
}
v179[2] = v181
local v182 = {
	["ItemType"] = "PetEgg",
	["ItemData"] = {
		["ItemName"] = "Jungle Egg",
		["AcceptAllTypes"] = false
	}
}
v179[3] = v182
local v183 = {
	["ItemType"] = "PetEgg",
	["ItemData"] = {
		["ItemName"] = "Gem Egg",
		["AcceptAllTypes"] = false
	}
}
v179[4] = v183
v178.Inputs = v179
local v184 = {}
local v185 = {
	["ItemType"] = "Gear",
	["ItemData"] = {
		["ItemName"] = "Chimera Stone",
		["Quantity"] = 1
	}
}
v184[1] = v185
v178.Outputs = v184
v178.TimeToCraft = 3600
v178.PurchaseID = 3460382022
v178.RobuxPrice = 199
v178.LayoutOrder = 170
v178.MachineTypes = { "GearEventWorkbench" }
v178.Cost = {
	["CurrencyType"] = "Sheckles",
	["Amount"] = 500000000
}
v178.DisplayInCrafting = true
v2["Chimera Stone"] = v178
local v186 = {}
local v187 = {}
local v188 = {
	["ItemType"] = "Seed Pack",
	["ItemData"] = {
		["ItemName"] = "Flower Seed Pack",
		["AcceptAllTypes"] = false
	}
}
v187[1] = v188
v186.Inputs = v187
local v189 = {}
local v190 = {
	["ItemType"] = "Seed Pack",
	["ItemData"] = {
		["ItemName"] = "Crafters Seed Pack",
		["Quantity"] = 1
	}
}
v189[1] = v190
v186.Outputs = v189
v186.TimeToCraft = 1200
v186.PurchaseID = 3306485034
v186.RobuxPrice = 199
v186.LayoutOrder = 130
v186.MachineTypes = { "SeedEventWorkbench" }
v186.Cost = {
	["CurrencyType"] = "Honey",
	["Amount"] = 10
}
v186.DisplayInCrafting = false
v2["Crafters Seed Pack"] = v186
local v191 = {}
local v192 = {}
local v193 = {
	["ItemType"] = "Seed",
	["ItemData"] = {
		["ItemName"] = "Rafflesia",
		["AcceptAllTypes"] = false
	}
}
v192[1] = v193
local v194 = {
	["ItemType"] = "Seed",
	["ItemData"] = {
		["ItemName"] = "Cauliflower",
		["AcceptAllTypes"] = false
	}
}
v192[2] = v194
v191.Inputs = v192
local v195 = {}
local v196 = {
	["ItemType"] = "Seed",
	["ItemData"] = {
		["ItemName"] = "Peace Lily",
		["Quantity"] = 1
	}
}
v195[1] = v196
v191.Outputs = v195
v191.TimeToCraft = 600
v191.PurchaseID = 3317730044
v191.RobuxPrice = 129
v191.LayoutOrder = 140
v191.MachineTypes = { "SeedEventWorkbench" }
v191.Cost = {
	["CurrencyType"] = "SummerCoins",
	["Amount"] = 3
}
v191.DisplayInCrafting = false
v2["Peace Lily"] = v191
local v197 = {}
local v198 = {}
local v199 = {
	["ItemType"] = "Seed",
	["ItemData"] = {
		["ItemName"] = "Peace Lily",
		["AcceptAllTypes"] = false
	}
}
v198[1] = v199
local v200 = {
	["ItemType"] = "Holdable",
	["ItemData"] = {
		["ItemName"] = "Prickly Pear",
		["AcceptAllTypes"] = false
	}
}
v198[2] = v200
v197.Inputs = v198
local v201 = {}
local v202 = {
	["ItemType"] = "Seed",
	["ItemData"] = {
		["ItemName"] = "Aloe Vera",
		["Quantity"] = 1
	}
}
v201[1] = v202
v197.Outputs = v201
v197.TimeToCraft = 600
v197.PurchaseID = 3317175501
v197.RobuxPrice = 299
v197.LayoutOrder = 143
v197.MachineTypes = { "SeedEventWorkbench" }
v197.Cost = {
	["CurrencyType"] = "SummerCoins",
	["Amount"] = 18
}
v197.DisplayInCrafting = false
v2["Aloe Vera"] = v197
local v203 = {}
local v204 = {}
local v205 = {
	["ItemType"] = "Seed",
	["ItemData"] = {
		["ItemName"] = "Aloe Vera",
		["AcceptAllTypes"] = false
	}
}
v204[1] = v205
local v206 = {
	["ItemType"] = "Seed",
	["ItemData"] = {
		["ItemName"] = "Prickly Pear",
		["AcceptAllTypes"] = false
	}
}
v204[2] = v206
local v207 = {
	["ItemType"] = "Holdable",
	["ItemData"] = {
		["ItemName"] = "Banana",
		["AcceptAllTypes"] = false
	}
}
v204[3] = v207
v203.Inputs = v204
local v208 = {}
local v209 = {
	["ItemType"] = "Seed",
	["ItemData"] = {
		["ItemName"] = "Guanabana",
		["Quantity"] = 1
	}
}
v208[1] = v209
v203.Outputs = v208
v203.TimeToCraft = 600
v203.PurchaseID = 3317175618
v203.RobuxPrice = 779
v203.LayoutOrder = 145
v203.MachineTypes = { "SeedEventWorkbench" }
v203.Cost = {
	["CurrencyType"] = "SummerCoins",
	["Amount"] = 30
}
v203.DisplayInCrafting = false
v2.Guanabana = v203
local v210 = {}
local v211 = {}
local v212 = {
	["ItemType"] = "Seed",
	["ItemData"] = {
		["ItemName"] = "Daffodil",
		["AcceptAllTypes"] = false
	}
}
v211[1] = v212
local v213 = {
	["ItemType"] = "Seed",
	["ItemData"] = {
		["ItemName"] = "Orange Tulip",
		["AcceptAllTypes"] = false
	}
}
v211[2] = v213
v210.Inputs = v211
local v214 = {}
local v215 = {
	["ItemType"] = "Seed",
	["ItemData"] = {
		["ItemName"] = "Manuka Flower",
		["Quantity"] = 1
	}
}
v214[1] = v215
v210.Outputs = v214
v210.TimeToCraft = 600
v210.PurchaseID = 3306485030
v210.RobuxPrice = 99
v210.LayoutOrder = 140
v210.MachineTypes = { "SeedEventWorkbench" }
v210.Cost = {
	["CurrencyType"] = "Honey",
	["Amount"] = 6
}
v210.DisplayInCrafting = false
v2["Manuka Flower"] = v210
local v216 = {}
local v217 = {}
local v218 = {
	["ItemType"] = "Holdable",
	["ItemData"] = {
		["ItemName"] = "Bamboo",
		["AcceptAllTypes"] = false
	}
}
v217[1] = v218
local v219 = {
	["ItemType"] = "Holdable",
	["ItemData"] = {
		["ItemName"] = "Bamboo",
		["AcceptAllTypes"] = false
	}
}
v217[2] = v219
local v220 = {
	["ItemType"] = "Seed",
	["ItemData"] = {
		["ItemName"] = "Manuka Flower",
		["AcceptAllTypes"] = false
	}
}
v217[3] = v220
v216.Inputs = v217
local v221 = {}
local v222 = {
	["ItemType"] = "Seed",
	["ItemData"] = {
		["ItemName"] = "Dandelion",
		["Quantity"] = 1
	}
}
v221[1] = v222
v216.Outputs = v221
v216.TimeToCraft = 960
v216.PurchaseID = 3306485029
v216.RobuxPrice = 199
v216.LayoutOrder = 150
v216.MachineTypes = { "SeedEventWorkbench" }
v216.Cost = {
	["CurrencyType"] = "Honey",
	["Amount"] = 20
}
v216.DisplayInCrafting = false
v2.Dandelion = v216
local v223 = {}
local v224 = {}
local v225 = {
	["ItemType"] = "Holdable",
	["ItemData"] = {
		["ItemName"] = "Pumpkin",
		["AcceptAllTypes"] = false
	}
}
v224[1] = v225
local v226 = {
	["ItemType"] = "Holdable",
	["ItemData"] = {
		["ItemName"] = "Pumpkin",
		["AcceptAllTypes"] = false
	}
}
v224[2] = v226
local v227 = {
	["ItemType"] = "Seed",
	["ItemData"] = {
		["ItemName"] = "Dandelion",
		["AcceptAllTypes"] = false
	}
}
v224[3] = v227
local v228 = {
	["ItemType"] = "Seed Pack",
	["ItemData"] = {
		["ItemName"] = "Flower Seed Pack",
		["AcceptAllTypes"] = false
	}
}
v224[4] = v228
v223.Inputs = v224
local v229 = {}
local v230 = {
	["ItemType"] = "Seed",
	["ItemData"] = {
		["ItemName"] = "Lumira",
		["Quantity"] = 1
	}
}
v229[1] = v230
v223.Outputs = v229
v223.TimeToCraft = 1200
v223.PurchaseID = 3306485023
v223.RobuxPrice = 529
v223.LayoutOrder = 160
v223.MachineTypes = { "SeedEventWorkbench" }
v223.Cost = {
	["CurrencyType"] = "Honey",
	["Amount"] = 40
}
v223.DisplayInCrafting = false
v2.Lumira = v223
local v231 = {}
local v232 = {}
local v233 = {
	["ItemType"] = "Seed",
	["ItemData"] = {
		["ItemName"] = "Pink Lily",
		["AcceptAllTypes"] = false
	}
}
v232[1] = v233
local v234 = {
	["ItemType"] = "Seed",
	["ItemData"] = {
		["ItemName"] = "Purple Dahlia",
		["AcceptAllTypes"] = false
	}
}
v232[2] = v234
v231.Inputs = v232
local v235 = {}
local v236 = {
	["ItemType"] = "Seed",
	["ItemData"] = {
		["ItemName"] = "Honeysuckle",
		["Quantity"] = 1
	}
}
v235[1] = v236
v231.Outputs = v235
v231.TimeToCraft = 1440
v231.PurchaseID = 3306485032
v231.RobuxPrice = 619
v231.LayoutOrder = 170
v231.MachineTypes = { "SeedEventWorkbench" }
v231.Cost = {
	["CurrencyType"] = "Honey",
	["Amount"] = 80
}
v231.DisplayInCrafting = false
v2.Honeysuckle = v231
local v237 = {}
local v238 = {}
local v239 = {
	["ItemType"] = "Holdable",
	["ItemData"] = {
		["ItemName"] = "Crocus",
		["AcceptAllTypes"] = false
	}
}
v238[1] = v239
local v240 = {
	["ItemType"] = "Holdable",
	["ItemData"] = {
		["ItemName"] = "Lavender",
		["AcceptAllTypes"] = false
	}
}
v238[2] = v240
v237.Inputs = v238
local v241 = {}
local v242 = {
	["ItemType"] = "Seed",
	["ItemData"] = {
		["ItemName"] = "Bee Balm",
		["Quantity"] = 1
	}
}
v241[1] = v242
v237.Outputs = v241
v237.TimeToCraft = 900
v237.PurchaseID = 3306485036
v237.RobuxPrice = 179
v237.LayoutOrder = 180
v237.MachineTypes = { "SeedEventWorkbench" }
v237.Cost = {
	["CurrencyType"] = "Honey",
	["Amount"] = 10
}
v237.DisplayInCrafting = false
v2["Bee Balm"] = v237
local v243 = {}
local v244 = {}
local v245 = {
	["ItemType"] = "Holdable",
	["ItemData"] = {
		["ItemName"] = "Cactus",
		["AcceptAllTypes"] = false
	}
}
v244[1] = v245
local v246 = {
	["ItemType"] = "Holdable",
	["ItemData"] = {
		["ItemName"] = "Cactus",
		["AcceptAllTypes"] = false
	}
}
v244[2] = v246
local v247 = {
	["ItemType"] = "Seed",
	["ItemData"] = {
		["ItemName"] = "Cactus",
		["AcceptAllTypes"] = false
	}
}
v244[3] = v247
local v248 = {
	["ItemType"] = "Seed",
	["ItemData"] = {
		["ItemName"] = "Nectarshade",
		["AcceptAllTypes"] = false
	}
}
v244[4] = v248
v243.Inputs = v244
local v249 = {}
local v250 = {
	["ItemType"] = "Seed",
	["ItemData"] = {
		["ItemName"] = "Nectar Thorn",
		["Quantity"] = 1
	}
}
v249[1] = v250
v243.Outputs = v249
v243.TimeToCraft = 1800
v243.PurchaseID = 3306485033
v243.RobuxPrice = 659
v243.LayoutOrder = 190
v243.MachineTypes = { "SeedEventWorkbench" }
v243.Cost = {
	["CurrencyType"] = "Honey",
	["Amount"] = 20
}
v243.DisplayInCrafting = false
v2["Nectar Thorn"] = v243
local v251 = {}
local v252 = {}
local v253 = {
	["ItemType"] = "Holdable",
	["ItemData"] = {
		["ItemName"] = "Crocus",
		["AcceptAllTypes"] = false
	}
}
v252[1] = v253
local v254 = {
	["ItemType"] = "Holdable",
	["ItemData"] = {
		["ItemName"] = "Daffodil",
		["AcceptAllTypes"] = false
	}
}
v252[2] = v254
local v255 = {
	["ItemType"] = "Holdable",
	["ItemData"] = {
		["ItemName"] = "Dandelion",
		["AcceptAllTypes"] = false
	}
}
v252[3] = v255
local v256 = {
	["ItemType"] = "Holdable",
	["ItemData"] = {
		["ItemName"] = "Pink Lily",
		["AcceptAllTypes"] = false
	}
}
v252[4] = v256
v251.Inputs = v252
local v257 = {}
local v258 = {
	["ItemType"] = "Seed",
	["ItemData"] = {
		["ItemName"] = "Suncoil",
		["Quantity"] = 1
	}
}
v257[1] = v258
v251.Outputs = v257
v251.TimeToCraft = 2700
v251.PurchaseID = 3306485035
v251.RobuxPrice = 749
v251.LayoutOrder = 200
v251.MachineTypes = { "SeedEventWorkbench" }
v251.Cost = {
	["CurrencyType"] = "Honey",
	["Amount"] = 40
}
v251.DisplayInCrafting = false
v2.Suncoil = v251
local v259 = {}
local v260 = {}
local v261 = {
	["ItemType"] = "Seed",
	["ItemData"] = {
		["ItemName"] = "Easter Egg Melon",
		["AcceptAllTypes"] = false
	}
}
v260[1] = v261
local v262 = {
	["ItemType"] = "Seed",
	["ItemData"] = {
		["ItemName"] = "Easter Egg Melon",
		["AcceptAllTypes"] = false
	}
}
v260[2] = v262
local v263 = {
	["ItemType"] = "Seed",
	["ItemData"] = {
		["ItemName"] = "Easter Egg Melon",
		["AcceptAllTypes"] = false
	}
}
v260[3] = v263
local v264 = {
	["ItemType"] = "Seed",
	["ItemData"] = {
		["ItemName"] = "Easter Egg Melon",
		["AcceptAllTypes"] = false
	}
}
v260[4] = v264
v259.Inputs = v260
local v265 = {}
local v266 = {
	["ItemType"] = "Seed",
	["ItemData"] = {
		["ItemName"] = "Egg Melon",
		["Quantity"] = 1
	}
}
v265[1] = v266
v259.Outputs = v265
v259.TimeToCraft = 2700
v259.PurchaseID = 3577373554
v259.RobuxPrice = 699
v259.LayoutOrder = 1
v259.MachineTypes = { "SeedEventWorkbench" }
v259.Cost = {
	["CurrencyType"] = "Sheckles",
	["Amount"] = 10000000
}
v259.DisplayInCrafting = true
v2["Egg Melon"] = v259
local v267 = {}
local v268 = {}
local v269 = {
	["ItemType"] = "Seed",
	["ItemData"] = {
		["ItemName"] = "Carrot",
		["AcceptAllTypes"] = false
	}
}
v268[1] = v269
local v270 = {
	["ItemType"] = "Holdable",
	["ItemData"] = {
		["ItemName"] = "Beanstalk",
		["AcceptAllTypes"] = false
	}
}
v268[2] = v270
local v271 = {
	["ItemType"] = "PetEgg",
	["ItemData"] = {
		["ItemName"] = "Common Egg",
		["AcceptAllTypes"] = false
	}
}
v268[3] = v271
v267.Inputs = v268
local v272 = {}
local v273 = {
	["ItemType"] = "Seed",
	["ItemData"] = {
		["ItemName"] = "Mandrake",
		["Quantity"] = 3
	}
}
v272[1] = v273
v267.Outputs = v272
v267.TimeToCraft = 300
v267.PurchaseID = 3371045808
v267.RobuxPrice = 199
v267.LayoutOrder = 5
v267.MachineTypes = { "SeedEventWorkbench" }
v2.Mandrake = v267
local v274 = {}
local v275 = {}
local v276 = {
	["ItemType"] = "Holdable",
	["ItemData"] = {
		["ItemName"] = "Evo Beetroot IV",
		["AcceptAllTypes"] = false
	}
}
v275[1] = v276
local v277 = {
	["ItemType"] = "Holdable",
	["ItemData"] = {
		["ItemName"] = "Evo Blueberry IV",
		["AcceptAllTypes"] = false
	}
}
v275[2] = v277
local v278 = {
	["ItemType"] = "Holdable",
	["ItemData"] = {
		["ItemName"] = "Evo Pumpkin IV",
		["AcceptAllTypes"] = false
	}
}
v275[3] = v278
local v279 = {
	["ItemType"] = "Holdable",
	["ItemData"] = {
		["ItemName"] = "Evo Mushroom IV",
		["AcceptAllTypes"] = false
	}
}
v275[4] = v279
local v280 = {
	["ItemType"] = "Seed",
	["ItemData"] = {
		["ItemName"] = "Sugar Apple",
		["AcceptAllTypes"] = false
	}
}
v275[5] = v280
v274.Inputs = v275
local v281 = {}
local v282 = {
	["ItemType"] = "Seed",
	["ItemData"] = {
		["ItemName"] = "Evo Apple I",
		["Quantity"] = 1
	}
}
v281[1] = v282
v274.Outputs = v281
v274.TimeToCraft = 600
v274.PurchaseID = 3420523696
v274.RobuxPrice = 195
v274.LayoutOrder = 10
v274.MachineTypes = { "SeedEventWorkbench" }
v274.DisplayInCrafting = true
v2["Evo Apple I"] = v274
local v283 = {}
local v284 = {}
local v285 = {
	["ItemType"] = "Seed",
	["ItemData"] = {
		["ItemName"] = "Evo Apple I",
		["AcceptAllTypes"] = false
	}
}
v284[1] = v285
local v286 = {
	["ItemType"] = "Holdable",
	["ItemData"] = {
		["ItemName"] = "Evo Apple I",
		["AcceptAllTypes"] = false
	}
}
v284[2] = v286
local v287 = {
	["ItemType"] = "Holdable",
	["ItemData"] = {
		["ItemName"] = "Evo Apple I",
		["AcceptAllTypes"] = false
	}
}
v284[3] = v287
local v288 = {
	["ItemType"] = "Seed",
	["ItemData"] = {
		["ItemName"] = "Burning Bud",
		["AcceptAllTypes"] = false
	}
}
v284[4] = v288
v283.Inputs = v284
local v289 = {}
local v290 = {
	["ItemType"] = "Seed",
	["ItemData"] = {
		["ItemName"] = "Evo Apple II",
		["Quantity"] = 1
	}
}
v289[1] = v290
v283.Outputs = v289
v283.TimeToCraft = 1200
v283.PurchaseID = 3420524026
v283.RobuxPrice = 349
v283.LayoutOrder = 15
v283.MachineTypes = { "SeedEventWorkbench" }
v283.Cost = {
	["CurrencyType"] = "Sheckles",
	["Amount"] = 30000000
}
v283.DisplayInCrafting = true
v2["Evo Apple II"] = v283
local v291 = {}
local v292 = {}
local v293 = {
	["ItemType"] = "Seed",
	["ItemData"] = {
		["ItemName"] = "Evo Apple II",
		["AcceptAllTypes"] = false
	}
}
v292[1] = v293
local v294 = {
	["ItemType"] = "Holdable",
	["ItemData"] = {
		["ItemName"] = "Evo Apple II",
		["AcceptAllTypes"] = false
	}
}
v292[2] = v294
local v295 = {
	["ItemType"] = "Holdable",
	["ItemData"] = {
		["ItemName"] = "Evo Apple II",
		["AcceptAllTypes"] = false
	}
}
v292[3] = v295
local v296 = {
	["ItemType"] = "Seed",
	["ItemData"] = {
		["ItemName"] = "Giant Pinecone",
		["AcceptAllTypes"] = false
	}
}
v292[4] = v296
v291.Inputs = v292
local v297 = {}
local v298 = {
	["ItemType"] = "Seed",
	["ItemData"] = {
		["ItemName"] = "Evo Apple III",
		["Quantity"] = 1
	}
}
v297[1] = v298
v291.Outputs = v297
v291.TimeToCraft = 1800
v291.PurchaseID = 3420524301
v291.RobuxPrice = 679
v291.LayoutOrder = 20
v291.MachineTypes = { "SeedEventWorkbench" }
v291.Cost = {
	["CurrencyType"] = "Sheckles",
	["Amount"] = 70000000
}
v291.DisplayInCrafting = true
v2["Evo Apple III"] = v291
local v299 = {}
local v300 = {}
local v301 = {
	["ItemType"] = "Seed",
	["ItemData"] = {
		["ItemName"] = "Evo Apple III",
		["AcceptAllTypes"] = false
	}
}
v300[1] = v301
local v302 = {
	["ItemType"] = "Holdable",
	["ItemData"] = {
		["ItemName"] = "Evo Apple III",
		["AcceptAllTypes"] = false
	}
}
v300[2] = v302
local v303 = {
	["ItemType"] = "Holdable",
	["ItemData"] = {
		["ItemName"] = "Evo Apple III",
		["AcceptAllTypes"] = false
	}
}
v300[3] = v303
local v304 = {
	["ItemType"] = "Seed",
	["ItemData"] = {
		["ItemName"] = "Elder Strawberry",
		["AcceptAllTypes"] = false
	}
}
v300[4] = v304
v299.Inputs = v300
local v305 = {}
local v306 = {
	["ItemType"] = "Seed",
	["ItemData"] = {
		["ItemName"] = "Evo Apple IV",
		["Quantity"] = 1
	}
}
v305[1] = v306
v299.Outputs = v305
v299.TimeToCraft = 2400
v299.PurchaseID = 3420524565
v299.RobuxPrice = 849
v299.LayoutOrder = 30
v299.MachineTypes = { "SeedEventWorkbench" }
v299.Cost = {
	["CurrencyType"] = "Sheckles",
	["Amount"] = 100000000
}
v299.DisplayInCrafting = true
v2["Evo Apple IV"] = v299
local v307 = {}
local v308 = {}
local v309 = {
	["ItemType"] = "Sprinkler",
	["ItemData"] = {
		["ItemName"] = "Basic Sprinkler",
		["AcceptAllTypes"] = false
	}
}
v308[1] = v309
local v310 = {
	["ItemType"] = "Sprinkler",
	["ItemData"] = {
		["ItemName"] = "Basic Sprinkler",
		["AcceptAllTypes"] = false
	}
}
v308[2] = v310
local v311 = {
	["ItemType"] = "Holdable",
	["ItemData"] = {
		["ItemName"] = "Grape",
		["AcceptAllTypes"] = false
	}
}
v308[3] = v311
local v312 = {
	["ItemType"] = "Seed",
	["ItemData"] = {
		["ItemName"] = "Tomato",
		["AcceptAllTypes"] = false
	}
}
v308[4] = v312
v307.Inputs = v308
local v313 = {}
local v314 = {
	["ItemType"] = "Seed",
	["ItemData"] = {
		["ItemName"] = "Olive",
		["Quantity"] = 1
	}
}
v313[1] = v314
v307.Outputs = v313
v307.TimeToCraft = 900
v307.PurchaseID = 0
v307.RobuxPrice = 129
v307.LayoutOrder = 40
v307.MachineTypes = { "SeedEventWorkbench" }
v307.Cost = {
	["CurrencyType"] = "Sheckles",
	["Amount"] = 750000
}
v2["Olive@SeedEventWorkbench"] = v307
local v315 = {}
local v316 = {}
local v317 = {
	["ItemType"] = "Sprinkler",
	["ItemData"] = {
		["ItemName"] = "Advanced Sprinkler",
		["AcceptAllTypes"] = false
	}
}
v316[1] = v317
local v318 = {
	["ItemType"] = "Sprinkler",
	["ItemData"] = {
		["ItemName"] = "Godly Sprinkler",
		["AcceptAllTypes"] = false
	}
}
v316[2] = v318
local v319 = {
	["ItemType"] = "Holdable",
	["ItemData"] = {
		["ItemName"] = "Bamboo",
		["AcceptAllTypes"] = false
	}
}
v316[3] = v319
local v320 = {
	["ItemType"] = "Seed",
	["ItemData"] = {
		["ItemName"] = "Cactus",
		["AcceptAllTypes"] = false
	}
}
v316[4] = v320
v315.Inputs = v316
local v321 = {}
local v322 = {
	["ItemType"] = "Seed",
	["ItemData"] = {
		["ItemName"] = "Hollow Bamboo",
		["Quantity"] = 1
	}
}
v321[1] = v322
v315.Outputs = v321
v315.TimeToCraft = 2700
v315.PurchaseID = 0
v315.RobuxPrice = 507
v315.LayoutOrder = 50
v315.MachineTypes = { "SeedEventWorkbench" }
v315.Cost = {
	["CurrencyType"] = "Sheckles",
	["Amount"] = 5000000
}
v2["Hollow Bamboo@SeedEventWorkbench"] = v315
local v323 = {}
local v324 = {}
local v325 = {
	["ItemType"] = "Sprinkler",
	["ItemData"] = {
		["ItemName"] = "Master Sprinkler",
		["AcceptAllTypes"] = false
	}
}
v324[1] = v325
local v326 = {
	["ItemType"] = "Sprinkler",
	["ItemData"] = {
		["ItemName"] = "Master Sprinkler",
		["AcceptAllTypes"] = false
	}
}
v324[2] = v326
local v327 = {
	["ItemType"] = "Holdable",
	["ItemData"] = {
		["ItemName"] = "Burning Bud",
		["AcceptAllTypes"] = false
	}
}
v324[3] = v327
local v328 = {
	["ItemType"] = "Seed",
	["ItemData"] = {
		["ItemName"] = "Daffodil",
		["AcceptAllTypes"] = false
	}
}
v324[4] = v328
v323.Inputs = v324
local v329 = {}
local v330 = {
	["ItemType"] = "Seed",
	["ItemData"] = {
		["ItemName"] = "Yarrow",
		["Quantity"] = 1
	}
}
v329[1] = v330
v323.Outputs = v329
v323.TimeToCraft = 3600
v323.PurchaseID = 0
v323.RobuxPrice = 729
v323.LayoutOrder = 60
v323.MachineTypes = { "SeedEventWorkbench" }
v323.Cost = {
	["CurrencyType"] = "Sheckles",
	["Amount"] = 18000000
}
v2["Yarrow@SeedEventWorkbench"] = v323
local v331 = {}
local v332 = {}
local v333 = {
	["ItemType"] = "Seed",
	["ItemData"] = {
		["ItemName"] = "Cactus",
		["AcceptAllTypes"] = false
	}
}
v332[1] = v333
local v334 = {
	["ItemType"] = "Seed",
	["ItemData"] = {
		["ItemName"] = "Bamboo",
		["AcceptAllTypes"] = false
	}
}
v332[2] = v334
local v335 = {
	["ItemType"] = "Holdable",
	["ItemData"] = {
		["ItemName"] = "Cactus",
		["AcceptAllTypes"] = false
	}
}
v332[3] = v335
local v336 = {
	["ItemType"] = "Holdable",
	["ItemData"] = {
		["ItemName"] = "Mango",
		["AcceptAllTypes"] = false
	}
}
v332[4] = v336
v331.Inputs = v332
local v337 = {}
local v338 = {
	["ItemType"] = "Seed",
	["ItemData"] = {
		["ItemName"] = "Twisted Tangle",
		["Quantity"] = 1
	}
}
v337[1] = v338
v331.Outputs = v337
v331.TimeToCraft = 900
v331.PurchaseID = 3354091176
v331.RobuxPrice = 239
v331.LayoutOrder = 10
v331.MachineTypes = { "SeedEventWorkbench" }
v331.Cost = {
	["CurrencyType"] = "Sheckles",
	["Amount"] = 50000
}
v331.DisplayInCrafting = false
v2["Twisted Tangle"] = v331
local v339 = {}
local v340 = {}
local v341 = {
	["ItemType"] = "Seed",
	["ItemData"] = {
		["ItemName"] = "Orange Tulip",
		["AcceptAllTypes"] = false
	}
}
v340[1] = v341
local v342 = {
	["ItemType"] = "Seed",
	["ItemData"] = {
		["ItemName"] = "Daffodil",
		["AcceptAllTypes"] = false
	}
}
v340[2] = v342
local v343 = {
	["ItemType"] = "Holdable",
	["ItemData"] = {
		["ItemName"] = "Beanstalk",
		["AcceptAllTypes"] = false
	}
}
v340[3] = v343
local v344 = {
	["ItemType"] = "Holdable",
	["ItemData"] = {
		["ItemName"] = "Burning Bud",
		["AcceptAllTypes"] = false
	}
}
v340[4] = v344
v339.Inputs = v340
local v345 = {}
local v346 = {
	["ItemType"] = "Seed",
	["ItemData"] = {
		["ItemName"] = "Veinpetal",
		["Quantity"] = 1
	}
}
v345[1] = v346
v339.Outputs = v345
v339.TimeToCraft = 1200
v339.PurchaseID = 3354091526
v339.RobuxPrice = 459
v339.LayoutOrder = 15
v339.MachineTypes = { "SeedEventWorkbench" }
v339.Cost = {
	["CurrencyType"] = "Sheckles",
	["Amount"] = 650000
}
v339.DisplayInCrafting = false
v2.Veinpetal = v339
local v347 = {}
local v348 = {}
local v349 = {
	["ItemType"] = "Seed",
	["ItemData"] = {
		["ItemName"] = "Daffodil",
		["AcceptAllTypes"] = false
	}
}
v348[1] = v349
local v350 = {
	["ItemType"] = "Holdable",
	["ItemData"] = {
		["ItemName"] = "Bamboo",
		["AcceptAllTypes"] = false
	}
}
v348[2] = v350
local v351 = {
	["ItemType"] = "Holdable",
	["ItemData"] = {
		["ItemName"] = "Corn",
		["AcceptAllTypes"] = false
	}
}
v348[3] = v351
v347.Inputs = v348
local v352 = {}
local v353 = {
	["ItemType"] = "Seed",
	["ItemData"] = {
		["ItemName"] = "Horsetail",
		["Quantity"] = 1
	}
}
v352[1] = v353
v347.Outputs = v352
v347.TimeToCraft = 900
v347.PurchaseID = 3329520820
v347.RobuxPrice = 199
v347.LayoutOrder = 20
v347.MachineTypes = { "SeedEventWorkbench" }
v347.Cost = {
	["CurrencyType"] = "Sheckles",
	["Amount"] = 15000
}
v347.DisplayInCrafting = false
v2.Horsetail = v347
local v354 = {}
local v355 = {}
local v356 = {
	["ItemType"] = "Seed",
	["ItemData"] = {
		["ItemName"] = "Blueberry",
		["AcceptAllTypes"] = false
	}
}
v355[1] = v356
local v357 = {
	["ItemType"] = "Seed",
	["ItemData"] = {
		["ItemName"] = "Blueberry",
		["AcceptAllTypes"] = false
	}
}
v355[2] = v357
local v358 = {
	["ItemType"] = "Seed",
	["ItemData"] = {
		["ItemName"] = "Blueberry",
		["AcceptAllTypes"] = false
	}
}
v355[3] = v358
local v359 = {
	["ItemType"] = "Holdable",
	["ItemData"] = {
		["ItemName"] = "Horsetail",
		["AcceptAllTypes"] = false
	}
}
v355[4] = v359
v354.Inputs = v355
local v360 = {}
local v361 = {
	["ItemType"] = "Seed",
	["ItemData"] = {
		["ItemName"] = "Lingonberry",
		["Quantity"] = 1
	}
}
v360[1] = v361
v354.Outputs = v360
v354.TimeToCraft = 900
v354.PurchaseID = 3329520955
v354.RobuxPrice = 209
v354.LayoutOrder = 25
v354.MachineTypes = { "SeedEventWorkbench" }
v354.Cost = {
	["CurrencyType"] = "Sheckles",
	["Amount"] = 450000
}
v354.DisplayInCrafting = false
v2.Lingonberry = v354
local v362 = {}
local v363 = {}
local v364 = {
	["ItemType"] = "Seed",
	["ItemData"] = {
		["ItemName"] = "Cactus",
		["AcceptAllTypes"] = false
	}
}
v363[1] = v364
local v365 = {
	["ItemType"] = "Holdable",
	["ItemData"] = {
		["ItemName"] = "Pumpkin",
		["AcceptAllTypes"] = false
	}
}
v363[2] = v365
local v366 = {
	["ItemType"] = "Holdable",
	["ItemData"] = {
		["ItemName"] = "Horsetail",
		["AcceptAllTypes"] = false
	}
}
v363[3] = v366
v362.Inputs = v363
local v367 = {}
local v368 = {
	["ItemType"] = "Seed",
	["ItemData"] = {
		["ItemName"] = "Amber Spine",
		["Quantity"] = 1
	}
}
v367[1] = v368
v362.Outputs = v367
v362.TimeToCraft = 1800
v362.PurchaseID = 3329520620
v362.RobuxPrice = 625
v362.LayoutOrder = 30
v362.MachineTypes = { "SeedEventWorkbench" }
v362.Cost = {
	["CurrencyType"] = "Sheckles",
	["Amount"] = 650000
}
v362.DisplayInCrafting = false
v2["Amber Spine"] = v362
local v369 = {}
local v370 = {}
local v371 = {
	["ItemType"] = "Holdable",
	["ItemData"] = {
		["ItemName"] = "Ember Lily",
		["AcceptAllTypes"] = false
	}
}
v370[1] = v371
local v372 = {
	["ItemType"] = "Holdable",
	["ItemData"] = {
		["ItemName"] = "Ember Lily",
		["AcceptAllTypes"] = false
	}
}
v370[2] = v372
local v373 = {
	["ItemType"] = "PetEgg",
	["ItemData"] = {
		["ItemName"] = "Dinosaur Egg",
		["AcceptAllTypes"] = false
	}
}
v370[3] = v373
local v374 = {
	["ItemType"] = "Seed Pack",
	["ItemData"] = {
		["ItemName"] = "Ancient Seed Pack",
		["AcceptAllTypes"] = false
	}
}
v370[4] = v374
v369.Inputs = v370
local v375 = {}
local v376 = {
	["ItemType"] = "Seed",
	["ItemData"] = {
		["ItemName"] = "Grand Volcania",
		["Quantity"] = 1
	}
}
v375[1] = v376
v369.Outputs = v375
v369.TimeToCraft = 2700
v369.PurchaseID = 3329521774
v369.RobuxPrice = 819
v369.LayoutOrder = 30
v369.MachineTypes = { "SeedEventWorkbench" }
v369.Cost = {
	["CurrencyType"] = "Sheckles",
	["Amount"] = 900000
}
v369.DisplayInCrafting = false
v2["Grand Volcania"] = v369
local v377 = {}
local v378 = {}
local v379 = {
	["ItemType"] = "Holdable",
	["ItemData"] = {
		["ItemName"] = "Beanstalk",
		["AcceptAllTypes"] = false
	}
}
v378[1] = v379
local v380 = {
	["ItemType"] = "Holdable",
	["ItemData"] = {
		["ItemName"] = "Beanstalk",
		["AcceptAllTypes"] = false
	}
}
v378[2] = v380
local v381 = {
	["ItemType"] = "Seed Pack",
	["ItemData"] = {
		["ItemName"] = "Sprout Seed Pack",
		["AcceptAllTypes"] = false
	}
}
v378[3] = v381
local v382 = {
	["ItemType"] = "PetEgg",
	["ItemData"] = {
		["ItemName"] = "Sprout Egg",
		["AcceptAllTypes"] = false
	}
}
v378[4] = v382
v377.Inputs = v378
local v383 = {}
local v384 = {
	["ItemType"] = "Seed Pack",
	["ItemData"] = {
		["ItemName"] = "Skyroot Chest",
		["Quantity"] = 1
	}
}
v383[1] = v384
v377.Outputs = v383
v377.TimeToCraft = 1800
v377.PurchaseID = 3379243998
v377.RobuxPrice = 199
v377.LayoutOrder = 100
v377.MachineTypes = { "GiantBeanstalkEventWorkbench" }
v377.Cost = {
	["CurrencyType"] = "Sheckles",
	["Amount"] = 7500000
}
v2["Skyroot Chest"] = v377
local v385 = {}
local v386 = {}
local v387 = {
	["ItemType"] = "Holdable",
	["ItemData"] = {
		["ItemName"] = "Beanstalk",
		["AcceptAllTypes"] = false
	}
}
v386[1] = v387
local v388 = {
	["ItemType"] = "Holdable",
	["ItemData"] = {
		["ItemName"] = "Beanstalk",
		["AcceptAllTypes"] = false
	}
}
v386[2] = v388
local v389 = {
	["ItemType"] = "Seed Pack",
	["ItemData"] = {
		["ItemName"] = "Sprout Seed Pack",
		["AcceptAllTypes"] = false
	}
}
v386[3] = v389
local v390 = {
	["ItemType"] = "PetEgg",
	["ItemData"] = {
		["ItemName"] = "Uncommon Egg",
		["AcceptAllTypes"] = false
	}
}
v386[4] = v390
v385.Inputs = v386
local v391 = {}
local v392 = {
	["ItemType"] = "PetEgg",
	["ItemData"] = {
		["ItemName"] = "Sprout Egg",
		["Quantity"] = 1
	}
}
v391[1] = v392
v385.Outputs = v391
v385.TimeToCraft = 1800
v385.PurchaseID = 3371044215
v385.RobuxPrice = 149
v385.LayoutOrder = 120
v385.MachineTypes = { "GiantBeanstalkEventWorkbench" }
v385.Cost = {
	["CurrencyType"] = "Sheckles",
	["Amount"] = 2500000
}
v2["Sprout Egg"] = v385
local v393 = {}
local v394 = {}
local v395 = {
	["ItemType"] = "Holdable",
	["ItemData"] = {
		["ItemName"] = "Flare Melon",
		["AcceptAllTypes"] = false
	}
}
v394[1] = v395
local v396 = {
	["ItemType"] = "Holdable",
	["ItemData"] = {
		["ItemName"] = "Glowpod",
		["AcceptAllTypes"] = false
	}
}
v394[2] = v396
local v397 = {
	["ItemType"] = "Holdable",
	["ItemData"] = {
		["ItemName"] = "Beanstalk",
		["AcceptAllTypes"] = false
	}
}
v394[3] = v397
local v398 = {
	["ItemType"] = "Holdable",
	["ItemData"] = {
		["ItemName"] = "Beanstalk",
		["AcceptAllTypes"] = false
	}
}
v394[4] = v398
v393.Inputs = v394
local v399 = {}
local v400 = {
	["ItemType"] = "Seed",
	["ItemData"] = {
		["ItemName"] = "Willowberry",
		["Quantity"] = 1
	}
}
v399[1] = v400
v393.Outputs = v399
v393.TimeToCraft = 1800
v393.PurchaseID = 3379244616
v393.RobuxPrice = 589
v393.LayoutOrder = 160
v393.MachineTypes = { "GiantBeanstalkEventWorkbench" }
v393.Cost = {
	["CurrencyType"] = "Sheckles",
	["Amount"] = 5500000
}
v2.Willowberry = v393
local v401 = {}
local v402 = {}
local v403 = {
	["ItemType"] = "Holdable",
	["ItemData"] = {
		["ItemName"] = "Beanstalk",
		["AcceptAllTypes"] = false
	}
}
v402[1] = v403
local v404 = {
	["ItemType"] = "Holdable",
	["ItemData"] = {
		["ItemName"] = "Beanstalk",
		["AcceptAllTypes"] = false
	}
}
v402[2] = v404
local v405 = {
	["ItemType"] = "Seed Pack",
	["ItemData"] = {
		["ItemName"] = "Sprout Seed Pack",
		["AcceptAllTypes"] = false
	}
}
v402[3] = v405
local v406 = {
	["ItemType"] = "CosmeticCrate",
	["ItemData"] = {
		["ItemName"] = "Sprout Crate",
		["AcceptAllTypes"] = false
	}
}
v402[4] = v406
v401.Inputs = v402
local v407 = {}
local v408 = {
	["ItemType"] = "Cosmetic",
	["ItemData"] = {
		["ItemName"] = "Green Bean Memories",
		["Quantity"] = 1
	}
}
v407[1] = v408
v401.Outputs = v407
v401.TimeToCraft = 900
v401.PurchaseID = 3379259309
v401.RobuxPrice = 239
v401.LayoutOrder = 170
v401.MachineTypes = { "GiantBeanstalkEventWorkbench" }
v401.Cost = {
	["CurrencyType"] = "Sheckles",
	["Amount"] = 4500000
}
v2["Green Bean Memories"] = v401
local v409 = {}
local v410 = {}
local v411 = {
	["ItemType"] = "Holdable",
	["ItemData"] = {
		["ItemName"] = "Beanstalk",
		["AcceptAllTypes"] = false
	}
}
v410[1] = v411
local v412 = {
	["ItemType"] = "Holdable",
	["ItemData"] = {
		["ItemName"] = "Beanstalk",
		["AcceptAllTypes"] = false
	}
}
v410[2] = v412
local v413 = {
	["ItemType"] = "Holdable",
	["ItemData"] = {
		["ItemName"] = "Coconut",
		["AcceptAllTypes"] = false
	}
}
v410[3] = v413
local v414 = {
	["ItemType"] = "CosmeticCrate",
	["ItemData"] = {
		["ItemName"] = "Sprout Crate",
		["AcceptAllTypes"] = false
	}
}
v410[4] = v414
v409.Inputs = v410
local v415 = {}
local v416 = {
	["ItemType"] = "Cosmetic",
	["ItemData"] = {
		["ItemName"] = "Bean Pool Table",
		["Quantity"] = 1
	}
}
v415[1] = v416
v409.Outputs = v415
v409.TimeToCraft = 900
v409.PurchaseID = 3379259523
v409.RobuxPrice = 209
v409.LayoutOrder = 180
v409.MachineTypes = { "GiantBeanstalkEventWorkbench" }
v409.Cost = {
	["CurrencyType"] = "Sheckles",
	["Amount"] = 4500000
}
v2["Bean Pool Table"] = v409
local v417 = {}
local v418 = {}
local v419 = {
	["ItemType"] = "Holdable",
	["ItemData"] = {
		["ItemName"] = "Beanstalk",
		["AcceptAllTypes"] = false
	}
}
v418[1] = v419
local v420 = {
	["ItemType"] = "Holdable",
	["ItemData"] = {
		["ItemName"] = "Beanstalk",
		["AcceptAllTypes"] = false
	}
}
v418[2] = v420
local v421 = {
	["ItemType"] = "Holdable",
	["ItemData"] = {
		["ItemName"] = "Flare Melon",
		["AcceptAllTypes"] = false
	}
}
v418[3] = v421
local v422 = {
	["ItemType"] = "CosmeticCrate",
	["ItemData"] = {
		["ItemName"] = "Sprout Crate",
		["AcceptAllTypes"] = false
	}
}
v418[4] = v422
v417.Inputs = v418
local v423 = {}
local v424 = {
	["ItemType"] = "Cosmetic",
	["ItemData"] = {
		["ItemName"] = "Bean Sprout Float Light",
		["Quantity"] = 1
	}
}
v423[1] = v424
v417.Outputs = v423
v417.TimeToCraft = 900
v417.PurchaseID = 3379259737
v417.RobuxPrice = 149
v417.LayoutOrder = 190
v417.MachineTypes = { "GiantBeanstalkEventWorkbench" }
v417.Cost = {
	["CurrencyType"] = "Sheckles",
	["Amount"] = 4500000
}
v2["Bean Sprout Float Light"] = v417
local v425 = {}
local v426 = {}
local v427 = {
	["ItemType"] = "Holdable",
	["ItemData"] = {
		["ItemName"] = "Beanstalk",
		["AcceptAllTypes"] = false
	}
}
v426[1] = v427
local v428 = {
	["ItemType"] = "Holdable",
	["ItemData"] = {
		["ItemName"] = "Beanstalk",
		["AcceptAllTypes"] = false
	}
}
v426[2] = v428
local v429 = {
	["ItemType"] = "Holdable",
	["ItemData"] = {
		["ItemName"] = "Beanstalk",
		["AcceptAllTypes"] = false
	}
}
v426[3] = v429
local v430 = {
	["ItemType"] = "PetShard",
	["ItemData"] = {
		["ItemName"] = "Cleansing Pet Shard",
		["AcceptAllTypes"] = false
	}
}
v426[4] = v430
v425.Inputs = v426
local v431 = {}
local v432 = {
	["ItemType"] = "PetShard",
	["ItemData"] = {
		["ItemName"] = "Pet Shard GiantBean",
		["Quantity"] = 1
	}
}
v431[1] = v432
v425.Outputs = v431
v425.TimeToCraft = 3600
v425.PurchaseID = 3379333073
v425.RobuxPrice = 279
v425.LayoutOrder = 200
v425.MachineTypes = { "GiantBeanstalkEventWorkbench" }
v425.Cost = {
	["CurrencyType"] = "Sheckles",
	["Amount"] = 15000000
}
v2["Pet Shard GiantBean"] = v425
local v433 = {}
local v434 = {}
local v435 = {
	["ItemType"] = "SprayBottle",
	["ItemData"] = {
		["ItemName"] = "Cleaning Spray",
		["AcceptAllTypes"] = false
	}
}
v434[1] = v435
local v436 = {
	["ItemType"] = "PetEgg",
	["ItemData"] = {
		["ItemName"] = "Dinosaur Egg",
		["AcceptAllTypes"] = false
	}
}
v434[2] = v436
v433.Inputs = v434
local v437 = {}
local v438 = {
	["ItemType"] = "Gear",
	["ItemData"] = {
		["ItemName"] = "Mutation Spray Amber",
		["Quantity"] = 1
	}
}
v437[1] = v438
v433.Outputs = v437
v433.TimeToCraft = 3600
v433.PurchaseID = 3322971805
v433.RobuxPrice = 189
v433.LayoutOrder = 90
v433.MachineTypes = { "DinoEventWorkbench" }
v433.Cost = {
	["CurrencyType"] = "Sheckles",
	["Amount"] = 1000000
}
v2["Mutation Spray Amber"] = v433
local v439 = {}
local v440 = {}
local v441 = {
	["ItemType"] = "PetEgg",
	["ItemData"] = {
		["ItemName"] = "Dinosaur Egg",
		["AcceptAllTypes"] = false
	}
}
v440[1] = v441
v439.Inputs = v440
local v442 = {}
local v443 = {
	["ItemType"] = "Seed Pack",
	["ItemData"] = {
		["ItemName"] = "Ancient Seed Pack",
		["Quantity"] = 2
	}
}
v442[1] = v443
v439.Outputs = v442
v439.TimeToCraft = 3600
v439.PurchaseID = 3324600388
v439.RobuxPrice = 199
v439.LayoutOrder = 100
v439.MachineTypes = { "DinoEventWorkbench" }
v439.Cost = {
	["CurrencyType"] = "Sheckles",
	["Amount"] = 5500000
}
v2["Ancient Seed Pack"] = v439
local v444 = {}
local v445 = {}
local v446 = {
	["ItemType"] = "PetEgg",
	["ItemData"] = {
		["ItemName"] = "Dinosaur Egg",
		["AcceptAllTypes"] = false
	}
}
v445[1] = v446
v444.Inputs = v445
local v447 = {}
local v448 = {
	["ItemType"] = "CosmeticCrate",
	["ItemData"] = {
		["ItemName"] = "Dino Crate",
		["Quantity"] = 2
	}
}
v447[1] = v448
v444.Outputs = v447
v444.TimeToCraft = 1800
v444.PurchaseID = 3324601485
v444.RobuxPrice = 179
v444.LayoutOrder = 110
v444.MachineTypes = { "DinoEventWorkbench" }
v444.Cost = {
	["CurrencyType"] = "Sheckles",
	["Amount"] = 5500000
}
v2["Dino Crate"] = v444
local v449 = {}
local v450 = {}
local v451 = {
	["ItemType"] = "PetEgg",
	["ItemData"] = {
		["ItemName"] = "Dinosaur Egg",
		["AcceptAllTypes"] = false
	}
}
v450[1] = v451
v449.Inputs = v450
local v452 = {}
local v453 = {
	["ItemType"] = "CosmeticCrate",
	["ItemData"] = {
		["ItemName"] = "Archaeologist Crate",
		["Quantity"] = 2
	}
}
v452[1] = v453
v449.Outputs = v452
v449.TimeToCraft = 1800
v449.PurchaseID = 3329654888
v449.RobuxPrice = 179
v449.LayoutOrder = 115
v449.MachineTypes = { "DinoEventWorkbench" }
v449.Cost = {
	["CurrencyType"] = "Sheckles",
	["Amount"] = 5500000
}
v2["Archaeologist Crate"] = v449
local v454 = {}
local v455 = {}
local v456 = {
	["ItemType"] = "PetEgg",
	["ItemData"] = {
		["ItemName"] = "Common Egg",
		["AcceptAllTypes"] = false
	}
}
v455[1] = v456
local v457 = {
	["ItemType"] = "Holdable",
	["ItemData"] = {
		["ItemName"] = "Bone Blossom",
		["AcceptAllTypes"] = false
	}
}
v455[2] = v457
v454.Inputs = v455
local v458 = {}
local v459 = {
	["ItemType"] = "PetEgg",
	["ItemData"] = {
		["ItemName"] = "Dinosaur Egg",
		["Quantity"] = 1
	}
}
v458[1] = v459
v454.Outputs = v458
v454.TimeToCraft = 1800
v454.PurchaseID = 3329519291
v454.RobuxPrice = 149
v454.LayoutOrder = 120
v454.IsUnlockable = true
v454.MachineTypes = { "DinoEventWorkbench" }
v454.Cost = {
	["CurrencyType"] = "Sheckles",
	["Amount"] = 5500000
}
v2["Dinosaur Egg"] = v454
local v460 = {}
local v461 = {}
local v462 = {
	["ItemType"] = "PetEgg",
	["ItemData"] = {
		["ItemName"] = "Dinosaur Egg",
		["AcceptAllTypes"] = false
	}
}
v461[1] = v462
local v463 = {
	["ItemType"] = "Holdable",
	["ItemData"] = {
		["ItemName"] = "Bone Blossom",
		["AcceptAllTypes"] = false
	}
}
v461[2] = v463
v460.Inputs = v461
local v464 = {}
local v465 = {
	["ItemType"] = "PetEgg",
	["ItemData"] = {
		["ItemName"] = "Primal Egg",
		["Quantity"] = 1
	}
}
v464[1] = v465
v460.Outputs = v464
v460.TimeToCraft = 1800
v460.PurchaseID = 3329518200
v460.RobuxPrice = 149
v460.LayoutOrder = 130
v460.IsUnlockable = true
v460.MachineTypes = { "DinoEventWorkbench" }
v460.Cost = {
	["CurrencyType"] = "Sheckles",
	["Amount"] = 5500000
}
v2["Primal Egg"] = v460
local v466 = {}
local v467 = {}
local v468 = {
	["ItemType"] = "Holdable",
	["ItemData"] = {
		["ItemName"] = "Sunbulb",
		["AcceptAllTypes"] = false
	}
}
v467[1] = v468
local v469 = {
	["ItemType"] = "Seed",
	["ItemData"] = {
		["ItemName"] = "Strawberry",
		["AcceptAllTypes"] = false
	}
}
v467[2] = v469
local v470 = {
	["ItemType"] = "Harvest Tool",
	["ItemData"] = {
		["ItemName"] = "Harvest Tool",
		["AcceptAllTypes"] = false
	}
}
v467[3] = v470
v466.Inputs = v467
local v471 = {}
local v472 = {
	["ItemType"] = "Gear",
	["ItemData"] = {
		["ItemName"] = "Fairy Net",
		["Quantity"] = 20
	}
}
v471[1] = v472
v466.Outputs = v471
v466.TimeToCraft = 30
v466.PurchaseID = 3395556018
v466.RobuxPrice = 109
v466.LayoutOrder = 10
v466.MachineTypes = { "FairyGeniusEventWorkbench" }
v466.Cost = {
	["CurrencyType"] = "FairyPoints",
	["Amount"] = 100
}
v2["Fairy Net"] = v466
local v473 = {}
local v474 = {}
local v475 = {
	["ItemType"] = "Fairy Jar",
	["ItemData"] = {
		["ItemName"] = "Fairy Jar",
		["AcceptAllTypes"] = false
	}
}
v474[1] = v475
local v476 = {
	["ItemType"] = "Harvest Tool",
	["ItemData"] = {
		["ItemName"] = "Harvest Tool",
		["AcceptAllTypes"] = false
	}
}
v474[2] = v476
v473.Inputs = v474
local v477 = {}
local v478 = {
	["ItemType"] = "Gear",
	["ItemData"] = {
		["ItemName"] = "Glimmering Radar",
		["Quantity"] = 5
	}
}
v477[1] = v478
v473.Outputs = v477
v473.TimeToCraft = 300
v473.PurchaseID = 3395556015
v473.RobuxPrice = 199
v473.LayoutOrder = 20
v473.MachineTypes = { "FairyGeniusEventWorkbench" }
v473.Cost = {
	["CurrencyType"] = "Sheckles",
	["Amount"] = 1000000
}
v2["Glimmering Radar"] = v473
local v479 = {}
local v480 = {}
local v481 = {
	["ItemType"] = "Fairy Jar",
	["ItemData"] = {
		["ItemName"] = "Fairy Jar",
		["AcceptAllTypes"] = false
	}
}
v480[1] = v481
local v482 = {
	["ItemType"] = "Holdable",
	["ItemData"] = {
		["ItemName"] = "Bamboo",
		["AcceptAllTypes"] = false
	}
}
v480[2] = v482
local v483 = {
	["ItemType"] = "Holdable",
	["ItemData"] = {
		["ItemName"] = "Bamboo",
		["AcceptAllTypes"] = false
	}
}
v480[3] = v483
v479.Inputs = v480
local v484 = {}
local v485 = {
	["ItemType"] = "Gear",
	["ItemData"] = {
		["ItemName"] = "Fairy Targeter",
		["Quantity"] = 1
	}
}
v484[1] = v485
v479.Outputs = v484
v479.TimeToCraft = 450
v479.PurchaseID = 3395556011
v479.RobuxPrice = 149
v479.LayoutOrder = 30
v479.MachineTypes = { "FairyGeniusEventWorkbench" }
v479.Cost = {
	["CurrencyType"] = "Sheckles",
	["Amount"] = 1000000
}
v2["Fairy Targeter"] = v479
local v486 = {}
local v487 = {}
local v488 = {
	["ItemType"] = "Fairy Jar",
	["ItemData"] = {
		["ItemName"] = "Fairy Jar",
		["AcceptAllTypes"] = false
	}
}
v487[1] = v488
local v489 = {
	["ItemType"] = "Sprinkler",
	["ItemData"] = {
		["ItemName"] = "Godly Sprinkler",
		["AcceptAllTypes"] = false
	}
}
v487[2] = v489
v486.Inputs = v487
local v490 = {}
local v491 = {
	["ItemType"] = "Gear",
	["ItemData"] = {
		["ItemName"] = "Fairy Caller",
		["Quantity"] = 2
	}
}
v490[1] = v491
v486.Outputs = v490
v486.TimeToCraft = 480
v486.PurchaseID = 3395556013
v486.RobuxPrice = 209
v486.LayoutOrder = 40
v486.MachineTypes = { "FairyGeniusEventWorkbench" }
v486.Cost = {
	["CurrencyType"] = "Sheckles",
	["Amount"] = 2500000
}
v2["Fairy Caller"] = v486
local v492 = {}
local v493 = {}
local v494 = {
	["ItemType"] = "Fairy Jar",
	["ItemData"] = {
		["ItemName"] = "Fairy Jar",
		["AcceptAllTypes"] = false
	}
}
v493[1] = v494
local v495 = {
	["ItemType"] = "Fairy Caller",
	["ItemData"] = {
		["ItemName"] = "Fairy Caller",
		["AcceptAllTypes"] = false
	}
}
v493[2] = v495
v492.Inputs = v493
local v496 = {}
local v497 = {
	["ItemType"] = "Gear",
	["ItemData"] = {
		["ItemName"] = "Fairy Power Extender",
		["Quantity"] = 1
	}
}
v496[1] = v497
v492.Outputs = v496
v492.TimeToCraft = 600
v492.PurchaseID = 3395556012
v492.RobuxPrice = 299
v492.LayoutOrder = 50
v492.MachineTypes = { "FairyGeniusEventWorkbench" }
v492.Cost = {
	["CurrencyType"] = "Sheckles",
	["Amount"] = 5000000
}
v2["Fairy Power Extender"] = v492
local v498 = {}
local v499 = {}
local v500 = {
	["ItemType"] = "Fairy Jar",
	["ItemData"] = {
		["ItemName"] = "Fairy Jar",
		["AcceptAllTypes"] = false
	}
}
v499[1] = v500
local v501 = {
	["ItemType"] = "Fairy Jar",
	["ItemData"] = {
		["ItemName"] = "Fairy Jar",
		["AcceptAllTypes"] = false
	}
}
v499[2] = v501
local v502 = {
	["ItemType"] = "Fairy Power Extender",
	["ItemData"] = {
		["ItemName"] = "Fairy Power Extender",
		["AcceptAllTypes"] = false
	}
}
v499[3] = v502
v498.Inputs = v499
local v503 = {}
local v504 = {
	["ItemType"] = "Gear",
	["ItemData"] = {
		["ItemName"] = "Luminous Wand",
		["Quantity"] = 1
	}
}
v503[1] = v504
v498.Outputs = v503
v498.TimeToCraft = 900
v498.PurchaseID = 3395556016
v498.RobuxPrice = 219
v498.LayoutOrder = 60
v498.MachineTypes = { "FairyGeniusEventWorkbench" }
v498.Cost = {
	["CurrencyType"] = "Sheckles",
	["Amount"] = 10000000
}
v2["Luminous Wand"] = v498
local v505 = {}
local v506 = {}
local v507 = {
	["ItemType"] = "Fairy Jar",
	["ItemData"] = {
		["ItemName"] = "Fairy Jar",
		["AcceptAllTypes"] = false
	}
}
v506[1] = v507
local v508 = {
	["ItemType"] = "Fairy Net",
	["ItemData"] = {
		["ItemName"] = "Fairy Net",
		["AcceptAllTypes"] = false
	}
}
v506[2] = v508
local v509 = {
	["ItemType"] = "Fairy Power Extender",
	["ItemData"] = {
		["ItemName"] = "Fairy Power Extender",
		["AcceptAllTypes"] = false
	}
}
v506[3] = v509
v505.Inputs = v506
local v510 = {}
local v511 = {
	["ItemType"] = "Gear",
	["ItemData"] = {
		["ItemName"] = "Fairy Summoner",
		["Quantity"] = 1
	}
}
v510[1] = v511
v505.Outputs = v510
v505.TimeToCraft = 3600
v505.PurchaseID = 3395556009
v505.RobuxPrice = 399
v505.LayoutOrder = 80
v505.MachineTypes = { "FairyGeniusEventWorkbench" }
v505.Cost = {
	["CurrencyType"] = "Sheckles",
	["Amount"] = 15000000
}
v2["Fairy Summoner"] = v505
local v512 = {}
local v513 = {}
local v514 = {
	["ItemType"] = "Holdable",
	["ItemData"] = {
		["ItemName"] = "Sunbulb",
		["AcceptAllTypes"] = false
	}
}
v513[1] = v514
local v515 = {
	["ItemType"] = "Seed Pack",
	["ItemData"] = {
		["ItemName"] = "Enchanted Seed Pack",
		["AcceptAllTypes"] = false
	}
}
v513[2] = v515
local v516 = {
	["ItemType"] = "PetEgg",
	["ItemData"] = {
		["ItemName"] = "Enchanted Egg",
		["AcceptAllTypes"] = false
	}
}
v513[3] = v516
v512.Inputs = v513
local v517 = {}
local v518 = {
	["ItemType"] = "Seed Pack",
	["ItemData"] = {
		["ItemName"] = "Enchanted Chest",
		["Quantity"] = 1
	}
}
v517[1] = v518
v512.Outputs = v517
v512.TimeToCraft = 1800
v512.PurchaseID = 3394265025
v512.RobuxPrice = 199
v512.LayoutOrder = 10
v512.MachineTypes = { "FairyWorldCraftingWorkBench" }
v512.Cost = {
	["CurrencyType"] = "FairyPoints",
	["Amount"] = 6000
}
v2["Enchanted Chest"] = v512
local v519 = {}
local v520 = {}
local v521 = {
	["ItemType"] = "Seed",
	["ItemData"] = {
		["ItemName"] = "Mushroom",
		["AcceptAllTypes"] = false
	}
}
v520[1] = v521
local v522 = {
	["ItemType"] = "Seed",
	["ItemData"] = {
		["ItemName"] = "Mushroom",
		["AcceptAllTypes"] = false
	}
}
v520[2] = v522
v519.Inputs = v520
local v523 = {}
local v524 = {
	["ItemType"] = "Seed Pack",
	["ItemData"] = {
		["ItemName"] = "Enchanted Seed Pack",
		["Quantity"] = 1
	}
}
v523[1] = v524
v519.Outputs = v523
v519.TimeToCraft = 300
v519.PurchaseID = 3394271793
v519.RobuxPrice = 99
v519.LayoutOrder = 20
v519.MachineTypes = { "FairyWorldCraftingWorkBench" }
v519.Cost = {
	["CurrencyType"] = "FairyPoints",
	["Amount"] = 1500
}
v2["Enchanted Seed Pack"] = v519
local v525 = {}
local v526 = {}
local v527 = {
	["ItemType"] = "Holdable",
	["ItemData"] = {
		["ItemName"] = "Glowthorn",
		["AcceptAllTypes"] = false
	}
}
v526[1] = v527
local v528 = {
	["ItemType"] = "Seed Pack",
	["ItemData"] = {
		["ItemName"] = "Enchanted Seed Pack",
		["AcceptAllTypes"] = false
	}
}
v526[2] = v528
v525.Inputs = v526
local v529 = {}
local v530 = {
	["ItemType"] = "PetEgg",
	["ItemData"] = {
		["ItemName"] = "Enchanted Egg",
		["Quantity"] = 1
	}
}
v529[1] = v530
v525.Outputs = v529
v525.TimeToCraft = 600
v525.PurchaseID = 3394272325
v525.RobuxPrice = 129
v525.LayoutOrder = 30
v525.MachineTypes = { "FairyWorldCraftingWorkBench" }
v525.Cost = {
	["CurrencyType"] = "FairyPoints",
	["Amount"] = 3000
}
v2["Enchanted Egg"] = v525
local v531 = {}
local v532 = {}
local v533 = {
	["ItemType"] = "Seed Pack",
	["ItemData"] = {
		["ItemName"] = "Enchanted Seed Pack",
		["AcceptAllTypes"] = false
	}
}
v532[1] = v533
v531.Inputs = v532
local v534 = {}
local v535 = {
	["ItemType"] = "CosmeticCrate",
	["ItemData"] = {
		["ItemName"] = "Enchanted Crate",
		["Quantity"] = 1
	}
}
v534[1] = v535
v531.Outputs = v534
v531.TimeToCraft = 300
v531.PurchaseID = 3394272617
v531.RobuxPrice = 179
v531.LayoutOrder = 40
v531.MachineTypes = { "FairyWorldCraftingWorkBench" }
v531.Cost = {
	["CurrencyType"] = "FairyPoints",
	["Amount"] = 1000
}
v2["Enchanted Crate"] = v531
local v536 = {}
local v537 = {}
local v538 = {
	["ItemType"] = "CosmeticCrate",
	["ItemData"] = {
		["ItemName"] = "Enchanted Crate",
		["AcceptAllTypes"] = false
	}
}
v537[1] = v538
v536.Inputs = v537
local v539 = {}
local v540 = {
	["ItemType"] = "CosmeticCrate",
	["ItemData"] = {
		["ItemName"] = "Glimmering Crate",
		["Quantity"] = 1
	}
}
v539[1] = v540
v536.Outputs = v539
v536.TimeToCraft = 300
v536.PurchaseID = 3394269769
v536.RobuxPrice = 179
v536.LayoutOrder = 50
v536.MachineTypes = { "FairyWorldCraftingWorkBench" }
v536.Cost = {
	["CurrencyType"] = "FairyPoints",
	["Amount"] = 1000
}
v2["Glimmering Crate"] = v536
local v541 = {}
local v542 = {}
local v543 = {
	["ItemType"] = "PetEgg",
	["ItemData"] = {
		["ItemName"] = "Common Egg",
		["AcceptAllTypes"] = false
	}
}
v542[1] = v543
local v544 = {
	["ItemType"] = "Common Coal",
	["ItemData"] = {
		["ItemName"] = "Common Coal",
		["AcceptAllTypes"] = false
	}
}
v542[2] = v544
local v545 = {
	["ItemType"] = "Common Coal",
	["ItemData"] = {
		["ItemName"] = "Common Coal",
		["AcceptAllTypes"] = false
	}
}
v542[3] = v545
local v546 = {
	["ItemType"] = "Rare Coal",
	["ItemData"] = {
		["ItemName"] = "Rare Coal",
		["AcceptAllTypes"] = false
	}
}
v542[4] = v546
v541.Inputs = v542
local v547 = {}
local v548 = {
	["ItemType"] = "PetEgg",
	["ItemData"] = {
		["ItemName"] = "Gem Egg",
		["Quantity"] = 1
	}
}
v547[1] = v548
v541.Outputs = v547
v541.TimeToCraft = 600
v541.PurchaseID = 3455269673
v541.RobuxPrice = 209
v541.LayoutOrder = 100
v541.MachineTypes = { "SmithingEventPetWorkbench" }
v541.Cost = {
	["CurrencyType"] = "Sheckles",
	["Amount"] = 1000000
}
v2["Gem Egg"] = v541
local v549 = {}
local v550 = {}
local v551 = {
	["ItemType"] = "Pet",
	["ItemData"] = {
		["ItemName"] = "Dog",
		["AcceptAllTypes"] = false
	}
}
v550[1] = v551
local v552 = {
	["ItemType"] = "Rare Coal",
	["ItemData"] = {
		["ItemName"] = "Rare Coal",
		["AcceptAllTypes"] = false
	}
}
v550[2] = v552
local v553 = {
	["ItemType"] = "Rare Coal",
	["ItemData"] = {
		["ItemName"] = "Rare Coal",
		["AcceptAllTypes"] = false
	}
}
v550[3] = v553
v549.Inputs = v550
local v554 = {}
local v555 = {
	["ItemType"] = "Pet",
	["ItemData"] = {
		["ItemName"] = "Smithing Dog",
		["Quantity"] = 1
	}
}
v554[1] = v555
v549.Outputs = v554
v549.TimeToCraft = 1200
v549.PurchaseID = 3455274572
v549.RobuxPrice = 229
v549.LayoutOrder = 200
v549.MachineTypes = { "SmithingEventPetWorkbench" }
v549.Cost = {
	["CurrencyType"] = "Sheckles",
	["Amount"] = 3000000
}
v2["Smithing Dog"] = v549
local v556 = {}
local v557 = {}
local v558 = {
	["ItemType"] = "Pet",
	["ItemData"] = {
		["ItemName"] = "Orange Tabby",
		["AcceptAllTypes"] = false
	}
}
v557[1] = v558
local v559 = {
	["ItemType"] = "Legendary Coal",
	["ItemData"] = {
		["ItemName"] = "Legendary Coal",
		["AcceptAllTypes"] = false
	}
}
v557[2] = v559
local v560 = {
	["ItemType"] = "Legendary Coal",
	["ItemData"] = {
		["ItemName"] = "Legendary Coal",
		["AcceptAllTypes"] = false
	}
}
v557[3] = v560
v556.Inputs = v557
local v561 = {}
local v562 = {
	["ItemType"] = "Pet",
	["ItemData"] = {
		["ItemName"] = "Cheetah",
		["Quantity"] = 1
	}
}
v561[1] = v562
v556.Outputs = v561
v556.TimeToCraft = 2400
v556.PurchaseID = 3455274866
v556.RobuxPrice = 549
v556.LayoutOrder = 300
v556.MachineTypes = { "SmithingEventPetWorkbench" }
v556.Cost = {
	["CurrencyType"] = "Sheckles",
	["Amount"] = 8500000
}
v2.Cheetah = v556
local v563 = {}
local v564 = {}
local v565 = {
	["ItemType"] = "Common Coal",
	["ItemData"] = {
		["ItemName"] = "Common Coal",
		["AcceptAllTypes"] = false
	}
}
v564[1] = v565
local v566 = {
	["ItemType"] = "Common Coal",
	["ItemData"] = {
		["ItemName"] = "Common Coal",
		["AcceptAllTypes"] = false
	}
}
v564[2] = v566
local v567 = {
	["ItemType"] = "Common Coal",
	["ItemData"] = {
		["ItemName"] = "Common Coal",
		["AcceptAllTypes"] = false
	}
}
v564[3] = v567
v563.Inputs = v564
local v568 = {}
local v569 = {
	["ItemType"] = "Cosmetic",
	["ItemData"] = {
		["ItemName"] = "Anvil",
		["Quantity"] = 1
	}
}
v568[1] = v569
v563.Outputs = v568
v563.TimeToCraft = 900
v563.PurchaseID = 3455270076
v563.RobuxPrice = 119
v563.LayoutOrder = 100
v563.MachineTypes = { "SmithingEventCosmeticWorkbench" }
v563.Cost = {
	["CurrencyType"] = "Sheckles",
	["Amount"] = 1500000
}
v2.Anvil = v563
local v570 = {}
local v571 = {}
local v572 = {
	["ItemType"] = "Common Coal",
	["ItemData"] = {
		["ItemName"] = "Common Coal",
		["AcceptAllTypes"] = false
	}
}
v571[1] = v572
local v573 = {
	["ItemType"] = "Rare Coal",
	["ItemData"] = {
		["ItemName"] = "Rare Coal",
		["AcceptAllTypes"] = false
	}
}
v571[2] = v573
local v574 = {
	["ItemType"] = "Legendary Coal",
	["ItemData"] = {
		["ItemName"] = "Legendary Coal",
		["AcceptAllTypes"] = false
	}
}
v571[3] = v574
local v575 = {
	["ItemType"] = "Seed",
	["ItemData"] = {
		["ItemName"] = "Coconut",
		["AcceptAllTypes"] = false
	}
}
v571[4] = v575
v570.Inputs = v571
local v576 = {}
local v577 = {
	["ItemType"] = "Cosmetic",
	["ItemData"] = {
		["ItemName"] = "Coal Box",
		["Quantity"] = 1
	}
}
v576[1] = v577
v570.Outputs = v576
v570.TimeToCraft = 900
v570.PurchaseID = 3455270320
v570.RobuxPrice = 119
v570.LayoutOrder = 200
v570.MachineTypes = { "SmithingEventCosmeticWorkbench" }
v570.Cost = {
	["CurrencyType"] = "Sheckles",
	["Amount"] = 1500000
}
v2["Coal Box"] = v570
local v578 = {}
local v579 = {}
local v580 = {
	["ItemType"] = "Common Coal",
	["ItemData"] = {
		["ItemName"] = "Common Coal",
		["AcceptAllTypes"] = false
	}
}
v579[1] = v580
local v581 = {
	["ItemType"] = "Rare Coal",
	["ItemData"] = {
		["ItemName"] = "Rare Coal",
		["AcceptAllTypes"] = false
	}
}
v579[2] = v581
local v582 = {
	["ItemType"] = "Holdable",
	["ItemData"] = {
		["ItemName"] = "Giant Pinecone",
		["AcceptAllTypes"] = false
	}
}
v579[3] = v582
v578.Inputs = v579
local v583 = {}
local v584 = {
	["ItemType"] = "Cosmetic",
	["ItemData"] = {
		["ItemName"] = "Blacksmith Grinder",
		["Quantity"] = 1
	}
}
v583[1] = v584
v578.Outputs = v583
v578.TimeToCraft = 900
v578.PurchaseID = 3455270632
v578.RobuxPrice = 189
v578.LayoutOrder = 300
v578.MachineTypes = { "SmithingEventCosmeticWorkbench" }
v578.Cost = {
	["CurrencyType"] = "Sheckles",
	["Amount"] = 6000000
}
v2["Blacksmith Grinder"] = v578
local v585 = {}
local v586 = {}
local v587 = {
	["ItemType"] = "Common Coal",
	["ItemData"] = {
		["ItemName"] = "Common Coal",
		["AcceptAllTypes"] = false
	}
}
v586[1] = v587
local v588 = {
	["ItemType"] = "Rare Coal",
	["ItemData"] = {
		["ItemName"] = "Rare Coal",
		["AcceptAllTypes"] = false
	}
}
v586[2] = v588
local v589 = {
	["ItemType"] = "Holdable",
	["ItemData"] = {
		["ItemName"] = "Olive",
		["AcceptAllTypes"] = false
	}
}
v586[3] = v589
v585.Inputs = v586
local v590 = {}
local v591 = {
	["ItemType"] = "Cosmetic",
	["ItemData"] = {
		["ItemName"] = "Tools Rack",
		["Quantity"] = 1
	}
}
v590[1] = v591
v585.Outputs = v590
v585.TimeToCraft = 900
v585.PurchaseID = 3455271054
v585.RobuxPrice = 119
v585.LayoutOrder = 180
v585.MachineTypes = { "SmithingEventCosmeticWorkbench" }
v585.Cost = {
	["CurrencyType"] = "Sheckles",
	["Amount"] = 7000000
}
v2["Tools Rack"] = v585
local v592 = {}
local v593 = {}
local v594 = {
	["ItemType"] = "Rare Coal",
	["ItemData"] = {
		["ItemName"] = "Rare Coal",
		["AcceptAllTypes"] = false
	}
}
v593[1] = v594
local v595 = {
	["ItemType"] = "Favorite Tool",
	["ItemData"] = {
		["ItemName"] = "Favorite Tool",
		["AcceptAllTypes"] = false
	}
}
v593[2] = v595
local v596 = {
	["ItemType"] = "Holdable",
	["ItemData"] = {
		["ItemName"] = "Apple",
		["AcceptAllTypes"] = false
	}
}
v593[3] = v596
v592.Inputs = v593
local v597 = {}
local v598 = {
	["ItemType"] = "Cosmetic",
	["ItemData"] = {
		["ItemName"] = "Shield Statue",
		["Quantity"] = 1
	}
}
v597[1] = v598
v592.Outputs = v597
v592.TimeToCraft = 900
v592.PurchaseID = 3455271420
v592.RobuxPrice = 239
v592.LayoutOrder = 400
v592.MachineTypes = { "SmithingEventCosmeticWorkbench" }
v592.Cost = {
	["CurrencyType"] = "Sheckles",
	["Amount"] = 10500000
}
v2["Shield Statue"] = v592
local v599 = {}
local v600 = {}
local v601 = {
	["ItemType"] = "Smith Hammer of Harvest",
	["ItemData"] = {
		["ItemName"] = "Smith Hammer of Harvest"
	}
}
v600[1] = v601
local v602 = {
	["ItemType"] = "Holdable",
	["ItemData"] = {
		["ItemName"] = "Hollow Bamboo",
		["AcceptAllTypes"] = false
	}
}
v600[2] = v602
local v603 = {
	["ItemType"] = "Legendary Coal",
	["ItemData"] = {
		["ItemName"] = "Legendary Coal",
		["AcceptAllTypes"] = false
	}
}
v600[3] = v603
local v604 = {
	["ItemType"] = "Divine Coal",
	["ItemData"] = {
		["ItemName"] = "Divine Coal",
		["AcceptAllTypes"] = false
	}
}
v600[4] = v604
v599.Inputs = v600
local v605 = {}
local v606 = {
	["ItemType"] = "Cosmetic",
	["ItemData"] = {
		["ItemName"] = "Horse Shoe Magnet",
		["Quantity"] = 1
	}
}
v605[1] = v606
v599.Outputs = v605
v599.TimeToCraft = 7200
v599.PurchaseID = 3455271745
v599.RobuxPrice = 537
v599.LayoutOrder = 500
v599.MachineTypes = { "SmithingEventCosmeticWorkbench" }
v599.Cost = {
	["CurrencyType"] = "Sheckles",
	["Amount"] = 15000000
}
v2["Horse Shoe Magnet"] = v599
local v607 = {}
local v608 = {}
local v609 = {
	["ItemType"] = "Common Coal",
	["ItemData"] = {
		["ItemName"] = "Common Coal",
		["AcceptAllTypes"] = false
	}
}
v608[1] = v609
local v610 = {
	["ItemType"] = "Rare Coal",
	["ItemData"] = {
		["ItemName"] = "Rare Coal",
		["AcceptAllTypes"] = false
	}
}
v608[2] = v610
local v611 = {
	["ItemType"] = "PetBoost",
	["ItemData"] = {
		["ItemName"] = "Small Treat",
		["AcceptAllTypes"] = false
	}
}
v608[3] = v611
local v612 = {
	["ItemType"] = "PetBoost",
	["ItemData"] = {
		["ItemName"] = "Small Treat",
		["AcceptAllTypes"] = false
	}
}
v608[4] = v612
v607.Inputs = v608
local v613 = {}
local v614 = {
	["ItemType"] = "Gear",
	["ItemData"] = {
		["ItemName"] = "Smith Treat",
		["Quantity"] = 1
	}
}
v613[1] = v614
v607.Outputs = v613
v607.TimeToCraft = 600
v607.PurchaseID = 3455273350
v607.RobuxPrice = 229
v607.LayoutOrder = 205
v607.MachineTypes = { "SmithingEventGearWorkbench" }
v607.Cost = {
	["CurrencyType"] = "Sheckles",
	["Amount"] = 4000000
}
v2["Smith Treat"] = v607
local v615 = {}
local v616 = {}
local v617 = {
	["ItemType"] = "Harvest Tool",
	["ItemData"] = {
		["ItemName"] = "Harvest Tool",
		["AcceptAllTypes"] = false
	}
}
v616[1] = v617
local v618 = {
	["ItemType"] = "Rare Coal",
	["ItemData"] = {
		["ItemName"] = "Rare Coal",
		["AcceptAllTypes"] = false
	}
}
v616[2] = v618
local v619 = {
	["ItemType"] = "Rare Coal",
	["ItemData"] = {
		["ItemName"] = "Rare Coal",
		["AcceptAllTypes"] = false
	}
}
v616[3] = v619
local v620 = {
	["ItemType"] = "Rare Coal",
	["ItemData"] = {
		["ItemName"] = "Rare Coal",
		["AcceptAllTypes"] = false
	}
}
v616[4] = v620
v615.Inputs = v616
local v621 = {}
local v622 = {
	["ItemType"] = "Gear",
	["ItemData"] = {
		["ItemName"] = "Smith Hammer of Harvest",
		["Quantity"] = 1
	}
}
v621[1] = v622
v615.Outputs = v621
v615.TimeToCraft = 1800
v615.PurchaseID = 3455273154
v615.RobuxPrice = 149
v615.LayoutOrder = 220
v615.MachineTypes = { "SmithingEventGearWorkbench" }
v615.Cost = {
	["CurrencyType"] = "Sheckles",
	["Amount"] = 6000000
}
v2["Smith Hammer of Harvest"] = v615
local v623 = {}
local v624 = {}
local v625 = {
	["ItemType"] = "PetEgg",
	["ItemData"] = {
		["ItemName"] = "Gem Egg",
		["AcceptAllTypes"] = false
	}
}
v624[1] = v625
local v626 = {
	["ItemType"] = "Legendary Coal",
	["ItemData"] = {
		["ItemName"] = "Legendary Coal",
		["AcceptAllTypes"] = false
	}
}
v624[2] = v626
local v627 = {
	["ItemType"] = "PetShard",
	["ItemData"] = {
		["ItemName"] = "Cleansing Pet Shard",
		["AcceptAllTypes"] = false
	}
}
v624[3] = v627
v623.Inputs = v624
local v628 = {}
local v629 = {
	["ItemType"] = "Gear",
	["ItemData"] = {
		["ItemName"] = "Pet Shard Forger",
		["Quantity"] = 1
	}
}
v628[1] = v629
v623.Outputs = v628
v623.TimeToCraft = 3600
v623.PurchaseID = 3455275888
v623.RobuxPrice = 499
v623.LayoutOrder = 210
v623.MachineTypes = { "SmithingEventGearWorkbench" }
v623.Cost = {
	["CurrencyType"] = "Sheckles",
	["Amount"] = 15000000
}
v2["Pet Shard Forger"] = v623
local v630 = {}
local v631 = {}
local v632 = {
	["ItemType"] = "Smith Hammer of Harvest",
	["ItemData"] = {
		["ItemName"] = "Smith Hammer of Harvest"
	}
}
v631[1] = v632
local v633 = {
	["ItemType"] = "Legendary Coal",
	["ItemData"] = {
		["ItemName"] = "Legendary Coal",
		["AcceptAllTypes"] = false
	}
}
v631[2] = v633
local v634 = {
	["ItemType"] = "Divine Coal",
	["ItemData"] = {
		["ItemName"] = "Divine Coal",
		["AcceptAllTypes"] = false
	}
}
v631[3] = v634
local v635 = {
	["ItemType"] = "Lightning Rod",
	["ItemData"] = {
		["ItemName"] = "Lightning Rod",
		["AcceptAllTypes"] = false
	}
}
v631[4] = v635
v630.Inputs = v631
local v636 = {}
local v637 = {
	["ItemType"] = "Gear",
	["ItemData"] = {
		["ItemName"] = "Thundelbringer",
		["Quantity"] = 1
	}
}
v636[1] = v637
v630.Outputs = v636
v630.TimeToCraft = 4500
v630.PurchaseID = 3455277251
v630.RobuxPrice = 489
v630.LayoutOrder = 500
v630.MachineTypes = { "SmithingEventGearWorkbench" }
v630.Cost = {
	["CurrencyType"] = "Sheckles",
	["Amount"] = 40000000
}
v2.Thundelbringer = v630
local v638 = {}
local v639 = {}
local v640 = {
	["ItemType"] = "Common Coal",
	["ItemData"] = {
		["ItemName"] = "Common Coal",
		["AcceptAllTypes"] = false
	}
}
v639[1] = v640
local v641 = {
	["ItemType"] = "Common Coal",
	["ItemData"] = {
		["ItemName"] = "Common Coal",
		["AcceptAllTypes"] = false
	}
}
v639[2] = v641
local v642 = {
	["ItemType"] = "Holdable",
	["ItemData"] = {
		["ItemName"] = "Grape",
		["AcceptAllTypes"] = false
	}
}
v639[3] = v642
local v643 = {
	["ItemType"] = "Seed",
	["ItemData"] = {
		["ItemName"] = "Tomato",
		["AcceptAllTypes"] = false
	}
}
v639[4] = v643
v638.Inputs = v639
local v644 = {}
local v645 = {
	["ItemType"] = "Seed",
	["ItemData"] = {
		["ItemName"] = "Olive",
		["Quantity"] = 1
	}
}
v644[1] = v645
v638.Outputs = v644
v638.TimeToCraft = 900
v638.PurchaseID = 0
v638.RobuxPrice = 129
v638.LayoutOrder = 100
v638.MachineTypes = { "SmithingEventSeedWorkbench" }
v638.Cost = {
	["CurrencyType"] = "Sheckles",
	["Amount"] = 500000
}
v2.Olive = v638
local v646 = {}
local v647 = {}
local v648 = {
	["ItemType"] = "Rare Coal",
	["ItemData"] = {
		["ItemName"] = "Rare Coal",
		["AcceptAllTypes"] = false
	}
}
v647[1] = v648
local v649 = {
	["ItemType"] = "Legendary Coal",
	["ItemData"] = {
		["ItemName"] = "Legendary Coal",
		["AcceptAllTypes"] = false
	}
}
v647[2] = v649
local v650 = {
	["ItemType"] = "Holdable",
	["ItemData"] = {
		["ItemName"] = "Bamboo",
		["AcceptAllTypes"] = false
	}
}
v647[3] = v650
local v651 = {
	["ItemType"] = "Seed",
	["ItemData"] = {
		["ItemName"] = "Cactus",
		["AcceptAllTypes"] = false
	}
}
v647[4] = v651
v646.Inputs = v647
local v652 = {}
local v653 = {
	["ItemType"] = "Seed",
	["ItemData"] = {
		["ItemName"] = "Hollow Bamboo",
		["Quantity"] = 1
	}
}
v652[1] = v653
v646.Outputs = v652
v646.TimeToCraft = 2700
v646.PurchaseID = 0
v646.RobuxPrice = 507
v646.LayoutOrder = 200
v646.MachineTypes = { "SmithingEventSeedWorkbench" }
v646.Cost = {
	["CurrencyType"] = "Sheckles",
	["Amount"] = 1500000
}
v2["Hollow Bamboo"] = v646
local v654 = {}
local v655 = {}
local v656 = {
	["ItemType"] = "Divine Coal",
	["ItemData"] = {
		["ItemName"] = "Divine Coal",
		["AcceptAllTypes"] = false
	}
}
v655[1] = v656
local v657 = {
	["ItemType"] = "Divine Coal",
	["ItemData"] = {
		["ItemName"] = "Divine Coal",
		["AcceptAllTypes"] = false
	}
}
v655[2] = v657
local v658 = {
	["ItemType"] = "Holdable",
	["ItemData"] = {
		["ItemName"] = "Burning Bud",
		["AcceptAllTypes"] = false
	}
}
v655[3] = v658
local v659 = {
	["ItemType"] = "Seed",
	["ItemData"] = {
		["ItemName"] = "Daffodil",
		["AcceptAllTypes"] = false
	}
}
v655[4] = v659
v654.Inputs = v655
local v660 = {}
local v661 = {
	["ItemType"] = "Seed",
	["ItemData"] = {
		["ItemName"] = "Yarrow",
		["Quantity"] = 1
	}
}
v660[1] = v661
v654.Outputs = v660
v654.TimeToCraft = 3600
v654.PurchaseID = 0
v654.RobuxPrice = 729
v654.LayoutOrder = 300
v654.MachineTypes = { "SmithingEventSeedWorkbench" }
v654.Cost = {
	["CurrencyType"] = "Sheckles",
	["Amount"] = 10000000
}
v2.Yarrow = v654
local v662 = {}
for v663, v664 in v2 do
	for _, v665 in v664.MachineTypes do
		local v666 = v662[v665]
		if not v666 then
			v666 = {}
			v662[v665] = v666
		end
		v666[v663] = v664
	end
end
return {
	["ItemRecipes"] = v2,
	["RecipiesSortedByMachineType"] = v662
}