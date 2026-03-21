local v1 = game:GetService("ReplicatedStorage")
local v_u_2 = require(v1.Data.GearData)
return {
	["IsItemTypeGear"] = function(p3)
		-- upvalues: (copy) v_u_2
		return p3 == "Gear" and true or ((p3 == "Sprinkler" or (p3 == "Favorite Tool" or (p3 == "FriendshipPot" or (p3 == "Harvest Tool" or (p3 == "Lightning Rod" or (p3 == "Nectar Staff" or (p3 == "Night Staff" or (p3 == "Pollen Radar" or (p3 == "Recall Wrench" or (p3 == "Event Lantern" or (p3 == "Pet Pouch" or (p3 == "SprayBottle" or (p3 == "MutationSpray" or (p3 == "Star Caller" or (p3 == "Trowel" or (p3 == "Watering Can" or (p3 == "Tranquil Radar" or (p3 == "Glimmering Radar" or (p3 == "Corrupt Radar" or (p3 == "Fertilizer" or (p3 == "PetBoost" or (p3 == "PetShard" or (p3 == "Fairy Summoner" or (p3 == "Fairy Caller" or (p3 == "Luminous Wand" or (p3 == "Fairy Net" or p3 == "Fairy Jar")))))))))))))))))))))))))) and true or v_u_2[p3] ~= nil)
	end
}