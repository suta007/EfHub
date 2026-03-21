local v1 = game:GetService("ReplicatedStorage")
require(game.ReplicatedStorage.Data.GearData)
require(v1.Data.SeedData)
local v2 = game.Players.LocalPlayer
game:GetService("CollectionService")
local v_u_3 = require(game.ReplicatedStorage.Modules.FruitCollectionController)
v2.PlayerGui:WaitForChild("ReplicatedAssets").ChildAdded:Connect(function(p4)
	-- upvalues: (copy) v_u_3
	if p4:IsA("Model") and p4:GetAttribute("FruitDebris") then
		v_u_3:StartCollection(p4)
	end
end)