local v1 = require(game.ReplicatedStorage.Data.TradeWorldData)
return game.PlaceId == v1.PlaceId and true or v1.ForceInWorld == true