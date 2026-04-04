local fVar = {}

fVar.IsPlanting = false
fVar.IsAgeBreaking = false
fVar.IsHarvesting = false
fVar.IsSelling = false
fVar.IsFruitHidden = false
fVar.IsPlantHidden = false
fVar.IsRemovingPlants = false
fVar.IsRemovingCrops = false
fVar.IsTroweling = false
fVar.IsReclaiming = false
fVar.IsSprinkling = false
fVar.IsCatLeading = false
fVar.IsFarmingLevel = false
--fVar.IsOpeningPack = false
fVar.IsMutating = false
fVar.IsFeeding = false

fVar.UIShopLoaded = false

fVar.CheckLevelConnection = nil
fVar.CheckLevelConnection2 = nil

fVar.Pos = {
	Trowel = nil,
	Sprinkler = nil,
}

return fVar
