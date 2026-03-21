local v_u_1 = {
	["Dinosaur"] = {
		"Raptor",
		"Triceratops",
		"Stegosaurus",
		"Pterodactyl",
		"Brontosaurus",
		"T-Rex",
		"Iguanodon",
		"Parasaurolophus",
		"Pachycephalosaurus",
		"Dilophosaurus",
		"Ankylosaurus",
		"Spinosaurus"
	},
	["Food"] = {
		"Bagel Bunny",
		"Pancake Mole",
		"Sushi Bear",
		"Spaghetti Sloth",
		"French Fry Ferret",
		"Mochi Mouse",
		"Bacon Pig",
		"Hotdog Daschund",
		"Lobster Thermidor",
		"Sunny-Side Chicken",
		"Gorilla Chef"
	},
	["Fall"] = {
		"Robin",
		"Badger",
		"Grizzly Bear",
		"Swan",
		"Barn Owl",
		"GIANT Robin",
		"GIANT Badger",
		"GIANT Grizzly Bear",
		"GIANT Swan",
		"GIANT Barn Owl",
		"Red Squirrel",
		"Chipmunk",
		"Marmot",
		"Sugar Glider",
		"Space Squirrel",
		"Salmon",
		"Woodpecker",
		"Mallard",
		"Red Panda"
	},
	["Halloween"] = {
		"Bat",
		"Bone Dog",
		"Spider",
		"Black Cat",
		"Headless Horseman",
		"Ghostly Bat",
		"Ghostly Bone Dog",
		"Ghostly Spider",
		"Ghostly Black Cat",
		"Ghostly Headless Horseman",
		"Pumpkin Rat",
		"Wolf",
		"Ghost Bear",
		"Reaper",
		"Crow",
		"Goat",
		"Goblin",
		"Dark Spriggan",
		"Hex Serpent",
		"Ghostly Dark Spriggan",
		"Scarab",
		"Tomb Marmot",
		"Mummy",
		"Ghostly Scarab",
		"Ghostly Tomb Marmot",
		"Ghostly Mummy",
		"Specter",
		"Lich"
	},
	["Beetle"] = { "Stag Beetle", "Rainbow Stag Beetle", "Amethyst Beetle" },
	["Safari"] = {
		"Oxpecker",
		"Zebra",
		"Giraffe",
		"Rhino",
		"Elephant",
		"Rainbow Oxpecker",
		"Rainbow Zebra",
		"Rainbow Giraffe",
		"Rainbow Rhino",
		"Rainbow Elephant",
		"Gecko",
		"Hyena",
		"Cape Buffalo",
		"Hippo",
		"Crocodile",
		"Lion",
		"Cheetah"
	},
	["Christmas"] = {
		"Snowman Soldier",
		"Snowman Builder",
		"Arctic Fox",
		"Frost Dragon",
		"GIANT Snowman Soldier",
		"GIANT Snowman Builder",
		"Rainbow Arctic Fox",
		"Rainbow Frost Dragon",
		"Gift Rat",
		"Penguin",
		"Snow Bunny",
		"French Hen",
		"Christmas Gorilla",
		"Mistletoad",
		"Krampus",
		"Rainbow Snow Bunny",
		"Rainbow French Hen",
		"Rainbow Christmas Gorilla",
		"Rainbow Mistletoad",
		"Rainbow Krampus",
		"Turtle Dove",
		"Reindeer",
		"Nutcracker",
		"Yeti",
		"Ice Golem",
		"Festive Turtle Dove",
		"Festive Reindeer",
		"Festive Nutcracker",
		"Festive Yeti",
		"Festive Ice Golem",
		"Pine Beetle",
		"Cocoa Cat",
		"Eggnog Chick",
		"Red-Nosed Reindeer",
		"Partridge",
		"Santa Bear",
		"Moose",
		"Frost Squirrel",
		"Wendigo",
		"Festive Partridge",
		"Festive Santa Bear",
		"Festive Moose",
		"FestiveFrost Squirrel",
		"Festive Wendigo",
		"Summer Kiwi",
		"Christmas Spirit"
	}
}
local v_u_2 = {}
for v3, v4 in v_u_1 do
	local v5 = {}
	for _, v6 in v4 do
		v5[v6] = true
	end
	v_u_2[v3] = v5
end
function v_u_2.AddToTrait(p7, p8)
	-- upvalues: (copy) v_u_2, (copy) v_u_1
	if not p7 or p7 == "" then
		warn("PetTraitsData.HasTrait | No pet name given!")
		return false
	end
	if not p8 or p8 == "" then
		warn("PetTraitsData.HasTrait | No trait name given!")
		return false
	end
	local v9 = v_u_2[p8]
	if typeof(v9) ~= "table" then
		return false
	end
	local v10 = v_u_1[p8]
	table.insert(v10, p7)
	for v11, v12 in v_u_1 do
		if v12 == v_u_1[p8] then
			v_u_2[v11][p7] = true
		end
	end
	return true
end
function v_u_2.HasTrait(p13, p14)
	-- upvalues: (copy) v_u_2
	if p13 and p13 ~= "" then
		if p14 and p14 ~= "" then
			local v15 = v_u_2[p14]
			if typeof(v15) == "table" then
				return v15[p13] == true
			else
				return false
			end
		else
			warn("PetTraitsData.HasTrait | No trait name given!")
			return false
		end
	else
		warn("PetTraitsData.HasTrait | No pet name given!")
		return false
	end
end
return v_u_2