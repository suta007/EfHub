local Main = {}

local reg
local sData
local Utils

function Main.Initialize(registry)
	reg = registry
	sData = reg.sData
	Utils = reg.Utils
end

function Main.AutoPlant()
	local Options = reg.Options
	local pos = nil
	if Options.ddPlantsPos.Value == "Player" then
		pos = Utils.GetPosition()
	end
	local tPlant = Utils.GetSelectedItems(Options.ddPlantsSeeds.Value)
	local tSeed = tPlant .. " Seed"
	sData.ActivePetsService:heldItemName(tSeed)
	if pos then
		local args = { vector.create(pos.X, pos.Y, pos.Z), tPlant }
		sData.GameEvents:WaitForChild("Plant_RE"):FireServer(unpack(args))
	end
end

return Main
