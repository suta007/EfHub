local Main = {}

local reg
local sData
local Utils
local fVar

function Main.Initialize(registry)
	reg = registry
	sData = reg.sData
	Utils = reg.Utils
	fVar = reg.fVar
end

function Main.AutoPlant()
	local Options = reg.Options
	if not Options.tgPlantsEnable.Value or fVar.isPlanting then
		return
	end
	fVar.isPlanting = true
	local tSeed = Utils.GetSelectedItems(Options.ddPlantsSeeds.Value)
	local Backpack = sData.LocalPlayer.Backpack

	for _, item in pairs(Backpack:GetChildren()) do
		local SeedName = item:GetAttribute("Seed")
		if SeedName and (table.find(tSeed, "ALL") or table.find(tSeed, SeedName)) then
			local Quantity = item:GetAttribute("Quantity")
			for i = 1, Quantity do
				Utils.UnequipTool()
				task.wait(0.1)
				Utils.EquipTool(item)
				task.wait(0.1)
				local PlantsPos
				if Options.ddPlantsPos.Value == "Player" then
					PlantsPos = Utils.GetPosition()
				else
					PlantsPos = Utils.GetRandomPlotPos().Position
				end
				local args = { vector.create(PlantsPos.X, PlantsPos.Y, PlantsPos.Z), SeedName }
				sData.GameEvents:WaitForChild("Plant_RE"):FireServer(unpack(args))
			end
		end
	end
	fVar.isPlanting = false
end

return Main
